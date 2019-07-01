Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C8D38E85
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 17:10:07 +0200 (CEST)
Received: from localhost ([::1]:48588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZGVK-00015y-HX
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 11:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53866)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <cohuck@redhat.com>) id 1hZFiP-0004tc-06
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hZFiL-00056R-4m
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 10:19:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57450)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hZFiK-00054f-Mr; Fri, 07 Jun 2019 10:19:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AA36830C31BB;
 Fri,  7 Jun 2019 14:19:27 +0000 (UTC)
Received: from localhost (dhcp-192-191.str.redhat.com [10.33.192.191])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F7BB7DE57;
 Fri,  7 Jun 2019 14:19:24 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  7 Jun 2019 16:17:22 +0200
Message-Id: <20190607141727.29018-30-cohuck@redhat.com>
In-Reply-To: <20190607141727.29018-1-cohuck@redhat.com>
References: <20190607141727.29018-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 07 Jun 2019 14:19:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 29/34] s390x/tcg: Implement VECTOR FP TEST
 DATA CLASS IMMEDIATE
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We can reuse float64_dcmask().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  2 ++
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.inc.c | 21 +++++++++++++++++++
 target/s390x/vec_fpu_helper.c   | 37 +++++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index c788fc1b7fa2..e9aff83b05d3 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -292,6 +292,8 @@ DEF_HELPER_FLAGS_4(gvec_vfsq64, TCG_CALL_NO_WG, void,=
 ptr, cptr, env, i32)
 DEF_HELPER_FLAGS_4(gvec_vfsq64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i=
32)
 DEF_HELPER_FLAGS_5(gvec_vfs64, TCG_CALL_NO_WG, void, ptr, cptr, cptr, en=
v, i32)
 DEF_HELPER_FLAGS_5(gvec_vfs64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, e=
nv, i32)
+DEF_HELPER_4(gvec_vftci64, void, ptr, cptr, env, i32)
+DEF_HELPER_4(gvec_vftci64s, void, ptr, cptr, env, i32)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 4426f4025075..f421184fcd53 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1246,6 +1246,8 @@
     F(0xe7ce, VFSQ,    VRR_a, V,   0, 0, 0, 0, vfsq, 0, IF_VEC)
 /* VECTOR FP SUBTRACT */
     F(0xe7e2, VFS,     VRR_c, V,   0, 0, 0, 0, vfa, 0, IF_VEC)
+/* VECTOR FP TEST DATA CLASS IMMEDIATE */
+    F(0xe74a, VFTCI,   VRI_e, V,   0, 0, 0, 0, vftci, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index c0a19aa9f3da..69c675e41187 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -2801,3 +2801,24 @@ static DisasJumpType op_vfsq(DisasContext *s, Disa=
sOps *o)
                    0, fn);
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vftci(DisasContext *s, DisasOps *o)
+{
+    const uint16_t i3 =3D get_field(s->fields, i3);
+    const uint8_t fpf =3D get_field(s->fields, m4);
+    const uint8_t m5 =3D get_field(s->fields, m5);
+    gen_helper_gvec_2_ptr *fn =3D gen_helper_gvec_vftci64;
+
+    if (fpf !=3D FPF_LONG || extract32(m5, 0, 3)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    if (extract32(m5, 3, 1)) {
+        fn =3D gen_helper_gvec_vftci64s;
+    }
+    gen_gvec_2_ptr(get_field(s->fields, v1), get_field(s->fields, v2), c=
pu_env,
+                   i3, fn);
+    set_cc_static(s);
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.=
c
index ccdc97562895..a48bd704bcad 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -586,3 +586,40 @@ void HELPER(gvec_vfs64s)(void *v1, const void *v2, c=
onst void *v3,
 {
     vop64_3(v1, v2, v3, env, true, vfs64, GETPC());
 }
+
+static int vftci64(S390Vector *v1, const S390Vector *v2, CPUS390XState *=
env,
+                   bool s, uint16_t i3)
+{
+    int i, match =3D 0;
+
+    for (i =3D 0; i < 2; i++) {
+        float64 a =3D s390_vec_read_element64(v2, i);
+
+        if (float64_dcmask(env, a) & i3) {
+            match++;
+            s390_vec_write_element64(v1, i, -1ull);
+        } else {
+            s390_vec_write_element64(v1, i, 0);
+        }
+        if (s) {
+            break;
+        }
+    }
+
+    if (match) {
+        return s || match =3D=3D 2 ? 0 : 1;
+    }
+    return 3;
+}
+
+void HELPER(gvec_vftci64)(void *v1, const void *v2, CPUS390XState *env,
+                          uint32_t desc)
+{
+    env->cc_op =3D vftci64(v1, v2, env, false, simd_data(desc));
+}
+
+void HELPER(gvec_vftci64s)(void *v1, const void *v2, CPUS390XState *env,
+                           uint32_t desc)
+{
+    env->cc_op =3D vftci64(v1, v2, env, true, simd_data(desc));
+}
--=20
2.20.1


