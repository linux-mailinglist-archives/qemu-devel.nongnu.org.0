Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8D3ADE71
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 15:09:40 +0200 (CEST)
Received: from localhost ([::1]:51130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luxCk-0007fV-Kg
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 09:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1luxC1-0006nr-2M
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 09:08:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51998
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1luxBy-00048L-Vm
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 09:08:52 -0400
Received: from host86-132-109-72.range86-132.btcentralplus.com
 ([86.132.109.72] helo=[192.168.1.65])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1luxBg-000Bk7-Rk; Sun, 20 Jun 2021 14:08:33 +0100
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210619172626.875885-1-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <081114a8-799a-764e-d393-9e136ae24f4c@ilande.co.uk>
Date: Sun, 20 Jun 2021 14:08:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.132.109.72
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/15] accel/tcg: Fix for #360 and other i/o alignment
 issues
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/06/2021 18:26, Richard Henderson wrote:

> Short story is that the first two patches resolve the observed
> problem, by completely bypassing quite a lot of code in memory.c.
> 
> Longer story is that we should either use that code in memory.c,
> or we should bypass it to an even lower level, so that we don't
> have multiple locations doing the partial-read assembly thing.
> 
> Patch 13 exposes a number of obvious device bugs via make check.
> I'm sure there are more in devices that are less well tested.
> 
> Patch 15 has an obvious drawback: it breaks the original #360.
> But it starts the conversation as to whether the check in memory.c
> is in fact broken.
> 
> 
> r~
> 
> 
> Mark Cave-Ayland (2):
>    NOTFORMERGE q800: test case for do_unaligned_access issue
>    accel/tcg: Use byte ops for unaligned loads
> 
> Philippe Mathieu-Daudé (1):
>    accel/tcg: Extract load_helper_unaligned from load_helper
> 
> Richard Henderson (12):
>    accel/tcg: Don't test for watchpoints for code read
>    accel/tcg: Handle page span access before i/o access
>    softmmu/memory: Inline memory_region_dispatch_read1
>    softmmu/memory: Simplify access_with_adjusted_size interface
>    hw/net/e1000e: Fix size of io operations
>    hw/net/e1000e: Fix impl.min_access_size
>    hw/pci-host/q35: Improve blackhole_ops
>    hw/scsi/megasas: Fix megasas_mmio_ops sizes
>    hw/scsi/megasas: Improve megasas_queue_ops min_access_size
>    softmmu/memory: Disallow short writes
>    softmmu/memory: Support some unaligned access
>    RFC accel/tcg: Defer some unaligned accesses to memory subsystem
> 
>   accel/tcg/cputlb.c | 147 +++++++++++++----------------
>   hw/m68k/q800.c     | 131 ++------------------------
>   hw/net/e1000e.c    |   8 +-
>   hw/pci-host/q35.c  |   9 +-
>   hw/scsi/megasas.c  |   6 +-
>   softmmu/memory.c   | 226 +++++++++++++++++++++++++++++++++------------
>   6 files changed, 251 insertions(+), 276 deletions(-)

Hi Richard,

I've had a look over this patchset, and based upon my work leading up to #360 this 
does feel like an improvement: in particular separating out page spanning accesses, 
and removing the duplicate cputlb code for splitting/combining unaligned accesses 
seem like wins to me.

As mentioned in the report itself, cputlb has effectively been bypassing 
.min_access_size but I'm not sure about the consequences of this - does it mean that 
the access size check should also be bypassed for the head/tail of unaligned 
accesses? I'm also not completely sure how this behaviour can change based upon the 
target CPU.

The comment in patch 15 re: mr->ops->valid.unaligned is interesting: if the memory 
subsystem can split the accesses beforehand so that they are accepted by the device, 
does this check then become obsolete?

My general feeling is that there are still some discussions to be had around defining 
how unaligned accesses should work, and including a qtest to cover the various 
unaligned/page span cases would help here. Other than that I do feel the patch is 
worthwhile, and it may be there is a situation similar to the 
memory_region_access_valid() changes in 5d971f9e67 whereby we accept the change in 
behaviour will have some fallout but allow plenty of time for regressions to be fixed.


ATB,

Mark.

