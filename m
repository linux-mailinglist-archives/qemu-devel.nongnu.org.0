Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F773BF361
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:16:49 +0200 (CEST)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Iem-0003mE-RE
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKp-0001zG-9r
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:11 -0400
Received: from mga03.intel.com ([134.134.136.65]:19084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1m1IKm-0007Kl-7z
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:56:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="209461995"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="209461995"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="423769995"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 17:55:52 -0700
From: isaku.yamahata@gmail.com
To: qemu-devel@nongnu.org, pbonzini@redhat.com, alistair@alistair23.me,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, mst@redhat.com,
 cohuck@redhat.com, mtosatti@redhat.com, xiaoyao.li@intel.com,
 seanjc@google.com, erdemaktas@google.com
Subject: [RFC PATCH v2 04/44] vl: Introduce machine_init_done_late notifier
Date: Wed,  7 Jul 2021 17:54:34 -0700
Message-Id: <80ac3e382a248bac13662d4052d17c41f1c21e3a.1625704980.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625704980.git.isaku.yamahata@intel.com>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=isaku.yamahata@intel.com; helo=mga03.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NML_ADSP_CUSTOM_MED=0.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Isaku Yamahata <isaku.yamahata@intel.com>

Introduce a new notifier, machine_init_done_late, that is notified after
machine_init_done.  This will be used by TDX to generate the HOB for its
virtual firmware, which needs to be done after all guest memory has been
added, i.e. after machine_init_done notifiers have run.  Some code
registers memory by machine_init_done().

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/core/machine.c       | 26 ++++++++++++++++++++++++++
 include/sysemu/sysemu.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index ffc076ae84..66c39cf72a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1278,6 +1278,31 @@ void qemu_remove_machine_init_done_notifier(Notifier *notify)
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
@@ -1311,6 +1336,7 @@ void qdev_machine_creation_done(void)
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
2.25.1


