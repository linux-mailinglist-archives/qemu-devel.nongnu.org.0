Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04FA43D0D4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:35:05 +0200 (CEST)
Received: from localhost ([::1]:46156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnlR-0005JL-0e
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLF-0003dM-E2
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:01 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnLD-0003wN-RM
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:08:01 -0400
Received: by mail-wr1-x434.google.com with SMTP id o14so5552619wra.12
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fKRBUC8ZqKhsjXxFp/06594igJCBInZgNfHicCGq+Zo=;
 b=IuKrI5Hr/bgNaNRs4kwYP/lPiQ3ImH8fiE2PIsORxlh/+UqT5w+7j2ZJzC5f/xkAIM
 5poB7jcA76IORdudHLeRGczGUOU/g/VNEovYDTQBCS3YhBwwBMutqB3PJimR1GZ+nLpA
 DCMQtqFS6V+ECrBPT7jNIEKhSEc+XL9axGUAzXJpb3l7yeYE5ZlvtglLJh1ypvAOFp7j
 elZKMtDKX+EmqhiXsk5/MUfcUVZF3E0SwnfIGDyyu0D8ALMzinwq6/OUqoH5yKK59xhK
 w09DNw+bOoM3jMpZI9XuGTwLCp4+FP7p8q1xmI9lTOXLlaQ1+qS+eLhzSvjOWJwSDRBQ
 yPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fKRBUC8ZqKhsjXxFp/06594igJCBInZgNfHicCGq+Zo=;
 b=JUX+f/D9NxRooz5yYhfxENpypV+AtnrBb9t7t/vfBq6CoOXOEh0OFJq3XASaSWPKhq
 QyzOtqm/Arf6ReEloPsKY4YdoAOqj0rhl/hXPVqPF/CSmLqMg96ynJG+rXQj4AMdkiKY
 Qq44Qpw60ZsMNvYLPRGwCymyL3xZLq1ErgY7qidANnKaSCUrrooa9J/tbqIMP7bsL91b
 uSeMK/LdHGuqrJztlz35a3lxExK/y7xSgOLP8u6GGHnVdfFhJLzMHs2ITqli1HsN5zqN
 FKwD7f76EG0zK8o9Xpakg7tG2xLdtXy/DbTVWjP8kx7bFViFEXk98vF5ICMeSNh4ojYk
 y9dg==
X-Gm-Message-State: AOAM532+XuGwL3Lw6/HfSXzfh63UE+FDN+J2DlC0a41edUna7qc37oy1
 LQSpjigeidFG1DmqpuCj2+9gfX8doLA=
X-Google-Smtp-Source: ABdhPJyPRxANg8HFgyNkMdsN3dUHJU7LvWlI72S7ZvKg09rnrwNgaWRFjgEJZAkQysiZQSKJn5mu0Q==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr19421949wrd.273.1635358076692; 
 Wed, 27 Oct 2021 11:07:56 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u16sm601816wrt.97.2021.10.27.11.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:07:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/32] target/mips: Have check_msa_access() return a boolean
Date: Wed, 27 Oct 2021 20:07:03 +0200
Message-Id: <20211027180730.1551932-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have check_msa_access() return a boolean value so we can
return early if MSA is not enabled (the instruction got
decoded properly, but we raised an exception).

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: return true (opcode decoded) because the opcode is decoded, reword
---
 target/mips/tcg/msa_translate.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index bc57e06d923..5acb27f1d71 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -293,19 +293,24 @@ void msa_translate_init(void)
     }
 }
 
-static inline int check_msa_access(DisasContext *ctx)
+/*
+ * Check if MSA is enabled.
+ * This function is always called with MSA available.
+ * If MSA is disabled, raise an exception.
+ */
+static inline bool check_msa_enabled(DisasContext *ctx)
 {
     if (unlikely((ctx->hflags & MIPS_HFLAG_FPU) &&
                  !(ctx->hflags & MIPS_HFLAG_F64))) {
         gen_reserved_instruction(ctx);
-        return 0;
+        return false;
     }
 
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_MSA))) {
         generate_exception_end(ctx, EXCP_MSADIS);
-        return 0;
+        return false;
     }
-    return 1;
+    return true;
 }
 
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
@@ -337,7 +342,9 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
 {
     TCGv_i64 t0;
 
-    check_msa_access(ctx);
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
         gen_reserved_instruction(ctx);
@@ -369,7 +376,9 @@ static bool trans_BNZ_V(DisasContext *ctx, arg_msa_bz *a)
 
 static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
 {
-    check_msa_access(ctx);
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
         gen_reserved_instruction(ctx);
@@ -2141,7 +2150,9 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
     uint32_t opcode = ctx->opcode;
 
-    check_msa_access(ctx);
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
 
     switch (MASK_MSA_MINOR(opcode)) {
     case OPC_MSA_I8_00:
-- 
2.31.1


