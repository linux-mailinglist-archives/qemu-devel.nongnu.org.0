Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38905AC199
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 00:27:25 +0200 (CEST)
Received: from localhost ([::1]:55820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUbbo-0003j5-KA
	for lists+qemu-devel@lfdr.de; Sat, 03 Sep 2022 18:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oUbas-0002Et-8G; Sat, 03 Sep 2022 18:26:26 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:43161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oUbaq-0002Sp-22; Sat, 03 Sep 2022 18:26:25 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 185DB746324;
 Sun,  4 Sep 2022 00:26:16 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D70087461AE; Sun,  4 Sep 2022 00:26:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D4E85745702;
 Sun,  4 Sep 2022 00:26:15 +0200 (CEST)
Date: Sun, 4 Sep 2022 00:26:15 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, 
 david@gibson.dropbear.id.au, alistair.francis@wdc.com
Subject: Re: [PATCH v5 06/14] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
In-Reply-To: <20220903193420.115986-7-danielhb413@gmail.com>
Message-ID: <d1dfdbf-7797-e2a-ead1-ef874046379@eik.bme.hu>
References: <20220903193420.115986-1-danielhb413@gmail.com>
 <20220903193420.115986-7-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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

On Sat, 3 Sep 2022, Daniel Henrique Barboza wrote:
> This will enable support for 'dumpdtb' QMP/HMP command for the sam460ex
> machine.
>
> Cc: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> hw/ppc/sam460ex.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 850bb3b817..fa6f125fda 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -137,6 +137,7 @@ static int sam460ex_load_device_tree(hwaddr addr,
>                                      hwaddr initrd_size,
>                                      const char *kernel_cmdline)
> {
> +    MachineState *machine = MACHINE(qdev_get_machine());

Sorry for not noticing this earlier but this is ugly, I think you could 
just change the prototype of this function to take MachineState *machine 
instead of the ramsize and kernel_cmdline params which then can also be 
get from machine so they are not needed as separate params any more.

>     uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
>     char *filename;
>     int fdt_size;
> @@ -208,7 +209,9 @@ static int sam460ex_load_device_tree(hwaddr addr,
>                               EBC_FREQ);
>
>     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
> -    g_free(fdt);
> +
> +    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */

You've changed this and a few other places to the short comment but left 
the long version in pegasos2 and other machines. Could you change all of 
them to make it more consistent and less lines altogether?

Regards,
BALATON Zoltan

> +    machine->fdt = fdt;
>
>     return fdt_size;
> }
>

