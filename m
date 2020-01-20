Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1A01429F5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 12:59:21 +0100 (CET)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itViC-00034l-KW
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 06:59:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49942)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1itVhM-0002dB-2o
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:58:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1itVhK-0000kW-CZ
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:58:27 -0500
Received: from mail.ispras.ru ([83.149.199.45]:33844)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dovgaluk@ispras.ru>) id 1itVhK-0000hu-0w
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:58:26 -0500
Received: from PASHAISP (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 990B3725C1;
 Mon, 20 Jan 2020 14:58:21 +0300 (MSK)
From: "Pavel Dovgalyuk" <dovgaluk@ispras.ru>
To: =?UTF-8?Q?'Alex_Benn=C3=A9e'?= <alex.bennee@linaro.org>
References: <157709434917.12933.4351155074716553976.stgit@pasha-Precision-3630-Tower>
 <87o8v3lkq8.fsf@linaro.org> <000f01d5cc5f$cccb90b0$6662b210$@ru>
 <871rrykmmh.fsf@linaro.org>
In-Reply-To: <871rrykmmh.fsf@linaro.org>
Subject: RE: [for-5.0 PATCH 00/11] Support for reverse debugging with GDB
Date: Mon, 20 Jan 2020 14:58:21 +0300
Message-ID: <002f01d5cf88$eaabfee0$c003fca0$@ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
thread-index: AdXNXSokBMQOaR6eS1q6nT2VhQMT/QCKxx1A
Content-Language: ru
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 83.149.199.45
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru,
 crosthwaite.peter@gmail.com, ciro.santilli@gmail.com, jasowang@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 maria.klimushenkova@ispras.ru, mst@redhat.com, kraxel@redhat.com,
 boost.lists@gmail.com, thomas.dullien@googlemail.com, pbonzini@redhat.com,
 mreitz@redhat.com, artem.k.pisarenko@gmail.com, dgilbert@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> From: Alex Benn=C3=A9e [mailto:alex.bennee@linaro.org]
> Pavel Dovgalyuk <dovgaluk@ispras.ru> writes:
>=20
> >> From: Alex Benn=C3=A9e [mailto:alex.bennee@linaro.org]
> >> Pavel Dovgalyuk <pavel.dovgaluk@gmail.com> writes:
> >>
> >> > GDB remote protocol supports reverse debugging of the targets.
> >> > It includes 'reverse step' and 'reverse continue' operations.
> >> > The first one finds the previous step of the execution,
> >> > and the second one is intended to stop at the last breakpoint =
that
> >> > would happen when the program is executed normally.
> >> >
> >> > Reverse debugging is possible in the replay mode, when at least
> >> > one snapshot was created at the record or replay phase.
> >> > QEMU can use these snapshots for travelling back in time with =
GDB.
> >> >
> >> > Running the execution in replay mode allows using GDB reverse =
debugging
> >> > commands:
> >> >  - reverse-stepi (or rsi): Steps one instruction to the past.
> >> >    QEMU loads on of the prior snapshots and proceeds to the =
desired
> >> >    instruction forward. When that step is reaches, execution =
stops.
> >> >  - reverse-continue (or rc): Runs execution "backwards".
> >> >    QEMU tries to find breakpoint or watchpoint by loaded prior =
snapshot
> >> >    and replaying the execution. Then QEMU loads snapshots again =
and
> >> >    replays to the latest breakpoint. When there are no =
breakpoints in
> >> >    the examined section of the execution, QEMU finds one more =
snapshot
> >> >    and tries again. After the first snapshot is processed, =
execution
> >> >    stops at this snapshot.
> >> >
> >> > The set of patches include the following modifications:
> >> >  - gdbstub update for reverse debugging support
> >> >  - functions that automatically perform reverse step and reverse
> >> >    continue operations
> >> >  - hmp/qmp commands for manipulating the replay process
> >> >  - improvement of the snapshotting for saving the execution step
> >> >    in the snapshot parameters
> >> >
> >> > The patches are available in the repository:
> >> > https://github.com/ispras/qemu/tree/rr-191223
> >>
> >> So I tried with your additional patch. Launching QEMU as:
> >>
> >>   ./aarch64-softmmu//qemu-system-aarch64 -monitor none \
> >>      -display none -M virt -cpu max -display none \
> >>      -semihosting-config enable=3Don \
> >>      -kernel ./tests/tcg/aarch64-softmmu/memory \
> >>      -icount shift=3D5,rr=3Dreplay,rrfile=3Drecord.bin \
> >>      -s -S -d trace:gdbstub\*
> >>
> >> And gdb:
> >>
> >>   gdb tests/tcg/aarch64-softmmu/memory \
> >>     -ex "target remote localhost:1234"
> >>
> >> I get the following log:
> >>
> >>   (gdb) x/3i $pc
> >>   =3D> 0x400037b0 <__start>:        adr     x0, 0x40003000 =
<vector_table>
> >>      0x400037b4 <__start+4>:      msr     vbar_el1, x0
> >>      0x400037b8 <__start+8>:      adrp    x0, 0x40200000
> >>   (gdb) p/x $x0
> >>   $1 =3D 0x0
> >>   (gdb) si
> >>   92              msr     vbar_el1, x0
> >>   (gdb) p/x $x0
> >>   $2 =3D 0x40003000
> >>   (gdb) rsi
> >>   warning: Remote failure reply: E14
> >>
> >>   Program stopped.
> >>   __start () at =
/home/alex.bennee/lsrc/qemu.git/tests/tcg/aarch64/system/boot.S:92
> >>   92              msr     vbar_el1, x0
> >>   (gdb) p/x $x0
> >>   $3 =3D 0x40003000
> >>
> >> So it doesn't seem to be working.
> >
> > That's ok, you'll need at least one VM snapshot available to recover =
the initial VM state.
> > Try changing the command lines in the following way:
> >
> > First, create empty.qcow2 which will be used for saving the =
snapshots.
> > Then record with initial snapshot and attached empty.qcow2:
> >
> >    ./aarch64-softmmu//qemu-system-aarch64 -monitor none \
> >       -display none -M virt -cpu max \
> >       -kernel ./tests/tcg/aarch64-softmmu/memory \
> >       -icount =
shift=3D5,rr=3Drecord,rrfile=3Drecord.bin,rrsnapshot=3Dinit \
> >       -drive file=3Dempty.qcow2
>=20
> ./aarch64-softmmu//qemu-system-aarch64 -monitor none -display none -M =
virt -cpu max -display
> none -semihosting-config enable=3Don -kernel =
./tests/tcg/aarch64-softmmu/memory -icount
> shift=3D5,rr=3Drecord,rrfile=3Drecord.bin,rrsnapshot=3Dinit -drive =
file=3Dempty.qcow2


> qemu-system-aarch64: invalid accelerator kvm
> qemu-system-aarch64: falling back to tcg
> qemu-system-aarch64: The qcow format used by node '#block163' does not =
support live migration
> qemu-system-aarch64: Could not create snapshot for icount record

It seems that you have some problems with your disk image. Is it qcow2 =
or just qcow?

> For this testcase semihosting in just a convenient output device (in
> lieu of a serial device).=20

I tried this test kernel with your options and everything was ok.

> We probably need to come up with a strategy on
> how we handle all these devices otherwise we will end up with a random
> selection of hardware combinations which work.

All correctly implemented virtual hardware should support record/replay.
But real semihosting (like file IO) should not, because it provides
untracked virtual machine inputs.

Pavel Dovgalyuk


