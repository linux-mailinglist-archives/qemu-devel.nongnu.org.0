Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80F86CECC2
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 17:23:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phXdU-0007hN-81; Wed, 29 Mar 2023 11:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phXd6-0007f3-HT
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:22:31 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phXd5-0006nP-4U
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 11:22:28 -0400
Received: by mail-pf1-x432.google.com with SMTP id y2so10513633pfw.9
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680103345;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LJs2KsOycMDm7P3yMdYqUDy88zqRQWqeBYY0Mj8WSc4=;
 b=wx8p80JzcDKrbGTTIsjZUZlnMo05e4bMytfzKuDoxk1WAmVO4xogdhG+SwtkScmX9E
 MaFP9rWUlyOvZmd4XYYJWr0oHRjmqqTY50aOyt+bVgYapH20uXGp5bcN0gOL4XZd2FeK
 OuwireuXMux182QSTgOKkRQf2DdyuGGMi/rFm2itvOXcZq82miHe15jJ2kTssZGAQqiN
 Nfbf0gVExoaiEOwrcpomWYz/LnE63oTQvbr/h9TvdSZez1OvZ6azuwYzaWWUJPjCs39o
 1xa4YMLvgV2K9ye7fhZd/MwTaqZeE8PVYOCkCKeAZ4xamMG+Wc/UESjMARmExuyc3M8O
 amZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680103345;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LJs2KsOycMDm7P3yMdYqUDy88zqRQWqeBYY0Mj8WSc4=;
 b=fDVKEuOi8cuB0qS63ZHbOtSceEFNWKQCcLDZWGIg1RjEEkq37ENw559GkBzM303mHW
 clFRUMwl/w1JxkndtakeUAW/a+FCCd48xm7IOMJzZWCPEb6N4NlwO6c+7V85fcJk7z4m
 85V1bYb/y7BBLc/mppsCyGTHmpBx00FqkysCuiKNFXi6SO5/7UjNb+lbRm2xI4yjV74y
 VWGAXitlvYW5qcyfaMXdSLyPVYkRa4rzf90n/fSe7J6Tx+bQF9e20zwy81Qyai+us5V8
 TaFp+KJMMpgli0B0oFgjSRtDjxA/Za8kyokN5D9pw5GopWqZBfkSi2ij56D4zTqLwhvy
 Lrng==
X-Gm-Message-State: AAQBX9d5GJhCA7bKaxoJdLpDitOncUrGTWDvwYCIp5sjAgeNl3mL+b/N
 TamYd/r5vdFdWxYqnVscfRmVgg==
X-Google-Smtp-Source: AKy350bfwRJQ7hXPi7gg3mPgn7tU3fpitYSVHaQwO8fYZb2Vc4ge1IwrG5aIZib4FvL6pc7jw3kvmA==
X-Received: by 2002:a05:6a00:88:b0:625:ceff:14ba with SMTP id
 c8-20020a056a00008800b00625ceff14bamr18805888pfj.25.1680103345614; 
 Wed, 29 Mar 2023 08:22:25 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:3369:815f:629b:7300?
 ([2602:ae:1541:f901:3369:815f:629b:7300])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a62ee12000000b00625b9e625fdsm23847103pfi.179.2023.03.29.08.22.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 08:22:25 -0700 (PDT)
Message-ID: <486324a8-8b3f-fc35-5193-f2fbd6725c24@linaro.org>
Date: Wed, 29 Mar 2023 08:22:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2 05/44] target/loongarch: Implement vadd/vsub
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230328030631.3117129-1-gaosong@loongson.cn>
 <20230328030631.3117129-6-gaosong@loongson.cn>
 <550e1fa3-ee78-a6dd-7b84-457886a2292e@linaro.org>
 <74e9c94d-49cd-ec46-e5c4-3e60d0ea2c38@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <74e9c94d-49cd-ec46-e5c4-3e60d0ea2c38@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/29/23 02:59, gaosong wrote:
> 
> 在 2023/3/29 上午3:59, Richard Henderson 写道:
>> On 3/27/23 20:05, Song Gao wrote:
>>> +    func(mop, vd_ofs, vj_ofs, vk_ofs, 16, 16);
>>
>> Oh, reading about ASXD and 256-bit vectors makes me wonder if it would be better to plan 
>> ahead and have a function, or DisasContext member, for the length of the vector. 
> 
> like arm:
> 
> /* Return the byte size of the "whole" vector register, VL / 8.  */
> static inline int vec_full_reg_size(DisasContext *s)
> {
>      return s->vl;
> }
> 
> What I'm confused about is what is the difference between s->vl and s->vec_len ?

The first is for aarch64 SVE.
The second is for armv5 VFP (which was removed from armv8).


r~

