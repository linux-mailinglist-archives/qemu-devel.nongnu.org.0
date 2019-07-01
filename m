Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13162171B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 12:41:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRaJ5-0008WL-R5
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 06:41:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49394)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hRa6N-0006TZ-T0
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:28:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hRa1y-0005Jt-Px
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:24:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32836)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hRa1y-0005Jl-Ic; Fri, 17 May 2019 06:24:02 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4F603082137;
	Fri, 17 May 2019 10:24:01 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 554B538E00;
	Fri, 17 May 2019 10:23:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 12:21:36 +0200
Message-Id: <20190517102145.21812-32-david@redhat.com>
In-Reply-To: <20190517102145.21812-1-david@redhat.com>
References: <20190517102145.21812-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 17 May 2019 10:24:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 31/40] s390x/tcg: Implement
 VECTOR SHIFT RIGHT ARITHMETIC
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

Similar to VECTOR SHIFT LEFT ARITHMETIC. Add s390_vec_sar() similar to
s390_vec_shr().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/helper.h           |  1 +
 target/s390x/insn-data.def      |  4 ++++
 target/s390x/translate_vx.inc.c | 17 +++++++++++++++++
 target/s390x/vec_int_helper.c   | 26 ++++++++++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/target/s390x/helper.h b/target/s390x/helper.h
index b4ddc8a722..fda274d325 100644
--- a/target/s390x/helper.h
+++ b/target/s390x/helper.h
@@ -205,6 +205,7 @@ DEF_HELPER_FLAGS_4(gvec_verll16, TCG_CALL_NO_RWG, voi=
d, ptr, cptr, i64, i32)
 DEF_HELPER_FLAGS_4(gvec_verim8, TCG_CALL_NO_RWG, void, ptr, cptr, cptr, =
i32)
 DEF_HELPER_FLAGS_4(gvec_verim16, TCG_CALL_NO_RWG, void, ptr, cptr, cptr,=
 i32)
 DEF_HELPER_FLAGS_4(gvec_vsl, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32)
+DEF_HELPER_FLAGS_4(gvec_vsra, TCG_CALL_NO_RWG, void, ptr, cptr, i64, i32=
)
=20
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_3(servc, i32, env, i64, i64)
diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 76aec5a21f..587de3eaac 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1166,6 +1166,10 @@
     F(0xe775, VSLB,    VRR_c, V,   0, 0, 0, 0, vsl, 0, IF_VEC)
 /* VECTOR SHIFT LEFT DOUBLE BY BYTE */
     F(0xe777, VSLDB,   VRI_d, V,   0, 0, 0, 0, vsldb, 0, IF_VEC)
+/* VECTOR SHIFT RIGHT ARITHMETIC */
+    F(0xe77e, VSRA,    VRR_c, V,   0, 0, 0, 0, vsra, 0, IF_VEC)
+/* VECTOR SHIFT RIGHT ARITHMETIC BY BYTE */
+    F(0xe77f, VSRAB,   VRR_c, V,   0, 0, 0, 0, vsra, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 43f67e3f82..a5636f0733 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -2089,3 +2089,20 @@ static DisasJumpType op_vsldb(DisasContext *s, Dis=
asOps *o)
     tcg_temp_free(t2);
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vsra(DisasContext *s, DisasOps *o)
+{
+    TCGv_i64 shift =3D tcg_temp_new_i64();
+
+    read_vec_element_i64(shift, get_field(s->fields, v3), 7, ES_8);
+    if (s->fields->op2 =3D=3D 0x7e) {
+        tcg_gen_andi_i64(shift, shift, 0x7);
+    } else {
+        tcg_gen_andi_i64(shift, shift, 0x78);
+    }
+
+    gen_gvec_2i_ool(get_field(s->fields, v1), get_field(s->fields, v2),
+                    shift, 0, gen_helper_gvec_vsra);
+    tcg_temp_free_i64(shift);
+    return DISAS_NEXT;
+}
diff --git a/target/s390x/vec_int_helper.c b/target/s390x/vec_int_helper.=
c
index 3df069f033..67e9f2b0ed 100644
--- a/target/s390x/vec_int_helper.c
+++ b/target/s390x/vec_int_helper.c
@@ -49,6 +49,26 @@ static void s390_vec_shl(S390Vector *d, const S390Vect=
or *a, uint64_t count)
     }
 }
=20
+static void s390_vec_sar(S390Vector *d, const S390Vector *a, uint64_t co=
unt)
+{
+    uint64_t tmp;
+
+    if (count =3D=3D 0) {
+        d->doubleword[0] =3D a->doubleword[0];
+        d->doubleword[1] =3D a->doubleword[1];
+    } else if (count =3D=3D 64) {
+        d->doubleword[1] =3D a->doubleword[0];
+        d->doubleword[0] =3D 0;
+    } else if (count < 64) {
+        tmp =3D a->doubleword[1] >> count;
+        d->doubleword[1] =3D deposit64(tmp, 64 - count, count, a->double=
word[0]);
+        d->doubleword[0] =3D (int64_t)a->doubleword[0] >> count;
+    } else {
+        d->doubleword[1] =3D (int64_t)a->doubleword[0] >> (count - 64);
+        d->doubleword[0] =3D 0;
+    }
+}
+
 static void s390_vec_shr(S390Vector *d, const S390Vector *a, uint64_t co=
unt)
 {
     uint64_t tmp;
@@ -535,3 +555,9 @@ void HELPER(gvec_vsl)(void *v1, const void *v2, uint6=
4_t count,
 {
     s390_vec_shl(v1, v2, count);
 }
+
+void HELPER(gvec_vsra)(void *v1, const void *v2, uint64_t count,
+                       uint32_t desc)
+{
+    s390_vec_sar(v1, v2, count);
+}
--=20
2.20.1


