Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC13D7464
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 13:33:17 +0200 (CEST)
Received: from localhost ([::1]:46174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8LKm-0006FQ-Lv
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 07:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m8LJp-0005OP-NQ
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 07:32:17 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:42713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m8LJn-0001FQ-F8
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 07:32:17 -0400
Received: by mail-qt1-x834.google.com with SMTP id h27so9226207qtu.9
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 04:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kOzI8tGT9kNtGcMneYG20C6sa+VdkxqUdXmUY64I4Vo=;
 b=C/8VVsBsZVgeAbRLfUqmMtVTd35K2D6WGgEOEK9GeQYE8pW+N6tv9p30Qrrstk/cOh
 akazU9lYDX2YIOfbB32eRTVNWsYhnpt2w/UTAzrI89ZUjYysbnuRwhgYYAkQxK7l3dNh
 JpmW/mgly5c5Z5Q2W5cA4tYt2hublclZsNi2vwVuPpxsFS4f9wXRCv0h1o5AOiQnt20r
 GybEB7DCJHYZx2pkKYw5TddG7TlWkq0HIi8+oF4LHP0GV747SflXGbul5rjn7fZCHmJy
 oYH4YfdCw5Wr/DXFfWg3xVHb27g3bnmqOSq7cHTlMSljiY/vmgSGWDxZV1IcWTD7Dppa
 NRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kOzI8tGT9kNtGcMneYG20C6sa+VdkxqUdXmUY64I4Vo=;
 b=U7yR/RdbZ84l4vaGpNr6T59MPWzGKqEp8NgUqNqnEkCIaZJozNfMwiJZ0JJ9La4LVM
 wCSYztliN6khkEngtYI4g0s+UG99K0V23ofuqeaDM2E6ZT9RN2DsGfD0ut+RL+mN2DSd
 03OvfiHjp68aIWxcV6vvBBy1doZ2Aj2AO0HpZLCXOmLYsji82+0wOhFdKQNX5T7OT0wo
 0wyGIiGHXV8K/5BshayHR0VGUbyQbCiU+7V3oS5Rd15N/6CX/5D8zly5PujggP6746zS
 A6hzItgeJmuuyOdkQr9BN9eWk1PJH0V8xaTehzoMuTFb7nZeDOmNifbjJ4crY6zUsA1Z
 de5A==
X-Gm-Message-State: AOAM533mu7oAMhuesZoRgVS5Sso250kWiLHXikSOGaib8O7r18AdhHgf
 vy7wUDC9YQ859F7L7kwnfIw=
X-Google-Smtp-Source: ABdhPJzVJuLhhv6dwU8FwDXkn9EDNMbGZ2Qi8a0rqCesxb6iXEHMGBJk4gBRAWi4p6XcFex8NTgybw==
X-Received: by 2002:ac8:7f42:: with SMTP id g2mr18783442qtk.218.1627385534611; 
 Tue, 27 Jul 2021 04:32:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 h2sm1640961qkf.106.2021.07.27.04.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 04:32:14 -0700 (PDT)
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <20210727045315-mutt-send-email-mst@kernel.org>
 <20210727123603.6119c34c@redhat.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <a36dad2b-8e41-2275-bcb1-089318ea723e@roeck-us.net>
Date: Tue, 27 Jul 2021 04:32:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727123603.6119c34c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=groeck7@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.438,
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
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/21 3:36 AM, Igor Mammedov wrote:
> On Tue, 27 Jul 2021 05:01:23 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
>> On Mon, Jul 26, 2021 at 10:12:38PM -0700, Guenter Roeck wrote:
>>> On 7/26/21 9:45 PM, Michael S. Tsirkin wrote:
>>>> On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
>>>>> (cc Bjorn)
>>>>>
>>>>> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>>>
>>>>>> On 7/26/21 12:56 AM, Guenter Roeck wrote:
>>>>>>> On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
>>>>>>>> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
>>>>>>>>> Hi all,
>>>>>>>>>
>>>>>>>>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
>>>>>>>>> work. Analysis shows that PCI devices with IO ports do not instantiate
>>>>>>>>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
>>>>>>>>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
>>>>>>>>> affects
>>>>>>>>> aarch64, not x86/x86_64.
>>>>>>>>>
>>>>>>>>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
>>>>>>>>> keep firmware resource map"). Since this commit, PCI device BAR
>>>>>>>>> allocation has changed. Taking tulip as example, the kernel reports
>>>>>>>>> the following PCI bar assignments when running qemu v5.2.
>>>>>>>>>
>>>>>>>>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>>>>>>>>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>>>>>>>>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>>>>
>>>>> IIUC, these lines are read back from the BARs
>>>>>    
>>>>>>>>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
>>>>>>>>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
>>>>>>>>> 0x10000000-0x1000007f]
>>>>>>>>>    
>>>>>
>>>>> ... and this is the assignment created by the kernel.
>>>>>    
>>>>>>>>> With qemu v6.0, the assignment is reported as follows.
>>>>>>>>>
>>>>>>>>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>>>>>>>>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>>>>>>>>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>>>>>>>>    
>>>>>
>>>>> The problem here is that Linux, for legacy reasons, does not support
>>>>> I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI is
>>>>> rejected.
>>>>>
>>>>> This might make sense on x86, where legacy I/O ports may exist, but on
>>>>> other architectures, this makes no sense.
>>>>
>>>>
>>>> Fixing Linux makes sense but OTOH EFI probably shouldn't create mappings
>>>> that trip up existing guests, right?
>>>>    
>>>
>>> I think it is difficult to draw a line. Sure, maybe EFI should not create
>>> such mappings, but then maybe qemu should not suddenly start to enforce
>>> those mappings for existing guests either.
>>
>> I would say both. But about QEMU actually I think you have a point here.
>> Re-reading the spec:
>>
>> 0: No (The operating system shall not ignore the PCI configuration that firmware has done
>> at boot time. However, the operating system is free to configure the devices in this hierarchy
>> that have not been configured by the firmware. There may be a reduced level of hot plug
>> capability support in this hierarchy due to resource constraints. This situation is the same as
>> the legacy situation where this _DSM is not provided.)
>> 1: Yes (The operating system may ignore the PCI configuration that the firmware has done
>> at boot time, and reconfigure/rebalance the resources in the hierarchy.)
>>
>>
>> I think I misread the spec previously, and understood it to mean that
>> 1 means must ignore. In fact 1 gives the most flexibility.
>> So why are we suddenly telling the guest it must not override
>> firmware?
>>
>> The commit log says
>>      The diffences could result in resource assignment failure.
>>
>> which is kind of vague ...
>>
>> Jiahui Cen, Igor, what do you think about it?
>> I'm inclined to revert 0cf8882fd06ba0aeb1e90fa6f23fce85504d7e14
>> at least for now.
> Looking at patch history, it seems consensus was that it's better to
> enforce firmware allocations.
> 
> Also letting OS do as it pleases might break PCI devices that
> don't tolerate reallocation. ex: firmware initializes PCI device
> IO/BARs and then fetches ACPI tables, which get patched with
> assigned resources.
> 

On the other side, _not_ letting the OS do as it pleases _will_ break
PCI devices with don't meet OS requirements.

That makes me curious: There has been a lot of "may", "might", and
"could" associated with commit 0cf8882fd06b. Does anyone happen to
have a specific example of a problem that was actually fixed with
this patch ?

Thanks,
Guenter

> to me returning 0 seems to be correct choice.
> In addition resource hinting also works via firmware allocations,
> if we revert the commit it might change those configs.
> 
> me wonders if there is a way make enforcement per device.
> 
>>> For my own testing, I simply reverted commit 0cf8882fd0 in my copy of
>>> qemu. That solves my immediate problem, giving us time to find a solution
>>> that is acceptable for everyone. After all, it doesn't look like anyone
>>> else has noticed the problem, so there is no real urgency.
>>>
>>> Thanks,
>>> Guenter
>>
>> Well it's not like we have an army of testers, I think we should
>> treat each problem report seriously ...
>>
> 


