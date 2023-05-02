Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1106F4A89
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 21:43:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptvsa-0000vU-S0; Tue, 02 May 2023 15:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptvsX-0000sw-HU
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:41:38 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptvsV-00068N-8Y
 for qemu-devel@nongnu.org; Tue, 02 May 2023 15:41:37 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19afc4f60so26613225e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 12:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683056493; x=1685648493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J9/8+ye7mjDQY5cW/Vai8ejtuoCb69ymRumEfh7030U=;
 b=opLPIrW554MXdoD9SGRcjpuysAaYlBjh3mK/Hn/+aa2a6Ycx9GlRdsS8gvQYfwhifC
 DqVj1qyDvFzctyeQJGaxzCjR1B9MJmpzZ7Lke1Pmkd6ohihlnjDsiA+tahZPJxiEK/Gi
 1wota56GkiNT45PNqEvBcTS30Jmryr8IOC9lJ/wZn/B7LYwhZ8zm2BFVUOm+8TBwoB7i
 8YFZWsgAqOINLRY6whI5rk+gA/5HP+LsHnlmB/JiPNa5zr7es087C2OS5Kmq6cDR0ps2
 ReF3S94I4NzbRv4rb4O/bM4sFJV6N/Iyhf9XUiXG8UdXhR6r+MRoweQGy5oC7OBUntK4
 kyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683056493; x=1685648493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J9/8+ye7mjDQY5cW/Vai8ejtuoCb69ymRumEfh7030U=;
 b=QC9/R+YohLiZtR8RQlff5Q87KXvxWo11yBwF4JqoLNmI4Bt1Rr/FapIa4CgET0I5eI
 ZemddCcMFkYJG/IPv5FCxAI5JwN7TcdIe7aYwcB7h4iu3yT0kl2USauDkDpwMNBW3hvq
 Imk661bUhoS0Dsk1TiludDLn1Nkm4qy32RD2Npj5yKhrEvRtIlv0sSoLgvtJLrYUiTbH
 ufaiGL7vyAuJWv9+CsqJeQ13L96S5rqu+WTLLpa6x+i56gabZTxRqBbR9DALHCY27EMP
 r8WnZEsKMUKIj/mzbW+rj0MqKf/Bm+fg+Jsx6Ca5PNOKfw9lCg18slvuA3E/r+N+snWB
 6z1g==
X-Gm-Message-State: AC+VfDysds+2S4ldzUAYm8o0RJJVHjb9A1O2ns6UDoz+xwLiU7sWGzkr
 qfQfrXEjUeWc+qnx4PQbh6AYSA==
X-Google-Smtp-Source: ACHHUZ4WkVCeDS4yXzg6yj4VY+U+SPrUKEgCOqu5WCZaGnC1UokaUKZc/1/HDDMfOpKIQtEBve7s6A==
X-Received: by 2002:a1c:f607:0:b0:3f1:91fc:564 with SMTP id
 w7-20020a1cf607000000b003f191fc0564mr12753140wmc.7.1683056493130; 
 Tue, 02 May 2023 12:41:33 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c450e00b003f0a6a1f969sm40301482wmo.46.2023.05.02.12.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 12:41:32 -0700 (PDT)
Message-ID: <670af6f3-003f-bbc8-4a88-4622a17b485b@linaro.org>
Date: Tue, 2 May 2023 20:41:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] softfloat: Fix the incorrect computation in float32_exp2()
Content-Language: en-US
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, vaibhav@linux.ibm.com
References: <168304110865.537992.13059030916325018670.stgit@localhost.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <168304110865.537992.13059030916325018670.stgit@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 5/2/23 16:25, Shivaprasad G Bhat wrote:
> The float32_exp2() is computing wrong exponent of 2.
> For example, with the following set of values {0.1, 2.0, 2.0, -1.0},
> the expected output would be {1.071773, 4.000000, 4.000000, 0.500000}.
> Instead, the function is computing {1.119102, 3.382044, 3.382044, -0.191022}
> 
> Looking at the code, the float32_exp2() attempts to do this
> 
>                    2     3     4     5           n
>    x        x     x     x     x     x           x
>   e  = 1 + --- + --- + --- + --- + --- + ... + --- + ...
>             1!    2!    3!    4!    5!          n!
> 
> But because of the 'typo'/bug it ends up doing
> 
>   x        x     x     x     x     x           x
> e  = 1 + --- + --- + --- + --- + --- + ... + --- + ...
>            1!    2!    3!    4!    5!          n!
> 
> This is because instead of the xnp which holds the numerator,
> parts_muladd is using the xp which is just 'x'. The commit '572c4d862ff2'
> refactored this function, and it seems mistakenly using xp instead of xnp.
> 
> The patches fixes this possible typo.
> 
> Fixes: 572c4d862ff2 "softfloat: Convert float32_exp2 to FloatParts"
> Partially-Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1623
> Reported-By: Luca Barbato (https://gitlab.com/lu-zero)
> Signed-off-by: Shivaprasad G Bhat<sbhat@linux.ibm.com>
> Signed-off-by: Vaibhav Jain<vaibhat@linux.ibm.com>
> ---
>   fpu/softfloat.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Whoops.  Good catch.

r~

