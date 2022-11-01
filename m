Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77115614447
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 06:32:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opjrC-0003ZQ-K2; Tue, 01 Nov 2022 01:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1opjqS-0003Wp-EV
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 01:29:55 -0400
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1opjqQ-0006Dn-Ap
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 01:29:52 -0400
Received: from [127.0.1.1] (unknown [89.252.109.106])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1B0E5419E9D8;
 Tue,  1 Nov 2022 05:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 1B0E5419E9D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1667280585;
 bh=fVUmajGDdjQlGscA68w+v4vEZhmpIj9P60oO8gt+hMc=;
 h=Subject:From:To:Cc:Date:From;
 b=Rba1IRAHfiSeK3vOtjxRxKzDSDNBoIkD0dnh/DnQ5keXPVS+M5o9v8KHkGaRwA3zV
 afjk1khp9T0sla17BBgXUzSxF+jwTQPbHHxitGBSErl+0kJVhSFBRB7duyHNYBoLM0
 TJZYWV04wgb8KVw2DOEMps+o4eGIGDONy/vHWfro=
Subject: [PATCH] target/mips: enable LBX/LWX/* instructions for Octeon
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
To: qemu-devel@nongnu.org
Cc: pavel.dovgalyuk@ispras.ru, richard.henderson@linaro.org, philmd@linaro.org,
 jiaxun.yang@flygoat.com
Date: Tue, 01 Nov 2022 08:29:44 +0300
Message-ID: <166728058455.229236.13834649461181619195.stgit@pasha-ThinkPad-X280>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

This patch changes condition and function name for enabling
indexed load instructions for Octeon vCPUs. Octeons do not
have DSP extension, but implement LBX-and-others.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
---
 target/mips/tcg/translate.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c3f92ea652..6248143c62 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -12173,12 +12173,16 @@ enum {
 #include "nanomips_translate.c.inc"
 
 /* MIPSDSP functions. */
-static void gen_mipsdsp_ld(DisasContext *ctx, uint32_t opc,
+
+/* Indexed load is not for DSP only */
+static void gen_mips_lx(DisasContext *ctx, uint32_t opc,
                            int rd, int base, int offset)
 {
     TCGv t0;
 
-    check_dsp(ctx);
+    if (!(ctx->insn_flags & INSN_OCTEON)) {
+        check_dsp(ctx);
+    }
     t0 = tcg_temp_new();
 
     if (base == 0) {
@@ -14523,7 +14527,7 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
         case OPC_LBUX:
         case OPC_LHX:
         case OPC_LWX:
-            gen_mipsdsp_ld(ctx, op2, rd, rs, rt);
+            gen_mips_lx(ctx, op2, rd, rs, rt);
             break;
         default:            /* Invalid */
             MIPS_INVAL("MASK LX");


