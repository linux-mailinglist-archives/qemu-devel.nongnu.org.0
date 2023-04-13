Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C35B6E0AD0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 11:56:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmtfd-0005Vk-2O; Thu, 13 Apr 2023 05:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmtfa-0005Ue-LR
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:55:10 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pmtfW-0005ek-W6
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:55:10 -0400
Received: by mail-oi1-x22a.google.com with SMTP id f14so27978272oiw.10
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 02:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1681379705; x=1683971705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQDFd9W9yQfZHQTUawsMNbEI2ZOdo9ltnebXC1opW0k=;
 b=P8WtQ0PREPkOTSvqwW/ypxaQtIGpaaCj49KekUIKGNCfO09CDIkQqlNz8T6EacImsw
 JNh1PQ/QAfSkxtXlOBRxK78Hb1uK//2Qp1YUn1CK8HegszGNIlVAzcKfgdtRlO6Cbkmd
 6vAoQL7+H86u+Uq0fVfaXcNq7DsKIH+3NsVOYFnkFfmExw7jQR60/16NNSlx2KmLZUQi
 3Ql00MyfHel/+VRvTP4uEzXRI73BVU+HFdnZTlhFAlbp2CjG8n3zzoH+HPsqgqxjorq7
 XlaBaAmTSGORLPeNAuBhA1ePoZhiEy0ykkWC43RmqbKDsC9WM6D1MwpDm976EZ5cUG7j
 /hnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681379705; x=1683971705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQDFd9W9yQfZHQTUawsMNbEI2ZOdo9ltnebXC1opW0k=;
 b=B+PbncmaCqPc9MdG8OuaK9x4v50f+WMzEZHkp804UkhkTXXlopCa8ac3KPucZGH6UX
 FInUe6AfMLQleDvFfFOLIYge+NWdDbFdxnbgsN58w37hJBXiViuwRduVy5pUKKeB4jTM
 3c60mRL+lobgUY4XmZ1Y66oXZAX4SQExAkcMGbqJqLQ7m/KHtHL4W4fAnqjYwZjC/flG
 soPEhjJXVkJBpW0ASrymeh80YIpHd/dop0SzP93OKfGbm1GBtiTYPkZHcH76QegBGpqx
 5UlwXpHYA755Qm7BUZlfM022MdYkY9+iU6qD7MCcdYgM5lTzjT/wvam9h7nVG2J1CkBo
 JvNQ==
X-Gm-Message-State: AAQBX9fgoICEDXJrF1C8Cq1QS5hxc/LLRCjw3S2Y0QmHSSGevAbHdtKP
 JEYf9PeDuqZB0JeSJgLi/bKJWkR+4B+SAmLVYjI=
X-Google-Smtp-Source: AKy350ZFOgyshJLXnPSKf0HUPuKXkuPY+D1Xg0QK4N4l7cokKDsACKUYAdYo7FbephrsdvKqQSDXmA==
X-Received: by 2002:a05:6808:3a87:b0:38b:bf5f:86e1 with SMTP id
 fb7-20020a0568083a8700b0038bbf5f86e1mr739073oib.23.1681379705405; 
 Thu, 13 Apr 2023 02:55:05 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a056808145300b003898bec0e01sm457399oiv.17.2023.04.13.02.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 02:55:05 -0700 (PDT)
Message-ID: <dffa964c-8ceb-f046-41e8-727d41629585@ventanamicro.com>
Date: Thu, 13 Apr 2023 06:55:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 27/54] tcg/riscv: Require TCG_TARGET_REG_BITS == 64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-28-richard.henderson@linaro.org>
 <c696a2f2-48fc-88f3-bc30-81d31a0fead8@ventanamicro.com>
 <ff9cbbc5-d900-bc45-ef15-0da56e53547d@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <ff9cbbc5-d900-bc45-ef15-0da56e53547d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.083,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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



On 4/13/23 04:12, Richard Henderson wrote:
> On 4/12/23 22:18, Daniel Henrique Barboza wrote:
>>
>>
>> On 4/10/23 22:04, Richard Henderson wrote:
>>> The port currently does not support "oversize" guests, which
>>> means riscv32 can only target 32-bit guests.  We will soon be
>>> building TCG once for all guests.  This implies that we can
>>> only support riscv64.
>>>
>>> Since all Linux distributions target riscv64 not riscv32,
>>> this is not much of a restriction and simplifies the code.
>>
>> Code looks good but I got confused about the riscv32 implications you cited.
>>
>> Does this means that if someone happens to have a risc-v 32 bit host, with a
>> special Linux sauce that runs on that 32 bit risc-v host, this person won't be
>> able to build the riscv32 TCG target in that machine?
> 
> Correct.
> 
> At present, one is able to configure with such a host, and if one uses --target-list=x,y,z such that all of x, y or z are 32-bit guests the build should even succeed, and the result should probably work.
> 
> However, if one does not use --target-list in configure, the build will #error out here:
> 
>>> @@ -942,9 +913,6 @@ static void * const qemu_st_helpers[MO_SIZE + 1] = {
>>>   #endif
>>>   };
>>> -/* We don't support oversize guests */
>>> -QEMU_BUILD_BUG_ON(TCG_TARGET_REG_BITS < TARGET_LONG_BITS);
>>> -
> 
> I am working on a patch set, not yet posted, which builds tcg/*.o twice, once for system mode and once for user-only.  At which point riscv32 cannot build at all.
> 
> I brought this patch forward from there in order to reduce churn.

Thanks for clarifying.

As you mentioned in the commit msg, there's no Linux distro (that we care about) that
runs on riscv32, so this is not even a restriction today. And we can always change our
minds later if the need arrives.


Daniel

> 
> 
> r~

