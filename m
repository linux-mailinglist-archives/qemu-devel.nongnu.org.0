Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF156F4812
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:11:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsYz-0002qr-TY; Tue, 02 May 2023 12:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYh-0002m1-AU
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:09:03 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYf-0000dx-9F
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:54 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1527so41720195e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043732; x=1685635732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ak9lI8a+Y3Ekw5fqxmz/fOYShDZB2hBrThel6H303CQ=;
 b=kiM4bx9c8BffCFeInQPs2TaEJgMP6upq6yhI4671vB84k2F29DiOze+5wXz77BjnF8
 Jg2lhBag8ZP1Ift0W2MTr3uW29F9ux3ihP4ZqLKeYNxWIb7lF4RCY2NeYLPrvnpboxeT
 4qQS67N+eIw0kVrdzJSsSoJT+iOm985FxV+Us8+5RQ98hHvAAZWnOpMbzLY0TDH0lxuq
 0H0QNmkr09ScDG/HsSi87zrY74KgByoAlQHgNiwplu4RDQ1TpQ3Licz9XrCdLWsBmExy
 npgLhj4Jba+PTHhPcWQAup6dzdmzxNk0og1N9om3g8nGqSTEtwrdpWFuw2vWQ3rIRxJ0
 aU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043732; x=1685635732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ak9lI8a+Y3Ekw5fqxmz/fOYShDZB2hBrThel6H303CQ=;
 b=Unf4WFLNmTxYpINxuCQvomEVgpKuxwf4XiXcf0TnlL0ZX9UfeMtJBy/i+r9YeCKBaQ
 IH6Yq6SeIEqeUvMSM418fWan/pHN+nWMdJD8OYBsNV6IOXnh2WR+Re/exDjjs0unQJ8Q
 +ZKXe2IhPJ/anWIJJj41a53TFfOU/58Z0uNSJlSeUX6SjTbTU2T1uCD+PiGu5tRq5Jin
 /uOzsiGClZmkPDHrkOmlgigfN8ARgQ9yuBAhQSX6TuHx1NSaRI6uvDcHthXPz07gICFB
 +i6//9WcvObHi8lTxZJLee60vrnFixR10y/Wr+W6+ZzKjN9bewZGlZ8o4sW7Ti/mPyqd
 Ptmg==
X-Gm-Message-State: AC+VfDwoSFUj2PxfYnlrpSXGMDmfdIdjC1dkZ/tL9qOx9CQ7DCkmz3AW
 p7htbkWi2C/vAyyMdqi+fYhjtcJAe2gY6Kv0OL+YDg==
X-Google-Smtp-Source: ACHHUZ7zGy6u0/AK34zNTls/C5FN8S8fBz59zXgmR7BI2Vpe0qtcW3SduSll3RQf0KmS3r3oL9VYPQ==
X-Received: by 2002:a7b:cd18:0:b0:3f1:6f57:6fd3 with SMTP id
 f24-20020a7bcd18000000b003f16f576fd3mr12270265wmj.17.1683043731764; 
 Tue, 02 May 2023 09:08:51 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 06/16] target/mips: Add MO_ALIGN to gen_llwp, gen_scwp
Date: Tue,  2 May 2023 17:08:36 +0100
Message-Id: <20230502160846.1289975-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
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


