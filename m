Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6740E69B7F7
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 04:46:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTEBB-00018Z-FJ; Fri, 17 Feb 2023 22:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTEB9-00018J-FQ
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 22:46:27 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pTEB7-0008Sq-Rb
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 22:46:27 -0500
Received: by mail-pl1-x634.google.com with SMTP id k10so3294708plg.0
 for <qemu-devel@nongnu.org>; Fri, 17 Feb 2023 19:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4ORPZA/pWVotURg6W8ELgZu2Ji+ogWXQa28mKpeOMQs=;
 b=yRHs1t9oL+VYrq9gtd+WRaASYQIm5pR/yYZz9p8JPkeLu8XzsLXvNfu1zEbRprFiRl
 3rVLzExfTF8LxQipz0JhorQw8Oz/VVx4XnppazOmeqrCkVN+KfbQhMhBBhlogIOZp1k0
 XRbNX6v6SI9Mso/ut26Skcm4JvLgOIkcvTsBxGmOBgmLj5+snzqWPsB1R5z8MO/MckLr
 yhiquUfAhhxH3Fra+TyHP8luByPet1/M4CwiOPe1Arab43D63UOTOExu14J6+UjIqlhH
 5Iv0b/MxOkmjkNptg7wO9zkT2ZPgBTDLshWnxNpLIUeI6K+B4bb3m86rwbymGZ3xaeLw
 xiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ORPZA/pWVotURg6W8ELgZu2Ji+ogWXQa28mKpeOMQs=;
 b=uwPjGmdUKJNmGskNgQimhgUfldkVp08UJRUG1NnecPoNDX1ufgg3bdmxDFab9eYLMo
 vgvBQkY3xNYCrCqBQx9hdgu4XqJ7I/9Q4VoQwQj/S3wpQtWVKN7VdZrk0UoJEcVHpg/y
 TVVv3zzWdhHOzGLKCPjz9cO7KWF3h4251DYyM4vkdD3LvSnLKBnCg8JMK+WjNLop0Dvg
 phtYRyqusfk21o4fJ9xvDBw7WLWJ5t5qwfFvjb4dd7a2MMwIIzSaSiOYnXJMEeiA+n3g
 c1R9qERQgM4ckqx6gaprkMahShPv7Oyol9A3dQESRhySL3K2GteOeAQi2t62BM5WgTYl
 0IGg==
X-Gm-Message-State: AO0yUKWu00ffgPEtK8jsyJXAftKmcfL78vnkMgqNn35lPLuLdbRVZdKY
 OY+Hn5WWzU2Zxn7QPto0/i9YUw==
X-Google-Smtp-Source: AK7set+Va4qsqgReJIoLzlYr7rijDBIQoSwA8VHqSXJOuJFWAewD4ajNSm27PZtnRK1rnuxsgyaiqg==
X-Received: by 2002:a17:90b:1e4d:b0:234:b35b:f8e7 with SMTP id
 pi13-20020a17090b1e4d00b00234b35bf8e7mr7370212pjb.7.1676691984391; 
 Fri, 17 Feb 2023 19:46:24 -0800 (PST)
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com.
 [173.198.77.219]) by smtp.gmail.com with ESMTPSA id
 gz8-20020a17090b0ec800b002343e59709asm3096432pjb.46.2023.02.17.19.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 19:46:23 -0800 (PST)
Message-ID: <dc7706fb-6b7c-7b08-9197-1a1a0f973143@linaro.org>
Date: Fri, 17 Feb 2023 17:46:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 3/4] target/riscv: implement Zicbom extension
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230217203445.51077-1-dbarboza@ventanamicro.com>
 <20230217203445.51077-4-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230217203445.51077-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.256,
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

On 2/17/23 10:34, Daniel Henrique Barboza wrote:
> +    /*
> +     * Section 2.5.2 of cmobase v1.0.1:
> +     *
> +     * "A cache-block management instruction is permitted to
> +     * access the specified cache block whenever a load instruction
> +     * or store instruction is permitted to access the corresponding
> +     * physical addresses. If neither a load instruction nor store
> +     * instruction is permitted to access the physical addresses,
> +     * but an instruction fetch is permitted to access the physical
> +     * addresses, whether a cache-block management instruction is
> +     * permitted to access the cache block is UNSPECIFIED.
> +     *
> +     * This means we have to make a choice of whether checking
> +     * MMU_INST_FETCH is worth it or not. We'll go the easier
> +     * route and check MMU_DATA_LOAD and MMU_DATA_STORE only.
> +     */
> +    ret = probe_access_range_flags(env, address, cbomlen,
> +                                   MMU_DATA_LOAD,
> +                                   mmu_idx, true, &phost, ra);
> +
> +    if (ret == TLB_INVALID_MASK) {
> +        probe_access_range_flags(env, address, cbomlen,
> +                                 MMU_DATA_STORE,
> +                                 mmu_idx, true, &phost, ra);
> +    }

Not correct, at minimum for discarding the result of the second call.  But I suggested a 
different ordering of operations which avoid a third probe.


r~

