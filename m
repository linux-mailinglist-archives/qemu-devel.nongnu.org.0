Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF8167F40D
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 03:37:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLb4n-0002TU-8v; Fri, 27 Jan 2023 21:36:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb4k-0002NU-LS
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:36:18 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLb4j-0006tx-14
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 21:36:18 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so6438664pjl.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 18:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eeoUmQMLdQ1WyosW4nOBrLnFFdxkhZVRkIm4TQfaRF4=;
 b=SmUiEc3tK4EmvCxAb7wRPgbVfZpHcdOLGEijc//CqAUQC12ZgVGKldSWM00DV/eVKJ
 01T0CS6qjSTXSdhwUzFIwN4VssVqA+PzjIPZUUVHfpqQ33uNCocUjhSlL8W8eSYmC0yp
 HxZJx7v7KUGCFx/t2jUi6dpprivWvFW5OF/Tsiwjm+Mjl2CWTup+Iqfp/taxn3yyp9s6
 f7lgB7Cqi9CzqyZ6eNJJSgnXok7FDayEGS0slyZw/uoTsTW0i30zo64qFr49IsmnOwZd
 ppn+iSV2B92auezLDWtz2bsRhOjOcHqEqmCYA0cjR3xQPFsGeqdOt1pTKIngWoM7ZWWL
 i1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eeoUmQMLdQ1WyosW4nOBrLnFFdxkhZVRkIm4TQfaRF4=;
 b=BiyA+HXr5iZIBckedJIxFGLXv4QdUYp0MlVmFkGqM6UIXUTVI9fioGcc+kGnA2pm4p
 509SS6Alpgzs9vtHmZe7+gu6AsDZKJNQY06ID0s/hKmGqlX847gBFYzCRFZQ67buyvYg
 VLypCgL1xN2v28SLRWAD/2fljknbwAzujjqm0iwp8z7zl+q2KQtMfiQg3fBwefd5Swv7
 jSq9IaC+s5un1fYttDk9OmKy3EpSubZXlB6hPEALVGcornyHYfNtbWN3S+nFe1rGJOXt
 uER1NPpqX266gr705emeeEJ9W5IACZyjtoHEMjv+KtJAm4U3A2R7+w77iblmHbTq6THc
 BdfA==
X-Gm-Message-State: AFqh2kr/uxe6JBsa4IGiyPubApFdJcXKnwv0fYhN41yOJHn2AQHZW21O
 OijiRf7ST5T50VKALbOomQZMRw==
X-Google-Smtp-Source: AMrXdXvkd85i6vG2UcywxEO2QrmR6/qaqT8U4OrdiO+Ws6jBT4R9pd9K0lBQa+B+YWsNXTfpBor+LQ==
X-Received: by 2002:a17:90b:1e4c:b0:22b:aac7:9256 with SMTP id
 pi12-20020a17090b1e4c00b0022baac79256mr31659705pjb.28.1674873374840; 
 Fri, 27 Jan 2023 18:36:14 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 q5-20020a17090a4f8500b002271b43e528sm5634847pjh.33.2023.01.27.18.36.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 18:36:14 -0800 (PST)
Message-ID: <c6fe258f-6670-e5b8-796a-1d5c05fa103d@linaro.org>
Date: Fri, 27 Jan 2023 16:36:11 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 09/23] target/arm: Implement FGT trapping infrastructure
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 1/27/23 07:54, Peter Maydell wrote:
> Implement the machinery for fine-grained traps on normal sysregs.
> Any sysreg with a fine-grained trap will set the new field to
> indicate which FGT register bit it should trap on.
> 
> FGT traps only happen when an AArch64 EL2 enables them for
> an AArch64 EL1. They therefore are only relevant for AArch32
> cpregs when the cpreg can be accessed from EL0. The logic
> in access_check_cp_reg() will check this, so it is safe to
> add a .fgt marking to an ARM_CP_STATE_BOTH ARMCPRegInfo.
> 
> The DO_BIT and DO_REV_BIT macros define enum constants FGT_##bitname
> which can be used to specify the FGT bit, eg
>     .fgt = FGT_AFSR0_EL1
> (We assume that there is no bit name duplication across the FGT
> registers, for brevity's sake.)
> 
> Subsequent commits will add the .fgt fields to the relevant register
> definitions and define the FGT_nnn values for them.
> 
> Note that some of the FGT traps are for instructions that we don't
> handle via the cpregs mechanisms (mostly these are instruction traps).
> Those we will have to handle separately.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h        | 72 ++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu.h           |  1 +
>   target/arm/internals.h     | 20 +++++++++++
>   target/arm/translate.h     |  2 ++
>   target/arm/helper.c        |  9 +++++
>   target/arm/op_helper.c     | 30 ++++++++++++++++
>   target/arm/translate-a64.c |  3 +-
>   target/arm/translate.c     |  2 ++
>   8 files changed, 138 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

