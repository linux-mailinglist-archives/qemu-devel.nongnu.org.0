Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC53ADA79
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 16:42:33 +0200 (CEST)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lucB6-0007oW-Gs
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 10:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucAG-00073B-UJ; Sat, 19 Jun 2021 10:41:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lucAF-0004dc-Ag; Sat, 19 Jun 2021 10:41:40 -0400
Received: by mail-wm1-x330.google.com with SMTP id n23so7454191wms.2;
 Sat, 19 Jun 2021 07:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZEMv2i64K3HWsfVpMsh+OOAZEy3c1QPf9dtb3K+NCZc=;
 b=coEUCrfOoid8bWWYhE9k0ayJ/QJaDP9Uftar26bgPV1UJ1vp4sHJgV2uVdinfR4oZp
 BHuoNw1iD03hvpYKZ/IGth5tB2jXehD8ogpE1Zv7rTy2VysUaMSA8jLltEhN4n2epU/e
 0hjoIbSZmMKmDhX4ODrvxGXRWmjBOGIgK3sjYOzqEY65aJdx3K5s/UP5rCxDQLb4VSir
 Up1ik+fYgbuLuAnskPYe4k6APzNNY/6QMd3+WzK0qngj4zdOP5DhZdpyS8Q3p3XhvxdF
 nPZxdJloAOXb4Byp9hNafn+lKhVpIoVNmqGLRgUG2jvWD9yy1QZeTZXOTjkIpm+vpV8n
 +KJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZEMv2i64K3HWsfVpMsh+OOAZEy3c1QPf9dtb3K+NCZc=;
 b=DnathDSbLjCxKzmR3IYv0zZ777n4RpnF8kQA6y/iX05l2og9UdYlHbtBX3cpdo8SGh
 a9xLN1MvCmoCLiJ2kk7g4d4O1oC1lLkO52nqzd/9HvUJUE7M3jnoVi71uaTHYdku4yrm
 9KLSInRW7f6qUQrHlQMU9I1F1Lk3eEvQgILLjPCgcT3j7Kua0AINQ6+zPtVoyeBT6r1H
 k6z0eVKN1rtJ4Q4s+/uBCxRzcR289eYYtH5COhko03+JlB9e3fz3rx5rBvh1dnIjloHp
 6Y0XoOTOBTW9jG4VNkn4ckqumwinFjE0URzTuTivYVaxNdLuFQXn+FCJO3WXgncwXPZq
 beSQ==
X-Gm-Message-State: AOAM530ASTMGFgRZbjlWZ5A/x2AFOd6PYfpwCW97tzrKnh9QkrKVeqbj
 C1+EjJhXDSa2tPtzo/bqL/4=
X-Google-Smtp-Source: ABdhPJx0L1SSvwG9bb+sDQwJOI5Cfmr2Z15ca+V20smJ7pBljeBN3LFnLoSQDHqNEID+P7x5nAdV5g==
X-Received: by 2002:a1c:7212:: with SMTP id n18mr16579250wmc.58.1624113697697; 
 Sat, 19 Jun 2021 07:41:37 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z10sm10648698wmp.39.2021.06.19.07.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 07:41:37 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] tcg/sparc: Fix temp_allocate_frame vs sparc stack
 bias
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619134216.590423-1-richard.henderson@linaro.org>
 <20210619134216.590423-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5bd744f2-a7c8-59db-e73d-de05202a6ba7@amsat.org>
Date: Sat, 19 Jun 2021 16:41:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619134216.590423-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 3:42 PM, Richard Henderson wrote:
> We should not be aligning the offset in temp_allocate_frame,
> because the odd offset produces an aligned address in the end.
> Instead, pass the logical offset into tcg_set_frame and add
> the stack bias last.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c                  |  9 +++------
>  tcg/sparc/tcg-target.c.inc | 16 ++++++++++------
>  2 files changed, 13 insertions(+), 12 deletions(-)

LGTM but I'd rather have another review...

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index dd584f3bba..52e858523c 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -3015,17 +3015,14 @@ static void check_regs(TCGContext *s)
>  
>  static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
>  {
> -#if !(defined(__sparc__) && TCG_TARGET_REG_BITS == 64)
> -    /* Sparc64 stack is accessed with offset of 2047 */
> -    s->current_frame_offset = (s->current_frame_offset +
> -                               (tcg_target_long)sizeof(tcg_target_long) - 1) &
> -        ~(sizeof(tcg_target_long) - 1);
> -#endif
>      if (s->current_frame_offset + (tcg_target_long)sizeof(tcg_target_long) >
>          s->frame_end) {
>          tcg_abort();
>      }
>      ts->mem_offset = s->current_frame_offset;
> +#if defined(__sparc__)
> +    ts->mem_offset += TCG_TARGET_STACK_BIAS;
> +#endif
>      ts->mem_base = s->frame_temp;
>      ts->mem_allocated = 1;
>      s->current_frame_offset += sizeof(tcg_target_long);
> diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
> index ce39ac2d86..a6ec94a094 100644
> --- a/tcg/sparc/tcg-target.c.inc
> +++ b/tcg/sparc/tcg-target.c.inc
> @@ -984,14 +984,18 @@ static void tcg_target_qemu_prologue(TCGContext *s)
>  {
>      int tmp_buf_size, frame_size;
>  
> -    /* The TCG temp buffer is at the top of the frame, immediately
> -       below the frame pointer.  */
> +    /*
> +     * The TCG temp buffer is at the top of the frame, immediately
> +     * below the frame pointer.  Use the logical (aligned) offset here;
> +     * the stack bias is applied in temp_allocate_frame().
> +     */
>      tmp_buf_size = CPU_TEMP_BUF_NLONGS * (int)sizeof(long);
> -    tcg_set_frame(s, TCG_REG_I6, TCG_TARGET_STACK_BIAS - tmp_buf_size,
> -                  tmp_buf_size);
> +    tcg_set_frame(s, TCG_REG_I6, -tmp_buf_size, tmp_buf_size);
>  
> -    /* TCG_TARGET_CALL_STACK_OFFSET includes the stack bias, but is
> -       otherwise the minimal frame usable by callees.  */
> +    /*
> +     * TCG_TARGET_CALL_STACK_OFFSET includes the stack bias, but is
> +     * otherwise the minimal frame usable by callees.
> +     */
>      frame_size = TCG_TARGET_CALL_STACK_OFFSET - TCG_TARGET_STACK_BIAS;
>      frame_size += TCG_STATIC_CALL_ARGS_SIZE + tmp_buf_size;
>      frame_size += TCG_TARGET_STACK_ALIGN - 1;
> 


