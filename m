Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360933B4EB4
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 15:16:23 +0200 (CEST)
Received: from localhost ([::1]:48418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx8AX-00064C-P0
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 09:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fthain@linux-m68k.org>)
 id 1lx463-00015V-Jz
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 04:55:27 -0400
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:37928)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fthain@linux-m68k.org>) id 1lx461-0000H2-C8
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 04:55:27 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 56D2429F1E;
 Sat, 26 Jun 2021 04:55:17 -0400 (EDT)
Date: Sat, 26 Jun 2021 18:55:18 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 00/10] dp8393x: fixes for MacOS toolbox ROM
In-Reply-To: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <7bd0c5f7-ce26-51dd-a238-104157636620@nippy.intranet>
References: <20210625065401.30170-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=98.124.60.144; envelope-from=fthain@linux-m68k.org;
 helo=kvm5.telegraphics.com.au
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 26 Jun 2021 09:14:02 -0400
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
Cc: aleksandar.rikalo@syrmia.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, hpoussin@reactos.org, aurelien@aurel32.net, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021, Mark Cave-Ayland wrote:

> Here is the next set of patches from my attempts to boot MacOS under 
> QEMU's Q800 machine related to the Sonic network adapter.
> 
> Patches 1 and 2 sort out checkpatch and convert from DPRINTF macros to 
> trace-events.
> 
> The discussion for the v1 patchset concluded that the dp8393x device 
> does NOT have its own NVRAM (there is no mention of it on the datasheet) 
> and so patches 3 to 5 move the generation of the PROM to the q800 and 
> jazz boards separately to allow the formats to diverge.
> 
> Patch 6 adds an implementation of bitrev8 to bitops.h in preparation for 
> changing the q800 PROM storage format, whilst patch 7 updates the MAC 
> address storage and checksum for the q800 machine to match the format 
> expected by the MacOS toolbox ROM.
> 
> Patch 8 ensures that the CPU loads/stores are correctly converted to 
> 16-bit accesses for the network card and patch 9 fixes a bug when 
> selecting the index specified for CAM entries.
> 
> Finally since the MIPS magnum machine exists for both big-endian 
> (mips64) and little-endian (mips64el) configurations, patch 10 sets the 
> dp8393x big_endian property accordingly using a similar technique 
> already used for the MIPS malta machines.
> 
> Migration notes: the changes to the dp8393x PROM are a migration break, 
> but we don't care about this for now since a) the q800 machine will have 
> more breaking migration changes as further MacOS toolbox ROM support is 
> upstreamed and b) the magnum machine migration is currently broken (and 
> has been for quite some time).
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 

Tested-by: Finn Thain <fthain@linux-m68k.org>

My testing was much the same as last time: 'qemu-system-mips64el -M 
magnum' with Linux/mips and NetBSD/arc, and 'qemu-system-m68k -M q800' 
with Linux/m68k. In each case I checked the MAC address against the '-nic' 
option. The host is little-endian.

I have not tested 'qemu-system-mips64 -M magnum'. It appears MIPS RISC/os 
is needed for that but I don't have it.

> 
> v2:
> - Move PROM generation from dp8393x to q800 and magnum machines and remove
>   the existing code from the device itself
> - Add bitrev8 implementation to bitops.h so it can be used elsewhere in
>   future. Use a shift/merge technique rather than a massive table lookup
>   as we don't care about speed
> - Add patch to set the big_endian property correctly depending upon whether
>   a big-endian or little-endian configuration is being used
> 
> 
> Mark Cave-Ayland (10):
>   dp8393x: checkpatch fixes
>   dp8393x: convert to trace-events
>   hw/mips/jazz: move PROM and checksum calculation from dp8393x device
>     to board
>   hw/m68k/q800: move PROM and checksum calculation from dp8393x device
>     to board
>   dp8393x: remove onboard PROM containing MAC address and checksum
>   qemu/bitops.h: add bitrev8 implementation
>   hw/m68k/q800: fix PROM checksum and MAC address storage
>   dp8393x: don't force 32-bit register access
>   dp8393x: fix CAM descriptor entry index
>   hw/mips/jazz: specify correct endian for dp8393x device
> 
>  hw/m68k/q800.c        |  21 ++-
>  hw/mips/jazz.c        |  32 ++++-
>  hw/net/dp8393x.c      | 313 +++++++++++++++++++-----------------------
>  hw/net/trace-events   |  17 +++
>  include/qemu/bitops.h |  22 +++
>  5 files changed, 231 insertions(+), 174 deletions(-)
> 
> 

