Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B4A5F7BE1
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:57:26 +0200 (CEST)
Received: from localhost ([::1]:45238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqf7-0001jq-CZ
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogqbX-0005V5-S2
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:53:44 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogqbW-0004CN-3v
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 12:53:43 -0400
Received: by mail-pl1-x632.google.com with SMTP id x6so5032872pll.11
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z5xqzmugt5DkjtB3vMsGkPUaxnSoqGVu+48O9THx8eo=;
 b=tGONTX1U4PXO2WlYPy6ZccMH/eSHgXXfoWbEvjFs1WR3srE4opr+MxV/uSBgesJg8w
 OBM7Ucow03195DWGFR8UmqDeKpFhDwOv5DPLiPaPjwXkkSSLqTqI4Qi9AJH27hmNhkXe
 XcPYu3mpHM3orK8ac+FrmVW/4g5rN/j+L84btT+LFxA7kdnNdyqL7kuLXb+yYUIsxSkB
 5952MKHOPn/lLsR+rZpAto4BrE6U/4V0Ngh4ZyXeeoQCtHdPJzDke76opn16BZKykLZs
 UPoADHYQ6c2ADQVaLuHCwjVUlHqWAlVbUdsvGZOys5cIoSAewfgQl0Py9W2pm0awsxfW
 eH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z5xqzmugt5DkjtB3vMsGkPUaxnSoqGVu+48O9THx8eo=;
 b=5RBD/yuxf92eA/WK60g1/Yl/ZtSShkwGYWzU47zV6MJpvP0WLyrHp2Q7QVHeh1x7ji
 WTwtgny1HUtKBnP+K42um2OzcncYTG3RVepT4wECL86ovVqW6UoMgaBFg58xDMngErNK
 OmyWA+gyqR+GbHtMAofSeJJQ9dZvZ3fO1dpNsRTZDnNRjx8YbhPbaKavGLMGSoXupQn+
 ynl+KtMeEjOevY5TBychDf6YiR9Eq3V9yjK1I06u7K5ge6aoQHax2ftphme5nAp7Tyxa
 qNqhbzK14+ZkzHBCRKvdf1/I/uDjiz5tontn7x7WP4DrSfNaaT8dy8vjiEyETiPtCBCH
 3r4w==
X-Gm-Message-State: ACrzQf2bnTJAKYjXff7MSK19qocKPOGcloYRgqeGFFuou377HWdofIJJ
 Zwb2NI88jV2TqGcgVgAed9TsQA==
X-Google-Smtp-Source: AMsMyM4a02O3zEuM3l+VIuA+5mi4JKxzCpBQ8EQn0ZtHgOcmSsjKlYczXC22NXGEmT3B7NDrx0p+EQ==
X-Received: by 2002:a17:903:124b:b0:179:da2f:2457 with SMTP id
 u11-20020a170903124b00b00179da2f2457mr5551381plh.156.1665161620566; 
 Fri, 07 Oct 2022 09:53:40 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a17090332cb00b00174c235e1fdsm1775577plr.199.2022.10.07.09.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 09:53:39 -0700 (PDT)
Message-ID: <ed0332cf-5bf0-34ef-3233-de6840439e02@linaro.org>
Date: Fri, 7 Oct 2022 09:53:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: Make the final stage1+2 write to secure be
 unconditional
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221007152159.1414065-1-richard.henderson@linaro.org>
 <CAFEAcA93Urww5F+_gJonUUaLeS-7W8BhYqRgcJT1hcVY3LaUdA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA93Urww5F+_gJonUUaLeS-7W8BhYqRgcJT1hcVY3LaUdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/22 09:20, Peter Maydell wrote:
>> -            /* Check if IPA translates to secure or non-secure PA space. */
>> -            if (is_secure) {
>> -                if (ipa_secure) {
>> -                    result->attrs.secure =
>> -                        !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
>> -                } else {
>> -                    result->attrs.secure =
>> -                        !((env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))
>> -                        || (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW)));
>> -                }
>> -            }
> 
> If:
>   is_secure == true
>   ipa_secure == false
>   (env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW) is non-zero
>   (env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW) is zero
> then the old code sets attrs.secure to true...

No, I think the misalignment of the two lines wrt the !() may have been confusing:

   if (true) {
     if (false) {
     } else {
       secure = !((0) || (non-zero))
              = !(1)
              = 0
     }
   }


r~

> 
>> +            /*
>> +             * Check if IPA translates to secure or non-secure PA space.
>> +             * Note that VSTCR overrides VTCR and {N}SW overrides {N}SA.
>> +             */
>> +            result->attrs.secure =
>> +                (is_secure
>> +                 && !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW))
>> +                 && (ipa_secure
>> +                     || !(env->cp15.vtcr_el2 & (VTCR_NSA | VTCR_NSW))));
> 
> ...but the new code will set it to false, I think ?
> 
> thanks
> -- PMM


