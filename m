Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC76404DBF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 14:08:04 +0200 (CEST)
Received: from localhost ([::1]:59240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOIqW-00021B-FK
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 08:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mOIn1-0000F3-7q; Thu, 09 Sep 2021 08:04:23 -0400
Received: from relay64.bu.edu ([128.197.228.104]:37614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1mOImm-0005iv-Hh; Thu, 09 Sep 2021 08:04:22 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 189C32MN016396
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 9 Sep 2021 08:03:05 -0400
Date: Thu, 9 Sep 2021 08:03:02 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 00/10] security: Introduce
 qemu_security_policy_taint() API
Message-ID: <20210909120302.nuq5churn6kjsfqs@mozz.bu.edu>
References: <20210908232024.2399215-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210908232024.2399215-1-philmd@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=1,
 HK_RANDOM_FROM=0.999, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210909 0120, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series is experimental! The goal is to better limit the
> boundary of what code is considerated security critical, and
> what is less critical (but still important!).
> 
> This approach was quickly discussed few months ago with Markus
> then Daniel. Instead of classifying the code on a file path
> basis (see [1]), we insert (runtime) hints into the code
> (which survive code movement). Offending unsafe code can
> taint the global security policy. By default this policy
> is 'none': the current behavior. It can be changed on the
> command line to 'warn' to display warnings, and to 'strict'
> to prohibit QEMU running with a tainted policy.
> 
> As examples I started implementing unsafe code taint from
> 3 different pieces of code:
> - accelerators (KVM and Xen in allow-list)
> - block drivers (vvfat and parcial null-co in deny-list)
> - qdev (hobbyist devices regularly hit by fuzzer)

Just looking through the list of hci, storage, network and graphics
devices available on i386 to see which others are potential good
candidates for this tag. Obviously a lot of guesswork here:

USB devices:
name "ich9-usb-ehci1", bus PCI
name "ich9-usb-ehci2", bus PCI
name "ich9-usb-uhci1", bus PCI
name "ich9-usb-uhci2", bus PCI
name "ich9-usb-uhci3", bus PCI
name "ich9-usb-uhci4", bus PCI
name "ich9-usb-uhci5", bus PCI
name "ich9-usb-uhci6", bus PCI
name "nec-usb-xhci", bus PCI
name "pci-ohci", bus PCI, desc "Apple USB Controller"
name "piix3-usb-uhci", bus PCI
name "piix4-usb-uhci", bus PCI
name "qemu-xhci", bus PCI
name "usb-ehci", bus PCI

Not sure about these. Maybe ohci isn't sensitive?

Storage devices:
=== Sensitive ===
name "floppy", bus floppy-bus, desc "virtual floppy drive"
name "ide-cd", bus IDE, desc "virtual IDE CD-ROM"
name "ide-hd", bus IDE, desc "virtual IDE disk"
name "isa-fdc", bus ISA, desc "virtual floppy controller"
name "isa-ide", bus ISA
name "piix3-ide", bus PCI
name "piix3-ide-xen", bus PCI
name "piix4-ide", bus PCI
name "scsi-block", bus SCSI, desc "SCSI block device passthrough"
name "scsi-cd", bus SCSI, desc "virtual SCSI CD-ROM"
name "scsi-generic", bus SCSI, desc "pass through generic scsi device (/dev/sg*)"
name "scsi-hd", bus SCSI, desc "virtual SCSI disk"
name "vhost-scsi", bus virtio-bus
name "vhost-scsi-pci", bus PCI
name "vhost-scsi-pci-non-transitional", bus PCI
name "vhost-scsi-pci-transitional", bus PCI
name "vhost-user-blk", bus virtio-bus
name "vhost-user-blk-pci", bus PCI
name "vhost-user-blk-pci-non-transitional", bus PCI
name "vhost-user-blk-pci-transitional", bus PCI
name "vhost-user-fs-device", bus virtio-bus
name "vhost-user-fs-pci", bus PCI
name "vhost-user-scsi", bus virtio-bus
name "vhost-user-scsi-pci", bus PCI
name "vhost-user-scsi-pci-non-transitional", bus PCI
name "vhost-user-scsi-pci-transitional", bus PCI
name "virtio-9p-device", bus virtio-bus
name "virtio-9p-pci", bus PCI, alias "virtio-9p"
name "virtio-9p-pci-non-transitional", bus PCI
name "virtio-9p-pci-transitional", bus PCI
name "virtio-blk-device", bus virtio-bus
name "virtio-blk-pci", bus PCI, alias "virtio-blk"
name "virtio-blk-pci-non-transitional", bus PCI
name "virtio-blk-pci-transitional", bus PCI
name "virtio-pmem", bus virtio-bus
name "virtio-scsi-device", bus virtio-bus
name "virtio-scsi-pci", bus PCI, alias "virtio-scsi"
name "virtio-scsi-pci-non-transitional", bus PCI
name "virtio-scsi-pci-transitional", bus PCI

=== Tainting/Not Sensitive ===
name "am53c974", bus PCI, desc "AMD Am53c974 PCscsi-PCI SCSI adapter"
name "dc390", bus PCI, desc "Tekram DC-390 SCSI adapter"
name "ich9-ahci", bus PCI, alias "ahci"
name "lsi53c810", bus PCI
name "lsi53c895a", bus PCI, alias "lsi"
name "megasas", bus PCI, desc "LSI MegaRAID SAS 1078"
name "megasas-gen2", bus PCI, desc "LSI MegaRAID SAS 2108"
name "mptsas1068", bus PCI, desc "LSI SAS 1068"
name "nvdimm", desc "DIMM memory module"
name "nvme", bus PCI, desc "Non-Volatile Memory Express"
name "nvme-ns", bus nvme-bus, desc "Virtual NVMe namespace"
name "nvme-subsys", desc "Virtual NVMe subsystem"
name "pvscsi", bus PCI
name "sd-card", bus sd-bus
name "sdhci-pci", bus PCI
name "usb-bot", bus usb-bus
name "usb-mtp", bus usb-bus, desc "USB Media Transfer Protocol device"
name "usb-storage", bus usb-bus
name "usb-uas", bus usb-bus

Network devices:
=== Sensitive ===
name "e1000", bus PCI, alias "e1000-82540em", desc "Intel Gigabit Ethernet"
name "e1000e", bus PCI, desc "Intel 82574L GbE Controller"
name "virtio-net-device", bus virtio-bus
name "virtio-net-pci", bus PCI, alias "virtio-net"
name "virtio-net-pci-non-transitional", bus PCI
name "virtio-net-pci-transitional", bus PCI

=== Tainting/Not Sensitive ===
name "e1000-82544gc", bus PCI, desc "Intel Gigabit Ethernet"
name "e1000-82545em", bus PCI, desc "Intel Gigabit Ethernet"
name "i82550", bus PCI, desc "Intel i82550 Ethernet"
name "i82551", bus PCI, desc "Intel i82551 Ethernet"
name "i82557a", bus PCI, desc "Intel i82557A Ethernet"
name "i82557b", bus PCI, desc "Intel i82557B Ethernet"
name "i82557c", bus PCI, desc "Intel i82557C Ethernet"
name "i82558a", bus PCI, desc "Intel i82558A Ethernet"
name "i82558b", bus PCI, desc "Intel i82558B Ethernet"
name "i82559a", bus PCI, desc "Intel i82559A Ethernet"
name "i82559b", bus PCI, desc "Intel i82559B Ethernet"
name "i82559c", bus PCI, desc "Intel i82559C Ethernet"
name "i82559er", bus PCI, desc "Intel i82559ER Ethernet"
name "i82562", bus PCI, desc "Intel i82562 Ethernet"
name "i82801", bus PCI, desc "Intel i82801 Ethernet"
name "ne2k_isa", bus ISA
name "ne2k_pci", bus PCI
name "pcnet", bus PCI
name "rocker", bus PCI, desc "Rocker Switch"
name "rtl8139", bus PCI
name "tulip", bus PCI
name "usb-net", bus usb-bus
name "vmxnet3", bus PCI, desc "VMWare Paravirtualized Ethernet v3"

Display devices:
=== Sensitive ===
name "isa-vga", bus ISA
name "qxl", bus PCI, desc "Spice QXL GPU (secondary)"
name "qxl-vga", bus PCI, desc "Spice QXL GPU (primary, vga compatible)"
name "vhost-user-gpu", bus virtio-bus
name "vhost-user-gpu-pci", bus PCI
name "vhost-user-vga", bus PCI
name "virtio-gpu-device", bus virtio-bus
name "virtio-gpu-pci", bus PCI, alias "virtio-gpu"
name "virtio-vga", bus PCI
name "VGA", bus PCI

=== Tainting/Not Sensitive ===
name "ati-vga", bus PCI
name "bochs-display", bus PCI
name "cirrus-vga", bus PCI, desc "Cirrus CLGD 54xx VGA"
name "isa-cirrus-vga", bus ISA
name "ramfb", bus System, desc "ram framebuffer standalone device"
name "secondary-vga", bus PCI
name "sga", bus ISA, desc "Serial Graphics Adapter"
name "vmware-svga", bus PCI

Sound devices:
=== Sensitive ===
name "hda-duplex", bus HDA, desc "HDA Audio Codec, duplex (line-out, line-in)"
name "hda-micro", bus HDA, desc "HDA Audio Codec, duplex (speaker, microphone)"
name "hda-output", bus HDA, desc "HDA Audio Codec, output-only (line-out)"
name "ich9-intel-hda", bus PCI, desc "Intel HD Audio Controller (ich9)"

=== Tainting/Not Sensitive ===
name "AC97", bus PCI, alias "ac97", desc "Intel 82801AA AC97 Audio"
name "adlib", bus ISA, desc "Yamaha YM3812 (OPL2)"
name "cs4231a", bus ISA, desc "Crystal Semiconductor CS4231A"
name "ES1370", bus PCI, alias "es1370", desc "ENSONIQ AudioPCI ES1370"
name "gus", bus ISA, desc "Gravis Ultrasound GF1"
name "intel-hda", bus PCI, desc "Intel HD Audio Controller (ich6)"
name "sb16", bus ISA, desc "Creative Sound Blaster 16"
name "usb-audio", bus usb-bus

