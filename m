Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB4811F139
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 10:51:41 +0100 (CET)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ig45M-0001qK-37
	for lists+qemu-devel@lfdr.de; Sat, 14 Dec 2019 04:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ig3zt-0004gX-7j
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:46:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ig3zr-0005CI-M8
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:46:01 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60803
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ig3zq-00058e-IS
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 04:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576316757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3nzSX4Eik3KjtGJOW7//s0suSjmGjAvzRFJ0ah76MqM=;
 b=NHLGGDf0w/LtfFvu0q+ypDHpy9K39LMvAegu8hPm7McPFs6mngRyeK73y2FIv9/5y/+/8o
 0ed1IlAY5cjzRSV/HFEBkm0DdRJv1DDKVg8esz9/kl02PY6KbfQbfhp4uk9MEQ/usaLu1t
 U/puJ3GPDjTvn8OP7Z7pIuY4vKh8cLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-DE2GxzKHPY23VjyfP3r7sw-1; Sat, 14 Dec 2019 04:45:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D72A91800D63;
 Sat, 14 Dec 2019 09:45:52 +0000 (UTC)
Received: from localhost (ovpn-116-90.ams2.redhat.com [10.36.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78DD960BF3;
 Sat, 14 Dec 2019 09:45:52 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 06/16] s390x: Move clear reset
Date: Sat, 14 Dec 2019 10:45:16 +0100
Message-Id: <20191214094526.8698-7-cohuck@redhat.com>
In-Reply-To: <20191214094526.8698-1-cohuck@redhat.com>
References: <20191214094526.8698-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: DE2GxzKHPY23VjyfP3r7sw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

Let's also move the clear reset function into the reset handler.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Message-Id: <20191127175046.4911-5-frankja@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/cpu-qom.h |  1 +
 target/s390x/cpu.c     | 58 +++++++++++++-----------------------------
 2 files changed, 18 insertions(+), 41 deletions(-)

diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index 6f0a12042ed4..dbe5346ec901 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -37,6 +37,7 @@ typedef struct S390CPUDef S390CPUDef;
 typedef enum cpu_reset_type {
     S390_CPU_RESET_NORMAL,
     S390_CPU_RESET_INITIAL,
+    S390_CPU_RESET_CLEAR,
 } cpu_reset_type;
=20
 /**
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index ca62fe768569..bd39cb54b7aa 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -94,6 +94,9 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type ty=
pe)
     s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
=20
     switch (type) {
+    case S390_CPU_RESET_CLEAR:
+        memset(env, 0, offsetof(CPUS390XState, start_initial_reset_fields)=
);
+        /* fall through */
     case S390_CPU_RESET_INITIAL:
         /* initial reset does not clear everything! */
         memset(&env->start_initial_reset_fields, 0,
@@ -107,6 +110,14 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type=
 type)
         env->cregs[0] =3D CR0_RESET;
         env->cregs[14] =3D CR14_RESET;
=20
+#if defined(CONFIG_USER_ONLY)
+        /* user mode should always be allowed to use the full FPU */
+        env->cregs[0] |=3D CR0_AFP;
+        if (s390_has_feat(S390_FEAT_VECTOR)) {
+            env->cregs[0] |=3D CR0_VECTOR;
+        }
+#endif
+
         /* tininess for underflow is detected before rounding */
         set_float_detect_tininess(float_tininess_before_rounding,
                                   &env->fpu_status);
@@ -125,46 +136,6 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type=
 type)
     }
 }
=20
-/* CPUClass:reset() */
-static void s390_cpu_full_reset(CPUState *s)
-{
-    S390CPU *cpu =3D S390_CPU(s);
-    S390CPUClass *scc =3D S390_CPU_GET_CLASS(cpu);
-    CPUS390XState *env =3D &cpu->env;
-
-    scc->parent_reset(s);
-    cpu->env.sigp_order =3D 0;
-    s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
-
-    memset(env, 0, offsetof(CPUS390XState, end_reset_fields));
-
-    /* architectured initial values for CR 0 and 14 */
-    env->cregs[0] =3D CR0_RESET;
-    env->cregs[14] =3D CR14_RESET;
-
-#if defined(CONFIG_USER_ONLY)
-    /* user mode should always be allowed to use the full FPU */
-    env->cregs[0] |=3D CR0_AFP;
-    if (s390_has_feat(S390_FEAT_VECTOR)) {
-        env->cregs[0] |=3D CR0_VECTOR;
-    }
-#endif
-
-    /* architectured initial value for Breaking-Event-Address register */
-    env->gbea =3D 1;
-
-    env->pfault_token =3D -1UL;
-
-    /* tininess for underflow is detected before rounding */
-    set_float_detect_tininess(float_tininess_before_rounding,
-                              &env->fpu_status);
-
-    /* Reset state inside the kernel that we cannot access yet from QEMU. =
*/
-    if (kvm_enabled()) {
-        kvm_s390_reset_vcpu(cpu);
-    }
-}
-
 #if !defined(CONFIG_USER_ONLY)
 static void s390_cpu_machine_reset_cb(void *opaque)
 {
@@ -456,6 +427,11 @@ static Property s390x_cpu_properties[] =3D {
     DEFINE_PROP_END_OF_LIST()
 };
=20
+static void s390_cpu_reset_full(CPUState *s)
+{
+    return s390_cpu_reset(s, S390_CPU_RESET_CLEAR);
+}
+
 static void s390_cpu_class_init(ObjectClass *oc, void *data)
 {
     S390CPUClass *scc =3D S390_CPU_CLASS(oc);
@@ -472,7 +448,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *=
data)
     scc->load_normal =3D s390_cpu_load_normal;
 #endif
     scc->reset =3D s390_cpu_reset;
-    cc->reset =3D s390_cpu_full_reset;
+    cc->reset =3D s390_cpu_reset_full;
     cc->class_by_name =3D s390_cpu_class_by_name,
     cc->has_work =3D s390_cpu_has_work;
 #ifdef CONFIG_TCG
--=20
2.21.0


