Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 963723D562C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 11:09:13 +0200 (CEST)
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7wbo-0000YV-Mn
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 05:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m7wao-0008JQ-NT
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:08:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m7wak-0002pb-Lh
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 05:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627290485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sEXqiUxyznBZKI93GCz3ceIZDvcelH3+T2UicaZhGoo=;
 b=H9GI5m3tujgz/f49WOwm1nvbttM4QAnHja9SPCxyELi2oRY3iEEphgw2VSt+EsZqAIZtZg
 x6xtGfpsxoUG5V9yMf5nvO6LQ07CQLFnvOUrNiii56ZssHOJI7I7wT51dBETYvaOi3kHL8
 yRn4WAEtdUd1zi4THxRWfU1gwsCMXXc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-0Q3uSJ6KNbK6P_9oR0qA-A-1; Mon, 26 Jul 2021 05:08:03 -0400
X-MC-Unique: 0Q3uSJ6KNbK6P_9oR0qA-A-1
Received: by mail-wm1-f72.google.com with SMTP id
 j4-20020a05600c1c04b02902529df18d36so185710wms.6
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 02:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sEXqiUxyznBZKI93GCz3ceIZDvcelH3+T2UicaZhGoo=;
 b=jtVjNa1gLUgxIPKSC2lYQwYsJZ5FGx8OLbz8XDycQN1nVID9QLr2elzVop/J/WEhi7
 fynafwclvp772ocAMbJGn/U0nGRA0sWL9e0egnvxa1PyjTxbVDV0AUnLpRkqtpE6PFMD
 rVpO0leovP0nkruWXRSJGiPAfFKXe9J2m3BAVpERld2M2iLPboqSkeSe3Eiz/7sLyrXr
 9tHR/GV7365Zxcwtge3LW81tvJlUbzxX7cyO5Yxe6pQ8SilY/v5Ur4RyAjfvstuSXYBs
 js+k1Nwkc19LNEGUrGUO/B1E66QZIznVdK+c5XcRI6PvKWWnz0O/QKHBwxiiVDXHTaUh
 dkAg==
X-Gm-Message-State: AOAM530W+rXdHYYxb7U3ge33vGi6zcvDvUJ6aNHyufJklgvNr9eUoPIq
 jd881ApzfphTxEbW8B01mjmzhM6t8iR5/DYvRHFyoAmicy8LmADO3uZB+M1jtQBTJgzU3y0xTjF
 8AqZ23naahiZ1dqk=
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr15616552wmj.80.1627290482609; 
 Mon, 26 Jul 2021 02:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPS7b7ttQIHU8bY5o3+GoEKEr+lrGWr+LzDDUU2kA2BJTMZNKbugpt+ZgXZi7UVJuCOIxeDA==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr15616532wmj.80.1627290482369; 
 Mon, 26 Jul 2021 02:08:02 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id u2sm13823424wmm.37.2021.07.26.02.08.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 02:08:01 -0700 (PDT)
Subject: Re: aarch64 efi boot failures with qemu 6.0+
To: Guenter Roeck <linux@roeck-us.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ard Biesheuvel <ardb+tianocore@kernel.org>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
Date: Mon, 26 Jul 2021 11:08:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.091, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, Jiahui Cen <cenjiahui@huawei.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/26/21 12:56 AM, Guenter Roeck wrote:
> On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
>> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
>>> Hi all,
>>>
>>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
>>> work. Analysis shows that PCI devices with IO ports do not instantiate
>>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
>>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only
>>> affects
>>> aarch64, not x86/x86_64.
>>>
>>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
>>> keep firmware resource map"). Since this commit, PCI device BAR
>>> allocation has changed. Taking tulip as example, the kernel reports
>>> the following PCI bar assignments when running qemu v5.2.
>>>
>>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
>>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem
>>> 0x10000000-0x1000007f]
>>>
>>> With qemu v6.0, the assignment is reported as follows.
>>>
>>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>>
>>> and the controller does not instantiate. The problem disapears after
>>> reverting commit 0cf8882fd0.
>>>
>>> Attached is a summary of test runs with various devices and qemu v5.2
>>> as well as qemu v6.0, and the command line I use for efi boots.
>>>
>>> Did commit 0cf8882fd0 introduce a bug, do I now need need some different
>>> command line to instantiate PCI devices with io ports, or are such
>>> devices
>>> simply no longer supported if the system is booted with efi support ?
>>>
>>> Thanks,
>>> Guenter
>>
>>
>> So that commit basically just says don't ignore what efi did.
>>
>> The issue's thus likely efi.
>>
> 
> I don't see the problem with efi boots on x86 and x86_64.
> Any idea why that might be the case ?
> 
> Thanks,
> Guenter
> 
>> Cc the maintainer. Philippe can you comment pls?

I'll have a look. Cc'ing Ard for EDK2/Aarch64.

>>
>>> ---
>>> Command line (tulip network interface):
>>>
>>> CMDLINE="root=/dev/vda console=ttyAMA0"
>>> ROOTFS="rootfs.ext2"
>>>
>>> qemu-system-aarch64 -M virt -kernel arch/arm64/boot/Image -no-reboot \
>>>          -m 512 -cpu cortex-a57 -no-reboot \
>>>          -device tulip,netdev=net0 -netdev user,id=net0 \
>>>          -bios QEMU_EFI-aarch64.fd \
>>>          -snapshot \
>>>          -device virtio-blk-device,drive=d0 \
>>>          -drive file=${ROOTFS},if=none,id=d0,format=raw \
>>>          -nographic -serial stdio -monitor none \
>>>          --append "${CMDLINE}"
>>>
>>> ---
>>> Boot tests with various devices known to work in qemu v5.2.
>>>
>>>         v5.2    v6.0    v6.0
>>>         efi    non-efi    efi
>>> e1000        pass    pass    pass
>>> e1000-82544gc    pass    pass    pass
>>> e1000-82545em    pass    pass    pass
>>> e1000e        pass    pass    pass
>>> i82550        pass    pass    pass
>>> i82557a        pass    pass    pass
>>> i82557b        pass    pass    pass
>>> i82557c        pass    pass    pass
>>> i82558a        pass    pass    pass
>>> i82559b        pass    pass    pass
>>> i82559c        pass    pass    pass
>>> i82559er    pass    pass    pass
>>> i82562        pass    pass    pass
>>> i82801        pass    pass    pass
>>> ne2k_pci    pass    pass    fail    <--
>>> pcnet        pass    pass    pass
>>> rtl8139        pass    pass    pass
>>> tulip        pass    pass    fail    <--
>>> usb-net        pass    pass    pass
>>> virtio-net-device
>>>         pass    pass    pass
>>> virtio-net-pci    pass    pass    pass
>>> virtio-net-pci-non-transitional
>>>         pass    pass    pass
>>>
>>> usb-xhci    pass    pass    pass
>>> usb-ehci    pass    pass    pass
>>> usb-ohci    pass    pass    pass
>>> usb-uas-xhci    pass    pass    pass
>>> virtio        pass    pass    pass
>>> virtio-blk-pci    pass    pass    pass
>>> virtio-blk-device
>>>         pass    pass    pass
>>> nvme        pass    pass    pass
>>> sdhci        pass    pass    pass
>>> dc390        pass    pass    fail    <--
>>> am53c974    pass    pass    fail    <--
>>> lsi53c895ai    pass    pass    pass
>>> mptsas1068    pass    pass    pass
>>> lsi53c810    pass    pass    pass
>>> megasas        pass    pass    pass
>>> megasas-gen2    pass    pass    pass
>>> virtio-scsi-device
>>>         pass    pass    pass
>>> virtio-scsi-pci    pass    pass    pass
>>
> 


