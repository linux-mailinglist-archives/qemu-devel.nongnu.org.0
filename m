Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6923A2B0C24
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:02:07 +0100 (CET)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGv8-00031J-DY
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsc-0000x0-JE
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsY-0000h3-HF
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=brrwAzckZKubYRKEL1qFF6eeSMZpOl1mirWTlSRGFgk=;
 b=I+p+SuVWuLjtrbKwNoYRnSjNZA8fJjfDaIW9Zmm5EBIikUFjxGj6Ap56Gocr0HI/5XVm18
 meTagiiHBRErYbY0MWiJGo6OQ/enM/QKEpynaYJfLRjAKWPzeM/HlsYSxNXljMUn2Z3qQ7
 KPGZmwztQzFHWnkho1xAy//uTg0XSjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-LZXVvQMOMt-knHZ4etNm8w-1; Thu, 12 Nov 2020 12:59:23 -0500
X-MC-Unique: LZXVvQMOMt-knHZ4etNm8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F059518B9EB8
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:22 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76F3D1002C1B;
 Thu, 12 Nov 2020 17:59:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/13] char: Add ChardevOptions and qemu_chr_new_cli()
Date: Thu, 12 Nov 2020 18:58:54 +0100
Message-Id: <20201112175905.404472-3-kwolf@redhat.com>
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

This provides an interface to create a chardev from a QAPI
representation of the command line.

At this point, the only difference between it and QMP chardev-add is
that it allows 'backend' to be flattened and returns a Chardev pointer.
We'll add support for mux=on and more compatibility glue to support
legacy command line syntax later.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/char.json         | 15 +++++++++++++++
 include/chardev/char.h |  9 +++++++++
 chardev/char.c         | 24 ++++++++++++++++++------
 3 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/qapi/char.json b/qapi/char.json
index 43486d1daa..14ee06a52d 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -435,6 +435,21 @@
 { 'struct' : 'ChardevReturn',
   'data': { '*pty': 'str' } }
 
+##
+# @ChardevOptions:
+#
+# Command line options for creating a character device backend
+#
+# @id: the chardev's ID, must be unique
+# @backend: backend type and parameters
+#
+# Since: 6.0
+##
+{ 'struct': 'ChardevOptions',
+  'data': { 'id': 'str',
+            'backend': 'ChardevBackend' },
+  'aliases': [ { 'source': ['backend'] } ] }
+
 ##
 # @chardev-add:
 #
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 3b91645081..54fa2ed8e2 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -85,6 +85,15 @@ Chardev *qemu_chr_new_from_opts(QemuOpts *opts,
                                 GMainContext *context,
                                 Error **errp);
 
+/**
+ * qemu_chr_new_cli:
+ * @options: Character device creation options as defined in QAPI
+ *
+ * Returns: on success: a new character backend
+ *          otherwise:  NULL; @errp specifies the error
+ */
+Chardev *qemu_chr_new_cli(ChardevOptions *options, Error **errp);
+
 /**
  * qemu_chr_parse_common:
  * @opts: the options that still need parsing
diff --git a/chardev/char.c b/chardev/char.c
index de39e2d79b..9f00e475d4 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -1037,20 +1037,27 @@ Chardev *qemu_chardev_new(const char *id, const char *typename,
     return chardev_new(id, typename, backend, gcontext, errp);
 }
 
-ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
-                               Error **errp)
+static Chardev *chardev_new_qapi(const char *id, ChardevBackend *backend,
+                                 Error **errp)
 {
     const ChardevClass *cc;
-    ChardevReturn *ret;
-    Chardev *chr;
 
     cc = char_get_class(ChardevBackendKind_str(backend->type), errp);
     if (!cc) {
         return NULL;
     }
 
-    chr = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                      backend, NULL, errp);
+    return chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
+                       backend, NULL, errp);
+}
+
+ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
+                               Error **errp)
+{
+    ChardevReturn *ret;
+    Chardev *chr;
+
+    chr = chardev_new_qapi(id, backend, errp);
     if (!chr) {
         return NULL;
     }
@@ -1064,6 +1071,11 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
     return ret;
 }
 
+Chardev *qemu_chr_new_cli(ChardevOptions *options, Error **errp)
+{
+    return chardev_new_qapi(options->id, options->backend, errp);
+}
+
 ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
                                   Error **errp)
 {
-- 
2.28.0


