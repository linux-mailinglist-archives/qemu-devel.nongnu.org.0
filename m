Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A2D49EE58
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 23:59:31 +0100 (CET)
Received: from localhost ([::1]:53106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDDjm-0005ZX-Cc
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 17:59:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDDj1-0004kU-OM; Thu, 27 Jan 2022 17:58:43 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:28508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nDDiz-0005xm-3V; Thu, 27 Jan 2022 17:58:43 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 88CC27457EF;
 Thu, 27 Jan 2022 23:58:37 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5DBEF7456FE; Thu, 27 Jan 2022 23:58:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 590E47456E3;
 Thu, 27 Jan 2022 23:58:37 +0100 (CET)
Date: Thu, 27 Jan 2022 23:58:37 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
In-Reply-To: <633a8e99-d68b-2765-ceea-3d85935899f5@ilande.co.uk>
Message-ID: <49c4b0b8-fbb4-fb97-f09-5c912a1f7bbf@eik.bme.hu>
References: <20220127201116.1154733-1-farosas@linux.ibm.com>
 <633a8e99-d68b-2765-ceea-3d85935899f5@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Jan 2022, Mark Cave-Ayland wrote:
> On 27/01/2022 20:11, Fabiano Rosas wrote:
>
>> Changes from v1:
>> 
>> - Restored the 'sc 1' support to avoid breaking the pegasos2 machine.
>> 
>> I tested this version in the G4 with the following OSes:
>> 
>> - Linux 5.15 (5.16 seems to be broken, even with master)
>> - FreeBSD 13
>> - Mac OS 9.2
>> - Mac OS Darwin 6.0
>> - Mac OS X 10.4
>> - MorphOS 3.15 (-M pegasos2 and -M mac99,via=pmu)
>> 
>> Based on legoater/ppc-7.0
>> 
>> v1:
>> https://lore.kernel.org/r/20220126164200.1048677-1-farosas@linux.ibm.com
>> 
>> Fabiano Rosas (8):
>>    target/ppc: Introduce powerpc_excp_74xx
>>    target/ppc: Simplify powerpc_excp_74xx
>>    target/ppc: 74xx: Machine Check exception cleanup
>>    target/ppc: 74xx: External interrupt cleanup
>>    target/ppc: 74xx: Program exception cleanup
>>    target/ppc: 74xx: System Call exception cleanup
>>    target/ppc: 74xx: System Reset interrupt cleanup
>>    target/ppc: 74xx: Set SRRs directly in exception code
>>
>>   target/ppc/excp_helper.c | 197 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 197 insertions(+)
>
> That certainly covers a good range MacOS images so I'm happy to give:
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>
> Just out of curiosity have you tried booting MacOS 9.2 under KVM-PR? Last 
> time I tried on my G4 Mac Mini here, OS X worked fine but 9.2 failed early 
> after jumping into the 68k emulator. Unfortunately due to the split real mode 
> (see 
> https://github.com/torvalds/linux/commit/c01e3f66cd5cdc1f727f4c7b0c10b3e3bdb91ba7 
> where MSR_IR != MSR_DR) I can't step through with QEMU's gdbstub to see what 
> is going wrong...

Can't comment on that as I don't have PPC hardware but in case you don't 
know it yet, check out this blog entry (and its part 2):

https://www.talospace.com/2018/08/making-your-talos-ii-into-power-mac.html

which talks about running KVM-PR on POWER9 and why MacOS may not work at 
least with newer POWER CPUs. But if you run G4 code on G4 it may be a 
different problem but still an interesting article and may give you some 
ideas.

Regards,
BALATON Zoltan

