Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639606A3497
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 23:22:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWPPb-0004UH-8K; Sun, 26 Feb 2023 17:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPPZ-0004Tz-85; Sun, 26 Feb 2023 17:22:29 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pWPPX-0006dO-OZ; Sun, 26 Feb 2023 17:22:29 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A7568746D65;
 Sun, 26 Feb 2023 23:22:25 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 84028746705; Sun, 26 Feb 2023 23:22:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8266C74645F;
 Sun, 26 Feb 2023 23:22:25 +0100 (CET)
Date: Sun, 26 Feb 2023 23:22:25 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 3/5] hw/ppc/pegasos2: Fix PCI interrupt routing
In-Reply-To: <fff5cea4-43e6-60ff-4266-c0753d1dfd38@linaro.org>
Message-ID: <ba27ecbf-3c89-f0b3-d98e-bac593aaaeed@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <c046d77c20875c8cd8bfdc79b4619a98ffd0bf33.1677004415.git.balaton@eik.bme.hu>
 <fff5cea4-43e6-60ff-4266-c0753d1dfd38@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2131200427-1677450145=:59185"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2131200427-1677450145=:59185
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 25 Feb 2023, Philippe Mathieu-Daudé wrote:
> On 21/2/23 19:44, BALATON Zoltan wrote:
>> According to the PegasosII schematics the PCI interrupt lines are
>> connected to both the gpp pins of the Mv64361 north bridge and the
>> PINT pins of the VT8231 south bridge so guests can get interrupts from
>> either of these. So far we only had the MV64361 connections which
>> worked for on board devices but for additional PCI devices (such as
>> network or sound card added with -device) guest OSes expect interrupt
>> from the ISA IRQ 9 where the firmware routes these PCI interrupts in
>> VT8231 ISA bridge. After the previous patches we can now model this
>> and also remove the board specific connection from mv64361. Also
>> configure routing of these lines when using Virtual Open Firmware to
>> match board firmware for guests that expect this.
>> 
>> This fixes PCI interrupts on pegasos2 under Linux, MorphOS and AmigaOS.
>> 
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   hw/pci-host/mv64361.c |  4 ----
>>   hw/ppc/pegasos2.c     | 26 +++++++++++++++++++++++++-
>>   2 files changed, 25 insertions(+), 5 deletions(-)
>
>
>> +static void pegasos2_pci_irq(void *opaque, int n, int level)
>> +{
>> +    Pegasos2MachineState *pm = opaque;
>> +
>> +    /* PCI interrupt lines are connected to both MV64361 and VT8231 */
>> +    qemu_set_irq(pm->mv_pirq[n], level);
>> +    qemu_set_irq(pm->via_pirq[n], level);
>> +}
>
> See TYPE_SPLIT_IRQ.

I've checked it but instead of storing 8 qemi_irqs in machine state we 
would end up storing additional 2 DeviceStates and had to use cryptic 
qemu_gpio and qdev commands to achieve the same in a much more convoluted 
and longer way. So I concluded that if you have to split an irq into more 
than two or have variable number of destinations then split-irq would be 
useful but it's an overkill for this simple case so I'd stay with the 
simple solution that's easy to understand.

Regards,
BALATON Zoltan
--3866299591-2131200427-1677450145=:59185--

