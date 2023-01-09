Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A8B662AF8
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 17:17:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEupR-0005hF-NX; Mon, 09 Jan 2023 11:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pEupO-0005fn-JX
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:16:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1pEupM-0006D4-E3
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:16:50 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 309FKup5015898
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 16:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=x6WRBUgXAa6pPNi/nnf/DSW8CFcc04Nb2nbag2up1/4=;
 b=bLfBqV3gmvuzUTbt4DgEzsdDfyuRwWINW7sL4TybVsKPvPiCSI53v6R7riSrHbiRNCGN
 LZrkij2Pq38XoM2IpzICBYdG4yoagYgf6kYi5gLxdBgG0cvszvmTF/npx9MAWUD0IqYG
 /kmR3t5AbSeXJPQL/JtQ2qPyhkbnTvtV1fMyVytkR/3cia3+lYX8xAZ5GXkQUmlQLqvG
 SFeZZLpEFNN+slu7fX+CIlb6J8mbiV3OEK32rlVEvb+bt8QCGwfMVA+zTSRkHIwkQi99
 j7pq3f4Ypi46sAlm+wIrr3k0XqQ2d0jKGGvn3HCZw7fre41gW9qaLuDXfMjgoTDvCiMQ vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjp22gpp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 16:16:47 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309Frski020297
 for <qemu-devel@nongnu.org>; Mon, 9 Jan 2023 16:16:46 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjp22gpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 16:16:46 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 309ET1bb007709;
 Mon, 9 Jan 2023 16:16:46 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3my0c7fnkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jan 2023 16:16:46 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 309GGiG131326938
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Jan 2023 16:16:45 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D495B58063;
 Mon,  9 Jan 2023 16:16:44 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F66458059;
 Mon,  9 Jan 2023 16:16:44 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.48.220])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Jan 2023 16:16:44 +0000 (GMT)
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v6 1/2] tpm: convert tpmdev options processing to new visitor
 format
Date: Mon,  9 Jan 2023 11:15:31 -0500
Message-Id: <20230109161532.6892-2-jejb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230109161532.6892-1-jejb@linux.ibm.com>
References: <20230109161532.6892-1-jejb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lP8ujqzpLN5XY44F86PIcvZItrXcsRKB
X-Proofpoint-GUID: Fv5MV1ZwTtQyfkGWaKkTBWKsAdmYDb5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_09,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090116
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
v4: add TpmConfiOptions
v5: exit(0) for help
---
 backends/tpm/tpm_emulator.c    | 24 ++++-----
 backends/tpm/tpm_passthrough.c | 22 +++------
 include/sysemu/tpm.h           |  4 +-
 include/sysemu/tpm_backend.h   |  2 +-
 qapi/tpm.json                  | 19 +++++++
 softmmu/tpm.c                  | 90 ++++++++++++++--------------------
 softmmu/vl.c                   | 19 +------
 7 files changed, 75 insertions(+), 105 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 49cc3d749d..cb6bf9d7c2 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -584,33 +584,28 @@ err_exit:
     return -1;
 }
 
-static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, QemuOpts *opts)
+static int tpm_emulator_handle_device_opts(TPMEmulator *tpm_emu, TpmCreateOptions *opts)
 {
-    const char *value;
     Error *err = NULL;
     Chardev *dev;
 
-    value = qemu_opt_get(opts, "chardev");
-    if (!value) {
-        error_report("tpm-emulator: parameter 'chardev' is missing");
-        goto err;
-    }
+    tpm_emu->options = QAPI_CLONE(TPMEmulatorOptions, &opts->u.emulator);
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
@@ -649,7 +644,7 @@ err:
     return -1;
 }
 
-static TPMBackend *tpm_emulator_create(QemuOpts *opts)
+static TPMBackend *tpm_emulator_create(TpmCreateOptions *opts)
 {
     TPMBackend *tb = TPM_BACKEND(object_new(TYPE_TPM_EMULATOR));
 
@@ -972,7 +967,6 @@ static void tpm_emulator_inst_init(Object *obj)
 
     trace_tpm_emulator_inst_init();
 
-    tpm_emu->options = g_new0(TPMEmulatorOptions, 1);
     tpm_emu->cur_locty_number = ~0;
     qemu_mutex_init(&tpm_emu->mutex);
     tpm_emu->vmstate =
@@ -990,7 +984,7 @@ static void tpm_emulator_shutdown(TPMEmulator *tpm_emu)
 {
     ptm_res res;
 
-    if (!tpm_emu->options->chardev) {
+    if (!tpm_emu->data_ioc) {
         /* was never properly initialized */
         return;
     }
diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
index 179697a3a9..3da467ef01 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -252,21 +252,12 @@ static int tpm_passthrough_open_sysfs_cancel(TPMPassthruState *tpm_pt)
 }
 
 static int
-tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, QemuOpts *opts)
+tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, TpmCreateOptions *opts)
 {
-    const char *value;
+    tpm_pt->options = QAPI_CLONE(TPMPassthroughOptions, &opts->u.passthrough);
 
-    value = qemu_opt_get(opts, "cancel-path");
-    if (value) {
-        tpm_pt->options->cancel_path = g_strdup(value);
-    }
-
-    value = qemu_opt_get(opts, "path");
-    if (value) {
-        tpm_pt->options->path = g_strdup(value);
-    }
-
-    tpm_pt->tpm_dev = value ? value : TPM_PASSTHROUGH_DEFAULT_DEVICE;
+    tpm_pt->tpm_dev = opts->u.passthrough.path ? opts->u.passthrough.path :
+            TPM_PASSTHROUGH_DEFAULT_DEVICE;
     tpm_pt->tpm_fd = qemu_open_old(tpm_pt->tpm_dev, O_RDWR);
     if (tpm_pt->tpm_fd < 0) {
         error_report("Cannot access TPM device using '%s': %s",
@@ -288,11 +279,11 @@ tpm_passthrough_handle_device_opts(TPMPassthruState *tpm_pt, QemuOpts *opts)
     return 0;
 }
 
-static TPMBackend *tpm_passthrough_create(QemuOpts *opts)
+static TPMBackend *tpm_passthrough_create(TpmCreateOptions *tco)
 {
     Object *obj = object_new(TYPE_TPM_PASSTHROUGH);
 
-    if (tpm_passthrough_handle_device_opts(TPM_PASSTHROUGH(obj), opts)) {
+    if (tpm_passthrough_handle_device_opts(TPM_PASSTHROUGH(obj), tco)) {
         object_unref(obj);
         return NULL;
     }
@@ -344,7 +335,6 @@ static void tpm_passthrough_inst_init(Object *obj)
 {
     TPMPassthruState *tpm_pt = TPM_PASSTHROUGH(obj);
 
-    tpm_pt->options = g_new0(TPMPassthroughOptions, 1);
     tpm_pt->tpm_fd = -1;
     tpm_pt->cancel_fd = -1;
 }
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
index 8fd3269c11..846a9e39fa 100644
--- a/include/sysemu/tpm_backend.h
+++ b/include/sysemu/tpm_backend.h
@@ -57,7 +57,7 @@ struct TPMBackendClass {
     /* get a descriptive text of the backend to display to the user */
     const char *desc;
 
-    TPMBackend *(*create)(QemuOpts *opts);
+    TPMBackend *(*create)(TpmCreateOptions *tco);
 
     /* start up the TPM on the backend - optional */
     int (*startup_tpm)(TPMBackend *t, size_t buffersize);
diff --git a/qapi/tpm.json b/qapi/tpm.json
index 4e2ea9756a..2b491c28b4 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -134,6 +134,25 @@
             'emulator': 'TPMEmulatorOptionsWrapper' },
   'if': 'CONFIG_TPM' }
 
+##
+# @TpmCreateOptions:
+#
+# A union referencing different TPM backend types' configuration options
+#   without the wrapper to be usable by visitors.
+#
+# @type: - 'passthrough' The configuration options for the TPM passthrough type
+#        - 'emulator' The configuration options for TPM emulator backend type
+#
+# Since: 7.2
+##
+{ 'union': 'TpmCreateOptions',
+  'base': { 'type': 'TpmType',
+            'id' : 'str' },
+  'discriminator': 'type',
+  'data': { 'passthrough' : 'TPMPassthroughOptions',
+            'emulator': 'TPMEmulatorOptions' },
+  'if': 'CONFIG_TPM' }
+
 ##
 # @TPMInfo:
 #
diff --git a/softmmu/tpm.c b/softmmu/tpm.c
index 578563f05a..fa84a53b96 100644
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
 
+typedef struct TpmCreateOptionsQueueEntry {
+        TpmCreateOptions *tco;
+        QSIMPLEQ_ENTRY(TpmCreateOptionsQueueEntry) entry;
+} TpmCreateOptionsQueueEntry;
+
+typedef QSIMPLEQ_HEAD(, TpmCreateOptionsQueueEntry) TpmCreateOptionsQueue;
+
+static TpmCreateOptionsQueue tco_queue = QSIMPLEQ_HEAD_INITIALIZER(tco_queue);
+
 static const TPMBackendClass *
 tpm_be_find_by_type(enum TpmType type)
 {
@@ -84,63 +96,31 @@ TPMBackend *qemu_find_tpm_be(const char *id)
     return NULL;
 }
 
-static int tpm_init_tpmdev(void *dummy, QemuOpts *opts, Error **errp)
+static void tpm_init_tpmdev(TpmCreateOptions *tco)
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
+    be = tco->type >= 0 ? tpm_be_find_by_type(tco->type) : NULL;
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
+    drv = be->create(tco);
     if (!drv) {
-        return 1;
+        exit(1);
     }
 
-    drv->id = g_strdup(id);
+    drv->id = g_strdup(tco->id);
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
+    while (!QSIMPLEQ_EMPTY(&tco_queue)) {
+        TpmCreateOptionsQueueEntry *tcoqe = QSIMPLEQ_FIRST(&tco_queue);
 
-    return 0;
+        QSIMPLEQ_REMOVE_HEAD(&tco_queue, entry);
+        tpm_init_tpmdev(tcoqe->tco);
+        g_free(tcoqe);
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
+    TpmCreateOptionsQueueEntry *tcqe;
 
-    if (!strcmp(optarg, "help")) {
+    if (is_help_option(optarg)) {
         tpm_display_backend_drivers();
-        return -1;
-    }
-    opts = qemu_opts_parse_noisily(opts_list, optarg, true);
-    if (!opts) {
-        return -1;
+        exit(0);
     }
-    return 0;
+    v = qobject_input_visitor_new_str(optarg, "type", &error_fatal);
+    tcqe = g_new(TpmCreateOptionsQueueEntry, 1);
+    visit_type_TpmCreateOptions(v, NULL, &tcqe->tco, &error_fatal);
+    visit_free(v);
+    QSIMPLEQ_INSERT_TAIL(&tco_queue, tcqe, entry);
 }
 
 /*
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 798e1dc933..8c2655dbc2 100644
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


