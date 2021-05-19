Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C99389105
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:33:52 +0200 (CEST)
Received: from localhost ([::1]:48402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNGh-0005fI-DJ
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCc-0000eb-VT
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:29:38 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:37856
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCY-0008J2-Df
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:29:38 -0400
Received: from host217-39-58-213.range217-39.btcentralplus.com
 ([217.39.58.213] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ljNCV-0003Tz-VL; Wed, 19 May 2021 15:29:32 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Wed, 19 May 2021 15:29:15 +0100
Message-Id: <20210519142917.16693-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
References: <20210519142917.16693-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 217.39.58.213
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 2/4] target/m68k: call gen_raise_exception() directly if
 single-stepping in gen_jmp_tb()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to consolidate the single-step exception handling into a single
helper, change gen_jmp_tb() so that it calls gen_raise_exception() directly
instead of gen_exception(). This ensures that all single-step exceptions are
now handled directly by gen_raise_exception().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 target/m68k/translate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index c774f2e8f0..f14ecab5a5 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -1518,7 +1518,9 @@ static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
 static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
 {
     if (unlikely(is_singlestepping(s))) {
-        gen_exception(s, dest, EXCP_DEBUG);
+        update_cc_op(s);
+        tcg_gen_movi_i32(QREG_PC, dest);
+        gen_raise_exception(EXCP_DEBUG);
     } else if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
-- 
2.20.1


