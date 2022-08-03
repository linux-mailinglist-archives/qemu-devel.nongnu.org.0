Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7B758944A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 00:10:23 +0200 (CEST)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJMZJ-0006VI-Mp
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 18:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJMWz-0003eV-58; Wed, 03 Aug 2022 18:07:57 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:36683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJMWw-0006mX-8A; Wed, 03 Aug 2022 18:07:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5FADF746E06;
 Thu,  4 Aug 2022 00:07:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D12227461AE; Thu,  4 Aug 2022 00:07:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CF2E8745702;
 Thu,  4 Aug 2022 00:07:48 +0200 (CEST)
Date: Thu, 4 Aug 2022 00:07:48 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 02/20] ppc/ppc405: Introduce a PPC405 generic
 machine
In-Reply-To: <20220803132844.2370514-3-clg@kaod.org>
Message-ID: <d694b960-6db5-933-3d63-23ad6efc4856@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1057103935-1659564468=:13819"
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1057103935-1659564468=:13819
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Aug 2022, Cédric Le Goater wrote:
> We will use this machine as a base to define the ref405ep and possibly
> the PPC405 hotfoot board as found in the Linux kernel.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405_boards.c | 31 ++++++++++++++++++++++++++++---
> 1 file changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 1a4e7588c584..4c269b6526a5 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -50,6 +50,15 @@
>
> #define USE_FLASH_BIOS
>
> +struct Ppc405MachineState {
> +    /* Private */
> +    MachineState parent_obj;
> +    /* Public */
> +};
> +
> +#define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405MachineState, PPC405_MACHINE);
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
> +    mc->default_ram_size = 0x08000000;
> +    mc->default_ram_id = "ppc405.ram";

Is the default RAM size a property of specific boards or the PPC405? I 
think it could be different for different boards so don't see why it's 
moved to the generic machine but maybe it has something to do with how 
other parts of QEMU handles this or I'm not getting what the generic 
PPC405 machine is for.

Would it be clearer to just write 128 * MiB instead of a long hex number 
with extra zeros that's hard to read? It would be a good opportunity to 
change it here.

Regards,
BALATON Zoltan

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
--3866299591-1057103935-1659564468=:13819--

