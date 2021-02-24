Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2457F324443
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:01:50 +0100 (CET)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzPx-0002Qf-0e
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:01:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzMP-0007Db-Qd
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:58:09 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:34982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzMO-0002xP-CY
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:58:09 -0500
Received: by mail-wm1-x331.google.com with SMTP id o16so2783888wmh.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q1CPhtB2nFX6/Karm+8y/5hrFOndLW7yZ9tpIdrVQP4=;
 b=ty9QNgS4pvkCxQC0mUdRz6NuEwCm/Glyc8pnBdDTG+Z//hlmyEdllR7/qqmalGjmHh
 MWZ7sEFaDjGl8x7QjNIISNJuH24PP/hkzcKwVXdr8buZ3/s1OeLl2YvYfJ4WhmgrnN+Z
 prgLkuMz/CrepGVQqb8d2g02s1B/N3hU5iFwkgxMkbztVPaTuIr57wPV/NtQC6V6N89w
 hX6pw6bRQa9sRVReKQcG0oqtkzsbkNG8abOhfxtYk6aNO2k9LmgrwicPxrqI9eODJ4Iv
 /yV4ePpQMlsjIV0bLpWD7xJHNZEhqWR7RZJNAzXBk7s0yr0AQQHlhhlgbP3sDpvCYgFu
 +NHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q1CPhtB2nFX6/Karm+8y/5hrFOndLW7yZ9tpIdrVQP4=;
 b=OeJGP2+NHgN6d6w4Z6O9OqAhlH62YKnanH2RKMyTx/5fyBOylZkx2t10fNwKBCVYek
 M66tycUnulQ14Gr2qaQBDu5OKFBX17+2iWu/O4+psGik5YApAxUkgh8e7dxaLzLNan17
 M3sX70stJhYmBMwpIiqcwNbxql75wYapHInOvqd7drBDGZiKd6o7CBksCIwBAF3kkeCc
 pDv3sotmEjEHZlkj+dVTQ0NRwE8PTkgXYhv92aH4+cShM3ECw6W+Uy2t/fN6+FusOuir
 czYEqeuNa1uE4n9PZ0JZg2CouZ01Z9hM2TIjFiBIFAhkk+UYTyphEz7P8QTm8tNNWe1s
 EBfA==
X-Gm-Message-State: AOAM533cGXuaQHgF93Tle9NnLOVCw2fAD+JLRINTDiUux0/VuMcWhy1X
 rpCfnkX7NBkW64OUIhUxmMvvzcvr0/U=
X-Google-Smtp-Source: ABdhPJzniH1C4GNRK3mJoYumfIc1RwpqRSqJKhuQOupG0QhC6IDfsWYDxhoPS5sabUYKNCyIo35rSQ==
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr1023630wma.18.1614193086840;
 Wed, 24 Feb 2021 10:58:06 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a5sm5045195wrs.35.2021.02.24.10.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:58:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/12] target/mips: Convert decode_opc_mxu() to decodetree
 prototype
Date: Wed, 24 Feb 2021 19:57:03 +0100
Message-Id: <20210224185706.3293058-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224185706.3293058-1-f4bug@amsat.org>
References: <20210224185706.3293058-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To easily convert MXU code to decodetree, making it return a boolean.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index df4868ebb95..f25b1fe4d8f 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25779,18 +25779,18 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
+static bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
     if (opcode == OPC_MXU_S32M2I) {
         gen_mxu_s32m2i(ctx);
-        return;
+        return true;
     }
 
     if (opcode == OPC_MXU_S32I2M) {
         gen_mxu_s32i2m(ctx);
-        return;
+        return true;
     }
 
     {
@@ -25831,6 +25831,8 @@ static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
         gen_set_label(l_exit);
         tcg_temp_free(t_mxu_cr);
     }
+
+    return true;
 }
 
 #endif /* !defined(TARGET_MIPS64) */
@@ -26984,7 +26986,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             if (MASK_SPECIAL2(ctx->opcode) == OPC_MUL) {
                 gen_arith(ctx, OPC_MUL, rd, rs, rt);
             } else {
-                decode_opc_mxu(ctx, ctx->opcode);
+                decode_ase_mxu(ctx, ctx->opcode);
             }
             break;
         }
-- 
2.26.2


