Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C53411F13A
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 10:51:44 +0100 (CET)
Received: from localhost ([::1]:57776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ig45P-0001wP-71
	for lists+qemu-devel@lfdr.de; Sat, 14 Dec 2019 04:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51913)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ig3zr-0004ek-J6
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:46:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ig3zo-00055T-SE
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:45:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56450
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ig3zo-0004z3-2T
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576316753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjihPKr7LPtpeVUyD1Ywx5iZuUUmd9Xf4ZGxJ7BU3l4=;
 b=Es3XfLgWINhFClJM0OMNP+OByw6QJ1qid/ek4lSHYRVChsMgHL9Qwd1yp+T6Kes0Ttofez
 QDVruPY77xDlNeVZE03OZ/scQLuUPuUOP0cM219soEnL7TnO2Gs75lruulKNabhA6yIdTy
 jCYmZo3+Ig0tvFyrekjhWTgLmFWLIzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-zrqgrOdGP2KfnOT_1cEaxg-1; Sat, 14 Dec 2019 04:45:49 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE9971800D63;
 Sat, 14 Dec 2019 09:45:48 +0000 (UTC)
Received: from localhost (ovpn-116-90.ams2.redhat.com [10.36.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 11C5260BF3;
 Sat, 14 Dec 2019 09:45:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 04/16] s390x: Move reset normal to shared reset handler
Date: Sat, 14 Dec 2019 10:45:14 +0100
Message-Id: <20191214094526.8698-5-cohuck@redhat.com>
In-Reply-To: <20191214094526.8698-1-cohuck@redhat.com>
References: <20191214094526.8698-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: zrqgrOdGP2KfnOT_1cEaxg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janosch Frank <frankja@linux.ibm.com>

Let's start moving the cpu reset functions into a single function with
a switch/case, so we can later use fallthroughs and share more code
between resets.

This patch introduces the reset function by renaming cpu_reset().

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20191127175046.4911-3-frankja@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu-qom.h |  6 +++++-
 target/s390x/cpu.c     | 19 +++++++++++++------
 target/s390x/cpu.h     |  2 +-
 target/s390x/sigp.c    |  2 +-
 4 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index b809ec8418e0..f3b71bac67c9 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -34,6 +34,10 @@
 typedef struct S390CPUModel S390CPUModel;
 typedef struct S390CPUDef S390CPUDef;
=20
+typedef enum cpu_reset_type {
+    S390_CPU_RESET_NORMAL,
+} cpu_reset_type;
+
 /**
  * S390CPUClass:
  * @parent_realize: The parent class' realize handler.
@@ -57,7 +61,7 @@ typedef struct S390CPUClass {
     DeviceRealize parent_realize;
     void (*parent_reset)(CPUState *cpu);
     void (*load_normal)(CPUState *cpu);
-    void (*cpu_reset)(CPUState *cpu);
+    void (*reset)(CPUState *cpu, cpu_reset_type type);
     void (*initial_cpu_reset)(CPUState *cpu);
 } S390CPUClass;
=20
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 3abe7e80fd0a..67d6fbfa4401 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -82,18 +82,25 @@ static void s390_cpu_load_normal(CPUState *s)
 }
 #endif
=20
-/* S390CPUClass::cpu_reset() */
-static void s390_cpu_reset(CPUState *s)
+/* S390CPUClass::reset() */
+static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
 {
     S390CPU *cpu =3D S390_CPU(s);
     S390CPUClass *scc =3D S390_CPU_GET_CLASS(cpu);
     CPUS390XState *env =3D &cpu->env;
=20
-    env->pfault_token =3D -1UL;
-    env->bpbc =3D false;
     scc->parent_reset(s);
     cpu->env.sigp_order =3D 0;
     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
+
+    switch (type) {
+    case S390_CPU_RESET_NORMAL:
+        env->pfault_token =3D -1UL;
+        env->bpbc =3D false;
+        break;
+    default:
+        g_assert_not_reached();
+    }
 }
=20
 /* S390CPUClass::initial_reset() */
@@ -102,7 +109,7 @@ static void s390_cpu_initial_reset(CPUState *s)
     S390CPU *cpu =3D S390_CPU(s);
     CPUS390XState *env =3D &cpu->env;
=20
-    s390_cpu_reset(s);
+    s390_cpu_reset(s, S390_CPU_RESET_NORMAL);
     /* initial reset does not clear everything! */
     memset(&env->start_initial_reset_fields, 0,
         offsetof(CPUS390XState, end_reset_fields) -
@@ -473,7 +480,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *=
data)
 #if !defined(CONFIG_USER_ONLY)
     scc->load_normal =3D s390_cpu_load_normal;
 #endif
-    scc->cpu_reset =3D s390_cpu_reset;
+    scc->reset =3D s390_cpu_reset;
     scc->initial_cpu_reset =3D s390_cpu_initial_reset;
     cc->reset =3D s390_cpu_full_reset;
     cc->class_by_name =3D s390_cpu_class_by_name,
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 17460ed7b381..18123dfd5bd1 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -741,7 +741,7 @@ static inline void s390_do_cpu_reset(CPUState *cs, run_=
on_cpu_data arg)
 {
     S390CPUClass *scc =3D S390_CPU_GET_CLASS(cs);
=20
-    scc->cpu_reset(cs);
+    scc->reset(cs, S390_CPU_RESET_NORMAL);
 }
=20
 static inline void s390_do_cpu_initial_reset(CPUState *cs, run_on_cpu_data=
 arg)
diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
index 2ce22d4dc18b..850139b9cd54 100644
--- a/target/s390x/sigp.c
+++ b/target/s390x/sigp.c
@@ -266,7 +266,7 @@ static void sigp_cpu_reset(CPUState *cs, run_on_cpu_dat=
a arg)
     SigpInfo *si =3D arg.host_ptr;
=20
     cpu_synchronize_state(cs);
-    scc->cpu_reset(cs);
+    scc->reset(cs, S390_CPU_RESET_NORMAL);
     cpu_synchronize_post_reset(cs);
     si->cc =3D SIGP_CC_ORDER_CODE_ACCEPTED;
 }
--=20
2.21.0


