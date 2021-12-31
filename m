Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807334825AF
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 20:57:51 +0100 (CET)
Received: from localhost ([::1]:35198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3O2A-0006X1-BB
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 14:57:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3O0q-0005hY-Fq
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 14:56:28 -0500
Received: from [2607:f8b0:4864:20::62d] (port=45980
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3O0p-0006RU-1R
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 14:56:28 -0500
Received: by mail-pl1-x62d.google.com with SMTP id w24so20799635ply.12
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 11:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0Hu5sPv8A8l2igdkc8ULtmQYc0Ed0J68BztDlsfNVug=;
 b=lYaSFmLe40qbi/zSuYQLItHUz+BlyfcEo6OWyqKzsuPIo5cqPE0RmAC3f8K4XEWk5/
 UTlLRo6ZCRR1yNngEyktffozoRvE2kByTUhWIws4JYTOTy5JbQt797MXq/IlMc8Qe36z
 /bkdNrFq8pIsKW8ZbPh+DWrKihbP93LkIpBMZzQTA9UJJ9/Z16uA6OZRMWcES9AO8dtB
 dl/XxUufp+WSC6CJC3Whv7mtix0LMbntq0unT3IOpH4LwX1M1uH+/2PNXHl5+HsQzy36
 pNQavlHTF7i2gVWAY9aJvYkCPZMxpQ7L4+zHF9NtGU6LT+tqhemHLqhfMFD990/frkp1
 04ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0Hu5sPv8A8l2igdkc8ULtmQYc0Ed0J68BztDlsfNVug=;
 b=xFTnCtIsVDSxtxnR0GJxDOl1yr1roJAlFsljov3na8fQ8teIdtetyjEkEUQPX9nsFH
 tkgGtSAVZPT9fN19KTGFo4Iy3PMAjHfijd0lMC4H2JXApe6ajPk5k8W9ejviU23iq+/Q
 He2UTJgO8kx4wJYMbwq6DWXEdH8sb6pYQNtfV1i9yi2+SVM1JRHU3JBCSGRvVFRjVdSS
 rlUoBaoFWNt9PxfEX1z9iZt1QuGR9KZGLi9AEIgtgUZepk2AAI/Oz5jn0+1cm/3nr7Gt
 jP5LP1qNDJwwrgt2rEezsl4yNCP33kSYKx2OJZU1/Pl4BoLi8tV73nZ/dG3aGLVbWcsM
 OpTg==
X-Gm-Message-State: AOAM533Dzm6McNkFLPXdorB5aTnGsmCLUS4aEFoHco6Kf+EZL7cJ3ayg
 x4CucC6SP/uepIFT+14jfkqWbg==
X-Google-Smtp-Source: ABdhPJwfqgv5JYFV0I9qLS6VPClfQI/oEP4Yy/CgNaF2ewkm0win4nD+Ay5jQ/GZv4PDDi16BxdtQw==
X-Received: by 2002:a17:90b:3607:: with SMTP id
 ml7mr44396532pjb.56.1640980585254; 
 Fri, 31 Dec 2021 11:56:25 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:9312:6940:7d21:4efb?
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id z19sm23054652pfe.94.2021.12.31.11.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 11:56:24 -0800 (PST)
Subject: Re: [PATCH v2 2/6] target/riscv: hardwire mstatus.FS to zero when
 enable zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-3-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <09ecdc1d-2f51-d5bf-1ecd-9ab6c132fd2e@linaro.org>
Date: Fri, 31 Dec 2021 11:56:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231032337.15579-3-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/30/21 7:23 PM, Weiwei Li wrote:
> @@ -363,6 +363,10 @@ static void riscv_cpu_reset(DeviceState *dev)
>       env->misa_mxl = env->misa_mxl_max;
>       env->priv = PRV_M;
>       env->mstatus &= ~(MSTATUS_MIE | MSTATUS_MPRV);
> +    /* hardwire mstatus.FS to zero when enable zfinx */
> +    if (RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +        env->mstatus &= ~MSTATUS_FS;
> +    }

This shouldn't be necessary because it should never have been set.

> -    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM | MSTATUS_FS |
> +    uint64_t mstatus_mask = MSTATUS_MXR | MSTATUS_SUM|
>                               MSTATUS_SPP | MSTATUS_SPIE | MSTATUS_SIE |
>                               MSTATUS64_UXL | MSTATUS_VS;
> +    /* hardwire mstatus.FS to zero when enable zfinx */
> +    if (!RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +        mstatus_mask |= MSTATUS_FS;
> +    }

I would think it would be more correct to have a positive test for RVF, rather than a 
negative test for ZFINX?


r~

