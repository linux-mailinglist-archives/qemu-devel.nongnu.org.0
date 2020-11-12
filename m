Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C63F2B0C4E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:07:55 +0100 (CET)
Received: from localhost ([::1]:39726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdH0k-0001dk-Ff
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGt3-0001BY-Me
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGst-0000mO-Ni
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfPFaqFUVUEWfzka3wzZsBUp7OzkQfoFN0Ix1Zsu5EM=;
 b=WWOXcIrPtsw7mqpCnX89X6DkJWnec0J1J4Maz2XIGDTeXUag3EOU0W3WEAGnGPxkzOE2/Q
 x5pxSXLwj9vmar4NQKwiryjJOj5aOZQCRheTnWWYUPTyqf8+SbBERgCbDTEde0JD4ZCf3t
 tQESi5AoHlqtyRzWkvYWxUzRSGJJxoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-gT5xtreaNOqiEw9v34wd2A-1; Thu, 12 Nov 2020 12:59:41 -0500
X-MC-Unique: gT5xtreaNOqiEw9v34wd2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1FE3108597D
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:40 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 724561002C13;
 Thu, 12 Nov 2020 17:59:39 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/13] char: Implement qemu_chr_new_from_opts() in terms of
 QAPI
Date: Thu, 12 Nov 2020 18:59:02 +0100
Message-Id: <20201112175905.404472-11-kwolf@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Instead of having a second parser, qemu_chr_new_from_opts() uses
qemu_chr_translate_legacy_options() and qemu_chr_new_cli() now.

This switches -chardev of the system emulator to use the QAPI generated
parser rather than the hand-written QemuOpts based parser. All existing
command line options should keep working, but it gains support for
anything that was previously only supported in QMP (e.g. vsock socket
addresses).

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 chardev/char.c | 116 +++++++++++++++++++------------------------------
 1 file changed, 45 insertions(+), 71 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 3bb6a743f7..4a444a0353 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -656,70 +656,6 @@ void qemu_chr_print_types(void)
     qemu_printf("Available chardev backend types: %s\n", str->str);
 }
 
-Chardev *qemu_chr_new_from_opts(QemuOpts *opts, GMainContext *context,
-                                Error **errp)
-{
-    const ChardevClass *cc;
-    Chardev *chr = NULL;
-    ChardevBackend *backend = NULL;
-    const char *name = chardev_alias_translate(qemu_opt_get(opts, "backend"));
-    const char *id = qemu_opts_id(opts);
-    char *bid = NULL;
-
-    if (name && is_help_option(name)) {
-        qemu_chr_print_types();
-        return NULL;
-    }
-
-    if (id == NULL) {
-        error_setg(errp, "chardev: no id specified");
-        return NULL;
-    }
-
-    backend = qemu_chr_parse_opts(opts, errp);
-    if (backend == NULL) {
-        return NULL;
-    }
-
-    cc = char_get_class(name, errp);
-    if (cc == NULL) {
-        goto out;
-    }
-
-    if (qemu_opt_get_bool(opts, "mux", 0)) {
-        bid = g_strdup_printf("%s-base", id);
-    }
-
-    chr = qemu_chardev_new(bid ? bid : id,
-                           object_class_get_name(OBJECT_CLASS(cc)),
-                           backend, context, errp);
-
-    if (chr == NULL) {
-        goto out;
-    }
-
-    if (bid) {
-        Chardev *mux;
-        qapi_free_ChardevBackend(backend);
-        backend = g_new0(ChardevBackend, 1);
-        backend->type = CHARDEV_BACKEND_KIND_MUX;
-        backend->u.mux.data = g_new0(ChardevMux, 1);
-        backend->u.mux.data->chardev = g_strdup(bid);
-        mux = qemu_chardev_new(id, TYPE_CHARDEV_MUX, backend, context, errp);
-        if (mux == NULL) {
-            object_unparent(OBJECT(chr));
-            chr = NULL;
-            goto out;
-        }
-        chr = mux;
-    }
-
-out:
-    qapi_free_ChardevBackend(backend);
-    g_free(bid);
-    return chr;
-}
-
 void qemu_chr_translate_legacy_options(QDict *args)
 {
     const ChardevClass *cc;
@@ -1065,7 +1001,7 @@ Chardev *qemu_chardev_new(const char *id, const char *typename,
 }
 
 static Chardev *chardev_new_qapi(const char *id, ChardevBackend *backend,
-                                 Error **errp)
+                                 GMainContext *context, Error **errp)
 {
     const ChardevClass *cc;
 
@@ -1075,7 +1011,7 @@ static Chardev *chardev_new_qapi(const char *id, ChardevBackend *backend,
     }
 
     return chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                       backend, NULL, errp);
+                       backend, context, errp);
 }
 
 ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
@@ -1084,7 +1020,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
     ChardevReturn *ret;
     Chardev *chr;
 
-    chr = chardev_new_qapi(id, backend, errp);
+    chr = chardev_new_qapi(id, backend, NULL, errp);
     if (!chr) {
         return NULL;
     }
@@ -1098,7 +1034,9 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
     return ret;
 }
 
-Chardev *qemu_chr_new_cli(ChardevOptions *options, Error **errp)
+static Chardev *qemu_chr_new_cli_gcontext(ChardevOptions *options,
+                                          GMainContext *context,
+                                          Error **errp)
 {
     Chardev *chr;
     char *bid = NULL;
@@ -1107,7 +1045,7 @@ Chardev *qemu_chr_new_cli(ChardevOptions *options, Error **errp)
         bid = g_strdup_printf("%s-base", options->id);
     }
 
-    chr = chardev_new_qapi(bid ?: options->id, options->backend, errp);
+    chr = chardev_new_qapi(bid ?: options->id, options->backend, context, errp);
     if (!chr) {
         goto out;
     }
@@ -1122,8 +1060,8 @@ Chardev *qemu_chr_new_cli(ChardevOptions *options, Error **errp)
             .u.mux.data = &mux_data,
         };
 
-        mux = qemu_chardev_new(options->id, TYPE_CHARDEV_MUX, &backend, NULL,
-                               errp);
+        mux = qemu_chardev_new(options->id, TYPE_CHARDEV_MUX, &backend,
+                               context, errp);
         if (mux == NULL) {
             object_unparent(OBJECT(chr));
             chr = NULL;
@@ -1137,6 +1075,11 @@ out:
     return chr;
 }
 
+Chardev *qemu_chr_new_cli(ChardevOptions *options, Error **errp)
+{
+    return qemu_chr_new_cli_gcontext(options, NULL, errp);
+}
+
 ChardevOptions *qemu_chr_parse_cli_dict(QDict *args, bool help,
                                         Error **errp)
 {
@@ -1180,6 +1123,37 @@ ChardevOptions *qemu_chr_parse_cli_str(const char *optarg, Error **errp)
     return chr_options;
 }
 
+Chardev *qemu_chr_new_from_opts(QemuOpts *opts, GMainContext *context,
+                                Error **errp)
+{
+    ChardevOptions *chr_options;
+    Chardev *chr;
+    QDict *args;
+    const char *name = qemu_opt_get(opts, "backend");
+    bool help;
+
+    args = qemu_opts_to_qdict(opts, NULL);
+
+    if (name && is_help_option(name)) {
+        qdict_del(args, "backend");
+        qdict_del(args, "type");
+        help = true;
+    } else {
+        help = qemu_opt_has_help_opt(opts);
+    }
+
+    chr_options = qemu_chr_parse_cli_dict(args, help, errp);
+    qobject_unref(args);
+
+    if (!chr_options) {
+        return NULL;
+    }
+
+    chr = qemu_chr_new_cli_gcontext(chr_options, context, errp);
+    qapi_free_ChardevOptions(chr_options);
+    return chr;
+}
+
 ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
                                   Error **errp)
 {
-- 
2.28.0


