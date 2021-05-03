Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8719737180C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 17:31:23 +0200 (CEST)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldaXa-0006ox-Au
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 11:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldaSV-00030f-6C
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:26:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:46508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldaSS-0004Jm-EW
 for qemu-devel@nongnu.org; Mon, 03 May 2021 11:26:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldaSQ-0002fS-8B
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 15:26:02 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3BB932E8157
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 15:26:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 15:12:55 -0000
From: Firecode95 <1926952@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: firecode95 marcandre-lureau
X-Launchpad-Bug-Reporter: Firecode95 (firecode95)
X-Launchpad-Bug-Modifier: Firecode95 (firecode95)
References: <162004304487.4348.9374620020070858180.malonedeb@chaenomeles.canonical.com>
Message-Id: <162005477520.11857.2458897299540954750.malone@soybean.canonical.com>
Subject: [Bug 1926952] Re: SPICE support broken with 6.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: afde5c6094c825ff9726316bb681aac14d984867
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1926952 <1926952@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After launching qemu I have qemu display from intel gpu(gvt-g), terminal
output of launched script. After that launching in terminal separate
instance remote-viewer for spice to passthru usb devices - spice dislay
is blank, that was also in 5.x versions, but just now to get spice
running I need to patch check to always return true. As I understood I
have egl-headless window as there is fully aclerated guest video output:

Full comand that I am running is as follow:

DIR=3D"$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cp /home/firecode95/.config/pulse/cookie /root/.config/pulse/cookie
/usr/bin/qemu-system-x86_64 \
-name guest=3Dwindows10 \
-machine q35,accel=3Dkvm,vmport=3Doff,kernel_irqchip=3Don \
-cpu host,hv_time,kvm=3Doff,hv-relaxed,hv-vapic,kvm-asyncpf-int,topoext,hos=
t-cache-info=3Don,check,hv_stimer,hv_synic,hv_vpindex,-hypervisor,hv_spinlo=
cks=3D0x1fff,hv_vapic \
-enable-kvm \
-drive if=3Dpflash,format=3Draw,readonly=3Don,file=3D$DIR/OVMF_CODE.fd \
-drive if=3Dpflash,format=3Draw,file=3D$DIR/OVMF_VARS.fd \
-smp 12,sockets=3D1,dies=3D1,cores=3D6,threads=3D2 \
-mem-path /dev/hugepages \
-m 8G \
-uuid e7d44285-507b-48da-bfe2-2eba415016bd \
-no-user-config \
-nodefaults \
-no-hpet \
-rtc base=3Dlocaltime \
-global PIIX4_PM.disable_s3=3D0 \
-global ICH9-LPC.disable_s3=3D1 \
-global ICH9-LPC.disable_s4=3D1 \
-global isa-debugcon.iobase=3D0x402 \
-debugcon file:/tmp/windows_10.ovmf.log \
-monitor stdio \
-boot menu=3Don,strict=3Don \
-device pcie-root-port,port=3D0x0,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multi=
function=3Don,addr=3D0x1 \
-device pcie-root-port,port=3D0x9,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,addr=
=3D0x1.0x1 \
-device pcie-root-port,port=3D0xa,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,addr=
=3D0x1.0x2 \
-device pcie-root-port,port=3D0xb,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,addr=
=3D0x1.0x3 \
-device pcie-root-port,port=3D0xc,chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,addr=
=3D0x1.0x4 \
-device pcie-root-port,port=3D0xd,chassis=3D6,id=3Dpci.6,bus=3Dpcie.0,addr=
=3D0x1.0x5 \
-device i82801b11-bridge,id=3Dpci.7,bus=3Dpcie.0,addr=3D0x1e \
-device pci-bridge,chassis_nr=3D8,id=3Dpci.8,bus=3Dpci.7,addr=3D0x0 \
-device ich9-usb-ehci1,id=3Dusb,bus=3Dpcie.0,addr=3D0x1d.0x7 \
-device ich9-usb-uhci1,masterbus=3Dusb.0,firstport=3D0,bus=3Dpcie.0,multifu=
nction=3Don,addr=3D0x1d \
-device ich9-usb-uhci2,masterbus=3Dusb.0,firstport=3D2,bus=3Dpcie.0,addr=3D=
0x1d.0x1 \
-device ich9-usb-uhci3,masterbus=3Dusb.0,firstport=3D4,bus=3Dpcie.0,addr=3D=
0x1d.0x2 \
-device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Dpci.3,addr=3D0x0 \
-object iothread,id=3Diothread0 \
-device virtio-scsi-pci,iothread=3Diothread0,num_queues=3D8,id=3Dscsi0,bus=
=3Dpcie.0,addr=3D0x3 \
-drive file=3D$DIR/virtio-win-0.1.185.iso,media=3Dcdrom,bus=3D2 \
-drive if=3Dnone,id=3Dhd1,file=3D$DIR/$1.qcow2,format=3Dqcow2,cache.direct=
=3Don,discard=3Dunmap,aio=3Dthreads \
-device scsi-hd,drive=3Dhd1 \
-object input-linux,id=3Dkbd1,evdev=3D/dev/input/by-path/platform-i8042-ser=
io-0-event-kbd,grab_all=3Don,repeat=3Don \
-acpitable file=3D$DIR/SSDT1.dat \
-msg timestamp=3Don \
-netdev type=3Dtap,id=3Dnet0,ifname=3Dtap1,script=3D$DIR/tap_ifup,downscrip=
t=3D$DIR/tap_ifdown,vhost=3Don \
-device virtio-net-pci,netdev=3Dnet0,mac=3D52:54:BE:EF:A1:67,bus=3Dpci.5,ad=
dr=3D0x0 \
-spice port=3D5902,addr=3D127.0.0.1,disable-ticketing=3Don \
-device virtserialport,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchannel0=
,id=3Dchannel0,name=3Dcom.redhat.spice.0 \
-display gtk,gl=3Don \
-device vfio-pci,id=3Dhostdev2,driver=3Dvfio-pci-nohotplug,romfile=3D/sys/d=
evices/pci0000:00/0000:00:02.0/gvt_firmware,sysfsdev=3D/sys/bus/mdev/device=
s/1ae40c36-b180-4af0-8fab-c27de21f597d,x-igd-opregion=3Don,ramfb=3Don,displ=
ay=3Don,xres=3D1920,yres=3D1080,bus=3Dpcie.0,multifunction=3Don,addr=3D0x2 \
-device vfio-pci,host=3D0000:01:00.0,id=3Dhostdev0,bus=3Dpci.1,multifunctio=
n=3Don,addr=3D0x0,x-pci-sub-vendor-id=3D0x17aa,x-pci-sub-device-id=3D0x39fd=
 \
-device vfio-pci,host=3D0000:01:00.1,id=3Dhostdev1,bus=3Dpci.1,addr=3D0x0.0=
x1 \
-chardev pty,id=3Dcharserial0 \
-device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \
-chardev spicevmc,id=3Dcharchannel0,name=3Dvdagent \
-chardev spicevmc,id=3Dcharredir0,name=3Dusbredir \
-device usb-redir,chardev=3Dcharredir0,id=3Dredir0,bus=3Dusb.0,port=3D1 \
-chardev spicevmc,id=3Dcharredir1,name=3Dusbredir \
-device usb-redir,chardev=3Dcharredir1,id=3Dredir1,bus=3Dusb.0,port=3D2 \
-chardev spicevmc,id=3Dcharredir2,name=3Dusbredir \
-device usb-redir,chardev=3Dcharredir2,id=3Dredir2,bus=3Dusb.0,port=3D3 \
-device ich9-intel-hda \
-device hda-micro,audiodev=3Dhda \
-audiodev pa,id=3Dhda,server=3D/run/user/1000/pulse/native \
-device usb-host,hostbus=3D1,hostport=3D12

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1926952

Title:
  SPICE support broken with 6.0

Status in QEMU:
  New

Bug description:
  Using latest relase 6.0.0 while using Intel GVT-G DMA-BUF and SPICE
  for usb redirection Qemu won't start:

  qemu-system-x86_64: The console requires display DMABUF support.

  However just patching ui/console.c:

  if (flags & GRAPHIC_FLAGS_DMABUF &&
          !displaychangelistener_has_dmabuf(dcl)) {
          error_setg(errp, "The console requires display DMABUF support.");
          return false;
  }

  to always return true for dmabuf part works just fine:

  if (flags & GRAPHIC_FLAGS_DMABUF &&
          !displaychangelistener_has_dmabuf(dcl)) {
          error_setg(errp, "The console requires display DMABUF support.");
          return true;
  }

  This behavior wasn't in qemu 5.x version.

  To reproduce this bug need to use:

  /usr/bin/qemu-system-x86_64 \
  -machine q35 \
  -enable-kvm \
  -no-user-config \
  -nodefaults \
  -no-hpet \
  -display gtk,gl=3Don \
  -device pcie-root-port,port=3D0x0,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,mul=
tifunction=3Don,addr=3D0x1 \
  -device vfio-pci,id=3Dhostdev2,driver=3Dvfio-pci-nohotplug,romfile=3D/sys=
/devices/pci0000:00/0000:00:02.0/gvt_firmware,sysfsdev=3D/sys/bus/mdev/devi=
ces/1ae40c36-b180-4af0-8fab-c27de21f597d,x-igd-opregion=3Don,ramfb=3Don,dis=
play=3Don,xres=3D1920,yres=3D1080,bus=3Dpcie.0,multifunction=3Don,addr=3D0x=
2 \
  -spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1926952/+subscriptions

