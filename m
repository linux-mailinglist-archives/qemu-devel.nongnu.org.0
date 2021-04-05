Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41281353D6A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 12:32:13 +0200 (CEST)
Received: from localhost ([::1]:60280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTMWh-00010V-Uw
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 06:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTMVR-0000W0-Sn
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 06:30:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:47526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lTMVP-0000x6-6J
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 06:30:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lTMVJ-0006qQ-EX
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 10:30:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6B3312E8026
 for <qemu-devel@nongnu.org>; Mon,  5 Apr 2021 10:30:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Apr 2021 10:23:40 -0000
From: Mark Cave-Ayland <1921635@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hp mark-cave-ayland
X-Launchpad-Bug-Reporter: Hein-PietervanBraam (hp)
X-Launchpad-Bug-Modifier: Mark Cave-Ayland (mark-cave-ayland)
References: <161695258717.25953.1383463253951082358.malonedeb@wampee.canonical.com>
Message-Id: <161761822079.18133.9922501482394382678.malone@soybean.canonical.com>
Subject: [Bug 1921635] Re: ESP SCSI adapter not working with DOS ASPI drivers
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: f043272d5e65cd93b2185b334991a959343efae1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1921635 <1921635@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've had a look at your am53c974 boot floppy with PcSCSI drivers and I'm
fairly sure that disabling INT13 support isn't helping here. With your
custom SeaBIOS I see a hang issuing the first SCSI command: without your
custom SeaBIOS I can see that the default SeaBIOS issues several
successful commands to the SCSI bus before booting from the floppy.

Dropping the -bios option and booting your floppy here I see the
following sequence with -trace 'scsi*' -trace 'esp*' after the BIOS has
initialised:


esp_mem_writeb reg[3]: 0x42 -> 0x02
esp_mem_writeb_cmd_reset Chip reset (0x02)
esp_mem_writeb reg[3]: 0x02 -> 0x80
esp_mem_writeb_cmd_nop NOP (0x80)
esp_mem_writeb reg[11]: 0x00 -> 0x40
esp_mem_readb reg[14]: 0x12
esp_pci_sbac_read sbac: 0x00000000
esp_pci_sbac_write sbac: 0x00000000 -> 0x02000000
esp_mem_writeb reg[3]: 0x80 -> 0x02
esp_mem_writeb_cmd_reset Chip reset (0x02)
esp_mem_writeb reg[3]: 0x02 -> 0x80
esp_mem_writeb_cmd_nop NOP (0x80)
esp_mem_writeb reg[8]: 0x00 -> 0x17
esp_mem_writeb reg[12]: 0x00 -> 0x88
esp_mem_writeb reg[13]: 0x00 -> 0x40
esp_mem_writeb reg[11]: 0x00 -> 0x40
esp_mem_writeb reg[9]: 0x00 -> 0x07
esp_mem_writeb reg[5]: 0x00 -> 0x8d
esp_mem_writeb reg[5]: 0x8d -> 0x02
esp_mem_readb reg[8]: 0x17
esp_mem_writeb reg[8]: 0x17 -> 0x07
esp_mem_writeb reg[4]: 0x00 -> 0x00
esp_mem_writeb reg[3]: 0x80 -> 0x01
esp_mem_writeb_cmd_flush Flush FIFO (0x01)
esp_mem_writeb reg[2]: 0x00 -> 0x00
esp_mem_writeb reg[2]: 0x00 -> 0x00
esp_mem_writeb reg[2]: 0x00 -> 0x00
esp_mem_writeb reg[2]: 0x00 -> 0x00
esp_mem_writeb reg[2]: 0x00 -> 0x00
esp_mem_writeb reg[2]: 0x00 -> 0x00
esp_mem_writeb reg[3]: 0x01 -> 0x41
esp_mem_writeb_cmd_sel Select without ATN (0x41)
esp_get_cmd len 6 target 0
esp_do_busid_cmd busid 0x0
scsi_req_parsed target 0 lun 0 tag 0 command 0 dir 0 length 0
scsi_req_parsed_lba target 0 lun 0 tag 0 command 0 lba 0
scsi_req_alloc target 0 lun 0 tag 0
scsi_disk_new_request Command: lun=3D0 tag=3D0x0 data=3D 0x00 0x00 0x00 0x0=
0 0x00 0x00
scsi_test_unit_ready target 0 lun 0 tag 0
scsi_req_dequeue target 0 lun 0 tag 0
esp_command_complete SCSI Command complete
esp_raise_irq Raise IRQ
esp_lower_drq Lower DREQ

******
esp_pci_dma_read reg[5]: 0x00000018
esp_mem_readb reg[4]: 0x93
esp_mem_readb reg[6]: 0x00
esp_lower_irq Lower IRQ
esp_mem_readb reg[5]: 0x18
esp_mem_readb reg[8]: 0x07
esp_mem_writeb reg[8]: 0x07 -> 0x47
esp_mem_writeb reg[3]: 0x41 -> 0x03
esp_mem_writeb_cmd_bus_reset Bus reset (0x03)
******


The loading of the "test unit ready" command and execution look fine to me:=
 QEMU's SCSI layer is executing the command (indicating success) and raises=
 the ESP IRQ. However at this point in the section marked by "******" the A=
SPI driver seems not be happy with the RSTAT/RINTR register contents or the=
 0x18 read back from the PCI DMA registers, issues a bus reset and stops.

What is interesting here is that the "Select without ATN (0x41)" command
issued is a non-DMA command so I wouldn't expect it to affect the ESP
PCI DMA register state, but I suspect you'll need to have a look what
the driver is doing using a disassembler/gdbstub and the am53c974
datasheet to try and understand what is happening here.

Finally it may be worth checking the IRQ routing with -trace 'pci*' to
see if SeaBIOS updates the PCI "Interrupt Pin" register indicating where
it thinks the IRQ should be routed, and stepping through the
esp_raise_irq() in QEMU for the final test unit ready command to ensure
that all of QEMU, SeaBIOS and AMSIDA.SYS all agree on what IRQ is being
used.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921635

Title:
  ESP SCSI adapter not working with DOS ASPI drivers

Status in QEMU:
  New

Bug description:
  I have been trying to install the DOS ASPI drivers for the ESP scsi
  card. Both in am53c974 and dc390 modes. Neither works but they don't
  work in different ways.

  The following things appear to be problematic:

  * The am53c974 should work with the PcSCSI drivers (AMSIDA.SYS) but the A=
SPI driver never manages to get past initializing the card. The VM never co=
ntinues.
  * The dc390 ASPI driver fares a little better. The ASPI driver loads and =
is semi-functional but the drivers for the peripherals don't work.
   - ASPI.SYS (creative name) loads
   - TRMDISK.SYS fails to load when a cd-drive is attached and will crashs =
scanning the scsi-id where the cd drive is attached
   - TRMDISK.SYS loads without a CD drive attached but fails to read any sc=
si-hd devices attached. The TFDISK.EXE formatter crashes.
   - TRMCD.SYS loads, but can not detect any CD drives.

  The various permutations:
  am53c974 hang on ASPI driver load: (CD only attached)

  ~/src/qemu/build/qemu-system-i386 -m 64 -device am53c974,id=3Dscsi0
  -device scsi-cd,drive=3Ddrive0,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=
=3D0
  -drive file=3D../Windows\ 98\ Second\ Edition.iso,if=3Dnone,id=3Ddrive0 -=
vga
  cirrus -fda am53c974_aspi.img -bios /home/hp/src/seabios/out/bios.bin
  -boot a  -trace 'scsi*' -trace 'esp*' -D log

  dc390 crash because of CDROM attachment and loading TRMDISK.SYS (Only CD =
attached)
  ~/src/qemu/build/qemu-system-i386 -m 64 -device dc390,id=3Dscsi0,rombar=
=3D0 -device scsi-cd,drive=3Ddrive0,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,l=
un=3D0 -drive file=3D../Windows\ 98\ Second\ Edition.iso,if=3Dnone,id=3Ddri=
ve0 -vga cirrus -fda dc390_all.img  -bios /home/hp/src/seabios/out/bios.bin=
 -boot a  -trace 'scsi*' -trace 'esp*' -D log

  dc390 successful boot, but TRMDISK.SYS not working (TFDISK.EXE will crash)
  ~/src/qemu/build/qemu-system-i386 -m 64 -device dc390,id=3Dscsi0 -device =
scsi-hd,drive=3Ddrive0,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,lun=3D0,logica=
l_block_size=3D512 -drive file=3Dsmall.qcow2,if=3Dnone,id=3Ddrive0 -vga cir=
rus -fda dc390_all.img -bios /home/hp/src/seabios/out/bios.bin -boot a  -tr=
ace 'scsi*' -trace 'esp*' -D log

  dc390 successful boot, TRMDISK.SYS not loaded, only TRMCD.SYS. CDROM not =
detected
  ~/src/qemu/build/qemu-system-i386 -m 64 -device dc390,id=3Dscsi0,rombar=
=3D0 -device scsi-cd,drive=3Ddrive0,bus=3Dscsi0.0,channel=3D0,scsi-id=3D0,l=
un=3D0 -drive file=3D../Windows\ 98\ Second\ Edition.iso,if=3Dnone,id=3Ddri=
ve0 -vga cirrus -fda dc390_cd.img  -bios /home/hp/src/seabios/out/bios.bin =
-boot a  -trace 'scsi*' -trace 'esp*' -D log

  All of these tests were done on
  7b9a3c9f94bcac23c534bc9f42a9e914b433b299 as well as the 'esp-next'
  branch found here: https://github.com/mcayland/qemu/tree/esp-next

  The bios file is a seabios master with all int13 support disabled.
  With it enabled even less works but I figured this would be a seabios
  bug and not a qemu one.

  The actual iso and qcow2 files used don't appear the matter. the
  'small.qcow2' is an empty drive of 100MB. I have also tried other ISOs
  in the CD drives, or even not put any cd in the drives with the same
  results.

  I will attach all of the above images.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921635/+subscriptions

