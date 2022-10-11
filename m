Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE575FB86F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 18:43:42 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiILx-0004SE-VU
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 12:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiIIA-00021c-K7
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 12:39:42 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:34727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oiII8-0005HB-WE
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 12:39:42 -0400
Received: by mail-pf1-x432.google.com with SMTP id f140so14046485pfa.1
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 09:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OMHm+xKHdNgHa6LllHjMCNSb9WoqkkLlvUgIvQ2f6tw=;
 b=i/rRziyvhBJ3D08Y0dMYr1T5CHmvEniakuZTxrtwSOGoJBLxApHKpnSw/hMH1WQH1H
 G5roXO/2+ALvxLxFo8Cu+r1QZr5hmVzR4IB72HtiXPxengZ0uo/gjJJm5yqafN8Qnm8N
 EhJLQsIKkklRqsZCCf8cjiL7HWYuBg3UieqK47BjG2tPPH3b0dfAVnWMo9rsKmTs40hd
 tr0mqbf2Wwb/EizZz6P1OC4uLMHXqfEt7YaBt6OIUtyVAq5W0Db6VmT3KhilTuYYuEqO
 SoONJsuzdzPl8kYqlK36E8jwoK7lQMAgI/6YP51fUEFVy4amFLDQn6BzxSvwMTv8wcd8
 SBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OMHm+xKHdNgHa6LllHjMCNSb9WoqkkLlvUgIvQ2f6tw=;
 b=RAdKKpSnVd6a0RCtaPbIxa1TelQ2okPXlcNGRmxSY9fU8T5ANPbWulPr1cdVUuHlkd
 3wO2wlEZBbddrvKhnaE3g9N00Bn1FQ51QrM1Xk+Pl/35tR6LS8gBY3c3ktALo7z91MDy
 fUJV+frzfo+muAI/I21z4XtKnFeKBfNED6YVTFlDfrcAy8788ebhGPcrLiR0FICKQhWu
 KihiP+/1QuXDnXTU15kgjOpYHWs7y0xv7DiEF6aLxcMkO2bKhdyIujbrD8T5/Ue9NZC8
 ZfK3Bzgs1sVoIy5/+Y8/LleoVZTGvor9+Op1kWswSDFc8nymfTVbcEvV8I7Ip5RXMg9/
 yxWA==
X-Gm-Message-State: ACrzQf1mhmeVROa2vgrnAEiEVUo+Tx+/oUPdM4ScftLe6ArTNpppAYCd
 vFAuijo2WfBJXVKfbVxynfMGAw==
X-Google-Smtp-Source: AMsMyM79SlTqsM8HCxWCyoOkB/qQ5K6fmxPuYYkhetxF6HwVu6SeI/qh9mL1iuweb9/kq4GlrfIUbw==
X-Received: by 2002:a65:464b:0:b0:42c:b0:9643 with SMTP id
 k11-20020a65464b000000b0042c00b09643mr22347387pgr.232.1665506379421; 
 Tue, 11 Oct 2022 09:39:39 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:67e1:640e:ccb8:1a4a?
 ([2602:47:d49d:ec01:67e1:640e:ccb8:1a4a])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a170902f54900b0017f8edd3d8asm4056184plf.177.2022.10.11.09.39.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 09:39:38 -0700 (PDT)
Message-ID: <53453ca7-295d-7fc6-b053-94cedb72cfef@linaro.org>
Date: Tue, 11 Oct 2022 09:39:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/s390x: Fix emulation of the VISTR instruction
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20221011101401.81849-1-thuth@redhat.com>
 <d7873010-8d15-360a-39c5-d94acad5d4bc@redhat.com>
 <c357577e-f8e8-0b1c-7c12-80c0528ed50d@redhat.com>
 <ba70d3ff-cf74-2da4-62bc-fcc05fd990f9@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ba70d3ff-cf74-2da4-62bc-fcc05fd990f9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.934,
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

On 10/11/22 06:24, David Hildenbrand wrote:
>>>> +++ b/tests/tcg/s390x/vf.c
>>>
>>> In general, we use "vx" when talking about vector extension. Maybe name this
>>> vx.c
>>
>> Ok... or maybe "vecstring.c" in case we only want to test the vector string
>> functions here? (they are in a separate chapter in the PoP)
> 
> Also works for me. Or "vx_str.c" or sth like that.

If we're going to bikeshed the name, use the insn being tested.

What you don't want is one big file testing lots of things.
What you do want is lots of little files each testing one thing.


r~

