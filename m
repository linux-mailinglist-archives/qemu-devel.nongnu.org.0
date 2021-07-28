Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6C83D900D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 16:06:23 +0200 (CEST)
Received: from localhost ([::1]:50498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8kCU-0005Zv-53
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 10:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m8k9u-0003Av-I0
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:03:42 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:36790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m8k9s-0008AL-GV
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:03:42 -0400
Received: by mail-qt1-x82a.google.com with SMTP id w10so1399549qtj.3
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 07:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wPRryln6SuRZCmFyxlQP12/WhmR2lTKUJTci+E1GqRA=;
 b=QGVVw6lsQMUKtHZtKOysmjuKZTAHkxLZS0kafaMfDZDwEkW9RaulwR7LQF4+BZ9vA2
 y0pm6TrsOEv0fV29T8PbSVhuVy76aYpgMUjBLxjuCy87b/E49m2LBU0Iscy1jWXFpTkd
 raK32DP1jZip2K44kEGWXdiCLSwJZK14wkxg4pm1yRHHufN+1d9cYq778Lw2DYr6XJtv
 0T00MOHm2e9qSv4nPRon2m1ts1wkq90t4JQhQs1aQIZmA1xJZBzfsDlDYRr0bN/lD/cD
 tQ4dyfCFthZZPWveqTsEPjhnB3rLD2kQ3unBnW4lpo8oq/NzOGc+yvfjKDGqeikxBTsK
 KA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wPRryln6SuRZCmFyxlQP12/WhmR2lTKUJTci+E1GqRA=;
 b=Gutd815M8tPRTRSk7HOV/oQKKcpFIztxlGii6u9U3rEZExHI6dYu8wtbrFZPDcSTZ4
 5HCt54WFRdC7QqIlYR8/9i9fKOES/PeQiTr8T2u2UvFXF/keJJ2xSTdElzsKJNsHp2an
 kE/eJjs3skWIUXnDK6ykrVVjMg5135kSIK02LYiT5/zhDNbQiq0mh1fN4NMy8mm3E99Q
 WWyrfYSkopoH2gV0JYbxRCb8TnuyG6qEs0sar07YQFYIaiRtAp/OTTvRs7Q8wpEQYbSD
 yToeNH0VHeJc7xH5niX8/mY3FthtBTOBSqCTXYdzNeQp24WsZnx1DYz2CqWM6wrOkJrg
 m/dw==
X-Gm-Message-State: AOAM530s6DU5MnPp6R/pURp9pbggi8JsfN4aEmW2woEIEbs+LT93Aiqk
 r3sNFMTOs2AhccVCH8nt690=
X-Google-Smtp-Source: ABdhPJzE8BOhc6luwIJa/dzvA79+IKg5nBqbTnQo2fvPas+qpDxWPREJPGiMTN2Bajb7tpl+jPtsRg==
X-Received: by 2002:ac8:c0d:: with SMTP id k13mr24360772qti.11.1627481018523; 
 Wed, 28 Jul 2021 07:03:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 n5sm29092qkp.116.2021.07.28.07.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 07:03:37 -0700 (PDT)
Subject: Re: aarch64 efi boot failures with qemu 6.0+
To: Ard Biesheuvel <ardb@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <20210727045315-mutt-send-email-mst@kernel.org>
 <20210727123603.6119c34c@redhat.com>
 <20210728090555-mutt-send-email-mst@kernel.org>
 <CAMj1kXFi43BiaG3pheqDLp_uqFpiS327mMaoc-NOt3HuoS5xsw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <80674caa-817a-8be0-2122-fe543ec08a50@roeck-us.net>
Date: Wed, 28 Jul 2021 07:03:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXFi43BiaG3pheqDLp_uqFpiS327mMaoc-NOt3HuoS5xsw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=groeck7@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jiahui Cen <cenjiahui@huawei.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, qemu-devel@nongnu.org,
 Bjorn Helgaas <bhelgaas@google.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 6:25 AM, Ard Biesheuvel wrote:
> On Wed, 28 Jul 2021 at 15:11, Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>> On Tue, Jul 27, 2021 at 12:36:03PM +0200, Igor Mammedov wrote:
>>> On Tue, 27 Jul 2021 05:01:23 -0400
>>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>>
>>>> On Mon, Jul 26, 2021 at 10:12:38PM -0700, Guenter Roeck wrote:
>>>>> On 7/26/21 9:45 PM, Michael S. Tsirkin wrote:
>>>>>> On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
>>>>>>> (cc Bjorn)
>>>>>>>
>>>>>>> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>>>>>
>>>>>>>> On 7/26/21 12:56 AM, Guenter Roeck wrote:
>>>>>>>>> On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
>>>>>>>>>> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
>>>>>>>>>>> Hi all,
>>>>>>>>>>>
>>>>>>>>>>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
>>>>>>>>>>> work. Analysis shows that PCI devices with IO ports do not instantiate
>>>>>>>>>>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
>>>>>>>>>>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
>>>>>>>>>>> affects
>>>>>>>>>>> aarch64, not x86/x86_64.
>>>>>>>>>>>
>>>>>>>>>>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
>>>>>>>>>>> keep firmware resource map"). Since this commit, PCI device BAR
>>>>>>>>>>> allocation has changed. Taking tulip as example, the kernel reports
>>>>>>>>>>> the following PCI bar assignments when running qemu v5.2.
>>>>>>>>>>>
>>>>>>>>>>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>>>>>>>>>>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>>>>>>>>>>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>>>>>>
>>>>>>> IIUC, these lines are read back from the BARs
>>>>>>>
>>>>>>>>>>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
>>>>>>>>>>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
>>>>>>>>>>> 0x10000000-0x1000007f]
>>>>>>>>>>>
>>>>>>>
>>>>>>> ... and this is the assignment created by the kernel.
>>>>>>>
>>>>>>>>>>> With qemu v6.0, the assignment is reported as follows.
>>>>>>>>>>>
>>>>>>>>>>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>>>>>>>>>>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>>>>>>>>>>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>>>>>>>>>>
>>>>>>>
>>>>>>> The problem here is that Linux, for legacy reasons, does not support
>>>>>>> I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI is
>>>>>>> rejected.
>>>>>>>
>>>>>>> This might make sense on x86, where legacy I/O ports may exist, but on
>>>>>>> other architectures, this makes no sense.
>>>>>>
>>>>>>
>>>>>> Fixing Linux makes sense but OTOH EFI probably shouldn't create mappings
>>>>>> that trip up existing guests, right?
>>>>>>
>>>>>
>>>>> I think it is difficult to draw a line. Sure, maybe EFI should not create
>>>>> such mappings, but then maybe qemu should not suddenly start to enforce
>>>>> those mappings for existing guests either.
>>>>
>>>> I would say both. But about QEMU actually I think you have a point here.
>>>> Re-reading the spec:
>>>>
>>>> 0: No (The operating system shall not ignore the PCI configuration that firmware has done
>>>> at boot time. However, the operating system is free to configure the devices in this hierarchy
>>>> that have not been configured by the firmware. There may be a reduced level of hot plug
>>>> capability support in this hierarchy due to resource constraints. This situation is the same as
>>>> the legacy situation where this _DSM is not provided.)
>>>> 1: Yes (The operating system may ignore the PCI configuration that the firmware has done
>>>> at boot time, and reconfigure/rebalance the resources in the hierarchy.)
>>>>
>>>>
>>>> I think I misread the spec previously, and understood it to mean that
>>>> 1 means must ignore. In fact 1 gives the most flexibility.
>>>> So why are we suddenly telling the guest it must not override
>>>> firmware?
>>>>
>>>> The commit log says
>>>>      The diffences could result in resource assignment failure.
>>>>
>>>> which is kind of vague ...
>>>>
>>>> Jiahui Cen, Igor, what do you think about it?
>>>> I'm inclined to revert 0cf8882fd06ba0aeb1e90fa6f23fce85504d7e14
>>>> at least for now.
>>> Looking at patch history, it seems consensus was that it's better to
>>> enforce firmware allocations.
>>>
>>> Also letting OS do as it pleases might break PCI devices that
>>> don't tolerate reallocation. ex: firmware initializes PCI device
>>> IO/BARs and then fetches ACPI tables, which get patched with
>>> assigned resources.
>>>
>>> to me returning 0 seems to be correct choice.
>>> In addition resource hinting also works via firmware allocations,
>>> if we revert the commit it might change those configs.
>>
>>
>> Well if firmware people now tell us their allocations were never
>> intended for guest OS use then maybe we should not intervene.
>>
> 
> DSM #5 was introduced to permit firmware running on x86_64 systems to
> boot 32-bit OSes (read Windows) unmodified, while still leaving
> enlightened, 64-bit OSes the opportunity to reorganize the BARs if
> there is sufficient space in the resource windows, and if the OS runs
> in long mode so it can address all of it.
> 
> This is why the default-if-absent according to the spec is '0', and I
> already explained up-thread why arm64 deviates from this.
> 
> But Igor has a point: there are cases where especially bus numbers
> should not be touched, as firmware tables consumed by the OS may carry
> b/d/f identifiers for things like SMMU pass through, where changing
> the bus numbers obviously invalidates this information.
> 
> These are exceptional cases, though, and I would argue that these
> should be considered individually, rather than setting DSM #5 to 0x0
> simply because there might be cases where not doing so could
> theoretically break things, given that doing so has proven to break
> things.
> 
> 
>> As others noted the original commit was kind of vague:
>>
>> 1. it said "Using _DSM #5 method to inform guest os not to ignore the PCI configuration
>> that firmware has done at boot time could handle the differences."
>> which is not what the spec says and not what the patch did -
>> guest os does not ignore configuration even without this,
>> it is just allowed to change it.
>>
>>
>> 2. is says could result but does not report whether that happened in the
>> field.
>>
>>
>> Given this causes a regression I'm inclined to just revert for now.
>> We can figure it out for the next release.
>>
> 
> For a revert of commit 0cf8882fd06ba0aeb1e90fa6f23fce85504d7e14, feel
> free to include
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> 

and:

Tested-by: Guenter Roeck <linux@roeck-us.net>

> and please also involve me if any future debates on this subject flare up again.
> 

Same here.

Thanks,
Guenter

