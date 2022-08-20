Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7DA59AFCC
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Aug 2022 20:58:36 +0200 (CEST)
Received: from localhost ([::1]:43072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPTg3-0007yv-Nk
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 14:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPTeJ-000678-30
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 14:56:47 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oPTeG-00061U-GS
 for qemu-devel@nongnu.org; Sat, 20 Aug 2022 14:56:45 -0400
Received: by mail-pl1-x62b.google.com with SMTP id x19so6692081plc.5
 for <qemu-devel@nongnu.org>; Sat, 20 Aug 2022 11:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=RcCcG2Xsp4REOgL3NEvHwIpTPCnURS+hNVyxWjRZ4Vs=;
 b=o20PnFCvFh/AafdsEXOsK7iTUAQbUU5oMqjziK5/7dzWgDOUptEcnge+R4FqWdi8Qa
 zIMFS9+M4MrJTc0CqK29mhyEesY/nbZTFyNi3qAntG9/XzJYUTW1FRBSOdZj6wxdHsk0
 klPOHHjrYwtQSrku20NGiUVRxLSi6E/gL2DgRpH8cg37IB/nD2fbyXBAXDEBrOIjjipS
 xRD7aA1gWxxn5BmLmCD0IzqBUfIAJBSVlU5H+/xeoTi7dlKIs+b4CjgeIqSdb80GK8Nb
 3JL3W2MVNXQ8KLRUa/oluzQlUH3UQdvsOvh0iiQkO/ByV5xJ//wGopmd7d3TpV7HgKik
 mANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=RcCcG2Xsp4REOgL3NEvHwIpTPCnURS+hNVyxWjRZ4Vs=;
 b=cw+TkZtXzBeE/oui1f5h7FUoHEWzeCuMbHajKSSUAdPVXMCBG/JgbE2K+ZBW2+B2H4
 IPpYjySpT7ayQ9yp+luI+M1mU+Wy37f8vgxJFYTFa76IIte4v2UQya8jpeIYK90j61Vn
 FLl1lQ75L02PgxawUYKmDRuSLXFk3VYlCt8et2fhdDk99/mQAks+uZBoriSD1RyvrxOV
 VP53IY2hmrHIYBlrtj6w/6JsS3/6lrCBEa2+eX4JAdy39hLgpSsXHOrxsEgG4Tih79S7
 aakvnLI+UwXfq0A4BtTIIY59WnkZi/QM0pWiFa06c3k5oCrJPorkxs/fd9cu1hV6k3P+
 OS6Q==
X-Gm-Message-State: ACgBeo2vjxPE0H53P3qot6mKndbyS3r6Gr1X+ISDx6Lt0SYZFRt88lUh
 5843AiotU9NvJSdM1vUwVXcievRbKOHTUQ==
X-Google-Smtp-Source: AA6agR6bcRP/0FBRwcfsYPBo9eEZ9JO7aXQgJSlay12R9nt/sPWTjcr1kdiDZ/ZnwljmVHNt33A+fQ==
X-Received: by 2002:a17:90a:c381:b0:1fb:c32:6324 with SMTP id
 h1-20020a17090ac38100b001fb0c326324mr2581296pjt.21.1661021797226; 
 Sat, 20 Aug 2022 11:56:37 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:142b:b2fd:5c12:7cf3?
 ([2602:47:d49d:ec01:142b:b2fd:5c12:7cf3])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a62a20e000000b0050dc7628183sm5706462pff.93.2022.08.20.11.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Aug 2022 11:56:36 -0700 (PDT)
Message-ID: <852e5c15-eb4c-dba4-4811-ced13742506c@linaro.org>
Date: Sat, 20 Aug 2022 11:56:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/10] target/arm: Report FEAT_PMUv3p5 for TCG '-cpu max'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-11-peter.maydell@linaro.org>
 <CAFEAcA-FTaf1FKYgmaoocaDGdozx3hr3xvQ7zRhUDPacvhxr6A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-FTaf1FKYgmaoocaDGdozx3hr3xvQ7zRhUDPacvhxr6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/22 10:26, Peter Maydell wrote:
> On Thu, 11 Aug 2022 at 18:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> Update the ID registers for TCG's '-cpu max' to report a FEAT_PMUv3p5
>> compliant PMU.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> Oops, forgot the docs update:
> 
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -52,6 +52,7 @@ the following architecture extensions:
>   - FEAT_PMULL (PMULL, PMULL2 instructions)
>   - FEAT_PMUv3p1 (PMU Extensions v3.1)
>   - FEAT_PMUv3p4 (PMU Extensions v3.4)
> +- FEAT_PMUv3p5 (PMU Extensions v3.5)
>   - FEAT_RAS (Reliability, availability, and serviceability)
>   - FEAT_RASv1p1 (RAS Extension v1.1)
>   - FEAT_RDM (Advanced SIMD rounding double multiply accumulate instructions)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

