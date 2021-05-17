Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6983382BF6
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:20:14 +0200 (CEST)
Received: from localhost ([::1]:40328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licEH-00067H-Sd
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:20:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1licBt-0004jP-Om; Mon, 17 May 2021 08:17:47 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:16095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1licBn-0006qv-SQ; Mon, 17 May 2021 08:17:44 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id ABB5A746392;
 Mon, 17 May 2021 14:17:36 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7E62A746351; Mon, 17 May 2021 14:17:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7CCA874634B;
 Mon, 17 May 2021 14:17:36 +0200 (CEST)
Date: Mon, 17 May 2021 14:17:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
In-Reply-To: <8e1bae8e-9b8e-0895-5747-9e7cd7d70def@ozlabs.ru>
Message-ID: <381924b9-29fd-67a0-e311-72c8718f853@eik.bme.hu>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
 <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
 <8e1bae8e-9b8e-0895-5747-9e7cd7d70def@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-577471187-1621253856=:60286"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-577471187-1621253856=:60286
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 17 May 2021, Alexey Kardashevskiy wrote:
> On 5/16/21 01:04, BALATON Zoltan wrote:
>> On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:
>
> [snip]
>
>>> +/* Defined as Big Endian */
>>> +struct prom_args {
>>> +    uint32_t service;
>>> +    uint32_t nargs;
>>> +    uint32_t nret;
>>> +    uint32_t args[10];
>>> +} QEMU_PACKED;
>> 
>> This #define and struct definition should probably be moved to 
>> include/hw/ppc/vof.h as I had to copy these when trying to get VOF running 
>> with pegasos2 and these seem to be VOF specific not spapr.
>
> Correct, I'll fix it - there are 2 copies already.
>
>
>> 
>> I was trying to wire up VOF on pegasos2 as proof of concept but I did not 
>> get very far as it crashed at the first move due to using mtmsrd which does 
>> not exist on the 32 bit CPUs (G4 or G3) used by pegasos2:
>> 
>> vof_claim virt=0x0 size=0xc38 align=0x0 => 0x0
>> vof_claim virt=0x0 size=0x8000 align=0x8000 => 0x8000
>> vof_claim virt=0xc00000 size=0x18fd62 align=0x0 => 0xc00000
>> vof_claimed 0x0..0xc38 size=0xc38
>> vof_claimed 0x8000..0x10000 size=0x8000
>> vof_claimed 0xc00000..0xd8fd62 size=0x18fd62
>> vof_avail 0xc38..0x8000 size=0x73c8
>> vof_avail 0x10000..0xc00000 size=0xbf0000
>> vof_avail 0xd8fd62..0x20000000 size=0x1f27029e
>> via_superio_cfg: unimplemented register 0xf2
>> via_superio_cfg: unimplemented register 0xf4
>> via_superio_cfg: unimplemented register 0xf6
>> via_superio_cfg: unimplemented register 0xf7
>> invalid/unsupported opcode: 1f - 12 - 05 - 00 (7fe00164) fff00108 0
>> ----------------
>> IN:
>> 0xfff00100:  3fe00000  lis      r31, 0
>> 0xfff00104:  63ff0000  ori      r31, r31, 0
>> 0xfff00108:  7fe00164  mtmsrd   r31
>> 
>> ----------------
>> IN:
>> 0xfff00700:  807e8020  lwz      r3, -0x7fe0(r30)
>> 0xfff00704:  4cc63182  crclr    6
>> 0xfff00708:  4bfffd1d  bl       0xfff00424
>> 
>> Invalid access at addr 0xFFFF8020, size 4, region '(null)', reason: 
>> rejected
>> 
>> Is this mtmsrd really needed? Do 64-bit Power CPUs start in 64 bit mode?
>
> Yup:
> https://git.qemu.org/?p=qemu.git;a=blob;f=target/ppc/translate_init.c.inc;h=66e6a4a746f46148e0006081af09391b32c125cd;hb=HEAD#l10085
>
> I cannot find the exact reason for that, probably PAPR or some PPC-OF binding 
> says so.
>
>
>> I'd expect them to be in compatibility mode unless 64 bit is enabled but I 
>> did not check the docs. If it's needed maybe a dummy handler has to be at 
>> 0x700 to ignore this exception if it's running on a 32-bit CPU.
>
> I wanted MSR and the code to be in sync explicitly.

OK, then can you add a dummy exception handler at 0x700 to ignore this so 
it would also work on a 32-bit CPU? That does not seem to be too 
difficult.

>> By the way does vof need to be loaded at addr 0 or it could work at the 
>> default ROM address as well? That would simplify usage if it could run 
>> position independent.
>
> What do you call the default ROM address? SLOF loads at 0 and starts at 
> 0x100, VOF does the same.

On pegasos2 the ROM is at 0xfff00000 normally and that's where it starts 
executing at offset 0x100. If I load vof.bin there it starts but 
hypercalls fail as above. I've changed it to load vof at 0 then it works 
a bit better and after adding the property to /chosen it tries to query 
it but fails there for some reason.

> Making it run position independend is going to make it more complex and I 
> really (really) want it to be tiny.

It's not needed as I can special case it and load vof at 0 but is it more 
complex than just compiling it with the appropriate flag for PIC (-fPIC or 
what is it).

> I think what you really want is another vof-pegasos2.bin linked at the 
> address you like and not calling mtmsrd, could be an #ifdef in the existing 
> vof firmware. It is rather expected to have a firmware per a machine type.

Is that really needed? Can we make a single firmware binary run on 
different CPUs? I think openbios-ppc runs on both 64 and 32 bit PPC while 
itself compiled as 32 bit but also runs with qemu-system-ppc64 -M mac99 
which uses a G5 CPU by default. It does some magic here:

https://github.com/openbios/openbios/blob/master/arch/ppc/qemu/start.S

but that may be too ugly to copy.

Another thing that I'm not sure about is that on 32 bit OpenFirmware cells 
are normally also 32 bit but VOF expects them to be 64 bit so I had to 
change the mem reg and chosen qemu,boot-kernel properties that VOF queries 
to use uint64_t and not sure that would be a problem. For now I'm just 
trying to get some guest code to run and try to use the VOF CI to see if 
it would work. If guests expect mem reg to be 32 bit then we may need a 
separate version for that.

Regards,
BALATON Zoltan
--3866299591-577471187-1621253856=:60286--

