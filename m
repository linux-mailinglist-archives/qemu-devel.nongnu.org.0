Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37DF5B276B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 22:06:54 +0200 (CEST)
Received: from localhost ([::1]:37212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNnZ-0005wq-HE
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 16:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oWNfk-0006eK-3E; Thu, 08 Sep 2022 15:58:48 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:55548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oWNfi-0001KS-EY; Thu, 08 Sep 2022 15:58:47 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 50EAF74633F;
 Thu,  8 Sep 2022 21:58:43 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1EEE374632C; Thu,  8 Sep 2022 21:58:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 1DCB674633E;
 Thu,  8 Sep 2022 21:58:43 +0200 (CEST)
Date: Thu, 8 Sep 2022 21:58:43 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org
Subject: Re: [PATCH v7 08/14] hw/ppc: set machine->fdt in
 pegasos2_machine_reset()
In-Reply-To: <20220908194040.518400-9-danielhb413@gmail.com>
Message-ID: <52281b60-27f-1eee-115-b4f8d2693d5d@eik.bme.hu>
References: <20220908194040.518400-1-danielhb413@gmail.com>
 <20220908194040.518400-9-danielhb413@gmail.com>
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

On Thu, 8 Sep 2022, Daniel Henrique Barboza wrote:
> We'll introduce a QMP/HMP command that requires machine->fdt to be set
> properly.
>
> Cc: BALATON Zoltan <balaton@eik.bme.hu>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/pegasos2.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 61f4263953..ecf682b148 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -331,6 +331,10 @@ static void pegasos2_machine_reset(MachineState *machine)
>
>     vof_build_dt(fdt, pm->vof);
>     vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
> +
> +    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
> +    machine->fdt = fdt;
> +
>     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
> }
>
>

