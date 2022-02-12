Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AC74B3555
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 14:46:30 +0100 (CET)
Received: from localhost ([::1]:53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIsjM-0002Bo-Mu
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 08:46:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIsfF-000875-HH
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:42:13 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:56021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nIsfC-0005CN-LL
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 08:42:13 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E686D746381;
 Sat, 12 Feb 2022 14:42:07 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id C6D2F746361; Sat, 12 Feb 2022 14:42:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id C57C8746324;
 Sat, 12 Feb 2022 14:42:07 +0100 (CET)
Date: Sat, 12 Feb 2022 14:42:07 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH v2 4/5] isa/piix4: Fix PCI IRQ levels to be preserved in
 VMState
In-Reply-To: <20220212113519.69527-5-shentey@gmail.com>
Message-ID: <ebb5f8ad-64dc-8349-4d1c-7d8b623d60b2@eik.bme.hu>
References: <20220212113519.69527-1-shentey@gmail.com>
 <20220212113519.69527-5-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1176834320-1644673327=:48202"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1176834320-1644673327=:48202
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 12 Feb 2022, Bernhard Beschow wrote:
> Now that pci_irq_levels[] is part of PIIX4State, the PCI IRQ levels can
> be saved and restored via the VMState mechanism. This fixes migrated VMs
> to start with PCI IRQ levels zeroed, which is a bug.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> hw/isa/piix4.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index 964e09cf7f..a9322851db 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -45,7 +45,7 @@ struct PIIX4State {
>     qemu_irq *isa;
>     qemu_irq i8259[ISA_NUM_IRQS];
>
> -    int pci_irq_levels[PIIX_NUM_PIRQS];
> +    int32_t pci_irq_levels[PIIX_NUM_PIRQS];

Do you really need 32 bits to store a value of 0 or 1? I saw piix3 has 
that too but do we need to do the same here? Could this be just an uint8_t 
array? That's still an overkill to store 4 bits of information but less so 
than with int32_t.

By the way the corresponding member in struct PIIXState in 
include/hw/southbridge/piix.h has a comment saying:

     /* This member isn't used. Just for save/load compatibility */
     int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];

and only seems to be filled in piix3_pre_save() but never used. So what's 
the point of this then? Maybe piix3 also uses a bitmap to store these 
levels instead? There's a uint64_t pic_levels member above the unused 
array but I haven't checked the implementation.

Regards,
BALATON Zoltan

>
>     RTCState rtc;
>     /* Reset Control Register */
> @@ -128,12 +128,14 @@ static int piix4_ide_post_load(void *opaque, int version_id)
>
> static const VMStateDescription vmstate_piix4 = {
>     .name = "PIIX4",
> -    .version_id = 3,
> +    .version_id = 4,
>     .minimum_version_id = 2,
>     .post_load = piix4_ide_post_load,
>     .fields = (VMStateField[]) {
>         VMSTATE_PCI_DEVICE(dev, PIIX4State),
>         VMSTATE_UINT8_V(rcr, PIIX4State, 3),
> +        VMSTATE_INT32_ARRAY_V(pci_irq_levels, PIIX4State,
> +                              PIIX_NUM_PIRQS, 4),
>         VMSTATE_END_OF_LIST()
>     }
> };
>
--3866299591-1176834320-1644673327=:48202--

