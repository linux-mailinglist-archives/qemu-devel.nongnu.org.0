Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D241432C11
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 11:14:59 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60120 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXj3S-0002ZN-Uk
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 05:14:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hXivo-0004Nt-K5
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 05:07:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hXivn-0002Yr-9W
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 05:07:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hXivl-0002MX-AV; Mon, 03 Jun 2019 05:07:02 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8FE73001802;
	Mon,  3 Jun 2019 09:06:54 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.117.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23A9061988;
	Mon,  3 Jun 2019 09:06:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2019 11:06:18 +0200
Message-Id: <20190603090635.10631-6-david@redhat.com>
In-Reply-To: <20190603090635.10631-1-david@redhat.com>
References: <20190603090635.10631-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 03 Jun 2019 09:06:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 05/22] s390x/tcg: Implement VECTOR FP
 COMPARE (AND SIGNAL) SCALAR
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
Cc: Thomas Huth <thuth@redhat.com>, Denys Vlasenko <dvlasenk@redhat.com>,
	David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pino Toscano <ptoscano@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As far as I can see, there is only a tiny difference.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  2 ++
 target/s390x/insn-data.def      |  4 ++++
 target/s390x/translate_vx.inc.c | 21 +++++++++++++++++++++
 target/s390x/vec_fpu_helper.c   | 32 ++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 21658a2771..d34d6802a6 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -252,6 +252,8 @@ DEF_HELPER_6(gvec_vstrc_cc_rt32, void, ptr, cptr, cpt=
r, cptr, env, i32)
 /* =3D=3D=3D Vector Floating-Point Instructions */
 DEF_HELPER_FLAGS_5(gvec_vfa64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, en=
v, i32)
 DEF_HELPER_FLAGS_5(gvec_vfa64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, e=
nv, i32)
+DEF_HELPER_4(gvec_wfc64, void, cptr, cptr, env, i32)
+DEF_HELPER_4(gvec_wfk64, void, cptr, cptr, env, i32)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 79892f6042..c45e101b10 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1208,6 +1208,10 @@
=20
 /* VECTOR FP ADD */
     F(0xe7e3, VFA,     VRR_c, V,   0, 0, 0, 0, vfa, 0, IF_VEC)
+/* VECTOR FP COMPARE SCALAR */
+    F(0xe7cb, WFC,     VRR_a, V,   0, 0, 0, 0, wfc, 0, IF_VEC)
+/* VECTOR FP COMPARE AND SIGNAL SCALAR */
+    F(0xe7ca, WFK,     VRR_a, V,   0, 0, 0, 0, wfc, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 44da9f2645..283e8aa07a 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -2567,3 +2567,24 @@ static DisasJumpType op_vfa(DisasContext *s, Disas=
Ops *o)
                    get_field(s->fields, v3), cpu_env, 0, fn);
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_wfc(DisasContext *s, DisasOps *o)
+{
+    const uint8_t fpf =3D get_field(s->fields, m3);
+    const uint8_t m4 =3D get_field(s->fields, m4);
+
+    if (fpf !=3D FPF_LONG || m4) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    if (s->fields->op2 =3D=3D 0xcb) {
+        gen_gvec_2_ptr(get_field(s->fields, v1), get_field(s->fields, v2=
),
+                       cpu_env, 0, gen_helper_gvec_wfc64);
+    } else {
+        gen_gvec_2_ptr(get_field(s->fields, v1), get_field(s->fields, v2=
),
+                       cpu_env, 0, gen_helper_gvec_wfk64);
+    }
+    set_cc_static(s);
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.=
c
index c7db0791d7..f9357d9221 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -117,3 +117,35 @@ void HELPER(gvec_vfa64s)(void *v1, const void *v2, c=
onst void *v3,
 {
     vop64_3(v1, v2, v3, env, true, vfa64, GETPC());
 }
+
+static int wfc64(const S390Vector *v1, const S390Vector *v2,
+                 CPUS390XState *env, bool signal, uintptr_t retaddr)
+{
+    /* only the zero-indexed elements are compared */
+    const float64 a =3D s390_vec_read_element64(v1, 0);
+    const float64 b =3D s390_vec_read_element64(v2, 0);
+    uint8_t vxc, vec_exc =3D 0;
+    int cmp;
+
+    if (signal) {
+        cmp =3D float64_compare(a, b, &env->fpu_status);
+    } else {
+        cmp =3D float64_compare_quiet(a, b, &env->fpu_status);
+    }
+    vxc =3D check_ieee_exc(env, 0, false, &vec_exc);
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+
+    return float_comp_to_cc(env, cmp);
+}
+
+void HELPER(gvec_wfc64)(const void *v1, const void *v2, CPUS390XState *e=
nv,
+                        uint32_t desc)
+{
+    env->cc_op =3D wfc64(v1, v2, env, false, GETPC());
+}
+
+void HELPER(gvec_wfk64)(const void *v1, const void *v2, CPUS390XState *e=
nv,
+                        uint32_t desc)
+{
+    env->cc_op =3D wfc64(v1, v2, env, true, GETPC());
+}
--=20
2.21.0


