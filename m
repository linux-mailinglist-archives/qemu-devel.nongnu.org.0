Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A53E072F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 20:07:21 +0200 (CEST)
Received: from localhost ([::1]:60128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBLIW-0001Y3-5K
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 14:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJAZ-00013P-MZ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:51:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBJAT-0007GF-8k
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628092252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++OM8JSYhp/OQ1+9TtCCVdl3jbS36e7ieZIVj+yggi4=;
 b=ByiU9fFQkus4bZReioaVBXcGuL2HJd3Ag/jBNfeWRBgq0k/QsUfnAHrBFhxtgzcuGQUAJa
 WevdpQ6a+k60as8FjSBXDyM4j0aa6eNr2eELeF7Q10GzKB3MmVCHn36rt0rqqP0xmDDc2I
 ci297yJ5ff2UjA5JfL7GqtRDR6fYUI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-Lf5RlDpuPFOuYo52YPVPKw-1; Wed, 04 Aug 2021 11:50:50 -0400
X-MC-Unique: Lf5RlDpuPFOuYo52YPVPKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0E2100808B
 for <qemu-devel@nongnu.org>; Wed,  4 Aug 2021 15:50:50 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A5E910372DD;
 Wed,  4 Aug 2021 15:50:43 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/11] chardev: reuse qmp_chardev_new()
Date: Wed,  4 Aug 2021 19:48:48 +0400
Message-Id: <20210804154848.557328-12-marcandre.lureau@redhat.com>
In-Reply-To: <20210804154848.557328-1-marcandre.lureau@redhat.com>
References: <20210804154848.557328-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

qemu_chardev_new() and qmp_chardev_add() are similar, let's factorize
the code a bit.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 4595a8d430..3def40c914 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -1005,7 +1005,7 @@ Chardev *qemu_chardev_new(const char *id, const char *typename,
                           GMainContext *gcontext,
                           Error **errp)
 {
-    Chardev *chr;
+    g_autoptr(Chardev) chr = NULL;
     g_autofree char *genid = NULL;
 
     if (!id) {
@@ -1013,6 +1013,11 @@ Chardev *qemu_chardev_new(const char *id, const char *typename,
         id = genid;
     }
 
+    if (qemu_chr_find(id)) {
+        error_setg(errp, "Chardev with id '%s' already exists", id);
+        return NULL;
+    }
+
     chr = chardev_new(id, typename, backend, gcontext, false, errp);
     if (!chr) {
         return NULL;
@@ -1020,12 +1025,10 @@ Chardev *qemu_chardev_new(const char *id, const char *typename,
 
     if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr),
                                        errp)) {
-        object_unref(OBJECT(chr));
         return NULL;
     }
-    object_unref(OBJECT(chr));
 
-    return chr;
+    return chr; /* returns a shared/unowned reference */
 }
 
 ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
@@ -1034,29 +1037,19 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
     ERRP_GUARD();
     const ChardevClass *cc;
     ChardevReturn *ret;
-    g_autoptr(Chardev) chr = NULL;
-
-    if (qemu_chr_find(id)) {
-        error_setg(errp, "Chardev with id '%s' already exists", id);
-        return NULL;
-    }
+    Chardev *chr = NULL;
 
     cc = char_get_class(ChardevBackendKind_str(backend->type), errp);
     if (!cc) {
         goto err;
     }
 
-    chr = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                      backend, NULL, false, errp);
+    chr = qemu_chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
+                           backend, NULL, errp);
     if (!chr) {
         goto err;
     }
 
-    if (!object_property_try_add_child(get_chardevs_root(), id, OBJECT(chr),
-                                       errp)) {
-        goto err;
-    }
-
     ret = g_new0(ChardevReturn, 1);
     if (CHARDEV_IS_PTY(chr)) {
         ret->pty = g_strdup(chr->filename + 4);
-- 
2.32.0.264.g75ae10bc75


