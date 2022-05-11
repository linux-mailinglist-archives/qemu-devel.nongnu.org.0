Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C685522811
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 02:02:57 +0200 (CEST)
Received: from localhost ([::1]:41954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noZoe-0002bZ-Er
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 20:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noZma-0000LF-FE
 for qemu-devel@nongnu.org; Tue, 10 May 2022 20:00:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noZmY-0000HD-SN
 for qemu-devel@nongnu.org; Tue, 10 May 2022 20:00:48 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 c1-20020a17090a558100b001dca2694f23so536369pji.3
 for <qemu-devel@nongnu.org>; Tue, 10 May 2022 17:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dzfZyjKKH+AHUo5UgJtBPyKpmIKN05deCibGfHlqvws=;
 b=ivPkE9BS21qvLbWIdagkyKZv/T8I+XrbHbjFJjzKAoAZzeDle11u+XLknOp2baRBwd
 /5q5r166Vy1q8ERyqkS5bXWwmH77cMZK5dJVqBz3qL2H4g2FLM+qNGi7ZeytnKo2wush
 FBuacAke85kPevSzZmBauwgR6I9sVmcJmCwyoEVm/3VE5XvOrgrUgbvBtEH6W4XGkLht
 +dnexDryBAOK5KwUe8yS07KxE1VY1CIgF7ASyFzeZKTFHRcD188YSFa3QduYRyN1KvNJ
 Ruz49DoU1B0Kt3s8YWB6pgyHuLx1BGbC04jfsYrPlig2zQjpbyVhxi/MBNeZlW29d7Mb
 5scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dzfZyjKKH+AHUo5UgJtBPyKpmIKN05deCibGfHlqvws=;
 b=daZoSMknvu9WWP+fVEPdkv78lF+lw3zqfOz0yR6fGnrmor6IvEerVN5b62gKIwSGJP
 q5F7SvfALvwg24+1hC+Y1/8KhSfAMIbRHSTObEfECjTNejR1OVLo+cEJ0/lFQrlMzdXv
 r8/S4fxUp9F8idckh8VO1GbjRRapQGNMOQ+uQrZQUnmE06h0gE78pcIL0NzUPQmFDooP
 cU+f/FPFiGaNeMk779x4cVt/ZxrE3mHSoFCeRrqxRug94c+RBYAyP2UenO39Yed8OQxv
 WQQqylAXrTtImsBzWyC8EkETF/TGbrLnhNgrRHpZ7DgKyoujlGITs5/DfHX+HXS30wDg
 65Jg==
X-Gm-Message-State: AOAM531Kw61Q7uVEMkinGmsYWEdFVkk45UbWyRwnJSnPphSZMp860xfe
 +ZSkk5SnI2p35osdiTrz96FzPA==
X-Google-Smtp-Source: ABdhPJx17fuudINuPsrg0c1POMD0gDq80UbFZ/8Mm8B3C9xfvjNEMR4C3U/bNOVF3AfcaZzqqC/iig==
X-Received: by 2002:a17:90b:3e8b:b0:1dc:e2ba:b697 with SMTP id
 rj11-20020a17090b3e8b00b001dce2bab697mr2367287pjb.176.1652227245645; 
 Tue, 10 May 2022 17:00:45 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806a:923e:f0df:3e3a:c73f:64e4?
 ([2607:fb90:806a:923e:f0df:3e3a:c73f:64e4])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a17090331d400b0015e8d4eb21esm204962ple.104.2022.05.10.17.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 17:00:45 -0700 (PDT)
Message-ID: <f7fb9002-7538-40a2-4715-dfb1c486abda@linaro.org>
Date: Tue, 10 May 2022 17:00:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 2/7] target/ppc: Implemented xvi*ger* instructions
Content-Language: en-US
To: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-3-lucas.araujo@eldorado.org.br>
 <c58d0bc1-8f69-e69d-318b-a7bcacf800ff@linaro.org>
 <0300306b-4176-4e8f-66d3-25dcc6e8c461@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0300306b-4176-4e8f-66d3-25dcc6e8c461@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/22 10:28, Lucas Mateus Martins Araujo e Castro wrote:
> 
> On 08/05/2022 00:41, Richard Henderson wrote:
>> On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
>>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>>> index 10c6d7ae43..348a898950 100644
>>> --- a/target/ppc/cpu.h
>>> +++ b/target/ppc/cpu.h
>>> @@ -238,6 +238,7 @@ typedef union _ppc_vsr_t {
>>>
>>>   typedef ppc_vsr_t ppc_avr_t;
>>>   typedef ppc_vsr_t ppc_fprp_t;
>>> +typedef ppc_vsr_t ppc_acc_t;
>>>
>>>   #if !defined(CONFIG_USER_ONLY)
>>>   /* Software TLB cache */
>>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>>> index aa6773c4a5..61217e0a10 100644
>>> --- a/target/ppc/helper.h
>>> +++ b/target/ppc/helper.h
>>> @@ -537,6 +537,15 @@ DEF_HELPER_5(XXBLENDVB, void, vsr, vsr, vsr, vsr, i32)
>>>   DEF_HELPER_5(XXBLENDVH, void, vsr, vsr, vsr, vsr, i32)
>>>   DEF_HELPER_5(XXBLENDVW, void, vsr, vsr, vsr, vsr, i32)
>>>   DEF_HELPER_5(XXBLENDVD, void, vsr, vsr, vsr, vsr, i32)
>>> +DEF_HELPER_5(XVI4GER8, void, env, vsr, vsr, vsr, i32)
>>> +DEF_HELPER_5(XVI4GER8PP, void, env, vsr, vsr, vsr, i32)
>>> +DEF_HELPER_5(XVI8GER4, void, env, vsr, vsr, vsr, i32)
>>> +DEF_HELPER_5(XVI8GER4PP, void, env, vsr, vsr, vsr, i32)
>>> +DEF_HELPER_5(XVI8GER4SPP, void, env, vsr, vsr, vsr, i32)
>>> +DEF_HELPER_5(XVI16GER2, void, env, vsr, vsr, vsr, i32)
>>> +DEF_HELPER_5(XVI16GER2S, void, env, vsr, vsr, vsr, i32)
>>> +DEF_HELPER_5(XVI16GER2PP, void, env, vsr, vsr, vsr, i32)
>>> +DEF_HELPER_5(XVI16GER2SPP, void, env, vsr, vsr, vsr, i32)
>>
>> Did you intend to use "acc" here, for documentation purposes?
>> It's just a couple of #defines above.
> 
> Yes, I'll change that in the next version, do you want me to keep the Reviewed-by or do I 
> sent without them so you can review the changes?

Keep the r-b.

> It'll be just adding
> 
>      #define dh_alias_acc ptr
>      #define dh_ctype_acc ppc_acc_t *
>      #define dh_typecode_acc dh_typecode_ptr
> 
> and changing DEF_HELPER_5 to have acc instead of the third vsr

Yep.


r~

