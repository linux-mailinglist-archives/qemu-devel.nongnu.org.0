Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08283A119F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Aug 2019 08:18:31 +0200 (CEST)
Received: from localhost ([::1]:45718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i3DlN-00048M-TO
	for lists+qemu-devel@lfdr.de; Thu, 29 Aug 2019 02:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35247)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dc0-0004Cm-DQ
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1i3Dbx-0003fX-Ts
 for qemu-devel@nongnu.org; Thu, 29 Aug 2019 02:08:48 -0400
Received: from ozlabs.org ([203.11.71.1]:46691)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1i3Dbw-0003av-Ti; Thu, 29 Aug 2019 02:08:45 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 46JscN0MMmz9sPM; Thu, 29 Aug 2019 16:08:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1567058916;
 bh=5CKZltm+l7owWX1JN0BhWEskM6vwu3i+0eJxpfK0ZWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T41M39cMzelEKEQ38oFxnProz3r1tkcS2dMsACCXWqaw2C2feO2mKe8bK7A47904G
 J6VApMMOO9qV9hxyugHHyTNSX5Vs2NiCqGvSDpVDiR1mlXSJhgHQPwqNNnKownHsuN
 HukKZtUtWW7VKeSNFQ5AJ/U/M8B9fJXlD9pULlQY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Thu, 29 Aug 2019 16:08:15 +1000
Message-Id: <20190829060827.25731-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829060827.25731-1-david@gibson.dropbear.id.au>
References: <20190829060827.25731-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: [Qemu-devel] [PULL 07/19] ppc: Fix xsmaddmdp and friends
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, aik@ozlabs.ru, groug@kaod.org, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Paul A. Clarke" <pc@us.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Paul A. Clarke" <pc@us.ibm.com>

A class of instructions of the form:
  op Target,A,B
which operate like:
  Target =3D Target * A + B
have a bit set which distinguishes them from instructions that operate as=
:
  Target =3D Target * B + A

This bit is not being checked properly (using PPC_BIT macro), so all
instructions in this class are operating incorrectly as the second form
above.  The bit was being checked as if it were part of a 64-bit
instruction opcode, rather than a proper 32-bit opcode.  Fix by using the
macro (PPC_BIT32) which treats the opcode as a 32-bit quantity.

Fixes: c9f4e4d8b632 ("target/ppc: improve VSX_FMADD with new GEN_VSX_HELP=
ER_VSX_MADD macro")

Signed-off-by: Paul A. Clarke <pc@us.ibm.com>
Message-Id: <1566401321-22419-1-git-send-email-pc@us.ibm.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/translate/vsx-impl.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/translate/vsx-impl.inc.c b/target/ppc/translate/v=
sx-impl.inc.c
index 3922686ad6..8287e272f5 100644
--- a/target/ppc/translate/vsx-impl.inc.c
+++ b/target/ppc/translate/vsx-impl.inc.c
@@ -1308,7 +1308,7 @@ static void gen_##name(DisasContext *ctx)          =
                           \
     }                                                                   =
      \
     xt =3D gen_vsr_ptr(xT(ctx->opcode));                                =
        \
     xa =3D gen_vsr_ptr(xA(ctx->opcode));                                =
        \
-    if (ctx->opcode & PPC_BIT(25)) {                                    =
      \
+    if (ctx->opcode & PPC_BIT32(25)) {                                  =
      \
         /*                                                              =
      \
          * AxT + B                                                      =
      \
          */                                                             =
      \
--=20
2.21.0


