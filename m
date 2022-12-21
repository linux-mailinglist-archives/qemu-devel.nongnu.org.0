Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292065379A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 21:34:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p85lo-0003D2-0C; Wed, 21 Dec 2022 15:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p85lk-0003Ck-EB
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 15:32:52 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1p85li-0004Zi-3O
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 15:32:52 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BLKEJtF009656
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 20:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=VUBDqm91nyK56PSl1geu2tqOvCYI+aF/7NbzA9oO4/Y=;
 b=fbXow/0ctW2mjMf0EkJTimLs0aJV9ObRPv8wHkVUr1NMBiYxWWbS16tjH38QVgs3VqBP
 9WhavvkBsxCNs5GjS+aLh2PJ+S0BjRvMGTA8w+EaPit16Kju9u9ZP6b3Kf20KeSt8LUt
 sg45FvQtK9dXbBX0sEZBQe2HBrtaxf0zUDt4ulb+MlrnzBqYe8vVLu6VWEGgvRd7woYJ
 6SHRW15gQdbSRPkomp2DX6n7kLaxsOEw0TcyLLjbKBJ50cWmpzX7mRU1SXCMAyp4AzSs
 Bb18NIsDAAHmJNQFF99OviWeTuiqjJwllvwV0QfCZTAYXYCCkIGnRFGcbd84ndaGbWLh 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mm90egbq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 20:31:47 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BLKFvG5015710
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 20:31:47 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mm90egbpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 20:31:46 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLJ9gAs017390;
 Wed, 21 Dec 2022 20:31:46 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3mh6yxwenb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Dec 2022 20:31:46 +0000
Received: from b03ledav004.gho.boulder.ibm.com ([9.17.130.235])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BLKVjph46334656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Dec 2022 20:31:45 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0FE37805E;
 Wed, 21 Dec 2022 21:55:06 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E20667805C;
 Wed, 21 Dec 2022 21:55:05 +0000 (GMT)
Received: from lingrow.int.hansenpartnership.com (unknown [9.163.33.74])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 21 Dec 2022 21:55:05 +0000 (GMT)
Message-ID: <935621fc0be3a77bc4503a79c8c0d035f7e29edc.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] tpm: convert tpmdev options processing to new
 visitor format
From: James Bottomley <jejb@linux.ibm.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>, Markus
 Armbruster <armbru@redhat.com>
Date: Wed, 21 Dec 2022 15:31:42 -0500
In-Reply-To: <Y6M1FkKxnRv1Ev3I@redhat.com>
References: <20221219131344.18909-1-jejb@linux.ibm.com>
 <20221219131344.18909-2-jejb@linux.ibm.com> <Y6M1FkKxnRv1Ev3I@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xgqd8fo7WBXeSYxG2176K9shvR9gXMuS
X-Proofpoint-GUID: m-TlYMJ0pGtaIlb_EDGWiXokE5WhFBsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_11,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210171
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jejb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Reply-To: jejb@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 2022-12-21 at 16:32 +0000, Daniel P. Berrangé wrote:
> This isn't a valid change todo, as it affects the public facing
> data structure for the  query-tpm command.
> 
> I understand why you're doing it though, to get rid fo the
> extra nesting, which is a hangover from earlier QAPI days
> where we couldn't cope with flat unions.
> 
> Instead of changing TpmTypeOptions, you'll need to introduce
> a new TpmTypeCreateOptions that eliminates the wrapping, and
> use that in the CLI creation path, leaving the query-tpm
> command unchanged.


Well, it makes the diffstat less favourable, but how about this (I'm
also assuming I don't need to wrapper the new mssim options)?

James

---

 backends/tpm/tpm_emulator.c    | 24 ++++-----
 backends/tpm/tpm_passthrough.c | 27 +++-------
 include/sysemu/tpm.h           |  4 +-
 include/sysemu/tpm_backend.h   |  2 +-
 qapi/tpm.json                  | 19 +++++++
 softmmu/tpm.c                  | 90 ++++++++++++++--------------------
 softmmu/vl.c                   | 19 +------
 7 files changed, 76 insertions(+), 109 deletions(-)

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
index 5a2f74db1b..f9771eaf1f 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -252,23 +252,11 @@ static int tpm_passthrough_open_sysfs_cancel(TPMPassthruState *tpm_pt)
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
+static TPMBackend *tpm_passthrough_create(TpmCreateOptions *tco)
 {
     Object *obj = object_new(TYPE_TPM_PASSTHROUGH);
 
-    if (tpm_passthrough_handle_device_opts(TPM_PASSTHROUGH(obj), opts)) {
+    if (tpm_passthrough_handle_device_opts(TPM_PASSTHROUGH(obj), tco)) {
         object_unref(obj);
         return NULL;
     }
@@ -321,8 +309,8 @@ static TpmTypeOptions *tpm_passthrough_get_tpm_options(TPMBackend *tb)
     TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
 
     options->type = TPM_TYPE_PASSTHROUGH;
-    options->u.passthrough.data = QAPI_CLONE(TPMPassthroughOptions,
-                                             TPM_PASSTHROUGH(tb)->options);
+
+    options->u.passthrough.data = QAPI_CLONE(TPMPassthroughOptions, TPM_PASSTHROUGH(tb)->options);
 
     return options;
 }
@@ -346,7 +334,6 @@ static void tpm_passthrough_inst_init(Object *obj)
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
index 578563f05a..699c46d3ae 100644
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
+        return;
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



