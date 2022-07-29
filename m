Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0707F58543A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 19:11:57 +0200 (CEST)
Received: from localhost ([::1]:51458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHTWm-0006Y7-3G
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 13:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTTT-0003dI-D6
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:08:32 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHTTP-0000Rh-TY
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 13:08:31 -0400
Received: by mail-pl1-x631.google.com with SMTP id p1so5122343plr.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wOWA1vK0qRFI6ElUzY5FlwL2rc00i37s841z+ThwW7Q=;
 b=eGXAxpt4BYCvEcYwOd6Qh5fzD3lE15CqNdQNC2Xck0RIO1w3zIwe9TLPxx21m0q8ZF
 wZhJnWCKEkPjOErJI+t/dGH3WEl7hkK2fPU5+q9Fq3ByCEmdyicCGBnc21SCn/+LcodR
 S69LzgWb50uzHbIUvzxDAuNRbkCY+RLI7BvFtJZ3DEIcsFjrZeT6TG92WmnJASgEWKBR
 /04GXoolUZRC6vM/hBPuHR7xdSw15Am/mAEwhH523VYNpD0R2nbSM9W0dlN7R5gEzQ0j
 oJiHJKbLzhlWNBvpvHyMdZHCWs3SdHIBD2KYe67rlbAvUIYIL8xX6KYFtNTA8oSZesVN
 DTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wOWA1vK0qRFI6ElUzY5FlwL2rc00i37s841z+ThwW7Q=;
 b=wvUQGwhhjUCyYciRpZ+VbJlYrWFUJSKzQqepsT2/rtj21G/yFqiTEM9CRcvTS3WgLH
 Gonp8JtOZtHf5Zth+gL4qZWAFoM9WLksCsOTlEMKM3XcRrmcobfuGg9RE2r/GnS3Akb6
 0LNVZ44C/Bzg1IQY2VaU7e5tmlAeGUvvoCj4wrNAnbZUyR/mM36Ol7f8/sm+wxw1gLVh
 +fHrLkQrOgBuj9/fx7T1xMfRblg7Co2ZUreDQGjC2Akpg1FEbBR/ly9Ocg0VZ3dvG3MD
 4EzB2nYQ2kECr2zdR8QoW+TaIemeO6DmZ8S1mLVpmZnfy5H/PFLU7USB9gmIv3UyvJlP
 j6Dg==
X-Gm-Message-State: ACgBeo1/xxeVZTTiiOl+bI0gaZMSH7JfThoXUGU99nq8wpov71TlhaLF
 827iOJVHSA/S2fEWnGmK4W9peQ==
X-Google-Smtp-Source: AA6agR4/sZZw7jWIhRVOmYxKKOI+/OFZn2/QHJ3OGVwC0Tl68Dn1DfUfY3Pq3B6X8YlsA02vTnfzeA==
X-Received: by 2002:a17:90a:7885:b0:1f2:1825:ae7e with SMTP id
 x5-20020a17090a788500b001f21825ae7emr5143134pjk.39.1659114506141; 
 Fri, 29 Jul 2022 10:08:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:51c4:5cf0:5954:aeb6?
 ([2602:ae:1549:801:51c4:5cf0:5954:aeb6])
 by smtp.gmail.com with ESMTPSA id
 p64-20020a634243000000b0041a27e7284bsm2802425pga.48.2022.07.29.10.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 10:08:25 -0700 (PDT)
Message-ID: <3d7ae42f-cc75-a231-98ea-dd9884f3be1c@linaro.org>
Date: Fri, 29 Jul 2022 10:08:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] Hexagon (tests/tcg/hexagon) reference file for
 float_convd
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 mlambert@quicinc.com
References: <20220718230320.24444-1-tsimpson@quicinc.com>
 <20220718230320.24444-4-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220718230320.24444-4-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 7/18/22 16:03, Taylor Simpson wrote:
> The test is in tests/tcg/multiarch/float_convd.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   tests/tcg/hexagon/float_convd.ref | 988 ++++++++++++++++++++++++++++++
>   1 file changed, 988 insertions(+)
>   create mode 100644 tests/tcg/hexagon/float_convd.ref

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

