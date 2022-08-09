Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F1E58DE53
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 20:13:51 +0200 (CEST)
Received: from localhost ([::1]:46352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLTjj-0002LV-1Q
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 14:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLTRw-0007C3-MG; Tue, 09 Aug 2022 13:55:28 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:15722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oLTRu-0001eD-EI; Tue, 09 Aug 2022 13:55:28 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DC5D5747F1D;
 Tue,  9 Aug 2022 19:55:24 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A80FD7461AE; Tue,  9 Aug 2022 19:55:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A6844745702;
 Tue,  9 Aug 2022 19:55:24 +0200 (CEST)
Date: Tue, 9 Aug 2022 19:55:24 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 24/24] ppc/ppc405: Add check on minimum RAM size
In-Reply-To: <20220809153904.485018-25-clg@kaod.org>
Message-ID: <4118a946-7754-98c2-2475-68546ab773ad@eik.bme.hu>
References: <20220809153904.485018-1-clg@kaod.org>
 <20220809153904.485018-25-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1550421559-1660067724=:57026"
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

--3866299591-1550421559-1660067724=:57026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 9 Aug 2022, Cédric Le Goater wrote:
> The check on invalid RAM size is now performed in the SDRAM controller
> but not all values will boot a machine. A minimum of 2*16 is required.

2*16 or 16 MiB? The code has the latter which does not match commit 
message.

Regards,
BALATON Zoltan

>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc405_boards.c | 7 ++-----
> 1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 4ff6715f3533..9a3fec38cce1 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -251,14 +251,11 @@ static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
> static void ppc405_init(MachineState *machine)
> {
>     Ppc405MachineState *ppc405 = PPC405_MACHINE(machine);
> -    MachineClass *mc = MACHINE_GET_CLASS(machine);
>     const char *kernel_filename = machine->kernel_filename;
>     MemoryRegion *sysmem = get_system_memory();
>
> -    if (machine->ram_size != mc->default_ram_size) {
> -        char *sz = size_to_str(mc->default_ram_size);
> -        error_report("Invalid RAM size, should be %s", sz);
> -        g_free(sz);
> +    if (machine->ram_size < 16 * MiB) {
> +        error_report("Not enough RAM !");
>         exit(EXIT_FAILURE);
>     }
>
>
--3866299591-1550421559-1660067724=:57026--

