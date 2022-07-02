Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F445563ECF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:24:10 +0200 (CEST)
Received: from localhost ([::1]:47510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7WY5-0008DK-5k
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WWL-0006mG-Pn
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:22:23 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:43231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WWJ-0004Tj-2O
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:22:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2B7DF11391A68;
 Sat,  2 Jul 2022 08:22:17 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 2 Jul 2022
 08:22:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0033f6b122a-55ea-46d8-b1bc-8119d6e60193,
 FB2626423410402F5F47B43F186DFD06AD25B17E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <dfcb44ec-c76c-603b-3663-50e75069d31d@kaod.org>
Date: Sat, 2 Jul 2022 08:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 5/9] target/ppc: use Error pointer in
 kvmppc_get_clockfreq()
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>
References: <20220630194249.886747-1-danielhb413@gmail.com>
 <20220630194249.886747-6-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220630194249.886747-6-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: df17a484-4ddd-47d6-9cbd-6a00619d6cc5
X-Ovh-Tracer-Id: 16436168315737705437
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdhpphgtsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/30/22 21:42, Daniel Henrique Barboza wrote:
> Callers will then be able to handle any errors that might happen when
> reading the clock frequency.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>   hw/ppc/e500.c          | 2 +-
>   hw/ppc/ppc440_bamboo.c | 2 +-
>   hw/ppc/sam460ex.c      | 2 +-
>   hw/ppc/spapr.c         | 2 +-
>   target/ppc/kvm.c       | 4 ++--
>   target/ppc/kvm_ppc.h   | 2 +-
>   6 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 7f7f5b3452..4b4e99ef3c 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -405,7 +405,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
>   
>       if (kvm_enabled()) {
>           /* Read out host's frequencies */
> -        clock_freq = kvmppc_get_clockfreq();
> +        clock_freq = kvmppc_get_clockfreq(NULL);

Can't we use error_fatal instead of NULL ?

Thanks,

C.
>           tb_freq = kvmppc_get_tbfreq();
>   
>           /* indicate KVM hypercall interface */
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index d5973f2484..d23f881d9d 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -107,7 +107,7 @@ static int bamboo_load_device_tree(hwaddr addr,
>        * the correct frequencies. */
>       if (kvm_enabled()) {
>           tb_freq = kvmppc_get_tbfreq();
> -        clock_freq = kvmppc_get_clockfreq();
> +        clock_freq = kvmppc_get_clockfreq(NULL);
>       }
>   
>       qemu_fdt_setprop_cell(fdt, "/cpus/cpu@0", "clock-frequency",
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 2f24598f55..4d25cb2c2e 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -179,7 +179,7 @@ static int sam460ex_load_device_tree(hwaddr addr,
>        * the correct frequencies. */
>       if (kvm_enabled()) {
>           tb_freq = kvmppc_get_tbfreq();
> -        clock_freq = kvmppc_get_clockfreq();
> +        clock_freq = kvmppc_get_clockfreq(NULL);
>       }
>   
>       qemu_fdt_setprop_cell(fdt, "/cpus/cpu@0", "clock-frequency",
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index fd4942e881..f66e3cbe38 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -654,7 +654,7 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
>                          0xffffffff, 0xffffffff};
>       uint32_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq()
>           : SPAPR_TIMEBASE_FREQ;
> -    uint32_t cpufreq = kvm_enabled() ? kvmppc_get_clockfreq() : 1000000000;
> +    uint32_t cpufreq = kvm_enabled() ? kvmppc_get_clockfreq(NULL) : 1000000000;
>       uint32_t page_sizes_prop[64];
>       size_t page_sizes_prop_size;
>       unsigned int smp_threads = ms->smp.threads;
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index c218380eb7..2accd1f946 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -1945,9 +1945,9 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
>       return kvmppc_read_int_dt(tmp, errp);
>   }
>   
> -uint64_t kvmppc_get_clockfreq(void)
> +uint64_t kvmppc_get_clockfreq(Error **errp)
>   {
> -    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
> +    return kvmppc_read_int_cpu_dt("clock-frequency", errp);
>   }
>   
>   static int kvmppc_get_dec_bits(void)
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index ee9325bf9a..b05aedb9f8 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -14,7 +14,7 @@
>   #ifdef CONFIG_KVM
>   
>   uint32_t kvmppc_get_tbfreq(void);
> -uint64_t kvmppc_get_clockfreq(void);
> +uint64_t kvmppc_get_clockfreq(Error **errp);
>   bool kvmppc_get_host_model(char **buf);
>   bool kvmppc_get_host_serial(char **buf);
>   int kvmppc_get_hasidle(CPUPPCState *env);


