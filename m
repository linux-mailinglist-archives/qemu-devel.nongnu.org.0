Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8232693DD2
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 06:23:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRRHk-0001Ql-B7; Mon, 13 Feb 2023 00:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1pRRHf-0001QH-9c
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 00:21:47 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hchauhan@ventanamicro.com>)
 id 1pRRHd-0006mS-ES
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 00:21:46 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 v6-20020a17090ad58600b00229eec90a7fso13089406pju.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 21:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5lca+BbbfchZdQIb8/3X45airvaXvtyNGRcthn6JtrY=;
 b=M2k28uGdXVxQ71AZuL1gUP6e/iNjaclJt8MvL2FHpVuR4dZ/wLojfzzdyDPvHSQQ/b
 I7/qQhmqXNJxBan37AnpYadS4q+bhRPcf5nGabl/yDgtpqwD5heMtyU4jvEv3OTI5jJu
 m7H/tl0jCt1R8HTaduEo5i6tz8LKNKVqmhOPM84pYFf9vZw4jzc9xa1Vvn3qLJsN/yHY
 evKiNj0uJyNJ+m9GHlc6stu+MeiESybkgOq7S4zWwRGqB9inn4/sPCfJHkyaE8MhitC+
 K4PmGwxnuVmrHE7MVFRB6iflsuObW9xEGRedm7B/Fg7WH2aJUpK3q/3yM+2PYvkPyyfD
 vhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5lca+BbbfchZdQIb8/3X45airvaXvtyNGRcthn6JtrY=;
 b=Qcwqx3rTPUq015Yn67SeZ35bPz9RobYX9/4jlE1Qhvtk01Jrz/8zMkA2a7XldnIu8R
 YFVptXRs+Aub0wMgdxNTvPrrBoJFQmh+MSkNW55c/uIruk/W/+EkYbpBbojeVQ/Gl+tP
 D2YIvnIBbMwn3MXz4Wc+kkIO+WEWarJqFOPhHj5gyjRIf/HcYr5dDmGCYHZPtsdsOpUs
 TwLQUq9dPl9CWM+RZzpmytKXvSxyRh+kEUSWlE+3RYDGoRyAkia1BuXqfsn7Zk2aBA6A
 0FaRXOt5d9Xm2nJPcnrjd3rLYVEokNQxzVIq+7hZPJATAiWbNck8UKIRvEcgJfytOdpN
 qdFQ==
X-Gm-Message-State: AO0yUKUQA36TS0ZfvrCepgKcaZnadHncc2YSBplQrK7tCwKT+MUkD32Q
 suM+r0X3HSErKmXY0jXQAxcl3w==
X-Google-Smtp-Source: AK7set+8MbPbDK5Ufuh95Meo92G5Ia3iRUr6iaxckrreKBUC0teNwdf7xxnXjzzyjJ3f8ZeA0evzSA==
X-Received: by 2002:a17:902:da83:b0:196:8d96:dc6b with SMTP id
 j3-20020a170902da8300b001968d96dc6bmr24043386plx.2.1676265703301; 
 Sun, 12 Feb 2023 21:21:43 -0800 (PST)
Received: from ?IPV6:2405:201:d019:c0a2:db4c:93fc:9135:d16f?
 ([2405:201:d019:c0a2:db4c:93fc:9135:d16f])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a170902ed1100b0019a73faf773sm5049724pld.71.2023.02.12.21.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Feb 2023 21:21:42 -0800 (PST)
Message-ID: <27d845c3-efe6-e337-1173-7b9a8db96c1b@ventanamicro.com>
Date: Mon, 13 Feb 2023 10:51:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] target/riscv: Smepmp: Skip applying default rules when
 address matches
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
Cc: qemu-devel@nongnu.org
References: <20230209055206.229392-1-hchauhan@ventanamicro.com>
 <5428dd5e-2772-2332-6b39-07a82e14e71b@linux.alibaba.com>
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
In-Reply-To: <5428dd5e-2772-2332-6b39-07a82e14e71b@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=hchauhan@ventanamicro.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.348,
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


On 13/02/23 09:52, LIU Zhiwei wrote:
>
> On 2023/2/9 13:52, Himanshu Chauhan wrote:
>> When MSECCFG.MML is set, after checking the address range in PMP if the
>> asked permissions are not same as programmed in PMP, the default
>> permissions are applied. This should only be the case when there
>> is no matching address is found.
>>
>> This patch skips applying default rules when matching address range
>> is found. It returns the index of the match PMP entry.
>>
>> fixes: 824cac681c3 (target/riscv: Fix PMP propagation for tlb)
>>
>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> ---
>>   target/riscv/pmp.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
>> index d85ad07caa..0dfdb35828 100644
>> --- a/target/riscv/pmp.c
>> +++ b/target/riscv/pmp.c
>> @@ -446,9 +446,12 @@ int pmp_hart_has_privs(CPURISCVState *env, 
>> target_ulong addr,
>>                   }
>>               }
>>   -            if ((privs & *allowed_privs) == privs) {
>> -                ret = i;
>> -            }
>> +            /*
>> +             * If matching address range was found, the protection bits
>> +             * defined with PMP must be used. We shouldn't fallback on
>> +             * finding default privileges.
>> +             */
>> +            ret = i;
>
> Notice the return value is the matching rule index, which includes
>
> 1) the address range is matching.
>
> 2) the permission of the PMP rule and the memory access type are 
> matching.
>
>
> So we can't simply remove the second check.  I think the right fix is:
>
>            if ((privs & *allowed_privs) == privs) {
>                 ret = i;
>  -         }
>  +         } else {
>  +        ret = -2;
>  +         }
>
> The -2 return value avoids finding the default privileges. And it 
> implies no matching rule is found.
>
> Zhiwei

Hi Zhiwei,

In case the address range is matched and MSECCFG.MML is set, the 
permission in *allowed_privs* are binding. So if the index matching is 
returned, the binding permissions are applied by the caller function.

Which case does my patch break?

- Himanshu

>
>>               break;
>>           }
>>       }

