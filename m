Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384B923F0A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 19:30:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39176 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSm7T-00068c-2O
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 13:30:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSllN-0003US-OP
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:07:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSllM-00044X-CQ
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:07:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46718)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSllM-000443-6i; Mon, 20 May 2019 13:07:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8E10187638;
	Mon, 20 May 2019 17:07:46 +0000 (UTC)
Received: from localhost (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5762927BAC;
	Mon, 20 May 2019 17:07:45 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 19:02:34 +0200
Message-Id: <20190520170302.13643-27-cohuck@redhat.com>
In-Reply-To: <20190520170302.13643-1-cohuck@redhat.com>
References: <20190520170302.13643-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 20 May 2019 17:07:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 26/54] s390x/tcg: Implement VECTOR NOR
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def      | 2 ++
 target/s390x/translate_vx.inc.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index bc8b84e1c2cf..4983867a441b 100644
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
index 7fcb7085e592..0578ff599948 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -1798,3 +1798,10 @@ static DisasJumpType op_vnn(DisasContext *s, Disas=
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


