Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4E058CCAB
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 19:28:54 +0200 (CEST)
Received: from localhost ([::1]:37744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL6Ye-0006ds-M9
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 13:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL6Vi-000269-Ip; Mon, 08 Aug 2022 13:25:51 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:37841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL6Ve-0005fg-EV; Mon, 08 Aug 2022 13:25:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BA7A57475F9;
 Mon,  8 Aug 2022 19:25:40 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4883F746FDE; Mon,  8 Aug 2022 19:25:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 46EA9745702;
 Mon,  8 Aug 2022 19:25:40 +0200 (CEST)
Date: Mon, 8 Aug 2022 19:25:40 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 07/22] ppc/ppc405: QOM'ify CPU
In-Reply-To: <CAFEAcA9ThTqTaJCNM1M97+yMfj3gNPwpFxy6weAG6fcaGfbqQw@mail.gmail.com>
Message-ID: <dbd9e921-9e8b-3049-1ace-7fddecfe6f13@eik.bme.hu>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-8-clg@kaod.org>
 <2499ab9-44e8-a33f-5f4-74a1d7ad3e7@eik.bme.hu>
 <4cdc4026-78c5-e617-c74c-3ee5aa5d44d3@kaod.org>
 <cd735510-ec37-357c-3fa9-34b0d445c5a2@eik.bme.hu>
 <CAFEAcA9ThTqTaJCNM1M97+yMfj3gNPwpFxy6weAG6fcaGfbqQw@mail.gmail.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Aug 2022, Peter Maydell wrote:
> On Mon, 8 Aug 2022 at 18:05, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>> But the handler we register here just calls cpu_reset which seems to just
>> call the reset method of the CPU object. If we have nothing else to do
>> here do we need to explicitly call cpi_reset like this? Wouldn't the CPU
>> object be reset by qdev when resetting the machine or the soc its in? If
>> we have our own reset method we may call cpu_reset from there to make sure
>> the CPU is in a known state but is this needed when we don't want to do
>> anything else? I don't know how reset handling works but some machines
>> seems to do this and others don't.
>
> You do unfortunately need to manually reset the CPU object. This is
> because the 'automatic' qdev reset only works for devices that hang
> off a bus (including sysbus devices). This is because it works by
> having qdev_machine_creation_done() register a reset function which
> does "reset the sysbus". Resetting a bus resets every device on it.
> Resetting a device resets every bus it owns. (This means that for
> instance PCI devices get reset because the PCI controller is on the
> sysbus, so it gets reset, and it owns the PCI bus, so the PCI bus
> resets when the controller is reset, and when the PCI bus resets
> then all the devices on it are reset.) So reset propagates down
> the bus tree, but it won't reach devices which aren't on that bus
> tree at all. The most common case of "device which isn't on a bus"
> is the CPU objects.
>
> This is, clearly, a complete mess. I would strongly like to sort it
> out, but to do that we need (a) a plan for what reset handling ought
> to look like and (b) a transition plan for getting from here to there
> without breaking everything in the process. I haven't had the time
> to focus on that, though it's been nominally on my todo list for years.
>
> In the meantime, it's the responsibility of something in architecture
> specific code to arrange for the CPU objects to be reset -- whether
> that's done directly by the board, or hidden in some other layer
> of code, depends on the target arch. For instance for arm it's
> hidden inside arm_load_kernel() and board models must therefore
> call that function even if they have no intention of supporting
> loading Linux kernels. For sparc it's done directly in the board code.

OK thanks for the clarification. Both bamboo and sam460ex has a 
main_cpu_reset function that is registered from the machine init func 
which calls cpu_reset. Maybe 405 boards could do the same for consistency? 
It could also be added to the soc object's reset method as that owns the 
cpu so maybe it may make more sense that way. This is probably also OK as 
440 machines don't have soc object yet so it wouldn't cause any problems.

I think the ppc4xx_reset func was kept around because ppc4xx_init was also 
kept but nothing else seems to use it so maybe these should become the soc 
object's realize and reset methods and drop the current ppc4xx_init and 
reset funcs?

Regards,
BALATON Zoltan

