Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BF46DC0EC
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 20:10:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plZTJ-0007bO-6C; Sun, 09 Apr 2023 14:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plZTH-0007bC-Pw
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 14:08:59 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1plZTG-0007CA-4s
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 14:08:59 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 jx2-20020a17090b46c200b002469a9ff94aso887830pjb.3
 for <qemu-devel@nongnu.org>; Sun, 09 Apr 2023 11:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681063737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+5AxvFijExpfEnefNRgM5Vj7cd3P3WCl3Vela4w4AGQ=;
 b=NuMNxdrqJ+5jDuKzz7tCuwdH0x5a79nZAoRkM4SJfdxAjX7QD96ramqo0AdaERoGwU
 Z99sr0c0WNwusC5mNA9MoqpoUUUtGldE02StYD+KL4NTeQtgmLnRtUP7YdOiVPF4st8h
 Hmj45iyczywIxIX37E24VinHrAcinvfhwjcwozm/yDtbdXNzNT776f2d6L11ix9LxNIO
 d33Fv04iKpDW+IUEEshoMqqTtOFW0B6Tz/wHDehkM4ULCEUqPkppYCHA62MTpflrUm6H
 hGTZcisi1gUEenSergzGgPagGin4y/wJ780HJbUW2ATqjWqIBZBbtqxvgaZhH/9b9cSa
 LGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681063737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5AxvFijExpfEnefNRgM5Vj7cd3P3WCl3Vela4w4AGQ=;
 b=hY2Zm1Ym2BbZWw86IqkqVy8HQgz4OD0JIlCsVhxNmqQJ12fSOqeWE8ObC+O0cHhrqX
 XpQpbBMGNPTt0lGvOysElkVP/MIeGf/4vzglaG1llxojnzBo4dvQ36sGgkR73CYqSPC8
 9fu3xR2n3Us0UWXIZp1Q3Bj/VEw9fQfnuov7RRdTyXeHChfYIpsYEJ/tdIgWq/1bKS0S
 DGLm6ZWo9e2BBz+yjNEHgiMHe2TBos3iBSvwZTMwAwbO73ASi4cghbbtOXwuU9EtIzko
 IIUeO7UL0d6IPLiLGAxjzsFwlQlSjWw0gpNZCgqHs6FrhCLBtILR/oRAru9vxh3fa4E2
 CJrQ==
X-Gm-Message-State: AAQBX9fIIz8GFyGmx7wgKNDQMvOimtRQD1o2LZhLDuKQjsUCT8QEuPjI
 W4/O3OUKkqCdovYvGKQiVLQFYQ==
X-Google-Smtp-Source: AKy350bEq8flFmylzk+5gSAzCEmaDVXnEboHfcdM1L5P+oB0Ja7HHKzLD2qlvYdTDVy0Ww3UPtcarw==
X-Received: by 2002:a17:903:22c7:b0:1a1:dd3a:7509 with SMTP id
 y7-20020a17090322c700b001a1dd3a7509mr7750064plg.48.1681063736758; 
 Sun, 09 Apr 2023 11:08:56 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:d714:12f0:3102:b5ae?
 ([2602:ae:1541:f901:d714:12f0:3102:b5ae])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170902b60700b0019cbabf127dsm6120578pls.182.2023.04.09.11.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 11:08:56 -0700 (PDT)
Message-ID: <68a80aab-4aa8-446c-c3cd-f756574c769f@linaro.org>
Date: Sun, 9 Apr 2023 11:08:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 v2] target/ppc: Fix temp usage in gen_op_arith_modw
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org,
 qemu-ppc@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Anton Johansson <anjo@rev.ng>
References: <20230408070547.3609447-1-richard.henderson@linaro.org>
 <606b0b02-a167-8cb1-db0f-119442d0aa16@kaod.org>
 <9bf63987-e868-d663-b8a4-e6a4f7ab0eba@linaro.org>
 <72e69d86-cf6c-a621-d2dc-42fc26cbe396@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <72e69d86-cf6c-a621-d2dc-42fc26cbe396@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.888,
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

On 4/9/23 10:29, Cédric Le Goater wrote:
> On 4/9/23 18:21, Richard Henderson wrote:
>> On 4/8/23 14:24, Cédric Le Goater wrote:
>>> On 4/8/23 09:05, Richard Henderson wrote:
>>>> Fix a crash writing to 't3', which is now a constant.
>>>> Instead, write the result of the remu to 't1'.
>>>>
>>>> Fixes: 7058ff5231a ("target/ppc: Avoid tcg_const_* in translate.c")
>>>> Reported-by: Nicholas Piggin <npiggin@gmail.com>
>>>> Reviewed-by: Anton Johansson <anjo@rev.ng>
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>
>>> Looks good:
>>>
>>>    https://gitlab.com/legoater/qemu/-/pipelines/831847446
>>>
>>> I have a PR ready for this same branch. If you want to me send,
>>> just tell.
>>
>> Yes, please.  Also, the comment above needs s/t1/t0/.  :-P
> 
> sure :)
> 
> Are you taking care of :
> 
>    https://lore.kernel.org/r/20230408154316.3812709-1-richard.henderson@linaro.org

Yes, I'll send that with two other tcg fixes.


r~


