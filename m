Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3A34FC12
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:02:52 +0200 (CEST)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRWkV-0007Or-A2
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lRWhx-0006O7-S4; Wed, 31 Mar 2021 05:00:13 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lRWhu-00040h-A0; Wed, 31 Mar 2021 05:00:13 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9Kvx2qMjzyNL0;
 Wed, 31 Mar 2021 16:57:49 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 16:59:44 +0800
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20210311165947.27470-1-peter.maydell@linaro.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <431943c3-a603-7426-273f-b5a00f10ce41@huawei.com>
Date: Wed, 31 Mar 2021 16:59:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20210311165947.27470-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yuzenghui@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Leif Lindholm <leif@nuviainc.com>,
 kvmarm@lists.cs.columbia.edu, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[+kvmarm, Marc]

On 2021/3/12 0:59, Peter Maydell wrote:
> Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
> means that we don't provide the 6 counters that are required by the
> Arm BSA (Base System Architecture) specification if the CPU supports
> the Virtualization extensions.
> 
> Instead of having a single PMCR_NUM_COUNTERS, make each CPU type
> specify the PMCR reset value (obtained from the appropriate TRM), and
> use the 'N' field of that value to define the number of counters
> provided.
> 
> This means that we now supply 6 counters for Cortex-A53, A57, A72,
> A15 and A9 as well as '-cpu max'; Cortex-A7 and A8 stay at 4; and
> Cortex-R5 goes down to 3.
> 
> Note that because we now use the PMCR reset value of the specific
> implementation, we no longer set the LC bit out of reset.  This has
> an UNKNOWN value out of reset for all cores with any AArch32 support,
> so guest software should be setting it anyway if it wants it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is pretty much untested (I just checked Linux still boots;
> haven't tried it with KVM either). It's an alternative to
> just bumping PMCR_NUM_COUNTERS to 6.

So I've tested it with kvm and I get the following error before
VM startup:

   "qemu-system-aarch64: Failed to retrieve host CPU features"

> ---
>   target/arm/cpu.h     |  1 +
>   target/arm/cpu64.c   |  3 +++
>   target/arm/cpu_tcg.c |  5 +++++
>   target/arm/helper.c  | 29 +++++++++++++++++------------
>   target/arm/kvm64.c   |  2 ++
>   5 files changed, 28 insertions(+), 12 deletions(-)

[...]

> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index dff85f6db94..581335e49d3 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -566,6 +566,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>                                 ARM64_SYS_REG(3, 0, 0, 7, 1));
>           err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
>                                 ARM64_SYS_REG(3, 0, 0, 7, 2));
> +        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
> +                              ARM64_SYS_REG(3, 3, 9, 12, 0));

Looks like we tried to access PMCR_EL0 *before* telling kvm that
KVM_ARM_VCPU_PMU_V3 feature should be supported, which is now
refused by kvm [*].

[*] https://git.kernel.org/torvalds/c/11663111cd49

