Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F9732812C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:45:25 +0100 (CET)
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjnY-0006Oi-0z
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lGjOm-0008Qi-6a
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:19:48 -0500
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:54298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lGjOg-00038k-WE
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:19:47 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.51])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 04210246284;
 Mon,  1 Mar 2021 15:19:40 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Mar 2021
 15:19:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006265dee22-a6d1-4672-932f-694aaba4aa6d,
 479CA1392526D135F52AAC0E93683906E8F354F3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 1 Mar 2021 15:19:38 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 5/5] spapr.c: send QAPI event when memory hotunplug fails
Message-ID: <20210301151938.0a1a3d8b@bahia.lan>
In-Reply-To: <20210226163301.419727-6-danielhb413@gmail.com>
References: <20210226163301.419727-1-danielhb413@gmail.com>
 <20210226163301.419727-6-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 1887ec98-c02a-499a-a1cd-60f4a8455f7a
X-Ovh-Tracer-Id: 17868875949534648800
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=46.105.37.156; envelope-from=groug@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Feb 2021 13:33:01 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Recent changes allowed the pSeries machine to rollback the hotunplug
> process for the DIMM when the guest kernel signals, via a
> reconfiguration of the DR connector, that it's not going to release the
> LMBs.
> 
> Let's also warn QAPI listerners about it. One place to do it would be
> right after the unplug state is cleaned up,
> spapr_clear_pending_dimm_unplug_state(). This would mean that the
> function is now doing more than cleaning up the pending dimm state
> though.
> 
> This patch does the following changes in spapr.c:
> 
> - send a QAPI event to inform that we experienced a failure in the
>   hotunplug of the DIMM;
> 
> - rename spapr_clear_pending_dimm_unplug_state() to
>   spapr_memory_unplug_rollback(). This is a better fit for what the
>   function is now doing, and it makes callers care more about what the
>   function goal is and less about spapr.c internals such as clearing
>   the pending dimm unplug state.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

LGTM

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c         | 13 +++++++++++--
>  hw/ppc/spapr_drc.c     |  5 ++---
>  include/hw/ppc/spapr.h |  3 +--
>  3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 6ef72ee7bd..cbe5cafb14 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -28,6 +28,7 @@
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-events-machine.h"
>  #include "qapi/visitor.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/hostmem.h"
> @@ -3575,14 +3576,14 @@ static SpaprDimmState *spapr_recover_pending_dimm_state(SpaprMachineState *ms,
>      return spapr_pending_dimm_unplugs_add(ms, avail_lmbs, dimm);
>  }
>  
> -void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
> -                                           DeviceState *dev)
> +void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev)
>  {
>      SpaprDimmState *ds;
>      PCDIMMDevice *dimm;
>      SpaprDrc *drc;
>      uint32_t nr_lmbs;
>      uint64_t size, addr_start, addr;
> +    g_autofree char *qapi_error = NULL;
>      int i;
>  
>      if (!dev) {
> @@ -3616,6 +3617,14 @@ void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
>          drc->unplug_requested = false;
>          addr += SPAPR_MEMORY_BLOCK_SIZE;
>      }
> +
> +    /*
> +     * Tell QAPI that something happened and the memory
> +     * hotunplug wasn't successful.
> +     */
> +    qapi_error = g_strdup_printf("Memory hotunplug failed for device %s",
> +                                 dev->id);
> +    qapi_event_send_mem_unplug_error(dev->id, qapi_error);
>  }
>  
>  /* Callback to be called during DRC release. */
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 8c4997d795..8faaf9f1dd 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -1232,12 +1232,11 @@ static void rtas_ibm_configure_connector(PowerPCCPU *cpu,
>  
>      /*
>       * This indicates that the kernel is reconfiguring a LMB due to
> -     * a failed hotunplug. Clear the pending unplug state for the whole
> -     * DIMM.
> +     * a failed hotunplug. Rollback the DIMM unplug process.
>       */
>      if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB &&
>          drc->unplug_requested) {
> -        spapr_clear_pending_dimm_unplug_state(spapr, drc->dev);
> +        spapr_memory_unplug_rollback(spapr, drc->dev);
>      }
>  
>      if (!drc->fdt) {
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index d6edeaaaff..47cebaf3ac 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -847,8 +847,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize);
>  int spapr_reallocate_hpt(SpaprMachineState *spapr, int shift, Error **errp);
>  void spapr_clear_pending_events(SpaprMachineState *spapr);
>  void spapr_clear_pending_hotplug_events(SpaprMachineState *spapr);
> -void spapr_clear_pending_dimm_unplug_state(SpaprMachineState *spapr,
> -                                           DeviceState *dev);
> +void spapr_memory_unplug_rollback(SpaprMachineState *spapr, DeviceState *dev);
>  int spapr_max_server_number(SpaprMachineState *spapr);
>  void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>                        uint64_t pte0, uint64_t pte1);


