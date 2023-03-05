Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9836AB1C9
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 19:58:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYtXu-0008ND-Kh; Sun, 05 Mar 2023 13:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYtXp-0008Mu-HP
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 13:57:17 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYtXn-0005xz-T1
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 13:57:17 -0500
Received: by mail-pl1-x62a.google.com with SMTP id i5so7976413pla.2
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 10:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678042633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=grZdQwxZ4xuizrpLlEKQHo5YXvWK8LBNd/q3E3r31wM=;
 b=Ayo/S8JnAtrTj/C/hU9ueq6hjUDqX9kTbuK3dmVseuWtU6PrywVGRjs9JYE+FO01a/
 tMFkr6TpcVaKrRtoYL7OfHNsAj4if1DPYI3ESJTcUXXaDPBolSnEn6m5JxwDKGZg6fxm
 UbFdlw6CPp+I4thy6VVq+4/bXHfnRbuTRZ/A63yuqgykDymZDYnUPEmg3rCiszuaoiKY
 /IUz0m5q9MI09aovv5Tg5w9knSaexN8muMt8FwREXs2YK9cqMj9oen+V6BZSrMoLZfJh
 EvvKtaUL1XV06ncGRg1586BDrMQrmCkIw4d5fk+Er/tMJB8aQQttIDXlM+o+5ATqbC9p
 IjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678042633;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=grZdQwxZ4xuizrpLlEKQHo5YXvWK8LBNd/q3E3r31wM=;
 b=lNa0P34oMJwfTAfIXq3eHHO6RBha1mT6C/YoyEvYpI8JeaPKm2tVYzQgvwMMOlEYZM
 pgSXs2bHHCHudBWAxO7KVPYQJBom5sJvjQWim+MApun7UIKm+XBtLLV1D/KZjU3eMGJ5
 cpyB2zj4w0QnVd77BbIRuEYW0P0AptOl14WqnceY08gT95bVGqey4zyFobOXwpQ9bHDo
 GJm9RMYA/fKNzF+veakFE85lo0R9mrPnPUn62xDufufCKZ4QuX0WazuwuxM/6g2+o3CT
 rADQ1nrhDAtH2aqIG17doaJ2LIO0cezK5qFITJjB7kYMVvbeKkW6kdi+huu42d5YmioC
 nclw==
X-Gm-Message-State: AO0yUKUYRn0omR2GaAMb0Q3RvPkqe/VMdzAPJn82Rt+4/7lkBErqo0iM
 AwqODhespr75xx6l/vrC9Z4ajw==
X-Google-Smtp-Source: AK7set+kDMNno1Uvb8G9QVL1RMr0u6oGamkhQQHpjmzCP+oT1PH3w1dEF1RK1YyG8Pb4yaWx6Pm9ng==
X-Received: by 2002:a05:6a20:5483:b0:cd:47dc:82b5 with SMTP id
 i3-20020a056a20548300b000cd47dc82b5mr12199739pzk.21.1678042633327; 
 Sun, 05 Mar 2023 10:57:13 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:2a33:4111:eaee:9caf?
 ([2602:ae:154a:9f01:2a33:4111:eaee:9caf])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a62fb14000000b005d6fcd8f9desm4986920pfm.94.2023.03.05.10.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 10:57:12 -0800 (PST)
Message-ID: <4e6733c8-6bd8-9b35-df35-80ac5a729ace@linaro.org>
Date: Sun, 5 Mar 2023 10:57:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/8] qatomic: add smp_mb__before/after_rmw()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230303171939.237819-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/3/23 09:19, Paolo Bonzini wrote:
> This nasty difference between Linux and C11 read-modify-write operations
> has already caused issues in util/async.c and more are being found.
> Provide something similar to Linux smp_mb__before/after_atomic(); this
> has the double function of documenting clearly why there is a memory
> barrier, and avoiding a double barrier on x86 and s390x systems.

It does make me question our choice to use neither the Linux nor the C11 model.

> +      +--------------------------------+
> +      | QEMU (incorrect)               |
> +      +================================+
> +      | ::                             |
> +      |                                |
> +      |   a = qatomic_fetch_add(&x, 2);|
> +      |   smp_mb__after_rmw();         |
> +      |   b = qatomic_read(&y);        |
> +      +--------------------------------+

Correct, surely.

> +/*
> + * SEQ_CST is weaker than the older __sync_* builtins and Linux
> + * kernel read-modify-write atomics.  Provide a macro to obtain
> + * the same semantics.
> + */
> +#if !defined(QEMU_SANITIZE_THREAD) && \
> +    (defined(__i386__) || defined(__x86_64__) || defined(__s390x__))
> +# define smp_mb__before_rmw() signal_barrier()
> +# define smp_mb__after_rmw() signal_barrier()
> +#else
> +# define smp_mb__before_rmw() smp_mb()
> +# define smp_mb__after_rmw() smp_mb()
> +#endif

I notice you never actually use smp_mb__before_rmw(), but I suppose since we're trying to 
mirror smp_mb__before(), we should keep the interface whole.

Other than the "incorrect" above,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

