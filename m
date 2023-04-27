Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290E26F04B3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:06:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przRe-0004DM-Ri; Thu, 27 Apr 2023 07:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przRc-0004DA-Pl
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:05:48 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1przRb-000794-7x
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:05:48 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5067736607fso14492356a12.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 04:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682593545; x=1685185545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ts6vZ+nScpLZ/YLrlBn6nX1nn8QQNBQr3vHVewNrwL4=;
 b=eqreLt257YGZOca2xH/x++tBCMCFXlTe9e9xryuGr3GSg85ecsdD140VmVa725tgRs
 UgEKtQ850tkUp6AIUaIeIhnm95HRMaJXPSQb2uRavk6QdJcCCRNToigIndU/jEWiet5V
 L3TAYUopQbajhm4vEIKqhxHo9N1U0qFg7Z++OtfRTsOhPOHtk1gvQL+oPbHYOfjYa2CR
 Coli92GsNFykhAVPj+oB//2AaiJNF3Kl/xyO26u0JJpxLs0GrqM4LtY6euTfcE0sscVU
 PlmPfNay8IiGJ6NhukhZMJcrnA5kw6feh8rkdwcbpd89Lu0tJ79/unXwDvU8KqqKpYUw
 JKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682593545; x=1685185545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ts6vZ+nScpLZ/YLrlBn6nX1nn8QQNBQr3vHVewNrwL4=;
 b=R2PDm4ii1QhEMLFJOm8iQ4ftrs/NSaeray9VOlu6viumcQFFKjGs6hlnDig28IAj0t
 KgxV0YVvimdjaRAa22NkTAjMlPRl3eCtwAC2jwXFbqukKBlmLCEgzn6dAiCUoHTlmZtU
 DVir0qRsJ7T7MxsAJ3tgmnVfAgcb9xkScG+mzPZupRjibMzt34QgdEpfn0nxL9nbQvjz
 mMo2qtv4/Zjp+wML2t34yPYIuFM5WdMYc4HRvfYNWDFgMilcB5NmRugI7rRlQJluUhx8
 ORqMocrKUL64AbV92l9oKmyaFtSz0IxEyE3pUWHIjCno/0BzvjRfZQEUAEBR8Keux2SE
 diEA==
X-Gm-Message-State: AC+VfDy8L5mLPGFeI2ix0QnSM3GByAxsNWE538XIXiet7eLzqsTHVzCv
 o9p8y3xDzTrmFs9TFDMDspG7yA==
X-Google-Smtp-Source: ACHHUZ7dd+VtOf+WZMI4yZFU58Z2LV6+oOuuflcDRGIrM5qI3je4lQyvSkPgema/vgVGUtajyyFRpw==
X-Received: by 2002:a17:907:94ca:b0:92f:924b:e8f4 with SMTP id
 dn10-20020a17090794ca00b0092f924be8f4mr1310650ejc.4.1682593545613; 
 Thu, 27 Apr 2023 04:05:45 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 fx21-20020a170906b75500b009531d9efcc4sm9422338ejb.133.2023.04.27.04.05.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 04:05:45 -0700 (PDT)
Message-ID: <73122088-84f4-88f9-5925-3d12a71ac47a@linaro.org>
Date: Thu, 27 Apr 2023 12:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 19/21] Hexagon (target/hexagon) Move pred_written to
 DisasContext
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
 <20230426004234.1319401-10-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004234.1319401-10-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52c.google.com
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

On 4/26/23 01:42, Taylor Simpson wrote:
> The pred_written variable in the CPUHexagonState is only used for
> bookkeeping within the translation of a packet.  With recent changes
> that eliminate the need to free TCGv variables, these make more sense
> to be transient and kept in DisasContext.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/cpu.h       | 2 --
>   target/hexagon/helper.h    | 2 +-
>   target/hexagon/translate.h | 2 +-
>   target/hexagon/genptr.c    | 2 +-
>   target/hexagon/op_helper.c | 5 +++--
>   target/hexagon/translate.c | 9 ++++-----
>   6 files changed, 10 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

