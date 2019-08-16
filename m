Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2128FECA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 11:21:34 +0200 (CEST)
Received: from localhost ([::1]:52178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyYQP-0005H9-OS
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 05:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57251)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1hyYPZ-0004mF-4w
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 05:20:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hyYPX-0004nx-MX
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 05:20:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:55202)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hyYPX-0004nc-Gu
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 05:20:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hyYPW-0008RE-8x
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 09:20:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 42B862E80C7
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 09:20:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Aug 2019 09:06:26 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1839428@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: maxujun philmd
X-Launchpad-Bug-Reporter: Xujun Ma (maxujun)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <156524772160.13996.4537778553837159229.malonedeb@wampee.canonical.com>
Message-Id: <156594638675.16537.17081821816860005098.malone@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19022";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 2d9f72bbd63d6c939342751cdbf23bbd0d609359
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1839428] Re: qemu core dumped when repeat
 "system_reset" multiple times during guest boot
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
Reply-To: Bug 1839428 <1839428@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This issue is very hard to reproduce.

It sometimes crashes, so I could mark few commits 'bad' while bisecting,
but since it is not reliable, I'm not sure a commit is 'good' when there
is no crash.

For now after hours of testing I could reduce Xujun Ma's range to
qemu-v3.1.0..1d31f1872b:

commit 1d31f1872b337e4acac5bf6b3c2a45b66e43b494 (refs/bisect/bad)
Merge: 20b084c4b1 88c869198a
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Mon Mar 4 11:04:31 2019 +0000

    Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng
    =

    pci, pc, virtio: fixes, cleanups, tests
    =

    Lots of work on tests: BiosTablesTest UEFI app,
    vhost-user testing for non-Linux hosts.
    Misc cleanups and fixes all over the place
    =

    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
    =

    * remotes/mst/tags/for_upstream: (26 commits)
      pci: Sanity test minimum downstream LNKSTA
      hw/smbios: fix offset of type 3 sku field
      pci: Move NVIDIA vendor id to the rest of ids
      virtio-balloon: Safely handle BALLOON_PAGE_SIZE < host page size
      virtio-balloon: Use ram_block_discard_range() instead of raw madvise()
      virtio-balloon: Rework ballon_page() interface
      virtio-balloon: Corrections to address verification
      virtio-balloon: Remove unnecessary MADV_WILLNEED on deflate
      i386/kvm: ignore masked irqs when update msi routes
      contrib/vhost-user-blk: fix the compilation issue
      Revert "contrib/vhost-user-blk: fix the compilation issue"
      pc-dimm: use same mechanism for [get|set]_addr
      tests/data: introduce "uefi-boot-images" with the "bios-tables-test" =
ISOs
      tests/uefi-test-tools: add build scripts
      tests: introduce "uefi-test-tools" with the BiosTablesTest UEFI app
      roms: build the EfiRom utility from the roms/edk2 submodule
      roms: add the edk2 project as a git submodule
      vhost-user-test: create a temporary directory per TestServer
      vhost-user-test: small changes to init_hugepagefs
      vhost-user-test: create a main loop per TestServer
      ...

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1839428

Title:
   qemu core dumped when repeat "system_reset" multiple times during
  guest boot

Status in QEMU:
  Confirmed

Bug description:
  commit 864ab314f1d924129d06ac7b571f105a2b76a4b2 (HEAD, tag: v4.1.0-rc4, o=
rigin/master, origin/HEAD, master)
  Test arch:x86 and power

  Steps:
  1.Boot up guest with command
  power cmdline:
  /usr/libexec/backup/qemu-kvm \
   -smp 8 \
   -m 4096 \
   -nodefaults \
   -device virtio-blk-pci,id=3Dimage1,drive=3Ddrive_image1,bootindex=3D1,bu=
s=3Dpci.0,addr=3D0x7 \
   -drive file=3Drhel77-ppc64le-virtio.qcow2,if=3Dnone,id=3Ddrive_image1,fo=
rmat=3Dqcow2,cache=3Dnone \
   -chardev stdio,mux=3Don,id=3Dserial_id_serial0,server,nowait,signal=3Dof=
f \
   -device spapr-vty,id=3Dserial111,chardev=3Dserial_id_serial0 \
   -mon chardev=3Dserial_id_serial0,mode=3Dreadline \
  x86 cmdline:
  /usr/libexec/qemu-kvm \
   -m 4096 -smp 8 \
   -boot menu=3Don \
   -device virtio-blk-pci,id=3Dimage1,drive=3Ddrive_image1\
   -drive file=3Drhel77-64-virtio.qcow2,if=3Dnone,id=3Ddrive_image1,format=
=3Dqcow2,cache=3Dnone \
   -vga std \
   -vnc :9 \
   -nographic \
   -device virtio-net-pci,netdev=3Dnet0,id=3Dnic0,mac=3D52:54:00:c4:e7:84 \
   -netdev tap,id=3Dnet0,script=3D/etc/qemu-ifup,downscript=3D/etc/qemu-ifd=
own,vhost=3Don \

  2.when guest start to boot up kernel(when no output infomation),run
  hmp command "system_reset"

  =

  Result:

  Sometimes,qemu core dumped with error as following:
  system_reset
  (qemu) qemu-system-ppc64: /root/qemu/hw/virtio/virtio.c:225: vring_get_re=
gion_caches: Assertion `caches !=3D NULL' failed.
  b.sh: line 11: 73679 Aborted                 (core dumped) /usr/local/bin=
/qemu-system-ppc64 -enable-kvm -smp 8 -m 4096 -nodefaults -device virtio-bl=
k-pci,id=3Dimage1,drive=3Ddrive_image1,bootindex=3D1,bus=3Dpci.0,addr=3D0x7=
 -drive file=3Drhel77-ppc64le-virtio.qcow2,if=3Dnone,id=3Ddrive_image1,form=
at=3Dqcow2,cache=3Dnone -chardev stdio,mux=3Don,id=3Dserial_id_serial0,serv=
er,nowait,signal=3Doff -device spapr-vty,id=3Dserial111,chardev=3Dserial_id=
_serial0 -mon chardev=3Dserial_id_serial0,mode=3Dreadline

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1839428/+subscriptions

