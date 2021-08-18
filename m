Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C13EFFA1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 10:54:46 +0200 (CEST)
Received: from localhost ([::1]:51934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGHLR-0003Fh-Iu
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 04:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHIR-0007zi-Aq
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:51:39 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGHIP-0004hQ-NI
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 04:51:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id u1so1144530wmm.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 01:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0wpfzH4cHmJbfrS2LWTfoXSfayrEgrPuvgwzfyLf1wU=;
 b=a7LmjB5YEEUSkF88y6RFnwlfIdJONIKTobjoNTI+wjfQc2fTDDNJUwezjB4DpWuvCL
 01TYvSHUSfz40lV6yma0KWrMyCkf2TmrBJ+lfai1Xn0yPVr1B1VhtGZaVa1E2PYTJhNI
 R+/YPHzDU5knRMHpUcMaZQZb8Y9oDemBSYE31f4PI6jZ7YflkErfIZPmksbaMbwsu6X4
 65b1awLutfjcZX4jBTrBTkCiyQVWhqD9W124tGsuro0KGILw+nXtQBprCFDdY4WIiJW2
 v+ITWK4bqBC9NvNrZdEa7VuAGm/64Y3Lzo5kcb5eKVRD3W9H0kI8wucPKSOCaQGw3Q9N
 OkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0wpfzH4cHmJbfrS2LWTfoXSfayrEgrPuvgwzfyLf1wU=;
 b=bW1r0s6HqgfCBCv9C5JrdJdJk4LiTy8X8i1rZQiX9cl/IT1i6i927U5/8Ns8B2JoYp
 ku8jihXPtGL5Fae0F7Dr3E16yhM/fz+zAR/kqOZKKLOTniPLeQj5YPGDarE2s1i4BU61
 zCZEr5oaT3kRclXGsGIT0MRrBSxDnar/dYSxFNNIlZNwV6obHUtKfqIEPnCBO7rRG5IM
 BeqicWBQAsQORdqL+yO5+jh5daPlOjT3Wbj+dbILBGsIQHlTHH5+BOstSAcP+N58WKkk
 oztxiEr5AeUbfkn3Fs7xRdTl1xri0iKzNGFiufHwzPgxyoODELRJ0RiBEocF+4acP1Pf
 rFrA==
X-Gm-Message-State: AOAM532nQzOsWgKrduyej7WG6cNi64Hs7j2QZmjMesLWLopzZx6WiI+5
 DL2UypjPNU+rTpXACvAX8WkrEfJw5nM=
X-Google-Smtp-Source: ABdhPJyqAOcC7IqnbQDPbHiRj3yMhdRWu4J3XWGxa3q5h9s3c6PseM3Mx2QTddMGXHaHjC1kzU1R8A==
X-Received: by 2002:a7b:c3d8:: with SMTP id t24mr7251348wmj.88.1629276695559; 
 Wed, 18 Aug 2021 01:51:35 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z15sm5009498wrp.30.2021.08.18.01.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 01:51:35 -0700 (PDT)
Subject: Re: [PATCH v2 20/55] accel/tcg: Report unaligned atomics for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d6cdd362-016a-cf05-e444-ce5cd813957c@amsat.org>
Date: Wed, 18 Aug 2021 10:51:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 8/3/21 6:14 AM, Richard Henderson wrote:
> Use the newly exposed cpu_unaligned_access for atomic_mmu_lookup,
> which has access to complete alignment info from the TCGMemOpIdx arg.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/user-exec.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 90d1a2d327..5ad808a25a 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -28,6 +28,7 @@
>  #include "qemu/atomic128.h"
>  #include "trace/trace-root.h"
>  #include "trace/mem.h"
> +#include "internal.h"
>  
>  #undef EAX
>  #undef ECX
> @@ -1230,11 +1231,22 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
>                                 TCGMemOpIdx oi, int size, int prot,
>                                 uintptr_t retaddr)
>  {
> +    MemOp mop = get_memop(oi);
> +    int a_bits = get_alignment_bits(mop);
> +    void *ret;
> +
> +    /* Enforce guest required alignment.  */
> +    if (unlikely(addr & ((1 << a_bits) - 1))) {
> +        MMUAccessType t = prot == PAGE_READ ? MMU_DATA_LOAD : MMU_DATA_STORE;
> +        cpu_unaligned_access(env_cpu(env), addr, t, get_mmuidx(oi), retaddr);
> +    }
> +
>      /* Enforce qemu required alignment.  */
>      if (unlikely(addr & (size - 1))) {
>          cpu_loop_exit_atomic(env_cpu(env), retaddr);
>      }
> -    void *ret = g2h(env_cpu(env), addr);
> +
> +    ret = g2h(env_cpu(env), addr);
>      set_helper_retaddr(retaddr);
>      return ret;

Can't we simply do:

       return g2h(env_cpu(env), addr);

?

>  }
> 


