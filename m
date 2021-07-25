Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CB13D5080
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 00:57:31 +0200 (CEST)
Received: from localhost ([::1]:47020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7n3q-0002CU-Dh
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 18:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m7n2l-0001N9-8j
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 18:56:23 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:37480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m7n2i-0003Kv-TF
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 18:56:22 -0400
Received: by mail-qk1-x72b.google.com with SMTP id 129so7195470qkg.4
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 15:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2ShV4pau08gyAk2Erj6VCU/cDwED/FYRSfpNCx8PVu4=;
 b=R2M/cGAMmPBVk4dC4q0T1XRu/2JVDkw5UxZoD75f5zoc8pBGDuN+W9h6gQqV4iajhB
 e2YacOHmOeK8X8mYiQ7hFLGE4u1EM9VVlv1EiGAfQecM3Yw9njgV6pxwMYC4vcHUbYRH
 T9vbxeM2otH07MFgMgzbKEmbF0JCHwe9Z66Nq+UxB8z+UCH9BqBlcaTvdlTHlwKu/W+z
 01Xdr4QYmEXi3AhIiR6JQ53nuYlAAl6UybZ3f6zaymAkcEkuptBMfnFihaETzds8LDjK
 KosTmCbfzpdcq2bCZh4IJx97FoyfAWCkUO15KKxM3TCiLA7X8L/fes4wCrHYw9C8P6Qq
 fzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2ShV4pau08gyAk2Erj6VCU/cDwED/FYRSfpNCx8PVu4=;
 b=Qus6nTGZFaCIvah6Urqhf5pv4OGGE/NZ3HRZ2c10lZA5jmZV7M89kSbg6zZ4mCEB4+
 WKoZrA6qTUa456WNznd96OEIT5Rzel2RNoXI1xmOA9YeuxIpSEC/5LM7OYk7LUuwAFwp
 pzEz9OLhYFKg23UDYPT4CVND/vBftp0UoWcR9eIy7m9FusqU0HeevpWre3xijZVA/zMX
 5Rb+Cv+RMVVyOUiaTmsgqVVjdVKknwTG0WUEQyXpA/JamoImiyHS9ZsUMhtSjNm7jLIv
 cRIPQCmh+nstrBk0NnE6fqihPlB5hoaANO37XZdDUnt3BWjuF3K3XL5PoFK8+o4Sn+nt
 ts8A==
X-Gm-Message-State: AOAM531JkoEfIcXhK2bT4a+GZseplHKgL1mJuwAsIduQrmFLb4weJ6SD
 /UkHID+mPqnWvigvw04oiXw=
X-Google-Smtp-Source: ABdhPJxcQAvBUoegfEKtSb397M5E0FrPG6vxgg7TDmWOJwJA4AvFkMaSKDv9ZXW/YOoTTJa66X7CaA==
X-Received: by 2002:ae9:f213:: with SMTP id m19mr15397525qkg.449.1627253779336; 
 Sun, 25 Jul 2021 15:56:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 8sm17168590qkb.105.2021.07.25.15.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 15:56:18 -0700 (PDT)
Subject: Re: aarch64 efi boot failures with qemu 6.0+
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
Date: Sun, 25 Jul 2021 15:56:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725181334-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=groeck7@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/21 3:14 PM, Michael S. Tsirkin wrote:
> On Sat, Jul 24, 2021 at 11:52:34AM -0700, Guenter Roeck wrote:
>> Hi all,
>>
>> starting with qemu v6.0, some of my aarch64 efi boot tests no longer
>> work. Analysis shows that PCI devices with IO ports do not instantiate
>> in qemu v6.0 (or v6.1-rc0) when booting through efi. The problem affects
>> (at least) ne2k_pci, tulip, dc390, and am53c974. The problem only affects
>> aarch64, not x86/x86_64.
>>
>> I bisected the problem to commit 0cf8882fd0 ("acpi/gpex: Inform os to
>> keep firmware resource map"). Since this commit, PCI device BAR
>> allocation has changed. Taking tulip as example, the kernel reports
>> the following PCI bar assignments when running qemu v5.2.
>>
>> [    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>> [    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>> [    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>> [    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
>> [    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem 0x10000000-0x1000007f]
>>
>> With qemu v6.0, the assignment is reported as follows.
>>
>> [    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
>> [    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
>> [    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
>>
>> and the controller does not instantiate. The problem disapears after
>> reverting commit 0cf8882fd0.
>>
>> Attached is a summary of test runs with various devices and qemu v5.2
>> as well as qemu v6.0, and the command line I use for efi boots.
>>
>> Did commit 0cf8882fd0 introduce a bug, do I now need need some different
>> command line to instantiate PCI devices with io ports, or are such devices
>> simply no longer supported if the system is booted with efi support ?
>>
>> Thanks,
>> Guenter
> 
> 
> So that commit basically just says don't ignore what efi did.
> 
> The issue's thus likely efi.
> 

I don't see the problem with efi boots on x86 and x86_64.
Any idea why that might be the case ?

Thanks,
Guenter

> Cc the maintainer. Philippe can you comment pls?
> 
>> ---
>> Command line (tulip network interface):
>>
>> CMDLINE="root=/dev/vda console=ttyAMA0"
>> ROOTFS="rootfs.ext2"
>>
>> qemu-system-aarch64 -M virt -kernel arch/arm64/boot/Image -no-reboot \
>>          -m 512 -cpu cortex-a57 -no-reboot \
>>          -device tulip,netdev=net0 -netdev user,id=net0 \
>>          -bios QEMU_EFI-aarch64.fd \
>>          -snapshot \
>>          -device virtio-blk-device,drive=d0 \
>>          -drive file=${ROOTFS},if=none,id=d0,format=raw \
>>          -nographic -serial stdio -monitor none \
>>          --append "${CMDLINE}"
>>
>> ---
>> Boot tests with various devices known to work in qemu v5.2.
>>
>> 		v5.2	v6.0	v6.0
>> 		efi	non-efi	efi
>> e1000		pass	pass	pass
>> e1000-82544gc	pass	pass	pass
>> e1000-82545em	pass	pass	pass
>> e1000e		pass	pass	pass
>> i82550		pass	pass	pass
>> i82557a		pass	pass	pass
>> i82557b		pass	pass	pass
>> i82557c		pass	pass	pass
>> i82558a		pass	pass	pass
>> i82559b		pass	pass	pass
>> i82559c		pass	pass	pass
>> i82559er	pass	pass	pass
>> i82562		pass	pass	pass
>> i82801		pass	pass	pass
>> ne2k_pci	pass	pass	fail	<--
>> pcnet		pass	pass	pass
>> rtl8139		pass	pass	pass
>> tulip		pass	pass	fail	<--
>> usb-net		pass	pass	pass
>> virtio-net-device
>> 		pass	pass	pass
>> virtio-net-pci	pass	pass	pass
>> virtio-net-pci-non-transitional
>> 		pass	pass	pass
>>
>> usb-xhci	pass	pass	pass
>> usb-ehci	pass	pass	pass
>> usb-ohci	pass	pass	pass
>> usb-uas-xhci	pass	pass	pass
>> virtio		pass	pass	pass
>> virtio-blk-pci	pass	pass	pass
>> virtio-blk-device
>> 		pass	pass	pass
>> nvme		pass	pass	pass
>> sdhci		pass	pass	pass
>> dc390		pass	pass	fail	<--
>> am53c974	pass	pass	fail	<--
>> lsi53c895ai	pass	pass	pass
>> mptsas1068	pass	pass	pass
>> lsi53c810	pass	pass	pass
>> megasas		pass	pass	pass
>> megasas-gen2	pass	pass	pass
>> virtio-scsi-device
>> 		pass	pass	pass
>> virtio-scsi-pci	pass	pass	pass
> 


