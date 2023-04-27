Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF556F0456
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 12:44:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prz6u-0003H4-3P; Thu, 27 Apr 2023 06:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prz6r-0003Gg-PH
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:44:21 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1prz6q-0002Di-4V
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 06:44:21 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so1581930266b.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682592258; x=1685184258;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HMG4aRYU54ggKmSf8RRDHopNXelfYAWkKjGSxqyeU54=;
 b=oyBNEtMfB3exGMhiQFej/etw8CZ47yR9n2gx5p2xfDmbWm+Wc+K1B/xKCwzC2cD7Mz
 KNQqimMlKAyWbgG6NxIYfLizsqo9dbZzpQ0ZjpwrD7Z09QNS4VCnU5CqbKvZY03TJx2f
 xB01QKZH4zSQfHxaaSWKG0otjjxOb6AVQoGCcgCH3gtWj/P/FfhayUaXjknZ9byLtA85
 D4I4qD1pr2bRp2ZFmKu+Xb0xGpqwK0K78c4xO4Qjz6RMSSBpkk8tChkx3Fg3mJGU5b+V
 Xdci5TY9JOfzi52mWhJcll+Ru6TBCJXcXDSwQHfY269o+N0PtaKQ7SkCHX0MzVy6F2tI
 iGrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682592258; x=1685184258;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HMG4aRYU54ggKmSf8RRDHopNXelfYAWkKjGSxqyeU54=;
 b=R2/URDtSLyewR4GqGYiKxzqFUoedeCLskwCsKHAoVw+CN3kCx1iHDbVBVI/df9eKN7
 LcMKWV+cphIHbdJJu0ls+Kh6KJt6dy+t76XfPh30Z8hPZ5fehE2fYVr0ihZfoln2ukIw
 e/4QYLd6NVkE5d/woaUbLQCF5sVm/JlTTPKE+omvgB10yONwnSfjbnH1JevfvCgiGkkH
 /7k7ajRpJ2z7CDf0vyPhj+lJ4kbqGfNfecHsprJKaRAbX1UKWXtMxuJhLBXyMyQgYZXP
 ItAbJ85xdrr22LGbz90vMdozfg5byW4KElhuprDJUs9dUGl/m+e875IfuZQ4eH7G3s8g
 61+g==
X-Gm-Message-State: AC+VfDzkFn5jwohUJcxcsBRyiSBOFYrQ2cG/b3TUtmSBkgl1+pUI49jz
 ElvX1g8yopHWt3R7QUS1X1GE2w==
X-Google-Smtp-Source: ACHHUZ7HbgoUA3x+fi5+1xrSSuwT2X6V8rB3BnQx9at/Rd2qt8OwycZHorAUe/dWPrAB+6di6/eXmw==
X-Received: by 2002:a17:907:72c3:b0:94e:e859:7b07 with SMTP id
 du3-20020a17090772c300b0094ee8597b07mr1201173ejc.32.1682592258535; 
 Thu, 27 Apr 2023 03:44:18 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170906504e00b0094a90d3e385sm9349049ejk.30.2023.04.27.03.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 03:44:18 -0700 (PDT)
Message-ID: <48ba31dc-aba6-8737-a8b9-e15be356eda0@linaro.org>
Date: Thu, 27 Apr 2023 11:44:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 14/21] Hexagon (target/hexagon) Short-circuit more HVX
 single instruction packets
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230426004234.1319401-1-tsimpson@quicinc.com>
 <20230426004234.1319401-5-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426004234.1319401-5-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x632.google.com
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
> The generated helpers for HVX use pass-by-reference, so they can't
> short-circuit when the reads/writes overlap.  The instructions with
> overrides are OK because they use tcg_gen_gvec_*.
> 
> We add a flag has_hvx_helper to DisasContext and extend gen_analyze_funcs
> to set the flag when the instruction is an HVX instruction with a
> generated helper.
> 
> We add an override for V6_vcombine so that it can be short-circuited
> along with a test case in tests/tcg/hexagon/hvx_misc.c
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg_hvx.h        | 23 +++++++++++++++++++++++
>   target/hexagon/translate.h          |  1 +
>   target/hexagon/translate.c          | 17 +++++++++++++++--
>   tests/tcg/hexagon/hvx_misc.c        | 21 +++++++++++++++++++++
>   target/hexagon/gen_analyze_funcs.py |  5 +++++
>   5 files changed, 65 insertions(+), 2 deletions(-)

Ideally the vcombine override would be a separate patch.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

