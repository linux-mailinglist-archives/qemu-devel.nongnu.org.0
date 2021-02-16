Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4A331C55C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 03:17:47 +0100 (CET)
Received: from localhost ([::1]:60868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBpvu-0007mG-DI
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 21:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBptC-0005uO-4l
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:14:58 -0500
Received: from mga17.intel.com ([192.55.52.151]:25635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lBpt8-0001ZH-Dh
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 21:14:57 -0500
IronPort-SDR: Zzwl0KegwgEeoRJhm/3uPo8dQ0JcZBr9hdUtLRp19r7cS9hvbNpxd0Pr/fL9A0ittdu53uTHWL
 ei/gAR6sngNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162558752"
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="162558752"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:51 -0800
IronPort-SDR: zEGjoawRi3ZRt6P5+XDlIjzOIGmlJirgA/g3GJrfQJ+woyXLSpWUkOjJoaBNU+nSjY55lvJ7P/
 +sik905utNdw==
X-IronPort-AV: E=Sophos;i="5.81,182,1610438400"; d="scan'208";a="591705395"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2021 18:14:50 -0800
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com
Subject: [RFC PATCH 05/23] vl: Introduce machine_init_done_late notifier
Date: Mon, 15 Feb 2021 18:13:01 -0800
Message-Id: <296dce1bb111d76de6c9ea86c705bed7e20b13dd.1613188118.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
In-Reply-To: <cover.1613188118.git.isaku.yamahata@intel.com>
References: <cover.1613188118.git.isaku.yamahata@intel.com>
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=isaku.yamahata@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a new notifier, machine_init_done_late, that is notified after
machine_init_done.  This will be used by TDX to generate the HOB for its
virtual firmware, which needs to be done after all guest memory has been
added, i.e. after machine_init_done notifiers have run.
some devices adds/updates memory region by machine_init_done notifier.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/core/machine.c       | 26 ++++++++++++++++++++++++++
 include/sysemu/sysemu.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 970046f438..02be08f3d1 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1231,6 +1231,31 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify)
     notifier_remove(notify);
 }
 
+static NotifierList machine_init_done_late_notifiers =
+    NOTIFIER_LIST_INITIALIZER(machine_init_done_late_notifiers);
+
+static bool machine_init_done_late;
+
+void qemu_add_machine_init_done_late_notifier(Notifier *notify)
+{
+    notifier_list_add(&machine_init_done_late_notifiers, notify);
+    if (machine_init_done_late) {
+        notify->notify(notify, NULL);
+    }
+}
+
+void qemu_remove_machine_init_done_late_notifier(Notifier *notify)
+{
+    notifier_remove(notify);
+}
+
+
+static void qemu_run_machine_init_done_late_notifiers(void)
+{
+    machine_init_done_late = true;
+    notifier_list_notify(&machine_init_done_late_notifiers, NULL);
+}
+
 void qdev_machine_creation_done(void)
 {
     cpu_synchronize_all_post_init();
@@ -1264,6 +1289,7 @@ void qdev_machine_creation_done(void)
     if (rom_check_and_register_reset() != 0) {
         exit(1);
     }
+    qemu_run_machine_init_done_late_notifiers();
 
     replay_start();
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 8fae667172..d44f8cf778 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -19,6 +19,8 @@ void qemu_remove_exit_notifier(Notifier *notify);
 void qemu_run_machine_init_done_notifiers(void);
 void qemu_add_machine_init_done_notifier(Notifier *notify);
 void qemu_remove_machine_init_done_notifier(Notifier *notify);
+void qemu_add_machine_init_done_late_notifier(Notifier *notify);
+void qemu_remove_machine_init_done_late_notifier(Notifier *notify);
 
 void configure_rtc(QemuOpts *opts);
 
-- 
2.17.1


