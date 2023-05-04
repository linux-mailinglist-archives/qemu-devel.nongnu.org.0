Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40B56F687F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:42:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVTM-0006Vg-NE; Thu, 04 May 2023 05:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puVTL-0006VW-GW
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:41:59 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puVTJ-0000us-UI
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:41:59 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-94f1a6e66c9so41369866b.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683193316; x=1685785316;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YDVaBtv1PIDlDD2jrvaFDTkSIKEBWMsiMbu7ii97qmw=;
 b=gex4Qedh/q3RL/L9/4hPhL1cLwjzuDFtvVLEnrKneMmMozOukoxzVTj60ms6GluT+o
 M29AKGcbG7yOEYgnkfdzutrfofVaFDNcRQO4+J5McbHSx+tOYrL6zakzsRT7ffkSfF6K
 tBVgyldftz/siuHB90Swi9d+HENvaTH6b/QvA2+FNFkoaQ8SinQ2gdsbKKlNk0rWb/Xn
 QwcNJIQTgjAzBtGU+uBKjs83/cc4f9LuOdHlA1WDGUqiXUpxY14ZM9tCADfGzigfhEM3
 I3VgL3FbOmSgyUjINJrGDwWcOZfy1H5cQPGwK7k5KWGwJeneDPusZXWM/Zhjhgj1akM6
 ddDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683193316; x=1685785316;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YDVaBtv1PIDlDD2jrvaFDTkSIKEBWMsiMbu7ii97qmw=;
 b=QBGPmLT/JUgHoPhwP4prJMvuCRP0i0t7n321mmSYcrg5tSFT+U05ChwD5hYDjBtYE2
 pIYGNnbyZH4WK+uYUtw8sqoylixN8+E/XZuGMnL+bngEbCiDWFt3RMr2oPv3UM6Hmq21
 uyejH2aXpPs0j8fGfycR4mbQBurJszEjA+OR9kJP1/EJ3PvnEwpIo2ymj7TGPNsihhgO
 rqqGjekbyEkRubuG5xAFiuiqsVA/gzxsZZ/Zvw8it5E5b1JRedr1yohpXAtqeoi0MnIo
 XynCdtxCUN+dJMxvUwkLYgplf+aSsLN+AcfLrB2YKa8RxHJAVZS3tNX5lG84DGkTgck3
 kYow==
X-Gm-Message-State: AC+VfDymtZVbzjGUUjnKIGVqMhVphk/HpBJgdBac3wCSGSfzbMUgwp/6
 XmeGZysnF5PWhMaJ5jn113oyGL5hGwAtYJUb/RQMFQ==
X-Google-Smtp-Source: ACHHUZ6t3GlECTJpJ/Spsyz1aC93+osADyKDwH/Ifak76LTtMRlNxGiUAeVMknOMatxEwlG0v5AfKg==
X-Received: by 2002:a17:907:805:b0:94e:e3c3:aebe with SMTP id
 wv5-20020a170907080500b0094ee3c3aebemr5514092ejb.0.1683193316096; 
 Thu, 04 May 2023 02:41:56 -0700 (PDT)
Received: from [192.168.66.227] ([91.223.100.49])
 by smtp.gmail.com with ESMTPSA id
 jy26-20020a170907763a00b009655d4450a6sm1937395ejc.192.2023.05.04.02.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 02:41:55 -0700 (PDT)
Message-ID: <620c7286-f643-b7f8-5e21-56f3890db25a@linaro.org>
Date: Thu, 4 May 2023 10:41:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v4 00/44] Add LoongArch LSX instructions
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230425070248.2550028-1-gaosong@loongson.cn>
 <8a821169-6dc3-ab82-bd32-990b0f9a8c98@linaro.org>
 <b6243a8d-8ef6-7609-b71c-fd3cddb69d67@loongson.cn>
 <80c6ed35-1d19-eb6a-0e3b-6fbf23d8540c@linaro.org>
In-Reply-To: <80c6ed35-1d19-eb6a-0e3b-6fbf23d8540c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

On 5/4/23 09:25, Richard Henderson wrote:
> On 5/4/23 02:26, Song Gao wrote:
>>>> V4:
>>>>    - R-b and rebase;
>>>>    - Migrate the upper half lsx regs;
>>>>    - Remove tcg_gen_mulus2_*;
>>>>    - Vsetallnez use !do_match2;
>>>>    - Use tcg_gen_concat_i64_i128/tcg_gen_extr_i128_i64 to replace
>>>>      TCGV128_LOW(val)/TCGV128_High(val);
>>>
>>> One minor nit, everything reviewed!  Congratulations.
>>>
>> Thank you for your guidance and review.
>>
>> Since all patches are reviewed, how about drop 'RFC' on v5?
> 
> Sure.
> 
>> I am  really not sure When the Vol2 will be open.
> 
> That is unfortunate.
> 
> I think the timing of the merge of this code is now up to you as maintainer of the 
> Loongson target.  As an employee of the company you have more insight into the status of 
> the extension, whether it is already present in shipping silicon, or completed final 
> draft, or still beta, etc.
> 
> Even if the extension is finalized, I see no reason why you should not be able to merge, 

Oops.  "Even if the extension is *not* finalized..."
I.e., a beta extension can be merged if it is off by default.

r~

