Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F90A14AD32
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 01:26:53 +0100 (CET)
Received: from localhost ([::1]:52620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwEiS-0007wW-7G
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 19:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwEha-0007Ui-7r
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 19:25:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>) id 1iwEhZ-0001Dk-3U
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 19:25:58 -0500
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:56370)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <fthain@telegraphics.com.au>)
 id 1iwEhZ-0001DV-0B; Mon, 27 Jan 2020 19:25:57 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 4DDD629982;
 Mon, 27 Jan 2020 19:25:54 -0500 (EST)
Date: Tue, 28 Jan 2020 11:25:54 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 00/14] Fixes for DP8393X SONIC device emulation
In-Reply-To: <cover.1579474761.git.fthain@telegraphics.com.au>
Message-ID: <alpine.LNX.2.21.1.2001281118360.16@nippy.intranet>
References: <cover.1579474761.git.fthain@telegraphics.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jan 2020, Finn Thain wrote:

> Hi All,
> 
> There are bugs in the emulated dp8393x device that can stop packet
> reception in a Linux/m68k guest (q800 machine).
> 
> With a Linux/mips guest (magnum machine), the driver fails to probe
> the dp8393x device.
> 
> With a NetBSD/arc 5.1 guest (magnum machine), the bugs in the device
> can be fatal to the guest kernel.
> 
> Whilst debugging the device, I found that the receiver algorithm
> differs from the one described in the National Semiconductor
> datasheet.
> 
> This patch series resolves these bugs.
> 

Ironically, given the recent driver fixes in the Linux kernel, the bugs in 
stock QEMU make it possible to remotely trigger a kernel Oops (much like 
the NetBSD crash). This patch series is needed to resolve those issues.

> Note that the mainline Linux sonic driver also has bugs.
> I have fixed the bugs that I know of in a series of patches at,
> https://github.com/fthain/linux/commits/mac68k
> ---
> Changed since v1:
>  - Minor revisions as described in commit logs.
>  - Dropped patches 4/10 and 7/10.
>  - Added 5 new patches.
> 
> Changed since v2:
>  - Minor revisions as described in commit logs.
>  - Dropped patch 13/13.
>  - Added 2 new patches.
> 
> 
> Finn Thain (14):
>   dp8393x: Mask EOL bit from descriptor addresses
>   dp8393x: Always use 32-bit accesses
>   dp8393x: Clean up endianness hacks
>   dp8393x: Have dp8393x_receive() return the packet size
>   dp8393x: Update LLFA and CRDA registers from rx descriptor
>   dp8393x: Clear RRRA command register bit only when appropriate
>   dp8393x: Implement packet size limit and RBAE interrupt
>   dp8393x: Don't clobber packet checksum
>   dp8393x: Use long-word-aligned RRA pointers in 32-bit mode
>   dp8393x: Pad frames to word or long word boundary
>   dp8393x: Clear descriptor in_use field to release packet
>   dp8393x: Always update RRA pointers and sequence numbers
>   dp8393x: Don't reset Silicon Revision register
>   dp8393x: Don't stop reception upon RBE interrupt assertion
> 
>  hw/net/dp8393x.c | 205 +++++++++++++++++++++++++++++++----------------
>  1 file changed, 137 insertions(+), 68 deletions(-)
> 
> 

