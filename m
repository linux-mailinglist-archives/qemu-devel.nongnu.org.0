Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D5F33A0D3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:59:12 +0100 (CET)
Received: from localhost ([::1]:57280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAPm-00016x-OV
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:59:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGP-0007jA-Ob
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:29 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGO-00078v-Ac
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:29 -0500
Received: by mail-wr1-x436.google.com with SMTP id z2so3619973wrl.5
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jh52farOo7vXC67krWWYD5jALBg5ls6JEjcKoXwmteI=;
 b=WG0cyiHoYNv5aVEpSxlP4biXWUrdFxvh51PmWCeTd7EZ7+h+wDFkoCWfnwvDuBRTsa
 00rOKm65CsECQOy3b9AvarYnqskKi2IX/drAJNddaiVNUUW0gShI181OLkkTr+heV0Ne
 XdqgHarRH9vAo+Q0WDheaa7LXdPCYisoYh+895KbbeOpGK8s8In1tTwxqennCPFExx5n
 x4JltAHStWh3ks4C3TBC9M+aaSGqreIpYewIgr/LxBQPRkqEGNQBhDEZsM5+5YOR+pFH
 l1h/dwaGsDAXQ5w6M3Odv1hq8HgdoSHLivCqkvdKZzDIwYlKayCDJs5quHCJ/gvWQ0VJ
 UQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jh52farOo7vXC67krWWYD5jALBg5ls6JEjcKoXwmteI=;
 b=to8nvD/ibuPVHG2NKu8RHQXs0J28NCQVQVVwyE23nxQ5YNQ17Ld9lp/fCm1+REtAd2
 37/rsnlKlobf+1J5mGNQhM9yZ0uRTXU51dQGolidAWsoIpGQw3ywHIAfNTd23U/ISWqO
 JskCDhdQzBTiua5ZCpZZPumvQtAGurld4kS1YpbMltcMTsr0e1xgfbjjN8yexDDHBdQd
 rTXeq1zZZBNS7+lKSt7w01ZQ2yCEywv6Ak2b0q9mouUEWuL8zhxrY6yZooAddD7WnzNO
 RKJZV0cNTU8FBLOc5gqoe9mi+T9KdR5no/9IsZ1ppLJsEVbSvkBDtb8xNvNek1Uv+D4F
 Z3aw==
X-Gm-Message-State: AOAM530q6tjSg/M7+/ZRzXQo4dPtcYfFCLSquhvxC2HDJR5aVuFgQ1mr
 LG+8xKyFw9Wx6a1pgTBESXl6XincHv/tPg==
X-Google-Smtp-Source: ABdhPJzD9UEEiK9GJE4qEYPKZW4vxL8gN+aondpgmxo8U8aDEJZ6z9+e+nElJRpXHQxBvcq9YAj8gg==
X-Received: by 2002:adf:a2c7:: with SMTP id t7mr20288862wra.42.1615664966858; 
 Sat, 13 Mar 2021 11:49:26 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y18sm12911296wrq.61.2021.03.13.11.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/27] target/mips: Pass instruction opcode to decode_opc_mxu()
Date: Sat, 13 Mar 2021 20:48:13 +0100
Message-Id: <20210313194829.2193621-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the next commit we'll make decode_opc_mxu() match decodetree
prototype by returning a boolean. First pass ctx->opcode as an
argument.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 9c06a0df814..8ab0a96a340 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25780,17 +25780,17 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static void decode_opc_mxu(DisasContext *ctx)
+static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
 {
-    uint32_t opcode = extract32(ctx->opcode, 0, 6);
+    uint32_t opcode = extract32(insn, 0, 6);
 
     if (opcode == OPC__MXU_MUL) {
         uint32_t  rs, rt, rd, op1;
 
-        rs = extract32(ctx->opcode, 21, 5);
-        rt = extract32(ctx->opcode, 16, 5);
-        rd = extract32(ctx->opcode, 11, 5);
-        op1 = MASK_SPECIAL2(ctx->opcode);
+        rs = extract32(insn, 21, 5);
+        rt = extract32(insn, 16, 5);
+        rd = extract32(insn, 11, 5);
+        op1 = MASK_SPECIAL2(insn);
 
         gen_arith(ctx, op1, rd, rs, rt);
 
@@ -26995,7 +26995,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
 #if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
-            decode_opc_mxu(ctx);
+            decode_opc_mxu(ctx, ctx->opcode);
             break;
         }
 #endif
-- 
2.26.2


