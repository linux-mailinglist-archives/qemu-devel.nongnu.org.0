Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E28F6FEDAA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:14:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Lb-0007FR-WB; Thu, 11 May 2023 04:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1La-0007EQ-1J
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:22 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1LX-0001wf-B5
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:21 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-965fc25f009so1205910566b.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792498; x=1686384498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ak9lI8a+Y3Ekw5fqxmz/fOYShDZB2hBrThel6H303CQ=;
 b=yoEwye4vPuvaZCOqtz7Ci10IRYorhjU3yizrwj3ov2anAg88+nhaiEO+D/aZ33gdLG
 l3xMe4BG0gBwpQqxagt6uP0JXAGsVC1plC4LgxWcPTUOn9RnWGsC8RL4lQZ/7S3f6J2m
 Y0jdThOViXlfuvCeZV+G3p7MwlfXEfttlg3Leo/QBYYucNHuXiUxEHtDLLpE7tAItzha
 pfPIQbP/jYhhpIxjbfhKgAZk2pQY4mmapTc+oTaHT5VayFkxQ4igKoRtZMGLjuo25ldZ
 k0+G6SkmLJ0g9L1j8RV6FjZmSF8DrSsQ31Yh78Yo7emgkvKJA8+xTqfEKdw2dCbB+JQ6
 aKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792498; x=1686384498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ak9lI8a+Y3Ekw5fqxmz/fOYShDZB2hBrThel6H303CQ=;
 b=VPECSP7DIDHHImRELytgKcX2inecVEscPP9jqF0GJT0wVw32Z9Mqq2knTOIqwUIKv6
 IglGj4mvJG6jF8usatunLOYmeoK10ShXtJiQvusgydqVQURbxJbYZDnsIxx/KYRtrPnw
 6ZdwOmnqdk4+q6N2j8uI/x7W/R9X72G/vbXOK2STkbZBAo/yogWeexVYTLt1vE056zCV
 yrLwfwhPQ2jSy3qcz4xupSDLuQw1AMdffVO9QW2MVvldduQMfuuo0WdxUX8PoQGTfNv+
 t3a+HqyvWNLwUD/v1BMUqE9w7s8IeXk3ytmR4UrPmPPtYcrd3DGesJx/leK4+fcqrAmc
 qe8A==
X-Gm-Message-State: AC+VfDzAJZ4fe3rtXsz0rHmakRy7oSSeZeGlLcRcLfIqLjSACt/5lowW
 IH1soa5VZi2R8WVo7Qnyxl2z6PE3FOnhOv+dCOfXhA==
X-Google-Smtp-Source: ACHHUZ7nJTxdZsGEwetsYAZS5Rb01E/IQXUhEGCsIX+PyOX64+5ftJPfoGMn09zttd10qt7a33kGug==
X-Received: by 2002:a17:907:eab:b0:969:813c:9868 with SMTP id
 ho43-20020a1709070eab00b00969813c9868mr11197610ejc.18.1683792497717; 
 Thu, 11 May 2023 01:08:17 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/53] target/mips: Add MO_ALIGN to gen_llwp, gen_scwp
Date: Thu, 11 May 2023 09:04:38 +0100
Message-Id: <20230511080450.860923-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x631.google.com
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

These are atomic operations, so mark as requiring alignment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/nanomips_translate.c.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 97b9572caa..e08343414c 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -998,7 +998,7 @@ static void gen_llwp(DisasContext *ctx, uint32_t base, int16_t offset,
     TCGv tmp2 = tcg_temp_new();
 
     gen_base_offset_addr(ctx, taddr, base, offset);
-    tcg_gen_qemu_ld_i64(tval, taddr, ctx->mem_idx, MO_TEUQ);
+    tcg_gen_qemu_ld_i64(tval, taddr, ctx->mem_idx, MO_TEUQ | MO_ALIGN);
     if (cpu_is_bigendian(ctx)) {
         tcg_gen_extr_i64_tl(tmp2, tmp1, tval);
     } else {
@@ -1039,7 +1039,8 @@ static void gen_scwp(DisasContext *ctx, uint32_t base, int16_t offset,
 
     tcg_gen_ld_i64(llval, cpu_env, offsetof(CPUMIPSState, llval_wp));
     tcg_gen_atomic_cmpxchg_i64(val, taddr, llval, tval,
-                               eva ? MIPS_HFLAG_UM : ctx->mem_idx, MO_64);
+                               eva ? MIPS_HFLAG_UM : ctx->mem_idx,
+                               MO_64 | MO_ALIGN);
     if (reg1 != 0) {
         tcg_gen_movi_tl(cpu_gpr[reg1], 1);
     }
-- 
2.34.1


