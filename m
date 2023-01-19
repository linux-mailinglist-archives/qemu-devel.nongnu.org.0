Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD92673456
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 10:26:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIR8e-0004G3-11; Thu, 19 Jan 2023 04:23:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pIR8c-0004Fh-4q
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:23:14 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1pIR8a-0006D0-Ke
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 04:23:13 -0500
Received: from [127.0.1.1] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id BA341406BB55;
 Thu, 19 Jan 2023 09:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru BA341406BB55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1674120168;
 bh=TWAOjLkooBwZEu2UaJXs+LLyZ13Mqhg7vRWmDDIM4UM=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Kp1FbAxTlM9qfa7ftLwiM8QwQikG9HmCoxzASq/wzjAKT04xGAgAqz2Dcb/Gxc1v9
 BAxCMIuZ35owL9hp7euwbhM6wFQ9cHvct2behsIjI0L/s7xiB2oOHRKB07JlXmUOnp
 LgdHXf+Jv85DW7WTWl7yYh3UDE+T+O5CcHDV+O1U=
Subject: [PATCH v2 1/5] target/avr: fix long address calculation
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, mrolnik@gmail.com, philmd@linaro.org,
 richard.henderson@linaro.org
Date: Thu, 19 Jan 2023 12:22:48 +0300
Message-ID: <167412016849.3110454.2779669980014238134.stgit@pasha-ThinkPad-X280>
In-Reply-To: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
References: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
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
index 2bed56f135..552f739b3d 100644
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


