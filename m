Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4962157648C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 17:39:24 +0200 (CEST)
Received: from localhost ([::1]:39392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCNPW-0003QQ-UU
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 11:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oCNNi-0000UW-3D
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 11:37:30 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:39829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oCNNg-0002UR-8O
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 11:37:29 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 r6-20020a056830134600b0061c862abbdeso908900otq.6
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 08:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qFr6h49n4HTvrei/G3kkjtjB9MT0qj+/xJKpu1oZjz8=;
 b=LyqgGvV4gg9jsbq2fKVRfXP1t1Vm/7koJKEzpn4epoaInkElYTUMnHHx9rt4zE9gjQ
 75ZEdhZb+f2SYjxvichZhUNSIDZD1zBkrq13N75Todzz/siU8vBU7uGIC9oYTErVWGgM
 9LUFGqx3fVPg9FVHjmqB4p6+okdVnJh0W4ImtCgoZ3TZPf0R7XPlJ9af6I7axVvnlu2N
 xjpQSfvHOUYoBonyKfZuwJ4w0MQy9uW6Inrnf8yKwJCMpHGxQ1JSK/aRyVE4ew29RfbI
 oEXIANHyx88p0T0RnsULZtgp2xQBcxTtoP5KKTK6sh+B5W3oLEJv6H/Fy5KVfU0itHbu
 Xlyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qFr6h49n4HTvrei/G3kkjtjB9MT0qj+/xJKpu1oZjz8=;
 b=3Hc2ljnt5ANC+sMjEN2G9S/X0EXY7TZgIcIndpSpe2c3oKOe2UCIQhSNMgwqprQ6Fv
 CLF0YEpXwwTtUPUH8fxwGobBlXCJbRGLH9XnAS7OAz/rxiwxCorSUeHMyW/0Bwqc7oA7
 xReeQ5k3vYvNN4UE6t5HkOlTDqZaZHd3a9GsC4HOfodMgkCjblXsXTySNYAkternMAKs
 7j4SVYd5aOhPFbUnUxjqQkbDbdrHv81LZMEw6khr4f1ni7GooJgx6tccYxSKw91JfuVw
 c6R/ponuRNkkVAJrjso2R+uQpkzlxvTNXK6rv893AmCMWBfe7tUL/ikmBpeCP4mwj3HL
 42zw==
X-Gm-Message-State: AJIora/w/dPsKmsknbCVryxLSyYFqpb06gW+KMkBNLkQMNyeOlDd7VKR
 FdVSKtx7rxooAPOYPRltA13Czg==
X-Google-Smtp-Source: AGRyM1sCKxX1PDnNVvPLJ8zcGn+McqTtyI9ivxQJ7qsDktsjSpf1V0ZcuXsMN4J2JpTiCBH4Khtc5w==
X-Received: by 2002:a9d:2663:0:b0:61c:7ef9:c117 with SMTP id
 a90-20020a9d2663000000b0061c7ef9c117mr2789518otb.170.1657899447103; 
 Fri, 15 Jul 2022 08:37:27 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.176.74])
 by smtp.gmail.com with ESMTPSA id
 1-20020a4a0301000000b004357c1d1efasm783098ooi.21.2022.07.15.08.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jul 2022 08:37:26 -0700 (PDT)
Message-ID: <d5dd076a-1a93-61cd-2ae8-5204b516d4c7@linaro.org>
Date: Fri, 15 Jul 2022 21:07:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/arm: Don't set syndrome ISS for loads and stores
 with writeback
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220715123323.1550983-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220715123323.1550983-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 7/15/22 18:03, Peter Maydell wrote:
> The architecture requires that for faults on loads and stores which
> do writeback, the syndrome information does not have the ISS
> instruction syndrome information (i.e. ISV is 0).  We got this wrong
> for the load and store instructions covered by disas_ldst_reg_imm9().
> Calculate iss_valid correctly so that if the insn is a writeback one
> it is false.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1057
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Tested with RTH's test case attached to the bug report.
> ---
>   target/arm/translate-a64.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index b7b64f73584..163df8c6157 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -3138,7 +3138,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
>       bool is_store = false;
>       bool is_extended = false;
>       bool is_unpriv = (idx == 2);
> -    bool iss_valid = !is_vector;
> +    bool iss_valid;
>       bool post_index;
>       bool writeback;
>       int memidx;
> @@ -3191,6 +3191,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
>           g_assert_not_reached();
>       }
>   
> +    iss_valid = !is_vector && !writeback;
> +
>       if (rn == 31) {
>           gen_check_sp_alignment(s);
>       }


