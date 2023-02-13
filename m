Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A3B6950F2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 20:47:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pReli-0006Gr-Ca; Mon, 13 Feb 2023 14:45:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRelg-0006GZ-Sh
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:45:40 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRelf-0002Rx-AX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:45:40 -0500
Received: by mail-pf1-x432.google.com with SMTP id bt14so1856687pfb.13
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 11:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FxCJ2vG3kHqoTUdgVzQ8FSOzHaq7X0S2N3bAkulCvPI=;
 b=UYmojC5HhveeiDWCqD78an1Agx5ln3vBgEUSZHOiDJpz3z9CesNGCSuqULNI7V0iFR
 M69Ld4mdjXp3BWZ9bJoInbiSIGLjjzAiLOWMqMvOMrQlVg05NdZJbtF3s28yXQrz2T4C
 bMgAjQYNJGrrIXP6pZ0E+t44hKHKD86QxHu+o4wneGLjEufouRhkendGP7OTZQjAJifP
 TLAONZU2J8CWYHjRTQc6HjuV9E78J2YwUgwskYIDkhc27dT96PH2yNQ/Nj9gn0ZLD0Rs
 dJGDmvOWoYEJLJ/bmFbfug3elKtnAoByZ1a6G8kMPT3uaN5lTgRb4F3YJYeIAVp8BurT
 86+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FxCJ2vG3kHqoTUdgVzQ8FSOzHaq7X0S2N3bAkulCvPI=;
 b=ZOB2Lfv9snhKlFY+GwHAuqEKef/bRYtGlzLIuHG7prTu6lYkXg6OKir1vJWAbpzpY/
 ySlvSdxR23Pp7hDiRnc0rO6c8vXxd08sy+mtZJmaaRtMe5rY5FEM1gzJvLD+QaNnZu7k
 bNi33O/BBfphP68ogBQrwExZpTKrB2KCJTA3IoA8P4k7SyTdqTx3itAMxbfY+Y9v/59V
 7rXL+aemPGJivyvvysTTrbrDJzL2kwQzc1+CiGjMFNHdL0rRIqi5mPW3z/Ii9urCVsww
 BLUQP8Gn6tRcCVGHq00pXmXTi9OxLBdtjdKd3ZrYT36HBcRfVn8goCJsct+kBgWstzkv
 Ho3A==
X-Gm-Message-State: AO0yUKWigWh6wQ2iu/QvGGLCgMDw7Fve+QBPbsrFwu2yJ7tCBiGkMNsu
 KW1bEtDymaTNIU4bDGDLhAc1gA==
X-Google-Smtp-Source: AK7set+S67CjGwK0LybHG2YuoAtEnJ186NPnzXBS6dF81GLbMZvG3M/cztZIbjGsOQQ/KOPTAzFwIQ==
X-Received: by 2002:a62:1a8a:0:b0:592:d313:b26e with SMTP id
 a132-20020a621a8a000000b00592d313b26emr20073302pfa.17.1676317537662; 
 Mon, 13 Feb 2023 11:45:37 -0800 (PST)
Received: from [192.168.145.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 v25-20020a62a519000000b005809d382016sm8270564pfm.74.2023.02.13.11.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 11:45:37 -0800 (PST)
Message-ID: <76616dd5-567c-c0fa-118c-0a4f06d4fb2d@linaro.org>
Date: Mon, 13 Feb 2023 09:45:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] hw/arm/smmuv3: Add GBPA register
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Mostafa Saleh <smostafa@google.com>, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, eric.auger@redhat.com, qemu-arm@nongnu.org
References: <20230210221951.1298668-1-smostafa@google.com>
 <9619db1f-5595-b95b-7643-ae345759a59c@linaro.org>
 <CAFEAcA9iBui4zHCo+4b6o6rTXgQ=VpNzWUUTZmv_CR=cxWV3gw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9iBui4zHCo+4b6o6rTXgQ=VpNzWUUTZmv_CR=cxWV3gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/13/23 00:57, Peter Maydell wrote:
> On Sat, 11 Feb 2023 at 23:49, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 2/10/23 12:19, Mostafa Saleh wrote:
>>> @@ -1512,6 +1553,10 @@ static const VMStateDescription vmstate_smmuv3 = {
>>>
>>>            VMSTATE_END_OF_LIST(),
>>>        },
>>> +    .subsections = (const VMStateDescription * []) {
>>> +        &vmstate_gbpa,
>>> +        NULL
>>> +    }
>>
>> Actually, I suspect that you need a pre_load hook that resets gbpa, which will then be
>> overwritten if and only if the saved value != reset value.
> 
> VM loads are guaranteed to start from a VM state which is freshly
> reset, so the device's reset method is sufficient for this.

Thanks for the confirmation.

r~


