Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3730CEE
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 12:57:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWfDk-0007ia-Oc
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 06:57:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hWf1y-00077b-OS
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:45:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hWf1x-0001f0-MU
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:45:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42130)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>) id 1hWf1x-0001do-F7
	for qemu-devel@nongnu.org; Fri, 31 May 2019 06:45:01 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC3E537EEF;
	Fri, 31 May 2019 10:45:00 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-233.ams2.redhat.com [10.36.116.233])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1206271AE;
	Fri, 31 May 2019 10:44:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 12:44:22 +0200
Message-Id: <20190531104432.29379-14-david@redhat.com>
In-Reply-To: <20190531104432.29379-1-david@redhat.com>
References: <20190531104432.29379-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 31 May 2019 10:45:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v1 13/23] s390x/tcg: Implement VECTOR LOAD
 LENGTHENED
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

Take care of reading/indicating the 32-bit elements.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  2 ++
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.inc.c | 19 +++++++++++++++++
 target/s390x/vec_fpu_helper.c   | 36 +++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index 10a9cb39b6..cb25141ffe 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -278,6 +278,8 @@ DEF_HELPER_FLAGS_5(gvec_vfd64, TCG_CALL_NO_WG, void, =
ptr, cptr, cptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_vfd64s, TCG_CALL_NO_WG, void, ptr, cptr, cptr, e=
nv, i32)
 DEF_HELPER_FLAGS_4(gvec_vfi64, TCG_CALL_NO_WG, void, ptr, cptr, env, i32=
)
 DEF_HELPER_FLAGS_4(gvec_vfi64s, TCG_CALL_NO_WG, void, ptr, cptr, env, i3=
2)
+DEF_HELPER_FLAGS_4(gvec_vfll32, TCG_CALL_NO_WG, void, ptr, cptr, env, i3=
2)
+DEF_HELPER_FLAGS_4(gvec_vfll32s, TCG_CALL_NO_WG, void, ptr, cptr, env, i=
32)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index f77aa41253..5afdb36aec 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1230,6 +1230,8 @@
     F(0xe7e5, VFD,     VRR_c, V,   0, 0, 0, 0, vfa, 0, IF_VEC)
 /* VECTOR LOAD FP INTEGER */
     F(0xe7c7, VFI,     VRR_a, V,   0, 0, 0, 0, vcdg, 0, IF_VEC)
+/* VECTOR LOAD LENGTHENED */
+    F(0xe7c4, VFLL,    VRR_a, V,   0, 0, 0, 0, vfll, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 59d8b971c0..a25985e5c9 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -2679,3 +2679,22 @@ static DisasJumpType op_vcdg(DisasContext *s, Disa=
sOps *o)
                    deposit32(m4, 4, 4, erm), fn);
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vfll(DisasContext *s, DisasOps *o)
+{
+    const uint8_t fpf =3D get_field(s->fields, m3);
+    const uint8_t m4 =3D get_field(s->fields, m4);
+    gen_helper_gvec_2_ptr *fn =3D gen_helper_gvec_vfll32;
+
+    if (fpf !=3D FPF_SHORT || extract32(m4, 0, 3)) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    if (extract32(m4, 3, 1)) {
+        fn =3D gen_helper_gvec_vfll32s;
+    }
+    gen_gvec_2_ptr(get_field(s->fields, v1), get_field(s->fields, v2), c=
pu_env,
+                   0, fn);
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/vec_fpu_helper.=
c
index 63ba4cf548..f8919beed5 100644
--- a/target/s390x/vec_fpu_helper.c
+++ b/target/s390x/vec_fpu_helper.c
@@ -412,3 +412,39 @@ void HELPER(gvec_vfi64s)(void *v1, const void *v2, C=
PUS390XState *env,
=20
     vop64_2(v1, v2, env, true, XxC, erm, vfi64, GETPC());
 }
+
+static void vfll32(S390Vector *v1, const S390Vector *v2, CPUS390XState *=
env,
+                   bool s, uintptr_t retaddr)
+{
+    uint8_t vxc, vec_exc =3D 0;
+    S390Vector tmp =3D {};
+    int i;
+
+    for (i =3D 0; i < 2; i++) {
+        /* load from even element */
+        const float32 a =3D make_float32(s390_vec_read_element32(v2, i *=
 2));
+        const uint64_t ret =3D float64_val(float32_to_float64(a,
+                                                            &env->fpu_st=
atus));
+
+        s390_vec_write_element64(&tmp, i, ret);
+        /* indicate the source element */
+        vxc =3D check_ieee_exc(env, i * 2, false, &vec_exc);
+        if (s || vxc) {
+            break;
+        }
+    }
+    handle_ieee_exc(env, vxc, vec_exc, retaddr);
+    *v1 =3D tmp;
+}
+
+void HELPER(gvec_vfll32)(void *v1, const void *v2, CPUS390XState *env,
+                         uint32_t desc)
+{
+    vfll32(v1, v2, env, false, GETPC());
+}
+
+void HELPER(gvec_vfll32s)(void *v1, const void *v2, CPUS390XState *env,
+                          uint32_t desc)
+{
+    vfll32(v1, v2, env, true, GETPC());
+}
--=20
2.20.1


