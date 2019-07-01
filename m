Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A662B21774
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 13:04:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRafT-0003pP-1x
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 07:04:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hRa6n-0006uA-8N
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hRa13-0004gs-Tr
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:23:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hRa13-0004ga-Mh; Fri, 17 May 2019 06:23:05 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADC3730C1D22;
	Fri, 17 May 2019 10:23:04 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E76B038E09;
	Fri, 17 May 2019 10:23:02 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 12:21:12 +0200
Message-Id: <20190517102145.21812-8-david@redhat.com>
In-Reply-To: <20190517102145.21812-1-david@redhat.com>
References: <20190517102145.21812-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 17 May 2019 10:23:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 07/40] s390x/tcg: Implement
 VECTOR AVERAGE LOGICAL
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

Similar to VECTOR AVERAGE but without sign extension.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  2 ++
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.inc.c | 48 +++++++++++++++++++++++++++++++++
 target/s390x/vec_int_helper.c   | 16 +++++++++++
 4 files changed, 68 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index add1d332e5..21921397fe 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -148,6 +148,8 @@ DEF_HELPER_FLAGS_4(vstl, TCG_CALL_NO_WG, void, env, c=
ptr, i64, i64)
 /* =3D=3D=3D Vector Integer Instructions =3D=3D=3D */
 DEF_HELPER_FLAGS_4(gvec_vavg8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i=
32)
 DEF_HELPER_FLAGS_4(gvec_vavg16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
+DEF_HELPER_FLAGS_4(gvec_vavgl8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
+DEF_HELPER_FLAGS_4(gvec_vavgl16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr,=
 i32)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 6f8b42e327..9889dc0b01 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1070,6 +1070,8 @@
     F(0xe769, VNC,     VRR_c, V,   0, 0, 0, 0, vnc, 0, IF_VEC)
 /* VECTOR AVERAGE */
     F(0xe7f2, VAVG,    VRR_c, V,   0, 0, 0, 0, vavg, 0, IF_VEC)
+/* VECTOR AVERAGE LOGICAL */
+    F(0xe7f0, VAVGL,   VRR_c, V,   0, 0, 0, 0, vavgl, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 065ace6bda..3ff0682135 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -1256,3 +1256,51 @@ static DisasJumpType op_vavg(DisasContext *s, Disa=
sOps *o)
                get_field(s->fields, v3), &g[es]);
     return DISAS_NEXT;
 }
+
+static void gen_avgl_i32(TCGv_i32 d, TCGv_i32 a, TCGv_i32 b)
+{
+    TCGv_i64 t0 =3D tcg_temp_new_i64();
+    TCGv_i64 t1 =3D tcg_temp_new_i64();
+
+    tcg_gen_extu_i32_i64(t0, a);
+    tcg_gen_extu_i32_i64(t1, b);
+    tcg_gen_add_i64(t0, t0, t1);
+    tcg_gen_addi_i64(t0, t0, 1);
+    tcg_gen_shri_i64(t0, t0, 1);
+    tcg_gen_extrl_i64_i32(d, t0);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
+
+static void gen_avgl_i64(TCGv_i64 dl, TCGv_i64 al, TCGv_i64 bl)
+{
+    TCGv_i64 dh =3D tcg_temp_new_i64();
+    TCGv_i64 zero =3D tcg_const_i64(0);
+
+    tcg_gen_add2_i64(dl, dh, al, zero, bl, zero);
+    gen_addi2_i64(dl, dh, dl, dh, 1);
+    tcg_gen_extract2_i64(dl, dl, dh, 1);
+
+    tcg_temp_free_i64(dh);
+    tcg_temp_free_i64(zero);
+}
+
+static DisasJumpType op_vavgl(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es =3D get_field(s->fields, m4);
+    static const GVecGen3 g[4] =3D {
+        { .fno =3D gen_helper_gvec_vavgl8, },
+        { .fno =3D gen_helper_gvec_vavgl16, },
+        { .fni4 =3D gen_avgl_i32, },
+        { .fni8 =3D gen_avgl_i64, },
+    };
+
+    if (es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    gen_gvec_3(get_field(s->fields, v1), get_field(s->fields, v2),
+               get_field(s->fields, v3), &g[es]);
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_int_helper.c b/target/s390x/vec_int_helper.=
c
index d964655bb8..8f97d3f466 100644
--- a/target/s390x/vec_int_helper.c
+++ b/target/s390x/vec_int_helper.c
@@ -30,3 +30,19 @@ void HELPER(gvec_vavg##BITS)(void *v1, const void *v2,=
 const void *v3,         \
 }
 DEF_VAVG(8)
 DEF_VAVG(16)
+
+#define DEF_VAVGL(BITS)                                                 =
       \
+void HELPER(gvec_vavgl##BITS)(void *v1, const void *v2, const void *v3, =
       \
+                              uint32_t desc)                            =
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
+        s390_vec_write_element##BITS(v1, i, (a + b + 1) >> 1);          =
       \
+    }                                                                   =
       \
+}
+DEF_VAVGL(8)
+DEF_VAVGL(16)
--=20
2.20.1


