Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1B511B40
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 16:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMCZs-0007sC-Dt
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 10:20:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hMCQc-0000AH-La
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:11:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1hMCQb-000727-PY
	for qemu-devel@nongnu.org; Thu, 02 May 2019 10:11:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44266)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1hMCQb-00071Z-Ka; Thu, 02 May 2019 10:11:13 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2BDC3092649;
	Thu,  2 May 2019 14:11:12 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-88.ams2.redhat.com [10.36.117.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5689F3793;
	Thu,  2 May 2019 14:11:11 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  2 May 2019 16:10:00 +0200
Message-Id: <20190502141019.6385-22-david@redhat.com>
In-Reply-To: <20190502141019.6385-1-david@redhat.com>
References: <20190502141019.6385-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 02 May 2019 14:11:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 21/40] s390x/tcg: Implement VECTOR NOR
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def      | 2 ++
 target/s390x/translate_vx.inc.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index bc8b84e1c2..4983867a44 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1136,6 +1136,8 @@
     F(0xe7a5, VMLO,    VRR_c, V,   0, 0, 0, 0, vm, 0, IF_VEC)
 /* VECTOR NAND */
     F(0xe76e, VNN,     VRR_c, VE,  0, 0, 0, 0, vnn, 0, IF_VEC)
+/* VECTOR NOR */
+    F(0xe76b, VNO,     VRR_c, V,   0, 0, 0, 0, vno, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index 33c9467c88..6aa996d230 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -1794,3 +1794,10 @@ static DisasJumpType op_vnn(DisasContext *s, Disas=
Ops *o)
                   get_field(s->fields, v2), get_field(s->fields, v3));
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vno(DisasContext *s, DisasOps *o)
+{
+    gen_gvec_fn_3(nor, ES_8, get_field(s->fields, v1), get_field(s->fiel=
ds, v2),
+                  get_field(s->fields, v3));
+    return DISAS_NEXT;
+}
--=20
2.20.1


