Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AB7190B4E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 11:42:14 +0100 (CET)
Received: from localhost ([::1]:46128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGh0f-000790-6Q
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 06:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55892)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jGgzs-0006ka-2q
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 06:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jGgzq-0002sl-OY
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 06:41:24 -0400
Received: from indium.canonical.com ([91.189.90.7]:49906)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jGgzq-0002sD-Ix
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 06:41:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jGgzo-0000GC-W2
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 10:41:21 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F0A282E804C
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 10:41:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Mar 2020 10:35:08 -0000
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bmeng-cn rtos.pharos
X-Launchpad-Bug-Reporter: RTOS Pharos (rtos.pharos)
X-Launchpad-Bug-Modifier: Bin Meng (bmeng-cn)
References: <155004342499.19242.14077661245921319117.malonedeb@soybean.canonical.com>
 <158503767628.19604.846014029546093014.malone@wampee.canonical.com>
Message-Id: <CAEUhbmV8YECctHEnLACq_aD9JwqLpMixPAvC=UGFNwJKrb9_tA@mail.gmail.com>
Subject: Re: [Bug 1815721] Re: RISC-V PLIC enable interrupt for multicore
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3a6db24bbe7280ec09bae73384238390fcc98ad3";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 5012db36eeba85f520438547faf53e27b295c030
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1815721 <1815721@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 24, 2020 at 4:20 PM RTOS Pharos <1815721@bugs.launchpad.net> wr=
ote:
>
> Hi,
>
> After some debugging (and luck), the problem (at least in the Virt
> board) was that the PLIC code inside QEMU addresses the core x 2 instead
> of just the core (core=3Dhart). That is why it worked for core 0 (0x2 =3D=
 0)
> but for core 1 it has to address the PLIC memory area for core 2.
>
> For example, the interrupt enable address for core 1 starts at offset
> 0x002080 (see https://github.com/riscv/riscv-plic-spec/blob/master
> /riscv-plic.adoc) but we actually have to change the enable bit for core
> 2 (at 0x002100) to make to work for core 1.


https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc says:

"base + 0x002080: Enable bits for sources 0-31 on context 1"

This is context 1, not core 1.

It looks to me you were running an image built for SiFive FU540.
Please test your image against "sifive_u" machine instead.

>
> The same is true for the priority threshold and claim complete registers
> (we need to multiply the core by 2)
>
> Either the documentation at https://github.com/riscv/riscv-plic-
> spec/blob/master/riscv-plic.adoc does not have the correct memory
> addresses for qemu virt board, or qemu appears to be wrong.
>
> --

Regards,
Bin

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1815721

Title:
  RISC-V PLIC enable interrupt for multicore

Status in QEMU:
  New

Bug description:
  Hello all,

  There is a bug in Qemu related to the enabling of external interrupts
  for multicores (Virt machine).

  After correcting Qemu as described in #1815078
  (https://bugs.launchpad.net/qemu/+bug/1815078), when we try to enable
  interrupts for core 1 at address 0x0C00_2080 we don't seem to be able
  to trigger an external interrupt  (e.g. UART0).

  This works perfectly for core 0, but fore core 1 it does not work at
  all. I assume that given bug #1815078 does not enable any external
  interrupt then this feature has not been tested. I tried to look at
  the qemu source code but with no luck so far.

  I guess the problem is related to function parse_hart_config (in
  sfive_plic.c) that initializes incorrectly the
  plic->addr_config[addrid].hartid, which is later on read in
  sifive_plic_update. But this is a guess.

  Best regards,
  Pharos team

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1815721/+subscriptions

