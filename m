Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84A78C59
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 15:11:06 +0200 (CEST)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs5Qf-0002Iu-9I
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 09:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40407)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hs5Pf-0000ys-9e
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:10:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hs5Pe-00018L-69
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:10:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44284)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hs5Pe-00017J-14
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 09:10:02 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A96662C7EE;
 Mon, 29 Jul 2019 13:10:00 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11FA660C44;
 Mon, 29 Jul 2019 13:09:58 +0000 (UTC)
Date: Mon, 29 Jul 2019 15:09:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Message-ID: <20190729150957.157a7c03@redhat.com>
In-Reply-To: <20190729063127.2801-3-tao3.xu@intel.com>
References: <20190729063127.2801-1-tao3.xu@intel.com>
 <20190729063127.2801-3-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 29 Jul 2019 13:10:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v8 02/11] numa: move numa global variable
 nb_numa_nodes into MachineState
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
Cc: ehabkost@redhat.com, jingqi.liu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com, dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Jul 2019 14:31:18 +0800
Tao Xu <tao3.xu@intel.com> wrote:

> Add struct NumaState in MachineState and move existing numa global
> nb_numa_nodes(renamed as "num_nodes") into NumaState. And add variable
> numa_support into MachineClass to decide which submachines support NUMA.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> ---
> 
> Changes in v8:
>     - Add check if numa->numa_state is NULL in pxb_dev_realize_common
>     - Use nb_nodes in spapr_populate_memory() (Igor)
> ---
[...]
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 821f0d4a49..1c7c12c415 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -331,7 +331,7 @@ static int spapr_fixup_cpu_dt(void *fdt, SpaprMachineState *spapr)
>              return ret;
>          }
>  
> -        if (nb_numa_nodes > 1) {
> +        if (ms->numa_state->num_nodes > 1) {
>              ret = spapr_fixup_cpu_numa_dt(fdt, offset, cpu);
>              if (ret < 0) {
>                  return ret;
> @@ -351,9 +351,9 @@ static int spapr_fixup_cpu_dt(void *fdt, SpaprMachineState *spapr)
>  
>  static hwaddr spapr_node0_size(MachineState *machine)
>  {
> -    if (nb_numa_nodes) {
> +    if (machine->numa_state->num_nodes) {
>          int i;
> -        for (i = 0; i < nb_numa_nodes; ++i) {
> +        for (i = 0; i < machine->numa_state->num_nodes; ++i) {
>              if (numa_info[i].node_mem) {
>                  return MIN(pow2floor(numa_info[i].node_mem),
>                             machine->ram_size);
> @@ -398,13 +398,14 @@ static int spapr_populate_memory(SpaprMachineState *spapr, void *fdt)
>  {
>      MachineState *machine = MACHINE(spapr);
>      hwaddr mem_start, node_size;
> -    int i, nb_nodes = nb_numa_nodes;
> +    int i, nb_nodes = machine->numa_state->num_nodes;
>      NodeInfo *nodes = numa_info;
>      NodeInfo ramnode;
>  
>      /* No NUMA nodes, assume there is just one node with whole RAM */
> -    if (!nb_numa_nodes) {
> +    if (!nb_nodes) {
>          nb_nodes = 1;
> +        machine->numa_state->num_nodes = nb_nodes;
You've not addressed a v7 comment
On Tue, 23 Jul 2019 16:56:41 +0200
Igor Mammedov <imammedo@redhat.com> wrote:

> I don't like user fixing up generic machine data that came from CLI
> (or luck of such)
[...]
> I'd keep fixup local (i.e. using nb_nodes)

i.e. do not modify machine->numa_state->num_nodes and just use value local
like current code does.

>          ramnode.node_mem = machine->ram_size;
>          nodes = &ramnode;
>      }
[...]

