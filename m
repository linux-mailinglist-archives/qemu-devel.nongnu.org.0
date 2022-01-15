Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A44448F99C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 22:51:01 +0100 (CET)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8qwt-00075R-L9
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 16:50:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n8quI-0005pr-Cm; Sat, 15 Jan 2022 16:48:18 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:41394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n8quF-0005er-MT; Sat, 15 Jan 2022 16:48:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 99C097457ED;
 Sat, 15 Jan 2022 22:48:10 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 133CC74570D; Sat, 15 Jan 2022 22:48:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 115B07456B4;
 Sat, 15 Jan 2022 22:48:10 +0100 (CET)
Date: Sat, 15 Jan 2022 22:48:10 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
In-Reply-To: <989489c1-33f4-698c-01de-70f6f27cb51d@kaod.org>
Message-ID: <cad6a88-d8d4-9061-b8d2-6e316f5fd293@eik.bme.hu>
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <20220107125747.7ddfd3a0@bahia> <Ydgvt0VwFUP0MD5h@yekko>
 <20220107143910.4443af02@bahia>
 <4bad4da5-44b6-717c-7770-609ddd5256f0@ozlabs.ru>
 <989489c1-33f4-698c-01de-70f6f27cb51d@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-221461319-1642283290=:61313"
X-Spam-Probability: 11%
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-221461319-1642283290=:61313
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 14 Jan 2022, Cédric Le Goater wrote:
> On 1/10/22 03:52, Alexey Kardashevskiy wrote:
>> On 08/01/2022 00:39, Greg Kurz wrote:
>>> On Fri, 7 Jan 2022 23:19:03 +1100
>>> David Gibson <david@gibson.dropbear.id.au> wrote:
>>> 
>>>> On Fri, Jan 07, 2022 at 12:57:47PM +0100, Greg Kurz wrote:
>>>>> On Fri, 7 Jan 2022 18:24:23 +1100
>>>>> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>>> 
>>>>>> "PowerPC Processor binding to IEEE 1275" says in
>>>>>> "8.2.1. Initial Register Values" that the initial state is defined as
>>>>>> 32bit so do it for both SLOF and VOF.
>>>>>> 
>>>>>> This should not cause behavioral change as SLOF switches to 64bit very
>>>>>> early anyway.
>>>>> 
>>>>> Only one CPU goes through SLOF. What about the other ones, including
>>>>> hot plugged CPUs ?
>>>> 
>>>> Those will be started by the start-cpu RTAS call which has its own
>>>> semantics.
>>>> 
>>> 
>>> Ah indeed, there's code in linux/arch/powerpc/kernel/head_64.S to switch
>>> secondaries to 64bit... but then, as noted by Cedric, ppc_cpu_reset(),
>>> which is called earlier sets MSR_SF but the changelog of commit 
>>> 8b9f2118ca40
>>> doesn't provide much details on the motivation. Any idea ?
>> 
>> https://patchwork.kernel.org/project/qemu-devel/patch/1458121432-2855-1-git-send-email-lvivier@redhat.com/
>> 
>> this is probably it:
>> 
>> ===
>> Reset is properly defined as an exception (0x100). For exceptions, the
>> 970MP user manual for example says:
>> 
>> 4.5 Exception Definitions
>> When an exception/interrupt is taken, all bits in the MSR are set to
>> ‘0’, with the following exceptions:
>> • Exceptions always set MSR[SF] to ‘1’.
>> ===
>> 
>> but it looks like the above is about emulation bare metal 970 rather than 
>> pseries VCPU so that quote does not apply to spapr.
>
> Yes, more info here :
>
>  https://patchwork.kernel.org/project/qemu-devel/patch/1458121432-2855-1-git-send-email-lvivier@redhat.com/
>
> mac99+970 only boots with a 64bit kernel. 32bit are not supported because
> of the use of the rfi instruction which was removed in v2.01. 32bit user
> space is supported though.
>
> However I was not able to build a disk with a compatible boot partition
> for OpenBIOS. The above support only applies for kernel loaded in memory.

Not sure it's related or helpful but I've managed to install Adélie Linux 
(which still has official support for PPC Macs) on qemu-system-ppc64 -M 
mac99,via=pmu a while ago. Here's a thread about my experiences with 
Adélie Linux:

https://lists-old.adelielinux.org/hyperkitty/list/adelie-devel@lists.adelielinux.org/thread/CNWIYZCFN7XDBSDCZDVIUE3SXE2EX6YF/index.html

but that mentions qemu-system-ppc and ppc32 version so this was before the 
ppc64 install which may be a newer Adélie version that I had no such 
problem starting. Ar least I did not need the patched OpenBIOS for ppc64. 
I think that version worked with qemu-system-ppc64 and could just install 
it following the manual install described in the Adélie docs:

https://git.adelielinux.org/adelie/docs/-/wikis/Quick-Start-Guides/Installation

To boot the installed system I had to type "boot hd:2,\grub" as it did not 
find the boot partition for some reason (maybe because not preserving 
nvram variables).

The installed disk has these partitions:
1: Apple partition map
2. boot (HFS)
3: root (ext4)

This was a while ago so I don't remember the details but I think it worked 
for the G5 mac99 without much problem.

Regards,
BALATON Zoltan
--3866299591-221461319-1642283290=:61313--

