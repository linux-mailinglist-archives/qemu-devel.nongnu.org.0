Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA320229330
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jul 2020 10:12:57 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jy9s0-0000X3-Pg
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 04:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jy9qt-0007jV-Sk
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:11:47 -0400
Received: from relay.sw.ru ([185.231.240.75]:54952 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jy9qr-0004p6-7y
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 04:11:47 -0400
Received: from [10.94.4.71] (helo=dptest2.qa.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.93)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1jy9ql-0002yK-Uz; Wed, 22 Jul 2020 11:11:39 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v0 4/4] background snapshot: add trace events for page fault
 processing
Date: Wed, 22 Jul 2020 11:11:33 +0300
Message-Id: <20200722081133.29926-5-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200722081133.29926-1-dplotnikov@virtuozzo.com>
References: <20200722081133.29926-1-dplotnikov@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=dplotnikov@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/22 04:11:41
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_BL_SPAMCOP_NET=1.347,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: quintela@redhat.com, dgilbert@redhat.com, peterx@redhat.com,
 armbru@redhat.com, den@openvz.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 migration/ram.c        | 4 ++++
 migration/trace-events | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index f187b5b494..29712a11c2 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2172,12 +2172,16 @@ again:
             break;
         }
 
+        trace_page_fault_processing_start(msg.arg.pagefault.address);
+
         if (ram_process_page_fault(msg.arg.pagefault.address) < 0) {
             error_report("page fault: error on write protected page "
                          "processing [0x%llx]",
                          msg.arg.pagefault.address);
             break;
         }
+
+        trace_page_fault_processing_finish(msg.arg.pagefault.address);
     }
 
     return NULL;
diff --git a/migration/trace-events b/migration/trace-events
index 4ab0a503d2..f46b3b9a72 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -128,6 +128,8 @@ save_xbzrle_page_skipping(void) ""
 save_xbzrle_page_overflow(void) ""
 ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait: %" PRIu64 " milliseconds, %d iterations"
 ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRIu64
+page_fault_processing_start(unsigned long address) "HVA: 0x%lx"
+page_fault_processing_finish(unsigned long address) "HVA: 0x%lx"
 
 # migration.c
 await_return_path_close_on_source_close(void) ""
-- 
2.17.0


