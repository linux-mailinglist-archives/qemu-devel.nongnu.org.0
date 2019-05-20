Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E031223E22
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 19:15:32 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38923 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSlsq-0001Jg-1Z
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 13:15:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSljR-0001qT-6o
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSljP-0003KK-Rk
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:05:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44386)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSljP-0003K0-M8; Mon, 20 May 2019 13:05:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F237E3082B1E;
	Mon, 20 May 2019 17:05:46 +0000 (UTC)
Received: from localhost (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CC1F5C221;
	Mon, 20 May 2019 17:05:41 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 19:02:22 +0200
Message-Id: <20190520170302.13643-15-cohuck@redhat.com>
In-Reply-To: <20190520170302.13643-1-cohuck@redhat.com>
References: <20190520170302.13643-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 20 May 2019 17:05:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 14/54] s390x/tcg: Implement VECTOR ELEMENT
 COMPARE *
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

Fairly easy to implement, we can make use of the existing CC helpers
cmps64 and cmpu64 - we siply have to sign extend the elements.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def      |  4 ++++
 target/s390x/translate_vx.inc.c | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index 64459465c51d..52e398f515b5 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1074,6 +1074,10 @@
     F(0xe7f0, VAVGL,   VRR_c, V,   0, 0, 0, 0, vavgl, 0, IF_VEC)
 /* VECTOR CHECKSUM */
     F(0xe766, VCKSM,   VRR_c, V,   0, 0, 0, 0, vcksm, 0, IF_VEC)
+/* VECTOR ELEMENT COMPARE */
+    F(0xe7db, VEC,     VRR_a, V,   0, 0, 0, 0, vec, cmps64, IF_VEC)
+/* VECTOR ELEMENT COMPARE LOGICAL */
+    F(0xe7d9, VECL,    VRR_a, V,   0, 0, 0, 0, vec, cmpu64, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index b9d40ffeb7a7..4d5af6e3b6ba 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -1369,3 +1369,23 @@ static DisasJumpType op_vcksm(DisasContext *s, Dis=
asOps *o)
     tcg_temp_free_i32(sum);
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vec(DisasContext *s, DisasOps *o)
+{
+    uint8_t es =3D get_field(s->fields, m3);
+    const uint8_t enr =3D NUM_VEC_ELEMENTS(es) / 2 - 1;
+
+    if (es > ES_64) {
+        gen_program_exception(s, PGM_SPECIFICATION);
+        return DISAS_NORETURN;
+    }
+    if (s->fields->op2 =3D=3D 0xdb) {
+        es |=3D MO_SIGN;
+    }
+
+    o->in1 =3D tcg_temp_new_i64();
+    o->in2 =3D tcg_temp_new_i64();
+    read_vec_element_i64(o->in1, get_field(s->fields, v1), enr, es);
+    read_vec_element_i64(o->in2, get_field(s->fields, v2), enr, es);
+    return DISAS_NEXT;
+}
--=20
2.20.1


