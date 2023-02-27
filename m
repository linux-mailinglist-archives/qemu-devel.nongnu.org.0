Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E66A49DA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 19:33:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWiIR-0007J0-J4; Mon, 27 Feb 2023 13:32:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWiIP-0007Ii-8k
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 13:32:21 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWiIN-0004C0-MV
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 13:32:21 -0500
Received: by mail-pl1-x62d.google.com with SMTP id p6so6860097plf.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 10:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G3kvzrE4d5Q2+Tua9D6UKBpnX63zpoL63JuO3ShQfhU=;
 b=YZ/wUj0vlcU3OnFaUZMZpw4+f51Pygbr8vJkWaUG/yC8AbJDnuW4Q+TOUmq8Bsnfb4
 VWCIjrvAaQCy5jOewd1L20pZbq8Du/T1Pm3iU14lh7YHFSwrKCeri2uvK0/e4IdXx8Br
 70fTPwUunjDJfKDIi5DyW9GayeZxZyfFKySwGfEbeMGcRE+cOs8tkMwzTAYuexPXsyzw
 Xb+Rui0egeYMZtv4aJQZbI7jnGrbl57t/VIiP6gkRRHfWVz6EfIyX6crEt3sdt+mz4ko
 wMH3DLdskpwfUja0dChxOoUqq0K3nD4HpiZfY9GhMFvLI27jLi6ifoGDzEtylCt/L4xH
 Aw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G3kvzrE4d5Q2+Tua9D6UKBpnX63zpoL63JuO3ShQfhU=;
 b=UeJJHCnPsmv5kbVpJk4Vyajt3qzKR6OPwJcUsPAvx91zQrhOH8x9WLTT3O2UJOy0OA
 u+JkSbbJOn8g4DBLvvbO2cttjYzAY/Cl37FyrdoO11fbfnNoMUIgGPhRjoAg1yNViS24
 LizE64+4sJJetEJ9OPxVLkqiewndPOuJyxFW8iwlMvCoSt20QjnVob4CGgDwZsEhVyAs
 qaGNLnliWBHkPr8D3sFL7hNb6CDFp8AC3ba8SK6hGD2Xuu1/LDLPKQ61ksDL0RE+G3F/
 xu9QDuOy3RBlGLzUfTHhsSF0pA+ioJeuTvc9KdTEbgZxrwaJ+EbSOd5RxG63g24+g2Tm
 lvHQ==
X-Gm-Message-State: AO0yUKVvQbc+ytrJokj7qtn4dauNDSGGL9mf2jfkaR6FU/dKlvkYpavp
 /z2vghPb1wCqT3Q0gLYIpHoxcA==
X-Google-Smtp-Source: AK7set+pdBszamc9RnaVg8zKXnLKHRH584X6vBIKPXf5htnmZwZIV5VEE5dGeic+p7leAHOAfdgwjA==
X-Received: by 2002:a17:902:e80f:b0:19c:cb64:dacc with SMTP id
 u15-20020a170902e80f00b0019ccb64daccmr15951279plg.61.1677522737694; 
 Mon, 27 Feb 2023 10:32:17 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 iz10-20020a170902ef8a00b0019c901b35ecsm4949454plb.106.2023.02.27.10.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 10:32:17 -0800 (PST)
Message-ID: <d31b5dce-15c1-b681-6e6b-e4a6ae645a9a@linaro.org>
Date: Mon, 27 Feb 2023 08:32:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-11-gaosong@loongson.cn>
 <268ef762-fce5-ca47-d5f7-bd60955a3a0f@linaro.org>
 <f5c0796d-62c9-691a-c2ba-e4dd9e654831@loongson.cn>
 <e75fd2b7-9955-ad2b-62d2-30d7b85d7e7b@linaro.org>
 <f484b933-8f9f-6f0b-0d81-7202bed31d83@loongson.cn>
 <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
 <c795a157-21a8-a8d7-bbc1-ed33e7f32747@loongson.cn>
 <c5913a52-e5de-4fb5-688c-6d3fb3215353@linaro.org>
 <d052497f-fc2c-17ab-d455-f0a1727b422d@loongson.cn>
 <5ac3c25f-8d4b-6aa3-5bc2-2b3abc22dce8@linaro.org>
 <32723bb0-17fe-cbd5-73f1-99cbcfbf73aa@loongson.cn>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <32723bb0-17fe-cbd5-73f1-99cbcfbf73aa@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/27/23 02:54, gaosong wrote:
> 
> 在 2023/2/27 下午5:20, Richard Henderson 写道:
>> On 2/26/23 23:14, gaosong wrote:
>>> like this:
>>> the vece is MO_32.
>>> static void gen_vaddwev_s(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
>>> {
>>>      TCGv_vec t1 = tcg_temp_new_vec_matching(a);
>>>      TCGv_vec t2 = tcg_temp_new_vec_matching(b);
>>>      int halfbits = 4 << vece;
>>>      tcg_gen_shli_vec(vece, t1, a, halfbits);
>>>      tcg_gen_shri_vec(vece, t1, t1, halfbits);
>>>
>>>      tcg_gen_shli_vec(vece, t2, b,  halfbits);
>>>      tcg_gen_shri_vec(vece, t2, t2, halfbits);
>>>
>>>      tcg_gen_add_vec(vece, t, t1, t2);
>>>
>>>      tcg_temp_free_vec(t1);
>>>      tcg_temp_free_vec(t2);
>>> }
>>> ...
>>>         op[MO_16];
>>>          {
>>>              .fniv = gen_vaddwev_s,
>>>              .fno = gen_helper_vaddwev_w_h,
>>>              .opt_opc = vecop_list,
>>>              .vece = MO_32
>>>          },
>>> ...
>>> TRANS(vaddwev_w_h, gvec_vvv, MO_16, gvec_vaddwev_s)
>>>
>>> input :     0x ffff fffe ffff fffe  ffff fffe ffff fffe  + 0
>>> output :    0x 0000 fffe 0000 fffe  0000 fffe 0000 fffe
>>> correct is  0xffffffffefffffffefffffffe       ffff fffe.
>>
>> sari above, not shri, for sign-extension.
>>
>>
> Got it.
> 
> and how to  sign-extend  the odd  element  of vector?

For the odd elements, you omit the shli, because the odd element is already at the most 
significant end of the wider element.


r~


