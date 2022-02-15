Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943214B7481
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:00:15 +0100 (CET)
Received: from localhost ([::1]:52726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK33e-0002SC-N2
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:00:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nK2fC-0004Hs-5l
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:34:58 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233]:56823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nK2fA-0006Lv-CU
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:34:57 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.206])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 96CC5242D2;
 Tue, 15 Feb 2022 18:34:53 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 19:34:53 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006aed817fe-76ae-42a9-bd2a-7a967a80b103,
 9E61FECBC99B7F84222AE0DB6991604CA8A139D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <72d35f00-269e-9397-c2d8-6c2f1f7ac3fb@kaod.org>
Date: Tue, 15 Feb 2022 19:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/9] spapr: prevent hdec timer being set up under virtual
 hypervisor
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-3-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220215031642.1691873-3-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c1bf943e-1305-49e7-8221-23cd75685ad6
X-Ovh-Tracer-Id: 17459611334094916576
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgrrhhoshgrsheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/22 04:16, Nicholas Piggin wrote:
> The spapr virtual hypervisor does not require the hdecr timer.
> Remove it.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/ppc/ppc.c            | 2 +-
>   hw/ppc/spapr_cpu_core.c | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index ba7fa0f3b5..c6dfc5975f 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -1072,7 +1072,7 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
>       }
>       /* Create new timer */
>       tb_env->decr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_decr_cb, cpu);
> -    if (env->has_hv_mode) {
> +    if (env->has_hv_mode && !cpu->vhyp) {
>           tb_env->hdecr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_hdecr_cb,
>                                                   cpu);
>       } else {
> diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
> index a781e97f8d..ed84713960 100644
> --- a/hw/ppc/spapr_cpu_core.c
> +++ b/hw/ppc/spapr_cpu_core.c
> @@ -261,12 +261,12 @@ static bool spapr_realize_vcpu(PowerPCCPU *cpu, SpaprMachineState *spapr,
>           return false;
>       }
>   
> -    /* Set time-base frequency to 512 MHz */
> -    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
> -
>       cpu_ppc_set_vhyp(cpu, PPC_VIRTUAL_HYPERVISOR(spapr));
>       kvmppc_set_papr(cpu);
>   
> +    /* Set time-base frequency to 512 MHz. vhyp must be set first. */
> +    cpu_ppc_tb_init(env, SPAPR_TIMEBASE_FREQ);
> +
>       if (spapr_irq_cpu_intc_create(spapr, cpu, errp) < 0) {
>           qdev_unrealize(DEVICE(cpu));
>           return false;


