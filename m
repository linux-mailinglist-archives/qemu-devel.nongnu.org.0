Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22A23F42
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 19:41:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSmI0-0006Xy-7j
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 13:41:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSlol-00072g-8r
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:11:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSloj-0005dD-4Y
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:11:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60808)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSloi-0005cE-DF; Mon, 20 May 2019 13:11:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1667A81F18;
	Mon, 20 May 2019 17:11:09 +0000 (UTC)
Received: from localhost (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D47D4600CC;
	Mon, 20 May 2019 17:11:05 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 19:02:53 +0200
Message-Id: <20190520170302.13643-46-cohuck@redhat.com>
In-Reply-To: <20190520170302.13643-1-cohuck@redhat.com>
References: <20190520170302.13643-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 20 May 2019 17:11:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 45/54] s390x/tcg: Implement VECTOR TEST UNDER
 MASK
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

Let's return the cc value directly via cpu_env. Unfortunately there
isn't a simple way to calculate the value lazily - one would have to
calculate and store e.g. the population count of the mask and the
result so it can be evaluated in a cc helper.

But as VTM only sets the cc, we can assume the value will be needed soon
either way.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  1 +
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.inc.c | 11 +++++++++++
 target/s390x/vec_int_helper.c   | 31 +++++++++++++++++++++++++++++++
 4 files changed, 45 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 2cb1f369bd86..7755a96c3371 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -209,6 +209,7 @@ DEF_HELPER_FLAGS_4(gvec_vsra, TCG_CALL_NO_RWG, void, =
ptr, cptr, i64, i32)
 DEF_HELPER_FLAGS_4(gvec_vsrl, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32=
)
 DEF_HELPER_FLAGS_4(gvec_vscbi8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
 DEF_HELPER_FLAGS_4(gvec_vscbi16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr,=
 i32)
+DEF_HELPER_4(gvec_vtm, void, ptr, cptr, env, i32)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index a52db413880e..e61475bdc483 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1188,6 +1188,8 @@
     F(0xe767, VSUMQ,   VRR_c, V,   0, 0, 0, 0, vsumq, 0, IF_VEC)
 /* VECTOR SUM ACROSS WORD */
     F(0xe764, VSUM,    VRR_c, V,   0, 0, 0, 0, vsum, 0, IF_VEC)
+/* VECTOR TEST UNDER MASK */
+    F(0xe7d8, VTM,     VRR_a, V,   0, 0, 0, 0, vtm, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 52ab8562e638..7e0bfcb1907c 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -191,6 +191,9 @@ static void get_vec_element_ptr_i64(TCGv_ptr ptr, uin=
t8_t reg, TCGv_i64 enr,
 #define gen_gvec_2i_ool(v1, v2, c, data, fn) \
     tcg_gen_gvec_2i_ool(vec_full_reg_offset(v1), vec_full_reg_offset(v2)=
, \
                         c, 16, 16, data, fn)
+#define gen_gvec_2_ptr(v1, v2, ptr, data, fn) \
+    tcg_gen_gvec_2_ptr(vec_full_reg_offset(v1), vec_full_reg_offset(v2),=
 \
+                       ptr, 16, 16, data, fn)
 #define gen_gvec_3(v1, v2, v3, gen) \
     tcg_gen_gvec_3(vec_full_reg_offset(v1), vec_full_reg_offset(v2), \
                    vec_full_reg_offset(v3), 16, 16, gen)
@@ -2342,3 +2345,11 @@ static DisasJumpType op_vsum(DisasContext *s, Disa=
sOps *o)
     tcg_temp_free_i32(tmp);
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vtm(DisasContext *s, DisasOps *o)
+{
+    gen_gvec_2_ptr(get_field(s->fields, v1), get_field(s->fields, v2),
+                   cpu_env, 0, gen_helper_gvec_vtm);
+    set_cc_static(s);
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_int_helper.c b/target/s390x/vec_int_helper.=
c
index 09137dab996f..68eaae407b47 100644
--- a/target/s390x/vec_int_helper.c
+++ b/target/s390x/vec_int_helper.c
@@ -28,6 +28,19 @@ static void s390_vec_xor(S390Vector *res, const S390Ve=
ctor *a,
     res->doubleword[1] =3D a->doubleword[1] ^ b->doubleword[1];
 }
=20
+static void s390_vec_and(S390Vector *res, const S390Vector *a,
+                         const S390Vector *b)
+{
+    res->doubleword[0] =3D a->doubleword[0] & b->doubleword[0];
+    res->doubleword[1] =3D a->doubleword[1] & b->doubleword[1];
+}
+
+static bool s390_vec_equal(const S390Vector *a, const S390Vector *b)
+{
+    return a->doubleword[0] =3D=3D b->doubleword[0] &&
+           a->doubleword[1] =3D=3D b->doubleword[1];
+}
+
 static void s390_vec_shl(S390Vector *d, const S390Vector *a, uint64_t co=
unt)
 {
     uint64_t tmp;
@@ -583,3 +596,21 @@ void HELPER(gvec_vscbi##BITS)(void *v1, const void *=
v2, const void *v3,        \
 }
 DEF_VSCBI(8)
 DEF_VSCBI(16)
+
+void HELPER(gvec_vtm)(void *v1, const void *v2, CPUS390XState *env,
+                      uint32_t desc)
+{
+    S390Vector tmp;
+
+    s390_vec_and(&tmp, v1, v2);
+    if (s390_vec_is_zero(&tmp)) {
+        /* Selected bits all zeros; or all mask bits zero */
+        env->cc_op =3D 0;
+    } else if (s390_vec_equal(&tmp, v2)) {
+        /* Selected bits all ones */
+        env->cc_op =3D 3;
+    } else {
+        /* Selected bits a mix of zeros and ones */
+        env->cc_op =3D 1;
+    }
+}
--=20
2.20.1


