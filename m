Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF6B4E3243
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:18:16 +0100 (CET)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPPr-0002fx-8l
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:18:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nWPOB-0000kN-OJ; Mon, 21 Mar 2022 17:16:34 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:19036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nWPO8-0007qj-Lc; Mon, 21 Mar 2022 17:16:30 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3BB38746E0D;
 Mon, 21 Mar 2022 22:16:26 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 151A8746353; Mon, 21 Mar 2022 22:16:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 132C8746333;
 Mon, 21 Mar 2022 22:16:26 +0100 (CET)
Date: Mon, 21 Mar 2022 22:16:26 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: Memory leak in via_isa_realize()
In-Reply-To: <469a9e48-a75b-f6ec-367e-ac37b8e04ac9@kaod.org>
Message-ID: <fc6c4f70-f15e-6e3-db75-727e4fb0f81a@eik.bme.hu>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <CAFEAcA-jEqnpUdtfgqMFUn_ghwoYM+8UyceLUz+Uo07FuH+S-Q@mail.gmail.com>
 <ab9c9599-2021-42df-7bfe-4f2f3842cb84@eik.bme.hu>
 <469a9e48-a75b-f6ec-367e-ac37b8e04ac9@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1369631289-1647897386=:43261"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1369631289-1647897386=:43261
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 21 Mar 2022, Cédric Le Goater wrote:
> On 3/21/22 13:11, BALATON Zoltan wrote:
>> On Mon, 21 Mar 2022, Peter Maydell wrote:
>>> On Mon, 21 Mar 2022 at 10:31, Thomas Huth <thuth@redhat.com> wrote:
>>>> FYI, I'm seeing a memory leak in via_isa_realize() when building
>>>> QEMU with sanitizers enabled or when running QEMU through valgrind:
>>>> Same problem happens with qemu-system-ppc64 and the pegasos2 machine.
>>>> 
>>>> No clue how to properly fix this... is it safe to free the pointer
>>>> at the end of the function?
>>> 
>>> This is because the code is still using the old function
>>> qemu_allocate_irqs(), which is almost always going to involve
>>> it leaking memory. The fix is usually to rewrite the code to not use
>>> that function at all, i.e. to manage its irq/gpio lines differently.
>>> Probably the i8259 code should have a named GPIO output line
>>> rather than wanting to be passed a qemu_irq in an init function,
>>> and the via code should have an input GPIO line which it connects
>>> up to the i8259. It looks from a quick glance like the i8259 and
>>> its callers have perhaps not been completely QOMified.
>> 
>> Everything involving ISA emulation in QEMU is not completely QOMified and 
>> this has caused some problems before but I did not want to try to fix it 
>> both becuase it's too much unrelated work and because it's used by too many 
>> things that could break that I can't even test. So I'd rather somebody more 
>> comfortable with this would look at ISA QOMification.
>
> Regarding the ppc44x and ppc40x machines, we have a lot of tests in place
> and the QOM translation shouldn't be too complex. This is about changing
> the board and device instantiation and not the CPU internal models,
> like exceptions and SoftTLBs, which can be much more complex to test.
>
>>> In this specific case, though, it seems like the only thing that
>>> the via_isa_request_i8259_irq() function does is pass the interrupt
>>> signal through to its own s->cpu_intr, so I think a relatively
>>> self-contained way to deal with the leak is to pass s->cpu_intr
>>> into i8259_init() and drop the isa_irq allocated irq and its
>>> associated helper function entirely. (There might be some subtlety
>>> I'm missing that means that wouldn't work, of course.)
>> 
>> I think I've tried to do that first and it did not work for some reason 
>> then I got this way from some other device model which works but I forgot 
>> the details. You can test it by booting MorphOS or Debian Linux 8.11 PPC on 
>> pegasos2 which support this machine or maybe I can have a look later this 
>> week if it's not urgent and try something but I don't mind if somebody 
>> comes up with a fix before that.
>
> I will support this work and I can even send some patches I have started
> for the 405 to cleanup the bit-rotting models.

I'm not sure what do you mean as this was about a memory leak in via-isa 
used only by PPC pegasos2 and MIPS fuloong2e machines. None of the 4xx 
machines are involved. Fixing this properly would ideally need changing 
the i8259 model which is also used by a lot of other non-PPC machines that 
I can't test and don't want to break so I just did what all other similar 
code calling i8259_init does. This was just found out with the via model 
but I think it's not specific to PPC.

That said there may be other unrelated clean up opportunities in the 4xx 
machines but this thread wasn't about that.

Regards,
BALATON Zoltan
--3866299591-1369631289-1647897386=:43261--

