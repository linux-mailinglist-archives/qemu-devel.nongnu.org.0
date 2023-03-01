Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D36A706A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:02:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOu0-0004KX-H0; Wed, 01 Mar 2023 11:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXOtx-0004J9-TH; Wed, 01 Mar 2023 11:01:57 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pXOtw-0002Es-20; Wed, 01 Mar 2023 11:01:57 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 72857746361;
 Wed,  1 Mar 2023 17:01:50 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EB9DC7462DB; Wed,  1 Mar 2023 17:01:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E9B287457E7;
 Wed,  1 Mar 2023 17:01:49 +0100 (CET)
Date: Wed, 1 Mar 2023 17:01:49 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/5] hw/ppc/pegasos2: Initialize VT8231 PCI IRQ router
In-Reply-To: <3513d735-23e9-35ce-3511-1acccac7ac5c@ilande.co.uk>
Message-ID: <772336f0-d92c-dc50-bfd3-8823ad822f8b@eik.bme.hu>
References: <20230223202053.117050-1-shentey@gmail.com>
 <20230223202053.117050-2-shentey@gmail.com>
 <3513d735-23e9-35ce-3511-1acccac7ac5c@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Wed, 1 Mar 2023, Mark Cave-Ayland wrote:
> On 23/02/2023 20:20, Bernhard Beschow wrote:
>
>> The firmware of the real PegasosII board routes all PIRQx to IRQ9, so do
>> the same in QEMU. The PCI_INTERRUPT_LINE registers of the respective
>> internal PCI functions are already initialized with IRQ9 which are
>> currently used for routing.
>> 
>> Note that the PCI interrupt router isn't implemented yet in the VIA
>> south bridges. This change has therefore no effect until this happens.
>> 
>> Inspired-by:
>> <c046d77c20875c8cd8bfdc79b4619a98ffd0bf33.1677004415.git.balaton@eik.bme.hu>
>> ("hw/ppc/pegasos2: Fix PCI interrupt routing")
>> 
>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>> ---
>>   hw/ppc/pegasos2.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>> 
>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>> index a9563f4fb2..41688699eb 100644
>> --- a/hw/ppc/pegasos2.c
>> +++ b/hw/ppc/pegasos2.c
>> @@ -268,6 +268,12 @@ static void pegasos2_machine_reset(MachineState 
>> *machine, ShutdownCause reason)
>>                                 PCI_INTERRUPT_LINE, 2, 0x9);
>>       pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>>                                 0x50, 1, 0x2);
>> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>> +                              0x55, 1, 0x90);
>> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>> +                              0x56, 1, 0x99);
>> +    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
>> +                              0x57, 1, 0x90);
>>         pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
>>                                 PCI_INTERRUPT_LINE, 2, 0x109);
>
> The patch looks okay, but I think the commit message doesn't quite represent 
> why it is required. I presume this configures the PCI IRQ router in the same 
> way as the firmware so that it is possible to launch Linux directly with 
> -kernel?

You're commenting on old versions. Please only review v5 now which is the 
last version we're about to commit for 8.0. You can read through older 
discussion to see where we are but probably not much use to comment on 
those now.

Regards,
BALATON Zoltan

