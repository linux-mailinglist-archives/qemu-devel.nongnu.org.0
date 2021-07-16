Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7E33CBE29
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 23:05:33 +0200 (CEST)
Received: from localhost ([::1]:58494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4V1Y-0000S7-9f
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 17:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4V0K-0007yF-Il
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 17:04:16 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4V0H-0007Bb-Lv
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 17:04:16 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 d9-20020a17090ae289b0290172f971883bso9596183pjz.1
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KQkMC8R4wVC6NLmErpjT59dZcGQ2i93cORHIitGMKWs=;
 b=a5pa8i/UULFBsyWdjQ7/MWOIdYsgAgtbFVseSGkbP+paysO0991jnKO/0yFzUcbO7U
 Qylh44xe+4XxUIBGm1FyqX+E/IstVorZPpruY2859nW5NB3maSTNu2ahRfoVv0r33oNd
 YHxKTf7lnO3lzHNRmHYguPh3os4Tz3EebgdWGU6EksOXCoiiz1dg8/cEWKhwaqLW89i5
 eB6kmMI8cEUiR08zR92m4dp8NVyDEH+xxSpjBmkMQlmnPWuWQtNvCTLLU7Q5HmYxu3QZ
 buB4oQoBGle/ZIcAKzfkNJTmPVIKicphkenpevfdH+IkAst8ZZrPRk90rnqPvGAWifUK
 LMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KQkMC8R4wVC6NLmErpjT59dZcGQ2i93cORHIitGMKWs=;
 b=ZimrzLZFgB8/vR/jM1rKTzfxASCGB5wGi6wmHkUgONUk2IFQJDSNCfEYt89pPjoAT0
 Qz5ZsUGIPO1xLq+N0DO7Ez6KdHuscr55uWFQY5kdgok+t6to0RCZHhM/ypiyCnGkPCIe
 QnmdZlaTIH2mYnMC4Hm9oC6tfuOjXlvXTfKNURoF7dUoXky/15vlwKyYVHBdRIjkC1p9
 Nhn64uXpagfXWgMMacnyU8bBsMOeEJWq68iqRzVC99XOmrCW23NIBuuSzefHg2QA5Wb/
 fo5AYq0L2LNV64EagKgNDD4F3xNcY7sTtGEj6G5RiEesrIvGewHLIYaUlyRrS+JnvrDu
 ISlg==
X-Gm-Message-State: AOAM533ILHMGOTSdNAhL+i9FgL2HAPvUAivKGgLL2T34695V3sEuI9q5
 Wncv67DYziJTTJX9Jz1RTfzkp7QU0mRwBQ==
X-Google-Smtp-Source: ABdhPJy85EJ5xyI2A1IRhXxSXNzO/pDIaU4oPVQvqrCShic01BfQAjmtD9cPFb53g+cjW4Diqepqrg==
X-Received: by 2002:a17:902:dace:b029:12b:5e9b:c517 with SMTP id
 q14-20020a170902daceb029012b5e9bc517mr5743893plx.37.1626469451974; 
 Fri, 16 Jul 2021 14:04:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y6sm9036793pjr.48.2021.07.16.14.04.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 14:04:11 -0700 (PDT)
Subject: Re: [PATCH for-6.2 13/34] target/arm: Factor out gen_vpst()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce35158d-e7bf-3b3e-978b-8ee277151de6@linaro.org>
Date: Fri, 16 Jul 2021 14:04:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/13/21 6:37 AM, Peter Maydell wrote:
> Factor out the "generate code to update VPR.MASK01/MASK23" part of
> trans_VPST(); we are going to want to reuse it for the VPT insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-mve.c | 31 +++++++++++++++++--------------
>   1 file changed, 17 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

