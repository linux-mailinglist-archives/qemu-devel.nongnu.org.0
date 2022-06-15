Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE3554CC3F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:11:52 +0200 (CEST)
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1UgQ-00077b-IG
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOX-0007Gv-PC
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOV-00013H-RC
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:21 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FDx9Fs001483;
 Wed, 15 Jun 2022 14:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=7fQ8mX2bxDzL5/L5Z29ea6DP6SR9ke9Ex3jEnkpp7Fk=;
 b=0LeIY8lj5Sx9/PDED3ho4AE/1ZYtb17sd2s6t1Lbkv+Llrlt2acaAngjLRKCBohBSbZr
 PGaZk1CBPWEjksvWFvX/Y5J0BxiSTDKjsVYnIlOlp2hFIH9sRvo1mew5QbcX0gRM5WWh
 ZaKsfPoQECPouylXGVSyGXKPysQTotkKP4ma3FpW/SFB8Vh5OU9XL+wKYPv7zf1TvURZ
 lZcZaciMdVnYD8y9fnyB9oHSCLUJdueMaEt8t+SM6jro+dxO4Lxet/qkdlGJSKraSCks
 5lgOcBMHVIYY3wYJ8KkfWwDEr3FTJ4Q40i+Mijhfxl9AQSO07aJhUOzDRDxOLd+SuQSm 2Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns8tm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:55 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ73i023111; Wed, 15 Jun 2022 14:52:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:52:54 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNP018501;
 Wed, 15 Jun 2022 14:52:53 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-22; Wed, 15 Jun 2022 14:52:53 +0000
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
Subject: [PATCH V8 21/39] cpr: restart HMP interfaces
Date: Wed, 15 Jun 2022 07:52:08 -0700
Message-Id: <1655304746-102776-22-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-GUID: sFRCTpa7WWoXm_eswmgKI2zQX-bvYawi
X-Proofpoint-ORIG-GUID: sFRCTpa7WWoXm_eswmgKI2zQX-bvYawi
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
  mode may be "restart"

cpr-exec <command>
  Call qmp_cpr_exec().
  Arguments:
    command : command line to execute, with space-separated arguments

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hmp-commands.hx       | 29 ++++++++++++++++++++++++++---
 include/monitor/hmp.h |  1 +
 monitor/hmp-cmds.c    | 11 +++++++++++
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index d621968..da5dd60 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -357,7 +357,7 @@ ERST
     {
         .name       = "cpr-save",
         .args_type  = "filename:s,mode:s",
-        .params     = "filename 'reboot'",
+        .params     = "filename 'reboot'|'restart'",
         .help       = "create a checkpoint of the VM in file",
         .cmd        = hmp_cpr_save,
     },
@@ -377,13 +377,36 @@ SRST
   reboot, else it will be saved to the file.  To resume from the checkpoint,
   issue the quit command, reboot the system, start qemu using the same
   arguments plus -S, and issue the cpr-load command.
+
+  If *mode* is 'restart', the checkpoint remains valid after restarting
+  qemu using a subsequent cpr-exec.  Guest RAM must be backed by a
+  memory-backend-file with share=on.
+  To resume from the checkpoint, issue the cpr-load command.
+ERST
+
+    {
+        .name       = "cpr-exec",
+        .args_type  = "command:S",
+        .params     = "command",
+        .help       = "Restart qemu by directly exec'ing command",
+        .cmd        = hmp_cpr_exec,
+    },
+
+SRST
+``cpr-exec`` *command*
+  Restart qemu by directly exec'ing *command*, replacing the qemu process.
+  The PID remains the same.  Must be called after cpr-save restart.
+
+  *command*[0] should be the path of a new qemu binary, or a prefix command that
+  in turn exec's the new qemu binary.  The arguments must match those used
+  to initially start qemu, plus the -S option so new qemu starts in a paused
+  state.
 ERST
 
     {
         .name       = "cpr-load",
         .args_type  = "filename:s,mode:s",
-        .params     = "filename 'reboot'",
-
+        .params     = "filename 'reboot'|'restart'",
         .help       = "load VM checkpoint from file",
         .cmd        = hmp_cpr_load,
     },
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index b44588e..ec4fa44 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -60,6 +60,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict);
 void hmp_savevm(Monitor *mon, const QDict *qdict);
 void hmp_delvm(Monitor *mon, const QDict *qdict);
 void hmp_cpr_save(Monitor *mon, const QDict *qdict);
+void hmp_cpr_exec(Monitor *mon, const QDict *qdict);
 void hmp_cpr_load(Monitor *mon, const QDict *qdict);
 void hmp_migrate_cancel(Monitor *mon, const QDict *qdict);
 void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 9f58b1f..b866c7f 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1111,6 +1111,17 @@ void hmp_cpr_save(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+void hmp_cpr_exec(Monitor *mon, const QDict *qdict)
+{
+    Error *err = NULL;
+    const char *command = qdict_get_try_str(qdict, "command");
+    strList *args = strList_from_string(command, ' ');
+
+    qmp_cpr_exec(args, &err);
+    qapi_free_strList(args);
+    hmp_handle_error(mon, err);
+}
+
 void hmp_cpr_load(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
-- 
1.8.3.1


