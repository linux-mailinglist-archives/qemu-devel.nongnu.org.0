Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6254CBFA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 16:57:42 +0200 (CEST)
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1USj-0006h3-5w
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 10:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO9-0006EK-LH
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:57 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UO7-00010j-Kf
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:52:57 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE0Gvm025874;
 Wed, 15 Jun 2022 14:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=+sp4+cpxttCc+An/LgJTFXgwVuA5JVJmj7Xti2hEz1s=;
 b=KB3p2Uajbly1G1ce/7z9BOjJZij9jDxtdOexQx711d85btR2pkDFqbQAYTAgqg82GW4v
 wpVvDFBkyjaNHBYzJA++UcXJvv0l0lH/mP1wIb0h6b984gU1j2/9UWw7RkUDGIyRLQBg
 2pUzLaCUnInD7374fsfj2cxAmMp0gi8sfC3ExzTsPAMfIU1p2Z2ZXJ1eJA0LVwFEvWs6
 qBSbN4pwZYPtI4qBF1mqHhFF9fi3gWcmvFFtPHBLkm1KIjUDNx/iJpz62GM3YH6Kss13
 G6rJHO3aSEw2mqug6gDCB9z3M7E8uPtWpzHZZ24yqumRus9EunIvtkGzrP+93fbl1Pyx tw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhu2rxdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:41 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ7UR023115; Wed, 15 Jun 2022 14:52:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpmt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:41 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSN3018501;
 Wed, 15 Jun 2022 14:52:40 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-11; Wed, 15 Jun 2022 14:52:40 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 10/39] cpr: cpr-enable option
Date: Wed, 15 Jun 2022 07:51:57 -0700
Message-Id: <1655304746-102776-11-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: NpcBYuP1vJTfpkibW34CkOEW18gZSrt6
X-Proofpoint-ORIG-GUID: NpcBYuP1vJTfpkibW34CkOEW18gZSrt6
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add the '-cpr-enable <mode>' command-line option as a pre-requisite for
using cpr-save and cpr-load for the mode.  Multiple -cpr-enable options
may be specified, one per mode.

Requiring -cpr-enable allows qemu to initialize objects differently, if
necessary, so that cpr-save is not blocked.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx         |  4 ++++
 include/migration/cpr.h |  2 ++
 migration/cpr.c         | 22 ++++++++++++++++++++++
 qapi/cpr.json           |  4 ++++
 qemu-options.hx         | 10 ++++++++++
 softmmu/vl.c            |  8 ++++++++
 6 files changed, 50 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 9d9f984..d621968 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -370,6 +370,8 @@ SRST
   and does not require that guest RAM be saved in the file.  The caller must
   not modify guest block devices between cpr-save and cpr-load.
 
+  cpr-save requires that qemu was started with -cpr-enable for *mode*.
+
   If *mode* is 'reboot', the checkpoint remains valid after a host reboot.
   The guest RAM memory-backend should be shared and non-volatile across
   reboot, else it will be saved to the file.  To resume from the checkpoint,
@@ -391,6 +393,8 @@ SRST
   Load a virtual machine from the checkpoint file *filename* that was created
   earlier by the cpr-save command, and continue the VCPUs.  *mode* must match
   the mode specified for cpr-save.
+
+  cpr-load requires that qemu was started with -cpr-enable for *mode*.
 ERST
 
     {
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index dfe5a1d..f236cbf 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -10,8 +10,10 @@
 
 #include "qapi/qapi-types-cpr.h"
 
+void cpr_init(int modes);
 void cpr_set_mode(CprMode mode);
 CprMode cpr_get_mode(void);
+bool cpr_enabled(CprMode mode);
 
 #define CPR_MODE_ALL CPR_MODE__MAX
 
diff --git a/migration/cpr.c b/migration/cpr.c
index c1da784..76b9225 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -29,6 +29,18 @@ void cpr_set_mode(CprMode mode)
     cpr_mode = mode;
 }
 
+static int cpr_enabled_modes;
+
+void cpr_init(int modes)
+{
+    cpr_enabled_modes = modes;
+}
+
+bool cpr_enabled(CprMode mode)
+{
+    return !!(cpr_enabled_modes & BIT(mode));
+}
+
 static GSList *cpr_blockers[CPR_MODE__MAX];
 
 /*
@@ -110,6 +122,11 @@ void qmp_cpr_save(const char *filename, CprMode mode, Error **errp)
     QEMUFile *f;
     int saved_vm_running = runstate_is_running();
 
+    if (!(cpr_enabled_modes & BIT(mode))) {
+        error_setg(errp, "cpr mode is not enabled.  Use -cpr-enable.");
+        return;
+    }
+
     if (cpr_is_blocked(errp, mode)) {
         return;
     }
@@ -154,6 +171,11 @@ void qmp_cpr_load(const char *filename, CprMode mode, Error **errp)
     int ret;
     RunState state;
 
+    if (!(cpr_enabled_modes & BIT(mode))) {
+        error_setg(errp, "cpr mode is not enabled.  Use -cpr-enable.");
+        return;
+    }
+
     if (runstate_is_running()) {
         error_setg(errp, "cpr-load called for a running VM");
         return;
diff --git a/qapi/cpr.json b/qapi/cpr.json
index bdaabcb..11c6f88 100644
--- a/qapi/cpr.json
+++ b/qapi/cpr.json
@@ -30,6 +30,8 @@
 # and does not require that guest RAM be saved in the file.  The caller must
 # not modify guest block devices between cpr-save and cpr-load.
 #
+# cpr-save requires that qemu was started with -cpr-enable for @mode.
+#
 # If @mode is 'reboot', the checkpoint remains valid after a host reboot.
 # The guest RAM memory-backend should be shared and non-volatile across
 # reboot, else it will be saved to the file.  To resume from the checkpoint,
@@ -52,6 +54,8 @@
 # earlier by the cpr-save command, and continue the VCPUs.  @mode must match
 # the mode specified for cpr-save.
 #
+# cpr-load requires that qemu was started with -cpr-enable for @mode.
+#
 # @filename: name of checkpoint file
 # @mode: @CprMode mode
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 377d22f..6e51c33 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4483,6 +4483,16 @@ SRST
     an unmigratable state.
 ERST
 
+DEF("cpr-enable", HAS_ARG, QEMU_OPTION_cpr_enable, \
+    "-cpr-enable reboot    enable the cpr mode\n",
+    QEMU_ARCH_ALL)
+SRST
+``-cpr-enable reboot``
+    Enable the specified cpr mode.  May be supplied multiple times, once
+    per mode.  This is a pre-requisite for calling the cpr-save and cpr-load
+    commands.
+ERST
+
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
     "-nodefaults     don't create default devices\n", QEMU_ARCH_ALL)
 SRST
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 54e920a..ce779cf 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -78,6 +78,7 @@
 #include "hw/i386/pc.h"
 #include "migration/misc.h"
 #include "migration/snapshot.h"
+#include "migration/cpr.h"
 #include "sysemu/tpm.h"
 #include "sysemu/dma.h"
 #include "hw/audio/soundhw.h"
@@ -2600,6 +2601,7 @@ void qemu_init(int argc, char **argv, char **envp)
     MachineClass *machine_class;
     bool userconfig = true;
     FILE *vmstate_dump_file = NULL;
+    int cpr_modes = 0;
 
     qemu_add_opts(&qemu_drive_opts);
     qemu_add_drive_opts(&qemu_legacy_drive_opts);
@@ -3313,6 +3315,10 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_only_migratable:
                 only_migratable = 1;
                 break;
+            case QEMU_OPTION_cpr_enable:
+                cpr_modes |= BIT(qapi_enum_parse(&CprMode_lookup, optarg, -1,
+                                                 &error_fatal));
+                break;
             case QEMU_OPTION_nodefaults:
                 has_defaults = 0;
                 break;
@@ -3464,6 +3470,8 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_validate_options(machine_opts_dict);
     qemu_process_sugar_options();
 
+    cpr_init(cpr_modes);
+
     /*
      * These options affect everything else and should be processed
      * before daemonizing.
-- 
1.8.3.1


