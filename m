Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD8E6FEDC1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:16:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Ld-0007IF-46; Thu, 11 May 2023 04:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1La-0007F4-VJ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:22 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1LZ-0001wz-95
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:22 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-965fc25f009so1205916866b.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792500; x=1686384500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7YTE8+U90t71rYiZfdQVcRBAJLXta/7RniwHriGZ9J4=;
 b=xMtzbCTnvs4yj9lBm86rQZ9NqoBI2uTRNxpHfl6eY8yvHSgGbNfLwIvOwpTmYUegeO
 GAHe8U0gfzPBBYuBixEkH6g7FcOs8LiUeXQHD0gobNpSJmwcc/xDGcSh+hxDO9BRnBlu
 UCivyRCcKkPmNIN8/fJW8Vlxb/+cvQXSXKxTvkCUHFeUDldP2CSLQ2kQTVHCEWXtQgFZ
 qpbK+WqSHsaLNvHzeqiYYeIiq/a9wQj0JOrWSlMyAA3u5pQmbOomUKsg2vZQ8SAZOa7Y
 tjlTOjwGjOrgkDeE0sZuBLlXkVDsiLM86SS7zv5b6usEzjjfEljodZQKafhmIp6xasdB
 TQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792500; x=1686384500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7YTE8+U90t71rYiZfdQVcRBAJLXta/7RniwHriGZ9J4=;
 b=aj5t+SdAVR5NWJzkYSp0VtfxaOAIllSLNhlrMHARzyghjdJ4TkgugIis5oBASRdapP
 AZqHggapkfwuZXVcPGMrvmnL10Fe/eUdvmc0Es+8j8FnTcDddiW6bOsN15TBtlZnBNzT
 ft4WCZl79tpZUiQvdQGr20DifYh9yNGFg9b71P9NKGditaB2VW7Dd+Qbqtu+kZFZCI4x
 cAOA22bciyFQWA4xo3sgufj6mTZhbbetlwmQa7bYyNH07x/HdOk3cjTkH88kQP5aPA93
 fP+4F0RoGEcM7o8PVyz7qJVp+mx12q5EyD+aOIz9lS0zGGhgGYwjKgKn+amRIGbeWpf/
 K96g==
X-Gm-Message-State: AC+VfDyvvCEe2a1POO62ZZHb9nhwA0nbm//S2O5Ad05nDsO7Dbv/Qixd
 gSf6enDKaWS/0YieaDT4qnTc3jlhrJs1Z6hyGvXZ9g==
X-Google-Smtp-Source: ACHHUZ4gZ6Duxy0cdsj3x7P6zDPLy+WnCI+VABWptSW2MjtBhPx2zlbyFPaPE09sf/8ia3VILKX0Sg==
X-Received: by 2002:a17:907:da4:b0:966:4d99:b0aa with SMTP id
 go36-20020a1709070da400b009664d99b0aamr14336784ejc.59.1683792500001; 
 Thu, 11 May 2023 01:08:20 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 45/53] target/nios2: Remove TARGET_ALIGNED_ONLY
Date: Thu, 11 May 2023 09:04:42 +0100
Message-Id: <20230511080450.860923-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In gen_ldx/gen_stx, the only two locations for memory operations,
mark the operation as either aligned (softmmu) or unaligned
(user-only, as if emulated by the kernel).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/nios2-softmmu.mak |  1 -
 target/nios2/translate.c          | 10 ++++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/configs/targets/nios2-softmmu.mak b/configs/targets/nios2-softmmu.mak
index 5823fc02c8..c99ae3777e 100644
--- a/configs/targets/nios2-softmmu.mak
+++ b/configs/targets/nios2-softmmu.mak
@@ -1,3 +1,2 @@
 TARGET_ARCH=nios2
-TARGET_ALIGNED_ONLY=y
 TARGET_NEED_FDT=y
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 6610e22236..a548e16ed5 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -298,6 +298,11 @@ static void gen_ldx(DisasContext *dc, uint32_t code, uint32_t flags)
     TCGv data = dest_gpr(dc, instr.b);
 
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
+#ifdef CONFIG_USER_ONLY
+    flags |= MO_UNALN;
+#else
+    flags |= MO_ALIGN;
+#endif
     tcg_gen_qemu_ld_tl(data, addr, dc->mem_idx, flags);
 }
 
@@ -309,6 +314,11 @@ static void gen_stx(DisasContext *dc, uint32_t code, uint32_t flags)
 
     TCGv addr = tcg_temp_new();
     tcg_gen_addi_tl(addr, load_gpr(dc, instr.a), instr.imm16.s);
+#ifdef CONFIG_USER_ONLY
+    flags |= MO_UNALN;
+#else
+    flags |= MO_ALIGN;
+#endif
     tcg_gen_qemu_st_tl(val, addr, dc->mem_idx, flags);
 }
 
-- 
2.34.1


