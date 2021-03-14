Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0116733A525
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 15:04:03 +0100 (CET)
Received: from localhost ([::1]:35300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLRLe-0002IE-0M
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 10:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRFA-0003PE-El
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:20 -0400
Received: from hoth.uni-paderborn.de ([2001:638:502:c003::19]:45862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lLRF7-00038m-Km
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 09:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oUmowQ9d9iCIHAcueK7Re3aZKbvA5OZOA2lY3aK4+Bc=; b=UG9URUqb5paY+4RFgwKch01fqG
 nSncTbtuzHoUGKrLi86X6RcgL1Cz9BcEGCBn7FcQL4seo54OvuLaWoaqueMcVp4PNmNFcArMAk47q
 IMwwez6FwCqPRdGmWc8pIfvF5JF0YVhGFY/x7gxdENG+j22XSqPdZQ6SZKGo3wIRE808=;
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Subject: [PULL 7/7] target/tricore: Fix OPC2_32_RRPW_EXTR for width=0
Date: Sun, 14 Mar 2021 14:55:13 +0100
Message-Id: <20210314135513.1369871-8-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
References: <20210314135513.1369871-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.3.14.134815, AntiVirus-Engine: 5.80.0,
 AntiVirus-Data: 2021.2.8.5800000
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=31367618, da=103339299,
 mc=575, sc=4, hc=571, sp=0, fso=31367618, re=0, sd=0, hd=0
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::19;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=hoth.uni-paderborn.de
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
Cc: kbastian@mail.uni-paderborn.de,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

if width was 0 we would run into the assertion:

qemu-system-tricore: tcg/tcg-op.c:217: tcg_gen_sari_i32: Assertion `arg2 >= 0 && arg2 < 32' failed.o

The instruction manual specifies undefined behaviour for this case. So
we bring this in line with the golden Infineon simlator 'tsim', which
simply writes 0 to the result in case of width=0.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 5b7ed70e39..2a814263de 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -7000,6 +7000,11 @@ static void decode_rrpw_extract_insert(DisasContext *ctx)
 
     switch (op2) {
     case OPC2_32_RRPW_EXTR:
+        if (width == 0) {
+                tcg_gen_movi_tl(cpu_gpr_d[r3], 0);
+                break;
+        }
+
         if (pos + width <= 32) {
             /* optimize special cases */
             if ((pos == 0) && (width == 8)) {
-- 
2.30.1


