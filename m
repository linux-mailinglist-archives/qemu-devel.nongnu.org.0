Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CE32B0C41
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:05:37 +0100 (CET)
Received: from localhost ([::1]:60508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGyW-0006qu-3X
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:05:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsq-00018z-0m
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsi-0000l8-Ru
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/YfDeWEKfxnOfqzTNmbt0iCSJjBpcio8N+uDvPxTDI=;
 b=jGuHpKgbCb7gsZ3MJNj3EOELP7OVAch/0ZsJz2PI7v6eEcEp/PXA2BgryZuaH/Rc5zcClx
 13zGGHFe+ovyV9l1I9esl9VRrA1/c3TUxyvDXivWmwqGtoU9E+yS5I+SZ/A5gn4SFxE3OS
 qx95qjo7j4Mn0PaJ0lvYubfA51zWIy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-zt1085Q2Mqec9s4cJfFfxw-1; Thu, 12 Nov 2020 12:59:34 -0500
X-MC-Unique: zt1085Q2Mqec9s4cJfFfxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 457AB8031F9
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:32 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5E611002C1A;
 Thu, 12 Nov 2020 17:59:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/13] char: Add qemu_chr_parse_cli_dict/str()
Date: Thu, 12 Nov 2020 18:58:59 +0100
Message-Id: <20201112175905.404472-8-kwolf@redhat.com>
In-Reply-To: <20201112175905.404472-1-kwolf@redhat.com>
References: <20201112175905.404472-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a function that parses a command line definition of a
character device into ChardevOptions, which can then be passed to
qemu_chr_new_cli().

You can start both from a string (for actual CLI) or from a QDict, which
is not only the intermediate representation after calling the keyval
parser, but also what HMP handlers receive.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/chardev/char.h | 30 ++++++++++++++++++++++++++++
 chardev/char.c         | 45 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index c0944f5828..5cd46207f6 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -94,6 +94,36 @@ Chardev *qemu_chr_new_from_opts(QemuOpts *opts,
  */
 Chardev *qemu_chr_new_cli(ChardevOptions *options, Error **errp);
 
+/**
+ * qemu_chr_parse_cli_dict:
+ * @args: Options defining a new character device
+ * @help: true if help should be printed instead of returning ChardevOptions
+ *
+ * Parses the given command line option QDict into ChardevOptions, using
+ * qemu_chr_translate_legacy_options() to maintain compatibility with
+ * legacy command line syntax.
+ *
+ * Returns: On successful conversion, a ChardevOptions object containing the
+ * requested options. NULL and @errp is unchanged if help was requested and
+ * printed. NULL and @errp is set in error cases.
+ */
+ChardevOptions *qemu_chr_parse_cli_dict(QDict *args, bool help,
+                                        Error **errp);
+
+/**
+ * qemu_chr_parse_cli_str:
+ * @optarg: Command line argument defining a new character device
+ *
+ * Parses the given command line option into ChardevOptions, using
+ * qemu_chr_translate_legacy_options() to maintain compatibility with
+ * legacy command line syntax.
+ *
+ * Returns: On successful conversion, a ChardevOptions object containing the
+ * requested options. NULL and @errp is unchanged if help was requested and
+ * printed. NULL and @errp is set in error cases.
+ */
+ChardevOptions *qemu_chr_parse_cli_str(const char *optarg, Error **errp);
+
 /**
  * qemu_chr_translate_legacy_options:
  * @args: Character device creation options as returned by the keyval parser
diff --git a/chardev/char.c b/chardev/char.c
index 99feaae275..a5d6be9dc8 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -32,8 +32,10 @@
 #include "chardev/char.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-char.h"
+#include "qapi/qapi-visit-char.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
+#include "qapi/qobject-input-visitor.h"
 #include "sysemu/replay.h"
 #include "qemu/help_option.h"
 #include "qemu/module.h"
@@ -1106,6 +1108,49 @@ Chardev *qemu_chr_new_cli(ChardevOptions *options, Error **errp)
     return chardev_new_qapi(options->id, options->backend, errp);
 }
 
+ChardevOptions *qemu_chr_parse_cli_dict(QDict *args, bool help,
+                                        Error **errp)
+{
+    Visitor *v;
+    ChardevOptions *chr_options;
+
+    qemu_chr_translate_legacy_options(args);
+
+    if (help) {
+        if (qdict_haskey(args, "type")) {
+            /* TODO Print help based on the QAPI schema */
+            qemu_opts_print_help(&qemu_chardev_opts, true);
+        } else {
+            qemu_chr_print_types();
+        }
+        return NULL;
+    }
+
+    v = qobject_input_visitor_new_keyval(QOBJECT(args));
+    visit_type_ChardevOptions(v, NULL, &chr_options, errp);
+    visit_free(v);
+
+    return chr_options;
+}
+
+ChardevOptions *qemu_chr_parse_cli_str(const char *optarg, Error **errp)
+{
+    ERRP_GUARD();
+    QDict *args;
+    ChardevOptions *chr_options;
+    bool help;
+
+    args = keyval_parse(optarg, "backend", &help, errp);
+    if (!args) {
+        return NULL;
+    }
+
+    chr_options = qemu_chr_parse_cli_dict(args, help, errp);
+    qobject_unref(args);
+
+    return chr_options;
+}
+
 ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
                                   Error **errp)
 {
-- 
2.28.0


