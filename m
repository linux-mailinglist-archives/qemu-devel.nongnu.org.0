Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D263DBFD5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:30:40 +0200 (CEST)
Received: from localhost ([::1]:38342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z9T-0007yF-Ht
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z7w-0005Ok-OA
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:29:04 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z7v-0007N4-7n
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:29:04 -0400
Received: by mail-pl1-x635.google.com with SMTP id m11so246464plx.4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=uTqsnjzUU8mbt6v+c9czfyTS9p3a0IyFHnzjJTkUQ1M=;
 b=AKbc4QheDIvRvh055sdPtd3WIgh2GuAop3RumY/Swh4yrBHuAVl67q/khbVAlYtAEy
 A9J/KeKM4NBeOBuy57dYlb2CgvUK1ZbKobDyT3KfI65bauEVPsfqnLgK2xn0TyUsCi1k
 LtieJUPPr980JApPcJZTRGB1JtfAdlrNVbSH3BAZ01x8rHCmuPh27kyGiU3W8QlJZPzo
 qOX+PuCr4S24sMHlbtrcmg5pkMf/f7FpJEG9MYVRQwu7kjY5HfWEnOxwruRCTkigW41B
 n3vB0JHztSd7NlloxSmY1USJS6b/DhMSwDTCMoKttBiF8Ai99/7qrw/zM7/jv0s1MySC
 Kgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uTqsnjzUU8mbt6v+c9czfyTS9p3a0IyFHnzjJTkUQ1M=;
 b=mv2jNu1E0o38HQMu+BcMA/Nv7AOEPN35Q88yTDjZSVNyqL7Z9QS7zDE85wpmiqElKi
 P+f52sbipQckH34ycQ8Ozfrw9UY+JKQGip2q6TXYKhFM69eE/R78+t8rM6z+s4p2V6RT
 b78NRffJv0ffQUYLZqzhaRcb+fZrmZsrPkneQTjRVVn9hPw9PsQXq5FhkioFQFao05H9
 +i1rF2GfXqbGJSGgNTvEbZF10xV6m/thW44dhJ3Qjc9EbL7NrixmWfD/BxC8OON76H7O
 SdeiqT7UIlmh0PX0G/n6K7DvV67M2AufqMxloBzAIjgfVtNhzLZfvvNIRhUegoRhU5L+
 TP1g==
X-Gm-Message-State: AOAM530XfSS2P3ct+nJZTDh9R1XDW99tEfQJyo3gm0McMXc6QQ18RNct
 ldEqAmhSfwHAt9Y3lWDtAsNQwtE2Ngm0SA==
X-Google-Smtp-Source: ABdhPJz9K3g4+DrHckJfHp1GRmxGc4EG1zSZ7nyq61KsDaltXn0udsb6mKzALUhUVTAjC72PQop7GA==
X-Received: by 2002:a17:902:a9c1:b029:12b:8ae3:e077 with SMTP id
 b1-20020a170902a9c1b029012b8ae3e077mr4100189plr.75.1627676941869; 
 Fri, 30 Jul 2021 13:29:01 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id u21sm3408117pfh.163.2021.07.30.13.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:29:01 -0700 (PDT)
Subject: Re: [PATCH for-6.2 50/53] target/arm: Implement MVE VCVT with
 specified rounding mode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-51-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <910957d9-91d2-5aa5-912d-e8a820ff4569@linaro.org>
Date: Fri, 30 Jul 2021 10:28:59 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-51-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE VCVT which converts from floating-point to integer
> using a rounding mode specified by the instruction.  We implement
> this similarly to the Neon equivalents, by passing the required
> rounding mode as an extra integer parameter to the helper functions.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  5 ++++
>   target/arm/mve.decode      | 10 ++++++++
>   target/arm/mve_helper.c    | 38 ++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 52 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 105 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

