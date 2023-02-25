Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5376A2BA4
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 21:21:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pW113-0003tN-MP; Sat, 25 Feb 2023 15:19:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pW111-0003sX-88; Sat, 25 Feb 2023 15:19:31 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pW10z-0003Up-F1; Sat, 25 Feb 2023 15:19:31 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 9C7E874632B;
 Sat, 25 Feb 2023 21:19:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 637B4745720; Sat, 25 Feb 2023 21:19:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 61932745706;
 Sat, 25 Feb 2023 21:19:24 +0100 (CET)
Date: Sat, 25 Feb 2023 21:19:24 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Bernhard Beschow <shentey@gmail.com>, philmd@redhat.com
Subject: Re: [PATCH 3/5] hw/ppc/pegasos2: Fix PCI interrupt routing
In-Reply-To: <fff5cea4-43e6-60ff-4266-c0753d1dfd38@linaro.org>
Message-ID: <2a1611a0-9948-dc41-24d7-7e497846d47b@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <c046d77c20875c8cd8bfdc79b4619a98ffd0bf33.1677004415.git.balaton@eik.bme.hu>
 <fff5cea4-43e6-60ff-4266-c0753d1dfd38@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-842223874-1677356364=:83372"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--3866299591-842223874-1677356364=:83372
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

I remembered there was something like that somewhere but could not find 
it. Thanks, I'll check if that's simpler here.

Regards,
BALATON Zoltan
--3866299591-842223874-1677356364=:83372--

