Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735F0699420
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 13:16:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSdBh-0005bT-DH; Thu, 16 Feb 2023 07:16:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdBa-0005Y1-Pj
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:16:27 -0500
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSdBZ-0001cF-4H
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 07:16:26 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 j22-20020a4ad6d6000000b0051fcc9bff19so186523oot.12
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 04:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IsRzuVKvI4u/CB7GOMekmty0tWDZvcYilnQg5bZLd7U=;
 b=DwR/IU3QX1A9EDaob55YE1N3dE3wCV+YYlrM20PLTCXScG0h3LwWqvvJ90NellO9s/
 XDFbtqr9YGELlIUPz+Irq2OE/Lj4FLuI08F7yOl7RPDQ9hFof8mUjkzr7aNhVFrAROER
 Ahf3ATje/GDhUgazUz+wItC5K1Vbw1X4QSwSoaD0ZSRalmOiAqRHBj+gKFihWSS3MN9V
 9M+qxCPEHYVBD10A5EeCqvjfP3bbdWg5d9BPQ/sv2+DFJ1BRRwCnS3NSXgh/s7eWHIXY
 HMCGiJrUNQw4DEs0ImIllkT669Z6roDFPOShgKkGWH7oG0ke5ojpVs+HHy38Y7ldujw1
 cxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IsRzuVKvI4u/CB7GOMekmty0tWDZvcYilnQg5bZLd7U=;
 b=k9LzTKFuSeFAVlSRV+3RUQZyTDRWqePTvu6p36jqMXpFNm8/mLjjvhkgCYPzceE3sO
 qsfQfVFPpq0pXLrqYFWVASr/UcbFKf756wYem6m8hriHSxCpYMAnZ3IzGhMZ7nplLDq7
 NeyWlUczKQaXub9QYS6DqlNw+5oixQUfVyOY2v4V8UG7k4RlX01IGY5Ekw3HhU89eJiH
 LV9U44rRNYtbmY4K+tY2Pg5waTTjTq5qvWn+mcT84eQnNBet9giXyhVlJH/owPi+bGTN
 VpoJkD0/OJ+kkbfZFvKWz9qB4e2nhENJydZLQUcdMq0U+hnyE/Y/EBVgeKaac45o+ykB
 K14A==
X-Gm-Message-State: AO0yUKW9pEoebI0+0AMT74x6HGSPVWhbCLR3Bz/eoEbMQb6+xPvkCopP
 GXX91jiEvJZNs1lIHhonXjr20A==
X-Google-Smtp-Source: AK7set9Ugwtp8cRTchPxwXpI438nvBqfwcSnU2mpMrbsnRui0hQ/JFX2ctLy9Y6RaMg52Jpnijd7jA==
X-Received: by 2002:a4a:c617:0:b0:51a:ac9:775 with SMTP id
 l23-20020a4ac617000000b0051a0ac90775mr2337939ooq.6.1676549780630; 
 Thu, 16 Feb 2023 04:16:20 -0800 (PST)
Received: from [192.168.68.107] ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a4ad496000000b0051765eb8c25sm572239oos.10.2023.02.16.04.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 04:16:20 -0800 (PST)
Message-ID: <66586eb4-b58a-f5b3-eb77-34f948631f18@ventanamicro.com>
Date: Thu, 16 Feb 2023 09:16:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 02/10] target/riscv: always allow write_misa() to write
 MISA
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230215185726.691759-1-dbarboza@ventanamicro.com>
 <20230215185726.691759-3-dbarboza@ventanamicro.com>
 <20230216092922.sxxwuizbpj65zt4z@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230216092922.sxxwuizbpj65zt4z@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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



On 2/16/23 06:29, Andrew Jones wrote:
> On Wed, Feb 15, 2023 at 03:57:18PM -0300, Daniel Henrique Barboza wrote:
>> At this moment, and apparently since ever, we have no way of enabling
>> RISCV_FEATURE_MISA. This means that all the code from write_misa(), all
>> the nuts and bolts that handles how to properly write this CSR, has
>> always been a no-op as well because write_misa() will always exit
>> earlier.
>>
>> This seems to be benign in the majority of cases. Booting an Ubuntu
>> 'virt' guest and logging all the calls to 'write_misa' shows that no
>> writes to MISA CSR was attempted. Writing MISA, i.e. enabling/disabling
>> RISC-V extensions after the machine is powered on, seems to be a niche
>> use.
>>
>> Regardless, the spec says that MISA is a WARL read-write CSR, and gating
>> the writes in the register doesn't make sense. OS and applications
>> should be wary of the consequences when writing it, but the write itself
>> must always be allowed.
> 
> The write is already allowed, i.e. no exception is raised when writing it.
> The spec only says that the fields may/can be writable. So we can
> correctly implement the spec with just
> 
>   write_misa()
>   {
>     return RISCV_EXCP_NONE;
>   }
> 
> as it has effectively been implemented to this point.

I'm fine with that. We can always use git history to see the removed code and
reintroduce it back.


Thanks,


Daniel


> 
> Based on Weiwei Li's pointing out of known bugs, and the fact that
> this function has likely never been tested, then maybe we should just
> implement it as above for now. Once a better solution to extension
> sanity checking exists and a use (or at least test) case arises, then
> the function could be expanded with some actually writable bits. (Also,
> I think that when/if we do the expansion, then something like the misa_w
> config proposed in the previous version of this series may still be
> needed in order to allow opting-in/out of the behavior change.)
> 
> Thanks,
> drew

