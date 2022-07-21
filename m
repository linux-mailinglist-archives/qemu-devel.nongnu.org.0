Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77AB57CDBA
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:32:56 +0200 (CEST)
Received: from localhost ([::1]:56204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXEV-0003vb-RM
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oEXAR-0001O3-EB
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:28:43 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:36918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oEXAM-0000fz-IQ
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:28:42 -0400
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id E231E2E0AC4;
 Thu, 21 Jul 2022 17:28:30 +0300 (MSK)
Received: from rvkaganb (unknown [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ilsi55VrV3-SSOeTITv; Thu, 21 Jul 2022 17:28:29 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658413709; bh=H3SpFZUtdrPg/oKvQAf+uz+GZIhYnfQc4vsj5gF2Mr0=;
 h=In-Reply-To:Cc:Message-ID:Subject:Date:References:To:From;
 b=RQTDyLAXrRrhOtNL3vBz2o2ZUMlsdQPZmuHGlgljPzhFsdC9pFkkLacaKp0SJtPbp
 kEto/KqishgSVhFayApOcaYseRaFSvducslKvVSxJGsPeaz9auuTBS1fg2ptjoJp8l
 iwqAVPXiZiZpOI6uJ9maiLwWeug2w4wMLDX3KDLQ=
Authentication-Results: vla5-d6d5ce7a4718.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Date: Thu, 21 Jul 2022 17:28:27 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/pci/pci_bridge: ensure PCIe slots have only one slot
Message-ID: <Ytlii7t0rERVJBXo@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20220720102555.874394-1-rvkagan@yandex-team.ru>
 <Ytfcivbtj8+JnLfz@redhat.com> <YtfgQN+BQ8Egn0ha@rvkaganb>
 <5bc2fcee-2c5d-c400-5992-e2b4ce828477@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bc2fcee-2c5d-c400-5992-e2b4ce828477@ilande.co.uk>
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On Wed, Jul 20, 2022 at 02:21:38PM +0100, Mark Cave-Ayland wrote:
> On 20/07/2022 12:00, Roman Kagan wrote:
> 
> > On Wed, Jul 20, 2022 at 11:44:26AM +0100, Daniel P. Berrangé wrote:
> > > On Wed, Jul 20, 2022 at 01:25:55PM +0300, Roman Kagan wrote:
> > > > It's possible to create non-working configurations by attaching a device
> > > > to a derivative of PCIe slot (pcie-root-port, ioh3420, etc) and
> > > > specifying a slot number other that zero, e.g.:
> > > > 
> > > >      -device pcie-root-port,id=s0,... \
> > > >      -device virtio-blk-pci,bus=s0,addr=4,...
> > > > 
> > > > Make QEMU reject such configurations and only allow addr=0 on the
> > > > secondary bus of a PCIe slot.
> > > 
> > > What do you mean by 'non-working' in this case.  The guest OS boots
> > > OK, but I indeed don't see the device in the guest, but IIUC it was
> > > said that was just because Linux doesn't scan for a non-zero slot.
> > 
> > Right.  I don't remember if it was Linux or firmware or both but indeed
> > at least Linux guests don't see devices if attached to a PCIe slot at
> > addr != 0.  (Which is kinda natural for a thing called "slot", isn't it?)
> > 
> > > That wouldn't be a broken config from QEMU's POV though, merely a
> > > guest OS limitation ?
> > 
> > Strictly speaking it wouldn't, indeed.  But we've had created such a
> > configuration (due to a bug in our management layer) and spent
> > non-negligible time trying to figure out why the attached device didn't
> > appear in the guest.  So I thought it made sense to reject a
> > configuration which is known to confuse guests.  Doesn't it?
> 
> This does seem a bit odd. What does the output of "info qtree" look like for
> your non-working configuration?

Sure:

command line:

# qemu-system-x86_64 \
    -name test,debug-threads=on \
    -msg timestamp=on \
    -machine q35,sata=false,usb=off \
    -accel kvm \
    -cpu Haswell-noTSX \
    -smp 4,sockets=1,cores=4,threads=1 \
    -vga std \
    -m 4096M \
    -object memory-backend-memfd,id=mem0,size=4096M,share=on \
    -numa node,memdev=mem0,cpus=0-3 \
    -nodefaults \
    -no-user-config \
    -chardev stdio,id=mon0 \
    -mon chardev=mon0,mode=readline \
    -boot strict=on \
    -device vmcoreinfo \
    -device pvpanic \
    -device qemu-xhci,id=usb0 \
    -device usb-tablet,bus=usb0.0 \
    -chardev socket,path=serial0.sock,logfile=serial0.log,id=charserial0,reconnect=1 \
    -device isa-serial,chardev=charserial0,id=serial0 \
    -chardev file,path=bios0.log,id=debugcon \
    -device isa-debugcon,iobase=0x402,chardev=debugcon \
    -device pcie-root-port,id=s0,slot=0,bus=pcie.0,addr=05.0,multifunction=on,io-reserve=0 \
    -device pcie-root-port,id=s1,slot=1,bus=pcie.0,addr=05.1,multifunction=on,io-reserve=0 \
    -device pcie-root-port,id=s2,slot=2,bus=pcie.0,addr=05.2,multifunction=on,io-reserve=0 \
    -device pcie-root-port,id=s3,slot=3,bus=pcie.0,addr=05.3,multifunction=on,io-reserve=0 \
    -drive format=qcow2,file=f34.qcow2,id=hdd0,if=none,aio=native,cache=directsync,discard=unmap \
    -netdev user,id=netdev0,hostfwd=tcp::0-:22 \
    -device virtio-net-pci,disable-legacy=off,netdev=netdev0,id=net0,bus=s1 \
    -object iothread,id=iot0 \
    -device virtio-blk-pci,disable-legacy=off,scsi=off,rerror=report,werror=report,id=vblk0,drive=hdd0,bus=s0,iothread=iot0,bootindex=1 \
    -object iothread,id=iot2 \
    -drive driver=null-co,size=64M,id=hdd2,if=none \
    -device virtio-blk-pci,disable-legacy=off,scsi=off,rerror=report,werror=report,id=vblk2,drive=hdd2,bus=s2,iothread=iot2,num-queues=4,addr=4 \
    -nographic


qemu HMP:

(qemu) info qtree
bus: main-system-bus
  type System
  dev: ps2-mouse, id ""
    gpio-out "" 1
  dev: ps2-kbd, id ""
    gpio-out "" 1
  dev: hpet, id ""
    gpio-in "" 2
    gpio-out "" 1
    gpio-out "sysbus-irq" 32
    timers = 3 (0x3)
    msi = false
    hpet-intcap = 16711940 (0xff0104)
    hpet-offset-saved = true
    mmio 00000000fed00000/0000000000000400
  dev: kvm-ioapic, id ""
    gpio-in "" 24
    gsi_base = 0 (0x0)
    mmio 00000000fec00000/0000000000001000
  dev: q35-pcihost, id ""
    MCFG = 2952790016 (0xb0000000)
    pci-hole64-size = 34359738368 (32 GiB)
    short_root_bus = 0 (0x0)
    below-4g-mem-size = 2147483648 (2 GiB)
    above-4g-mem-size = 2147483648 (2 GiB)
    x-pci-hole64-fix = true
    x-config-reg-migration-enabled = true
    bypass-iommu = false
    bus: pcie.0
      type PCIE
      dev: pcie-root-port, id "s3"
        x-migrate-msix = true
        bus-reserve = 4294967295 (0xffffffff)
        io-reserve = 0 (0 B)
        mem-reserve = 18446744073709551615 (16 EiB)
        pref32-reserve = 18446744073709551615 (16 EiB)
        pref64-reserve = 18446744073709551615 (16 EiB)
        x-speed = "16"
        x-width = "32"
        power_controller_present = true
        disable-acs = false
        chassis = 0 (0x0)
        slot = 3 (0x3)
        hotplug = true
        x-native-hotplug = true
        port = 0 (0x0)
        aer_log_max = 8 (0x8)
        addr = 05.3
        romfile = ""
        romsize = 4294967295 (0xffffffff)
        rombar = 1 (0x1)
        multifunction = true
        x-pcie-lnksta-dllla = true
        x-pcie-extcap-init = true
        failover_pair_id = ""
        acpi-index = 0 (0x0)
        class PCI bridge, addr 00:05.3, pci id 1b36:000c (sub 0000:0000)
        bar 0: mem at 0xfea18000 [0xfea18fff]
        bus: s3
          type PCIE
      dev: pcie-root-port, id "s2"
        x-migrate-msix = true
        bus-reserve = 4294967295 (0xffffffff)
        io-reserve = 0 (0 B)
        mem-reserve = 18446744073709551615 (16 EiB)
        pref32-reserve = 18446744073709551615 (16 EiB)
        pref64-reserve = 18446744073709551615 (16 EiB)
        x-speed = "16"
        x-width = "32"
        power_controller_present = true
        disable-acs = false
        chassis = 0 (0x0)
        slot = 2 (0x2)
        hotplug = true
        x-native-hotplug = true
        port = 0 (0x0)
        aer_log_max = 8 (0x8)
        addr = 05.2
        romfile = ""
        romsize = 4294967295 (0xffffffff)
        rombar = 1 (0x1)
        multifunction = true
        x-pcie-lnksta-dllla = true
        x-pcie-extcap-init = true
        failover_pair_id = ""
        acpi-index = 0 (0x0)
        class PCI bridge, addr 00:05.2, pci id 1b36:000c (sub 0000:0000)
        bar 0: mem at 0xfea17000 [0xfea17fff]
        bus: s2
          type PCIE
          dev: virtio-blk-pci, id "vblk2"
            disable-legacy = "off"
            disable-modern = false
            class = 0 (0x0)
            ioeventfd = true
            vectors = 5 (0x5)
            virtio-pci-bus-master-bug-migration = false
            migrate-extra = true
            modern-pio-notify = false
            x-disable-pcie = false
            page-per-vq = false
            x-ignore-backend-features = false
            ats = false
            x-ats-page-aligned = true
            x-pcie-deverr-init = true
            x-pcie-lnkctl-init = true
            x-pcie-pm-init = true
            x-pcie-flr-init = true
            aer = false
            addr = 04.0
            romfile = ""
            romsize = 4294967295 (0xffffffff)
            rombar = 1 (0x1)
            multifunction = false
            x-pcie-lnksta-dllla = true
            x-pcie-extcap-init = true
            failover_pair_id = ""
            acpi-index = 0 (0x0)
            class SCSI controller, addr 03:04.0, pci id 1af4:1001 (sub 1af4:0002)
            bar 0: i/o at 0xffffffffffffffff [0x7e]
            bar 1: mem at 0xffffffffffffffff [0xffe]
            bar 4: mem at 0xffffffffffffffff [0x3ffe]
            bus: virtio-bus
              type virtio-pci-bus
              dev: virtio-blk-device, id ""
                drive = "hdd2"
                backend_defaults = "auto"
                logical_block_size = 512 (512 B)
                physical_block_size = 512 (512 B)
                min_io_size = 0 (0 B)
                opt_io_size = 0 (0 B)
                discard_granularity = 4294967295 (4 GiB)
                write-cache = "auto"
                share-rw = false
                rerror = "report"
                werror = "report"
                cyls = 130 (0x82)
                heads = 16 (0x10)
                secs = 63 (0x3f)
                lcyls = 0 (0x0)
                lheads = 0 (0x0)
                lsecs = 0 (0x0)
                serial = ""
                config-wce = true
                scsi = false
                request-merging = true
                num-queues = 4 (0x4)
                queue-size = 256 (0x100)
                seg-max-adjust = true
                discard = true
                report-discard-granularity = true
                write-zeroes = true
                max-discard-sectors = 4194303 (0x3fffff)
                max-write-zeroes-sectors = 4194303 (0x3fffff)
                x-enable-wce-if-config-wce = true
                indirect_desc = true
                event_idx = true
                notify_on_empty = true
                any_layout = true
                iommu_platform = false
                packed = false
                use-started = true
                use-disabled-flag = true
                x-disable-legacy-check = false
      dev: pcie-root-port, id "s1"
        x-migrate-msix = true
        bus-reserve = 4294967295 (0xffffffff)
        io-reserve = 0 (0 B)
        mem-reserve = 18446744073709551615 (16 EiB)
        pref32-reserve = 18446744073709551615 (16 EiB)
        pref64-reserve = 18446744073709551615 (16 EiB)
        x-speed = "16"
        x-width = "32"
        power_controller_present = true
        disable-acs = false
        chassis = 0 (0x0)
        slot = 1 (0x1)
        hotplug = true
        x-native-hotplug = true
        port = 0 (0x0)
        aer_log_max = 8 (0x8)
        addr = 05.1
        romfile = ""
        romsize = 4294967295 (0xffffffff)
        rombar = 1 (0x1)
        multifunction = true
        x-pcie-lnksta-dllla = true
        x-pcie-extcap-init = true
        failover_pair_id = ""
        acpi-index = 0 (0x0)
        class PCI bridge, addr 00:05.1, pci id 1b36:000c (sub 0000:0000)
        bar 0: mem at 0xfea16000 [0xfea16fff]
        bus: s1
          type PCIE
          dev: virtio-net-pci, id "net0"
            disable-legacy = "off"
            disable-modern = false
            ioeventfd = true
            vectors = 4 (0x4)
            virtio-pci-bus-master-bug-migration = false
            migrate-extra = true
            modern-pio-notify = false
            x-disable-pcie = false
            page-per-vq = false
            x-ignore-backend-features = false
            ats = false
            x-ats-page-aligned = true
            x-pcie-deverr-init = true
            x-pcie-lnkctl-init = true
            x-pcie-pm-init = true
            x-pcie-flr-init = true
            aer = false
            addr = 00.0
            romfile = "efi-virtio.rom"
            romsize = 262144 (0x40000)
            rombar = 1 (0x1)
            multifunction = false
            x-pcie-lnksta-dllla = true
            x-pcie-extcap-init = true
            failover_pair_id = ""
            acpi-index = 0 (0x0)
            class Ethernet controller, addr 02:00.0, pci id 1af4:1000 (sub 1af4:0001)
            bar 0: i/o at 0x2000 [0x201f]
            bar 1: mem at 0xfe640000 [0xfe640fff]
            bar 4: mem at 0xfd400000 [0xfd403fff]
            bar 6: mem at 0xffffffffffffffff [0x3fffe]
            bus: virtio-bus
              type virtio-pci-bus
              dev: virtio-net-device, id ""
                csum = true
                guest_csum = true
                gso = true
                guest_tso4 = true
                guest_tso6 = true
                guest_ecn = true
                guest_ufo = true
                guest_announce = true
                host_tso4 = true
                host_tso6 = true
                host_ecn = true
                host_ufo = true
                mrg_rxbuf = true
                status = true
                ctrl_vq = true
                ctrl_rx = true
                ctrl_vlan = true
                ctrl_rx_extra = true
                ctrl_mac_addr = true
                ctrl_guest_offloads = true
                mq = false
                rss = false
                hash = false
                guest_rsc_ext = false
                rsc_interval = 300000 (0x493e0)
                mac = "52:54:00:12:34:56"
                netdev = "netdev0"
                x-txtimer = 150000 (0x249f0)
                x-txburst = 256 (0x100)
                tx = ""
                rx_queue_size = 256 (0x100)
                tx_queue_size = 256 (0x100)
                host_mtu = 0 (0x0)
                x-mtu-bypass-backend = true
                speed = -1 (0xffffffffffffffff)
                duplex = ""
                failover = false
                indirect_desc = true
                event_idx = true
                notify_on_empty = true
                any_layout = true
                iommu_platform = false
                packed = false
                use-started = true
                use-disabled-flag = true
                x-disable-legacy-check = false
      dev: pcie-root-port, id "s0"
        x-migrate-msix = true
        bus-reserve = 4294967295 (0xffffffff)
        io-reserve = 0 (0 B)
        mem-reserve = 18446744073709551615 (16 EiB)
        pref32-reserve = 18446744073709551615 (16 EiB)
        pref64-reserve = 18446744073709551615 (16 EiB)
        x-speed = "16"
        x-width = "32"
        power_controller_present = true
        disable-acs = false
        chassis = 0 (0x0)
        slot = 0 (0x0)
        hotplug = true
        x-native-hotplug = true
        port = 0 (0x0)
        aer_log_max = 8 (0x8)
        addr = 05.0
        romfile = ""
        romsize = 4294967295 (0xffffffff)
        rombar = 1 (0x1)
        multifunction = true
        x-pcie-lnksta-dllla = true
        x-pcie-extcap-init = true
        failover_pair_id = ""
        acpi-index = 0 (0x0)
        class PCI bridge, addr 00:05.0, pci id 1b36:000c (sub 0000:0000)
        bar 0: mem at 0xfea15000 [0xfea15fff]
        bus: s0
          type PCIE
          dev: virtio-blk-pci, id "vblk0"
            disable-legacy = "off"
            disable-modern = false
            class = 0 (0x0)
            ioeventfd = true
            vectors = 5 (0x5)
            virtio-pci-bus-master-bug-migration = false
            migrate-extra = true
            modern-pio-notify = false
            x-disable-pcie = false
            page-per-vq = false
            x-ignore-backend-features = false
            ats = false
            x-ats-page-aligned = true
            x-pcie-deverr-init = true
            x-pcie-lnkctl-init = true
            x-pcie-pm-init = true
            x-pcie-flr-init = true
            aer = false
            addr = 00.0
            romfile = ""
            romsize = 4294967295 (0xffffffff)
            rombar = 1 (0x1)
            multifunction = false
            x-pcie-lnksta-dllla = true
            x-pcie-extcap-init = true
            failover_pair_id = ""
            acpi-index = 0 (0x0)
            class SCSI controller, addr 01:00.0, pci id 1af4:1001 (sub 1af4:0002)
            bar 0: i/o at 0x1000 [0x107f]
            bar 1: mem at 0xfe800000 [0xfe800fff]
            bar 4: mem at 0xfd600000 [0xfd603fff]
            bus: virtio-bus
              type virtio-pci-bus
              dev: virtio-blk-device, id ""
                drive = "hdd0"
                backend_defaults = "auto"
                logical_block_size = 512 (512 B)
                physical_block_size = 512 (512 B)
                min_io_size = 0 (0 B)
                opt_io_size = 0 (0 B)
                discard_granularity = 4294967295 (4 GiB)
                write-cache = "auto"
                share-rw = false
                rerror = "report"
                werror = "report"
                cyls = 10402 (0x28a2)
                heads = 16 (0x10)
                secs = 63 (0x3f)
                lcyls = 0 (0x0)
                lheads = 0 (0x0)
                lsecs = 0 (0x0)
                serial = ""
                config-wce = true
                scsi = false
                request-merging = true
                num-queues = 4 (0x4)
                queue-size = 256 (0x100)
                seg-max-adjust = true
                discard = true
                report-discard-granularity = true
                write-zeroes = true
                max-discard-sectors = 4194303 (0x3fffff)
                max-write-zeroes-sectors = 4194303 (0x3fffff)
                x-enable-wce-if-config-wce = true
                indirect_desc = true
                event_idx = true
                notify_on_empty = true
                any_layout = true
                iommu_platform = false
                packed = false
                use-started = true
                use-disabled-flag = true
                x-disable-legacy-check = false
      dev: qemu-xhci, id "usb0"
        addr = 02.0
        romfile = ""
        romsize = 4294967295 (0xffffffff)
        rombar = 1 (0x1)
        multifunction = false
        x-pcie-lnksta-dllla = true
        x-pcie-extcap-init = true
        failover_pair_id = ""
        acpi-index = 0 (0x0)
        class USB controller, addr 00:02.0, pci id 1b36:000d (sub 1af4:1100)
        bar 0: mem at 0xfea10000 [0xfea13fff]
        bus: usb0.0
          type usb-bus
          dev: usb-tablet, id ""
            usb_version = 2 (0x2)
            display = ""
            head = 0 (0x0)
            port = ""
            serial = ""
            msos-desc = true
            pcap = ""
            addr 0.1, port 1, speed 480, name QEMU USB Tablet, attached
      dev: VGA, id ""
        vgamem_mb = 16 (0x10)
        mmio = true
        qemu-extended-regs = true
        edid = true
        xres = 1280 (0x500)
        yres = 800 (0x320)
        xmax = 0 (0x0)
        ymax = 0 (0x0)
        refresh_rate = 0 (0x0)
        global-vmstate = false
        addr = 01.0
        romfile = "vgabios-stdvga.bin"
        romsize = 65536 (0x10000)
        rombar = 1 (0x1)
        multifunction = false
        x-pcie-lnksta-dllla = true
        x-pcie-extcap-init = true
        failover_pair_id = ""
        acpi-index = 0 (0x0)
        class VGA controller, addr 00:01.0, pci id 1234:1111 (sub 1af4:1100)
        bar 0: mem at 0xfc000000 [0xfcffffff]
        bar 2: mem at 0xfea14000 [0xfea14fff]
        bar 6: mem at 0xffffffffffffffff [0xfffe]
      dev: ICH9-SMB, id ""
        addr = 1f.3
        romfile = ""
        romsize = 4294967295 (0xffffffff)
        rombar = 1 (0x1)
        multifunction = true
        x-pcie-lnksta-dllla = true
        x-pcie-extcap-init = true
        failover_pair_id = ""
        acpi-index = 0 (0x0)
        class SMBus, addr 00:1f.3, pci id 8086:2930 (sub 1af4:1100)
        bar 4: i/o at 0x700 [0x73f]
        bus: i2c
          type i2c-bus
          dev: smbus-eeprom, id ""
            address = 87 (0x57)
          dev: smbus-eeprom, id ""
            address = 86 (0x56)
          dev: smbus-eeprom, id ""
            address = 85 (0x55)
          dev: smbus-eeprom, id ""
            address = 84 (0x54)
          dev: smbus-eeprom, id ""
            address = 83 (0x53)
          dev: smbus-eeprom, id ""
            address = 82 (0x52)
          dev: smbus-eeprom, id ""
            address = 81 (0x51)
          dev: smbus-eeprom, id ""
            address = 80 (0x50)
      dev: ICH9-LPC, id ""
        gpio-out "gsi" 24
        noreboot = true
        smm-compat = false
        x-smi-broadcast = true
        x-smi-cpu-hotplug = true
        x-smi-cpu-hotunplug = true
        addr = 1f.0
        romfile = ""
        romsize = 4294967295 (0xffffffff)
        rombar = 1 (0x1)
        multifunction = true
        x-pcie-lnksta-dllla = true
        x-pcie-extcap-init = true
        failover_pair_id = ""
        acpi-index = 0 (0x0)
        class ISA bridge, addr 00:1f.0, pci id 8086:2918 (sub 1af4:1100)
        bus: isa.0
          type ISA
          dev: isa-debugcon, id ""
            iobase = 1026 (0x402)
            chardev = "debugcon"
            readback = 233 (0xe9)
          dev: isa-serial, id "serial0"
            index = 0 (0x0)
            iobase = 1016 (0x3f8)
            irq = 4 (0x4)
          dev: pvpanic, id ""
            ioport = 1285 (0x505)
            events = 3 (0x3)
          dev: port92, id ""
            gpio-out "a20" 1
          dev: vmmouse, id ""
          dev: vmport, id ""
            x-read-set-eax = true
            x-signal-unsupported-cmd = true
            x-report-vmx-type = true
            x-cmds-v2 = true
            vmware-vmx-version = 6 (0x6)
            vmware-vmx-type = 2 (0x2)
          dev: i8042, id ""
            gpio-in "ps2-mouse-input-irq" 1
            gpio-in "ps2-kbd-input-irq" 1
            gpio-out "" 2
            gpio-out "a20" 1
            extended-state = true
            kbd-throttle = false
            kbd-irq = 1 (0x1)
            mouse-irq = 12 (0xc)
          dev: i8257, id ""
            base = 192 (0xc0)
            page-base = 136 (0x88)
            pageh-base = -1 (0xffffffffffffffff)
            dshift = 1 (0x1)
          dev: i8257, id ""
            base = 0 (0x0)
            page-base = 128 (0x80)
            pageh-base = -1 (0xffffffffffffffff)
            dshift = 0 (0x0)
          dev: isa-pcspk, id ""
            audiodev = ""
            iobase = 97 (0x61)
            migrate = true
          dev: kvm-pit, id ""
            gpio-in "" 1
            iobase = 64 (0x40)
            lost_tick_policy = "delay"
          dev: mc146818rtc, id ""
            gpio-out "" 1
            base_year = 0 (0x0)
            iobase = 112 (0x70)
            irq = 8 (0x8)
            lost_tick_policy = "discard"
          dev: kvm-i8259, id ""
            iobase = 160 (0xa0)
            elcr_addr = 1233 (0x4d1)
            elcr_mask = 222 (0xde)
            master = false
          dev: kvm-i8259, id ""
            iobase = 32 (0x20)
            elcr_addr = 1232 (0x4d0)
            elcr_mask = 248 (0xf8)
            master = true
      dev: mch, id ""
        extended-tseg-mbytes = 16 (0x10)
        smbase-smram = true
        addr = 00.0
        romfile = ""
        romsize = 4294967295 (0xffffffff)
        rombar = 1 (0x1)
        multifunction = false
        x-pcie-lnksta-dllla = true
        x-pcie-extcap-init = true
        failover_pair_id = ""
        acpi-index = 0 (0x0)
        class Host bridge, addr 00:00.0, pci id 8086:29c0 (sub 1af4:1100)
  dev: fw_cfg_io, id ""
    dma_enabled = true
    x-file-slots = 32 (0x20)
    acpi-mr-restore = true
  dev: kvmclock, id ""
    x-mach-use-reliable-get-clock = true
  dev: kvmvapic, id ""

(qemu) info pci
  Bus  0, device   0, function 0:
    Host bridge: PCI device 8086:29c0
      PCI subsystem 1af4:1100
      id ""
  Bus  0, device   1, function 0:
    VGA controller: PCI device 1234:1111
      PCI subsystem 1af4:1100
      BAR0: 32 bit prefetchable memory at 0xfc000000 [0xfcffffff].
      BAR2: 32 bit memory at 0xfea14000 [0xfea14fff].
      BAR6: 32 bit memory at 0xffffffffffffffff [0x0000fffe].
      id ""
  Bus  0, device   2, function 0:
    USB controller: PCI device 1b36:000d
      PCI subsystem 1af4:1100
      IRQ 11, pin A
      BAR0: 64 bit memory at 0xfea10000 [0xfea13fff].
      id "usb0"
  Bus  0, device   5, function 0:
    PCI bridge: PCI device 1b36:000c
      IRQ 10, pin A
      BUS 0.
      secondary bus 1.
      subordinate bus 1.
      IO range [0xf000, 0x0fff]
      memory range [0xfe800000, 0xfe9fffff]
      prefetchable memory range [0xfd600000, 0xfd7fffff]
      BAR0: 32 bit memory at 0xfea15000 [0xfea15fff].
      id "s0"
  Bus  1, device   0, function 0:
    SCSI controller: PCI device 1af4:1001
      PCI subsystem 1af4:0002
      IRQ 10, pin A
      BAR0: I/O at 0x1000 [0x107f].
      BAR1: 32 bit memory at 0xfe800000 [0xfe800fff].
      BAR4: 64 bit prefetchable memory at 0xfd600000 [0xfd603fff].
      id "vblk0"
  Bus  0, device   5, function 1:
    PCI bridge: PCI device 1b36:000c
      IRQ 10, pin A
      BUS 0.
      secondary bus 2.
      subordinate bus 2.
      IO range [0xf000, 0x0fff]
      memory range [0xfe600000, 0xfe7fffff]
      prefetchable memory range [0xfd400000, 0xfd5fffff]
      BAR0: 32 bit memory at 0xfea16000 [0xfea16fff].
      id "s1"
  Bus  2, device   0, function 0:
    Ethernet controller: PCI device 1af4:1000
      PCI subsystem 1af4:0001
      IRQ 10, pin A
      BAR0: I/O at 0x2000 [0x201f].
      BAR1: 32 bit memory at 0xfe640000 [0xfe640fff].
      BAR4: 64 bit prefetchable memory at 0xfd400000 [0xfd403fff].
      BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].
      id "net0"
  Bus  0, device   5, function 2:
    PCI bridge: PCI device 1b36:000c
      IRQ 10, pin A
      BUS 0.
      secondary bus 3.
      subordinate bus 3.
      IO range [0xf000, 0x0fff]
      memory range [0xfe400000, 0xfe5fffff]
      prefetchable memory range [0xfd200000, 0xfd3fffff]
      BAR0: 32 bit memory at 0xfea17000 [0xfea17fff].
      id "s2"
  Bus  3, device   4, function 0:
    SCSI controller: PCI device 1af4:1001
      PCI subsystem 1af4:0002
      IRQ 0, pin A
      BAR0: I/O at 0xffffffffffffffff [0x007e].
      BAR1: 32 bit memory at 0xffffffffffffffff [0x00000ffe].
      BAR4: 64 bit prefetchable memory at 0xffffffffffffffff [0x00003ffe].
      id "vblk2"
  Bus  0, device   5, function 3:
    PCI bridge: PCI device 1b36:000c
      IRQ 10, pin A
      BUS 0.
      secondary bus 4.
      subordinate bus 4.
      IO range [0xf000, 0x0fff]
      memory range [0xfe200000, 0xfe3fffff]
      prefetchable memory range [0xfd000000, 0xfd1fffff]
      BAR0: 32 bit memory at 0xfea18000 [0xfea18fff].
      id "s3"
  Bus  0, device  31, function 0:
    ISA bridge: PCI device 8086:2918
      PCI subsystem 1af4:1100
      id ""
  Bus  0, device  31, function 3:
    SMBus: PCI device 8086:2930
      PCI subsystem 1af4:1100
      IRQ 10, pin A
      BAR4: I/O at 0x0700 [0x073f].
      id ""


In the guest (Fedora 34):

[root@test ~]# lspci -tv
-[0000:00]-+-00.0  Intel Corporation 82G33/G31/P35/P31 Express DRAM Controller
           +-01.0  Device 1234:1111
           +-02.0  Red Hat, Inc. QEMU XHCI Host Controller
           +-05.0-[01]----00.0  Red Hat, Inc. Virtio block device
           +-05.1-[02]----00.0  Red Hat, Inc. Virtio network device
           +-05.2-[03]--
           +-05.3-[04]--
           +-1f.0  Intel Corporation 82801IB (ICH9) LPC Interface Controller
           \-1f.3  Intel Corporation 82801I (ICH9 Family) SMBus Controller

Changing addr of the second disk from 4 to 0 makes it appear in the
guest.

What exactly do you find odd?

Thanks,
Roman.

