Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EC930CFD
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 13:01:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWfHl-0002sy-27
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 07:01:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hWf27-0007ET-CU
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hWf26-0001oB-2i
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:45:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>) id 1hWf25-0001nO-Rj
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:45:10 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 344E830821C0;
	Fri, 31 May 2019 10:45:09 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-233.ams2.redhat.com [10.36.116.233])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E7870271AE;
	Fri, 31 May 2019 10:45:05 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 12:44:25 +0200
Message-Id: <20190531104432.29379-17-david@redhat.com>
In-Reply-To: <20190531104432.29379-1-david@redhat.com>
References: <20190531104432.29379-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 31 May 2019 10:45:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 16/23] s390x/tcg: Implement VECTOR FP
 MULTIPLY AND (ADD|SUBTRACT)
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
	Denys Vlasenko <dvlasenk@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  4 +++
 target/s390x/insn-data.def      |  4 +++
 target/s390x/translate_vx.inc.c | 23 +++++++++++++
 target/s390x/vec_fpu_helper.c   | 61 +++++++++++++++++++++++++++++++++
 4 files changed, 92 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 22e02a0178..bcaabb91a5 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -284,6 +284,10 @@ DEF_HELPER_FLAGS_4(gvec_vflr64, TCG_CALL_NO_WG, void=
, ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vflr64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i=
32)
 DEF_HELPER_FLAGS_5(gvec_vfm64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, en=
v, i32)
 DEF_HELPER_FLAGS_5(gvec_vfm64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, e=
nv, i32)
+DEF_HELPER_FLAGS_6(gvec_vfma64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, c=
ptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfma64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, =
cptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfms64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, c=
ptr, env, i32)
+DEF_HELPER_FLAGS_6(gvec_vfms64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, =
cptr, env, i32)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index e56059ac34..e86ade9e44 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1236,6 +1236,10 @@
     F(0xe7c5, VFLR,    VRR_a, V,   0, 0, 0, 0, vcdg, 0, IF_VEC)
 /* VECTOR FP MULTIPLY */
     F(0xe7e7, VFM,     VRR_c, V,   0, 0, 0, 0, vfa, 0, IF_VEC)
+/* VECTOR FP MULTIPLY AND ADD */
+    F(0xe78f, VFMA,    VRR_e, V,   0, 0, 0, 0, vfma, 0, IF_VEC)
+/* VECTOR FP MULTIPLY AND SUBTRACT */
+    F(0xe78e, VFMS,    VRR_e, V,   0, 0, 0, 0, vfma, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index ae31a327cf..b624c7a8aa 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -2704,3 +2704,26 @@ static DisasJumpType op_vfll(DisasContext *s, Disa=
sOps *o)
                    0, fn);
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vfma(DisasContext *s, DisasOps *o)
+{
+    const uint8_t m5 =3D get_field(s->fields, m5);
+    const uint8_t fpf =3D get_field(s->fields, m6);
+    const bool se =3D extract32(m5, 3, 1);
+    gen_helper_gvec_4_ptr *fn;
+
+    if (fpf !=3D FPF_LONG || extract32(m5, 0, 3)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    if (s->fields->op2 =3D=3D 0x8f) {
+        fn =3D se ? gen_helper_gvec_vfma64s : gen_helper_gvec_vfma64;
+    } else {
+        fn =3D se ? gen_helper_gvec_vfms64s : gen_helper_gvec_vfms64;
+    }
+    gen_gvec_4_ptr(get_field(s->fields, v1), get_field(s->fields, v2),
+                   get_field(s->fields, v3), get_field(s->fields, v4), c=
pu_env,
+                   0, fn);
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.=
c
index fd147cc055..a27b354214 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -125,6 +125,31 @@ static void vop64_3(S390Vector *v1, const S390Vector=
 *v2, const S390Vector *v3,
     *v1 =3D tmp;
 }
=20
+typedef uint64_t (*vop64_4_fn)(uint64_t a, uint64_t b, uint64_t c,
+                               float_status *s);
+static void vop64_4(S390Vector *v1, const S390Vector *v2, const S390Vect=
or *v3,
+                    const S390Vector *v4, CPUS390XState *env, bool s,
+                    vop64_4_fn fn, uintptr_t retaddr)
+{
+    uint8_t vxc, vec_exc =3D 0;
+    S390Vector tmp =3D {};
+    int i;
+
+    for (i =3D 0; i < 2; i++) {
+        const uint64_t a =3D s390_vec_read_element64(v2, i);
+        const uint64_t b =3D s390_vec_read_element64(v3, i);
+        const uint64_t c =3D s390_vec_read_element64(v4, i);
+
+        s390_vec_write_element64(&tmp, i, fn(a, b, c, &env->fpu_status))=
;
+        vxc =3D check_ieee_exc(env, i, false, &vec_exc);
+        if (s || vxc) {
+            break;
+        }
+    }
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 =3D tmp;
+}
+
 static uint64_t vfa64(uint64_t a, uint64_t b, float_status *s)
 {
     return float64_val(float64_add(make_float64(a), make_float64(b), s))=
;
@@ -508,3 +533,39 @@ void HELPER(gvec_vfm64s)(void *v1, const void *v2, c=
onst void *v3,
 {
     vop64_3(v1, v2, v3, env, true, vfm64, GETPC());
 }
+
+static uint64_t vfma64(uint64_t a, uint64_t b, uint64_t c, float_status =
*s)
+{
+    return float64_val(float64_muladd(make_float64(a), make_float64(b),
+                       make_float64(c), 0, s));
+}
+
+void HELPER(gvec_vfma64)(void *v1, const void *v2, const void *v3,
+                         const void *v4, CPUS390XState *env, uint32_t de=
sc)
+{
+    vop64_4(v1, v2, v3, v4, env, false, vfma64, GETPC());
+}
+
+void HELPER(gvec_vfma64s)(void *v1, const void *v2, const void *v3,
+                         const void *v4, CPUS390XState *env, uint32_t de=
sc)
+{
+    vop64_4(v1, v2, v3, v4, env, true, vfma64, GETPC());
+}
+
+static uint64_t vfms64(uint64_t a, uint64_t b, uint64_t c, float_status =
*s)
+{
+    return float64_val(float64_muladd(make_float64(a), make_float64(b),
+                       make_float64(c), float_muladd_negate_c, s));
+}
+
+void HELPER(gvec_vfms64)(void *v1, const void *v2, const void *v3,
+                         const void *v4, CPUS390XState *env, uint32_t de=
sc)
+{
+    vop64_4(v1, v2, v3, v4, env, false, vfms64, GETPC());
+}
+
+void HELPER(gvec_vfms64s)(void *v1, const void *v2, const void *v3,
+                         const void *v4, CPUS390XState *env, uint32_t de=
sc)
+{
+    vop64_4(v1, v2, v3, v4, env, true, vfms64, GETPC());
+}
--=20
2.20.1


