Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C687F50B62F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:31:44 +0200 (CEST)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrVn-0002AR-JO
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:31:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhqha-00029n-DN
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:39:50 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:36564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhqhX-00083p-L2
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:39:50 -0400
Received: by mail-pl1-x630.google.com with SMTP id q3so9977446plg.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HAJAbjW2Z3CZXnufMneEqx2AJPNyhlySM0wddfEJ3BU=;
 b=eJX+2IsPrZRq2VEekGdVX7aASOF2Onbje2Scrb+m7UEWm4hpMAJo/3DqtflXuRn6dV
 w7p0kc2zWNZ5Z2kfnTGIbeXyduzHF+d7mx9vew8dlFfVKcc/nK3Dp+14uGS+Au5Oc+RV
 brtFW3xPvW2AWV29cY0HrzWDSEDCdB2mP9iKygE4wlQA0QXBtqotC8HRrWTNt75ZftX2
 m3UzodAtUNennka492hbOcKn6GKQeg2UkTWh/nc4byq0uXwWxyTJg+0XocUPlWNDdRwp
 4cCvtBDTz5FGuZhyGzz6UZa5L4urG2SVIJHf5TLzxNJe1oWjcgSljtoPR3eEWydiqn3x
 a9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HAJAbjW2Z3CZXnufMneEqx2AJPNyhlySM0wddfEJ3BU=;
 b=wan1OSvl68jfa63kG1QeMdZHThSVSl4umtH/p90zAi6Ma8f5bcKnxpizYtRDk4hQ0O
 LRGc2rwEyOLYCqRrVPOVrL+eklVAEWIqtVAMF+aRKZVHpE3hEagN6qsOkaZvtWsJluHF
 nJzBNG5Fkrx0pUV6k7MgJaaAVqHnlAD8zCCOXghMKGFRDOdyY9r0fMWySXQPrqh1sRAx
 NmctXjdie2Hiwmo2v/v8AtiNndAEm+K8WjvrehBP4sWeCOtaWX5wQs/uL8mP30m30kmf
 dlE8wZs1TcKyOZtu8rbihsjH7TnY2mXAF2ArosOSpX+GubpAnFhDrV8idMCZ/mcqtVJ7
 1Dzg==
X-Gm-Message-State: AOAM5326HzpYlKEHqnXTET1DYbW5WVRQ7cd1mPiA28DSjy87qNLI9ZpF
 mt5ZF21dsnb98rQdR3UEPgbI8jL13gPc5g==
X-Google-Smtp-Source: ABdhPJyJirHLDM55oEMAgOdskhxEqhmbseK+6IJpB9Z/qCEKtcH0g9EB6NbGu180gDiJmmrMw9GK5g==
X-Received: by 2002:a17:90a:aa98:b0:1b8:5adb:e35f with SMTP id
 l24-20020a17090aaa9800b001b85adbe35fmr4665113pjq.192.1650623985128; 
 Fri, 22 Apr 2022 03:39:45 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d0:b0f2:1f9b:37fb:18e0:1dd4?
 ([2607:fb90:27d0:b0f2:1f9b:37fb:18e0:1dd4])
 by smtp.gmail.com with ESMTPSA id
 s50-20020a056a001c7200b0050acf7cadc5sm2178631pfw.112.2022.04.22.03.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 03:39:44 -0700 (PDT)
Message-ID: <20b109b9-81fe-e8df-bada-c3a0ce920c45@linaro.org>
Date: Fri, 22 Apr 2022 03:39:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 26/60] target/arm: Replace sentinels with ARRAY_SIZE in
 cpregs.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-27-richard.henderson@linaro.org>
 <CAFEAcA98sjUhUccvEAjAWeK+Z7-HER9LDz6LMSFMNuVnBSPW=Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA98sjUhUccvEAjAWeK+Z7-HER9LDz6LMSFMNuVnBSPW=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 02:37, Peter Maydell wrote:
> On Sun, 17 Apr 2022 at 19:08, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Remove a possible source of error by removing REGINFO_SENTINEL
>> and using ARRAY_SIZE (convinently hidden inside a macro) to
>> find the end of the set of regs being registered or modified.
>>
>> The space saved by not having the extra array element reduces
>> the executable's .data.rel.ro section by about 9k.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> 
> 
> 
>> +#define define_arm_cp_regs_with_opaque(CPU, REGS, OPAQUE)               \
>> +    do {                                                                \
>> +        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) == 0);                       \
>> +        if (ARRAY_SIZE(REGS) == 1) {                                    \
>> +            define_one_arm_cp_reg_with_opaque(CPU, REGS, OPAQUE);       \
>> +        } else {                                                        \
>> +            define_arm_cp_regs_with_opaque_len(CPU, REGS, OPAQUE,       \
>> +                                               ARRAY_SIZE(REGS));       \
>> +        }                                                               \
>> +    } while (0)
> 
> Do we actually need to special case "array has one element" here,
> or is this just efficiency?
> 
> Anyway
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Just efficiency.  There seem to be a lot of these.


r~

