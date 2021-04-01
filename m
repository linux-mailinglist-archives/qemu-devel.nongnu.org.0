Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D553514A3
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:59:28 +0200 (CEST)
Received: from localhost ([::1]:55744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvyx-00015P-1l
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:59:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvwK-0005OY-57
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lRvwH-0002WY-P2
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617278200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oMva8pidwhrff2eP7M4aCTOHQrwFVRDH+Y9qYHtBtrg=;
 b=gTgkT2uC/NGme0+z8zQPzAJMVmJj06pAwFi6XELWVp67TfVAx7l6ZkwKjT0+9keFd3TUA3
 /aZ4Em5FPXA2CpTgwyk0egHJscVLDcf7LDWq9JhTsMagDXg9yaV81lpz8pFkcZD5qew+Bj
 JPaByLyswg0+r36CDlnBWbwI/fCSDAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-pzM_-SxAP4yDi2g4qlhJoA-1; Thu, 01 Apr 2021 07:56:33 -0400
X-MC-Unique: pzM_-SxAP4yDi2g4qlhJoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E82E21853021;
 Thu,  1 Apr 2021 11:56:32 +0000 (UTC)
Received: from localhost (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7545451C3F;
 Thu,  1 Apr 2021 11:56:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 8/9] chardev: Fix yank with the chardev-change case
Date: Thu,  1 Apr 2021 15:55:31 +0400
Message-Id: <20210401115532.430961-9-marcandre.lureau@redhat.com>
In-Reply-To: <20210401115532.430961-1-marcandre.lureau@redhat.com>
References: <20210401115532.430961-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Straub <lukasstraub2@web.de>

When changing from chardev-socket (which supports yank) to
chardev-socket again, it fails, because the new chardev attempts
to register a new yank instance. This in turn fails, as there
still is the yank instance from the current chardev. Also,
the old chardev shouldn't unregister the yank instance when it
is freed.

To fix this, now the new chardev only registers a yank instance if
the current chardev doesn't support yank and thus hasn't registered
one already. Also, when the old chardev is freed, it now only
unregisters the yank instance if the new chardev doesn't need it.

If the initialization of the new chardev fails, it still has
chr->handover_yank_instance set and won't unregister the yank
instance when it is freed.

s->registered_yank is always true here, as chardev-change only works
on user-visible chardevs and those are guraranteed to register a
yank instance as they are initialized via
chardev_new()
 qemu_char_open()
  cc->open() (qmp_chardev_open_socket()).

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Li Zhang <li.zhang@cloud.ionos.com>
Message-Id: <9637888d7591d2971975188478bb707299a1dc04.1617127849.git.lukasstraub2@web.de>
---
 include/chardev/char.h |  3 +++
 chardev/char-socket.c  | 20 +++++++++++++++++---
 chardev/char.c         | 35 ++++++++++++++++++++++++++++-------
 3 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index 4181a2784a..7c0444f90d 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -65,6 +65,8 @@ struct Chardev {
     char *filename;
     int logfd;
     int be_open;
+    /* used to coordinate the chardev-change special-case: */
+    bool handover_yank_instance;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
@@ -251,6 +253,7 @@ struct ChardevClass {
     ObjectClass parent_class;
 
     bool internal; /* TODO: eventually use TYPE_USER_CREATABLE */
+    bool supports_yank;
     void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
     void (*open)(Chardev *chr, ChardevBackend *backend,
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 1d455ecca4..daa89fe5d1 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1126,7 +1126,13 @@ static void char_socket_finalize(Object *obj)
     }
     g_free(s->tls_authz);
     if (s->registered_yank) {
-        yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
+        /*
+         * In the chardev-change special-case, we shouldn't unregister the yank
+         * instance, as it still may be needed.
+         */
+        if (!chr->handover_yank_instance) {
+            yank_unregister_instance(CHARDEV_YANK_INSTANCE(chr->label));
+        }
     }
 
     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
@@ -1424,8 +1430,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }
 
-    if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)) {
-        return;
+    /*
+     * In the chardev-change special-case, we shouldn't register a new yank
+     * instance, as there already may be one.
+     */
+    if (!chr->handover_yank_instance) {
+        if (!yank_register_instance(CHARDEV_YANK_INSTANCE(chr->label), errp)) {
+            return;
+        }
     }
     s->registered_yank = true;
 
@@ -1567,6 +1579,8 @@ static void char_socket_class_init(ObjectClass *oc, void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
+    cc->supports_yank = true;
+
     cc->parse = qemu_chr_parse_socket;
     cc->open = qmp_chardev_open_socket;
     cc->chr_wait_connected = tcp_chr_wait_connected;
diff --git a/chardev/char.c b/chardev/char.c
index 75993f903f..398f09df19 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -39,6 +39,7 @@
 #include "qemu/option.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
+#include "qemu/yank.h"
 
 #include "chardev-internal.h"
 
@@ -266,6 +267,7 @@ static void char_init(Object *obj)
 {
     Chardev *chr = CHARDEV(obj);
 
+    chr->handover_yank_instance = false;
     chr->logfd = -1;
     qemu_mutex_init(&chr->chr_write_lock);
 
@@ -959,6 +961,7 @@ void qemu_chr_set_feature(Chardev *chr,
 static Chardev *chardev_new(const char *id, const char *typename,
                             ChardevBackend *backend,
                             GMainContext *gcontext,
+                            bool handover_yank_instance,
                             Error **errp)
 {
     Object *obj;
@@ -971,6 +974,7 @@ static Chardev *chardev_new(const char *id, const char *typename,
 
     obj = object_new(typename);
     chr = CHARDEV(obj);
+    chr->handover_yank_instance = handover_yank_instance;
     chr->label = g_strdup(id);
     chr->gcontext = gcontext;
 
@@ -1004,7 +1008,7 @@ Chardev *qemu_chardev_new(const char *id, const char *typename,
         id = genid;
     }
 
-    chr = chardev_new(id, typename, backend, gcontext, errp);
+    chr = chardev_new(id, typename, backend, gcontext, false, errp);
     if (!chr) {
         return NULL;
     }
@@ -1032,7 +1036,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
     }
 
     chr = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                      backend, NULL, errp);
+                      backend, NULL, false, errp);
     if (!chr) {
         return NULL;
     }
@@ -1057,9 +1061,10 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
                                   Error **errp)
 {
     CharBackend *be;
-    const ChardevClass *cc;
+    const ChardevClass *cc, *cc_new;
     Chardev *chr, *chr_new;
     bool closed_sent = false;
+    bool handover_yank_instance;
     ChardevReturn *ret;
 
     chr = qemu_chr_find(id);
@@ -1091,13 +1096,20 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
         return NULL;
     }
 
-    cc = char_get_class(ChardevBackendKind_str(backend->type), errp);
-    if (!cc) {
+    cc = CHARDEV_GET_CLASS(chr);
+    cc_new = char_get_class(ChardevBackendKind_str(backend->type), errp);
+    if (!cc_new) {
         return NULL;
     }
 
-    chr_new = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc)),
-                          backend, chr->gcontext, errp);
+    /*
+     * The new chardev should not register a yank instance if the current
+     * chardev has registered one already.
+     */
+    handover_yank_instance = cc->supports_yank && cc_new->supports_yank;
+
+    chr_new = chardev_new(id, object_class_get_name(OBJECT_CLASS(cc_new)),
+                          backend, chr->gcontext, handover_yank_instance, errp);
     if (!chr_new) {
         return NULL;
     }
@@ -1121,6 +1133,15 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
         return NULL;
     }
 
+    /* change successfull, clean up */
+    chr_new->handover_yank_instance = false;
+
+    /*
+     * When the old chardev is freed, it should not unregister the yank
+     * instance if the new chardev needs it.
+     */
+    chr->handover_yank_instance = handover_yank_instance;
+
     object_unparent(OBJECT(chr));
     object_property_add_child(get_chardevs_root(), chr_new->label,
                               OBJECT(chr_new));
-- 
2.29.0


