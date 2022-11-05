Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7319361A64C
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 01:08:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or6if-0004vo-63; Fri, 04 Nov 2022 20:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6iX-0004ve-3S
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:07:21 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6iV-0005HV-G8
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:07:20 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-12c8312131fso7214840fac.4
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 17:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UYTQNE+4swfsoA3ytnPGgbsRBvTcCk8PTSFd4wPAU1M=;
 b=koTqvGeAasWIz3K67gZKNNCV0jU2qMQIVLRrnqCAeMmUPo4dKGfRBFh8ayBCu0A/9j
 Kyojlf9LOANehhMwHHXF5cah98mTDMDqZlIBDPRXgRfhwUBxmkkVPT8Z4q/CmBoAGXoO
 LtpMEK5BqXnAx8KeCQZWCFjX8uaE+vgRHgGBfqACoivS2wN8PT/aTaT+aBc1IGGqiF7e
 os2eCNXTiTPjk5a+u5Y6RvpnNGapEX7xOsFbABFEMM2T/MY6T2KROfDqTEbMKvK70+RY
 kLq29j8NSlCGSmTaMZSU64tGCWzLpa1OIpEGEMqOMwZtorVS4MjKnkTI7bkdaLivbF29
 hYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UYTQNE+4swfsoA3ytnPGgbsRBvTcCk8PTSFd4wPAU1M=;
 b=qFXWrhjfJK8B7G4cyh3oapLxQBYGgsm+JBH2nklmKqHh5rbZTXusX9n6UpHMV7sIPq
 RYqXq2OtVk2Z2nMiP1zzidaWGB3rTjXo5JOpOhc2NRUMWUPbxFlOOUr6SUCAeB/z/WKZ
 cCzoApXnnD8lPntghRQ8VtlMJQlVgJRx/ipanXGkjIm+KIX50xayWKGCQU2MrSvSMr+R
 STqhlC/og2IchUcpS9qahqFQrKyZ1fEUH3iVnsoyViJH1rJN3VWz9B3GsN54MFYGmao4
 qi6Hl85Qfn2Qh2jxLNoPDyDKXXEoOQmoImxvWLCXSB/UYmvBaCeANA5ZwIxqhwExKwPy
 u2KQ==
X-Gm-Message-State: ACrzQf1LAkD8J5hUw569L+CxEyHmOCQdAH05nhI9Gstv0CQwfN88IsQe
 HXwXkVo07lZB5bJJxd6bvnNzwg==
X-Google-Smtp-Source: AMsMyM5SL7A5fOcTiQpKOL21jSkx6zXsVf4lWOdNDy8kWafxFIvzgmmWwu/jt4fBG3pIqwvuhI5/iA==
X-Received: by 2002:a05:6870:a910:b0:137:b7b:f390 with SMTP id
 eq16-20020a056870a91000b001370b7bf390mr33272378oab.124.1667606837310; 
 Fri, 04 Nov 2022 17:07:17 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 j24-20020a056808057800b00342ded07a75sm196269oig.18.2022.11.04.17.07.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 17:07:16 -0700 (PDT)
Message-ID: <96cf50b5-6e48-62e7-b683-4ded1de30345@linaro.org>
Date: Sat, 5 Nov 2022 11:07:06 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 05/11] Hexagon (target/hexagon) Remove PC from the
 runtime state
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-6-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-6-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> Add pc field to Packet structure
> For helpers that need PC, pass an extra argument
> Remove slot arg from conditional jump helpers
> On a trap0, copy pkt->pc into hex_gpr[HEX_REG_PC]
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h            | 7 +++++++
>   target/hexagon/insn.h               | 1 +
>   target/hexagon/macros.h             | 2 +-
>   target/hexagon/translate.c          | 9 +--------
>   target/hexagon/gen_helper_funcs.py  | 4 ++++
>   target/hexagon/gen_helper_protos.py | 3 +++
>   target/hexagon/gen_tcg_funcs.py     | 3 +++
>   target/hexagon/hex_common.py        | 6 +++++-
>   8 files changed, 25 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

