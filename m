Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE79064A18B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:41:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4j2H-0004JV-1Y; Mon, 12 Dec 2022 08:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p4j2E-0004JE-E0
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:39:58 -0500
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p4j2B-00054z-JJ
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:39:58 -0500
Received: by mail-oo1-xc2f.google.com with SMTP id
 g15-20020a4a894f000000b0047f8e899623so1788316ooi.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 05:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=g1YrmYDmJuCmClCgltFllDOmdiRQehOWurR91bzQkio=;
 b=EOI8ltcbeZ/iJrqXdzSKx6EyBB+DP1pRglkOwrOrDaEEiKetDgYJ5mkM5abDUqJhBs
 ySl0PIUkYRYlQmK99l7hSz3LqRaw+Bd0680fhrgo5yNkWTqAFvYggJifyPltbwyv6ZUO
 lVo4P5DYDQJ5sxaNrFpsoj/HjrUCVdWERRjVGnQCQlPB0VJcT2FgvkGW5wzS1y7TgNfg
 pQtR4IaUeErRq8hEcAE2+sFTqhseYvCnGJkqrjRADyfTNVJL/goJGG/9kf6tLtr/VN17
 m63qFOvEw+yR2uKBum6C2+QAyK/lNsVHhe8r1g56bgyW2TWOIo3gQ0A2JTu1/xFvZhAH
 96DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g1YrmYDmJuCmClCgltFllDOmdiRQehOWurR91bzQkio=;
 b=oSpCCHvp59KTdBJ4T+otqed1OrH61FGqGf120EzDSmUx8CRMoUWj9+kL3ljWYN/4wg
 nxawE4lSRYGgNO436gG/wWspoTrBlp6ezwzEfu68mJnousI9zdHmozk3f6LgjZgnbrnY
 GdPAH/9xRgKGrcCziUoPzGKD/5lBK96S6v8BU3qBwdjLQjI7BQJJ2E5pncOpsdqPhJtb
 P4YQiX12L3MHzNnt1EfhEpG3Vk1UnTBPFyB5BSQ5yJ6OJLj+yV+2kvGOVs/zw0Nuk/ff
 0amMbXmy9h33kQVtUs7hhSQufnUE9F2ELx5hIHNWPacm0KIPxt10qC227MZVVTJmeOUQ
 kNCA==
X-Gm-Message-State: ANoB5pm8/6dCeT1GQsavQdNwFTu3r78xWD8SbNDqi76iFBkGFqmg/F52
 YUhGJUEngaVQqsHVsYNxwnc=
X-Google-Smtp-Source: AA0mqf4J23fAX3UmGklSA75tDcwSXiZIgXe0s4WLLbDyVO4ZaN3LEdoywgiw4ZObJa+Bwfi140DVcA==
X-Received: by 2002:a4a:ddd9:0:b0:4a0:b7b9:f1f0 with SMTP id
 i25-20020a4addd9000000b004a0b7b9f1f0mr6678834oov.1.1670852393149; 
 Mon, 12 Dec 2022 05:39:53 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a4ad9c2000000b004a065c72a05sm3554163oou.2.2022.12.12.05.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 05:39:52 -0800 (PST)
Message-ID: <c09eaf86-f6b1-cc74-1732-e3c7576e9d88@roeck-us.net>
Date: Mon, 12 Dec 2022 05:39:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net> <Y5GPRiO0g2mgA3FS@cormorant.local>
 <Y5GbbF68N5ZiYNdv@cormorant.local> <20221208184740.GA3380017@roeck-us.net>
 <20221208201353.GA928427@roeck-us.net>
 <20221208203955.GA1367659@roeck-us.net> <Y5b7Mdtklu0xA5bJ@cormorant.local>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
In-Reply-To: <Y5b7Mdtklu0xA5bJ@cormorant.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=groeck7@gmail.com; helo=mail-oo1-xc2f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/12/22 01:58, Klaus Jensen wrote:
> On Dec  8 12:39, Guenter Roeck wrote:
>> On Thu, Dec 08, 2022 at 12:13:55PM -0800, Guenter Roeck wrote:
>>> On Thu, Dec 08, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:
>>>>>
>>>>> A cq head doorbell mmio is skipped... And it is not the fault of the
>>>>> kernel. The kernel is in it's good right to skip the mmio since the cq
>>>>> eventidx is not properly updated.
>>>>>
>>>>> Adding that and it boots properly on riscv. But I'm perplexed as to why
>>>>> this didnt show up on our regularly tested platforms.
>>>>>
>>>>> Gonna try to get this in for 7.2!
>>>>
>>>> I see another problem with sparc64.
>>>>
>>>> [    5.261508] could not locate request for tag 0x0
>>>> [    5.261711] nvme nvme0: invalid id 0 completed on queue 1
>>>>
>>>> That is seen repeatedly until the request times out. I'll test with
>>>> your patch to see if it resolves this problem as well, and will bisect
>>>> otherwise.
>>>>
>>> The second problem is unrelated to the doorbell problem.
>>> It is first seen in qemu v7.1. I'll try to bisect.
>>>
>>
>> Unfortunately, the problem observed with sparc64 also bisects to this
>> patch. Making things worse, "hw/nvme: fix missing cq eventidx update"
>> does not fix it (which is why I initially thought it was unrelated).
>>
>> I used the following qemu command line.
>>
>> qemu-system-sparc64 -M sun4v -cpu "TI UltraSparc IIi" -m 512 -snapshot \
>>      -device nvme,serial=foo,drive=d0,bus=pciB \
>>      -drive file=rootfs.ext2,if=none,format=raw,id=d0 \
>>      -kernel arch/sparc/boot/image -no-reboot \
>>      -append "root=/dev/nvme0n1 console=ttyS0" \
>>      -nographic -monitor none
>>
> 
> Hi Guenter,
> 
> Thank you very much for the detailed reports and I apologize for the
> fallout of this.
> 
> I think this is related to missing endian conversions when handling the
> shadow doorbells. I'm not sure if there is a kernel issue here as well,
> because as far as I can tell, the shadow doorbells are updated like so:
> 
>    old_value = *dbbuf_db;
>    *dbbuf_db = value;
> 
> (where `value` is the new head/tail value depending on if this is an sq
> or cq).
> 
> Keith, is the kernel doing something magically here I am not aware of,
> or isn't this missing some cpu_to_le32() / le32_to_cpu() calls as well?

Wouldn't that mean that nvme doorbell support would be broken in Linux
on all big endian systems ? Maybe it is, but it seems a bit unlikely.

Thanks,
Guenter


