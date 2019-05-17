Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 172FB21754
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 12:54:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46272 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRaVX-0002k6-5l
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 06:54:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hRa6b-0006uA-Dq
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hRa1N-0004v7-Kk
	for qemu-devel@nongnu.org; Fri, 17 May 2019 06:23:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36355)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hRa1N-0004uq-Fg; Fri, 17 May 2019 06:23:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D164A3034;
	Fri, 17 May 2019 10:23:23 +0000 (UTC)
Received: from t460s.redhat.com (unknown [10.36.118.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76ACC5B2F0;
	Fri, 17 May 2019 10:23:21 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 12:21:18 +0200
Message-Id: <20190517102145.21812-14-david@redhat.com>
In-Reply-To: <20190517102145.21812-1-david@redhat.com>
References: <20190517102145.21812-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 17 May 2019 10:23:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL SUBSYSTEM s390x 13/40] s390x/tcg: Implement
 VECTOR EXCLUSIVE OR
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

Easy, we can reuse an existing gvec helper.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def      | 2 ++
 target/s390x/translate_vx.inc.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index a355b7f62f..b8400c191a 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1088,6 +1088,8 @@
     F(0xe753, VCLZ,    VRR_a, V,   0, 0, 0, 0, vclz, 0, IF_VEC)
 /* VECTOR COUNT TRAILING ZEROS */
     F(0xe752, VCTZ,    VRR_a, V,   0, 0, 0, 0, vctz, 0, IF_VEC)
+/* VECTOR EXCLUSIVE OR */
+    F(0xe76d, VX,      VRR_c, V,   0, 0, 0, 0, vx, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 2f13d6fa9f..0935857eff 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -1476,3 +1476,10 @@ static DisasJumpType op_vctz(DisasContext *s, Disa=
sOps *o)
     gen_gvec_2(get_field(s->fields, v1), get_field(s->fields, v2), &g[es=
]);
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vx(DisasContext *s, DisasOps *o)
+{
+    gen_gvec_fn_3(xor, ES_8, get_field(s->fields, v1), get_field(s->fiel=
ds, v2),
+                 get_field(s->fields, v3));
+    return DISAS_NEXT;
+}
--=20
2.20.1


