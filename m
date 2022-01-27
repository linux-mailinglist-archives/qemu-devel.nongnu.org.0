Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB9849ED69
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:31:56 +0100 (CET)
Received: from localhost ([::1]:51338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDCN1-0001FA-9H
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:31:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDCKa-0007Vk-3q; Thu, 27 Jan 2022 16:29:24 -0500
Received: from [2001:41c9:1:41f::167] (port=36910
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDCKY-0001lS-D5; Thu, 27 Jan 2022 16:29:23 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDCK0-000BVs-IO; Thu, 27 Jan 2022 21:28:52 +0000
Message-ID: <633a8e99-d68b-2765-ceea-3d85935899f5@ilande.co.uk>
Date: Thu, 27 Jan 2022 21:29:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220127201116.1154733-1-farosas@linux.ibm.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220127201116.1154733-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/01/2022 20:11, Fabiano Rosas wrote:

> Changes from v1:
> 
> - Restored the 'sc 1' support to avoid breaking the pegasos2 machine.
> 
> I tested this version in the G4 with the following OSes:
> 
> - Linux 5.15 (5.16 seems to be broken, even with master)
> - FreeBSD 13
> - Mac OS 9.2
> - Mac OS Darwin 6.0
> - Mac OS X 10.4
> - MorphOS 3.15 (-M pegasos2 and -M mac99,via=pmu)
> 
> Based on legoater/ppc-7.0
> 
> v1:
> https://lore.kernel.org/r/20220126164200.1048677-1-farosas@linux.ibm.com
> 
> Fabiano Rosas (8):
>    target/ppc: Introduce powerpc_excp_74xx
>    target/ppc: Simplify powerpc_excp_74xx
>    target/ppc: 74xx: Machine Check exception cleanup
>    target/ppc: 74xx: External interrupt cleanup
>    target/ppc: 74xx: Program exception cleanup
>    target/ppc: 74xx: System Call exception cleanup
>    target/ppc: 74xx: System Reset interrupt cleanup
>    target/ppc: 74xx: Set SRRs directly in exception code
> 
>   target/ppc/excp_helper.c | 197 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 197 insertions(+)

That certainly covers a good range MacOS images so I'm happy to give:

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Just out of curiosity have you tried booting MacOS 9.2 under KVM-PR? Last time I 
tried on my G4 Mac Mini here, OS X worked fine but 9.2 failed early after jumping 
into the 68k emulator. Unfortunately due to the split real mode (see 
https://github.com/torvalds/linux/commit/c01e3f66cd5cdc1f727f4c7b0c10b3e3bdb91ba7 
where MSR_IR != MSR_DR) I can't step through with QEMU's gdbstub to see what is going 
wrong...


ATB,

Mark.

