Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B7758C86B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:36:27 +0200 (CEST)
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1ze-0000UX-6U
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL1mm-00047K-9d; Mon, 08 Aug 2022 08:23:08 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:13738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL1mk-0004N4-Gy; Mon, 08 Aug 2022 08:23:08 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 58D09747871;
 Mon,  8 Aug 2022 14:23:04 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 203157475F9; Mon,  8 Aug 2022 14:23:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1E8B0746FDE;
 Mon,  8 Aug 2022 14:23:04 +0200 (CEST)
Date: Mon, 8 Aug 2022 14:23:04 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 02/22] ppc/ppc405: Introduce a PPC405 generic
 machine
In-Reply-To: <20220808102734.133084-3-clg@kaod.org>
Message-ID: <8e36b76d-2f48-3c45-bd26-d1c9fb303ba9@eik.bme.hu>
References: <20220808102734.133084-1-clg@kaod.org>
 <20220808102734.133084-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1613236159-1659961384=:47322"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1613236159-1659961384=:47322
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 8 Aug 2022, Cédric Le Goater wrote:
> We will use this machine as a base to define the ref405ep and possibly
> the PPC405 hotfoot board as found in the Linux kernel.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/ppc405_boards.c | 31 ++++++++++++++++++++++++++++---
> 1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 1a4e7588c584..96700be74d08 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -50,6 +50,15 @@
>
> #define USE_FLASH_BIOS
>
> +#define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405MachineState, PPC405_MACHINE);
> +
> +struct Ppc405MachineState {
> +    /* Private */
> +    MachineState parent_obj;
> +    /* Public */
> +};
> +
> /*****************************************************************************/
> /* PPC405EP reference board (IBM) */
> /* Standalone board with:
> @@ -332,18 +341,34 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
>
>     mc->desc = "ref405ep";
>     mc->init = ref405ep_init;
> -    mc->default_ram_size = 0x08000000;
> -    mc->default_ram_id = "ef405ep.ram";
> }
>
> static const TypeInfo ref405ep_type = {
>     .name = MACHINE_TYPE_NAME("ref405ep"),
> -    .parent = TYPE_MACHINE,
> +    .parent = TYPE_PPC405_MACHINE,
>     .class_init = ref405ep_class_init,
> };
>
> +static void ppc405_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = "PPC405 generic machine";
> +    mc->default_ram_size = 128 * MiB;
> +    mc->default_ram_id = "ppc405.ram";
> +}
> +
> +static const TypeInfo ppc405_machine_type = {
> +    .name = TYPE_PPC405_MACHINE,
> +    .parent = TYPE_MACHINE,
> +    .instance_size = sizeof(Ppc405MachineState),
> +    .class_init = ppc405_machine_class_init,
> +    .abstract = true,
> +};
> +
> static void ppc405_machine_init(void)
> {
> +    type_register_static(&ppc405_machine_type);
>     type_register_static(&ref405ep_type);
> }
>
>
--3866299591-1613236159-1659961384=:47322--

