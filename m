Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A8132446E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:11:41 +0100 (CET)
Received: from localhost ([::1]:57526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzZS-0002U8-RL
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzMV-0007Qg-4z
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:58:15 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzMT-00030I-J5
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:58:14 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c7so2904493wru.8
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VfTlNObaYV/Nh4K89JsqHN+ODkOHUE/vR/suP3n68ro=;
 b=Y4WBI7Hg0cVti85JFchVUvinH/gUHGyG1HTIZgdIfB5p9/8sdfezoUZt0TDIxperiy
 y8PP/tf628hrUQtYCj0RtOyk/ekeVV3d5QhQ/LE8z8KKUnlO34kCPMtRd39nm9qhtV9O
 Z2/xhUSL5mZqcq7Bdg5/dH27ElrpmMS+T/WOBl2EBdsCbNKuGbpmmnIbn00wMLZxRDMH
 Eq1vYCzN4kI+7Pe1MebB2ZotQhZInq4jFbQc/Bpl6aiqadtT3Gf9uQizagFw3arq0mEH
 vzLcLwjCjQwMA8gJq6ozh91rseGdHL4lzf51acU4gqUie4SKogHVYgEj7atQvMMLmfUv
 L3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VfTlNObaYV/Nh4K89JsqHN+ODkOHUE/vR/suP3n68ro=;
 b=KvI6HTPL4giea54FH89BAHiqZxoiLhG1EODpdRRc5jNBCCMaR+uTETDDfPWJuC2sFL
 BLTz0pMnFo+RhL1xB6JrDvgTqC9IkQC1wv0F+vi5eIDCTzDeiv0EWwsr6cnvbbLN05Ap
 d/xjPjfPoMs5F/yGFEN8boQMXqoRFwNJyYgD2mJ9awkRiRmU0MXJufbgcMXOoaN0RVZ3
 VQgNKVkSkOhV7WebVb7RwKSh+cz04+5gJxy3cWr+kUPVCQKWaZ8mrmXZGXbSBi/JCe5C
 uucJO0jvd2lAklKTpxt7GpttyxmrDEQ6vlOysIqCQd3Q75i/vNp8jQE73xZN6jlMOxS0
 GNHQ==
X-Gm-Message-State: AOAM532wOouxJftxHBMFkpOBOETWHEr/POga9N+WAGTDVy5DQi/jFkvi
 u/swOmAGJT/agxuhtjgzW0UfdNItskw=
X-Google-Smtp-Source: ABdhPJwVu8POxkZko0Wa7esZns6SxxSU1a3NUL1n/9QbLA38Ox9qchXmMUwp3brA6GUC/WZ2iNHP0g==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr4920035wrq.116.1614193091964; 
 Wed, 24 Feb 2021 10:58:11 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e17sm4903551wrw.53.2021.02.24.10.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:58:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/12] target/mips: Simplify decode_opc_mxu() ifdef'ry
Date: Wed, 24 Feb 2021 19:57:04 +0100
Message-Id: <20210224185706.3293058-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224185706.3293058-1-f4bug@amsat.org>
References: <20210224185706.3293058-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

By making the prototype public and checking
'TARGET_LONG_BITS == 32' we let the compiler
elide the decode_opc_mxu() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 3 +++
 target/mips/translate.c | 6 ++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 468e29d7578..a5c49f1ee22 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -178,6 +178,9 @@ extern TCGv bcond;
 /* MSA */
 void msa_translate_init(void);
 
+/* MXU */
+bool decode_ase_mxu(DisasContext *ctx, uint32_t insn);
+
 /* decodetree generated */
 bool decode_isa_rel6(DisasContext *ctx, uint32_t insn);
 bool decode_ase_msa(DisasContext *ctx, uint32_t insn);
diff --git a/target/mips/translate.c b/target/mips/translate.c
index f25b1fe4d8f..84948ab9ce0 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25779,7 +25779,7 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
+bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
@@ -26981,8 +26981,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             break;
         }
 #endif
-#if !defined(TARGET_MIPS64)
-        if (ctx->insn_flags & ASE_MXU) {
+        if (TARGET_LONG_BITS == 32 && (ctx->insn_flags & ASE_MXU)) {
             if (MASK_SPECIAL2(ctx->opcode) == OPC_MUL) {
                 gen_arith(ctx, OPC_MUL, rd, rs, rt);
             } else {
@@ -26990,7 +26989,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         }
-#endif
         decode_opc_special2_legacy(env, ctx);
         break;
     case OPC_SPECIAL3:
-- 
2.26.2


