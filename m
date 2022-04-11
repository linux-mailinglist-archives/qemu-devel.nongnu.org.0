Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3744F4FC77D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 00:16:45 +0200 (CEST)
Received: from localhost ([::1]:53894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne2Kx-0001JK-RB
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 18:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne2JH-00008e-GI
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 18:14:59 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne2JF-0006An-Vc
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 18:14:59 -0400
Received: by mail-pf1-x42c.google.com with SMTP id b15so15792817pfm.5
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 15:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z6mFu1hzSQP6ctrth6YYhN28eSmwuzyAnSAPUgwi+TU=;
 b=I4r05DuKC/WTNFz/sr7zBx2h0IymCesaoIhBslclb1kW+vJvA3DnwQ6yLLGPAEIKEA
 klyswV4uO+Bolx3R/HB0M+tqNRyZiRwaDYxx3xqEeaSdFe9UUyTlevgSq4+Hrw0Snp4U
 FcwMknLp+Iy2uAz2SnSYRGKyv5cBG6BmeDPqisxuoDinF4fbgLTfVucdWDtsoS9+uFrr
 LZjiHipn0gsquCzrenWITkcQBvLUeYawZLhVVh/2IADFpCjUd4O8jLKhvjQuuUK5Hdk4
 Rh4e8RfMrVzIqYNSU5fEYMZOmnC+PJyjeIBLPpVnQTXDZFEubX1CYEWINEOyviAyMAwu
 pedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z6mFu1hzSQP6ctrth6YYhN28eSmwuzyAnSAPUgwi+TU=;
 b=QROuFdK45ajvM27i2rJf751P2LzbebAd4swI3ithAhvMyGJxHdIAO46nYMn5RpolLD
 a1R2HnY/ykewV7GSx+5qReSPnZma+9zGEBWmrMPM2zedTQT5sJeWfpEezQ6AtK4xycbR
 OvyZgmWssIVRVJKJEHzwPcXBIH1//BF3BNPHXI4B2miB0RiioJN7ym943//MyiX0BRb3
 LT0o3Tdp1bP7Uc2EiAfxHXOrXuXzHekdN9zyKEAP1CMwMbQGR2itq8Ux3Jrt0IdQIHel
 IpIku4F5n0G6FIQnCPowVLCM2ysQ2UHa6E1982hmPHi9L9hqE+2dcqYcUMOQoIxDnSlf
 W8Nw==
X-Gm-Message-State: AOAM531MK1K6H9itQ5+Z3/J5YyI+TwxTcxrFEir5DVFeNy6bz/xSM3vX
 h1GDe5ZP6ubW2JD/ZOi/8U2v+w==
X-Google-Smtp-Source: ABdhPJx3maqynoj3BqSu6DfZO0bWLvkR6oi8z6BSSjI4ITMME2u/JyyFL5GjqhWRrXmjXTUDbqucLA==
X-Received: by 2002:a05:6a00:1701:b0:505:c49b:d2ed with SMTP id
 h1-20020a056a00170100b00505c49bd2edmr6945516pfc.56.1649715296347; 
 Mon, 11 Apr 2022 15:14:56 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 md4-20020a17090b23c400b001cb66e3e1f8sm466376pjb.0.2022.04.11.15.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 15:14:55 -0700 (PDT)
Message-ID: <78faaf43-4304-ff1e-1c8a-0102725eecbf@linaro.org>
Date: Mon, 11 Apr 2022 15:14:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 14/16] target/arm: Implement ESB instruction
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-15-richard.henderson@linaro.org>
 <CAFEAcA_9Eu-WZn_yMhjj23GRkz14huEVSb8xckvRyygDngwXEQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_9Eu-WZn_yMhjj23GRkz14huEVSb8xckvRyygDngwXEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/11/22 09:18, Peter Maydell wrote:
>> +      ESB        ---- 0011 0010 0000 1111 ---- 0001 0000
>> +    ]
> 
> Why don't we decode bits [11:8] here? I see it's the same
> as YIELD/WFE/WFI, but I'm not sure why we're not decoding
> those bits in those insns either...

See page F4-7074 in H.a, where bits [11:8] of the imm12 field are described with 'xxxx'.

>> +static bool trans_ESB(DisasContext *s, arg_ESB *a)
>> +{
>> +    if (dc_isar_feature(aa32_ras, s) &&
>> +        arm_dc_feature(s, ARM_FEATURE_EL2) &&
>> +        s->current_el <= 1) {
> 
> This is doing the right thing for M-profile but only rather
> indirectly because it happens to get caught by the FEATURE_EL2
> check.

Yes, I had though that a feature, reducing the number of checks, but...


> I think it would be safer to explicitly check for
> not-M-profile (which then gives you a place to put the
> "For M-profile minimal-RAS ESB can be a NOP" comment that got
> removed above).

... fair enough.

> I think a comment noting that without RAS we must NOP would
> be useful here.

Ok.


r~

