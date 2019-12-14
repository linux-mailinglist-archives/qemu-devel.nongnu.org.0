Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A95B11EF86
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 02:31:13 +0100 (CET)
Received: from localhost ([::1]:54956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifwH1-0005mg-Om
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 20:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1ifwEd-00041r-Qt
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 20:28:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1ifwEc-00018v-Fp
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 20:28:43 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:47370)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1ifwEc-00014n-56; Fri, 13 Dec 2019 20:28:42 -0500
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id D74FD22CA2; Fri, 13 Dec 2019 20:28:40 -0500 (EST)
Message-Id: <cover.1576286757.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 00/10] Fixes for DP8393X SONIC device emulation
Date: Sat, 14 Dec 2019 12:25:57 +1100
To: Jason Wang <jasowang@redhat.com>,
    qemu-devel@nongnu.org
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
 Herve Poussineau <hpoussin@reactos.org>, Laurent Vivier <laurent@vivier.eu>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

There is a bug in the DP8393X emulation that can stop packet reception.

Whilst debugging that issue I found that the receiver algorithm differs
from the one described in the National Semiconductor datasheet.

These issues and others are addressed by this patch series.

This series has only been tested with Linux/m68k guests. It needs further
testing with MIPS Jazz guests such as NetBSD or Windows NT.

Thanks.


Finn Thain (10):
  dp8393x: Mask EOL bit from descriptor addresses
  dp8393x: Clean up endianness hacks
  dp8393x: Have dp8393x_receive() return the packet size
  dp8393x: Don't advance RX descriptor twice
  dp8393x: Update LLFA register
  dp8393x: Clear RRRA command register bit only when appropriate
  dp8393x: Implement TBWC0 and TBWC1 registers to restore buffer state
  dp8393x: Implement packet size limit and RBAE interrupt
  dp8393x: Don't stop reception upon RBE interrupt assertion
  dp8393x: Don't clobber packet checksum

 hw/net/dp8393x.c | 80 +++++++++++++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 28 deletions(-)

-- 
2.23.0


