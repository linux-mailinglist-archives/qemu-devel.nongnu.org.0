Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFB5630C4F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 06:56:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owGpy-000707-GT; Sat, 19 Nov 2022 00:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1owGpw-0006zj-1P
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 00:56:20 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1owGpu-0003CU-5I
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 00:56:19 -0500
Received: from [127.0.1.1] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id 7FEC340737C9;
 Sat, 19 Nov 2022 05:55:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 7FEC340737C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1668837354;
 bh=lopgE0Ztaf5xd+Ce41J0Qzs4CnNliZvUDcGDp4IkyFY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=M44dHtdQPdILuhwPhkYPk2hnbNW40nOltu91t17KIO7DvgflParb/SA/UvbBFb+WU
 WBRTxvXmPins2cnshfxb8kbClHzvo8OrKUpxPx9k28P6YBA4JQ5LG7ijdqySU+aqGg
 WLZ52fXRreLwYCOR1XT079LO0MTCB7p3v8Etze14=
Subject: [PATCH 1/4] target/avr: fix long address calculation
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Sat, 19 Nov 2022 08:55:54 +0300
Message-ID: <166883735424.1540909.1819992647141291951.stgit@pasha-ThinkPad-X280>
In-Reply-To: <166883734868.1540909.6779276759642478650.stgit@pasha-ThinkPad-X280>
References: <166883734868.1540909.6779276759642478650.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

AVR ELPMX instruction (and some others) use three registers to
form long 24-bit address from RAMPZ and two 8-bit registers.
RAMPZ stores shifted 8 bits like ff0000 to simplify address calculation.
This patch fixes full address calculation in function gen_get_addr
by changing the mess in offsets of deposit tcg instructions.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/translate.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index e65b6008c0..c9a0a39c2d 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1572,8 +1572,8 @@ static TCGv gen_get_addr(TCGv H, TCGv M, TCGv L)
 {
     TCGv addr = tcg_temp_new_i32();
 
-    tcg_gen_deposit_tl(addr, M, H, 8, 8);
-    tcg_gen_deposit_tl(addr, L, addr, 8, 16);
+    tcg_gen_deposit_tl(addr, H, M, 8, 8);
+    tcg_gen_deposit_tl(addr, addr, L, 0, 8);
 
     return addr;
 }


