Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA14550440
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:42:52 +0200 (CEST)
Received: from localhost ([::1]:53888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2Wqp-0006me-Am
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2Wk6-00037e-Bw
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 07:35:54 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:54417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2Wk1-0008Cv-8M
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 07:35:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.201])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 7946021412;
 Sat, 18 Jun 2022 11:35:44 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 18 Jun
 2022 13:35:43 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S003550a8f61-d308-478c-bd74-3f3380b5f2a7,
 BAF84DB0DB05FDEF1A4BB1A6E7E7D3617E6C7C11) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c84bcd17-87d4-053c-5c7b-72e2e420288e@kaod.org>
Date: Sat, 18 Jun 2022 13:35:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] target/ppc: cpu_init: Clean up stop state on cpu reset
Content-Language: en-US
To: Frederic Barrat <fbarrat@linux.ibm.com>, <danielhb413@gmail.com>,
 <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220617095222.612212-1-fbarrat@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220617095222.612212-1-fbarrat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 20029be6-9993-4e01-928d-0448fb13bc9c
X-Ovh-Tracer-Id: 13299129700548905952
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvjedggeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/17/22 11:52, Frederic Barrat wrote:
> The 'resume_as_sreset' attribute of a cpu is set when a thread is
> entering a stop state on ppc books. It causes the thread to be
> re-routed to vector 0x100 when woken up by an exception. So it must be
> cleared on reset or a thread might be re-routed unexpectedly after a
> reset, when it was not in a stop state and/or when the appropriate
> exception handler isn't set up yet.
> 
> Using skiboot, it can be tested by resetting the system when it is
> quiet and most threads are idle and in stop state.
> 
> After the reset occurs, skiboot elects a primary thread and all the
> others wait in secondary_wait. The primary thread does all the system
> initialization from main_cpu_entry() and at some point, the
> decrementer interrupt starts ticking. The exception vector for the
> decrementer interrupt is in place, so that shouldn't be a
> problem. However, if that primary thread was in stop state prior to
> the reset, and because the resume_as_sreset parameters is still set,
> it is re-routed to exception vector 0x100. Which, at that time, is
> still defined as the entry point for BML. So that primary thread
> restarts as new and ends up being treated like any other secondary
> thread. All threads are now waiting in secondary_wait.
> 
> It results in a full system hang with no message on the console, as
> the uart hasn't been init'ed yet. It's actually not obvious to realise
> what's happening if not tracing reset (-d cpu_reset). The fix is
> simply to clear the 'resume_as_sreset' attribute on reset.
> 
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
> Changelog:
> v2: rework commit message


Nice ! This has been a long standing bug. I chased it for weeks.
I was reproducing with intensive I/Os, doing an scp on an emulated
PowerNV machine. It hung after a while (unless using powersave=off)

Now, with this patch, a QEMU PowerNV POWER9 machine (SMP) running a
Linux 5.18 sustains the load :

   $ scp ./ubuntu-22.04-ppc64le.qcow2 root@vm103:/dev/null
   root@vm103's password:
   ubuntu-22.04-ppc64le.qcow2                    100% 8581MB   5.8MB/s   24:39

Quite a few interrupts :

   # grep PNV-PCI-MSI  /proc/interrupts
    51:          9          0  PNV-PCI-MSI 403177472 Edge      nvme0q0
    52:          2          0  PNV-PCI-MSI 403177473 Edge      nvme0q1
    53:          0          0  PNV-PCI-MSI 403177474 Edge      nvme0q2
    54:    3427556          0  PNV-PCI-MSI 135315456 Edge      eth0-rx-0
    55:          0    4261742  PNV-PCI-MSI 135315457 Edge      eth0-tx-0
    56:          1          0  PNV-PCI-MSI 135315458 Edge      eth0
    57:          0         71  PNV-PCI-MSI 135299072 Edge      xhci_hcd
    58:          0          0  PNV-PCI-MSI 135299073 Edge      xhci_hcd
    59:          0          0  PNV-PCI-MSI 135299074 Edge      xhci_hcd


It would be nice to explain what you did to corner the issue. It would
help other people chasing similar bugs in QEMU or in the kernel.

Thanks,

C.





> 
> 
>   target/ppc/cpu_init.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 0f891afa04..c16cb8dbe7 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -7186,6 +7186,9 @@ static void ppc_cpu_reset(DeviceState *dev)
>           }
>           pmu_update_summaries(env);
>       }
> +
> +    /* clean any pending stop state */
> +    env->resume_as_sreset = 0;
>   #endif
>       hreg_compute_hflags(env);
>       env->reserve_addr = (target_ulong)-1ULL;


