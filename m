Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6E7188963
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 16:47:08 +0100 (CET)
Received: from localhost ([::1]:35110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEEQt-0002tr-Gc
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 11:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jEE0q-0007Xm-36
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:20:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jEE0o-0007ps-K2
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:20:11 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:59077)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jEE0o-0007mR-ED
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 11:20:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584458410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45hdr1RxCui+Y2WN5hiOmAiGRqBnDrR3cNwNQQQEKrs=;
 b=QLbTEMEJW2y29Fx4Bbv+gcesP44C8wRYoUhvzlNPzmg9ZhrnNEUr7v0Oll/nYBrp1tZ3k8
 PHO0ZjC0J3bkxmTJMTpE2oa5B7Mp7pke7lPxFLVagR1LdIqT9JjsPthkvTMKVsdYTXRgoX
 kfDTKP572/RcF6BKOuMN7v7l0P4sig4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-1NoNgNcxNaWgFQeWDd0sog-1; Tue, 17 Mar 2020 11:20:08 -0400
X-MC-Unique: 1NoNgNcxNaWgFQeWDd0sog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4690C801E7E
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 15:20:07 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.110.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16A1D7E333;
 Tue, 17 Mar 2020 15:20:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 37/62] lockable: add QemuRecMutex support
Date: Tue, 17 Mar 2020 16:19:34 +0100
Message-Id: <1584458374-29068-4-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1584458374-29068-1-git-send-email-pbonzini@redhat.com>
References: <1584458374-29068-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The polymorphic locking macros don't support QemuRecMutex yet.  Add it
so that lock guards can be used with QemuRecMutex.

Convert TCG plugins functions that benefit from these macros.  Manual
qemu_rec_mutex_lock/unlock() callers are left unmodified in cases where
clarity would not improve by switching to the macros.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/lockable.h |  6 ++++--
 plugins/core.c          |  7 +++----
 plugins/loader.c        | 16 ++++++++--------
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
index 90342ba..1aeb2cb 100644
--- a/include/qemu/lockable.h
+++ b/include/qemu/lockable.h
@@ -50,6 +50,7 @@ qemu_make_lockable(void *x, QemuLockable *lockable)
 #define QEMU_LOCK_FUNC(x) ((QemuLockUnlockFunc *)    \
     QEMU_GENERIC(x,                                  \
                  (QemuMutex *, qemu_mutex_lock),     \
+                 (QemuRecMutex *, qemu_rec_mutex_lock), \
                  (CoMutex *, qemu_co_mutex_lock),    \
                  (QemuSpin *, qemu_spin_lock),       \
                  unknown_lock_type))
@@ -57,6 +58,7 @@ qemu_make_lockable(void *x, QemuLockable *lockable)
 #define QEMU_UNLOCK_FUNC(x) ((QemuLockUnlockFunc *)  \
     QEMU_GENERIC(x,                                  \
                  (QemuMutex *, qemu_mutex_unlock),   \
+                 (QemuRecMutex *, qemu_rec_mutex_unlock), \
                  (CoMutex *, qemu_co_mutex_unlock),  \
                  (QemuSpin *, qemu_spin_unlock),     \
                  unknown_lock_type))
@@ -73,7 +75,7 @@ qemu_make_lockable(void *x, QemuLockable *lockable)
=20
 /* QEMU_MAKE_LOCKABLE - Make a polymorphic QemuLockable
  *
- * @x: a lock object (currently one of QemuMutex, CoMutex, QemuSpin).
+ * @x: a lock object (currently one of QemuMutex, QemuRecMutex, CoMutex, Q=
emuSpin).
  *
  * Returns a QemuLockable object that can be passed around
  * to a function that can operate with locks of any kind, or
@@ -86,7 +88,7 @@ qemu_make_lockable(void *x, QemuLockable *lockable)
=20
 /* QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable
  *
- * @x: a lock object (currently one of QemuMutex, CoMutex, QemuSpin).
+ * @x: a lock object (currently one of QemuMutex, QemuRecMutex, CoMutex, Q=
emuSpin).
  *
  * Returns a QemuLockable object that can be passed around
  * to a function that can operate with locks of any kind.
diff --git a/plugins/core.c b/plugins/core.c
index ed86301..51bfc94 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -15,6 +15,7 @@
 #include "qemu/error-report.h"
 #include "qemu/config-file.h"
 #include "qapi/error.h"
+#include "qemu/lockable.h"
 #include "qemu/option.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/xxhash.h"
@@ -150,11 +151,11 @@ do_plugin_register_cb(qemu_plugin_id_t id, enum qemu_=
plugin_event ev,
 {
     struct qemu_plugin_ctx *ctx;
=20
-    qemu_rec_mutex_lock(&plugin.lock);
+    QEMU_LOCK_GUARD(&plugin.lock);
     ctx =3D plugin_id_to_ctx_locked(id);
     /* if the plugin is on its way out, ignore this request */
     if (unlikely(ctx->uninstalling)) {
-        goto out_unlock;
+        return;
     }
     if (func) {
         struct qemu_plugin_cb *cb =3D ctx->callbacks[ev];
@@ -178,8 +179,6 @@ do_plugin_register_cb(qemu_plugin_id_t id, enum qemu_pl=
ugin_event ev,
     } else {
         plugin_unregister_cb__locked(ctx, ev);
     }
- out_unlock:
-    qemu_rec_mutex_unlock(&plugin.lock);
 }
=20
 void plugin_register_cb(qemu_plugin_id_t id, enum qemu_plugin_event ev,
diff --git a/plugins/loader.c b/plugins/loader.c
index 15fc7e5..685d334 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -19,6 +19,7 @@
 #include "qemu/error-report.h"
 #include "qemu/config-file.h"
 #include "qapi/error.h"
+#include "qemu/lockable.h"
 #include "qemu/option.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/qht.h"
@@ -367,15 +368,14 @@ void plugin_reset_uninstall(qemu_plugin_id_t id,
     struct qemu_plugin_reset_data *data;
     struct qemu_plugin_ctx *ctx;
=20
-    qemu_rec_mutex_lock(&plugin.lock);
-    ctx =3D plugin_id_to_ctx_locked(id);
-    if (ctx->uninstalling || (reset && ctx->resetting)) {
-        qemu_rec_mutex_unlock(&plugin.lock);
-        return;
+    WITH_QEMU_LOCK_GUARD(&plugin.lock) {
+        ctx =3D plugin_id_to_ctx_locked(id);
+        if (ctx->uninstalling || (reset && ctx->resetting)) {
+            return;
+        }
+        ctx->resetting =3D reset;
+        ctx->uninstalling =3D !reset;
     }
-    ctx->resetting =3D reset;
-    ctx->uninstalling =3D !reset;
-    qemu_rec_mutex_unlock(&plugin.lock);
=20
     data =3D g_new(struct qemu_plugin_reset_data, 1);
     data->ctx =3D ctx;
--=20
1.8.3.1


