Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C8C1872F3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 20:03:11 +0100 (CET)
Received: from localhost ([::1]:47025 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDv14-0004fg-8G
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 15:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34429)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jDu6M-0000dO-HK
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:04:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1jDu6K-0000fb-Ai
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:04:34 -0400
Received: from 10.mo3.mail-out.ovh.net ([87.98.165.232]:50981)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1jDu6K-0000VH-4o
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:04:32 -0400
Received: from player798.ha.ovh.net (unknown [10.108.57.245])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id B203A246082
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 19:04:30 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 5CFDA10973D02;
 Mon, 16 Mar 2020 18:04:23 +0000 (UTC)
Date: Mon, 16 Mar 2020 19:04:20 +0100
From: Greg Kurz <groug@kaod.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 6/8] target/ppc: allow ppc_cpu_do_system_reset to
 take an alternate vector
Message-ID: <20200316190420.5e2f7f23@bahia.lan>
In-Reply-To: <20200316142613.121089-7-npiggin@gmail.com>
References: <20200316142613.121089-1-npiggin@gmail.com>
 <20200316142613.121089-7-npiggin@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13811977108233361859
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudeffedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.165.232
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Mar 2020 00:26:11 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> Provide for an alternate delivery location, -1 defaults to the
> architected address.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c           | 2 +-
>  target/ppc/cpu.h         | 2 +-
>  target/ppc/excp_helper.c | 5 ++++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 5f93c49706..25221d843c 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3400,7 +3400,7 @@ static void spapr_machine_finalizefn(Object *obj)
>  void spapr_do_system_reset_on_cpu(CPUState *cs, run_on_cpu_data arg)
>  {
>      cpu_synchronize_state(cs);
> -    ppc_cpu_do_system_reset(cs);
> +    ppc_cpu_do_system_reset(cs, -1);
>  }
>  
>  static void spapr_nmi(NMIState *n, int cpu_index, Error **errp)
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 3953680534..f8c7d6f19c 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1220,7 +1220,7 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>  int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>                                 int cpuid, void *opaque);
>  #ifndef CONFIG_USER_ONLY
> -void ppc_cpu_do_system_reset(CPUState *cs);
> +void ppc_cpu_do_system_reset(CPUState *cs, target_ulong vector);
>  void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector);
>  extern const VMStateDescription vmstate_ppc_cpu;
>  #endif
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7f2b5899d3..08bc885ca6 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -961,12 +961,15 @@ static void ppc_hw_interrupt(CPUPPCState *env)
>      }
>  }
>  
> -void ppc_cpu_do_system_reset(CPUState *cs)
> +void ppc_cpu_do_system_reset(CPUState *cs, target_ulong vector)
>  {
>      PowerPCCPU *cpu = POWERPC_CPU(cs);
>      CPUPPCState *env = &cpu->env;
>  
>      powerpc_excp(cpu, env->excp_model, POWERPC_EXCP_RESET);
> +    if (vector != -1) {
> +        env->nip = vector;
> +    }
>  }
>  
>  void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)


