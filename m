Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA3832EC17
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 14:29:26 +0100 (CET)
Received: from localhost ([::1]:44402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIAWD-0003uN-6f
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 08:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIATx-0002Zu-RC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:27:05 -0500
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14]:50386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lIATt-00024Y-Vb
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 08:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yIAXfwirLoiYvOspHSlsnTP6N7PsbWc5bt46yW0Tvig=; b=TOSJYfpQKHwRLqjQsOj2X9ccwN
 ffRsBuqtJTSUVKgmet6hWM6sTWyrI+8vrLfz1ZpPBy2bngIqAPAq36Q7hW/JiOUeo+4/STyn1bnEN
 bTqInGwu75Qcvvy4kJiEjj+NxKRpJ0zj+GAKnaoVgLZ3+KLyC0BykeiSJS7Uh8m77xCk=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/tricore: Fix OPC2_32_RRPW_EXTR for width=0
Date: Fri,  5 Mar 2021 14:26:29 +0100
Message-Id: <20210305132629.755627-3-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305132629.755627-1-kbastian@mail.uni-paderborn.de>
References: <20210305132629.755627-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.5.131517, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=30588201, da=102559882,
 mc=524, sc=4, hc=520, sp=0, fso=30588201, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kbastian@mail.uni-paderborn.de, david.brenken@efs-auto.de,
 georg.hofstetter@efs-auto.de, andreas.konopik@efs-auto.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

if width was 0 we would run into the assertion:

qemu-system-tricore: ../upstream/tcg/tcg-op.c:217: tcg_gen_sari_i32: Assertion `arg2 >= 0 && arg2 < 32' failed.o

The instruction manuel specifies undefined behaviour for this case. So
we bring this in line with the golden Infineon simlator 'tsim', which
simply writes 0 to the result in case of width=0.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 67a7f646a2..d8b773ab37 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -6998,10 +6998,16 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
     pos = MASK_OP_RRPW_POS(ctx->opcode);
     width = MASK_OP_RRPW_WIDTH(ctx->opcode);
 
+
     switch (op2) {
     case OPC2_32_RRPW_EXTR:
+        if (width == 0) {
+                tcg_gen_movi_tl(cpu_gpr_d[r3], 0);
+                break;
+        }
+
         if (pos + width <= 32) {
-            /* optimize special cases */
+                        /* optimize special cases */
             if ((pos == 0) && (width == 8)) {
                 tcg_gen_ext8s_tl(cpu_gpr_d[r3], cpu_gpr_d[r1]);
             } else if ((pos == 0) && (width == 16)) {
-- 
2.30.1


