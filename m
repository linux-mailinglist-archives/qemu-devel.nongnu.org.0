Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54CE62E753
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 22:53:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovmnl-0004H0-UZ; Thu, 17 Nov 2022 16:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1ovmnj-0004Gc-3O
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 16:52:03 -0500
Received: from mailout06.t-online.de ([194.25.134.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1ovmnh-0005MJ-4w
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 16:52:02 -0500
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout06.t-online.de (Postfix) with SMTP id 0C1C1178EA;
 Thu, 17 Nov 2022 22:51:55 +0100 (CET)
Received: from [192.168.211.200] ([84.175.228.229]) by fwd85.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1ovmnT-0mBxQX0; Thu, 17 Nov 2022 22:51:47 +0100
Message-ID: <d1e1b4a5-1200-dad7-4e82-eacdbd71b92d@t-online.de>
Date: Thu, 17 Nov 2022 22:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PULL v4 46/83] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML
 routines and let bus ennumeration generate AML
To: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-47-mst@redhat.com>
Content-Language: en-US
In-Reply-To: <20221107224600.934080-47-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1668721907-2E8B5EA1-6CCCAC03/0/0 CLEAN NORMAL
X-TOI-MSGID: d3db0adf-eefd-439e-a80a-fd45eac9e7e1
Received-SPF: none client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

> From: Igor Mammedov<imammedo@redhat.com>
>
> PCI-ISA bridges that are built in PIIX/Q35 are building its own AML
> using AcpiDevAmlIf interface. Now build_append_pci_bus_devices()
> gained AcpiDevAmlIf interface support to get AML of devices atached
> to PCI slots.
> So drop ad-hoc build_q35_isa_bridge()/build_piix4_isa_bridge()
> and let PCI bus enumeration to include PCI-ISA bridge AML
> when it's enumerated by build_append_pci_bus_devices().
>
> AML change is mostly contextual, which moves whole ISA hierarchy
> directly under PCI host bridge instead of it being described
> as separate \SB.PCI0.ISA block.
>
> Note:
> If bus/slot that hosts ISA bridge has BSEL set, it will gain new
> ASUN and _DMS entries (i.e. acpi-index support, but it should not
> cause any functional change and that is fine from PCI Firmware
> spec point of view), potentially it's possible to suppress that
> by adding a flag to PCIDevice but I don't see a reason to do that
> yet, I'd rather treat bridge just as any other PCI device if it's
> possible.
>
> Signed-off-by: Igor Mammedov<imammedo@redhat.com>
> Message-Id:<20221017102146.2254096-4-imammedo@redhat.com>
> Reviewed-by: Michael S. Tsirkin<mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin<mst@redhat.com>
> ---
>   hw/i386/acpi-build.c | 75 --------------------------------------------
>   hw/isa/lpc_ich9.c    | 23 ++++++++++++++
>   hw/isa/piix3.c       | 17 +++++++++-
>   3 files changed, 39 insertions(+), 76 deletions(-)

Hi Igor,

since this patch SeaBIOS no longer detects the PS/2 keyboard. This means 
there's no keyboard in SeaBIOS, GRUB or FreeDOS. OVMF and Linux detect 
the PS/2 keyboard without issues.

Here are a few lines from the SeaBIOS debug log.

table(50434146)=0x007e1971 (via rsdt)
ACPI: parse DSDT at 0x007e0040 (len 6449)
parse_termlist: parse error, skip from 92/465
Scan for VGA option rom
Running option rom at c000:0003
Start SeaVGABIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)

and later

SeaBIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
ACPI: no PS/2 keyboard present

It doesn't matter if the machine type is pc or q35.

If I revert this patch, the PS/2 keyboard works again.

With best regards,
Volker





