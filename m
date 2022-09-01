Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2C35A9045
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:27:39 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTeby-00054n-TW
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4o-0006ce-93
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4m-0003RX-GO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:53:21 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m16so20984080wru.9
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Ar6YL5FF/K2Div4uruzg03ZvW0xj9yBOSm1jZPy9tok=;
 b=NwKKSebeesF/qrC/3apRByzSl4cuI8eDtiSNMOXzrKoSv3dy0CXFHET8VdnVPYIPda
 7ITqsu32515oRWrXp70wFwv/BrgpGXywQf9jp2KWbV4ZqF1muSdvQKWd9LVZqrppzbzw
 uRJsXI1oaKqUZ+Q/yaUtd8KF8W5nAjVjPHlno6mMEXioEBvLzkxiUsoFACF+uuM3SDGv
 gGHFK7GIybLXTNzB8Bx2QuAhujKxBlxKvgYUIH++5z6YMiOgOhWIhNPmMi6FDG8LLsz6
 XtY048ySBramFDHVza8ejowrokb376+hbKu48mFjyEZM1udyVqXGPdm7jQPQuC7BlYjw
 lbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Ar6YL5FF/K2Div4uruzg03ZvW0xj9yBOSm1jZPy9tok=;
 b=gWgQo634QZuragEiyeVInwCwdstldq2cVy0URJXztZPeiCAJClecR5wp07uFSGUoAj
 6DVqgLQKFNZJ/qXqIbBcxc/XXmV+YD4KRrvUOckcG+dQBszNUKNcMp5525KjbmeMoerQ
 6xeK9i8rZ0ehzanLPvAe57oik+fxBTx6riYpGWoe1uzoEGFFmHK4tiqQsAlOYKAk/pd1
 2s9xVkvaB7jeqU3pLbgI6KCfxY1g7lTEjYNpKhHekuUTFhKlzNgmMJ+zef8Zzagl1vkZ
 E1TipOB4nho6voY3uRbkx44W+Wli4FQtGOWqkuCaNt4QniobXcsQPCpJOvmKYGqnkmD3
 dlng==
X-Gm-Message-State: ACgBeo1+S5PXIiRDP1BFgSWz39tdknl86Y7yEZ6CLIz3Gw1XkDQtlF1v
 WBx/c6QNAqOnRjsfmRzw8YBoZLB1p7yn+nDs
X-Google-Smtp-Source: AA6agR6SDSWEATLaa4YR9SCDWm3LuQQxa1qHDW14UM4Iz5QwhpkPhZNTcOmDIUC9V0r4t369Ug8CRg==
X-Received: by 2002:a5d:59a2:0:b0:226:e6c3:a6c2 with SMTP id
 p2-20020a5d59a2000000b00226e6c3a6c2mr5665319wrr.236.1662015198913; 
 Wed, 31 Aug 2022 23:53:18 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:53:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 19/20] target/riscv: Add MAX_INSN_LEN and insn_len
Date: Thu,  1 Sep 2022 07:52:09 +0100
Message-Id: <20220901065210.117081-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These will be useful in properly ending the TB.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Tested-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/translate.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 38666ddc91..a719aa6e63 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -1022,6 +1022,14 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
 /* Include decoders for factored-out extensions */
 #include "decode-XVentanaCondOps.c.inc"
 
+/* The specification allows for longer insns, but not supported by qemu. */
+#define MAX_INSN_LEN  4
+
+static inline int insn_len(uint16_t first_word)
+{
+    return (first_word & 3) == 3 ? 4 : 2;
+}
+
 static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
 {
     /*
@@ -1037,7 +1045,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
     };
 
     /* Check for compressed insn */
-    if (extract16(opcode, 0, 2) != 3) {
+    if (insn_len(opcode) == 2) {
         if (!has_ext(ctx, RVC)) {
             gen_exception_illegal(ctx);
         } else {
-- 
2.34.1


