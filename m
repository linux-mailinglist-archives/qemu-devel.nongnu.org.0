Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6409C369AFC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 21:41:58 +0200 (CEST)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la1ga-0002hz-VD
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 15:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1la1fZ-0002Iq-5n
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 15:40:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:60136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1la1fV-0005CH-O3
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 15:40:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1la1fT-0006UE-DB
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 19:40:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 60D032E8050
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 19:40:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Apr 2021 19:33:24 -0000
From: Ivan Vulovic <1916775@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: whpx windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: abdurrahim-cakar ivanvx
X-Launchpad-Bug-Reporter: Abdurrahim (abdurrahim-cakar)
X-Launchpad-Bug-Modifier: Ivan Vulovic (ivanvx)
References: <161418362907.7833.18159388399676261767.malonedeb@soybean.canonical.com>
Message-Id: <161920640435.16631.3891248688520521048.malone@chaenomeles.canonical.com>
Subject: [Bug 1916775] Re: Guest freezes until there is a keyboard input on
 Windows version
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f9f562f07f129de414c16be22a405ff0964e0018"; Instance="production"
X-Launchpad-Hash: 80fe397ac20077964e984748e661bd7309098912
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
Reply-To: Bug 1916775 <1916775@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I run into this behavior too. Win10 Home guest, PCI-passthrough graphics
(GTX 1650), host cpu (Ryzen 7 3800XT). Occurs whether or not I use the
qcow disk drive.

qemu-system-x86_64 =

  -cpu host,kvm=3Don,l3-cache=3Don,hv_relaxed,hv_vapic,hv_time,hv_spinlocks=
=3D0x1fff,hv_vendor_id=3Dhv_dummy =

  -smp 8 =

  -rtc clock=3Dhost,base=3Dlocaltime =

  -machine type=3Dq35,accel=3Dkvm,kernel_irqchip=3Don =

  -enable-kvm =

  -drive if=3Dpflash,format=3Draw,readonly,file=3D/usr/share/OVMF/OVMF_CODE=
.fd =

  -drive if=3Dpflash,format=3Draw,file=3D/tmp/OVMF_VARS.fd =

  -m 32G =

  -usb =

  -device usb-tablet =

  -vga none =

  -serial none =

  -parallel none =

  -boot cd =

  -nographic =

  -device usb-host,vendorid=3D0x045e,productid=3D0x00db =

  -device usb-host,vendorid=3D0x1bcf,productid=3D0x0005 =

  -drive id=3Ddisk0,index=3D0,format=3Dqcow2,if=3Dvirtio,cache=3Doff,file=
=3D./win10_boot_priv.qcow2 =

  -drive id=3Ddisk2,index=3D2,aio=3Dnative,cache.direct=3Don,if=3Dvirtio,ca=
che=3Doff,format=3Draw,discard=3Dunmap,detect-zeroes=3Dunmap,file=3D/dev/vg=
0/win10_hdpriv =

  -device vfio-pci,host=3D09:00.0,addr=3D0x02.0x0,multifunction=3Don =

  -device vfio-pci,host=3D09:00.1,addr=3D0x02.0x1 =

  -device vfio-pci,host=3D09:00.2,addr=3D0x02.0x2 =

  -device vfio-pci,host=3D09:00.3,addr=3D0x02.0x3 =

  -netdev tap,id=3Dnetid,ifname=3Dtaplan,script=3Dno,downscript=3Dno =

  -device e1000,netdev=3Dnetid,mac=3D52:54:00:01:02:03

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1916775

Title:
  Guest freezes until there is a keyboard input on Windows version

Status in QEMU:
  New

Bug description:
  I am using Qemu for Windows and when I try to run this for Windows
  guests then the guests are freezing and waiting for keyboard input and
  it continues to function after I press a key. I am using Windows10
  Home and below is the command I use to run the guest. I have suspected
  if this is caused by random entropy but even with mouse moving it
  gives same random locks and it continues to work as soon as I press a
  key so maybe its not about entropy at all,

  startwinguest.bat:
  qemu-system-x86_64 ^
  =C2=A0-name "win" ^
  =C2=A0-machine type=3Dq35,accel=3Dwhpx ^
  =C2=A0-cpu EPYC,hv_relaxed,hv_time,topoext   ^
  =C2=A0-nodefaults ^
  =C2=A0-usb ^
  =C2=A0-rtc base=3Dlocaltime,driftfix=3Dslew ^
  =C2=A0-smp 6,sockets=3D1,cores=3D3,threads=3D2 ^
  =C2=A0-m 8192 -mem-prealloc ^
  =C2=A0-soundhw hda ^
  =C2=A0-usbdevice tablet ^
  =C2=A0-netdev user,id=3Dmynet0,hostfwd=3Dtcp::3390-:3389 -device virtio-n=
et,netdev=3Dmynet0 ^
  =C2=A0-vga std ^
  =C2=A0-display gtk ^
  =C2=A0-boot d ^
  =C2=A0-device virtio-scsi-pci,id=3Dscsi0 ^
  =C2=A0-drive "file=3D%~dp0win10.qcow2,if=3Dnone,format=3Dqcow2,discard=3D=
unmap,aio=3Dthreads,cache=3Dwritethrough,id=3Dsomeid" ^
  =C2=A0-device scsi-hd,drive=3Dsomeid,bus=3Dscsi0.0 ^
  =C2=A0-drive "file=3DD:\Setups\OS\Windows\en_windows_server_2019_updated_=
dec_2020_x64_dvd_36e0f791.iso,media=3Dcdrom,index=3D1" ^
  =C2=A0-drive "file=3D%~dp0virtio-win-0.1.185.iso,media=3Dcdrom,index=3D2"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1916775/+subscriptions

