Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAFB4EAFC8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:04:27 +0200 (CEST)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDOT-0003xO-Te
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:04:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZDJz-0006du-0n
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:48 -0400
Received: from [2607:f8b0:4864:20::22e] (port=36541
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZDJx-0003EF-Gt
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:46 -0400
Received: by mail-oi1-x22e.google.com with SMTP id z8so19287603oix.3
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/u1YbhytL1Z+h05H+2dXpIQWkpWGoEktTYiMH5Y6Gy8=;
 b=GlxEYXeHkGr9L14dozdGPY1R1gc+OZ2QGxe8oa0yFecnZ6fvcN1WUie/WKKOMmjwPj
 5pkQTgJyQOvOZjIfeQmGpOsgm3pJszlgsaLt/komGqFGsrFWaraGYifnV1RaSOdCtwvY
 o4HyN9P2JN+PRfCQas9AsmUqyIreL686SchD6AgtZcax5gFaxfJMUGSuLl7R5U3DTTUs
 olYh3PBJh9mcmnspLWMHdytmmrHmLO84sSGRrudllUvVGKdZyOxOnC13S0qMK30PWNGS
 D3zP8bObOzjaqAv4GXkjYU0s8iOOtxCRep45TJaSwtBVlj9YMseI9TUQ1YvsXUPWbgDe
 fvmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/u1YbhytL1Z+h05H+2dXpIQWkpWGoEktTYiMH5Y6Gy8=;
 b=r8DtlI4BPYI/YZfqduzoX3V/WfDj1StIIExmNprTD/OvIgkPTajOHB4j4EriMptucC
 GkR8lq44zWe9cvnNAJOlQapGsw2QxF+1VoOswTLj9j2HWevzCzUIjbrFGRMGZthRpqJn
 pVsJt1qfyOTAYnIUL/aP/eiQJ3ivKbC0hZE4E8fyyWPVVbQXWHoKvwPtB2rpkugcr4hG
 fhZWajwelhMpnkBBqz6xkxCgZtJc0LpnRbRRcXlTb5ncFl4CRGCUaGQWUgFCXtmfsZk1
 cDwbRvN9n8QRXWxMXNg/bnhm1qHjIzuY321qYnpPxVdDF1T7gApYxpAyYyKFcBEI2VAn
 nzwA==
X-Gm-Message-State: AOAM530q6/S+BM33bboOcQw1nVfDA/8bt0Q2mDP+CJskFiggz6Z3w0Cx
 6SE6R5z0/xCLdjC0exuuYxgTnA==
X-Google-Smtp-Source: ABdhPJyu6aigYuDgx3hdXxXSlw3LyDgwY46nLxIUDTDShfWi87ucVFhSYuuk98+9VgdOfSAixF77VQ==
X-Received: by 2002:a54:4589:0:b0:2ec:d236:90d with SMTP id
 z9-20020a544589000000b002ecd236090dmr17224oib.55.1648565983615; 
 Tue, 29 Mar 2022 07:59:43 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 s42-20020a4a96ad000000b00324c54e9cf5sm7702994ooi.4.2022.03.29.07.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 07:59:43 -0700 (PDT)
Message-ID: <fab87e98-8708-53c9-96b1-0cf067f5dce4@linaro.org>
Date: Tue, 29 Mar 2022 08:59:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] target/arm: Check VSTCR.SW when assigning the stage 2
 output PA space
Content-Language: en-US
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-2-idan.horowitz@gmail.com>
 <5551410.DvuYhMxLoT@basile.remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <5551410.DvuYhMxLoT@basile.remlab.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/27/22 08:24, Rémi Denis-Courmont wrote:
> Le sunnuntaina 27. maaliskuuta 2022, 12.34.26 EEST Idan Horowitz a écrit :
>> As per the AArch64.SS2OutputPASpace() psuedo-code in the ARMv8 ARM when the
>> PA space of the IPA is non secure, the output PA space is secure if and only
>> if all of the bits VTCR.<NSW, NSA>, VSTCR.<SW, SA> are not set.
>>
>> Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
>> ---
>>   target/arm/helper.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 812ca591f4..d0265b760f 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -12697,7 +12697,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong
>> address, } else {
>>                       attrs->secure =
>>                           !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA |
>> VTCR_NSW)) -                        || (env->cp15.vstcr_el2.raw_tcr &
>> VSTCR_SA)); +                        || (env->cp15.vstcr_el2.raw_tcr &
>> (VSTCR_SA | VSTCR_SW))); }
> 
> The VTCR_EL2 specification says that the NSA bit "behaves as 1 for all purposes
> other than reading back the value of the bit when one of the following is true
> (...)
> * The value of VTCR_EL2.NSW is 1.
> * The value of VSTCR_EL2.SA is 1."
> 
> Sorry but I don't see any reason to check the SW bit here.

Because the description of SA says that it behaves as 1 if SW is 1.


r~

