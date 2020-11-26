Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698F92C5807
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 16:23:09 +0100 (CET)
Received: from localhost ([::1]:39392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiJ6y-0008Qg-Gn
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 10:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ4P-00060I-G6
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:20:31 -0500
Received: from relay.sw.ru ([185.231.240.75]:50278 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ4N-0000Iu-5c
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 10:20:29 -0500
Received: from [192.168.15.178] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kiJ3t-00AT4g-V6; Thu, 26 Nov 2020 18:19:57 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v4 6/6] introduce simple linear scan rate limiting mechanism
Date: Thu, 26 Nov 2020 18:17:34 +0300
Message-Id: <20201126151734.743849-7-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev via <qemu-devel@nongnu.org>

Since reading UFFD events and saving paged data are performed
from the same thread, write fault latencies are sensitive to
migration stream stalls. Limiting total page saving rate is a
method to reduce amount of noticiable fault resolution latencies.

Migration bandwidth limiting is achieved via noticing cases of
out-of-threshold write fault latencies and temporarily disabling
(strictly speaking, severely throttling) saving non-faulting pages.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 migration/ram.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index bcdccdaef7..d5b50b7804 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -322,6 +322,10 @@ struct RAMState {
     /* these variables are used for bitmap sync */
     /* last time we did a full bitmap_sync */
     int64_t time_last_bitmap_sync;
+    /* last time UFFD fault occured */
+    int64_t last_fault_ns;
+    /* linear scan throttling counter */
+    int throttle_skip_counter;
     /* bytes transferred at start_time */
     uint64_t bytes_xfer_prev;
     /* number of dirty pages since start_time */
@@ -1506,6 +1510,8 @@ static RAMBlock *poll_fault_page(RAMState *rs, ram_addr_t *offset)
         return NULL;
     }
 
+    rs->last_fault_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
+
     *offset = (ram_addr_t) (page_address - (hwaddr) bs->host);
     return bs;
 }
@@ -1882,6 +1888,55 @@ static void ram_save_host_page_post(RAMState *rs, PageSearchStatus *pss,
     }
 }
 
+#define FAULT_HIGH_LATENCY_NS   5000000     /* 5 ms */
+#define SLOW_FAULT_POLL_TMO     5           /* 5 ms */
+#define SLOW_FAULT_SKIP_PAGES   200
+
+/**
+ * limit_scan_rate: limit RAM linear scan rate in case of growing write fault
+ *   latencies, used in write-tracking migration implementation
+ *
+ * @rs: current RAM state
+ */
+static void limit_scan_rate(RAMState *rs)
+{
+    if (!migrate_background_snapshot()) {
+        return;
+    }
+
+#ifdef CONFIG_LINUX
+    int64_t last_fault_latency_ns = 0;
+
+    /* Check if last write fault time is available */
+    if (rs->last_fault_ns) {
+        last_fault_latency_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME) -
+                rs->last_fault_ns;
+        rs->last_fault_ns = 0;
+    }
+
+    /*
+     * In case last fault time was available and we have
+     * latency value, check if it's not too high
+     */
+    if (last_fault_latency_ns > FAULT_HIGH_LATENCY_NS) {
+        /* Reset counter after each slow write fault */
+        rs->throttle_skip_counter = SLOW_FAULT_SKIP_PAGES;
+    }
+    /*
+     * Delay thread execution till next write fault occures or timeout expires.
+     * Next SLOW_FAULT_SKIP_PAGES can be write fault pages only, not from pages going from
+     * linear scan logic. Thus we moderate migration stream rate to reduce latencies
+     */
+    if (rs->throttle_skip_counter > 0) {
+        uffd_poll_events(rs->uffdio_fd, SLOW_FAULT_POLL_TMO);
+        rs->throttle_skip_counter--;
+    }
+#else
+    /* Should never happen */
+    qemu_file_set_error(rs->f, -ENOSYS);
+#endif /* CONFIG_LINUX */
+}
+
 /**
  * ram_find_and_save_block: finds a dirty page and sends it to f
  *
@@ -1931,6 +1986,9 @@ static int ram_find_and_save_block(RAMState *rs, bool last_stage)
             ram_save_host_page_pre(rs, &pss, &opaque);
             pages = ram_save_host_page(rs, &pss, last_stage);
             ram_save_host_page_post(rs, &pss, opaque, &pages);
+
+            /* Linear scan rate limiting */
+            limit_scan_rate(rs);
         }
     } while (!pages && again);
 
@@ -2043,11 +2101,14 @@ static void ram_state_reset(RAMState *rs)
     rs->last_sent_block = NULL;
     rs->last_page = 0;
     rs->last_version = ram_list.version;
+    rs->last_fault_ns = 0;
+    rs->throttle_skip_counter = 0;
     rs->ram_bulk_stage = true;
     rs->fpo_enabled = false;
 }
 
-#define MAX_WAIT 50 /* ms, half buffered_file limit */
+#define MAX_WAIT    50      /* ms, half buffered_file limit */
+#define BG_MAX_WAIT 1000    /* 1000 ms, need bigger limit for background snapshot */
 
 /*
  * 'expected' is the value you expect the bitmap mostly to be full
@@ -2723,7 +2784,9 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
             if ((i & 63) == 0) {
                 uint64_t t1 = (qemu_clock_get_ns(QEMU_CLOCK_REALTIME) - t0) /
                               1000000;
-                if (t1 > MAX_WAIT) {
+                uint64_t max_wait = migrate_background_snapshot() ?
+                        BG_MAX_WAIT : MAX_WAIT;
+                if (t1 > max_wait) {
                     trace_ram_save_iterate_big_wait(t1, i);
                     break;
                 }
-- 
2.25.1


