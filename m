Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35CF650C83
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:15:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7FyV-0004hg-8J; Mon, 19 Dec 2022 08:14:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7FyT-0004hK-Mr
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:14:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p7FyR-0001Fh-5g
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:14:33 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BJCnrjI031345
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=25oef4qVrDYVWp6XfDP7sV1xoa71KnusAM4+GI6L3p4=;
 b=aCNH+qDeGvx5oS2C966X4iYjrO7ZIgNagElQcTYX0qIdEtCb44NgM6r7niX/ocOALKud
 iM1bdHsWy8YNeWyckFffrx48VC74IYJoigm7jsPlHVSnds9WzxfQBlEShjNbl66BPIza
 /XPp6/+XZZMZG6o68mJfQZYvs+9c0nH4YD3f0sTTVJtHV46GPbhH0yxKydPjbh7aOYth
 yFh3r7p0zmn2a4x70FFy+IpcotxPBuFAhMjjbIGlaKkQY2yEaHAZJ8YCRvfhMaJu0Q19
 Xj2mnEctX6Cdz117aMsPj9lfmEg8Pu/uC6fpHw1GG5Cfa4m6Urubd3U1tb9ySFN2pjan Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjrabrp0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:14:29 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BJCoTgV001908
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 13:14:29 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3mjrabrp0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 13:14:29 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BJCiXQh032741;
 Mon, 19 Dec 2022 13:14:28 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3mh6yygvjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Dec 2022 13:14:28 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BJDEQFF8585736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Dec 2022 13:14:26 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 766FB58052;
 Mon, 19 Dec 2022 13:14:26 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2AFC5805D;
 Mon, 19 Dec 2022 13:14:25 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.33.74])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 19 Dec 2022 13:14:25 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 1/2] tpm: convert tpmdev options processing to new visitor
 format
Date: Mon, 19 Dec 2022 08:13:43 -0500
Message-Id: <20221219131344.18909-2-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221219131344.18909-1-jejb@linux.ibm.com>
References: <20221219131344.18909-1-jejb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VLQfcgbJVwOIuV8Wmp59i5_wfLKNiISG
X-Proofpoint-GUID: QeSDXlPVietr1siPCHb0JBBGPDgOoIkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_01,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212190115
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: James Bottomley <James.Bottomley@HansenPartnership.com>

Instead of processing the tpmdev options using the old qemu options,
convert to the new visitor format which also allows the passing of
json on the command line.

Signed-off-by: James Bottomley <jejb@linux.ibm.com>
---
 backends/tpm/tpm_emulator.c    | 35 ++++++-------
 backends/tpm/tpm_passthrough.c | 37 +++++---------
 include/sysemu/tpm.h           |  4 +-
 include/sysemu/tpm_backend.h   |  2 +-
 monitor/hmp-cmds.c             |  4 +-
 qapi/tpm.json                  | 26 ++--------
 softmmu/tpm.c                  | 90 ++++++++++++++--------------------
 softmmu/vl.c                   | 19 +------
 8 files changed, 73 insertions(+), 144 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 49cc3d749d..82988a2986 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -69,7 +69,7 @@ typedef struct TPMBlobBuffers {
 struct TPMEmulator {
     TPMBackend parent;
 
-    TPMEmulatorOptions *options;
+    TpmTypeOptions *options;
     CharBackend ctrl_chr;
     QIOChannel *data_ioc;
     TPMVersion tpm_version;
@@ -584,33 +584,28 @@ err_exit:
     return -1;
 }
 
-static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, QemuOpts *opts)
+static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, TpmTypeOptions *opts)
 {
-    const char *value;
     Error *err = NULL;
     Chardev *dev;
 
-    value = qemu_opt_get(opts, "chardev");
-    if (!value) {
-        error_report("tpm-emulator: parameter 'chardev' is missing");
-        goto err;
-    }
+    tpm_emu->options = opts;
+    tpm_emu->data_ioc = NULL;
 
-    dev = qemu_chr_find(value);
+    dev = qemu_chr_find(opts->u.emulator.chardev);
     if (!dev) {
-        error_report("tpm-emulator: tpm chardev '%s' not found", value);
+        error_report("tpm-emulator: tpm chardev '%s' not found",
+                opts->u.emulator.chardev);
         goto err;
     }
 
     if (!qemu_chr_fe_init(&tpm_emu->ctrl_chr, dev, &err)) {
         error_prepend(&err, "tpm-emulator: No valid chardev found at '%s':",
-                      value);
+                      opts->u.emulator.chardev);
         error_report_err(err);
         goto err;
     }
 
-    tpm_emu->options->chardev = g_strdup(value);
-
     if (tpm_emulator_prepare_data_fd(tpm_emu) < 0) {
         goto err;
     }
@@ -621,7 +616,7 @@ static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, QemuOpts *opts)
     if (tpm_util_test_tpmdev(QIO_CHANNEL_SOCKET(tpm_emu->data_ioc)->fd,
                              &tpm_emu->tpm_version)) {
         error_report("'%s' is not emulating TPM device. Error: %s",
-                      tpm_emu->options->chardev, strerror(errno));
+                      tpm_emu->options->u.emulator.chardev, strerror(errno));
         goto err;
     }
 
@@ -649,7 +644,7 @@ err:
     return -1;
 }
 
-static TPMBackend *tpm_emulator_create(QemuOpts *opts)
+static TPMBackend *tpm_emulator_create(TpmTypeOptions *opts)
 {
     TPMBackend *tb = TPM_BACKEND(object_new(TYPE_TPM_EMULATOR));
 
@@ -664,10 +659,9 @@ static TPMBackend *tpm_emulator_create(QemuOpts *opts)
 static TpmTypeOptions *tpm_emulator_get_tpm_options(TPMBackend *tb)
 {
     TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
-    TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
+    TpmTypeOptions *options;
 
-    options->type = TPM_TYPE_EMULATOR;
-    options->u.emulator.data = QAPI_CLONE(TPMEmulatorOptions, tpm_emu->options);
+    options = QAPI_CLONE(TpmTypeOptions, tpm_emu->options);
 
     return options;
 }
@@ -972,7 +966,6 @@ static void tpm_emulator_inst_init(Object *obj)
 
     trace_tpm_emulator_inst_init();
 
-    tpm_emu->options = g_new0(TPMEmulatorOptions, 1);
     tpm_emu->cur_locty_number = ~0;
     qemu_mutex_init(&tpm_emu->mutex);
     tpm_emu->vmstate =
@@ -990,7 +983,7 @@ static void tpm_emulator_shutdown(TPMEmulator *tpm_emu)
 {
     ptm_res res;
 
-    if (!tpm_emu->options->chardev) {
+    if (!tpm_emu->data_ioc) {
         /* was never properly initialized */
         return;
     }
@@ -1015,7 +1008,7 @@ static void tpm_emulator_inst_finalize(Object *obj)
 
     qemu_chr_fe_deinit(&tpm_emu->ctrl_chr, false);
 
-    qapi_free_TPMEmulatorOptions(tpm_emu->options);
+    qapi_free_TpmTypeOptions(tpm_emu->options);
 
     if (tpm_emu->migration_blocker) {
         migrate_del_blocker(tpm_emu->migration_blocker);
diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
index 5a2f74db1b..2ce39b2167 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -41,7 +41,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(TPMPassthruState, TPM_PASSTHROUGH)
 struct TPMPassthruState {
     TPMBackend parent;
 
-    TPMPassthroughOptions *options;
+    TpmTypeOptions *options;
     const char *tpm_dev;
     int tpm_fd;
     bool tpm_executing;
@@ -214,8 +214,8 @@ static int tpm_passthrough_open_sysfs_cancel(TPMPassthruState *tpm_pt)
     char *dev;
     char path[PATH_MAX];
 
-    if (tpm_pt->options->cancel_path) {
-        fd = qemu_open_old(tpm_pt->options->cancel_path, O_WRONLY);
+    if (tpm_pt->options->u.passthrough.cancel_path) {
+        fd = qemu_open_old(tpm_pt->options->u.passthrough.cancel_path, O_WRONLY);
         if (fd < 0) {
             error_report("tpm_passthrough: Could not open TPM cancel path: %s",
                          strerror(errno));
@@ -245,30 +245,18 @@ static int tpm_passthrough_open_sysfs_cancel(TPMPassthruState *tpm_pt)
     if (fd < 0) {
         error_report("tpm_passthrough: Could not guess TPM cancel path");
     } else {
-        tpm_pt->options->cancel_path = g_strdup(path);
+        tpm_pt->options->u.passthrough.cancel_path = g_strdup(path);
     }
 
     return fd;
 }
 
 static int
-tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, QemuOpts *opts)
+tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, TpmTypeOptions *opts)
 {
-    const char *value;
+    tpm_pt->options = opts;
 
-    value = qemu_opt_get(opts, "cancel-path");
-    if (value) {
-        tpm_pt->options->cancel_path = g_strdup(value);
-        tpm_pt->options->has_cancel_path = true;
-    }
-
-    value = qemu_opt_get(opts, "path");
-    if (value) {
-        tpm_pt->options->has_path = true;
-        tpm_pt->options->path = g_strdup(value);
-    }
-
-    tpm_pt->tpm_dev = value ? value : TPM_PASSTHROUGH_DEFAULT_DEVICE;
+    tpm_pt->tpm_dev = opts->u.passthrough.has_path ? opts->u.passthrough.path : TPM_PASSTHROUGH_DEFAULT_DEVICE;
     tpm_pt->tpm_fd = qemu_open_old(tpm_pt->tpm_dev, O_RDWR);
     if (tpm_pt->tpm_fd < 0) {
         error_report("Cannot access TPM device using '%s': %s",
@@ -290,11 +278,11 @@ tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, QemuOpts *opts)
     return 0;
 }
 
-static TPMBackend *tpm_passthrough_create(QemuOpts *opts)
+static TPMBackend *tpm_passthrough_create(TpmTypeOptions *tto)
 {
     Object *obj = object_new(TYPE_TPM_PASSTHROUGH);
 
-    if (tpm_passthrough_handle_device_opts(TPM_PASSTHROUGH(obj), opts)) {
+    if (tpm_passthrough_handle_device_opts(TPM_PASSTHROUGH(obj), tto)) {
         object_unref(obj);
         return NULL;
     }
@@ -320,9 +308,7 @@ static TpmTypeOptions *tpm_passthrough_get_tpm_options(TPMBackend *tb)
 {
     TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
 
-    options->type = TPM_TYPE_PASSTHROUGH;
-    options->u.passthrough.data = QAPI_CLONE(TPMPassthroughOptions,
-                                             TPM_PASSTHROUGH(tb)->options);
+    options = QAPI_CLONE(TpmTypeOptions, TPM_PASSTHROUGH(tb)->options);
 
     return options;
 }
@@ -346,7 +332,6 @@ static void tpm_passthrough_inst_init(Object *obj)
 {
     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(obj);
 
-    tpm_pt->options = g_new0(TPMPassthroughOptions, 1);
     tpm_pt->tpm_fd = -1;
     tpm_pt->cancel_fd = -1;
 }
@@ -363,7 +348,7 @@ static void tpm_passthrough_inst_finalize(Object *obj)
     if (tpm_pt->cancel_fd >= 0) {
         qemu_close(tpm_pt->cancel_fd);
     }
-    qapi_free_TPMPassthroughOptions(tpm_pt->options);
+    qapi_free_TpmTypeOptions(tpm_pt->options);
 }
 
 static void tpm_passthrough_class_init(ObjectClass *klass, void *data)
diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index fb40e30ff6..d00a833a21 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -17,8 +17,8 @@
 
 #ifdef CONFIG_TPM
 
-int tpm_config_parse(QemuOptsList *opts_list, const char *optarg);
-int tpm_init(void);
+void tpm_config_parse(const char *optarg);
+void tpm_init(void);
 void tpm_cleanup(void);
 
 typedef enum TPMVersion {
diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
index 8fd3269c11..bcef275688 100644
--- a/include/sysemu/tpm_backend.h
+++ b/include/sysemu/tpm_backend.h
@@ -57,7 +57,7 @@ struct TPMBackendClass {
     /* get a descriptive text of the backend to display to the user */
     const char *desc;
 
-    TPMBackend *(*create)(QemuOpts *opts);
+    TPMBackend *(*create)(TpmTypeOptions *tto);
 
     /* start up the TPM on the backend - optional */
     int (*startup_tpm)(TPMBackend *t, size_t buffersize);
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 01b789a79e..e99447ad68 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -863,7 +863,7 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
 
         switch (ti->options->type) {
         case TPM_TYPE_PASSTHROUGH:
-            tpo = ti->options->u.passthrough.data;
+            tpo = &ti->options->u.passthrough;
             monitor_printf(mon, "%s%s%s%s",
                            tpo->has_path ? ",path=" : "",
                            tpo->has_path ? tpo->path : "",
@@ -871,7 +871,7 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
                            tpo->has_cancel_path ? tpo->cancel_path : "");
             break;
         case TPM_TYPE_EMULATOR:
-            teo = ti->options->u.emulator.data;
+            teo = &ti->options->u.emulator;
             monitor_printf(mon, ",chardev=%s", teo->chardev);
             break;
         case TPM_TYPE__MAX:
diff --git a/qapi/tpm.json b/qapi/tpm.json
index 4e2ea9756a..d8cbd5ea0e 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -99,39 +99,23 @@
 { 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
   'if': 'CONFIG_TPM' }
 
-##
-# @TPMPassthroughOptionsWrapper:
-#
-# Since: 1.5
-##
-{ 'struct': 'TPMPassthroughOptionsWrapper',
-  'data': { 'data': 'TPMPassthroughOptions' },
-  'if': 'CONFIG_TPM' }
-
-##
-# @TPMEmulatorOptionsWrapper:
-#
-# Since: 2.11
-##
-{ 'struct': 'TPMEmulatorOptionsWrapper',
-  'data': { 'data': 'TPMEmulatorOptions' },
-  'if': 'CONFIG_TPM' }
-
 ##
 # @TpmTypeOptions:
 #
 # A union referencing different TPM backend types' configuration options
 #
+# @id: identifier of the backend
 # @type: - 'passthrough' The configuration options for the TPM passthrough type
 #        - 'emulator' The configuration options for TPM emulator backend type
 #
 # Since: 1.5
 ##
 { 'union': 'TpmTypeOptions',
-  'base': { 'type': 'TpmType' },
+  'base': { 'type': 'TpmType',
+            'id': 'str' },
   'discriminator': 'type',
-  'data': { 'passthrough' : 'TPMPassthroughOptionsWrapper',
-            'emulator': 'TPMEmulatorOptionsWrapper' },
+  'data': { 'passthrough' : 'TPMPassthroughOptions',
+            'emulator': 'TPMEmulatorOptions' },
   'if': 'CONFIG_TPM' }
 
 ##
diff --git a/softmmu/tpm.c b/softmmu/tpm.c
index 578563f05a..e7417df4ce 100644
--- a/softmmu/tpm.c
+++ b/softmmu/tpm.c
@@ -17,14 +17,26 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-tpm.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qobject-input-visitor.h"
+#include "qapi/qapi-visit-tpm.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/help_option.h"
 
 static QLIST_HEAD(, TPMBackend) tpm_backends =
     QLIST_HEAD_INITIALIZER(tpm_backends);
 
+typedef struct TpmTypeOptionsQueueEntry {
+        TpmTypeOptions *tto;
+        QSIMPLEQ_ENTRY(TpmTypeOptionsQueueEntry) entry;
+} TpmTypeOptionsQueueEntry;
+
+typedef QSIMPLEQ_HEAD(, TpmTypeOptionsQueueEntry) TpmTypeOptionsQueue;
+
+static TpmTypeOptionsQueue tto_queue = QSIMPLEQ_HEAD_INITIALIZER(tto_queue);
+
 static const TPMBackendClass *
 tpm_be_find_by_type(enum TpmType type)
 {
@@ -84,63 +96,31 @@ TPMBackend *qemu_find_tpm_be(const char *id)
     return NULL;
 }
 
-static int tpm_init_tpmdev(void *dummy, QemuOpts *opts, Error **errp)
+static void tpm_init_tpmdev(TpmTypeOptions *tto)
 {
-    /*
-     * Use of error_report() in a function with an Error ** parameter
-     * is suspicious.  It is okay here.  The parameter only exists to
-     * make the function usable with qemu_opts_foreach().  It is not
-     * actually used.
-     */
-    const char *value;
-    const char *id;
     const TPMBackendClass *be;
     TPMBackend *drv;
-    Error *local_err = NULL;
-    int i;
 
     if (!QLIST_EMPTY(&tpm_backends)) {
         error_report("Only one TPM is allowed.");
-        return 1;
+        exit(1);
     }
 
-    id = qemu_opts_id(opts);
-    if (id == NULL) {
-        error_report(QERR_MISSING_PARAMETER, "id");
-        return 1;
-    }
-
-    value = qemu_opt_get(opts, "type");
-    if (!value) {
-        error_report(QERR_MISSING_PARAMETER, "type");
-        tpm_display_backend_drivers();
-        return 1;
-    }
-
-    i = qapi_enum_parse(&TpmType_lookup, value, -1, NULL);
-    be = i >= 0 ? tpm_be_find_by_type(i) : NULL;
+    be = tto->type >= 0 ? tpm_be_find_by_type(tto->type) : NULL;
     if (be == NULL) {
         error_report(QERR_INVALID_PARAMETER_VALUE,
                      "type", "a TPM backend type");
         tpm_display_backend_drivers();
-        return 1;
-    }
-
-    /* validate backend specific opts */
-    if (!qemu_opts_validate(opts, be->opts, &local_err)) {
-        error_report_err(local_err);
-        return 1;
+        exit(1);
     }
 
-    drv = be->create(opts);
+    drv = be->create(tto);
     if (!drv) {
-        return 1;
+        exit(1);
     }
 
-    drv->id = g_strdup(id);
+    drv->id = g_strdup(tto->id);
     QLIST_INSERT_HEAD(&tpm_backends, drv, list);
-
-    return 0;
 }
 
 /*
@@ -161,33 +141,35 @@ void tpm_cleanup(void)
  * Initialize the TPM. Process the tpmdev command line options describing the
  * TPM backend.
  */
-int tpm_init(void)
+void tpm_init(void)
 {
-    if (qemu_opts_foreach(qemu_find_opts("tpmdev"),
-                          tpm_init_tpmdev, NULL, NULL)) {
-        return -1;
-    }
+    while (!QSIMPLEQ_EMPTY(&tto_queue)) {
+        TpmTypeOptionsQueueEntry *ttoqe = QSIMPLEQ_FIRST(&tto_queue);
 
-    return 0;
+        QSIMPLEQ_REMOVE_HEAD(&tto_queue, entry);
+        tpm_init_tpmdev(ttoqe->tto);
+        g_free(ttoqe);
+    }
 }
 
 /*
  * Parse the TPM configuration options.
  * To display all available TPM backends the user may use '-tpmdev help'
  */
-int tpm_config_parse(QemuOptsList *opts_list, const char *optarg)
+void tpm_config_parse(const char *optarg)
 {
-    QemuOpts *opts;
+    Visitor *v;
+    TpmTypeOptionsQueueEntry *toqe;
 
-    if (!strcmp(optarg, "help")) {
+    if (is_help_option(optarg)) {
         tpm_display_backend_drivers();
-        return -1;
-    }
-    opts = qemu_opts_parse_noisily(opts_list, optarg, true);
-    if (!opts) {
-        return -1;
+        return;
     }
-    return 0;
+    v = qobject_input_visitor_new_str(optarg, "type", &error_fatal);
+    toqe = g_new(TpmTypeOptionsQueueEntry, 1);
+    visit_type_TpmTypeOptions(v, NULL, &toqe->tto, &error_fatal);
+    visit_free(v);
+    QSIMPLEQ_INSERT_TAIL(&tto_queue, toqe, entry);
 }
 
 /*
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5115221efe..980f998c35 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -328,16 +328,6 @@ static QemuOptsList qemu_object_opts = {
     },
 };
 
-static QemuOptsList qemu_tpmdev_opts = {
-    .name = "tpmdev",
-    .implied_opt_name = "type",
-    .head = QTAILQ_HEAD_INITIALIZER(qemu_tpmdev_opts.head),
-    .desc = {
-        /* options are defined in the TPM backends */
-        { /* end of list */ }
-    },
-};
-
 static QemuOptsList qemu_overcommit_opts = {
     .name = "overcommit",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_overcommit_opts.head),
@@ -1934,9 +1924,7 @@ static void qemu_create_late_backends(void)
 
     object_option_foreach_add(object_create_late);
 
-    if (tpm_init() < 0) {
-        exit(1);
-    }
+    tpm_init();
 
     qemu_opts_foreach(qemu_find_opts("mon"),
                       mon_init_func, NULL, &error_fatal);
@@ -2658,7 +2646,6 @@ void qemu_init(int argc, char **argv)
     qemu_add_opts(&qemu_boot_opts);
     qemu_add_opts(&qemu_add_fd_opts);
     qemu_add_opts(&qemu_object_opts);
-    qemu_add_opts(&qemu_tpmdev_opts);
     qemu_add_opts(&qemu_overcommit_opts);
     qemu_add_opts(&qemu_msg_opts);
     qemu_add_opts(&qemu_name_opts);
@@ -2906,9 +2893,7 @@ void qemu_init(int argc, char **argv)
                 break;
 #ifdef CONFIG_TPM
             case QEMU_OPTION_tpmdev:
-                if (tpm_config_parse(qemu_find_opts("tpmdev"), optarg) < 0) {
-                    exit(1);
-                }
+                tpm_config_parse(optarg);
                 break;
 #endif
             case QEMU_OPTION_mempath:
-- 
2.35.3


