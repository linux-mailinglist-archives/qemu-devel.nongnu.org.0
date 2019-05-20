Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529523F72
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 19:51:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSmRl-0006XZ-Jf
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 13:51:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSloC-0006An-UB
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:10:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSloB-0005Mn-3x
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:10:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSlo9-0005Le-Sd; Mon, 20 May 2019 13:10:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46E8830842B3;
	Mon, 20 May 2019 17:10:36 +0000 (UTC)
Received: from localhost (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD49F60BFC;
	Mon, 20 May 2019 17:10:34 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 19:02:50 +0200
Message-Id: <20190520170302.13643-43-cohuck@redhat.com>
In-Reply-To: <20190520170302.13643-1-cohuck@redhat.com>
References: <20190520170302.13643-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 20 May 2019 17:10:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 42/54] s390x/tcg: Implement VECTOR SUM ACROSS
 DOUBLEWORD
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

Perform the calculations without a helper. Only 16 bit or 32 bit values
have to be added.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.inc.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index a8d90517f613..dd370030824e 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1182,6 +1182,8 @@
     F(0xe7bf, VSBI,    VRR_d, V,   0, 0, 0, 0, vsbi, 0, IF_VEC)
 /* VECTOR SUBTRACT WITH BORROW COMPUTE BORROW INDICATION */
     F(0xe7bd, VSBCBI,  VRR_d, V,   0, 0, 0, 0, vsbcbi, 0, IF_VEC)
+/* VECTOR SUM ACROSS DOUBLEWORD */
+    F(0xe765, VSUMG,   VRR_c, V,   0, 0, 0, 0, vsumg, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 85cd5f03b352..7b4efee5c0a2 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -2252,3 +2252,32 @@ static DisasJumpType op_vsbcbi(DisasContext *s, Di=
sasOps *o)
                       get_field(s->fields, v4));
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vsumg(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es =3D get_field(s->fields, m4);
+    TCGv_i64 sum, tmp;
+    uint8_t dst_idx;
+
+    if (es =3D=3D ES_8 || es > ES_32) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    sum =3D tcg_temp_new_i64();
+    tmp =3D tcg_temp_new_i64();
+    for (dst_idx =3D 0; dst_idx < 2; dst_idx++) {
+        uint8_t idx =3D dst_idx * NUM_VEC_ELEMENTS(es) / 2;
+        const uint8_t max_idx =3D idx + NUM_VEC_ELEMENTS(es) / 2 - 1;
+
+        read_vec_element_i64(sum, get_field(s->fields, v3), max_idx, es)=
;
+        for (; idx <=3D max_idx; idx++) {
+            read_vec_element_i64(tmp, get_field(s->fields, v2), idx, es)=
;
+            tcg_gen_add_i64(sum, sum, tmp);
+        }
+        write_vec_element_i64(sum, get_field(s->fields, v1), dst_idx, ES=
_64);
+    }
+    tcg_temp_free_i64(sum);
+    tcg_temp_free_i64(tmp);
+    return DISAS_NEXT;
+}
--=20
2.20.1


