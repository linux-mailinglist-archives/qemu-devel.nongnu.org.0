Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DDB343AF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 12:06:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hY6L6-0000Z3-6y
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 06:06:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hY6Im-0007vT-N6
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 06:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hY65c-0007XR-Ou
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 05:50:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:52310)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hY65a-0007Ve-PU
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 05:50:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hY65Z-0001QG-BS
	for <qemu-devel@nongnu.org>; Tue, 04 Jun 2019 09:50:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 5561A2E80C9
	for <qemu-devel@nongnu.org>; Tue,  4 Jun 2019 09:50:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Jun 2019 09:43:59 -0000
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: arm testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ajbennee andrew-randrianasulu lersek
X-Launchpad-Bug-Reporter: Laszlo Ersek (Red Hat) (lersek)
X-Launchpad-Bug-Modifier: =?utf-8?q?Alex_Benn=C3=A9e_=28ajbennee=29?=
References: <155912118291.12579.8926874795813611531.malonedeb@soybean.canonical.com>
	<20190603150120.29255-1-alex.bennee@linaro.org>
	<201906031835.13420.randrianasulu@gmail.com>
Message-Id: <87zhmxsn1c.fsf@zen.linaroharston>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 49f26f497a47c29aeacf74256d9860d9003db17d
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

Andrew Randrianasulu <randrianasulu@gmail.com> writes:

> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 Monday 03 June 2019 18:01:20 Alex Benn=C3=A9e =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB(=D0=B0):
>> When running on 32 bit TCG backends a wide unaligned load ends up
>> truncating data before returning to the guest. We specifically have
>> the return type as uint64_t to avoid any premature truncation so we
>> should use the same for the interim types.
>>
>> Hopefully fixes #1830872
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  accel/tcg/cputlb.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
>> index cdcc3771020..b796ab1cbea 100644
>> --- a/accel/tcg/cputlb.c
>> +++ b/accel/tcg/cputlb.c
>> @@ -1303,7 +1303,7 @@ load_helper(CPUArchState *env, target_ulong addr, =
TCGMemOpIdx oi,
>>          && unlikely((addr & ~TARGET_PAGE_MASK) + size - 1
>>                      >=3D TARGET_PAGE_SIZE)) {
>>          target_ulong addr1, addr2;
>> -        tcg_target_ulong r1, r2;
>> +        uint64_t r1, r2;
>>          unsigned shift;
>>      do_unaligned_access:
>>          addr1 =3D addr & ~(size - 1);
>
> Unfortunatly, this doesn't fix 32-bit qemu-system-x86_64 .... so, my
> bug is separate from #1830872 ?

I think you've hit two - one of which we have just fixed. With my
expanded memory test on i386 I'm seeing a hang but it's ok @
pull-demacro-softmmu-100519-1. Unfortunately bisecting through the slirp
move and other i386 Werror stuff is proving painful.

>
> I also was unable to convince qemu to use my kernel-only x86_64 gcc 6.5.0=
 cross-compiler ..
> probably x86-64 testing on i686 requires either docker (I don't have this
> ) or 'real' cross-compiler (build with glibc support).


--
Alex Benn=C3=A9e

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

