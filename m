Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B723F2F
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 19:37:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSmEQ-0003ID-DA
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 13:37:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSllX-0003bH-3y
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hSllV-00047k-Kj
	for qemu-devel@nongnu.org; Mon, 20 May 2019 13:07:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52736)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1hSllV-00047D-Et; Mon, 20 May 2019 13:07:57 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D8DEFC057F2C;
	Mon, 20 May 2019 17:07:55 +0000 (UTC)
Received: from localhost (ovpn-204-110.brq.redhat.com [10.40.204.110])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C783600C6;
	Mon, 20 May 2019 17:07:55 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 19:02:36 +0200
Message-Id: <20190520170302.13643-29-cohuck@redhat.com>
In-Reply-To: <20190520170302.13643-1-cohuck@redhat.com>
References: <20190520170302.13643-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 20 May 2019 17:07:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 28/54] s390x/tcg: Implement VECTOR OR
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

Reuse a gvec helper.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/insn-data.def      | 2 ++
 target/s390x/translate_vx.inc.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/target/s390x/insn-data.def b/target/s390x/insn-data.def
index b549b76b9698..fb74374a0a0a 100644
--- a/target/s390x/insn-data.def
+++ b/target/s390x/insn-data.def
@@ -1140,6 +1140,8 @@
     F(0xe76b, VNO,     VRR_c, V,   0, 0, 0, 0, vno, 0, IF_VEC)
 /* VECTOR NOT EXCLUSIVE OR */
     F(0xe76c, VNX,     VRR_c, VE,  0, 0, 0, 0, vnx, 0, IF_VEC)
+/* VECTOR OR */
+    F(0xe76a, VO,      VRR_c, V,   0, 0, 0, 0, vo, 0, IF_VEC)
=20
 #ifndef CONFIG_USER_ONLY
 /* COMPARE AND SWAP AND PURGE */
diff --git a/target/s390x/translate_vx.inc.c b/target/s390x/translate_vx.=
inc.c
index eb4e00751b69..54a5ca0c08e2 100644
--- a/target/s390x/translate_vx.inc.c
+++ b/target/s390x/translate_vx.inc.c
@@ -1812,3 +1812,10 @@ static DisasJumpType op_vnx(DisasContext *s, Disas=
Ops *o)
                   get_field(s->fields, v3));
     return DISAS_NEXT;
 }
+
+static DisasJumpType op_vo(DisasContext *s, DisasOps *o)
+{
+    gen_gvec_fn_3(or, ES_8, get_field(s->fields, v1), get_field(s->field=
s, v2),
+                  get_field(s->fields, v3));
+    return DISAS_NEXT;
+}
--=20
2.20.1


