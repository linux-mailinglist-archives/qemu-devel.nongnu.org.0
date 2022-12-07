Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B6645CFE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 15:56:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2vpZ-0002Ny-4c; Wed, 07 Dec 2022 09:55:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2vpX-0002Nn-Gn
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 09:55:27 -0500
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2vpV-0006x7-Pi
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 09:55:27 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 n42-20020a4a956d000000b004a047b3964fso2654260ooi.12
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 06:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e3TKGm7Lm0amEBW12vizkGPsRk51e7Pt9C7KzgYsI3w=;
 b=in+xXDo18VBEDjeAoXUxZT6FkKrz9eg5U7gTXRI71dBaj/QpK9gpRqiMi77JsXf9Np
 StJzP4oYMo3+GBNRBOm8Bm+GcSu5Rs/RWlgGU4XQyXymdnoHCdRqqIT1NlF7Jri1HmtG
 M9Hq/cUrD3VYPyZI4CI8Wn1auOpCKC6mp9paQT2ZTOcUlXTT9gBq2rsXqErHDSTGDqom
 FMXcNHj6vxLbWbgwvo5w4b6vD+RLZm0RTI4ym0DgV14WpgAlvmdZOeSs2qLPaj/7Ewbp
 Pk/l87YTRCcfz9uEuLu3i0LfPwNeMCLIekB2Hwt5IKEltcz5tHYSR1p80c71G62SaA3A
 zWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3TKGm7Lm0amEBW12vizkGPsRk51e7Pt9C7KzgYsI3w=;
 b=I/SfYvXBoU1i4s2gXJhdoKRCHkyDwfOtJgSSVBjmLnYUVxGlmH5/Xs5WUO2zq8TcT9
 GGDkghPzRXINd9nwHPLkD6lkjut35X7WNj/t9GpiVfaBs0sYcvoiHT41I0m21aRx2UqY
 ivj5l7U8vegJVOq7AJOu0hdGzBrutEVc1SmYB+8cpjdN1OAyX2Gl4UssZUmgU6sHFJMU
 bMqzIulAMyTEdtMJbqa/SCbqh1WGKXme4yGsNVr+Tf5LpsUwO2KTOoxi/GMhyn6+piIT
 h9zJckJP/n7fLJ9anrBDxNt10+1y62NvhKHtZrSVKb2JAUKljCSPnolbAlr7f9rqXr4K
 3d1Q==
X-Gm-Message-State: ANoB5pmcl+52yluoDBrFqcTHIaKOyyIyOJU71d6mkrQ/ih/76/+3AWqY
 mUZM8a+3f4Q6ck6JRUNnpXk1Ew==
X-Google-Smtp-Source: AA0mqf6NniLapDG4nVJsGg3tYE94LXh8JSLTcFM+ws7icmT9ImIEI+kiCxc682B8brWyU9k/9UQNdw==
X-Received: by 2002:a05:6820:313:b0:4a3:6218:8905 with SMTP id
 l19-20020a056820031300b004a362188905mr143021ooe.4.1670424923582; 
 Wed, 07 Dec 2022 06:55:23 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:3c4d:6df:3392:485c?
 ([2806:102e:18:70b5:3c4d:6df:3392:485c])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a4ae0c9000000b004a05e943f9esm4209742oot.21.2022.12.07.06.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 06:55:22 -0800 (PST)
Message-ID: <3ab2945a-c54b-d806-0316-efcf26c91814@linaro.org>
Date: Wed, 7 Dec 2022 08:55:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 02/13] tcg/s390x: Remove TCG_REG_TB
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-devel@nongnu.org
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-3-richard.henderson@linaro.org>
 <20221206192947.fi6c3ftrueuiqmch@heavy>
 <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
 <f035fe38-44ed-6045-b948-d5fcd0dfafd7@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <f035fe38-44ed-6045-b948-d5fcd0dfafd7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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

On 12/7/22 01:45, Thomas Huth wrote:
> On 06/12/2022 23.22, Richard Henderson wrote:
>> On 12/6/22 13:29, Ilya Leoshkevich wrote:
>>> This change doesn't seem to affect that, but what is the minimum
>>> supported s390x qemu host? z900?
>>
>> Possibly z990, if I'm reading the gcc processor_flags_table[] correctly; 
>> long-displacement-facility is definitely a minimum.
>>
>> We probably should revisit what the minimum for TCG should be, assert those features at 
>> startup, and drop the corresponding runtime tests.
> 
> If we consider the official IBM support statement:
> 
> https://www.ibm.com/support/pages/system/files/inline-files/IBM%20Mainframe%20Life%20Cycle%20History%20V2.10%20-%20Sept%2013%202022_1.pdf
> 
> ... that would mean that the z10 and all older machines are not supported anymore.

Thanks for the pointer.  It would appear that z114 exits support at the end of this month, 
which would leave z12 as minimum supported cpu.

Even assuming z196 gets us extended-immediate, general-insn-extension, load-on-condition, 
and distinct-operands, which are all quite important to TCG, and constitute almost all of 
the current runtime checks.

The other metric would be matching the set of supported cpus from the set of supported os 
distributions, but I would be ready to believe z196 is below the minimum there too.


r~

