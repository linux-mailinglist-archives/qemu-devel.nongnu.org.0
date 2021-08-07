Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72C63E36F9
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 21:33:05 +0200 (CEST)
Received: from localhost ([::1]:39260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCS48-0004mF-O7
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 15:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mCS3I-00047h-7s
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 15:32:12 -0400
Received: from mailout09.t-online.de ([194.25.134.84]:40696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1mCS3E-0006PQ-FX
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 15:32:12 -0400
Received: from fwd37.aul.t-online.de (fwd37.aul.t-online.de [172.20.27.137])
 by mailout09.t-online.de (Postfix) with SMTP id 1500B187CE;
 Sat,  7 Aug 2021 21:29:15 +0200 (CEST)
Received: from linpower.localnet
 (E2W+GqZf8hPqA9LdP90nDjK2+ZYb4t5dvUNDaFd7n8B7rRUPRRJh-VgQahA37+XQkh@[79.208.26.7])
 by fwd37.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mCS0M-2pe7sW0; Sat, 7 Aug 2021 21:29:10 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id 3C4312000A1; Sat,  7 Aug 2021 21:29:10 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH] monitor/hmp: schedule qemu_chr_fe_accept_input() after read
Date: Sat,  7 Aug 2021 21:29:10 +0200
Message-Id: <20210807192910.26283-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <70e3486e-b486-887b-4d57-44a3fd9766ad@t-online.de>
References: <70e3486e-b486-887b-4d57-44a3fd9766ad@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ID: E2W+GqZf8hPqA9LdP90nDjK2+ZYb4t5dvUNDaFd7n8B7rRUPRRJh-VgQahA37+XQkh
X-TOI-EXPURGATEID: 150726::1628364551-00000BB1-BEFE7109/0/0 CLEAN NORMAL
X-TOI-MSGID: 7f438107-335f-434b-977b-1db3f4e0c275
Received-SPF: none client-ip=194.25.134.84;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout09.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 584af1f1d9 (ui/gtk: add a keyboard fifo to the VTE
consoles) a GTK VTE console chardev backend relies on the
connected chardev frontend to call qemu_chr_fe_accept_input()
whenever it can receive new characters. The HMP monitor doesn't
do this. It only schedules a call to qemu_chr_fe_accept_input()
after it handled a HMP command in monitor_command_cb().

This is a problem if you paste a few characters into the GTK
monitor console. Even entering a UTF-8 multibyte character leads
to the same problem.

Schedule a call to qemu_chr_fe_accept_input() after handling the
received bytes to fix the HMP monitor.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 monitor/hmp.c              |  1 +
 monitor/monitor-internal.h |  1 +
 monitor/monitor.c          | 19 +++++++++++++++++--
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index d50c3124e1..470f56a71d 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1349,6 +1349,7 @@ static void monitor_read(void *opaque, const uint8_t *buf, int size)
         for (i = 0; i < size; i++) {
             readline_handle_byte(mon->rs, buf[i]);
         }
+        monitor_accept_input(&mon->common);
     } else {
         if (size == 0 || buf[size - 1] != 0) {
             monitor_printf(&mon->common, "corrupted command\n");
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 9c3a09cb01..af33c3c617 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -170,6 +170,7 @@ int monitor_puts(Monitor *mon, const char *str);
 void monitor_data_init(Monitor *mon, bool is_qmp, bool skip_flush,
                        bool use_io_thread);
 void monitor_data_destroy(Monitor *mon);
+void monitor_accept_input(Monitor *mon);
 int monitor_can_read(void *opaque);
 void monitor_list_append(Monitor *mon);
 void monitor_fdsets_cleanup(void);
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 46a171bca6..8e3cf4ad98 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -519,13 +519,28 @@ int monitor_suspend(Monitor *mon)
     return 0;
 }
 
-static void monitor_accept_input(void *opaque)
+static void monitor_accept_input_bh(void *opaque)
 {
     Monitor *mon = opaque;
 
     qemu_chr_fe_accept_input(&mon->chr);
 }
 
+void monitor_accept_input(Monitor *mon)
+{
+    if (!qatomic_mb_read(&mon->suspend_cnt)) {
+        AioContext *ctx;
+
+        if (mon->use_io_thread) {
+            ctx = iothread_get_aio_context(mon_iothread);
+        } else {
+            ctx = qemu_get_aio_context();
+        }
+
+        aio_bh_schedule_oneshot(ctx, monitor_accept_input_bh, mon);
+    }
+}
+
 void monitor_resume(Monitor *mon)
 {
     if (monitor_is_hmp_non_interactive(mon)) {
@@ -547,7 +562,7 @@ void monitor_resume(Monitor *mon)
             readline_show_prompt(hmp_mon->rs);
         }
 
-        aio_bh_schedule_oneshot(ctx, monitor_accept_input, mon);
+        aio_bh_schedule_oneshot(ctx, monitor_accept_input_bh, mon);
     }
 
     trace_monitor_suspend(mon, -1);
-- 
2.26.2


