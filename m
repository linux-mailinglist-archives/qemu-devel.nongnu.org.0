Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6484D408C36
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:14:55 +0200 (CEST)
Received: from localhost ([::1]:36238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlnS-0000C0-56
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFR-0000EV-Rv
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFP-0000ec-1N
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GE21MWchKAKyY3X8bA98WuOECsHZ9lMgAEqip7yZf/c=;
 b=FxAQiehxaNwLhfxlwHJ4dzUGCUwZyFcMKZjw4iugcGHNH8IwKYvTNzWiTj72b9ldz8gsjA
 G9DbbRbaW3j9+SldN+Dy6aUIVZCMDWyc+cLtLsyVNuEjuOrM71YOkXlOSiashVFzHuoajI
 vAHefPoUUt03Px/Y/wBxZG72SpLnJYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-FPi9SC2DN4W0W1rn-C49rA-1; Mon, 13 Sep 2021 08:39:39 -0400
X-MC-Unique: FPi9SC2DN4W0W1rn-C49rA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 207831018722;
 Mon, 13 Sep 2021 12:39:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF5DE60CC9;
 Mon, 13 Sep 2021 12:39:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1BB1D1138529; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/22] qapi: Convert simple union TpmTypeOptions to flat one
Date: Mon, 13 Sep 2021 14:39:15 +0200
Message-Id: <20210913123932.3306639-6-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jsnow@redhat.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 eblake@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

To prepare for their removal, convert simple union TpmTypeOptions to
an equivalent flat one, with existing enum TpmType replacing implicit
enum TpmTypeOptionsKind.  Adds some boilerplate to the schema, which
is a bit ugly, but a lot easier to maintain than the simple union
feature.

Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/tpm.json                  | 24 ++++++++++++++++++++++--
 backends/tpm/tpm_emulator.c    |  2 +-
 backends/tpm/tpm_passthrough.c |  2 +-
 monitor/hmp-cmds.c             |  8 ++++----
 4 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/qapi/tpm.json b/qapi/tpm.json
index f4dde2f646..b3ade008bf 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -99,6 +99,24 @@
 { 'struct': 'TPMEmulatorOptions', 'data': { 'chardev' : 'str' },
   'if': 'CONFIG_TPM' }
 
+##
+# @TPMPassthroughOptionsWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'TPMPassthroughOptionsWrapper',
+  'data': { 'data': 'TPMPassthroughOptions' },
+  'if': 'CONFIG_TPM' }
+
+##
+# @TPMEmulatorOptionsWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'TPMEmulatorOptionsWrapper',
+  'data': { 'data': 'TPMEmulatorOptions' },
+  'if': 'CONFIG_TPM' }
+
 ##
 # @TpmTypeOptions:
 #
@@ -110,8 +128,10 @@
 # Since: 1.5
 ##
 { 'union': 'TpmTypeOptions',
-   'data': { 'passthrough' : 'TPMPassthroughOptions',
-             'emulator': 'TPMEmulatorOptions' },
+  'base': { 'type': 'TpmType' },
+  'discriminator': 'type',
+   'data': { 'passthrough' : 'TPMPassthroughOptionsWrapper',
+             'emulator': 'TPMEmulatorOptionsWrapper' },
   'if': 'CONFIG_TPM' }
 
 ##
diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index f8095d23d5..87d061e9bb 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -623,7 +623,7 @@ static TpmTypeOptions *tpm_emulator_get_tpm_options(TPMBackend *tb)
     TPMEmulator *tpm_emu = TPM_EMULATOR(tb);
     TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
 
-    options->type = TPM_TYPE_OPTIONS_KIND_EMULATOR;
+    options->type = TPM_TYPE_EMULATOR;
     options->u.emulator.data = QAPI_CLONE(TPMEmulatorOptions, tpm_emu->options);
 
     return options;
diff --git a/backends/tpm/tpm_passthrough.c b/backends/tpm/tpm_passthrough.c
index 21b7459183..d5558fae6c 100644
--- a/backends/tpm/tpm_passthrough.c
+++ b/backends/tpm/tpm_passthrough.c
@@ -321,7 +321,7 @@ static TpmTypeOptions *tpm_passthrough_get_tpm_options(TPMBackend *tb)
 {
     TpmTypeOptions *options = g_new0(TpmTypeOptions, 1);
 
-    options->type = TPM_TYPE_OPTIONS_KIND_PASSTHROUGH;
+    options->type = TPM_TYPE_PASSTHROUGH;
     options->u.passthrough.data = QAPI_CLONE(TPMPassthroughOptions,
                                              TPM_PASSTHROUGH(tb)->options);
 
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index e00255f7ee..d6858407ad 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -925,10 +925,10 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
                        c, TpmModel_str(ti->model));
 
         monitor_printf(mon, "  \\ %s: type=%s",
-                       ti->id, TpmTypeOptionsKind_str(ti->options->type));
+                       ti->id, TpmType_str(ti->options->type));
 
         switch (ti->options->type) {
-        case TPM_TYPE_OPTIONS_KIND_PASSTHROUGH:
+        case TPM_TYPE_PASSTHROUGH:
             tpo = ti->options->u.passthrough.data;
             monitor_printf(mon, "%s%s%s%s",
                            tpo->has_path ? ",path=" : "",
@@ -936,11 +936,11 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
                            tpo->has_cancel_path ? ",cancel-path=" : "",
                            tpo->has_cancel_path ? tpo->cancel_path : "");
             break;
-        case TPM_TYPE_OPTIONS_KIND_EMULATOR:
+        case TPM_TYPE_EMULATOR:
             teo = ti->options->u.emulator.data;
             monitor_printf(mon, ",chardev=%s", teo->chardev);
             break;
-        case TPM_TYPE_OPTIONS_KIND__MAX:
+        case TPM_TYPE__MAX:
             break;
         }
         monitor_printf(mon, "\n");
-- 
2.31.1


