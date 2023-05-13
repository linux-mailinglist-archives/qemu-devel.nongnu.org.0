Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD82270166F
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 13:33:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxnUS-0001e3-HU; Sat, 13 May 2023 07:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnUQ-0001dN-Ph
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:32:42 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnUP-0006Cr-9Q
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:32:42 -0400
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-96652cb7673so1241573466b.0
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 04:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683977559; x=1686569559;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V6eHr2REfmKFDuZ5AS9E4L73aJfjavP+6AkXOXsADj4=;
 b=L7UMWCRn5N2pyx2APP0pZgAMXOvx09U3Y8nVv/Eq6YCOcgVBZdeRfFG/Q12WAoZP1o
 mUP0TwrXScqQkIFAl8azOGT4CD1OChIUa6qcWe36JwMIPRhY6Akz9LYGGBfzH1AKoLzv
 JFAAYyf6dhvsyzmo/ZIiqoJnZlyxGbA+dKtULTMpA3f41ruxDAUONhORi0Ho5Us6L8ph
 fKgz2tw6lHmGSjk7RpU6HbV6j2QEhgEuF4McBwtc4Jpip5aZ9mqHN/nWszJTd3oM3cUk
 D1XJ9gHnqV8Xwtz99V8KRl2JCydy4FPlprOWtQ64usBx0tdj6qZMPMP0p0H90dQmRU47
 kT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683977559; x=1686569559;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V6eHr2REfmKFDuZ5AS9E4L73aJfjavP+6AkXOXsADj4=;
 b=XyRF5yQLRyRSttRWSBqJ6ezgIXdgx+bxW6JhepKw/5tkVmXSLtHwIwjSL+D4gGgO1d
 IyI7Mqm2EjX44RNmB8M4Z3a6SEoST8Tihl8fDRrDTOkguYTLZ/1vMkLigsnY2PF3jqRp
 YodquOAquvEFAitkzJUg3qnXiiqWhLhfJM2cFyA+erdEo4eDfQ1k9puDhGXqBWfLn234
 TMP+dDeLsmwNHIoI620YIBPlPUUCNPxOuXvLlfzIc6YDJrCX2dxRQ8X1PMmMid3SwtH4
 2JQnnsta74YxZtZp1I1mOoorc4VKSrogZmWpHVV6iQ8B1Ge/r5eE95Abk1rpk8U0dEqu
 NWig==
X-Gm-Message-State: AC+VfDyaTyxNr296pDeFXOJvUP/KWJSutcYHDQPlmKH6hzx8pdumovCC
 hn6Sgvkj8olnxYKf1rc2pCMOig==
X-Google-Smtp-Source: ACHHUZ7Shl8KsPC373MlliiiMbCQLQqiCJ8llEF8HYPf/kRqX5K2JxSlyJ80zI/zbIzulruaKePCRg==
X-Received: by 2002:a17:907:802:b0:94f:7edf:8fa1 with SMTP id
 wv2-20020a170907080200b0094f7edf8fa1mr24834153ejb.32.1683977559571; 
 Sat, 13 May 2023 04:32:39 -0700 (PDT)
Received: from [192.168.190.227] ([109.144.17.21])
 by smtp.gmail.com with ESMTPSA id
 rh2-20020a17090720e200b0094f698073e0sm6608645ejb.123.2023.05.13.04.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:32:39 -0700 (PDT)
Message-ID: <f60fb053-4487-6a50-a18d-ff703dcb7c38@linaro.org>
Date: Sat, 13 May 2023 12:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 18/20] target/arm: Convert BRA[AB]Z, BLR[AB]Z, RETA[AB] to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
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

On 5/12/23 15:41, Peter Maydell wrote:
> Convert the single-register pointer-authentication variants of BR,
> BLR, RET to decodetree. (BRAA/BLRAA are in a different branch of
> the legacy decoder and will be dealt with in the next commit.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |   7 ++
>   target/arm/tcg/translate-a64.c | 132 +++++++++++++++++++--------------
>   2 files changed, 84 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

