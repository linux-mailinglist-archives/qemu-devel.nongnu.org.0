Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D8F23E7E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 19:27:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSm4j-0003mT-9t
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 13:27:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSllF-0003NS-FP
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSllD-00041I-AY
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:07:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41252)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSllD-00040x-2a; Mon, 20 May 2019 13:07:39 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CDF4308218D;
	Mon, 20 May 2019 17:07:37 +0000 (UTC)
Received: from localhost (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E8CA100200A;
	Mon, 20 May 2019 17:07:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 19:02:32 +0200
Message-Id: <20190520170302.13643-25-cohuck@redhat.com>
In-Reply-To: <20190520170302.13643-1-cohuck@redhat.com>
References: <20190520170302.13643-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 20 May 2019 17:07:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 24/54] s390x/tcg: Implement VECTOR MULTIPLY *
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Yet another set of variants. Implement it similar to VECTOR MULTIPLY AND
ADD *. At least for one variant we have a gvec helper we can reuse.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  16 +++++
 target/s390x/insn-data.def      |  14 +++++
 target/s390x/translate_vx.inc.c |  88 ++++++++++++++++++++++++++++
 target/s390x/vec_int_helper.c   | 100 ++++++++++++++++++++++++++++++++
 4 files changed, 218 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 18f8756d43fa..1ba1660997ad 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -180,6 +180,22 @@ DEF_HELPER_FLAGS_5(gvec_vmao32, TCG_CALL_NO_RWG, voi=
d, ptr, cptr, cptr, cptr, i3
 DEF_HELPER_FLAGS_5(gvec_vmalo8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
cptr, i32)
 DEF_HELPER_FLAGS_5(gvec_vmalo16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr,=
 cptr, i32)
 DEF_HELPER_FLAGS_5(gvec_vmalo32, TCG_CALL_NO_RWG, void, ptr, cptr, cptr,=
 cptr, i32)
+DEF_HELPER_FLAGS_4(gvec_vmh8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i3=
2)
+DEF_HELPER_FLAGS_4(gvec_vmh16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i=
32)
+DEF_HELPER_FLAGS_4(gvec_vmlh8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i=
32)
+DEF_HELPER_FLAGS_4(gvec_vmlh16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
+DEF_HELPER_FLAGS_4(gvec_vme8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i3=
2)
+DEF_HELPER_FLAGS_4(gvec_vme16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i=
32)
+DEF_HELPER_FLAGS_4(gvec_vme32, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i=
32)
+DEF_HELPER_FLAGS_4(gvec_vmle8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i=
32)
+DEF_HELPER_FLAGS_4(gvec_vmle16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
+DEF_HELPER_FLAGS_4(gvec_vmle32, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
+DEF_HELPER_FLAGS_4(gvec_vmo8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i3=
2)
+DEF_HELPER_FLAGS_4(gvec_vmo16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i=
32)
+DEF_HELPER_FLAGS_4(gvec_vmo32, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i=
32)
+DEF_HELPER_FLAGS_4(gvec_vmlo8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i=
32)
+DEF_HELPER_FLAGS_4(gvec_vmlo16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
+DEF_HELPER_FLAGS_4(gvec_vmlo32, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 7ccec0544ffa..2c794a27442b 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1120,6 +1120,20 @@
     F(0xe7af, VMAO,    VRR_d, V,   0, 0, 0, 0, vma, 0, IF_VEC)
 /* VECTOR MULTIPLY AND ADD LOGICAL ODD */
     F(0xe7ad, VMALO,   VRR_d, V,   0, 0, 0, 0, vma, 0, IF_VEC)
+/* VECTOR MULTIPLY HIGH */
+    F(0xe7a3, VMH,     VRR_c, V,   0, 0, 0, 0, vm, 0, IF_VEC)
+/* VECTOR MULTIPLY LOGICAL HIGH */
+    F(0xe7a1, VMLH,    VRR_c, V,   0, 0, 0, 0, vm, 0, IF_VEC)
+/* VECTOR MULTIPLY LOW */
+    F(0xe7a2, VML,     VRR_c, V,   0, 0, 0, 0, vm, 0, IF_VEC)
+/* VECTOR MULTIPLY EVEN */
+    F(0xe7a6, VME,     VRR_c, V,   0, 0, 0, 0, vm, 0, IF_VEC)
+/* VECTOR MULTIPLY LOGICAL EVEN */
+    F(0xe7a4, VMLE,    VRR_c, V,   0, 0, 0, 0, vm, 0, IF_VEC)
+/* VECTOR MULTIPLY ODD */
+    F(0xe7a7, VMO,     VRR_c, V,   0, 0, 0, 0, vm, 0, IF_VEC)
+/* VECTOR MULTIPLY LOGICAL ODD */
+    F(0xe7a5, VMLO,    VRR_c, V,   0, 0, 0, 0, vm, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 7de411f4f6f6..bf212b77bbbe 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -1703,3 +1703,91 @@ static DisasJumpType op_vma(DisasContext *s, Disas=
Ops *o)
                get_field(s->fields, v3), get_field(s->fields, v4), fn);
     return DISAS_NEXT;
 }
+
+static void gen_mh_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t =3D tcg_temp_new_i32();
+
+    tcg_gen_muls2_i32(t, d, a, b);
+    tcg_temp_free_i32(t);
+}
+
+static void gen_mlh_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i32 t =3D tcg_temp_new_i32();
+
+    tcg_gen_mulu2_i32(t, d, a, b);
+    tcg_temp_free_i32(t);
+}
+
+static DisasJumpType op_vm(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es =3D get_field(s->fields, m4);
+    static const GVecGen3 g_vmh[3] =3D {
+        { .fno =3D gen_helper_gvec_vmh8, },
+        { .fno =3D gen_helper_gvec_vmh16, },
+        { .fni4 =3D gen_mh_i32, },
+    };
+    static const GVecGen3 g_vmlh[3] =3D {
+        { .fno =3D gen_helper_gvec_vmlh8, },
+        { .fno =3D gen_helper_gvec_vmlh16, },
+        { .fni4 =3D gen_mlh_i32, },
+    };
+    static const GVecGen3 g_vme[3] =3D {
+        { .fno =3D gen_helper_gvec_vme8, },
+        { .fno =3D gen_helper_gvec_vme16, },
+        { .fno =3D gen_helper_gvec_vme32, },
+    };
+    static const GVecGen3 g_vmle[3] =3D {
+        { .fno =3D gen_helper_gvec_vmle8, },
+        { .fno =3D gen_helper_gvec_vmle16, },
+        { .fno =3D gen_helper_gvec_vmle32, },
+    };
+    static const GVecGen3 g_vmo[3] =3D {
+        { .fno =3D gen_helper_gvec_vmo8, },
+        { .fno =3D gen_helper_gvec_vmo16, },
+        { .fno =3D gen_helper_gvec_vmo32, },
+    };
+    static const GVecGen3 g_vmlo[3] =3D {
+        { .fno =3D gen_helper_gvec_vmlo8, },
+        { .fno =3D gen_helper_gvec_vmlo16, },
+        { .fno =3D gen_helper_gvec_vmlo32, },
+    };
+    const GVecGen3 *fn;
+
+    if (es > ES_32) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    switch (s->fields->op2) {
+    case 0xa2:
+        gen_gvec_fn_3(mul, es, get_field(s->fields, v1),
+                      get_field(s->fields, v2), get_field(s->fields, v3)=
);
+        return DISAS_NEXT;
+    case 0xa3:
+        fn =3D &g_vmh[es];
+        break;
+    case 0xa1:
+        fn =3D &g_vmlh[es];
+        break;
+    case 0xa6:
+        fn =3D &g_vme[es];
+        break;
+    case 0xa4:
+        fn =3D &g_vmle[es];
+        break;
+    case 0xa7:
+        fn =3D &g_vmo[es];
+        break;
+    case 0xa5:
+        fn =3D &g_vmlo[es];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    gen_gvec_3(get_field(s->fields, v1), get_field(s->fields, v2),
+               get_field(s->fields, v3), fn);
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_int_helper.c b/target/s390x/vec_int_helper.=
c
index 171c20fc54f0..2d7d4766c50a 100644
--- a/target/s390x/vec_int_helper.c
+++ b/target/s390x/vec_int_helper.c
@@ -364,3 +364,103 @@ void HELPER(gvec_vmalo##BITS)(void *v1, const void =
*v2, const void *v3,        \
 DEF_VMALO(8, 16)
 DEF_VMALO(16, 32)
 DEF_VMALO(32, 64)
+
+#define DEF_VMH(BITS)                                                   =
       \
+void HELPER(gvec_vmh##BITS)(void *v1, const void *v2, const void *v3,   =
       \
+                            uint32_t desc)                              =
       \
+{                                                                       =
       \
+    int i;                                                              =
       \
+                                                                        =
       \
+    for (i =3D 0; i < (128 / BITS); i++) {                              =
         \
+        const int32_t a =3D (int##BITS##_t)s390_vec_read_element##BITS(v=
2, i);   \
+        const int32_t b =3D (int##BITS##_t)s390_vec_read_element##BITS(v=
3, i);   \
+                                                                        =
       \
+        s390_vec_write_element##BITS(v1, i, (a * b) >> BITS);           =
       \
+    }                                                                   =
       \
+}
+DEF_VMH(8)
+DEF_VMH(16)
+
+#define DEF_VMLH(BITS)                                                  =
       \
+void HELPER(gvec_vmlh##BITS)(void *v1, const void *v2, const void *v3,  =
       \
+                             uint32_t desc)                             =
       \
+{                                                                       =
       \
+    int i;                                                              =
       \
+                                                                        =
       \
+    for (i =3D 0; i < (128 / BITS); i++) {                              =
         \
+        const uint##BITS##_t a =3D s390_vec_read_element##BITS(v2, i);  =
         \
+        const uint##BITS##_t b =3D s390_vec_read_element##BITS(v3, i);  =
         \
+                                                                        =
       \
+        s390_vec_write_element##BITS(v1, i, (a * b) >> BITS);           =
       \
+    }                                                                   =
       \
+}
+DEF_VMLH(8)
+DEF_VMLH(16)
+
+#define DEF_VME(BITS, TBITS)                                            =
       \
+void HELPER(gvec_vme##BITS)(void *v1, const void *v2, const void *v3,   =
       \
+                            uint32_t desc)                              =
       \
+{                                                                       =
       \
+    int i, j;                                                           =
       \
+                                                                        =
       \
+    for (i =3D 0, j =3D 0; i < (128 / TBITS); i++, j +=3D 2) {          =
             \
+        int##TBITS##_t a =3D (int##BITS##_t)s390_vec_read_element##BITS(=
v2, j);  \
+        int##TBITS##_t b =3D (int##BITS##_t)s390_vec_read_element##BITS(=
v3, j);  \
+                                                                        =
       \
+        s390_vec_write_element##TBITS(v1, i, a * b);                    =
       \
+    }                                                                   =
       \
+}
+DEF_VME(8, 16)
+DEF_VME(16, 32)
+DEF_VME(32, 64)
+
+#define DEF_VMLE(BITS, TBITS)                                           =
       \
+void HELPER(gvec_vmle##BITS)(void *v1, const void *v2, const void *v3,  =
       \
+                             uint32_t desc)                             =
       \
+{                                                                       =
       \
+    int i, j;                                                           =
       \
+                                                                        =
       \
+    for (i =3D 0, j =3D 0; i < (128 / TBITS); i++, j +=3D 2) {          =
             \
+        const uint##TBITS##_t a =3D s390_vec_read_element##BITS(v2, j); =
         \
+        const uint##TBITS##_t b =3D s390_vec_read_element##BITS(v3, j); =
         \
+                                                                        =
       \
+        s390_vec_write_element##TBITS(v1, i, a * b);                    =
       \
+    }                                                                   =
       \
+}
+DEF_VMLE(8, 16)
+DEF_VMLE(16, 32)
+DEF_VMLE(32, 64)
+
+#define DEF_VMO(BITS, TBITS)                                            =
       \
+void HELPER(gvec_vmo##BITS)(void *v1, const void *v2, const void *v3,   =
       \
+                            uint32_t desc)                              =
       \
+{                                                                       =
       \
+    int i, j;                                                           =
       \
+                                                                        =
       \
+    for (i =3D 0, j =3D 1; i < (128 / TBITS); i++, j +=3D 2) {          =
             \
+        int##TBITS##_t a =3D (int##BITS##_t)s390_vec_read_element##BITS(=
v2, j);  \
+        int##TBITS##_t b =3D (int##BITS##_t)s390_vec_read_element##BITS(=
v3, j);  \
+                                                                        =
       \
+        s390_vec_write_element##TBITS(v1, i, a * b);                    =
       \
+    }                                                                   =
       \
+}
+DEF_VMO(8, 16)
+DEF_VMO(16, 32)
+DEF_VMO(32, 64)
+
+#define DEF_VMLO(BITS, TBITS)                                           =
       \
+void HELPER(gvec_vmlo##BITS)(void *v1, const void *v2, const void *v3,  =
       \
+                             uint32_t desc)                             =
       \
+{                                                                       =
       \
+    int i, j;                                                           =
       \
+                                                                        =
       \
+    for (i =3D 0, j =3D 0; i < (128 / TBITS); i++, j +=3D 2) {          =
             \
+        const uint##TBITS##_t a =3D s390_vec_read_element##BITS(v2, j); =
         \
+        const uint##TBITS##_t b =3D s390_vec_read_element##BITS(v3, j); =
         \
+                                                                        =
       \
+        s390_vec_write_element##TBITS(v1, i, a * b);                    =
       \
+    }                                                                   =
       \
+}
+DEF_VMLO(8, 16)
+DEF_VMLO(16, 32)
+DEF_VMLO(32, 64)
--=20
2.20.1


