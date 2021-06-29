Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70123B6DA7
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 06:30:26 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly5OD-0006VE-LM
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 00:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly5ND-0005lz-Gm
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:29:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly5NB-0004jf-Tz
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:29:23 -0400
Received: by mail-wr1-x432.google.com with SMTP id p8so7925121wrr.1
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 21:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H2bU+uZaBEi3kI4w2wmiKW7JC0bb4m1kuYOBcPd593o=;
 b=Ew+kDe7wzUmpLSkzjSkQaOMBkWKPcQPx2kA9UiUpbMY3Wsfe6yzblVDpeX+sGAsMJa
 /lTEWYuX3VdUQ1uYdN0va6aPCowWr513D+4ULEhzNnVAh57QgehL6jf1z+lm/b3Tttw6
 8N0dZQrTHZb9Yb8X0dWI9elpoOaDrdXdSAd3RecfD7EG+gT+YF+jtmFbKOeQQJSDCfXJ
 jEu7YZnGlIjSBCr3+jEa5cS5/FZy2W1JT93JOtLr2T5P3EpIf4vz9m6Nef00Ov7iF0n1
 y2z92SLHvpkRfcxw+K033fYI+aOD6L2AJM0/9+4bYgJKb68FWV+3Tp2NHpzUi8Z8x7IS
 +STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H2bU+uZaBEi3kI4w2wmiKW7JC0bb4m1kuYOBcPd593o=;
 b=mZkYcyu1xioGBKXj7F2wJSYZCKizgPmRZZ4sV41igWUmjliYl5D2VRBU7Elquo2UIA
 1L1aC6V4PAcb7vBOJr5SJpjFPLZDCoiOXqDVF2yoWNsZbqobVeG9z9qwhtEWTmcdCOnK
 7rr6RuPg9jsezbVxc1TrzWjl0U9XO7jaRSKqsZYtCjQnOPjMFQ41xjJQTaNSnp+4LDd7
 mDT8k33W5//dDbz7MiR+6IXO8PppVmkCbWUH/5XFRC4kqYSKvInns2OWJNNGDq/opVJ4
 DrgIPfcY5bsM2dXhSrroHd5/0eSdSVNo7wCeiALM5ng4FgLVcJEVkQM321MXS1KWSQEj
 pU6A==
X-Gm-Message-State: AOAM533oqZiMhuiJ9CgCybRYohug3gRIDDnU89VqsGs88KqO69cx1jHu
 JvtVAUk4bX2M3sziUpJGoW0=
X-Google-Smtp-Source: ABdhPJxHVUFRvYewUY4pWhS6sRj4oCqdIdjp+g9wEEzaAhR7xmzyaWKVj07sB/M2cVo/+NgvXVDE/w==
X-Received: by 2002:a5d:4107:: with SMTP id l7mr9935758wrp.16.1624940959855;
 Mon, 28 Jun 2021 21:29:19 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r16sm7214784wrx.63.2021.06.28.21.29.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 21:29:19 -0700 (PDT)
Subject: Re: [PATCH] target/s390x: Use explicit stores to env->cc_op
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210629002930.3013776-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c1434485-d585-1883-1240-05604fa45dd7@amsat.org>
Date: Tue, 29 Jun 2021 06:29:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629002930.3013776-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: ulrich.weigand@de.ibm.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 2:29 AM, Richard Henderson wrote:
> Remove cc_op as a TCG global and store to it directly.
> This will help simplify the fix for some fpu bugs.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/helper.h        |  98 ++++++-------
>  target/s390x/crypto_helper.c |   6 +-
>  target/s390x/fpu_helper.c    |  40 +++---
>  target/s390x/mem_helper.c    | 265 ++++++++++++++++++-----------------
>  target/s390x/misc_helper.c   |  39 +++---

Minor one comment in tprot(), I reviewed the helper changes.

>  target/s390x/translate.c     | 218 ++++++++++++++--------------

For this file I got quickly lost (too many changes in a single
patch, but I see it is hardly splitable). I might revisit to
complete the review.

>  6 files changed, 344 insertions(+), 322 deletions(-)
...

> -uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
> +void HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
>  {
>      S390CPU *cpu = env_archcpu(env);
>      CPUState *cs = env_cpu(env);
> +    int cc;

This new variable isn't really useful, can you store to env->cc_op
directly instead?

>  
>      /*
>       * TODO: we currently don't handle all access protection types
> @@ -2144,7 +2143,8 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
>       */
>      if (!s390_cpu_virt_mem_check_write(cpu, a1, 0, 1)) {
>          /* Fetching permitted; storing permitted */
> -        return 0;
> +        env->cc_op = 0;
> +        return;
>      }
>  
>      if (env->int_pgm_code == PGM_PROTECTION) {
> @@ -2152,7 +2152,8 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
>          cs->exception_index = -1;
>          if (!s390_cpu_virt_mem_check_read(cpu, a1, 0, 1)) {
>              /* Fetching permitted; storing not permitted */
> -            return 1;
> +            env->cc_op = 1;
> +            return;
>          }
>      }
>  
> @@ -2160,17 +2161,21 @@ uint32_t HELPER(tprot)(CPUS390XState *env, uint64_t a1, uint64_t a2)
>      case PGM_PROTECTION:
>          /* Fetching not permitted; storing not permitted */
>          cs->exception_index = -1;
> -        return 2;
> +        cc = 2;
> +        break;
>      case PGM_ADDRESSING:
>      case PGM_TRANS_SPEC:
>          /* exceptions forwarded to the guest */
>          s390_cpu_virt_mem_handle_exc(cpu, GETPC());
> -        return 0;
> +        cc = 0;
> +        break;
> +    default:
> +        /* Translation not available */
> +        cs->exception_index = -1;
> +        cc = 3;
> +        break;
>      }
> -
> -    /* Translation not available */
> -    cs->exception_index = -1;
> -    return 3;
> +    env->cc_op = cc;
>  }
...

