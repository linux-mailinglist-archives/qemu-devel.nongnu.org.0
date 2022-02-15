Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E0F4B7487
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:03:40 +0100 (CET)
Received: from localhost ([::1]:58382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK36x-0005yV-Fi
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:03:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nK2gj-0005qg-E5
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:36:33 -0500
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:54919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nK2gh-0006kG-4z
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:36:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E46B824634;
 Tue, 15 Feb 2022 18:36:28 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 19:36:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0045a4b1207-3104-42ff-ab89-bcf0788650dc,
 9E61FECBC99B7F84222AE0DB6991604CA8A139D0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e1817a2f-5520-3709-8cd8-a4e0ee41244c@kaod.org>
Date: Tue, 15 Feb 2022 19:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/9] ppc: allow the hdecr timer to be created/destroyed
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-4-npiggin@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220215031642.1691873-4-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aad35b89-ec15-4b76-8d88-37760580430c
X-Ovh-Tracer-Id: 17486351454401170400
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeggdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhgrrhhoshgrsheslhhinhhugidrihgsmhdrtghomh
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
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
> Machines which don't emulate the HDEC facility are able to use the
> timer for something else. Provide functions to start and stop the
> hdecr timer.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   hw/ppc/ppc.c         | 20 ++++++++++++++++++++
>   include/hw/ppc/ppc.h |  3 +++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index c6dfc5975f..4bfd413c7f 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -1083,6 +1083,26 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
>       return &cpu_ppc_set_tb_clk;
>   }
>   
> +void cpu_ppc_hdecr_init (CPUPPCState *env)

checkpatch will complain ^

> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +
> +    assert(env->tb_env->hdecr_timer == NULL);
> +
> +    env->tb_env->hdecr_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, &cpu_ppc_hdecr_cb,
> +                                                 cpu);
> +}
> +

I am not convinced. Can't we start and stop the hdecr on demand ?

Thanks,

C.

> +void cpu_ppc_hdecr_exit (CPUPPCState *env)
> +{
> +    PowerPCCPU *cpu = env_archcpu(env);
> +
> +    timer_free(env->tb_env->hdecr_timer);
> +    env->tb_env->hdecr_timer = NULL;
> +
> +    cpu_ppc_hdecr_lower(cpu);
> +}
> +
>   /*****************************************************************************/
>   /* PowerPC 40x timers */
>   
> diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
> index 93e614cffd..fcf9e495a0 100644
> --- a/include/hw/ppc/ppc.h
> +++ b/include/hw/ppc/ppc.h
> @@ -54,6 +54,9 @@ struct ppc_tb_t {
>   
>   uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_offset);
>   clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq);
> +void cpu_ppc_hdecr_init (CPUPPCState *env);
> +void cpu_ppc_hdecr_exit (CPUPPCState *env);
> +
>   /* Embedded PowerPC DCR management */
>   typedef uint32_t (*dcr_read_cb)(void *opaque, int dcrn);
>   typedef void (*dcr_write_cb)(void *opaque, int dcrn, uint32_t val);


