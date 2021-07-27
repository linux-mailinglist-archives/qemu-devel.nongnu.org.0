Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F4C3D742D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 13:19:58 +0200 (CEST)
Received: from localhost ([::1]:40358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8L7t-0001cO-2c
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 07:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m8L6d-0000t5-Pe
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 07:18:39 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:37874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m8L6Y-0000Kd-6Z
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 07:18:35 -0400
Received: by mail-qk1-x730.google.com with SMTP id 129so11919700qkg.4
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 04:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WPkUY9ThgzmVQfP37Fi8iqzIqiggu8R1ExKwgUWm8lA=;
 b=tzYvpCoeS9Qs2w4C8oFnNgpDL7vMW7MPJ/0RL0hXGpIce3/ApmBgxaXmqaA01jZPmb
 YeaVjR2UqmSsTP+KjHWuH8+0fkZ7PUs6bA5XU7UXREVI/92HPbtC3h65mXa89aqWU7ef
 GFUNtmRIbX9Cn6oKivrkpc2+TjeA/fGJIySIwoObFETPsu/o/mdpFNY0muiriyXLA2Bu
 3HbtYzHpBd1MsCdAH/2aT7UtzxUKccOX/wIaDYceF6O4WxCgUrmt58tfzJG5W1cT4Hg6
 sMfBkxa5T8vQ6yZ0ZZO1vokRTlfbtzq6yZrKQZuW8d3HsWGJSi15s9nM90NUg/sVE2js
 X0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WPkUY9ThgzmVQfP37Fi8iqzIqiggu8R1ExKwgUWm8lA=;
 b=APEMrKc4ZXTWHIhOvjUZtgQqaQHga4M9jFLBNVtvXYRRi0sgKPGcU3ydvBjeMZPAaD
 3Zr2zskYBdnLebZH0GyvfaZ+pFE1W4TaPBHGPsKj3LWku6XhudiqRgGLOLH5NjHp+NhM
 clK/jXjTpWYYSPF2Ezsp+/yfVQ0LxKDDJpJ9CokQUWHIE9pNM0mS3WlEb8S511UgohW8
 s0APUJm4kGef8nc3ZuChImV7C5ep3lF80JLWy3x1GqjWOaoBYAdfuJiTrLD4jQddGhaL
 f0k6TlrXI9BIIzr97HVJTf3FDCBLLhyIJAPaC5qhd43yT6upp0wS7J+bQZBfeZBjDMYQ
 +hCg==
X-Gm-Message-State: AOAM533edxTjSDLD0XEZV5gCDQ7cptNPDQ49RbzG+67s+NHeBbHpI3LE
 LC7g4MCJCv4yqcN3qiqMIcU=
X-Google-Smtp-Source: ABdhPJzLFbchzAttBHgNl/y5DRoH2AsZeDOqR0rrwAqaSXjuVvbZw5zNNy8sCL75Zb02HFxsHH5KCA==
X-Received: by 2002:a05:620a:54c:: with SMTP id
 o12mr21946854qko.88.1627384713267; 
 Tue, 27 Jul 2021 04:18:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x7sm1524533qki.102.2021.07.27.04.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 04:18:32 -0700 (PDT)
Subject: Re: aarch64 efi boot failures with qemu 6.0+
To: "Michael S. Tsirkin" <mst@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <CAMj1kXEx1wqGJqTsNDNpBNLhFzn=kXmKFJ8m6AqZCPhfF1WC1g@mail.gmail.com>
 <20210727052516-mutt-send-email-mst@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b5b08783-4485-0d9c-0156-169675cf4aee@roeck-us.net>
Date: Tue, 27 Jul 2021 04:18:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727052516-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=groeck7@gmail.com; helo=mail-qk1-x730.google.com
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
 Bjorn Helgaas <bhelgaas@google.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/27/21 2:30 AM, Michael S. Tsirkin wrote:
> On Tue, Jul 27, 2021 at 09:04:20AM +0200, Ard Biesheuvel wrote:
>> On Tue, 27 Jul 2021 at 07:12, Guenter Roeck <linux@roeck-us.net> wrote:
>>>
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
>>>
>>
>> EFI creates the mappings primarily for itself, and up until DSM #5
>> started to be enforced, all PCI resource allocations that existed at
>> boot were ignored by Linux and recreated from scratch.
>>
>> Also, the commit in question looks dubious to me. I don't think it is
>> likely that Linux would fail to create a resource tree. What does
>> happen is that BARs get moved around, which may cause trouble in some
>> cases: for instance, we had to add special code to the EFI framebuffer
>> driver to copy with framebuffer BARs being relocated.
>>
>>> For my own testing, I simply reverted commit 0cf8882fd0 in my copy of
>>> qemu. That solves my immediate problem, giving us time to find a solution
>>> that is acceptable for everyone. After all, it doesn't look like anyone
>>> else has noticed the problem, so there is no real urgency.
>>>
>>
>> I would argue that it is better to revert that commit. DSM #5 has a
>> long history of debate and misinterpretation, and while I think we
>> ended up with something sane, I don't think we should be using it in
>> this particular case.
> 
> I think revert might make sense, however:
> 
> 0: No (The operating system shall not ignore the PCI configuration that firmware has done
> at boot time. However, the operating system is free to configure the devices in this hierarchy
> that have not been configured by the firmware. There may be a reduced level of hot plug
> capability support in this hierarchy due to resource constraints. This situation is the same as
> the legacy situation where this _DSM is not provided.)
> 
> ^^^^ does not this imply that reporting a 0 as we currently do
>       should be mostly a NOP?
> 
> 
> 1: Yes (The operating system may ignore the PCI configuration that the firmware has done
> at boot time, and reconfigure/rebalance the resources in the hierarchy.)
> 
> 
> So I am debating with myself whether this should be a plain revert or
> return 1 here:
>       /*
>        * 0 - The operating system must not ignore the PCI configuration that
>        *     firmware has done at boot time.
>        */
>       aml_append(ifctx1, aml_return(aml_int(0)));
> -    aml_append(ifctx, ifctx1);
> +    aml_append(ifctx1, aml_return(aml_int(1)));
>       aml_append(method, ifctx);
> 
> 
> 
> Guenter what happens if we return 1? Do things work well?
> 
Yes.

Guenter

