Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB9D2DB729
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:40:42 +0100 (CET)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJvt-0000DS-F8
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJuB-0007yd-RI; Tue, 15 Dec 2020 18:38:58 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:46621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJu8-0001lj-2T; Tue, 15 Dec 2020 18:38:55 -0500
Received: by mail-ed1-x544.google.com with SMTP id b73so22857989edf.13;
 Tue, 15 Dec 2020 15:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t/cBgvJydwDaMyASwS7g2Ye0ViyGXn1k8VXB5BGtgio=;
 b=fJDEsKiLiZF5vQi0BHw1483FSw+AgJgTSdYsNsYQo6O2XT5MqW7naVvEk4OZ7pWmiE
 PrxCt1zRYHyetd85ao3htVfZZZ3lS+PzTbTbCNnncuzCMB//dCGhCOS6a/bLFcFXGT5c
 K3R8MHjNq2fiv6g5prJRAMupfcL5n1S1jJKgx9IB537nwnv5HWhMcQ6TJsfQOHUb1nCh
 rIlnjCpbsiQiwjCXIoNkqatCEUIS3TTbcs/NXvK2LTbPI9A+8vswvySdlCDi8KpFhIcz
 /ixfEF7ZiQ1O+0yplNyMUvm0UoBYabGvb3q6hhhhxeGJeaRy5l+psjHjDOBl0Ce+zGAk
 nDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t/cBgvJydwDaMyASwS7g2Ye0ViyGXn1k8VXB5BGtgio=;
 b=aaNTUijViCO7HYtO/KFT8k0hq8T60ZjaHFY8klt0l1nFu8BKE6wWFxoFz9wJrT5Yat
 k3hogB0b++oXcMnlSispRmAzWPia2COnPDHfcbHqkViSfpaXeDgHQ4kxdApLMBTmW74l
 V0QJEfdUsYx5xecxswNp2h92TQrH5Pwd4owi3yMcWN3Hi5b9JKDn7ukqdf5Rw36B/KsJ
 RAYz8BxgbU0oJl9jTMUS4uMaN4WWr3hPJpbsCGpIsF9Ew3efW9j5ydihCR70fWi3la7O
 6mdYC8rpnUa+FObv0C9M5UFRJkopEOP8S1OYav53nut+BkvQCV2tpGOOzRLyuOej/9rl
 BXSQ==
X-Gm-Message-State: AOAM5323Gdh8UarkHSr8gVITAjKg665Iw9WadM8QXBoc4o/9ULdvAsgf
 uru9XIHz6n1QOy85Skw1tY4=
X-Google-Smtp-Source: ABdhPJz/qbbuFLlm3k4PEf2QyV4AWknzPH4YKU6qpe8y4kL1GBR8vEEt4ulMtMwZE8TfNCvUk/EXCg==
X-Received: by 2002:a05:6402:17:: with SMTP id
 d23mr21880506edu.341.1608075529085; 
 Tue, 15 Dec 2020 15:38:49 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id ef11sm36608ejb.15.2020.12.15.15.38.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:38:48 -0800 (PST)
Subject: Re: [PATCH] tcg: Use memset for large vector byte replication
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20201215174824.76017-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c95edce5-98fb-a1c5-116b-f1736b389fd4@amsat.org>
Date: Wed, 16 Dec 2020 00:38:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215174824.76017-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x544.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Frank Chang <frank.chang@sifive.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 6:48 PM, Richard Henderson wrote:
> In f47db80cc07, we handled odd-sized tail clearing for
> the case of hosts that have vector operations, but did
> not handle the case of hosts that do not have vector ops.
> 
> This was ok until e2e7168a214b, which changed the encoding
> of simd_desc such that the odd sizes are impossible.
> 
> Add memset as a tcg helper, and use that for all out-of-line
> byte stores to vectors.  This includes, but is not limited to,
> the tail clearing operation in question.
> 
> Cc: qemu-stable@nongnu.org
> Buglink: https://bugs.launchpad.net/bugs/1907817
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tcg-runtime.h     | 11 +++++++++++
>  include/exec/helper-proto.h |  4 ++++
>  tcg/tcg-op-gvec.c           | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
> index 4eda24e63a..2e36d6eb0c 100644
> --- a/accel/tcg/tcg-runtime.h
> +++ b/accel/tcg/tcg-runtime.h
> @@ -28,6 +28,17 @@ DEF_HELPER_FLAGS_1(lookup_tb_ptr, TCG_CALL_NO_WG_SE, ptr, env)
>  
>  DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
>  
> +#ifndef IN_HELPER_PROTO
> +/*
> + * Pass calls to memset directly to libc, without a thunk in qemu.
> + * Do not re-declare memset, especially since we fudge the type here;
> + * we assume sizeof(void *) == sizeof(size_t), which is true for
> + * all supported hosts.
> + */
> +#define helper_memset memset
> +DEF_HELPER_FLAGS_3(memset, TCG_CALL_NO_RWG, ptr, ptr, int, ptr)

Nice :)

> +#endif /* IN_HELPER_PROTO */
> +
>  #ifdef CONFIG_SOFTMMU
>  
>  DEF_HELPER_FLAGS_5(atomic_cmpxchgb, TCG_CALL_NO_WG,
> diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
> index a0a8d9aa46..659f9298e8 100644
> --- a/include/exec/helper-proto.h
> +++ b/include/exec/helper-proto.h
> @@ -35,11 +35,15 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
>                              dh_ctype(t4), dh_ctype(t5), dh_ctype(t6), \
>                              dh_ctype(t7));
>  
> +#define IN_HELPER_PROTO
> +
>  #include "helper.h"
>  #include "trace/generated-helpers.h"
>  #include "tcg-runtime.h"
>  #include "plugin-helpers.h"
>  
> +#undef IN_HELPER_PROTO
> +
>  #undef DEF_HELPER_FLAGS_0
>  #undef DEF_HELPER_FLAGS_1
>  #undef DEF_HELPER_FLAGS_2
> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
> index ddbe06b71a..6c42d76f3a 100644
> --- a/tcg/tcg-op-gvec.c
> +++ b/tcg/tcg-op-gvec.c
> @@ -547,6 +547,9 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
>          in_c = dup_const(vece, in_c);
>          if (in_c == 0) {
>              oprsz = maxsz;
> +            vece = MO_8;
> +        } else if (in_c == dup_const(MO_8, in_c)) {
> +            vece = MO_8;

Nice optimization.

>          }
>      }
>  
> @@ -628,6 +631,35 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
>      /* Otherwise implement out of line.  */
>      t_ptr = tcg_temp_new_ptr();
>      tcg_gen_addi_ptr(t_ptr, cpu_env, dofs);
> +
> +    /*
> +     * This may be expand_clr for the tail of an operation, e.g.
> +     * oprsz == 8 && maxsz == 64.  The size of the clear is misaligned
> +     * wrt simd_desc and will assert.  Simply pass all replicated byte
> +     * stores through to memset.
> +     */
> +    if (oprsz == maxsz && vece == MO_8) {
> +        TCGv_ptr t_size = tcg_const_ptr(oprsz);
> +        TCGv_i32 t_val;
> +
> +        if (in_32) {
> +            t_val = in_32;
> +        } else if (in_64) {
> +            t_val = tcg_temp_new_i32();
> +            tcg_gen_extrl_i64_i32(t_val, in_64);
> +        } else {
> +            t_val = tcg_const_i32(in_c);
> +        }
> +        gen_helper_memset(t_ptr, t_ptr, t_val, t_size);
> +
> +        tcg_temp_free_ptr(t_ptr);
> +        tcg_temp_free_ptr(t_size);
> +        if (!in_32) {
> +            tcg_temp_free_i32(t_val);
> +        }
> +        return;

LGTM but I'd rather have another R-b:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

BTW (nitpicking) I'd rewrite the epilogue as:

        if (!in_32) {
            tcg_temp_free_i32(t_val);
        }
        tcg_temp_free_ptr(t_size);

        tcg_temp_free_ptr(t_ptr);
        return;

t_val first, because the !in_32 allocs are few lines earlier,
t_ptr last because allocated in prologue, so keep close to
'return'. Matter of taste ;)

> +    }
> +
>      t_desc = tcg_const_i32(simd_desc(oprsz, maxsz, 0));
>  
>      if (vece == MO_64) {
> 


