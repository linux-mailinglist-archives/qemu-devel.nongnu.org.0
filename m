Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18413CEE8B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:46:44 +0200 (CEST)
Received: from localhost ([::1]:41238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5b64-0004UU-2l
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5b4d-0002ZD-Vj
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:45:15 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5b4c-0006mL-0N
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:45:15 -0400
Received: by mail-pl1-x630.google.com with SMTP id j3so10399363plx.7
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+YSPY7HYAMd9azhBrO+EuPgXW9fhe2wdhYIqtXrRGv8=;
 b=bD19eFHqChpyeXrSNzEHmr5gokJ90DsRwOrvV/N/JnlPz2isWRNYxlaEEU8gmHY80u
 81eB1wAH6wSpg7fq2NcQhEw4fa+bNhXtRkb036iGMV2yPXCI6AAVvwuiNoHaaa7hd3nc
 4ZEXyPdwX0pg7uvcLr8YH3YbYu4KI3zpOqlj5lAOEpgElLbQZSZAH7HZVEppTv3XGYWT
 wjsSf7M9hyXSadMFv4/OYHB4OIuEA5lbS9jB7TqSYtErYERafj3INDBCw5MiZGInfP8R
 txKPmpnzfBbbBoMvfvrTD+Te2wrJmBSFcN475Zpn4qv5SZ2KP/glF2UtBjG2pLU/B3qi
 i6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+YSPY7HYAMd9azhBrO+EuPgXW9fhe2wdhYIqtXrRGv8=;
 b=o0o0+DdjhUDkXYUN8+bL34KpYvMpTSPzITl7OSIsO6uVTpGV0utiCnhdD2Cx2bJHEn
 D4vLEYzmqbJCwxgC4bsu+76mMubP1wLv5yNJ3s+S1K2A1rf56lt/51/pUQjOcyVqllLZ
 WsD1KW28fqA0FsL6FM/ynOrRGZAkCCQyGTzf64Ab4SeeYdkkl20e3s6o2FgbkkbuWdfs
 OLivOFe5uY7f6yRA2TXGFIKSCS2+fWpWX1eRaXX7JEJ4BjKTPFJfhKyB3/qABghSgLPr
 WGhITZz9pNpKvcQd2TF41tPk3YfS84D+bSU0xHNd7D6zDRA6/p042X+kMIDPVE/nGckf
 I5ZQ==
X-Gm-Message-State: AOAM531x2n2JP5Oyw4kGUvYzgD40h+tbSHPSGw/v65Db6BqjE2UpnLF3
 6tIuEI5M4MHH3yz6GhVtZDcUww==
X-Google-Smtp-Source: ABdhPJwjTMsMRqhNx3kbchAEyrGFmaLmWyyZJh2IoeclkwJ3wJqtU4R3CTiEjYJSeEnB1GhKD+eQMg==
X-Received: by 2002:a17:90a:5b10:: with SMTP id
 o16mr26380124pji.76.1626731110382; 
 Mon, 19 Jul 2021 14:45:10 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w10sm23066736pgl.46.2021.07.19.14.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 14:45:10 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v4 15/15] accel/tcg: Record singlestep_enabled in
 tb->cflags
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210719212239.428740-1-richard.henderson@linaro.org>
 <20210719212239.428740-16-richard.henderson@linaro.org>
Message-ID: <f7b29687-541b-1754-6e68-388ca722a644@linaro.org>
Date: Mon, 19 Jul 2021 11:45:07 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719212239.428740-16-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 11:22 AM, Richard Henderson wrote:
> Set CF_SINGLE_STEP when single-stepping is enabled.
> This avoids the need to flush all tb's when turning
> single-stepping on or off.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/exec-all.h |  1 +
>   accel/tcg/cpu-exec.c    | 12 ++++++++++++
>   accel/tcg/translator.c  |  7 +------
>   cpu.c                   |  4 ----
>   4 files changed, 14 insertions(+), 10 deletions(-)

Bah, this should also contain

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bf82c15aab..bbfcfb698c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1432,10 +1432,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
      }
      QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);

-    if (cpu->singlestep_enabled) {
-        max_insns = 1;
-    }
-
   buffer_overflow:
      tb = tcg_tb_alloc(tcg_ctx);
      if (unlikely(!tb)) {


> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 6873cce8df..5d1b6d80fb 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -497,6 +497,7 @@ struct TranslationBlock {
>   #define CF_COUNT_MASK    0x000001ff
>   #define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
>   #define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
> +#define CF_SINGLE_STEP   0x00000800 /* gdbstub single-step in effect */
>   #define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.  */
>   #define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
>   #define CF_USE_ICOUNT    0x00020000
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 6710e15d8b..30a3be9ea7 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -272,6 +272,14 @@ static uint32_t cflags_for_breakpoints(CPUState *cpu, target_ulong pc,
>           }
>       }
>   
> +    if (unlikely(cpu->singlestep_enabled)) {
> +        /*
> +         * Record gdb single-step.  We should be exiting the TB by raising
> +         * EXCP_DEBUG, but to simplify other tests, disable chaining too.
> +         */
> +        bflags = CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
> +    }
> +
>       if (unlikely(bflags)) {
>           cflags = (cflags & ~CF_COUNT_MASK) | bflags;
>       }
> @@ -409,7 +417,11 @@ void cpu_exec_step_atomic(CPUState *cpu)
>            * We only arrive in cpu_exec_step_atomic after beginning execution
>            * of an insn that includes an atomic operation we can't handle.
>            * Any breakpoint for this insn will have been recognized earlier.
> +         * But do record single-stepping.
>            */
> +        if (unlikely(cpu->singlestep_enabled)) {
> +            cflags |= CF_SINGLE_STEP;
> +        }
>   
>           tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
>           if (tb == NULL) {
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index b45337f3ba..c53a7f8e44 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -38,11 +38,6 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
>           return false;
>       }
>   
> -    /* Suppress goto_tb in the case of single-steping.  */
> -    if (db->singlestep_enabled) {
> -        return false;
> -    }
> -
>       /* Check for the dest on the same page as the start of the TB.  */
>       return ((db->pc_first ^ dest) & TARGET_PAGE_MASK) == 0;
>   }
> @@ -60,7 +55,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
>       db->is_jmp = DISAS_NEXT;
>       db->num_insns = 0;
>       db->max_insns = max_insns;
> -    db->singlestep_enabled = cpu->singlestep_enabled;
> +    db->singlestep_enabled = cflags & CF_SINGLE_STEP;
>   
>       ops->init_disas_context(db, cpu);
>       tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
> diff --git a/cpu.c b/cpu.c
> index 660b56f431..addcb5db9c 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -316,10 +316,6 @@ void cpu_single_step(CPUState *cpu, int enabled)
>           cpu->singlestep_enabled = enabled;
>           if (kvm_enabled()) {
>               kvm_update_guest_debug(cpu, 0);
> -        } else {
> -            /* must flush all the translated code to avoid inconsistencies */
> -            /* XXX: only flush what is necessary */
> -            tb_flush(cpu);
>           }
>           trace_breakpoint_singlestep(cpu->cpu_index, enabled);
>       }
>

