Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF19723E1A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 19:12:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSlpy-0007Ev-Nw
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 13:12:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSliI-0000sN-6n
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:04:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSliD-0002jg-CJ
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:04:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSliD-0002hO-4i; Mon, 20 May 2019 13:04:33 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64DB95946B;
	Mon, 20 May 2019 17:04:19 +0000 (UTC)
Received: from localhost (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AABC600CC;
	Mon, 20 May 2019 17:04:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 19:02:16 +0200
Message-Id: <20190520170302.13643-9-cohuck@redhat.com>
In-Reply-To: <20190520170302.13643-1-cohuck@redhat.com>
References: <20190520170302.13643-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 20 May 2019 17:04:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 08/54] s390x/tcg: Implement VECTOR ADD WITH CARRY
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

Only slightly ugly, perform two additions. At least it is only supported
for 128 bit elements.

Introduce gen_gvec128_4_i64() similar to gen_gvec128_3_i64().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.inc.c | 63 +++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index f0e62b9aa860..38d1e22a6d54 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1060,6 +1060,8 @@
     F(0xe7f3, VA,      VRR_c, V,   0, 0, 0, 0, va, 0, IF_VEC)
 /* VECTOR ADD COMPUTE CARRY */
     F(0xe7f1, VACC,    VRR_c, V,   0, 0, 0, 0, vacc, 0, IF_VEC)
+/* VECTOR ADD WITH CARRY */
+    F(0xe7bb, VAC,     VRR_d, V,   0, 0, 0, 0, vac, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index a97fce5b656b..d3d3442c0d2e 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -196,6 +196,41 @@ static void gen_gvec128_3_i64(gen_gvec128_3_i64_fn f=
n, uint8_t d, uint8_t a,
         tcg_temp_free_i64(bl);
 }
=20
+typedef void (*gen_gvec128_4_i64_fn)(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 =
al,
+                                     TCGv_i64 ah, TCGv_i64 bl, TCGv_i64 =
bh,
+                                     TCGv_i64 cl, TCGv_i64 ch);
+static void gen_gvec128_4_i64(gen_gvec128_4_i64_fn fn, uint8_t d, uint8_=
t a,
+                              uint8_t b, uint8_t c)
+{
+        TCGv_i64 dh =3D tcg_temp_new_i64();
+        TCGv_i64 dl =3D tcg_temp_new_i64();
+        TCGv_i64 ah =3D tcg_temp_new_i64();
+        TCGv_i64 al =3D tcg_temp_new_i64();
+        TCGv_i64 bh =3D tcg_temp_new_i64();
+        TCGv_i64 bl =3D tcg_temp_new_i64();
+        TCGv_i64 ch =3D tcg_temp_new_i64();
+        TCGv_i64 cl =3D tcg_temp_new_i64();
+
+        read_vec_element_i64(ah, a, 0, ES_64);
+        read_vec_element_i64(al, a, 1, ES_64);
+        read_vec_element_i64(bh, b, 0, ES_64);
+        read_vec_element_i64(bl, b, 1, ES_64);
+        read_vec_element_i64(ch, c, 0, ES_64);
+        read_vec_element_i64(cl, c, 1, ES_64);
+        fn(dl, dh, al, ah, bl, bh, cl, ch);
+        write_vec_element_i64(dh, d, 0, ES_64);
+        write_vec_element_i64(dl, d, 1, ES_64);
+
+        tcg_temp_free_i64(dh);
+        tcg_temp_free_i64(dl);
+        tcg_temp_free_i64(ah);
+        tcg_temp_free_i64(al);
+        tcg_temp_free_i64(bh);
+        tcg_temp_free_i64(bl);
+        tcg_temp_free_i64(ch);
+        tcg_temp_free_i64(cl);
+}
+
 static void gen_gvec_dupi(uint8_t es, uint8_t reg, uint64_t c)
 {
     switch (es) {
@@ -1083,3 +1118,31 @@ static DisasJumpType op_vacc(DisasContext *s, Disa=
sOps *o)
                get_field(s->fields, v3), &g[es]);
     return DISAS_NEXT;
 }
+
+static void gen_ac2_i64(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 al, TCGv_i64 =
ah,
+                        TCGv_i64 bl, TCGv_i64 bh, TCGv_i64 cl, TCGv_i64 =
ch)
+{
+    TCGv_i64 tl =3D tcg_temp_new_i64();
+    TCGv_i64 th =3D tcg_const_i64(0);
+
+    /* extract the carry only */
+    tcg_gen_extract_i64(tl, cl, 0, 1);
+    tcg_gen_add2_i64(dl, dh, al, ah, bl, bh);
+    tcg_gen_add2_i64(dl, dh, dl, dh, tl, th);
+
+    tcg_temp_free_i64(tl);
+    tcg_temp_free_i64(th);
+}
+
+static DisasJumpType op_vac(DisasContext *s, DisasOps *o)
+{
+    if (get_field(s->fields, m5) !=3D ES_128) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    gen_gvec128_4_i64(gen_ac2_i64, get_field(s->fields, v1),
+                      get_field(s->fields, v2), get_field(s->fields, v3)=
,
+                      get_field(s->fields, v4));
+    return DISAS_NEXT;
+}
--=20
2.20.1


