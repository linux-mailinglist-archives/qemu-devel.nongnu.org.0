Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42545458E73
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:33:34 +0100 (CET)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8Vo-0000ls-Pk
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:33:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp8UO-000052-6S
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:32:04 -0500
Received: from [2a00:1450:4864:20::332] (port=45687
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp8UM-0007UG-3O
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:32:03 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so13442480wme.4
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 04:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EeetnQQ1rJFxR++gyQ1ZyiyJEMKc604wkYZ5oNSYY7k=;
 b=uw3XYgsrxD3Z9Gv4QovqpS/p1crGciHTt5N9AdEPxNfJH53PX4VHBanOiP/ujP48E3
 tmM+MmEuFkwNyi9l8VjldzNP2d5rfNlANEl0WSddxtRiKsoc+CegK0ePJkSgt6Rv712E
 BzMVuEBb65i/YMejt2gYhjM6crhGYimoM8GY31LgaJrGVsP3e5xZla2prNebKF38zcd5
 plr/vDdZ3CvXtNhyzKG5q2CApjQN+l+pmJDH37+FTp1kRmXVNrgIRRKTIVhxwxb4deJc
 5snmhBnppY0lKVbuZXBfCct/mRf2qwuOqqIB6ElCQI+HQph7alsBJqa2Tsx2s4R6cysc
 2E+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EeetnQQ1rJFxR++gyQ1ZyiyJEMKc604wkYZ5oNSYY7k=;
 b=b6FRyq/xIss0lVkNG0eP3nhAGC6jIttTzHV4AHRuVr7SqcQBgEULUpfZXtiTRSC53Y
 MNybic2tKoiu04bejt1GeLpWq3jrUxgVqZl2kSOFQ03YW7OpKp51VeAxBqmHVGFQabG+
 EQESqQ2bdBRRMqEtV8nbRQy4GKuyZb/TDJ4KL9WNeWvfj3YWCItHeSnYYFskQCvj7fNW
 veqG3kBI+0ZVuZiXOAkYvPwkE53kLg962VMmr4g/+vMf7e6xLnNIY2Suy3+dxKpX0Nn9
 MhqyJKgxpyHXI0NjL+yiLgJLRnnVImoZcGzF/AjPLITOQ76Ca5nXbAbK1NApr7FX3iC7
 DoqA==
X-Gm-Message-State: AOAM532S6cHh775V9vqz+293hZFa712fnWRk+hmEhvIAYsk3A2EGgnWK
 wCCqmWep6qL+q5VJZgUa5wgwFA==
X-Google-Smtp-Source: ABdhPJxS2cWh81YoXYIJ/gEWIUX9Hz2WkisbYyCKpJBqkHj4akeVCUf5Ni7YaRgGKF/4qswokRNICg==
X-Received: by 2002:a1c:80c5:: with SMTP id b188mr29864463wmd.57.1637584320162; 
 Mon, 22 Nov 2021 04:32:00 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id b10sm8968650wrt.36.2021.11.22.04.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:31:59 -0800 (PST)
Subject: Re: [PATCH v11 19/26] linux-user: Add LoongArch signal support
To: gaosong <gaosong@loongson.cn>, zltjiangshi@gmail.com
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-20-git-send-email-gaosong@loongson.cn>
 <9195824d-31d2-f2e8-610b-f8f86d687707@linaro.org>
 <d5fed5e0-3708-4891-03e6-868986dea360@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cca87af-eb4c-2839-577c-2a0c149fc4fe@linaro.org>
Date: Mon, 22 Nov 2021 13:31:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d5fed5e0-3708-4891-03e6-868986dea360@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, chenhuacai@loongson.cn,
 qemu-devel@nongnu.org, maobibo@loongson.cn, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/22/21 12:41 PM, gaosong wrote:
> Hi Richard,
> 
> On 2021/11/20 下午6:33, Richard Henderson wrote:
>>
>> Drop all of the the inline markers.
>>
>>> +{
>>> +    int i;
>>> +
>>> +    __put_user(env->pc, &sc->sc_pc);
>>> +
>>> +    __put_user(0, &sc->sc_gpr[0]);
>>> +    for (i = 1; i < 32; ++i) {
>>> +        __put_user(env->gpr[i], &sc->sc_gpr[i]);
>>> +    }
>>> +
>>> +    for (i = 0; i < 32; ++i) {
>>> +        __put_user(env->fpr[i], &sc->sc_fpr[i]);
>>> +    }
>>> +}
>>
>> Missing fcsr and fcc.
>>
>> I'll note that the kernel is missing sets of vscr and scr[0-3]. IMO they should at least 
>> be zeroed in advance of supporting the vector extension.
> 
> I see that vcsr set at [1]:178.
> [1]
> https://github.com/loongson/linux/blob/loongarch-next/arch/loongarch/kernel/signal.c

That happens after line 171:

		if (likely(!err))
			break;

It seems most unlikely that there would be an error...

There is a macro for sc_save_vcsr in fpu.S, but it isn't used.


r~

