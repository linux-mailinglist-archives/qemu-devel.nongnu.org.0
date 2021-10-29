Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F229E4403E6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 22:13:32 +0200 (CEST)
Received: from localhost ([::1]:56440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgYFo-0005tw-3L
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 16:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXeJ-0006gJ-3H
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:34:47 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgXeH-0001Xi-J7
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 15:34:46 -0400
Received: by mail-pf1-x42d.google.com with SMTP id 187so10107961pfc.10
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sUMMUIj8FxrUYpJZmDf2CzNQC8fqUMSANo4MHrO51dA=;
 b=Ioouen8BR/HlIuEVxE3FXlS54JsZf3M3riihGMzb4JjE4bDMpEDEgA1RiNiLnHAI1u
 3kC8tepwmZSdEseCJbhvemPuphT9kJysWFdzOE8rr+kP5JV0JoYvdQp9eD+szt7+w98r
 fE5GANAPb0nlnxNxLH1gdaulhxCkgG/3fXfmLVoxheqCRmpo2VbsmeC0rOVDM6pJCleZ
 V5e2KrmF5oZFXnYxosKeNonBHsnwSdKTKGyTQy2zq2i+kCEjOpM2KiCl+q43I7XXVMTb
 J2Yn0DW2P696HNNXzCdimPEY5JxF1i8GPOdVLK/vkoT0KIt5s08WBFd2XLAXkxf66PqE
 rm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sUMMUIj8FxrUYpJZmDf2CzNQC8fqUMSANo4MHrO51dA=;
 b=5O2JdmzKTtuAQ8HUsmD+pmpnfm+MD8DcXp+UqKsJY0mNIO2Cj+QrsJwas78Jc95rtZ
 Gs2xDDDpKW+OGvOkHOxcep1uh7cjjGft1CFPNdc4gTBcEIIgrCIGQU77B/+nNAVU++9h
 mFPFGX6YAQd23IV3UT/Y+v5H9jYNd6u/hHQ7Tjbfb8FZgNL49+NKtvPKZ4BQnYBJCwVs
 M5Xl3pmv6qxyKE6H73vhcvWC4F1X4xY6fSYBp0CVbAw+gK32RPlOPXO1DdaROdgWuOVh
 HdCKPzBUrADWXDnM++J6umDnMnDWGmcme51usiJq/z704GvVzvgu56fAYYLRR9d1Q8+W
 ARuw==
X-Gm-Message-State: AOAM533gkcqsLUHxU8MFwz9SbqEcErZ2PQLIogC3ZFjQsNbhlguaevpH
 CFxwuUx7D7xtPrZyE3QATrZBCwURuFYXmA==
X-Google-Smtp-Source: ABdhPJws42MU8bJWZrURfIe+fppT1xutN20vb2O88s8XvtYccUBnEDEmwvaVyTtJtZ7sNlYgRjbNyA==
X-Received: by 2002:a05:6a00:1484:b0:47b:f6a3:868f with SMTP id
 v4-20020a056a00148400b0047bf6a3868fmr13032507pfu.66.1635536083778; 
 Fri, 29 Oct 2021 12:34:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id c85sm8211907pfc.146.2021.10.29.12.34.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 12:34:43 -0700 (PDT)
Subject: Re: [PATCH 3/5] target/riscv: Add a config option for native debug
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211029152535.2055096-1-bin.meng@windriver.com>
 <20211029152535.2055096-4-bin.meng@windriver.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7bd2521d-756b-9656-cf59-211f7836f883@linaro.org>
Date: Fri, 29 Oct 2021 12:34:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029152535.2055096-4-bin.meng@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/29/21 8:25 AM, Bin Meng wrote:
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index eface73e7d..3a2fa97098 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -439,6 +439,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>           }
>       }
>   
> +    if (cpu->cfg.debug) {
> +        set_feature(env, RISCV_FEATURE_DEBUG);
> +    }
> +
>       set_resetvec(env, cpu->cfg.resetvec);
>   
>       /* Validate that MISA_MXL is set properly. */
> @@ -619,6 +623,7 @@ static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>       DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> +    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>   
>       DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),

This half of the patch needs to come as the last patch, after you've finished 
implementation.  The first two hunks might as well fold into the first patch.


r~

