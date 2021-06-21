Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339FF3AEE17
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:23:28 +0200 (CEST)
Received: from localhost ([::1]:33342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvMhr-0005eV-9K
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lvMgx-0004iK-9R
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:22:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1lvMgv-0003UK-2r
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624292548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Bx3vMxLZBJyDz3aZpW0Yg6CM8us6oYWfc8gePlsU6nw=;
 b=AHP2yfF9LgUfIj0ixV9eIt0bZixG/wxSNj3mh8aEoIZ99qLC1mLgkn4p+J/8Xm8VGTZDA+
 lcIWqVrxCsRgxpgxISugBGw92OP3PfhFXj2NGwsFAPyM8mfHYc7GYqccloz/8/Sk/69dhk
 Zblz2J80WyhQGxmm2T/bQZ/hlZLQ4GI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-DNuoL8u0NJ2sEhfUmUHVAQ-1; Mon, 21 Jun 2021 12:22:24 -0400
X-MC-Unique: DNuoL8u0NJ2sEhfUmUHVAQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 l13-20020adfe9cd0000b0290119a0645c8fso8623697wrn.8
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Bx3vMxLZBJyDz3aZpW0Yg6CM8us6oYWfc8gePlsU6nw=;
 b=slCdJ1j/ifQG2hoUhU9da8ya4v11bPrxaGz7PbGJNkj0SjCI/y922ho6yCdkQB2ORV
 oZVjAWisGj1Uwn+c1eABCw/SqHmWOuII2qWtvrgufxrZ7JdNChqh967en1h40lma6eh0
 i7nXSKnIzGaUFnLRHQFEvNnXTkoU69Lwp64qJ5F+q3pbgByenXD/jnEcSrSViokK6COx
 z38ALbowxW9SZoY2r7n14XWOMhN4QM/vgylfuEqbhPIh3uVRYFlZwpAoQ3tMMWguYrsl
 r0BdRZyd9uLnh7qNjauV0I6TCq0wOB9Rgedf/NLjN2lVaAbKIy979bNh7GMeDBissqn/
 mB6Q==
X-Gm-Message-State: AOAM532p+uZ9ASmpRQEBRWBZxKEg2NhPZGMjsdfGErKfDjF0jENPsk17
 0000APkqCcU6om9rh5NUBSskFouUkso6taIc5gqkOS+TuC5YmYE6gk56mt+zE1515MhX0donrJd
 K5c0i5DGvf0mo9z0=
X-Received: by 2002:a05:600c:5112:: with SMTP id
 o18mr27316500wms.15.1624292542280; 
 Mon, 21 Jun 2021 09:22:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVhmSQDcUHPJzm3RRj19kZVyAYsSXMqBqLoI3L6rBac6HosI4ge3LjLrRm3cxdEzsHzRyoeQ==
X-Received: by 2002:a05:600c:5112:: with SMTP id
 o18mr27316472wms.15.1624292542043; 
 Mon, 21 Jun 2021 09:22:22 -0700 (PDT)
Received: from [192.168.43.95] ([37.173.110.237])
 by smtp.gmail.com with ESMTPSA id r1sm17697062wmh.32.2021.06.21.09.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 09:22:21 -0700 (PDT)
To: cenjiahui@huawei.com, qemu list <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Ard Biesheuvel <ardb@kernel.org>,
 Xingang Wang <wangxingang5@huawei.com>
From: Eric Auger <eauger@redhat.com>
Subject: QEMU PCIe expander bridge with 64kB page guest -> guest BUG_ON()
Message-ID: <1811f735-3426-08c0-ee86-b410b632efb5@redhat.com>
Date: Mon, 21 Jun 2021 18:22:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jiahui,

I noticed the PCIe expander bridge + PCIe root port does not work with a
64kB page guest. One hits a kernel BUG at mm/vmalloc.c:96
(BUG_ON(!pte_none(*pte));)! This happens with an upstream guest.

I understand this happens on pci_remap_iospace when handling the Io16
regions below. Wonder if the edk2 code could be the source (I saw you
write both the edk2 and the qemu part [edk2-devel] [PATCH v2 0/4] Add
extra pci roots support for Arm).

Please could give me a hand?

Best Regards

Eric


Sample qemu cmd options:

-device pxb-pcie,bus_nr=4,id=bridge,bus=pcie.0 \
-device pcie-root-port,bus=bridge,chassis=4,id=pcie.11 \
-device virtio-net-pci,bus=pcie.11,netdev=nic0,mac=6a:f5:10:b1:3d:d2
-netdev
tap,id=nic0,script=/home/augere/TEST/SCRIPTS/qemu-ifup,downscript=/home/augere/TEST/SCRIPTS/qemu-ifdown


[    2.867734] ACPI: PCI Root Bridge [PCFE] (domain 0000 [bus fe-ff])
[    2.869339] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM
ClockPM Segments MSI EDR HPX-Type3]
[    2.871405] acpi PNP0A08:00: _OSC: platform does not support [LTR DPC]
[    2.873226] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME
AER PCIeCapability]
[    2.875609] acpi PNP0A08:00: ECAM area [mem
0x401fe00000-0x401fffffff] reserved by PNP0C02:00
[    2.877830] acpi PNP0A08:00: ECAM at [mem 0x401fe00000-0x401fffffff]
for [bus fe-ff]
phys_addr=0x3eff3000
[    2.884036] ------------[ cut here ]------------
[    2.885249] kernel BUG at mm/vmalloc.c:96!
[    2.886322] Internal error: Oops - BUG: 0 [#1] SMP
[    2.887560] Modules linked in:
[    2.888352] CPU: 7 PID: 1 Comm: swapper/0 Not tainted
5.13.0-rc6-guest-64K+ #57
[    2.890216] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0
02/06/2015
[    2.891983] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
[    2.893519] pc : vmap_range+0x1d8/0x208
[    2.894600] lr : vmap_range+0x38/0x208
[    2.895615] sp : fffffe0012c2f7f0
[    2.896517] x29: fffffe0012c2f7f0 x28: fffffffefe800000 x27:
fffffffefe801000
[    2.898437] x26: ffffffff20070000 x25: 00000001407f0000 x24:
0140000000000000
[    2.900357] x23: fffffe001134ffb8 x22: 000000000000003f x21:
0068000000000717
[    2.902284] x20: 000000003eff3000 x19: fffffffefe801000 x18:
0000000000000010
[    2.904236] x17: 0000000000000000 x16: 0000000000000001 x15:
ffffffffffffffff
[    2.906157] x14: 695f70616d65725f x13: 696370202a2a2a2a x12:
fffffe0011c77150
[    2.908084] x11: 0000000000000003 x10: fffffe0011bb7110 x9 :
fffffe0010d33ad4
[    2.909996] x8 : 00000000000bffe8 x7 : c0000000ffff7fff x6 :
0000000000000001
[    2.911323] x5 : 0000000000000000 x4 : 000000003eff0000 x3 :
0000000000001ff7
[    2.912631] x2 : 0040000000000001 x1 : fffffc07f4080038 x0 :
fffffc07ffbecdc0
[    2.913951] Call trace:
[    2.914398]  vmap_range+0x1d8/0x208
[    2.915363]  ioremap_page_range+0x20/0x30
[    2.916453]  pci_remap_iospace+0xcc/0xf0
[    2.917519]  acpi_pci_probe_root_resources+0x244/0x268
[    2.918907]  pci_acpi_root_prepare_resources+0x28/0xc8
[    2.920281]  acpi_pci_root_create+0x9c/0x2f8
[    2.921443]  pci_acpi_scan_root+0x14c/0x230
[    2.922574]  acpi_pci_root_add+0x268/0x5c0
[    2.923710]  acpi_bus_attach+0x15c/0x2c0
[    2.924794]  acpi_bus_attach+0x9c/0x2c0
[    2.925833]  acpi_bus_attach+0x9c/0x2c0
[    2.926881]  acpi_bus_scan+0x64/0x118
[    2.927875]  acpi_scan_init+0x10c/0x25c
[    2.928922]  acpi_init+0x3e8/0x458
[    2.929847]  do_one_initcall+0x54/0x268
[    2.930879]  kernel_init_freeable+0x290/0x344
[    2.932068]  kernel_init+0x1c/0x128
[    2.933017]  ret_from_fork+0x10/0x18
[    2.934005] Code: a90687e2 97f518e5 a94687e2 17ffffe4 (d4210000)
[    2.935673] ---[ end trace 1d687ce361e3e7ca ]---
[    2.936922] Kernel panic - not syncing: Oops - BUG: Fatal exception
[    2.938611] SMP: stopping secondary CPUs
[    2.939760] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal
exception ]---


At EDK2 level I have:

PciBus: Resource Map for Root Bridge PciRoot(0x0)^M
Type =   Io16; Base = 0x0;      Length = 0x3000;        Alignment = 0xFFF^M
   Base = 0x0;  Length = 0x200; Alignment = 0xFFF;      Owner = PPB
[00|02|02:**]^M
   Base = 0x1000;       Length = 0x200; Alignment = 0xFFF;      Owner =
PPB [00|02|01:**]^M
   Base = 0x2000;       Length = 0x200; Alignment = 0xFFF;      Owner =
PPB [00|02|00:**]^M
Type =  Mem32; Base = 0x10000000;       Length = 0x700000;
Alignment = 0x1FFFFF^M
   Base = 0x10000000;   Length = 0x200000;      Alignment = 0x1FFFFF;
Owner = PPB [00|02|02:**]^M
   Base = 0x10200000;   Length = 0x200000;      Alignment = 0x1FFFFF;
Owner = PPB [00|02|01:**]^M
   Base = 0x10400000;   Length = 0x200000;      Alignment = 0x1FFFFF;
Owner = PPB [00|02|00:**]^M
   Base = 0x10600000;   Length = 0x1000;        Alignment = 0xFFF;
Owner = PPB [00|02|02:10]^M
   Base = 0x10601000;   Length = 0x1000;        Alignment = 0xFFF;
Owner = PPB [00|02|01:10]^M
   Base = 0x10602000;   Length = 0x1000;        Alignment = 0xFFF;
Owner = PPB [00|02|00:10]^M
Type =  Mem64; Base = 0x8000000000;     Length = 0x200000;
Alignment = 0xFFFFF^M
   Base = 0x8000000000; Length = 0x100000;      Alignment = 0xFFFFF;
Owner = PPB [00|02|01:**]; Type = PMem64^M
   Base = 0x8000100000; Length = 0x100000;      Alignment = 0xFFFFF;
Owner = PPB [00|02|02:**]; Type = PMem64^M


PciBus: Resource Map for Root Bridge PciRoot(0x4)^M
Type =   Io16; Base = 0x3000;   Length = 0x1000;        Alignment = 0xFFF^M
   Base = 0x3000;       Length = 0x200; Alignment = 0xFFF;      Owner =
PPB [04|00|00:**]^M
Type =  Mem32; Base = 0x10800000;       Length = 0x300000;
Alignment = 0x1FFFFF^M
   Base = 0x10800000;   Length = 0x200000;      Alignment = 0x1FFFFF;
Owner = PPB [04|00|00:**]^M
   Base = 0x10A00000;   Length = 0x1000;        Alignment = 0xFFF;
Owner = PPB [04|00|00:10]^M
^M
PciBus: Resource Map for Bridge [04|00|00]^M
Type =   Io16; Base = 0x3000;   Length = 0x200; Alignment = 0xFFF^M
   Base = Padding;      Length = 0x200; Alignment = 0x1FF^M
Type =  Mem32; Base = 0x10800000;       Length = 0x200000;
Alignment = 0x1FFFFF^M
   Base = Padding;      Length = 0x200000;      Alignment = 0x1FFFFF^M
Type =  Mem32; Base = 0x10A00000;       Length = 0x1000;
Alignment = 0xFFF^M


