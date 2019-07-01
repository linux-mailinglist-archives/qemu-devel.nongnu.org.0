Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AACA15714
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 02:50:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNoJn-0007r8-2z
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 20:50:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anton@ozlabs.org>) id 1hNoHV-0006qZ-W5
	for qemu-devel@nongnu.org; Mon, 06 May 2019 20:48:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anton@ozlabs.org>) id 1hNoHV-0002vf-3F
	for qemu-devel@nongnu.org; Mon, 06 May 2019 20:48:29 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:34191 helo=ozlabs.org)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <anton@ozlabs.org>)
	id 1hNoHU-0002sJ-K0; Mon, 06 May 2019 20:48:29 -0400
Received: by ozlabs.org (Postfix, from userid 1010)
	id 44ygvW5yvxz9sB3; Tue,  7 May 2019 10:48:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
	t=1557190103; bh=z4+wMWph5H3PMOVcpvxQ4fKd3cXZUwvUbBJ8oGGsE3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VV82MpV/2p/3lqACVpOinfXwmaHhwxRfHZ1tzFm7wbAPWqICSFbnhB2Ep/PJO5tue
	sbhyFmR1sWFydgAUqPwkMIp05aeAk+Zf7tAZ+DFAFaRNKMkhQSZhlZXuwTvrHp6kLu
	5vSV1M7f+P7cihhnZoeHwDhJwcj5Op6KhWoQdZsxT4Mmp6GjkKrLyumkplO83DMme8
	Jqmi7l+mnflNx8KcX9BwspOnVxJvpy9wm7fJNEOgnI/ogiAo0eNxJEySnBP/s7PTdt
	VFXnX1NI818eZHvInfqZkFbQfs1cO+FFgPJnpE5TJR1X83OXCX/0cWwh91HBYXgKgZ
	SYv4s46Pqif3g==
From: Anton Blanchard <anton@ozlabs.org>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:48:04 +1000
Message-Id: <20190507004811.29968-2-anton@ozlabs.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507004811.29968-1-anton@ozlabs.org>
References: <20190507004811.29968-1-anton@ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PATCH 2/9] target/ppc: Fix xxspltib
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
Cc: ego@linux.vnet.ibm.com, sandipandas1990@gmail.com,
	richard.henderson@linaro.org, mark.cave-ayland@ilande.co.uk,
	f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

xxspltib raises a VMX or a VSX exception depending on the register
set it is operating on. We had a check, but it was backwards.

Fixes: f113283525a4 ("target-ppc: add xxspltib instruction")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 target/ppc/translate/vsx-impl.inc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/v=
sx-impl.inc.c
index 4d8ca7cf32..d050cc03ed 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -1355,16 +1355,17 @@ static void gen_xxspltib(DisasContext *ctx)
     int rt =3D xT(ctx->opcode);
=20
     if (rt < 32) {
-        if (unlikely(!ctx->altivec_enabled)) {
-            gen_exception(ctx, POWERPC_EXCP_VPU);
+        if (unlikely(!ctx->vsx_enabled)) {
+            gen_exception(ctx, POWERPC_EXCP_VSXU);
             return;
         }
     } else {
-        if (unlikely(!ctx->vsx_enabled)) {
-            gen_exception(ctx, POWERPC_EXCP_VSXU);
+        if (unlikely(!ctx->altivec_enabled)) {
+            gen_exception(ctx, POWERPC_EXCP_VPU);
             return;
         }
     }
+    printf("XT %x IMM8 %x\n", rt, uim8);
     tcg_gen_gvec_dup8i(vsr_full_offset(rt), 16, 16, uim8);
 }
=20
--=20
2.20.1


