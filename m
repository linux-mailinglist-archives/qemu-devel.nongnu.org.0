Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80654E261C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 13:13:28 +0100 (CET)
Received: from localhost ([::1]:49256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWGud-0003el-Ih
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 08:13:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nWGt3-0002yt-Lx
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 08:11:49 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:40557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nWGt1-0007vb-4i
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 08:11:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CCDC87466FF;
 Mon, 21 Mar 2022 13:11:40 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5AE54745958; Mon, 21 Mar 2022 13:11:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 58D447456FE;
 Mon, 21 Mar 2022 13:11:40 +0100 (CET)
Date: Mon, 21 Mar 2022 13:11:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Memory leak in via_isa_realize()
In-Reply-To: <CAFEAcA-jEqnpUdtfgqMFUn_ghwoYM+8UyceLUz+Uo07FuH+S-Q@mail.gmail.com>
Message-ID: <ab9c9599-2021-42df-7bfe-4f2f3842cb84@eik.bme.hu>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
 <CAFEAcA-jEqnpUdtfgqMFUn_ghwoYM+8UyceLUz+Uo07FuH+S-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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

Everything involving ISA emulation in QEMU is not completely QOMified and 
this has caused some problems before but I did not want to try to fix it 
both becuase it's too much unrelated work and because it's used by too 
many things that could break that I can't even test. So I'd rather 
somebody more comfortable with this would look at ISA QOMification.

> In this specific case, though, it seems like the only thing that
> the via_isa_request_i8259_irq() function does is pass the interrupt
> signal through to its own s->cpu_intr, so I think a relatively
> self-contained way to deal with the leak is to pass s->cpu_intr
> into i8259_init() and drop the isa_irq allocated irq and its
> associated helper function entirely. (There might be some subtlety
> I'm missing that means that wouldn't work, of course.)

I think I've tried to do that first and it did not work for some reason 
then I got this way from some other device model which works but I forgot 
the details. You can test it by booting MorphOS or Debian Linux 8.11 PPC 
on pegasos2 which support this machine or maybe I can have a look later 
this week if it's not urgent and try something but I don't mind if 
somebody comes up with a fix before that.

Regards,
BALATON Zoltan

