Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B716F42AA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:24:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto78-0000ZC-Kv; Tue, 02 May 2023 07:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto75-0000YK-LN
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:24:07 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto73-0004nX-NJ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:24:07 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f19b9d5358so36278515e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026644; x=1685618644;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a5MA3rQRemK8vwB863cSKTIFHdK8lYr1gYMNYZeBKeI=;
 b=Bcbs8ecD/s8OWC21qQHCXgtIOtsz+e9N2pEuihhlSmtvkG35bJz9rt3nEdqA/AtGjk
 utncNU76BTjlSaS2PZUAxKc4rgDIoetgH+uJ78vG76+tMs4flN3NEUeUPHQohOkzqVrF
 QY46VQ95P1tdDKnjzJtzgYtjQwDwsZiAPjoL5pSYCeUTka2hvlf4xfa2M6GAseTV45Tw
 lFNBODkjg3LMdbtliqpXu6v40kWJwep2aRzm+bljEzEpw7Z7Kl0AsaZ8j/xeQbJpLpxI
 1poX83LTnlPRA/vlUlLjTIpPb7g6cbmpLP+sJvY3GbZLhv/aqOzQMem+iiNFvk18ffbL
 BN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026644; x=1685618644;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a5MA3rQRemK8vwB863cSKTIFHdK8lYr1gYMNYZeBKeI=;
 b=Iszj1Ey2HeMXFUd9HuIqSH5iJRevEchFYpbBL3+qb/kDA/E34kPb9R2BNQpBA7B8+a
 D4iVL98vz6TDZOPTKa4yWSMkIWPZd+c8sCYeniwR1q0i21qtzY1M/XMj460OXdIjkclb
 MDj8Qae1iwgLsiRUsnBQ8jRg9cAZhXGo+u4yXX7CzEZbZ8La4EVpTFsyoii3FuAJlaS3
 KCcR/ytLSqHWkLnkHDKk6V/VXsNnQqN4PeULCLP5/WcoO3C1oxt2x6d5l/ZxWQHMRE/r
 Fdv+49AocbrOrWebs5mGq1V+dcK/UJqceuRTCwc8sLEcSMApel35k/UI0NxsEvua6LiF
 Sq6w==
X-Gm-Message-State: AC+VfDx37UMJ205OUPnRmbZEbYmzNh8aUBRB4lAkcs2cJZ0Fery7yQQE
 nM+8WfqOggkcwxefhIFM5OMFiA==
X-Google-Smtp-Source: ACHHUZ7IUxz2XiSXh2Z7OVd+ZpYhhnpq0k/iIvRAzjGD5j9n/5HiUZGXvd1IXj2MvorQhMZXMD70QA==
X-Received: by 2002:a1c:7203:0:b0:3f1:7b8d:38ec with SMTP id
 n3-20020a1c7203000000b003f17b8d38ecmr11402774wmc.35.1683026643674; 
 Tue, 02 May 2023 04:24:03 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:ad29:f02c:48a2:269c?
 ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b0030630de6fbdsm3889044wru.13.2023.05.02.04.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 04:24:03 -0700 (PDT)
Message-ID: <f56a6f93-c3ae-5d61-f6ab-bb1eee265197@linaro.org>
Date: Tue, 2 May 2023 12:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFC v2 4/9] target/loongarch: Implement kvm get/set
 registers
Content-Language: en-US
To: Tianrui Zhao <zhaotianrui@loongson.cn>, qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 gaosong@loongson.cn, "Michael S . Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, maobibo@loongson.cn, philmd@linaro.org,
 peter.maydell@linaro.org
References: <20230427072645.3368102-1-zhaotianrui@loongson.cn>
 <20230427072645.3368102-5-zhaotianrui@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427072645.3368102-5-zhaotianrui@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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

On 4/27/23 08:26, Tianrui Zhao wrote:
> Implement kvm_arch_get/set_registers interfaces, many regs
> can be get/set in the function, such as core regs, csr regs,
> fpu regs, mp state, etc.
> 
> Signed-off-by: Tianrui Zhao <zhaotianrui@loongson.cn>
> ---
>   meson.build                   |   1 +
>   target/loongarch/kvm.c        | 356 +++++++++++++++++++++++++++++++++-
>   target/loongarch/trace-events |  11 ++
>   target/loongarch/trace.h      |   1 +
>   4 files changed, 367 insertions(+), 2 deletions(-)
>   create mode 100644 target/loongarch/trace-events
>   create mode 100644 target/loongarch/trace.h
> 
> diff --git a/meson.build b/meson.build
> index 29f8644d6d..b1b29299da 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3039,6 +3039,7 @@ if have_system or have_user
>       'target/s390x',
>       'target/s390x/kvm',
>       'target/sparc',
> +    'target/loongarch',
>     ]

Sort before mips to keep alphabetic ordering.

> +static int kvm_loongarch_get_regs_core(CPUState *cs)
> +{
> +    int ret = 0;
> +    int i;
> +    struct kvm_regs regs;
> +    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
> +    CPULoongArchState *env = &cpu->env;
> +
> +    /* Get the current register set as KVM seems it */
> +    ret = kvm_vcpu_ioctl(cs, KVM_GET_REGS, &regs);
> +    if (ret < 0) {
> +        trace_kvm_failed_get_regs_core(strerror(errno));
> +        return ret;
> +    }
> +
> +    for (i = 0; i < 32; i++) {
> +        env->gpr[i] = regs.gpr[i];

For i = 1; register 0 is 0...

> +static inline int kvm_larch_getq(CPUState *cs, uint64_t reg_id,
> +                                 uint64_t *addr)
> +{
> +    struct kvm_one_reg csrreg = {
> +        .id = reg_id,
> +        .addr = (uintptr_t)addr
> +    };
> +
> +    return kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &csrreg);
> +}

Drop inline marker and let the compiler choose.

> +static inline int kvm_larch_putq(CPUState *cs, uint64_t reg_id,
> +                                 uint64_t *addr)

Likewise.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

