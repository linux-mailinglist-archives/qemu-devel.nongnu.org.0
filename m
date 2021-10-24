Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355184386C0
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 06:28:20 +0200 (CEST)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meV7L-0001ab-BZ
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 00:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1meV5k-0000Cz-9w
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 00:26:40 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:35874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1meV5e-0008FL-H3
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 00:26:40 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id C65BD40309
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 04:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1635049579;
 bh=u5stP4JeWTNLxA9toukDjatmCigZsCW7S0s3wOf30nQ=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=ucAiiA2GWegefQpkY+FoFFzg7AZ7V4bwisXVenKxI4tDHSBKaqU7oCkCblWCMUlQc
 07XpEblaGlFpRd+QivBoVZSDpCazPJgWyK5MGJGcIdNp8PcWNM0vRXyOufPXimnPLH
 CskKe204661OnBs0LmXYQfw6Hb/56QOilmlcutMzbsIF4tuhRtkOC/iHNSo8iZO73n
 2mOePriAFnVoDx8bIN8BxcQNrY0POCNNjmNcsHRdMv/p635U/gKSImXwX1NdfotGem
 FQiNZ2IUGhx6ZYQckEd4BGH4Tm/l4EX+9bXxMrQ7CEVKSNZ2fra3hG0XSA0c7Wc5vS
 ZYTL+aES3aPhw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A64582E820B
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 04:26:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 Oct 2021 04:17:33 -0000
From: Launchpad Bug Tracker <1921664@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Expired; importance=Low; assignee=None; 
X-Launchpad-Bug-Tags: apport-bug arm64 hirsute uec-images
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor paelzer th-huth tommy-ubuntuone
X-Launchpad-Bug-Reporter: Tommy Thorn (tommy-ubuntuone)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <161698578843.25105.11508850027610231738.malonedeb@wampee.canonical.com>
Message-Id: <163504905369.13724.14866207012225490558.malone@loganberry.canonical.com>
Subject: [Bug 1921664] Re: Coroutines are racy for risc64 emu on arm64 - crash
 on Assertion
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="077cd577c00fa794e72ab856f950ae412860db5f"; Instance="production"
X-Launchpad-Hash: 9ce115adc1624325a4aa762731f2814b421f2274
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1921664 <1921664@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1921664

Title:
  Coroutines are racy for risc64 emu on arm64 - crash on Assertion

Status in QEMU:
  Expired
Status in qemu package in Ubuntu:
  Expired

Bug description:
  Note: this could as well be "riscv64 on arm64" for being slow@slow and af=
fect
  other architectures as well.

  The following case triggers on a Raspberry Pi4 running with arm64 on
  Ubuntu 21.04 [1][2]. It might trigger on other environments as well,
  but that is what we have seen it so far.

     $ wget https://github.com/carlosedp/riscv-bringup/releases/download/v1=
.0/UbuntuFocal-riscv64-QemuVM.tar.gz
     $ tar xzf UbuntuFocal-riscv64-QemuVM.tar.gz
     $ ./run_riscvVM.sh
  (wait ~2 minutes)
     [ OK ] Reached target Local File Systems (Pre).
     [ OK ] Reached target Local File Systems.
              Starting udev Kernel Device Manager...
  qemu-system-riscv64: ../../util/qemu-coroutine-lock.c:57: qemu_co_queue_w=
ait_impl: Assertion `qemu_in_coroutine()' failed.

  This is often, but not 100% reproducible and the cases differ slightly we
  see either of:
  - qemu-system-riscv64: ../../util/qemu-coroutine-lock.c:57: qemu_co_queue=
_wait_impl: Assertion `qemu_in_coroutine()' failed.
  - qemu-system-riscv64: ../../block/aio_task.c:64: aio_task_pool_wait_one:=
 Assertion `qemu_coroutine_self() =3D=3D pool->main_co' failed.

  Rebuilding working cases has shown to make them fail, as well as rebulding
  (or even reinstalling) bad cases has made them work. Also the same builds=
 on
  different arm64 CPUs behave differently. TL;DR: The full list of conditio=
ns
  influencing good/bad case here are not yet known.

  [1]: https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry=
-pi#1-overview
  [2]: http://cdimage.ubuntu.com/daily-preinstalled/pending/hirsute-preinst=
alled-desktop-arm64+raspi.img.xz

 =20
  --- --- original report --- ---

  I regularly run a RISC-V (RV64GC) QEMU VM, but an update a few days
  ago broke it.  Now when I launch it, it hits an assertion:

  OpenSBI v0.6
  =C2=A0=C2=A0=C2=A0____                    _____ ____ _____
  =C2=A0=C2=A0/ __ \                  / ____|  _ \_   _|
  =C2=A0| |  | |_ __   ___ _ __ | (___ | |_) || |
  =C2=A0| |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
  =C2=A0| |__| | |_) |  __/ | | |____) | |_) || |_
  =C2=A0=C2=A0\____/| .__/ \___|_| |_|_____/|____/_____|
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| |
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|_|

  ...
  Found /boot/extlinux/extlinux.conf
  Retrieving file: /boot/extlinux/extlinux.conf
  618 bytes read in 2 ms (301.8 KiB/s)
  RISC-V Qemu Boot Options
  1:      Linux kernel-5.5.0-dirty
  2:      Linux kernel-5.5.0-dirty (recovery mode)
  Enter choice: 1:        Linux kernel-5.5.0-dirty
  Retrieving file: /boot/initrd.img-5.5.0-dirty
  qemu-system-riscv64: ../../block/aio_task.c:64: aio_task_pool_wait_one: A=
ssertion `qemu_coroutine_self() =3D=3D pool->main_co' failed.
  ./run.sh: line 31:  1604 Aborted                 (core dumped) qemu-syste=
m-riscv64 -machine virt -nographic -smp 8 -m 8G -bios fw_payload.bin -devic=
e virtio-blk-devi
  ce,drive=3Dhd0 -object rng-random,filename=3D/dev/urandom,id=3Drng0 -devi=
ce virtio-rng-device,rng=3Drng0 -drive file=3Driscv64-UbuntuFocal-qemu.qcow=
2,format=3Dqcow2,id=3Dhd0 -devi
  ce virtio-net-device,netdev=3Dusernet -netdev user,id=3Dusernet,$ports

  Interestingly this doesn't happen on the AMD64 version of Ubuntu 21.04
  (fully updated).

  Think you have everything already, but just in case:

  $ lsb_release -rd
  Description:    Ubuntu Hirsute Hippo (development branch)
  Release:        21.04

  $ uname -a
  Linux minimacvm 5.11.0-11-generic #12-Ubuntu SMP Mon Mar 1 19:27:36 UTC 2=
021 aarch64 aarch64 aarch64 GNU/Linux
  (note this is a VM running on macOS/M1)

  $ apt-cache policy qemu
  qemu:
  =C2=A0=C2=A0Installed: 1:5.2+dfsg-9ubuntu1
  =C2=A0=C2=A0Candidate: 1:5.2+dfsg-9ubuntu1
  =C2=A0=C2=A0Version table:
  =C2=A0*** 1:5.2+dfsg-9ubuntu1 500
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0500 http://ports.ubuntu.c=
om/ubuntu-ports hirsute/universe arm64 Packages
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0100 /var/lib/dpkg/status

  ProblemType: Bug
  DistroRelease: Ubuntu 21.04
  Package: qemu 1:5.2+dfsg-9ubuntu1
  ProcVersionSignature: Ubuntu 5.11.0-11.12-generic 5.11.0
  Uname: Linux 5.11.0-11-generic aarch64
  ApportVersion: 2.20.11-0ubuntu61
  Architecture: arm64
  CasperMD5CheckResult: unknown
  CurrentDmesg:
  =C2=A0Error: command ['pkexec', 'dmesg'] failed with exit code 127: polki=
t-agent-helper-1: error response to PolicyKit daemon: GDBus.Error:org.freed=
esktop.PolicyKit1.Error.Failed: No session for cookie
  =C2=A0Error executing command as another user: Not authorized

  =C2=A0This incident has been reported.
  Date: Mon Mar 29 02:33:25 2021
  Dependencies:

  KvmCmdLine: COMMAND         STAT  EUID  RUID     PID    PPID %CPU COMMAND
  Lspci-vt:
  =C2=A0-[0000:00]-+-00.0  Apple Inc. Device f020
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=
-01.0  Red Hat, Inc. Virtio network device
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=
-05.0  Red Hat, Inc. Virtio console
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0+=
-06.0  Red Hat, Inc. Virtio block device
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\=
-07.0  Red Hat, Inc. Virtio RNG
  Lsusb: Error: command ['lsusb'] failed with exit code 1:
  Lsusb-t:

  Lsusb-v: Error: command ['lsusb', '-v'] failed with exit code 1:
  ProcEnviron:
  =C2=A0TERM=3Dscreen
  =C2=A0PATH=3D(custom, no user)
  =C2=A0XDG_RUNTIME_DIR=3D<set>
  =C2=A0LANG=3DC.UTF-8
  =C2=A0SHELL=3D/bin/bash
  ProcKernelCmdLine: console=3Dhvc0 root=3D/dev/vda
  SourcePackage: qemu
  UpgradeStatus: Upgraded to hirsute on 2020-12-30 (88 days ago)
  acpidump:
  =C2=A0Error: command ['pkexec', '/usr/share/apport/dump_acpi_tables.py'] =
failed with exit code 127: polkit-agent-helper-1: error response to PolicyK=
it daemon: GDBus.Error:org.freedesktop.PolicyKit1.Error.Failed: No session =
for cookie
  =C2=A0Error executing command as another user: Not authorized

  =C2=A0This incident has been reported.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1921664/+subscriptions


