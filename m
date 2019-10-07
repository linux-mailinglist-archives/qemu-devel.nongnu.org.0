Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA166CE574
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Oct 2019 16:39:24 +0200 (CEST)
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHUAV-0005zl-DD
	for lists+qemu-devel@lfdr.de; Mon, 07 Oct 2019 10:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iHU81-0003yI-BH
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iHU7z-0005QW-Rh
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:36:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37828)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iHU7z-0005Q7-JM
 for qemu-devel@nongnu.org; Mon, 07 Oct 2019 10:36:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C2FDC308FBAC
 for <qemu-devel@nongnu.org>; Mon,  7 Oct 2019 14:36:46 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-145.ams2.redhat.com
 [10.36.117.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E916360C05;
 Mon,  7 Oct 2019 14:36:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com,
	berrange@redhat.com
Subject: [PATCH v4 1/5] rcu: Add automatically released rcu_read_lock variants
Date: Mon,  7 Oct 2019 15:36:37 +0100
Message-Id: <20191007143642.301445-2-dgilbert@redhat.com>
In-Reply-To: <20191007143642.301445-1-dgilbert@redhat.com>
References: <20191007143642.301445-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Mon, 07 Oct 2019 14:36:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

RCU_READ_LOCK_GUARD() takes the rcu_read_lock and then uses glib's
g_auto infrastructure (and thus whatever the compiler's hooks are) to
release it on all exits of the block.

WITH_RCU_READ_LOCK_GUARD() is similar but is used as a wrapper for the
lock, i.e.:

   WITH_RCU_READ_LOCK_GUARD() {
       stuff under lock
   }

Note the 'unused' attribute is needed to work around clang bug:
  https://bugs.llvm.org/show_bug.cgi?id=3D43482

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 docs/devel/rcu.txt | 16 ++++++++++++++++
 include/qemu/rcu.h | 25 +++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/docs/devel/rcu.txt b/docs/devel/rcu.txt
index c84e7f42b2..d83fed2f79 100644
--- a/docs/devel/rcu.txt
+++ b/docs/devel/rcu.txt
@@ -187,6 +187,22 @@ The following APIs must be used before RCU is used i=
n a thread:
 Note that these APIs are relatively heavyweight, and should _not_ be
 nested.
=20
+Convenience macros
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Two macros are provided that automatically release the read lock at the
+end of the scope.
+
+      RCU_READ_LOCK_GUARD()
+
+         Takes the lock and will release it at the end of the block it's
+         used in.
+
+      WITH_RCU_READ_LOCK_GUARD()  { code }
+
+         Is used at the head of a block to protect the code within the b=
lock.
+
+Note that 'goto'ing out of the guarded block will also drop the lock.
=20
 DIFFERENCES WITH LINUX
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 22876d1428..9c82683e37 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -154,6 +154,31 @@ extern void call_rcu1(struct rcu_head *head, RCUCBFu=
nc *func);
       }),                                                               =
 \
       (RCUCBFunc *)g_free);
=20
+typedef void RCUReadAuto;
+static inline RCUReadAuto *rcu_read_auto_lock(void)
+{
+    rcu_read_lock();
+    /* Anything non-NULL causes the cleanup function to be called */
+    return (void *)(uintptr_t)0x1;
+}
+
+static inline void rcu_read_auto_unlock(RCUReadAuto *r)
+{
+    rcu_read_unlock();
+}
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(RCUReadAuto, rcu_read_auto_unlock)
+
+#define WITH_RCU_READ_LOCK_GUARD() \
+    WITH_RCU_READ_LOCK_GUARD_(_rcu_read_auto##__COUNTER__)
+
+#define WITH_RCU_READ_LOCK_GUARD_(var) \
+    for (g_autoptr(RCUReadAuto) var =3D rcu_read_auto_lock(); \
+        (var); rcu_read_auto_unlock(var), (var) =3D NULL)
+
+#define RCU_READ_LOCK_GUARD() \
+    g_autoptr(RCUReadAuto) _rcu_read_auto __attribute__((unused)) =3D rc=
u_read_auto_lock()
+
 #ifdef __cplusplus
 }
 #endif
--=20
2.23.0


