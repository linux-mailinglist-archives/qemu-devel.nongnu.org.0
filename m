Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB8333DA70
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:14:57 +0100 (CET)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDHT-00051P-Bk
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:14:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMCvz-0006Cg-Lk
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lMCvv-0008Ej-04
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615913558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PM/JR32ioiF3bRUl3cBtT+rAACkGZEVhxuLKDT7VpsI=;
 b=QLjyNI1E4f0PrGwxxglvQtMwabLEq023iusq5AmJ3W3LaZdFgcMBqUvdztEs5r8JJRc518
 XSLcUcmLgx4NDZaAt6pzuIXreDFCcRjv9kh4rY2vfciIlMjzAE/xjJNqewhaOTQdnNlnDP
 2FPdTjPUlmHQnmP+WwVj74629yAYDyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-jien54ovM-iscb7lZ_N-KA-1; Tue, 16 Mar 2021 12:52:34 -0400
X-MC-Unique: jien54ovM-iscb7lZ_N-KA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 895291054F93;
 Tue, 16 Mar 2021 16:52:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 338245D71D;
 Tue, 16 Mar 2021 16:52:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AFC0B1132C14; Tue, 16 Mar 2021 17:52:31 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/11] qemu-options: New -compat to set policy for deprecated
 interfaces
Date: Tue, 16 Mar 2021 17:52:22 +0100
Message-Id: <20210316165231.3910842-3-armbru@redhat.com>
In-Reply-To: <20210316165231.3910842-1-armbru@redhat.com>
References: <20210316165231.3910842-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New option -compat lets you configure what to do when deprecated
interfaces get used.  This is intended for testing users of the
management interfaces.  It is experimental.

-compat deprecated-input=<input-policy> configures what to do when
deprecated input is received.  Input policy can be "accept" (accept
silently), or "reject" (reject the request with an error).

-compat deprecated-output=<out-policy> configures what to do when
deprecated output is sent.  Output policy can be "accept" (pass on
unchanged), or "hide" (filter out the deprecated parts).

Default is "accept".  Policies other than "accept" are implemented
later in this series.

For now, -compat covers only syntactic aspects of QMP, i.e. stuff
tagged with feature 'deprecated'.  We may want to extend it to cover
semantic aspects, CLI, and experimental features.

Note that there is no good way for management application to detect
presence of -compat: it's not visible output of query-qmp-schema or
query-command-line-options.  Tolerable, because it's meant for
testing.  If running with -compat fails, skip the test.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210312153210.2810514-2-armbru@redhat.com>
[Since: comments in qapi/compat.json fixed up]
---
 qapi/compat.json             | 51 ++++++++++++++++++++++++++++++++++++
 qapi/qapi-schema.json        |  1 +
 include/qapi/compat-policy.h | 20 ++++++++++++++
 qapi/qmp-dispatch.c          |  3 +++
 softmmu/vl.c                 | 17 ++++++++++++
 qapi/meson.build             |  1 +
 qemu-options.hx              | 20 ++++++++++++++
 7 files changed, 113 insertions(+)
 create mode 100644 qapi/compat.json
 create mode 100644 include/qapi/compat-policy.h

diff --git a/qapi/compat.json b/qapi/compat.json
new file mode 100644
index 0000000000..fc24a58a9e
--- /dev/null
+++ b/qapi/compat.json
@@ -0,0 +1,51 @@
+# -*- Mode: Python -*-
+
+##
+# = Compatibility policy
+##
+
+##
+# @CompatPolicyInput:
+#
+# Policy for handling "funny" input.
+#
+# @accept: Accept silently
+# @reject: Reject with an error
+#
+# Since: 6.0
+##
+{ 'enum': 'CompatPolicyInput',
+  'data': [ 'accept', 'reject' ] }
+
+##
+# @CompatPolicyOutput:
+#
+# Policy for handling "funny" output.
+#
+# @accept: Pass on unchanged
+# @hide: Filter out
+#
+# Since: 6.0
+##
+{ 'enum': 'CompatPolicyOutput',
+  'data': [ 'accept', 'hide' ] }
+
+##
+# @CompatPolicy:
+#
+# Policy for handling deprecated management interfaces.
+#
+# This is intended for testing users of the management interfaces.
+#
+# Limitation: covers only syntactic aspects of QMP, i.e. stuff tagged
+# with feature 'deprecated'.  We may want to extend it to cover
+# semantic aspects, CLI, and experimental features.
+#
+# @deprecated-input: how to handle deprecated input (default 'accept')
+# @deprecated-output: how to handle deprecated output (default 'accept')
+#
+# Since: 6.0
+##
+{ 'struct': 'CompatPolicy',
+  'data': { '*deprecated-input': 'CompatPolicyInput',
+            '*deprecated-output': 'CompatPolicyOutput' } }
diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
index 3441c9a9ae..4912b9744e 100644
--- a/qapi/qapi-schema.json
+++ b/qapi/qapi-schema.json
@@ -79,6 +79,7 @@
 { 'include': 'migration.json' }
 { 'include': 'transaction.json' }
 { 'include': 'trace.json' }
+{ 'include': 'compat.json' }
 { 'include': 'control.json' }
 { 'include': 'introspect.json' }
 { 'include': 'qom.json' }
diff --git a/include/qapi/compat-policy.h b/include/qapi/compat-policy.h
new file mode 100644
index 0000000000..b8c6638156
--- /dev/null
+++ b/include/qapi/compat-policy.h
@@ -0,0 +1,20 @@
+/*
+ * Policy for handling "funny" management interfaces
+ *
+ * Copyright (C) 2020 Red Hat, Inc.
+ *
+ * Authors:
+ *  Markus Armbruster <armbru@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef QAPI_COMPAT_POLICY_H
+#define QAPI_COMPAT_POLICY_H
+
+#include "qapi/qapi-types-compat.h"
+
+extern CompatPolicy compat_policy;
+
+#endif
diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
index 0a2b20a4e4..45090f881a 100644
--- a/qapi/qmp-dispatch.c
+++ b/qapi/qmp-dispatch.c
@@ -14,6 +14,7 @@
 #include "qemu/osdep.h"
 
 #include "block/aio.h"
+#include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/dispatch.h"
 #include "qapi/qmp/qdict.h"
@@ -23,6 +24,8 @@
 #include "qemu/coroutine.h"
 #include "qemu/main-loop.h"
 
+CompatPolicy compat_policy;
+
 static QDict *qmp_dispatch_check_obj(QDict *dict, bool allow_oob,
                                      Error **errp)
 {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index b7673b9613..4c53b2940c 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -29,6 +29,7 @@
 #include "exec/cpu-common.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
+#include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu-version.h"
@@ -113,6 +114,7 @@
 #include "sysemu/replay.h"
 #include "qapi/qapi-events-run-state.h"
 #include "qapi/qapi-visit-block-core.h"
+#include "qapi/qapi-visit-compat.h"
 #include "qapi/qapi-visit-ui.h"
 #include "qapi/qapi-commands-block-core.h"
 #include "qapi/qapi-commands-migration.h"
@@ -3413,6 +3415,21 @@ void qemu_init(int argc, char **argv, char **envp)
                 enable_mlock = qemu_opt_get_bool(opts, "mem-lock", false);
                 enable_cpu_pm = qemu_opt_get_bool(opts, "cpu-pm", false);
                 break;
+            case QEMU_OPTION_compat:
+                {
+                    CompatPolicy *opts;
+                    Visitor *v;
+
+                    v = qobject_input_visitor_new_str(optarg, NULL,
+                                                      &error_fatal);
+
+                    visit_type_CompatPolicy(v, NULL, &opts, &error_fatal);
+                    QAPI_CLONE_MEMBERS(CompatPolicy, &compat_policy, opts);
+
+                    qapi_free_CompatPolicy(opts);
+                    visit_free(v);
+                    break;
+                }
             case QEMU_OPTION_msg:
                 opts = qemu_opts_parse_noisily(qemu_find_opts("msg"), optarg,
                                                false);
diff --git a/qapi/meson.build b/qapi/meson.build
index fcb15a78f1..376f4ceafe 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -24,6 +24,7 @@ qapi_all_modules = [
   'block-export',
   'char',
   'common',
+  'compat',
   'control',
   'crypto',
   'dump',
diff --git a/qemu-options.hx b/qemu-options.hx
index 622d3bfa5a..f34d592eb1 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3470,6 +3470,26 @@ DEFHEADING()
 
 DEFHEADING(Debug/Expert options:)
 
+DEF("compat", HAS_ARG, QEMU_OPTION_compat,
+    "-compat [deprecated-input=accept|reject][,deprecated-output=accept|hide]\n"
+    "                Policy for handling deprecated management interfaces\n",
+    QEMU_ARCH_ALL)
+SRST
+``-compat [deprecated-input=@var{input-policy}][,deprecated-output=@var{output-policy}]``
+    Set policy for handling deprecated management interfaces (experimental):
+
+    ``deprecated-input=accept`` (default)
+        Accept deprecated commands and arguments
+    ``deprecated-input=reject``
+        Reject deprecated commands and arguments
+    ``deprecated-output=accept`` (default)
+        Emit deprecated command results and events
+    ``deprecated-output=hide``
+        Suppress deprecated command results and events
+
+    Limitation: covers only syntactic aspects of QMP.
+ERST
+
 DEF("fw_cfg", HAS_ARG, QEMU_OPTION_fwcfg,
     "-fw_cfg [name=]<name>,file=<file>\n"
     "                add named fw_cfg entry with contents from file\n"
-- 
2.26.2


