Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67DF365A0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 22:39:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYchN-0006p8-Ow
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 16:39:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hYccU-0002yT-Mm
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:34:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hYccK-0006Vm-4i
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:34:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47090)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hYccG-0005ZN-6L; Wed, 05 Jun 2019 16:34:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C852B859FF;
	Wed,  5 Jun 2019 20:34:14 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-124.ams2.redhat.com [10.36.116.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4AFA8619A9;
	Wed,  5 Jun 2019 20:34:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2019 22:33:32 +0200
Message-Id: <20190605203403.29461-3-david@redhat.com>
In-Reply-To: <20190605203403.29461-1-david@redhat.com>
References: <20190605203403.29461-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 05 Jun 2019 20:34:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 02/33] s390x/tcg: Implement
 VECTOR FIND ELEMENT EQUAL
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

Core logic courtesy of Richard H.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h            |  6 ++++
 target/s390x/insn-data.def       |  2 ++
 target/s390x/translate_vx.inc.c  | 31 +++++++++++++++++
 target/s390x/vec_string_helper.c | 57 ++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index c45328cf73..a1b169b666 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -218,6 +218,12 @@ DEF_HELPER_FLAGS_4(gvec_vfae32, TCG_CALL_NO_RWG, voi=
d, ptr, cptr, cptr, i32)
 DEF_HELPER_5(gvec_vfae_cc8, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfae_cc16, void, ptr, cptr, cptr, env, i32)
 DEF_HELPER_5(gvec_vfae_cc32, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_FLAGS_4(gvec_vfee8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, i=
32)
+DEF_HELPER_FLAGS_4(gvec_vfee16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
+DEF_HELPER_FLAGS_4(gvec_vfee32, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
+DEF_HELPER_5(gvec_vfee_cc8, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_5(gvec_vfee_cc16, void, ptr, cptr, cptr, env, i32)
+DEF_HELPER_5(gvec_vfee_cc32, void, ptr, cptr, cptr, env, i32)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 070ce2a471..d8907ef6a5 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1195,6 +1195,8 @@
=20
 /* VECTOR FIND ANY ELEMENT EQUAL */
     F(0xe782, VFAE,    VRR_b, V,   0, 0, 0, 0, vfae, 0, IF_VEC)
+/* VECTOR FIND ELEMENT EQUAL */
+    F(0xe780, VFEE,    VRR_b, V,   0, 0, 0, 0, vfee, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index ebd7a877f1..b25afbc011 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -2383,3 +2383,34 @@ static DisasJumpType op_vfae(DisasContext *s, Disa=
sOps *o)
     }
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vfee(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es =3D get_field(s->fields, m4);
+    const uint8_t m5 =3D get_field(s->fields, m5);
+    static gen_helper_gvec_3 * const g[3] =3D {
+        gen_helper_gvec_vfee8,
+        gen_helper_gvec_vfee16,
+        gen_helper_gvec_vfee32,
+    };
+    static gen_helper_gvec_3_ptr * const g_cc[3] =3D {
+        gen_helper_gvec_vfee_cc8,
+        gen_helper_gvec_vfee_cc16,
+        gen_helper_gvec_vfee_cc32,
+    };
+
+    if (es > ES_32 || m5 & ~0x3) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    if (extract32(m5, 0, 1)) {
+        gen_gvec_3_ptr(get_field(s->fields, v1), get_field(s->fields, v2=
),
+                       get_field(s->fields, v3), cpu_env, m5, g_cc[es]);
+        set_cc_static(s);
+    } else {
+        gen_gvec_3_ool(get_field(s->fields, v1), get_field(s->fields, v2=
),
+                       get_field(s->fields, v3), m5, g[es]);
+    }
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_string_helper.c b/target/s390x/vec_string_h=
elper.c
index 56dc89c824..05ad99e173 100644
--- a/target/s390x/vec_string_helper.c
+++ b/target/s390x/vec_string_helper.c
@@ -152,3 +152,60 @@ void HELPER(gvec_vfae_cc##BITS)(void *v1, const void=
 *v2, const void *v3,      \
 DEF_VFAE_CC_HELPER(8)
 DEF_VFAE_CC_HELPER(16)
 DEF_VFAE_CC_HELPER(32)
+
+static int vfee(void *v1, const void *v2, const void *v3, bool zs, uint8=
_t es)
+{
+    const uint64_t mask =3D get_element_lsbs_mask(es);
+    uint64_t a0, a1, b0, b1, e0, e1, z0, z1;
+    uint64_t first_zero =3D 16;
+    uint64_t first_equal;
+
+    a0 =3D s390_vec_read_element64(v2, 0);
+    a1 =3D s390_vec_read_element64(v2, 1);
+    b0 =3D s390_vec_read_element64(v3, 0);
+    b1 =3D s390_vec_read_element64(v3, 1);
+    e0 =3D zero_search(a0 ^ b0, mask);
+    e1 =3D zero_search(a1 ^ b1, mask);
+    first_equal =3D match_index(e0, e1);
+
+    if (zs) {
+        z0 =3D zero_search(a0, mask);
+        z1 =3D zero_search(a1, mask);
+        first_zero =3D match_index(z0, z1);
+    }
+
+    s390_vec_write_element64(v1, 0, MIN(first_equal, first_zero));
+    s390_vec_write_element64(v1, 1, 0);
+    if (first_zero =3D=3D 16 && first_equal =3D=3D 16) {
+        return 3; /* no match */
+    } else if (first_zero =3D=3D 16) {
+        return 1; /* matching elements, no match for zero */
+    } else if (first_equal < first_zero) {
+        return 2; /* matching elements before match for zero */
+    }
+    return 0; /* match for zero */
+}
+
+#define DEF_VFEE_HELPER(BITS)                                           =
       \
+void HELPER(gvec_vfee##BITS)(void *v1, const void *v2, const void *v3,  =
       \
+                             uint32_t desc)                             =
       \
+{                                                                       =
       \
+    const bool zs =3D extract32(simd_data(desc), 1, 1);                 =
         \
+                                                                        =
       \
+    vfee(v1, v2, v3, zs, MO_##BITS);                                    =
       \
+}
+DEF_VFEE_HELPER(8)
+DEF_VFEE_HELPER(16)
+DEF_VFEE_HELPER(32)
+
+#define DEF_VFEE_CC_HELPER(BITS)                                        =
       \
+void HELPER(gvec_vfee_cc##BITS)(void *v1, const void *v2, const void *v3=
,      \
+                                CPUS390XState *env, uint32_t desc)      =
       \
+{                                                                       =
       \
+    const bool zs =3D extract32(simd_data(desc), 1, 1);                 =
         \
+                                                                        =
       \
+    env->cc_op =3D vfee(v1, v2, v3, zs, MO_##BITS);                     =
         \
+}
+DEF_VFEE_CC_HELPER(8)
+DEF_VFEE_CC_HELPER(16)
+DEF_VFEE_CC_HELPER(32)
--=20
2.21.0


