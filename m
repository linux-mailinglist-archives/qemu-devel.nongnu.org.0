Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C97843677B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 18:20:05 +0200 (CEST)
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdanU-0007Oz-DP
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 12:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdafY-0006MV-TX
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:11:52 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdafU-0006Kf-OP
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:11:52 -0400
Received: by mail-pj1-x1032.google.com with SMTP id kk10so861963pjb.1
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 09:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dci7d1K9fA3TunK7WLdGX84p7XYl+kHz/WIi/T9f8+U=;
 b=DIwmkzDPaoVNjSaY2PxAFI4fSgwLefvkwq0ihXj9745/dpb+h/x65ZL6wuQWI9YRl+
 Fa7MXshg9AqO3x1CYZ7VDnlxsc9+wZy6l4ZattvdIvIlCzbitFmaIasvRc1Vkl//1p45
 o9bssD3aAME+5PP5+q1sA3R8WmEKpJI0IqwsFhU6RNLu9JD7Itn507h6pe8NUM5uMObC
 shvrN9Z/5oLiXbV4i+UOPWxPWpU/FhuiNNpz89f0Ec92s+3TRdThAUH+pffhwAE940iC
 YVzv9Cxjw8S4s3bdYOl2C4zmnqEGWvmY+X5ySO02m7FHveV9ULLtvxFcbK++nFPJWk01
 F7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dci7d1K9fA3TunK7WLdGX84p7XYl+kHz/WIi/T9f8+U=;
 b=Shq9u/YNUlUpXS0TV6f/PXwTvbNaaC/WlKs1MwFCm2VSCTPSqWAX1PC7XwB0auXFxb
 75D2t0fFsrMyRfjyhkP9XP/tXEa/WvKP3jCFQ1SUdGq89WXT0itVWBcGMooCtM5q7xPP
 HfTQmTtrd9840H7g2zRRAIrp9N3uXNS/4Qd9hxEMROTXsDCOZNVW23Nif4Bb2cAtk/N9
 IL3JuH6dntI0liyhU8WR95U5bPCRtkiEMa0a9x1anZvb1QD68VLQX+Qe2dCZhqO2YPAI
 Tuy8KfgmWAp+073XUu1aQI3Cj/uhKn+xDGeZ1TmxCkDFpoXSG1BiuZU6tS4qqaP8xSyR
 9D6w==
X-Gm-Message-State: AOAM531duGVRN0+c+kMBWkK5NR5PxDJ/PJIVrb2u8sTNfb7ovn6xUOkv
 BAV2kOJbKCAgpRaVSdTRLoBMLQ==
X-Google-Smtp-Source: ABdhPJygJHpHObMnQx9LoKSPS5IfyggIPGxTUxR7ky08K1qYEE4jJq5Z5BfAJ4LxZnzgfC3GpeVPMw==
X-Received: by 2002:a17:90b:17d2:: with SMTP id
 me18mr7473304pjb.98.1634832707061; 
 Thu, 21 Oct 2021 09:11:47 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g25sm5706210pge.12.2021.10.21.09.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 09:11:46 -0700 (PDT)
Subject: Re: [RFC PATCH v1 1/2] riscv: Add preliminary infra for custom
 instrcution handling
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>, alistair23@gmail.com,
 wangjunqiang@iscas.ac.cn, bmeng.cn@gmail.com
References: <20211021151136.721746-1-ruinland@andestech.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e085e176-4ed4-248d-7546-c992ac283077@linaro.org>
Date: Thu, 21 Oct 2021 09:11:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021151136.721746-1-ruinland@andestech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, dylan@andestech.com, ycliang@andestech.com,
 qemu-devel@nongnu.org, alankao@andestech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 8:11 AM, Ruinland Chuan-Tzu Tsai wrote:
> -static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
> +/* Custom insn related definitions/prototypes */
> +extern __thread bool cpu_has_custom_insns;
> +/*
> + * These 2 are for indication if decode fails.
> + * We don't want to interfere the following regular extension decoding
> + * We assume MTTCG is 1-1 mapping for now.
> + */
> +__thread bool custom_c_insn_decoded;
> +__thread bool custom_insn_decoded;
> +
> +extern bool (*custom_c_insn_handler)(DisasContext *, uint16_t);
> +extern bool (*custom_insn_handler)(DisasContext *, uint32_t);
> +
> +static void try_decode_custom_insn(CPURISCVState *env, DisasContext *ctx,
> +                                   uint16_t opcode)


This is way, way over-engineered.

You seem to be trying to design something that can be plugged in, which the rest of QEMU 
knows nothing of.  I think that's a mistake.  Your custom cpu extensions should be treated 
as any other RISC-V extension, since it is in fact built in to QEMU.

Begin with adding the "bool ext_andes" field in RISCVCPU.  Propagate that into the 
DisasContext just like the other extensions.

Changes to decode_opc should be quite simple:

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 6d7fbca1fa..ea1e159259 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -473,13 +473,16 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, 
uint16_t opcode)
  {
      /* check for compressed insn */
      if (extract16(opcode, 0, 2) != 3) {
+        ctx->pc_succ_insn = ctx->base.pc_next + 2;
          if (!has_ext(ctx, RVC)) {
              gen_exception_illegal(ctx);
-        } else {
-            ctx->pc_succ_insn = ctx->base.pc_next + 2;
-            if (!decode_insn16(ctx, opcode)) {
-                gen_exception_illegal(ctx);
-            }
+            return;
+        }
+        if (ctx->ext_andes && decode_andes16(ctx, opcode)) {
+            return;
+        }
+        if (!decode_insn16(ctx, opcode)) {
+            gen_exception_illegal(ctx);
          }
      } else {
          uint32_t opcode32 = opcode;
@@ -487,6 +490,9 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t 
opcode)
                               translator_lduw(env, &ctx->base,
                                               ctx->base.pc_next + 2));
          ctx->pc_succ_insn = ctx->base.pc_next + 4;
+        if (ctx->ext_andes && decode_andes32(ctx, opcode)) {
+            return;
+        }
          if (!decode_insn32(ctx, opcode32)) {
              gen_exception_illegal(ctx);
          }


r~

