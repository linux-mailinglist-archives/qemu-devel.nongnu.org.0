Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE12216F6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 12:34:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRaBs-0002Dx-Tr
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 06:34:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hRa6F-0006W1-St
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hRa2F-0005Zn-8e
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:24:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34860)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hRa2F-0005ZI-2b; Fri, 17 May 2019 06:24:19 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 686B2C0624A1;
	Fri, 17 May 2019 10:24:18 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEF0B19732;
	Fri, 17 May 2019 10:24:14 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 12:21:44 +0200
Message-Id: <20190517102145.21812-40-david@redhat.com>
In-Reply-To: <20190517102145.21812-1-david@redhat.com>
References: <20190517102145.21812-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 17 May 2019 10:24:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 39/40] s390x/tcg: Implement
 VECTOR SUM ACROSS WORD
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

Similar to VECTOR SUM ACROSS DOUBLEWORD.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def      |  2 ++
 target/s390x/translate_vx.inc.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 2483ee01d7..a52db41388 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1186,6 +1186,8 @@
     F(0xe765, VSUMG,   VRR_c, V,   0, 0, 0, 0, vsumg, 0, IF_VEC)
 /* VECTOR SUM ACROSS QUADWORD */
     F(0xe767, VSUMQ,   VRR_c, V,   0, 0, 0, 0, vsumq, 0, IF_VEC)
+/* VECTOR SUM ACROSS WORD */
+    F(0xe764, VSUM,    VRR_c, V,   0, 0, 0, 0, vsum, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 16bfbfce57..52ab8562e6 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -2313,3 +2313,32 @@ static DisasJumpType op_vsumq(DisasContext *s, Dis=
asOps *o)
     tcg_temp_free_i64(tmpl);
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vsum(DisasContext *s, DisasOps *o)
+{
+    const uint8_t es =3D get_field(s->fields, m4);
+    TCGv_i32 sum, tmp;
+    uint8_t dst_idx;
+
+    if (es > ES_16) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+
+    sum =3D tcg_temp_new_i32();
+    tmp =3D tcg_temp_new_i32();
+    for (dst_idx =3D 0; dst_idx < 4; dst_idx++) {
+        uint8_t idx =3D dst_idx * NUM_VEC_ELEMENTS(es) / 4;
+        const uint8_t max_idx =3D idx + NUM_VEC_ELEMENTS(es) / 4 - 1;
+
+        read_vec_element_i32(sum, get_field(s->fields, v3), max_idx, es)=
;
+        for (; idx <=3D max_idx; idx++) {
+            read_vec_element_i32(tmp, get_field(s->fields, v2), idx, es)=
;
+            tcg_gen_add_i32(sum, sum, tmp);
+        }
+        write_vec_element_i32(sum, get_field(s->fields, v1), dst_idx, ES=
_32);
+    }
+    tcg_temp_free_i32(sum);
+    tcg_temp_free_i32(tmp);
+    return DISAS_NEXT;
+}
--=20
2.20.1


