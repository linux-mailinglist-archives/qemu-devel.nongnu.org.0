Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A402079C0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 18:58:51 +0200 (CEST)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo8ja-0002iu-Eu
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 12:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8VS-0003l4-9z
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44505
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8VB-00056c-Os
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593017035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xIH0TfRbByiUqWh7uXgafAp1hZZ1j8Oef3yzjexqbPg=;
 b=Hhbptzf756iecvMjfDMAKDaUL2i0MG+Uv0unTqAYFf7vqvCJL6tm+VxFXVqJvAvcXmK0Om
 BzDTbXujBGT2VnAuxQVDSXZZJ8Fh4NpB5U0QnJkGybMyabNdRtolY4+8xfbJztcECFjnmB
 LiDt94DoAus6g11Y6+X4TAeRu3nHKR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-N_4Me9MGPFqBP4myKVxJuA-1; Wed, 24 Jun 2020 12:43:51 -0400
X-MC-Unique: N_4Me9MGPFqBP4myKVxJuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C38D02E93;
 Wed, 24 Jun 2020 16:43:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64DDA5C66E;
 Wed, 24 Jun 2020 16:43:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 434CE1138487; Wed, 24 Jun 2020 18:43:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/46] qapi: Smooth another visitor error checking pattern
Date: Wed, 24 Jun 2020 18:43:24 +0200
Message-Id: <20200624164344.3778251-27-armbru@redhat.com>
In-Reply-To: <20200624164344.3778251-1-armbru@redhat.com>
References: <20200624164344.3778251-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert

    visit_type_FOO(v, ..., &ptr, &err);
    ...
    if (err) {
	...
    }

to

    visit_type_FOO(v, ..., &ptr, errp);
    ...
    if (!ptr) {
	...
    }

for functions that set @ptr to non-null / null on success / error.

Eliminate error_propagate() that are now unnecessary.  Delete @err
that are now unused.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 block/nfs.c          |  7 ++-----
 block/parallels.c    |  7 ++-----
 block/qcow.c         |  7 ++-----
 block/qcow2.c        |  7 ++-----
 block/qed.c          |  7 ++-----
 block/rbd.c          |  7 ++-----
 block/sheepdog.c     |  6 ++----
 block/ssh.c          |  7 ++-----
 block/vdi.c          |  7 ++-----
 block/vhdx.c         |  7 ++-----
 block/vpc.c          |  7 ++-----
 hw/acpi/core.c       |  4 ++--
 hw/block/xen-block.c |  6 ++----
 hw/core/numa.c       |  7 +++----
 monitor/monitor.c    | 21 +++++++--------------
 15 files changed, 36 insertions(+), 78 deletions(-)

diff --git a/block/nfs.c b/block/nfs.c
index b1718d125a..61a249a9fc 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -563,18 +563,15 @@ static BlockdevOptionsNfs *nfs_options_qdict_to_qapi(QDict *options,
     BlockdevOptionsNfs *opts = NULL;
     Visitor *v;
     const QDictEntry *e;
-    Error *local_err = NULL;
 
     v = qobject_input_visitor_new_flat_confused(options, errp);
     if (!v) {
         return NULL;
     }
 
-    visit_type_BlockdevOptionsNfs(v, NULL, &opts, &local_err);
+    visit_type_BlockdevOptionsNfs(v, NULL, &opts, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!opts) {
         return NULL;
     }
 
diff --git a/block/parallels.c b/block/parallels.c
index 0397f3894f..9e85ab995e 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -625,7 +625,6 @@ static int coroutine_fn parallels_co_create_opts(BlockDriver *drv,
                                                  Error **errp)
 {
     BlockdevCreateOptions *create_options = NULL;
-    Error *local_err = NULL;
     BlockDriverState *bs = NULL;
     QDict *qdict;
     Visitor *v;
@@ -668,11 +667,9 @@ static int coroutine_fn parallels_co_create_opts(BlockDriver *drv,
         goto done;
     }
 
-    visit_type_BlockdevCreateOptions(v, NULL, &create_options, &local_err);
+    visit_type_BlockdevCreateOptions(v, NULL, &create_options, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!create_options) {
         ret = -EINVAL;
         goto done;
     }
diff --git a/block/qcow.c b/block/qcow.c
index eefa3b63da..1e134f3445 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -941,7 +941,6 @@ static int coroutine_fn qcow_co_create_opts(BlockDriver *drv,
     QDict *qdict;
     Visitor *v;
     const char *val;
-    Error *local_err = NULL;
     int ret;
 
     static const QDictRenames opt_renames[] = {
@@ -993,11 +992,9 @@ static int coroutine_fn qcow_co_create_opts(BlockDriver *drv,
         goto fail;
     }
 
-    visit_type_BlockdevCreateOptions(v, NULL, &create_options, &local_err);
+    visit_type_BlockdevCreateOptions(v, NULL, &create_options, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!create_options) {
         ret = -EINVAL;
         goto fail;
     }
diff --git a/block/qcow2.c b/block/qcow2.c
index a9137a535b..9ed2396c88 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3683,7 +3683,6 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
     Visitor *v;
     BlockDriverState *bs = NULL;
     BlockDriverState *data_bs = NULL;
-    Error *local_err = NULL;
     const char *val;
     int ret;
 
@@ -3779,11 +3778,9 @@ static int coroutine_fn qcow2_co_create_opts(BlockDriver *drv,
         goto finish;
     }
 
-    visit_type_BlockdevCreateOptions(v, NULL, &create_options, &local_err);
+    visit_type_BlockdevCreateOptions(v, NULL, &create_options, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!create_options) {
         ret = -EINVAL;
         goto finish;
     }
diff --git a/block/qed.c b/block/qed.c
index e369fd360a..7fa7f880f6 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -729,7 +729,6 @@ static int coroutine_fn bdrv_qed_co_create_opts(BlockDriver *drv,
     QDict *qdict;
     Visitor *v;
     BlockDriverState *bs = NULL;
-    Error *local_err = NULL;
     int ret;
 
     static const QDictRenames opt_renames[] = {
@@ -771,11 +770,9 @@ static int coroutine_fn bdrv_qed_co_create_opts(BlockDriver *drv,
         goto fail;
     }
 
-    visit_type_BlockdevCreateOptions(v, NULL, &create_options, &local_err);
+    visit_type_BlockdevCreateOptions(v, NULL, &create_options, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!create_options) {
         ret = -EINVAL;
         goto fail;
     }
diff --git a/block/rbd.c b/block/rbd.c
index 617553b022..688074c64b 100644
--- a/block/rbd.c
+++ b/block/rbd.c
@@ -681,7 +681,6 @@ static int qemu_rbd_convert_options(QDict *options, BlockdevOptionsRbd **opts,
                                     Error **errp)
 {
     Visitor *v;
-    Error *local_err = NULL;
 
     /* Convert the remaining options into a QAPI object */
     v = qobject_input_visitor_new_flat_confused(options, errp);
@@ -689,11 +688,9 @@ static int qemu_rbd_convert_options(QDict *options, BlockdevOptionsRbd **opts,
         return -EINVAL;
     }
 
-    visit_type_BlockdevOptionsRbd(v, NULL, opts, &local_err);
+    visit_type_BlockdevOptionsRbd(v, NULL, opts, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!opts) {
         return -EINVAL;
     }
 
diff --git a/block/sheepdog.c b/block/sheepdog.c
index a6a91442c9..6c487c8322 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -2193,11 +2193,9 @@ static int coroutine_fn sd_co_create_opts(BlockDriver *drv,
         goto fail;
     }
 
-    visit_type_BlockdevCreateOptions(v, NULL, &create_options, &local_err);
+    visit_type_BlockdevCreateOptions(v, NULL, &create_options, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!create_options) {
         ret = -EINVAL;
         goto fail;
     }
diff --git a/block/ssh.c b/block/ssh.c
index f00b89684a..ebe3d8b631 100644
--- a/block/ssh.c
+++ b/block/ssh.c
@@ -616,7 +616,6 @@ static BlockdevOptionsSsh *ssh_parse_options(QDict *options, Error **errp)
 {
     BlockdevOptionsSsh *result = NULL;
     QemuOpts *opts = NULL;
-    Error *local_err = NULL;
     const QDictEntry *e;
     Visitor *v;
 
@@ -636,11 +635,9 @@ static BlockdevOptionsSsh *ssh_parse_options(QDict *options, Error **errp)
         goto fail;
     }
 
-    visit_type_BlockdevOptionsSsh(v, NULL, &result, &local_err);
+    visit_type_BlockdevOptionsSsh(v, NULL, &result, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!result) {
         goto fail;
     }
 
diff --git a/block/vdi.c b/block/vdi.c
index 5fca67f52d..3a3df45f84 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -905,7 +905,6 @@ static int coroutine_fn vdi_co_create_opts(BlockDriver *drv,
     uint64_t block_size = DEFAULT_CLUSTER_SIZE;
     bool is_static = false;
     Visitor *v;
-    Error *local_err = NULL;
     int ret;
 
     /* Parse options and convert legacy syntax.
@@ -956,11 +955,9 @@ static int coroutine_fn vdi_co_create_opts(BlockDriver *drv,
         ret = -EINVAL;
         goto done;
     }
-    visit_type_BlockdevCreateOptions(v, NULL, &create_options, &local_err);
+    visit_type_BlockdevCreateOptions(v, NULL, &create_options, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!create_options) {
         ret = -EINVAL;
         goto done;
     }
diff --git a/block/vhdx.c b/block/vhdx.c
index b9ef4ff074..1f9fca837d 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2066,7 +2066,6 @@ static int coroutine_fn vhdx_co_create_opts(BlockDriver *drv,
     QDict *qdict;
     Visitor *v;
     BlockDriverState *bs = NULL;
-    Error *local_err = NULL;
     int ret;
 
     static const QDictRenames opt_renames[] = {
@@ -2107,11 +2106,9 @@ static int coroutine_fn vhdx_co_create_opts(BlockDriver *drv,
         goto fail;
     }
 
-    visit_type_BlockdevCreateOptions(v, NULL, &create_options, &local_err);
+    visit_type_BlockdevCreateOptions(v, NULL, &create_options, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!create_options) {
         ret = -EINVAL;
         goto fail;
     }
diff --git a/block/vpc.c b/block/vpc.c
index 6d8a43aed9..259d0ad2fe 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1095,7 +1095,6 @@ static int coroutine_fn vpc_co_create_opts(BlockDriver *drv,
     QDict *qdict;
     Visitor *v;
     BlockDriverState *bs = NULL;
-    Error *local_err = NULL;
     int ret;
 
     static const QDictRenames opt_renames[] = {
@@ -1134,11 +1133,9 @@ static int coroutine_fn vpc_co_create_opts(BlockDriver *drv,
         goto fail;
     }
 
-    visit_type_BlockdevCreateOptions(v, NULL, &create_options, &local_err);
+    visit_type_BlockdevCreateOptions(v, NULL, &create_options, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!create_options) {
         ret = -EINVAL;
         goto fail;
     }
diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 45cbed49ab..91ae66b806 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -249,11 +249,11 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
         Visitor *v;
 
         v = opts_visitor_new(opts);
-        visit_type_AcpiTableOptions(v, NULL, &hdrs, &err);
+        visit_type_AcpiTableOptions(v, NULL, &hdrs, errp);
         visit_free(v);
     }
 
-    if (err) {
+    if (!hdrs) {
         goto out;
     }
     if (hdrs->has_file == hdrs->has_data) {
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 6ca6f18c7b..d45758937a 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -682,11 +682,9 @@ static char *xen_block_blockdev_add(const char *id, QDict *qdict,
     trace_xen_block_blockdev_add(node_name);
 
     v = qobject_input_visitor_new(QOBJECT(qdict));
-    visit_type_BlockdevOptions(v, NULL, &options, &local_err);
+    visit_type_BlockdevOptions(v, NULL, &options, errp);
     visit_free(v);
-
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!options) {
         goto fail;
     }
 
diff --git a/hw/core/numa.c b/hw/core/numa.c
index aa8c6be210..118803a0e8 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -509,10 +509,10 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
     Error *err = NULL;
     Visitor *v = opts_visitor_new(opts);
 
-    visit_type_NumaOptions(v, NULL, &object, &err);
+    visit_type_NumaOptions(v, NULL, &object, errp);
     visit_free(v);
-    if (err) {
-        goto end;
+    if (!object) {
+        return -1;
     }
 
     /* Fix up legacy suffix-less format */
@@ -523,7 +523,6 @@ static int parse_numa(void *opaque, QemuOpts *opts, Error **errp)
 
     set_numa_options(ms, object, &err);
 
-end:
     qapi_free_NumaOptions(object);
     if (err) {
         error_propagate(errp, err);
diff --git a/monitor/monitor.c b/monitor/monitor.c
index 125494410a..47167ac2a3 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -656,25 +656,18 @@ int monitor_init_opts(QemuOpts *opts, Error **errp)
 {
     Visitor *v;
     MonitorOptions *options;
-    Error *local_err = NULL;
+    int ret;
 
     v = opts_visitor_new(opts);
-    visit_type_MonitorOptions(v, NULL, &options, &local_err);
+    visit_type_MonitorOptions(v, NULL, &options, errp);
     visit_free(v);
-
-    if (local_err) {
-        goto out;
-    }
-
-    monitor_init(options, true, &local_err);
-    qapi_free_MonitorOptions(options);
-
-out:
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!options) {
         return -1;
     }
-    return 0;
+
+    ret = monitor_init(options, true, errp);
+    qapi_free_MonitorOptions(options);
+    return ret;
 }
 
 QemuOptsList qemu_mon_opts = {
-- 
2.26.2


