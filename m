Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261935EE5D7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 21:41:11 +0200 (CEST)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odcvd-0001x4-Mi
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 15:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odct8-0008Um-Br
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:38:34 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:33400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odct6-000766-P7
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 15:38:34 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so4127417pjb.0
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4KmVhAv1vwqLP/mFMqRIB4OKdeSosWFaXlj8w5aaUiI=;
 b=lr4t+PpEPfJyJPJcSqiH/YlWBUWthO53H9AElKqcHFGGBJ1PB6W8leK+VE6+kBTFQF
 qwKqhf0l3eqfEaO0BCUwqBGdziHhDX9y/Z3u/C0BmrRuYlU8rdPtc8PW1UYw/Me8XL6o
 tQlam0c+Bn10N5wEGS5tJidutvOmoMcRv30wAPLJUg8Ymmfx1ItbzGMibHOcBDia/LUU
 BsPkq92vciL4LkPvAf6GOPZcAnJmNttm0sInVdNZC8teWr/wsVMw3cK2nd9vVEBlCNgX
 ACpXcHglSujfw5nd2X8bDC4imgyW9pNoQmk405CkqDSbWuRagcyAJ7YcSokVFQeJ7XFX
 AmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4KmVhAv1vwqLP/mFMqRIB4OKdeSosWFaXlj8w5aaUiI=;
 b=fZgRtwnlQES63CtxxfOSJPs0GuG4CUAKBLqmh38SSuVl3Txi5nCYn0EbMUPPCqmrLH
 2FKb+ZiN8B1AcYV33FTWHdqalw9OdqBoKO6WpMwI7oBE9FG8FdsmlQygVp0RJprJQmxN
 0oMEnKM0eFqkdNkMEiH16LrWI5qDNlBI0/Y1GU/d77Y3PGzRlRmK0HNogxLB8fEBtQTu
 4hn8I/xP4x3cRO/uF7xjFLb3Bdgjm5EIZZBzeu8D6pSbk2q1D8HTWKKCoDxLKl4mBidA
 3Bl+hrSfdEIJ3XQU4+jzAt+T6SlSMFXImmA6H4fFjrMakLoOKRg3V8a0FFkP6ouN4C5B
 6XpQ==
X-Gm-Message-State: ACrzQf0AyT+W7GlR4FIBSTNEa5RnkDkMUBsk07lZQwX3trus7tfFevsH
 1u1pjvQ99F7Pa55ZRr4L9pbqSw==
X-Google-Smtp-Source: AMsMyM545dMtBVY7v2WfozbvafjPmQPB+PGRpcqYRmTBn/9RhRK6LC/EwB+epv3IQ7O7CDGIxnBjPA==
X-Received: by 2002:a17:902:ecc6:b0:178:3c7c:18ad with SMTP id
 a6-20020a170902ecc600b001783c7c18admr1316616plh.112.1664393911012; 
 Wed, 28 Sep 2022 12:38:31 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6217d5000000b005289a50e4c2sm4354871pfx.23.2022.09.28.12.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 12:38:30 -0700 (PDT)
Message-ID: <4b6d984d-e63b-6904-c232-f1e562a3f331@linaro.org>
Date: Wed, 28 Sep 2022 12:38:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 29/66] target/arm: Introduce arm_hcr_el2_eff_secstate
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-30-richard.henderson@linaro.org>
 <CAFEAcA_ZTxY7vW+9kG3LYjPJKOsk+hzeysg1n6E-PWy-zNtg8w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_ZTxY7vW+9kG3LYjPJKOsk+hzeysg1n6E-PWy-zNtg8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/20/22 08:52, Peter Maydell wrote:
> On Mon, 22 Aug 2022 at 17:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> For page walking, we may require HCR for a security state
>> that is not "current".
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.h    | 20 +++++++++++++-------
>>   target/arm/helper.c | 11 ++++++++---
>>   2 files changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index cea2121f67..a08e546de4 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -2401,15 +2401,15 @@ static inline bool arm_is_secure(CPUARMState *env)
>>    * Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
>>    * This corresponds to the pseudocode EL2Enabled()
>>    */
>> +static inline bool arm_is_el2_enabled_secstate(CPUARMState *env, bool secure)
>> +{
>> +    return (arm_feature(env, ARM_FEATURE_EL2)
>> +            && (!secure || (env->cp15.scr_el3 & SCR_EEL2)));
> 
> This doesn't need the outermost set of ().

Oh, that's an emacs alignment thing.

r~

> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM


