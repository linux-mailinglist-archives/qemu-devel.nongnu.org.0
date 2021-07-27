Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79033D6DDD
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 07:13:43 +0200 (CEST)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8FPS-0007Ts-FY
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 01:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m8FOW-0006og-Iv
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 01:12:44 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m8FOU-0002Pi-P1
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 01:12:44 -0400
Received: by mail-qt1-x82d.google.com with SMTP id w10so8766356qtj.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 22:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7rmiDr/vuodBbJ6WxLeSUgUqgLd+TZh+BwaCgu1h0Bc=;
 b=hG/6OFx/c6r05wkJZMgMUH5AvLpRR+LaRzI7Y4v5CVgsRMaqAVRx8c4DtYZ2Vc4l8r
 iTQvsyiqEQTQdJccSOe60l8KBnyI7LLJ8l/PxUqmsBbefeHeXM/VUZ4j4XAdcFVyvjSe
 mgblWoKZToJShaTJAK2ZzpBtlGFUhx+tpgyIBhS+Y18LOXSibulgTfsPQBqBzZp7VJB9
 GnXNP6Wat/lp/fI0zV5KG53ugua59ieYryhAnOLTgRm4nAcyGcWllue2C9/byec8cHrf
 akWXb6/+/kgNky6rWUsScJ+cB5m0OUMOcuag6GZmy3wuSGbZfwMMW0ypn4bGoLhUXTnr
 mesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7rmiDr/vuodBbJ6WxLeSUgUqgLd+TZh+BwaCgu1h0Bc=;
 b=sy5px/2OU4txn6f4W4Fq44w20+lO7FhrFe0TRRAU0zGikX/mXBU1FGN6uIXB3Cj1Z8
 8U5bRsio52AvatinjBuv/uvv2RFI62XfNU/YQh6Rwc6sEc6FF0Bw7YqIWuqeEI3gdKJj
 NgeSJt6bd9usPTmjyVJ5Xml6qKiZhzBLaBdQDPxZSaPi6P1j54Uu0BL2O+ExDVycL3LF
 BSx+ZWbpXXC7H3vxYHuwOVaX6+AJT7oug2FjslAe6/YQtSvI+XaVy8bhCniM/ibAk0+2
 JKzXl7tdVbk84VOxledr7lY3biNORecsQiVHJgGg/SNx8b6wyYDW2qhTN1GtzHR1SfdS
 WXhw==
X-Gm-Message-State: AOAM5315VXU24kv+84rdgLy4RGpYAJnokMX46OcbIdJD7BFBHliAbclF
 bbIVvMgLA3AjgPvwpDuvd74=
X-Google-Smtp-Source: ABdhPJzrVvUvEIwrn6z2QzUydPndUG79gt1iahhukL1nTKXpO5MNQ1dqkkdtCaJjzdsfS8My6hRG+g==
X-Received: by 2002:ac8:6994:: with SMTP id o20mr18072262qtq.21.1627362761724; 
 Mon, 26 Jul 2021 22:12:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a132sm1179897qkg.55.2021.07.26.22.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 22:12:41 -0700 (PDT)
To: "Michael S. Tsirkin" <mst@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: aarch64 efi boot failures with qemu 6.0+
Message-ID: <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
Date: Mon, 26 Jul 2021 22:12:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727004401-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=groeck7@gmail.com; helo=mail-qt1-x82d.google.com
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

On 7/26/21 9:45 PM, Michael S. Tsirkin wrote:
> On Mon, Jul 26, 2021 at 06:00:57PM +0200, Ard Biesheuvel wrote:
>> (cc Bjorn)
>>
>> On Mon, 26 Jul 2021 at 11:08, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>
>>> On 7/26/21 12:56 AM, Guenter Roeck wrote:
>>>> On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
>>>>> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
>>>>>> work. Analysis shows that PCI devices with IO ports do not instantiate
>>>>>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
>>>>>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
>>>>>> affects
>>>>>> aarch64, not x86/x86_64.
>>>>>>
>>>>>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
>>>>>> keep firmware resource map"). Since this commit, PCI device BAR
>>>>>> allocation has changed. Taking tulip as example, the kernel reports
>>>>>> the following PCI bar assignments when running qemu v5.2.
>>>>>>
>>>>>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>>>>>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>>>>>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>
>> IIUC, these lines are read back from the BARs
>>
>>>>>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
>>>>>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
>>>>>> 0x10000000-0x1000007f]
>>>>>>
>>
>> ... and this is the assignment created by the kernel.
>>
>>>>>> With qemu v6.0, the assignment is reported as follows.
>>>>>>
>>>>>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>>>>>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>>>>>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>>>>>
>>
>> The problem here is that Linux, for legacy reasons, does not support
>> I/O ports <= 0x1000 on PCI, so the I/O assignment created by EFI is
>> rejected.
>>
>> This might make sense on x86, where legacy I/O ports may exist, but on
>> other architectures, this makes no sense.
> 
> 
> Fixing Linux makes sense but OTOH EFI probably shouldn't create mappings
> that trip up existing guests, right?
> 

I think it is difficult to draw a line. Sure, maybe EFI should not create
such mappings, but then maybe qemu should not suddenly start to enforce
those mappings for existing guests either.

For my own testing, I simply reverted commit 0cf8882fd0 in my copy of
qemu. That solves my immediate problem, giving us time to find a solution
that is acceptable for everyone. After all, it doesn't look like anyone
else has noticed the problem, so there is no real urgency.

Thanks,
Guenter

