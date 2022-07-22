Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A536057EA31
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jul 2022 01:12:53 +0200 (CEST)
Received: from localhost ([::1]:44824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oF1pE-0006Ab-S7
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 19:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oF1nz-0004ff-F2; Fri, 22 Jul 2022 19:11:35 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:57741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oF1nx-0004wN-TV; Fri, 22 Jul 2022 19:11:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7B53974637E;
 Sat, 23 Jul 2022 01:11:31 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 47E7574633F; Sat, 23 Jul 2022 01:11:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4602E745702;
 Sat, 23 Jul 2022 01:11:31 +0200 (CEST)
Date: Sat, 23 Jul 2022 01:11:31 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org
Subject: Re: [PATCH for-7.2 02/10] hw/ppc/pegasos2.c: set machine->fdt in
 machine_reset()
In-Reply-To: <20220722200007.1602174-3-danielhb413@gmail.com>
Message-ID: <55e98dea-d9f5-c2d4-e9e6-d01ed140b1ce@eik.bme.hu>
References: <20220722200007.1602174-1-danielhb413@gmail.com>
 <20220722200007.1602174-3-danielhb413@gmail.com>
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

On Fri, 22 Jul 2022, Daniel Henrique Barboza wrote:
> We'll introduce HMP commands that requires machine->fdt to be set
> properly.
>
> Cc: BALATON Zoltan <balaton@eik.bme.hu>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
> hw/ppc/pegasos2.c | 3 +++
> 1 file changed, 3 insertions(+)
>
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 61f4263953..9827c3b4c2 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -329,6 +329,9 @@ static void pegasos2_machine_reset(MachineState *machine)
>     g_free(pm->fdt_blob);
>     pm->fdt_blob = fdt;
>
> +    /* Set common MachineState->fdt */
> +    machine->fdt = fdt;
> +

Again, comment just states what the next line does but does not explain 
why. Either add a comment that explains why it's set or drop the trivial 
comment. Otherwise,

Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

>     vof_build_dt(fdt, pm->vof);
>     vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
>     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
>

