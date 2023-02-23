Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427A86A0CCF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:24:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDR9-0000H1-F8; Thu, 23 Feb 2023 10:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVDR7-0000Gd-3W
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:23:09 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVDR5-0000b1-1D
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:23:08 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so7422239pjz.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cPWK5rEnMuxKNxfb+LjMe+tjcRewb9Unza7o0B3Urfg=;
 b=kSVnWuYixTUf0c03gDq/lK6NrWdnpARWETRL9mpEr4/FOgSujLS0sEPZ5OPPO29b/G
 rw2Vr18iR5mS1etUbhBP1hPqMsE5dC6n/jsSh/dhYwPqPWLuWXvGirlwOoCN+3qRG5Ek
 FfMiu22X+wtqACfHMGMIvMydyUUvJ93VnBhdOGSv8QHQ0cS5RMUcCRy4d4e2i0JgwfkJ
 lKsVj/nD4jkp9Kk85DSF66Hq+7mg6kPnThTyFOBwkcBzXFF11NJ0dJoGVQAtw1BglQ2v
 MqSwTWfRHbSsGi0ieOcoorGThiZuBym2cpODJwr7V8ZHwsNN5U6zZZpXWGyU/TRb2CGb
 N3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cPWK5rEnMuxKNxfb+LjMe+tjcRewb9Unza7o0B3Urfg=;
 b=Rppy0OJcufC0Aolt+bbV1hpRb8uB2ioWsM7tzDqzQP3jphHrTH2PBHTjCeMgP0JgIY
 PaxXk5zg/00d8/OFpsyyi5Vx2s+TWoYb2y729nnMUraol6BS4VmTci2Sn5oaPn12CL8F
 eY+KttU+hXorJh1NfdqT5AgbkuRiuS7nti573UC+H9gc4fKlwtmHAsOut9P3z4FQqgeX
 woX1MUkhyq1qfRq0K9URC5Ic50zqfMWFyutAzwbo5pkNPmpUscvgfLfvvGlwhO2cT8T+
 klfbxRKssnM/IRVBOygBjC75IGbgWkzbHxGWQmI/ZAgwlzZ2HA033G8Xcs8OV2jXLKme
 GUCg==
X-Gm-Message-State: AO0yUKVo+Wj6I2UndhXvD8Nv3Sd2/krNPjrMvqmj4I5nzVMSMQUK5q+Q
 jEWSndvDzIxCyaULjgn/uO905A==
X-Google-Smtp-Source: AK7set/WdPEb5lVKtW6RIdyma1q3MViBUrKrfWOMzQAXRQDvolbgM7FgONPL+jbGvi0miUnpBm8X3g==
X-Received: by 2002:a05:6a20:5487:b0:cc:287b:b177 with SMTP id
 i7-20020a056a20548700b000cc287bb177mr2145528pzk.6.1677165784873; 
 Thu, 23 Feb 2023 07:23:04 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 a19-20020a62e213000000b005a817ff3903sm3272129pfi.3.2023.02.23.07.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:23:04 -0800 (PST)
Message-ID: <1ad204fc-8f7e-0f1c-e8f6-163d11f3880b@linaro.org>
Date: Thu, 23 Feb 2023 05:22:59 -1000
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
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f484b933-8f9f-6f0b-0d81-7202bed31d83@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/22/23 22:23, gaosong wrote:
> Hi, Richard
> 
> 在 2023/2/21 上午1:21, Richard Henderson 写道:
>> On 2/19/23 21:47, gaosong wrote:
>>> I have some questions:
>>> 1 Should we need implement  GVecGen*  for simple gvec instructiosn?
>>>      such as add, sub , or , xor..
>>
>> No, these are done generically.
>>
>>> 2 Should we need implement all fni8/fni4, fniv,  fno?
>>
>> You need not implement them all.  Generally you will only implement fni4 for 32-bit 
>> arithmetic operations, and only fni8 for logical operations; there is rarely a cause for 
>> both with the same operation.
>>
>> You can rely on the generic cutoff of 4 integer inline operations -- easy for your 
>> maximum vector length of 128-bits -- to avoid implementing fno.
>>
>> But in extreme, you can implement only fno.  You can choose this over directly calling a 
>> helper function, minimizing differences in the translator code paths and letting generic 
>> code build all of the pointers.
>>
> Sorry for the late reply,  and Thanks for you answers.
> 
> But I still need more help.
> 
> How gvec singed or unsigned extensions of vector elements?

There are no generic sign-extending; that turns out to be widely variable across the 
different hosts and guest architectures.

If your architecture widens the even elements, you can implement extensions as a pair of 
shifts in the wider element size.  E.g. sign-extend is shl + sar.

> I found no gvec function that implements signed and unsigned extensions of vector elements.
> However, the result of some instructions requires the elements to be signed or unsigned 
> extensions.

You may need to implement these operations with fni[48] or out of line in a helper.
It's hard to give advice without a specific example.


r~


