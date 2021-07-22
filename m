Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3CC3D1D56
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 07:24:50 +0200 (CEST)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6RCT-0006FL-Vi
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 01:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m6RAR-000487-SC
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 01:22:44 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:37613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1m6RAP-0001T5-Ot
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 01:22:43 -0400
Received: by mail-oi1-x229.google.com with SMTP id h9so5389615oih.4
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 22:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LarsdyXTxHCPPftAVMQj8F8uagwhB5jStN4ucs1eMQM=;
 b=gkeFH+UfLGAk0SkNejg8DU8T+Wv3AcideyHDWhcbJ+DE9Isj6mfs1xe+TgPBCPbgdL
 G9qZs6jGNqSL4F3TPgLajaVmYqrf8dqP86vcZfVkwruJHaSgTBJlT5XgrcETBdAELa+T
 kMQUu4AqtW+4LNj88SN2d7U8K3QsJ+A/DX2LaJIZRYuMzdeh17R2pDVL7+Y4fKcsY+B9
 3RdI9ENMopy2OXwIrzRsvhHgZRkmjj/8udCqlYheodjyNORi964ZoUlghAO/5mxqbuaU
 uCTfPnAsgYi7SWBG8d/v+k1WQ0u5D6N7Bsb1UR8dXiSfX8QH+J3p+jjxixcNhRz2oapS
 gncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=LarsdyXTxHCPPftAVMQj8F8uagwhB5jStN4ucs1eMQM=;
 b=BHp6dIxFaA1dEnfRp/44Ruf1Axzx3zP0vPuNH6Ci6kwFhyuynIgXMZa1VBf+0uK6R3
 Ov707d2vo/1iLItbi1UtO7AR8dPuMFYU6N4x2YVP84uNrSHY9M5J1V92tZh8G8yKqwcJ
 QGCwPWIOIWuRLbZsiHWyzoHNbhW9FX/goa5g2TdnWunSKPw4HpRVi4qUuXMWV92LJVbZ
 pz7Pg3LSYlCN1MqImL2DuxAOhKtcAsR6Rytwa0eBzz8VZIRuPYHJHYdoqRDnaSGf6COi
 yStzkmcU1FQRXtVztyaIzPErqwSTAiksLywVxdXiTQv2KjBV8ca9b7ABxxW5gAj/l23B
 3GbQ==
X-Gm-Message-State: AOAM531fkkLp0yrnOgJZSimcCC9Wddky/tCW+ZALc+zUzXxnokD3ME2b
 UZP3IyuygM8IbCUMMU/lc3A=
X-Google-Smtp-Source: ABdhPJxzXRfOKqKUa5r8wO+MIPmAmTpeW5WnUeQYJcFdP/0wf1dtcObFtSER8L5Do9rlwZsLcmvBFA==
X-Received: by 2002:a05:6808:aaf:: with SMTP id
 r15mr4710138oij.80.1626931359767; 
 Wed, 21 Jul 2021 22:22:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l29sm79840ooh.44.2021.07.21.22.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 22:22:39 -0700 (PDT)
Date: Wed, 21 Jul 2021 22:22:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH] acpi/gpex: Inform os to keep firmware resource map
Message-ID: <20210722052237.GA327218@roeck-us.net>
References: <20201217132926.4812-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217132926.4812-1-cenjiahui@huawei.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: xieyingtai@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Thu, Dec 17, 2020 at 09:29:26PM +0800, Jiahui Cen wrote:
> There may be some differences in pci resource assignment between guest os
> and firmware.
> 
> Eg. A Bridge with Bus [d2]
>     -+-[0000:d2]---01.0-[d3]----01.0
> 
>     where [d2:01.00] is a pcie-pci-bridge with BAR0 (mem, 64-bit, non-pref) [size=256]
>           [d3:01.00] is a PCI Device with BAR0 (mem, 64-bit, pref) [size=128K]
>                                           BAR4 (mem, 64-bit, pref) [size=64M]
> 
>     In EDK2, the Resource Map would be:
>         PciBus: Resource Map for Bridge [D2|01|00]
>         Type = PMem64; Base = 0x8004000000;     Length = 0x4100000;     Alignment = 0x3FFFFFF
>            Base = 0x8004000000; Length = 0x4000000;     Alignment = 0x3FFFFFF;  Owner = PCI [D3|01|00:20]
>            Base = 0x8008000000; Length = 0x20000;       Alignment = 0x1FFFF;    Owner = PCI [D3|01|00:10]
>         Type =  Mem64; Base = 0x8008100000;     Length = 0x100; Alignment = 0xFFF
> 
>     While in Linux, kernel will use 0x2FFFFFF as the alignment to calculate
>     the PMem64 size, which would be 0x6000000.
> 
> The diffences could result in resource assignment failure.
> 
> Using _DSM #5 method to inform guest os not to ignore the PCI configuration
> that firmware has done at boot time could handle the differences.
> 
> Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>

Since this patch is in qemu (ie starting with qemu v6.0), some of my qemu
tests booting aarch64 systems with efi bios no longer work. For example,
the following command fails to instantiate the Ethernet interface.

CMDLINE="root=/dev/vda console=ttyAMA0"
ROOTFS="rootfs.ext2"

qemu-system-aarch64 -M virt -kernel arch/arm64/boot/Image -no-reboot \
	-m 512 -cpu cortex-a57 -no-reboot \
	-device tulip,netdev=net0 -netdev user,id=net0 \
	-bios QEMU_EFI-aarch64.fd \
	-snapshot \
	-device virtio-blk-device,drive=d0 \
	-drive file=${ROOTFS},if=none,id=d0,format=raw \
	-nographic -serial stdio -monitor none \
	--append "${CMDLINE}"

QEMU_EFI-aarch64.fd is from https://retrage.github.io/edk2-nightly/.

Key difference is PCI BAR assignment.

good (qemu v5.2):

[    3.921801] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
[    3.922207] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
[    3.922505] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]
[    3.927111] pci 0000:00:01.0: BAR 0: assigned [io  0x1000-0x107f]
[    3.927455] pci 0000:00:01.0: BAR 1: assigned [mem 0x10000000-0x1000007f]

bad (qemu v6.0 and later):

[    3.922887] pci 0000:00:01.0: [1011:0019] type 00 class 0x020000
[    3.923278] pci 0000:00:01.0: reg 0x10: [io  0x0000-0x007f]
[    3.923451] pci 0000:00:01.0: reg 0x14: [mem 0x10000000-0x1000007f]

Reverting this patch fixes the problem.

Does this mean that I can no longer run aarch64 efi boot tests
with qemu v6.0 and later if the test involves PCI devices ?
Or is there some alternative command line which would still work ?

Thanks,
Guenter

