Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7477E333D7
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 17:47:49 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXpBc-0006oP-L2
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 11:47:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hXp9y-000689-7R
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:46:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hXp9w-0002DY-L0
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:46:06 -0400
Received: from indium.canonical.com ([91.189.90.7]:60550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hXp9w-0002Aq-E8
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 11:46:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hXp9t-00087O-DR
	for <qemu-devel@nongnu.org>; Mon, 03 Jun 2019 15:46:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 7895B2E80D5
	for <qemu-devel@nongnu.org>; Mon,  3 Jun 2019 15:46:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Jun 2019 15:35:12 -0000
From: Andrew Randrianasulu <1830872@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee andrew-randrianasulu lersek
X-Launchpad-Bug-Reporter: Laszlo Ersek (Red Hat) (lersek)
X-Launchpad-Bug-Modifier: Andrew Randrianasulu (andrew-randrianasulu)
References: <155912118291.12579.8926874795813611531.malonedeb@soybean.canonical.com>
	<20190603150120.29255-1-alex.bennee@linaro.org>
Message-Id: <201906031835.13420.randrianasulu@gmail.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: a85eba228f5f865d6ff569bfcdf4c26587e3e1ff
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1830872] Re: [RFC PATCH] cputlb: use uint64_t for
 interim values for unaligned load
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1830872 <1830872@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
Monday 03 June 2019 18:01:20 Alex Benn=C3=A9e =D0=BD=D0=B0=D0=BF=D0=B8=D1=
=81=D0=B0=D0=BB(=D0=B0):
> When running on 32 bit TCG backends a wide unaligned load ends up
> truncating data before returning to the guest. We specifically have
> the return type as uint64_t to avoid any premature truncation so we
> should use the same for the interim types.
> =

> Hopefully fixes #1830872
> =

> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  accel/tcg/cputlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index cdcc3771020..b796ab1cbea 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1303,7 +1303,7 @@ load_helper(CPUArchState *env, target_ulong addr, T=
CGMemOpIdx oi,
>          && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
>                      >=3D TARGET_PAGE_SIZE)) {
>          target_ulong addr1, addr2;
> -        tcg_target_ulong r1, r2;
> +        uint64_t r1, r2;
>          unsigned shift;
>      do_unaligned_access:
>          addr1 =3D addr & ~(size - 1);

Unfortunatly, this doesn't fix 32-bit qemu-system-x86_64 .... so, my bug
is separate from #1830872 ?

I also was unable to convince qemu to use my kernel-only x86_64 gcc 6.5.0 c=
ross-compiler ..
probably x86-64 testing on i686 requires either docker (I don't have this
) or 'real' cross-compiler (build with glibc support).

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1830872

Title:
  AARCH64 to ARMv7 mistranslation in TCG

Status in QEMU:
  New

Bug description:
  The following guest code:

  https://github.com/tianocore/edk2/blob/3604174718e2afc950c3cc64c64ba5165c=
8692bd/MdePkg/Library/BaseMemoryLibOptDxe/AArch64/CopyMem.S

  implements, in hand-optimized aarch64 assembly, the CopyMem() edk2 (EFI
  Development Kit II) library function. (CopyMem() basically has memmove()
  semantics, to provide a standard C analog here.) The relevant functions
  are InternalMemCopyMem() and __memcpy().

  When TCG translates this aarch64 code to x86_64, everything works
  fine.

  When TCG translates this aarch64 code to ARMv7, the destination area of
  the translated CopyMem() function becomes corrupted -- it differs from
  the intended source contents. Namely, in every 4096 byte block, the
  8-byte word at offset 4032 (0xFC0) is zeroed out in the destination,
  instead of receiving the intended source value.

  I'm attaching two hexdumps of the same destination area:

  - "good.txt" is a hexdump of the destination area when CopyMem() was
    translated to x86_64,

  - "bad.txt" is a hexdump of the destination area when CopyMem() was
    translated to ARMv7.

  In order to assist with the analysis of this issue, I disassembled the
  aarch64 binary with "objdump". Please find the listing in
  "DxeCore.objdump", attached. The InternalMemCopyMem() function starts at
  hex offset 2b2ec. The __memcpy() function starts at hex offset 2b180.

  And, I ran the guest on the ARMv7 host with "-d
  in_asm,op,op_opt,op_ind,out_asm". Please find the log in
  "tcg.in_asm.op.op_opt.op_ind.out_asm.log", attached.

  The TBs that correspond to (parts of) the InternalMemCopyMem() and
  __memcpy() functions are scattered over the TCG log file, but the offset
  between the "nice" disassembly from "DxeCore.objdump", and the in-RAM
  TBs in the TCG log, can be determined from the fact that there is a
  single prfm instruction in the entire binary. The instruction's offset
  is 0x2b180 in "DxeCore.objdump" -- at the beginning of the __memcpy()
  function --, and its RAM address is 0x472d2180 in the TCG log. Thus the
  difference (=3D the load address of DxeCore.efi) is 0x472a7000.

  QEMU was built at commit a4f667b67149 ("Merge remote-tracking branch
  'remotes/cohuck/tags/s390x-20190521-3' into staging", 2019-05-21).

  The reproducer command line is (on an ARMv7 host):

    qemu-system-aarch64 \
      -display none \
      -machine virt,accel=3Dtcg \
      -nodefaults \
      -nographic \
      -drive if=3Dpflash,format=3Draw,file=3D$prefix/share/qemu/edk2-aarch6=
4-code.fd,readonly \
      -drive if=3Dpflash,format=3Draw,file=3D$prefix/share/qemu/edk2-arm-va=
rs.fd,snapshot=3Don \
      -cpu cortex-a57 \
      -chardev stdio,signal=3Doff,mux=3Don,id=3Dchar0 \
      -mon chardev=3Dchar0,mode=3Dreadline \
      -serial chardev:char0

  The apparent symptom is an assertion failure *in the guest*, such as

  > ASSERT [DxeCore]
  > /home/lacos/src/upstream/qemu/roms/edk2/MdePkg/Library/BaseLib/String.c=
(1090):
  > Length < _gPcd_FixedAtBuild_PcdMaximumAsciiStringLength

  but that is only a (distant) consequence of the CopyMem()
  mistranslation, and resultant destination area corruption.

  Originally reported in the following two mailing list messages:
  - http://mid.mail-archive.com/9d2e260c-c491-03d2-9b8b-b57b72083f77@redhat=
.com
  - http://mid.mail-archive.com/f1cec8c0-1a9b-f5bb-f951-ea0ba9d276ee@redhat=
.com

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1830872/+subscriptions

