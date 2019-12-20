Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B59112748D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 05:24:01 +0100 (CET)
Received: from localhost ([::1]:50512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ii9pY-00028j-9j
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 23:24:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9nh-0008Ub-8F
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ii9nf-00023e-Fs
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 23:22:04 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34398)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ii9nf-0001x1-4e; Thu, 19 Dec 2019 23:22:03 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id DA3EA27FF9; Thu, 19 Dec 2019 23:22:01 -0500 (EST)
Message-Id: <cover.1576815466.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 00/13] Fixes for DP8393X SONIC device emulation
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2019 15:17:46 +1100
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 98.124.60.144
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

There are bugs in the DP8393X emulation that can stop packet reception.

Whilst debugging the device I found that the receiver algorithm differs
from the one described in the National Semiconductor datasheet.

These issues and others are addressed by this patch series.

This series has only been tested with Linux/m68k guests. It needs further
testing with MIPS Magnum guests such as NetBSD or Windows NT.

Note that the mainline Linux sonic driver also has bugs.
Those bugs have been fixed in a series of patches at,
https://github.com/fthain/linux/commits/mac68k

---
Changed since v1:
 - Minor revisions described in patch descriptions.
 - Dropped patches 4/10 and 7/10.
 - Added 5 new patches.


Finn Thain (13):
  dp8393x: Mask EOL bit from descriptor addresses
  dp8393x: Clean up endianness hacks
  dp8393x: Have dp8393x_receive() return the packet size
  dp8393x: Update LLFA and CRDA registers from rx descriptor
  dp8393x: Clear RRRA command register bit only when appropriate
  dp8393x: Implement packet size limit and RBAE interrupt
  dp8393x: Don't stop reception upon RBE interrupt assertion
  dp8393x: Don't clobber packet checksum
  dp8393x: Use long-word-aligned RRA pointers in 32-bit mode
  dp8393x: Pad frames to word or long word boundary
  dp8393x: Clear descriptor in_use field when necessary
  dp8393x: Always update RRA pointers and sequence numbers
  dp8393x: Correctly advance RRP

 hw/net/dp8393x.c | 147 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 100 insertions(+), 47 deletions(-)

--=20
2.23.0


