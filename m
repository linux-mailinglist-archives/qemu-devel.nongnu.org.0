Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F161848AF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Mar 2020 15:01:22 +0100 (CET)
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCksJ-0005Uo-Vg
	for lists+qemu-devel@lfdr.de; Fri, 13 Mar 2020 10:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41373)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>) id 1jCkql-0004sp-DJ
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:59:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <remi@remlab.net>) id 1jCkqk-0005mO-9Z
 for qemu-devel@nongnu.org; Fri, 13 Mar 2020 09:59:43 -0400
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:49706
 helo=ns207790.ip-94-23-215.eu) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <remi@remlab.net>)
 id 1jCkqe-0005KY-PC; Fri, 13 Mar 2020 09:59:36 -0400
Received: from basile.remlab.net (87-92-31-51.bb.dnainternet.fi [87.92.31.51])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id A19B85FAA2;
 Fri, 13 Mar 2020 14:59:30 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: qemu-arm@nongnu.org
Subject: [RFC] [PATCH 0/5] ARMv8.5-MemTag disassembly
Date: Fri, 13 Mar 2020 15:59:29 +0200
Message-ID: <2159383.tmy0LfLZHX@basile.remlab.net>
Organization: Remlab
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:41d0:2:5a1a::
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

	Hello,

The following changes since commit d4f7d56759f7c75270c13d5f3f5f736a9558929c:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200=
312' into staging (2020-03-12 17:34:34 +0000)

adds support for the ARM MTE compatibility subset (which does not seem to h=
ave
an official name) to QEMU user mode and system mode on "max" CPU. This
corresponds to MTE =3D=3D 1 in the instruction set feature field, and allows
running code with MTE instructions without actual tag storage.

Similar to the SP alignment checks, it also adds stubs for memory tag checks
that don't actually do anything at this point and would be optimized out by
the compiler.

=46or proper storage and checking of memory tags, MTE =3D=3D 2 would be
necessary. I have some code (on top of this RFC but not included) to add the
tag allocation logic. But I have no clue how to actually store the tags in =
QEMU
system mode at this point, so it's mostly dead code.

In user mode, it seems impossible anyway, as tags are indexed by physical, =
not
virtual address and QEMU cannot know which virtual memory address may
physically alias another within the user process.

=2D---------------------------------------------------------------
R=C3=A9mi Denis-Courmont (5):
      target/arm: MTE processor state
      target/arm: MTE user mode disassembly
      target/arm: MTE unprivileged system mode disassembly
      target/arm: MTE privileged system mode assembly
      target/arm: MTE tag check stubs

 target/arm/cpu.h           |  17 +++
 target/arm/cpu64.c         |   5 +
 target/arm/helper-a64.c    |   2 +
 target/arm/helper.c        | 118 +++++++++++++++
 target/arm/translate-a64.c | 370 +++++++++++++++++++++++++++++++++++++++++=
+---
 5 files changed, 494 insertions(+), 18 deletions(-)

=2D-=20
=D0=A0=D0=B5=D0=BC=D0=B8 =D0=94=D1=91=D0=BD=D0=B8-=D0=9A=D1=83=D1=80=D0=BC=
=D0=BE=D0=BD
http://www.remlab.net/




