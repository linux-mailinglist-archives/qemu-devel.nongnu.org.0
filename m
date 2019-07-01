Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1CB144A0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 08:53:12 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNXUt-0008TR-Jh
	for lists+qemu-devel@lfdr.de; Mon, 06 May 2019 02:53:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hNXSb-0006Et-Cc
	for qemu-devel@nongnu.org; Mon, 06 May 2019 02:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hNXSa-0006zr-1u
	for qemu-devel@nongnu.org; Mon, 06 May 2019 02:50:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:33634)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hNXSZ-0006yq-S7
	for qemu-devel@nongnu.org; Mon, 06 May 2019 02:50:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hNXSY-0004wB-A4
	for <qemu-devel@nongnu.org>; Mon, 06 May 2019 06:50:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id 3DAFF2E80CC
	for <qemu-devel@nongnu.org>; Mon,  6 May 2019 06:50:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 May 2019 06:37:52 -0000
From: David Gibson <1826827@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: asurati dwg
X-Launchpad-Bug-Reporter: Amol Surati (asurati)
X-Launchpad-Bug-Modifier: David Gibson (dwg)
References: <155651553398.6774.264581366962353554.malonedeb@chaenomeles.canonical.com>
Message-Id: <155712467231.19193.17417547789782007428.malone@gac.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18953";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 6ebbb9f94469ac101470f4239fa93187004d5966
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1826827] Re: dtc crash;
 pnv_dt_serial cannot find lpc's phandle
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
Reply-To: Bug 1826827 <1826827@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

IIUC there are two bugs here

1) The powernv machine in qemu is attempting to use a phandle for node
that doesn't have one.  It will need to assign a phandle to that node
and re-use it elsewhere.  This should be pretty straightforward.

2) dtc is crashing with an assertion - that shouldn't happen, even on
bad input it should error out rather than crashing.  The problem also
occurs with current upstream dtc - I'll try to investigate this.


Btw, I'm assuming where you say 'dtc -O dtb -I dts -o out.dts dtb' you actu=
ally meant 'dtc -I dtb -O dts -o out.dts dtb'  (i.e. -I and -O swapped arou=
nd), since you're trying to decompile a blob to source rather than the othe=
r way around.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1826827

Title:
  dtc crash; pnv_dt_serial cannot find lpc's phandle

Status in QEMU:
  New

Bug description:
  Qemu version:
  QEMU emulator version 4.0.50 (v4.0.0-142-ge0fb2c3d89)
  Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers

  dtc version:
  Version: DTC 1.5.0-g5c3513f6

  -------------------------------------------------------------------------
  pnv_dt_serial has a line which is supposed to set the interrupt-parent of=
 the "isa-serial@i3f8" node to the phandle of "lpc@0".

  To that end, it calls fdt_get_phandle as shown below:
  _FDT((fdt_setprop_cell(fdt, node, "interrupt-parent", fdt_get_phandle(fdt=
, lpc_off))));

  The function fdt_get_phandle fails to find the property "phandle" (or
  "linux,phandle") for the lpc node. Consequently, pnv_dt_serial sets
  the interrupt-parent to 0.

  Now boot the qemu-system-ppc64 powernv machine, and extract the fdt by
  using the qemu monitor's pmemsave command, taking help of the OPAL
  firmware's messages to locate the fdt in the physical ram.

  qemu-system-ppc64 -m 1g -machine powernv,num-chips=3D1 \
  -cpu power9 -smp 2,cores=3D2,threads=3D1 -accel tcg,thread=3Dmulti \
  -kernel ./vmlinux \
  -append 'disable_radix' \
  -serial mon:stdio -nographic -nodefaults

  The kernel vmlinux contains nothing but a single instruction which
  loops infintely, so that we can gather OPAL's messages, especially the
  one below:

  [    0.168845963,5] INIT: Starting kernel at 0x20000000, fdt at
  0x304b0b70 14404 bytes

  Once the fdt is dumped to a file, run the following:

  'dtc -O dtb -I dts -o out.dts dtb'

  After a few warnings, the dtc application crashes because an assertion
  was fired.

  out.dts: Warning (unit_address_vs_reg): /lpcm-opb@6030000000000/lpc@0: no=
de has a unit name, but no reg property
  out.dts: Warning (simple_bus_reg): /lpcm-opb@6030000000000/lpc@0: missing=
 or empty reg/ranges property
  out.dts: Warning (avoid_unnecessary_addr_size): /ibm,opal: unnecessary #a=
ddress-cells/#size-cells without "ranges" or child "reg" property
  out.dts: Warning (unique_unit_address): /interrupt-controller@0: duplicat=
e unit-address (also used in node /memory@0)
  out.dts: Warning (chosen_node_stdout_path): /chosen:linux,stdout-path: Us=
e 'stdout-path' instead
  dtc: livetree.c:575: get_node_by_phandle: Assertion `generate_fixups' fai=
led.
  Aborted (core dumped)

  The assertion is fired because get_node_by_phandle receives a phandle
  value of 0, which is unexpected, unless fixups are needed (They are
  not, when running the dtc command).

  Back inside pnv_dt_serial, if the line that sets "interrupt-parent"
  for the serial device node is commented out, the dtc crash is
  prevented. Looking at hw/ppc/e500.c, it takes care of allocating
  necessary phandle values in the nodes, so a similar method can be
  adopted for powernv.

  The dtb is attached.

  Edit: Add version, Correct filenames.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1826827/+subscriptions

