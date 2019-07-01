Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1861211B73
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 16:30:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMCjf-0008IF-4S
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 10:30:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hMCQr-0000UI-I1
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:11:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hMCQq-0007MN-3a
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:11:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16235)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hMCQp-0007Lo-RQ; Thu, 02 May 2019 10:11:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2003C37E88;
	Thu,  2 May 2019 14:11:27 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-88.ams2.redhat.com [10.36.117.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C259D17D53;
	Thu,  2 May 2019 14:11:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 16:10:06 +0200
Message-Id: <20190502141019.6385-28-david@redhat.com>
In-Reply-To: <20190502141019.6385-1-david@redhat.com>
References: <20190502141019.6385-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 02 May 2019 14:11:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 27/40] s390x/tcg: Implement VECTOR ELEMENT
 ROTATE AND INSERT UNDER MASK
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the new vector expansion for GVecGen3i.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  2 ++
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.inc.c | 51 +++++++++++++++++++++++++++++++++
 target/s390x/vec_int_helper.c   | 20 +++++++++++++
 4 files changed, 75 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index b3e15cfe8c..d570f763d9 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -202,6 +202,8 @@ DEF_HELPER_FLAGS_4(gvec_verllv8, TCG_CALL_NO_RWG, voi=
d, ptr, cptr, cptr, i32)
 DEF_HELPER_FLAGS_4(gvec_verllv16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr=
, i32)
 DEF_HELPER_FLAGS_4(gvec_verll8, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i=
32)
 DEF_HELPER_FLAGS_4(gvec_verll16, TCG_CALL_NO_RWG, void, ptr, cptr, i64, =
i32)
+DEF_HELPER_FLAGS_4(gvec_verim8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
+DEF_HELPER_FLAGS_4(gvec_verim16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr,=
 i32)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index e765c15941..59c323a796 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1149,6 +1149,8 @@
 /* VECTOR ELEMENT ROTATE LEFT LOGICAL */
     F(0xe773, VERLLV,  VRR_c, V,   0, 0, 0, 0, verllv, 0, IF_VEC)
     F(0xe733, VERLL,   VRS_a, V,   la2, 0, 0, 0, verll, 0, IF_VEC)
+/* VECTOR ELEMENT ROTATE AND INSERT UNDER MASK */
+    F(0xe772, VERIM,   VRI_d, V,   0, 0, 0, 0, verim, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index f4e89b36fe..f5abe41bff 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -197,6 +197,9 @@ static void get_vec_element_ptr_i64(TCGv_ptr ptr, uin=
t8_t reg, TCGv_i64 enr,
 #define gen_gvec_3_ptr(v1, v2, v3, ptr, data, fn) \
     tcg_gen_gvec_3_ptr(vec_full_reg_offset(v1), vec_full_reg_offset(v2),=
 \
                        vec_full_reg_offset(v3), ptr, 16, 16, data, fn)
+#define gen_gvec_3i(v1, v2, v3, c, gen) \
+    tcg_gen_gvec_3i(vec_full_reg_offset(v1), vec_full_reg_offset(v2), \
+                    vec_full_reg_offset(v3), c, 16, 16, gen)
 #define gen_gvec_4(v1, v2, v3, v4, gen) \
     tcg_gen_gvec_4(vec_full_reg_offset(v1), vec_full_reg_offset(v2), \
                    vec_full_reg_offset(v3), vec_full_reg_offset(v4), \
@@ -1901,3 +1904,51 @@ static DisasJumpType op_verll(DisasContext *s, Dis=
asOps *o)
                 &g[es]);
     return DISAS_NEXT;
 }
+
+static void gen_rim_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b, int32_t c)
+{
+    TCGv_i32 t =3D tcg_temp_new_i32();
+
+    tcg_gen_rotli_i32(t, a, c & 31);
+    tcg_gen_and_i32(t, t, b);
+    tcg_gen_andc_i32(d, d, b);
+    tcg_gen_or_i32(d, d, t);
+
+    tcg_temp_free_i32(t);
+}
+
+static void gen_rim_i64(TCGv_i64 d, TCGv_i64 a, TCGv_i64 b, int64_t c)
+{
+    TCGv_i64 t =3D tcg_temp_new_i64();
+
+    tcg_gen_rotli_i64(t, a, c & 63);
+    tcg_gen_and_i64(t, t, b);
+    tcg_gen_andc_i64(d, d, b);
+    tcg_gen_or_i64(d, d, t);
+
+    tcg_temp_free_i64(t);
+}
+
+static DisasJumpType op_verim(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es =3D get_field(s->fields, m5);
+    const uint8_t i4 =3D get_field(s->fields, i4) &
+                       (NUM_VEC_ELEMENT_BITS(es) - 1);
+    static const GVecGen3i g[4] =3D {
+        { .fno =3D gen_helper_gvec_verim8, },
+        { .fno =3D gen_helper_gvec_verim16, },
+        { .fni4 =3D gen_rim_i32,
+          .load_dest =3D true, },
+        { .fni8 =3D gen_rim_i64,
+          .load_dest =3D true, },
+    };
+
+    if (es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    gen_gvec_3i(get_field(s->fields, v1), get_field(s->fields, v2),
+                get_field(s->fields, v3), i4, &g[es]);
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_int_helper.c b/target/s390x/vec_int_helper.=
c
index a3c8f09eac..b881fb722d 100644
--- a/target/s390x/vec_int_helper.c
+++ b/target/s390x/vec_int_helper.c
@@ -14,6 +14,7 @@
 #include "cpu.h"
 #include "vec.h"
 #include "exec/helper-proto.h"
+#include "tcg/tcg-gvec-desc.h"
=20
 static bool s390_vec_is_zero(const S390Vector *v)
 {
@@ -509,3 +510,22 @@ void HELPER(gvec_verll##BITS)(void *v1, const void *=
v2, uint64_t count,        \
 }
 DEF_VERLL(8)
 DEF_VERLL(16)
+
+#define DEF_VERIM(BITS)                                                 =
       \
+void HELPER(gvec_verim##BITS)(void *v1, const void *v2, const void *v3, =
       \
+                              uint32_t desc)                            =
       \
+{                                                                       =
       \
+    const uint8_t count =3D simd_data(desc);                            =
         \
+    int i;                                                              =
       \
+                                                                        =
       \
+    for (i =3D 0; i < (128 / BITS); i++) {                              =
         \
+        const uint##BITS##_t a =3D s390_vec_read_element##BITS(v1, i);  =
         \
+        const uint##BITS##_t b =3D s390_vec_read_element##BITS(v2, i);  =
         \
+        const uint##BITS##_t mask =3D s390_vec_read_element##BITS(v3, i)=
;        \
+        const uint##BITS##_t d =3D (a & ~mask) | (rol##BITS(b, count) & =
mask);   \
+                                                                        =
       \
+        s390_vec_write_element##BITS(v1, i, d);                         =
       \
+    }                                                                   =
       \
+}
+DEF_VERIM(8)
+DEF_VERIM(16)
--=20
2.20.1


