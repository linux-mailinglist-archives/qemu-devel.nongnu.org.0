Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1AE54CD21
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:34:44 +0200 (CEST)
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1V2Z-0003gG-1z
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UPF-0008Q0-Rq
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:54:06 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:7378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UPE-0001B4-0a
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:54:05 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FE61k5001479;
 Wed, 15 Jun 2022 14:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=wSj/LnBi02Y+yXl7cvW4WLEgJp1j2I3nRgCrUeuhBQ0=;
 b=crkJR0gdTURf7uMOaPsH2P4eYSQseETly1uyGyOGZUae+jHV/bG26UuGPl3s0reT9iJJ
 D0MxuapygRkPH0Xz/IkXiEhueLwQcsropUBAZSmQI9APr7wILdxDQvpFQq+jGXfCagby
 2qrCnfALwPefSt2gRiJMaVEIbrym0HXuJdvIuNAJInCKEMB3bKbP02iH8JbqZNhDZFQ0
 ae682OmP7JnZYakplfABOH2RyUtlXdly/WTQk4qFIvlba+ciOBgsfQt76AlaW916AhN5
 CisngPoOCFQ/1EE5/fW1TPdn/o1DpMQ1uOGT3Q2NDG87AVcCG5c6VOrvxcmFL0/gwhQF Qw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns8tk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:38 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ73a023111; Wed, 15 Jun 2022 14:52:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:37 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSMv018501;
 Wed, 15 Jun 2022 14:52:36 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-8; Wed, 15 Jun 2022 14:52:36 +0000
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
Subject: [PATCH V8 07/39] cpr: reboot HMP interfaces
Date: Wed, 15 Jun 2022 07:51:54 -0700
Message-Id: <1655304746-102776-8-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: izCK8ApXDoGGr9ifq5DsJgRmHIlgTm_R
X-Proofpoint-ORIG-GUID: izCK8ApXDoGGr9ifq5DsJgRmHIlgTm_R
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

cpr-save <filename> <mode>
  Call qmp_cpr_save().
  Arguments:
    filename : save vmstate to filename
    mode: must be "reboot"

cpr-load <filename> <mode>
  Call qmp_cpr_load().
  Arguments:
    filename : load vmstate from filename
    mode: must be "reboot"

Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       | 39 +++++++++++++++++++++++++++++++++++++++
 include/monitor/hmp.h |  2 ++
 monitor/hmp-cmds.c    | 27 +++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 564f1de..9d9f984 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -355,6 +355,45 @@ SRST
 ERST
 
     {
+        .name       = "cpr-save",
+        .args_type  = "filename:s,mode:s",
+        .params     = "filename 'reboot'",
+        .help       = "create a checkpoint of the VM in file",
+        .cmd        = hmp_cpr_save,
+    },
+
+SRST
+``cpr-save`` *filename* *mode*
+  Pause the VCPUs, and create a checkpoint of the virtual machine device state
+  in *filename*.  Unlike snapshot-save, this command completes synchronously,
+  saves state to an ordinary file, does not save guest block device blocks,
+  and does not require that guest RAM be saved in the file.  The caller must
+  not modify guest block devices between cpr-save and cpr-load.
+
+  If *mode* is 'reboot', the checkpoint remains valid after a host reboot.
+  The guest RAM memory-backend should be shared and non-volatile across
+  reboot, else it will be saved to the file.  To resume from the checkpoint,
+  issue the quit command, reboot the system, start qemu using the same
+  arguments plus -S, and issue the cpr-load command.
+ERST
+
+    {
+        .name       = "cpr-load",
+        .args_type  = "filename:s,mode:s",
+        .params     = "filename 'reboot'",
+
+        .help       = "load VM checkpoint from file",
+        .cmd        = hmp_cpr_load,
+    },
+
+SRST
+``cpr-load`` *filename* *mode*
+  Load a virtual machine from the checkpoint file *filename* that was created
+  earlier by the cpr-save command, and continue the VCPUs.  *mode* must match
+  the mode specified for cpr-save.
+ERST
+
+    {
         .name       = "delvm",
         .args_type  = "name:s",
         .params     = "tag",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 96d0148..b44588e 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -59,6 +59,8 @@ void hmp_balloon(Monitor *mon, const QDict *qdict);
 void hmp_loadvm(Monitor *mon, const QDict *qdict);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
+void hmp_cpr_save(Monitor *mon, const QDict *qdict);
+void hmp_cpr_load(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
 void hmp_migrate_incoming(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 622c783..bb12589 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -33,6 +33,7 @@
 #include "qapi/qapi-commands-block.h"
 #include "qapi/qapi-commands-char.h"
 #include "qapi/qapi-commands-control.h"
+#include "qapi/qapi-commands-cpr.h"
 #include "qapi/qapi-commands-machine.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qapi-commands-misc.h"
@@ -1122,6 +1123,32 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict)
     qapi_free_AnnounceParameters(params);
 }
 
+void hmp_cpr_save(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *filename = qdict_get_try_str(qdict, "filename");
+    const char *str = qdict_get_try_str(qdict, "mode");
+    CprMode mode = qapi_enum_parse(&CprMode_lookup, str, -1, &err);
+
+    if (mode != -1) {
+        qmp_cpr_save(filename, mode, &err);
+    }
+    hmp_handle_error(mon, err);
+}
+
+void hmp_cpr_load(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *filename = qdict_get_try_str(qdict, "filename");
+    const char *str = qdict_get_try_str(qdict, "mode");
+    CprMode mode = qapi_enum_parse(&CprMode_lookup, str, -1, &err);
+
+    if (mode != -1) {
+        qmp_cpr_load(filename, mode, &err);
+    }
+    hmp_handle_error(mon, err);
+}
+
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict)
 {
     qmp_migrate_cancel(NULL);
-- 
1.8.3.1


