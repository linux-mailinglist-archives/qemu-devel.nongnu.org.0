Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2945019B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 10:45:01 +0100 (CET)
Received: from localhost ([::1]:46454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmYXs-0002vx-6h
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 04:45:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mmYV4-0000IO-H2
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 04:42:06 -0500
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:53710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1mmYUy-0003Up-DX
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 04:42:04 -0500
Received: from iva8-d2cd82b7433e.qloud-c.yandex.net
 (iva8-d2cd82b7433e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a88e:0:640:d2cd:82b7])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 3AFC32E0462;
 Mon, 15 Nov 2021 12:41:54 +0300 (MSK)
Received: from myt6-10e59078d438.qloud-c.yandex.net
 (myt6-10e59078d438.qloud-c.yandex.net [2a02:6b8:c12:5209:0:640:10e5:9078])
 by iva8-d2cd82b7433e.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 aQLUYEobOW-frsqMZeB; Mon, 15 Nov 2021 12:41:54 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1636969314; bh=3INGRPaU4lFYUpZiso/dx30jieje2Eb1lFLzsE+acKA=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=U2T6zBJ+NGClUygHXQMloQ8VZJy17wwxMmu3AP8y5EunQK/GFjndBuFI3cjAmPuMl
 EreiUKcFEn140zM7MhnXc1fBf/8JiFhoxdFmIOIasi1+v2KudYc8citXJ4JT1vRQRx
 Q9Y2L5xV9Y3MvQxkNyQjdw5zNimKxKoZFv1EU2kw=
Authentication-Results: iva8-d2cd82b7433e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from den-plotnikov-w.yandex-team.ru (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8016::1:27])
 by myt6-10e59078d438.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 1oVbS2CALn-frw4ZtRJ; Mon, 15 Nov 2021 12:41:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] monitor: move monitor destruction to the very end of
 qemu cleanup
Date: Mon, 15 Nov 2021 12:41:42 +0300
Message-Id: <20211115094143.157399-2-den-plotnikov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115094143.157399-1-den-plotnikov@yandex-team.ru>
References: <20211115094143.157399-1-den-plotnikov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, dgilbert@redhat.com, yc-core@yandex-team.ru,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is needed to keep sending DEVICE_DELETED events on qemu cleanup.
The event may happen in the rcu thread and we're going to flush the rcu queue
explicitly before qemu exiting in the next patch. So move the monitor
destruction to the very end of qemu cleanup to be able to send all the events.

Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
---
 monitor/monitor.c  | 6 ++++++
 softmmu/runstate.c | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/monitor/monitor.c b/monitor/monitor.c
index 21c7a68758f5..b04ae4850db2 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -605,11 +605,17 @@ void monitor_data_init(Monitor *mon, bool is_qmp, bool skip_flush,
     mon->outbuf = g_string_new(NULL);
     mon->skip_flush = skip_flush;
     mon->use_io_thread = use_io_thread;
+    /*
+     * take an extra ref to prevent monitor's chardev
+     * from destroying in qemu_chr_cleanup()
+     */
+    object_ref(OBJECT(mon->chr.chr));
 }
 
 void monitor_data_destroy(Monitor *mon)
 {
     g_free(mon->mon_cpu_path);
+    object_unref(OBJECT(mon->chr.chr));
     qemu_chr_fe_deinit(&mon->chr, false);
     if (monitor_is_qmp(mon)) {
         monitor_data_destroy_qmp(container_of(mon, MonitorQMP, common));
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 10d9b7365aa7..8d29dd2c00e2 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -819,8 +819,8 @@ void qemu_cleanup(void)
     tpm_cleanup();
     net_cleanup();
     audio_cleanup();
-    monitor_cleanup();
     qemu_chr_cleanup();
     user_creatable_cleanup();
+    monitor_cleanup();
     /* TODO: unref root container, check all devices are ok */
 }
-- 
2.25.1


