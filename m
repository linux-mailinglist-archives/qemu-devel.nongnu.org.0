Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC5E38E5D8
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 13:51:14 +0200 (CEST)
Received: from localhost ([::1]:49454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll973-0003GJ-5P
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 07:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ll96D-0002Qc-5f; Mon, 24 May 2021 07:50:21 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:10086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ll969-0004MV-08; Mon, 24 May 2021 07:50:20 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 745BD7457E7;
 Mon, 24 May 2021 13:50:13 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 37A61745708; Mon, 24 May 2021 13:50:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3698D74570E;
 Mon, 24 May 2021 13:50:13 +0200 (CEST)
Date: Mon, 24 May 2021 13:50:13 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH qemu v19] spapr: Implement Open Firmware client interface
In-Reply-To: <YKsums4Wkw0c9d9M@yekko>
Message-ID: <6909b-d060-2a8e-94ea-af847b94a6a7@eik.bme.hu>
References: <20210422125819.1122661-1-aik@ozlabs.ru>
 <c9997a3b-118b-6a23-d3cb-4c3c59dc839d@eik.bme.hu>
 <8e1bae8e-9b8e-0895-5747-9e7cd7d70def@ozlabs.ru>
 <381924b9-29fd-67a0-e311-72c8718f853@eik.bme.hu> <YKsums4Wkw0c9d9M@yekko>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-852619552-1621857013=:15801"
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-852619552-1621857013=:15801
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 24 May 2021, David Gibson wrote:
> On Mon, May 17, 2021 at 02:17:36PM +0200, BALATON Zoltan wrote:
>> On Mon, 17 May 2021, Alexey Kardashevskiy wrote:
>>> On 5/16/21 01:04, BALATON Zoltan wrote:
>>>> On Thu, 22 Apr 2021, Alexey Kardashevskiy wrote:
>>>
>>> [snip]
>>>
>>>>> +/* Defined as Big Endian */
>>>>> +struct prom_args {
>>>>> +    uint32_t service;
>>>>> +    uint32_t nargs;
>>>>> +    uint32_t nret;
>>>>> +    uint32_t args[10];
>>>>> +} QEMU_PACKED;
>>>>
>>>> This #define and struct definition should probably be moved to
>>>> include/hw/ppc/vof.h as I had to copy these when trying to get VOF
>>>> running with pegasos2 and these seem to be VOF specific not spapr.
>>>
>>> Correct, I'll fix it - there are 2 copies already.
>>>
>>>
>>>>
>>>> I was trying to wire up VOF on pegasos2 as proof of concept but I
>>>> did not get very far as it crashed at the first move due to using
>>>> mtmsrd which does not exist on the 32 bit CPUs (G4 or G3) used by
>>>> pegasos2:
>>>>
>>>> vof_claim virt=0x0 size=0xc38 align=0x0 => 0x0
>>>> vof_claim virt=0x0 size=0x8000 align=0x8000 => 0x8000
>>>> vof_claim virt=0xc00000 size=0x18fd62 align=0x0 => 0xc00000
>>>> vof_claimed 0x0..0xc38 size=0xc38
>>>> vof_claimed 0x8000..0x10000 size=0x8000
>>>> vof_claimed 0xc00000..0xd8fd62 size=0x18fd62
>>>> vof_avail 0xc38..0x8000 size=0x73c8
>>>> vof_avail 0x10000..0xc00000 size=0xbf0000
>>>> vof_avail 0xd8fd62..0x20000000 size=0x1f27029e
>>>> via_superio_cfg: unimplemented register 0xf2
>>>> via_superio_cfg: unimplemented register 0xf4
>>>> via_superio_cfg: unimplemented register 0xf6
>>>> via_superio_cfg: unimplemented register 0xf7
>>>> invalid/unsupported opcode: 1f - 12 - 05 - 00 (7fe00164) fff00108 0
>>>> ----------------
>>>> IN:
>>>> 0xfff00100:  3fe00000  lis      r31, 0
>>>> 0xfff00104:  63ff0000  ori      r31, r31, 0
>>>> 0xfff00108:  7fe00164  mtmsrd   r31
>>>>
>>>> ----------------
>>>> IN:
>>>> 0xfff00700:  807e8020  lwz      r3, -0x7fe0(r30)
>>>> 0xfff00704:  4cc63182  crclr    6
>>>> 0xfff00708:  4bfffd1d  bl       0xfff00424
>>>>
>>>> Invalid access at addr 0xFFFF8020, size 4, region '(null)', reason:
>>>> rejected
>>>>
>>>> Is this mtmsrd really needed? Do 64-bit Power CPUs start in 64 bit mode?
>>>
>>> Yup:
>>> https://git.qemu.org/?p=qemu.git;a=blob;f=target/ppc/translate_init.c.inc;h=66e6a4a746f46148e0006081af09391b32c125cd;hb=HEAD#l10085
>>>
>>> I cannot find the exact reason for that, probably PAPR or some PPC-OF
>>> binding says so.
>>>
>>>
>>>> I'd expect them to be in compatibility mode unless 64 bit is enabled
>>>> but I did not check the docs. If it's needed maybe a dummy handler
>>>> has to be at 0x700 to ignore this exception if it's running on a
>>>> 32-bit CPU.
>>>
>>> I wanted MSR and the code to be in sync explicitly.
>>
>> OK, then can you add a dummy exception handler at 0x700 to ignore this so it
>> would also work on a 32-bit CPU? That does not seem to be too difficult.
>
> I don't like that idea.  I really think the idea with VOF should be
> that it's explicitly closely married to qemu, so we shouldn't have to
> mess around with the firmware image coping with different situations.
>
> So a) I don't think we should go to *any* trouble to have the same VOF
> guest image work on multiple machine types (nor multiple qemu
> versions).  And b) I think VOF should just assume qemu has started it
> in the mode it wants and not try to get it there.

This problem is already resolved by the latest vof patch (v20), the idea 
of an exception handler came back because of sc 1 causing program 
exception after vhyp is cleared but if we can keep that enabled this won't 
be needed. VOF itself is compiled 32 bit so should work on ppc32 just 
there were some 64-bit opcodes left that can be eliminated so we don't 
need another version for pegasos2. I think it's simpler to maintain a 
single vof version than having a fork for every machine that tries to use 
it so while not going into big trouble is OK but some small changes to 
avoid a separate version should be considered. So far I haven't found 
anything that would need big changes. Even if we decide to use a different 
hypercall method in the future that could be implemented in the same vof 
sources either compile or run time selectable but for now I hope the 
current way will work, I'll have to test it further.

Regards,
BALATON Zoltan
--3866299591-852619552-1621857013=:15801--

