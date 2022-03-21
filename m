Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4614E301F
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 19:38:17 +0100 (CET)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWMv2-0001v1-5s
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 14:38:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nWMrW-0008W8-Sd
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:34:38 -0400
Received: from [2001:738:2001:2001::2001] (port=45868 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nWMrT-0002U5-U3
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 14:34:37 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id C4F27746FDE;
 Mon, 21 Mar 2022 19:34:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A3A26746E0D; Mon, 21 Mar 2022 19:34:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A1888746353;
 Mon, 21 Mar 2022 19:34:31 +0100 (CET)
Date: Mon, 21 Mar 2022 19:34:31 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Memory leak in via_isa_realize()
In-Reply-To: <CAFEAcA-jEqnpUdtfgqMFUn_ghwoYM+8UyceLUz+Uo07FuH+S-Q@mail.gmail.com>
Message-ID: <43e858d3-2125-4c78-ae65-56acda2abfd@eik.bme.hu>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <CAFEAcA-jEqnpUdtfgqMFUn_ghwoYM+8UyceLUz+Uo07FuH+S-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022, Peter Maydell wrote:
> On Mon, 21 Mar 2022 at 10:31, Thomas Huth <thuth@redhat.com> wrote:
>> FYI, I'm seeing a memory leak in via_isa_realize() when building
>> QEMU with sanitizers enabled or when running QEMU through valgrind:
>> Same problem happens with qemu-system-ppc64 and the pegasos2 machine.
>>
>> No clue how to properly fix this... is it safe to free the pointer
>> at the end of the function?
>
> This is because the code is still using the old function
> qemu_allocate_irqs(), which is almost always going to involve
> it leaking memory. The fix is usually to rewrite the code to not use
> that function at all, i.e. to manage its irq/gpio lines differently.
> Probably the i8259 code should have a named GPIO output line
> rather than wanting to be passed a qemu_irq in an init function,
> and the via code should have an input GPIO line which it connects
> up to the i8259. It looks from a quick glance like the i8259 and
> its callers have perhaps not been completely QOMified.
>
> In this specific case, though, it seems like the only thing that
> the via_isa_request_i8259_irq() function does is pass the interrupt
> signal through to its own s->cpu_intr, so I think a relatively
> self-contained way to deal with the leak is to pass s->cpu_intr
> into i8259_init() and drop the isa_irq allocated irq and its
> associated helper function entirely. (There might be some subtlety
> I'm missing that means that wouldn't work, of course.)

So the recent piix4 cleanups did not change this and it seems to have the 
same qemu_allocate_irqs and forwarding as well as i82378. Does similar 
leak exist for those too? And probably all other callers of i8259_init(), 
so this would probably be better fixed in that device model instead but I 
don't know anything about that so I don't want to touch it. Within 
vt82c686 we could probably store the allocated irq in the device state and 
free it in a finalize function or simliar if that's possible but that 
would only fix one case of simliar problems and it's unnecessary 
complication if this could be properly fixed elsewhere. So I give up on 
this for now and wait if somebody could do something about i8259_init 
instead. That seems like a legacy init function that should be resolved,

Regards,
BALATON Zoltan

