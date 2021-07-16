Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6283CBCFE
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 21:58:54 +0200 (CEST)
Received: from localhost ([::1]:56816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Tz3-0008KG-A9
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 15:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Ty8-0007Su-Bi
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 15:57:56 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Ty6-00040P-NU
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 15:57:56 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o3-20020a17090a6783b0290173ce472b8aso9497488pjj.2
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 12:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=mBWvxVQ+4lM+5pd6/LRpX+9YbUiacDr7n+RUY2UmbKI=;
 b=Fk6zIMtq6ZXMTClkqh9/hgAskOqRBEMuYO//HQXWcBXOaP8rCp5mtuluXCjVMsH7ON
 qIsK4RE9EzLdDeEc4MFSCXKvwfHptU5Z5mK0P2lEw/e8/JKt1a/aXjjGPMIpyjB+/e0j
 jE89IntlHJOIYwQ9Jqlx7jm3RfeTJ8a/JZRiFLQTFWeletPTn+vSZwE3wvMUl0Dh9Y2x
 FKQlvgA8qUHxvz9IDtbXXKkw8s8/NAGkTRPJEQtqnKKYbs9keNoQJ8dTAr3PS38k6mza
 k4Y5+PdHIgCQ0bBZf7RLXSOeonp9vxNc1jIM+AViORONB0NOaQ794VM9k/VywJkjkw9N
 B+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mBWvxVQ+4lM+5pd6/LRpX+9YbUiacDr7n+RUY2UmbKI=;
 b=btb2siZ8Jqfq4HN+H0m9YPggG2psgAO8DOZnZ4wGcrDAbtCHeSNtuSQIhsd+msxszU
 bACHCqdViPJyefqpC8deTv48QM3QZ1h43/0boadkng3ojem2RpJ3TF8u7QI3J4LdwfRS
 LmxE9jFdwNoeAXoWi49wXoOZYEtEdOBGlDl9L/D0OpCxo/eg4XRi9QlbnK2856LSDZnh
 4EczyAjJl+iMC8dJ8sVA6znWXxmx8WTjgCEzI953mOt7LwUGUmzopuILCcknFq8AznGl
 X39yDyn190poXm+35ZopDe7rXmCG+VUjuJ5xXEV8doRCCaoTh/i36YGv6EkYwf3P7fF3
 h9NQ==
X-Gm-Message-State: AOAM532kW50viwj8aSM3i0EiKYQOWvzUjS5Le+buOiyd6WeneE85NlPZ
 t7Ts0ZAGyH4bS1986a9HW5797G9qx3dsbA==
X-Google-Smtp-Source: ABdhPJxMmBXE7+Z45ztH+SSVvW5uwmTyFpGS7qsxALaIMFpv1OdCUdrYGTcNKmD9VmQa4RFS4o8QGA==
X-Received: by 2002:a17:90b:338d:: with SMTP id
 ke13mr17214198pjb.151.1626465472911; 
 Fri, 16 Jul 2021 12:57:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id a23sm10784892pff.43.2021.07.16.12.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 12:57:52 -0700 (PDT)
Subject: Re: [PATCH for-6.2 12/34] target/arm: Implement MVE
 incrementing/decrementing dup insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <170925ed-040a-d117-9e16-fbee7604f820@linaro.org>
Date: Fri, 16 Jul 2021 12:57:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 6:37 AM, Peter Maydell wrote:
> +#define DO_VIDUP(OP, ESIZE, TYPE, FN)                           \
> +    uint32_t HELPER(mve_##OP)(CPUARMState *env, void *vd,       \
> +                           uint32_t offset, uint32_t imm)       \
> +    {                                                           \
> +        TYPE *d = vd;                                           \
> +        uint16_t mask = mve_element_mask(env);                  \
> +        unsigned e;                                             \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> +            mergemask(&d[H##ESIZE(e)], offset, mask);           \
> +            offset = FN(offset, imm);                           \
> +        }                                                       \
> +        mve_advance_vpt(env);                                   \
> +        return offset;                                          \
> +    }
> +
> +#define DO_VIWDUP(OP, ESIZE, TYPE, FN)                          \
> +    uint32_t HELPER(mve_##OP)(CPUARMState *env, void *vd,       \
> +                              uint32_t offset, uint32_t wrap,   \
> +                              uint32_t imm)                     \
> +    {                                                           \
> +        TYPE *d = vd;                                           \
> +        uint16_t mask = mve_element_mask(env);                  \
> +        unsigned e;                                             \
> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> +            mergemask(&d[H##ESIZE(e)], offset, mask);           \
> +            offset = FN(offset, wrap, imm);                     \
> +        }                                                       \
> +        mve_advance_vpt(env);                                   \
> +        return offset;                                          \
> +    }
> +
> +#define DO_VIDUP_ALL(OP, FN)                    \
> +    DO_VIDUP(OP##b, 1, int8_t, FN)              \
> +    DO_VIDUP(OP##h, 2, int16_t, FN)             \
> +    DO_VIDUP(OP##w, 4, int32_t, FN)
> +
> +#define DO_VIWDUP_ALL(OP, FN)                   \
> +    DO_VIWDUP(OP##b, 1, int8_t, FN)             \
> +    DO_VIWDUP(OP##h, 2, int16_t, FN)            \
> +    DO_VIWDUP(OP##w, 4, int32_t, FN)

Would it be useful to merge VIDUP and VIWDUP by passing wrap == 0?
Or merging VIDUP and VDDUP by negating imm?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

