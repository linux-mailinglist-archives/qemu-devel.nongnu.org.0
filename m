Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B054C365BB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 22:42:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49593 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYck2-0000rz-P3
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 16:42:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hYcct-0003LQ-EU
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:35:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hYccr-0007GS-H2
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:35:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33106)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hYccg-0006Wd-6D; Wed, 05 Jun 2019 16:35:05 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB8763688E;
	Wed,  5 Jun 2019 20:34:40 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-124.ams2.redhat.com [10.36.116.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31311851A;
	Wed,  5 Jun 2019 20:34:39 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 22:33:45 +0200
Message-Id: <20190605203403.29461-16-david@redhat.com>
In-Reply-To: <20190605203403.29461-1-david@redhat.com>
References: <20190605203403.29461-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 05 Jun 2019 20:34:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 15/33] s390x/tcg: Implement
 VECTOR FP CONVERT FROM FIXED 64-BIT
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1. We'll reuse op_vcdg() for similar instructions later, prepare for
   that.
2. We'll reuse vop64_2() later for other instructions.

We have to mangle the erm (effective rounding mode) and the m4 into
the simd_data(), and properly unmangle them again.

Make sure to restore the erm before triggering an exception.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  2 ++
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.inc.c | 25 ++++++++++++++++++
 target/s390x/vec_fpu_helper.c   | 47 +++++++++++++++++++++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 33d3bacf74..a60f4c49fc 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -266,6 +266,8 @@ DEF_HELPER_FLAGS_5(gvec_vfche64, TCG_CALL_NO_WG, void=
, ptr, cptr, cptr, env, i32
 DEF_HELPER_FLAGS_5(gvec_vfche64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr,=
 env, i32)
 DEF_HELPER_5(gvec_vfche64_cc, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfche64s_cc, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vcdg64, TCG_CALL_NO_WG, void, ptr, cptr, env, i3=
2)
+DEF_HELPER_FLAGS_4(gvec_vcdg64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i=
32)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 446552f251..d3386024c8 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1218,6 +1218,8 @@
     F(0xe7eb, VFCH,    VRR_c, V,   0, 0, 0, 0, vfc, 0, IF_VEC)
 /* VECTOR FP COMPARE HIGH OR EQUAL */
     F(0xe7ea, VFCHE,   VRR_c, V,   0, 0, 0, 0, vfc, 0, IF_VEC)
+/* VECTOR FP CONVERT FROM FIXED 64-BIT */
+    F(0xe7c3, VCDG,    VRR_a, V,   0, 0, 0, 0, vcdg, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 5571a71e1a..6741b707cc 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -2639,3 +2639,28 @@ static DisasJumpType op_vfc(DisasContext *s, Disas=
Ops *o)
     }
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vcdg(DisasContext *s, DisasOps *o)
+{
+    const uint8_t fpf =3D get_field(s->fields, m3);
+    const uint8_t m4 =3D get_field(s->fields, m4);
+    const uint8_t erm =3D get_field(s->fields, m5);
+    const bool se =3D extract32(m4, 3, 1);
+    gen_helper_gvec_2_ptr *fn;
+
+    if (fpf !=3D FPF_LONG || extract32(m4, 0, 2) || erm > 7 || erm =3D=3D=
 2) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    switch (s->fields->op2) {
+    case 0xc3:
+        fn =3D se ? gen_helper_gvec_vcdg64s : gen_helper_gvec_vcdg64;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    gen_gvec_2_ptr(get_field(s->fields, v1), get_field(s->fields, v2), c=
pu_env,
+                   deposit32(m4, 4, 4, erm), fn);
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.=
c
index e72500d4d5..53430c7843 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -78,6 +78,30 @@ static void handle_ieee_exc(CPUS390XState *env, uint8_=
t vxc, uint8_t vec_exc,
     }
 }
=20
+typedef uint64_t (*vop64_2_fn)(uint64_t a, float_status *s);
+static void vop64_2(S390Vector *v1, const S390Vector *v2, CPUS390XState =
*env,
+                    bool s, bool XxC, uint8_t erm, vop64_2_fn fn,
+                    uintptr_t retaddr)
+{
+    uint8_t vxc, vec_exc =3D 0;
+    S390Vector tmp =3D {};
+    int i, old_mode;
+
+    old_mode =3D s390_swap_bfp_rounding_mode(env, erm);
+    for (i =3D 0; i < 2; i++) {
+        const uint64_t a =3D s390_vec_read_element64(v2, i);
+
+        s390_vec_write_element64(&tmp, i, fn(a, &env->fpu_status));
+        vxc =3D check_ieee_exc(env, i, XxC, &vec_exc);
+        if (s || vxc) {
+            break;
+        }
+    }
+    s390_restore_bfp_rounding_mode(env, old_mode);
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 =3D tmp;
+}
+
 typedef uint64_t (*vop64_3_fn)(uint64_t a, uint64_t b, float_status *s);
 static void vop64_3(S390Vector *v1, const S390Vector *v2, const S390Vect=
or *v3,
                     CPUS390XState *env, bool s, vop64_3_fn fn,
@@ -253,3 +277,26 @@ void HELPER(gvec_vfche64s_cc)(void *v1, const void *=
v2, const void *v3,
 {
     env->cc_op =3D vfc64(v1, v2, v3, env, true, float64_le_quiet, GETPC(=
));
 }
+
+static uint64_t vcdg64(uint64_t a, float_status *s)
+{
+    return int64_to_float64(a, s);
+}
+
+void HELPER(gvec_vcdg64)(void *v1, const void *v2, CPUS390XState *env,
+                         uint32_t desc)
+{
+    const uint8_t erm =3D extract32(simd_data(desc), 4, 4);
+    const bool XxC =3D extract32(simd_data(desc), 2, 1);
+
+    vop64_2(v1, v2, env, false, XxC, erm, vcdg64, GETPC());
+}
+
+void HELPER(gvec_vcdg64s)(void *v1, const void *v2, CPUS390XState *env,
+                          uint32_t desc)
+{
+    const uint8_t erm =3D extract32(simd_data(desc), 4, 4);
+    const bool XxC =3D extract32(simd_data(desc), 2, 1);
+
+    vop64_2(v1, v2, env, true, XxC, erm, vcdg64, GETPC());
+}
--=20
2.21.0


