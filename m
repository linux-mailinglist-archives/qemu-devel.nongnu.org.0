Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23EC5BCF05
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 16:37:07 +0200 (CEST)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaHtS-0008Tv-Jt
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 10:37:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oaHop-0003p2-5D; Mon, 19 Sep 2022 10:32:24 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1oaHoj-0002Te-EH; Mon, 19 Sep 2022 10:32:17 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MWRpq386lzlW1m;
 Mon, 19 Sep 2022 22:27:47 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 22:31:51 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 19 Sep 2022 22:31:50 +0800
Subject: Re: [kvm-unit-tests PATCH v4 10/12] arm: pmu: test 32-bit <-> 64-bit
 transitions
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <maz@kernel.org>,
 <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <andrew.murray@arm.com>,
 <andre.przywara@arm.com>
References: <20200403071326.29932-1-eric.auger@redhat.com>
 <20200403071326.29932-11-eric.auger@redhat.com>
Message-ID: <cead0930-958d-222d-d5c0-6dfe6f88f52f@huawei.com>
Date: Mon, 19 Sep 2022 22:31:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200403071326.29932-11-eric.auger@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yuzenghui@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.952,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-devel@nongnu.org>

Hi Eric,

On 2020/4/3 15:13, Eric Auger wrote:

> +static void test_chain_promotion(void)
> +{

[...]

> +	/* start as MEM_ACCESS/CPU_CYCLES and move to CHAIN/MEM_ACCESS */
> +	pmu_reset();
> +	write_regn_el0(pmevtyper, 0, MEM_ACCESS | PMEVTYPER_EXCLUDE_EL0);
> +	write_regn_el0(pmevtyper, 1, CPU_CYCLES | PMEVTYPER_EXCLUDE_EL0);
> +	write_sysreg_s(0x3, PMCNTENSET_EL0);
> +	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW2);
> +	isb();
> +
> +	mem_access_loop(addr, 20, pmu.pmcr_ro | PMU_PMCR_E);
> +	report_info("MEM_ACCESS counter #0 has value 0x%lx",
> +		    read_regn_el0(pmevcntr, 0));
> +
> +	/* 0 becomes CHAINED */

"1 becomes CHAINED"?

> +	write_sysreg_s(0x0, PMCNTENSET_EL0);

Writing 0 into PMCNTENSET_EL0 actually has no effect on the counter
status. What purpose does this serve?

> +	write_regn_el0(pmevtyper, 1, CHAIN | PMEVTYPER_EXCLUDE_EL0);
> +	write_sysreg_s(0x3, PMCNTENSET_EL0);
> +	write_regn_el0(pmevcntr, 1, 0x0);
> +
> +	mem_access_loop(addr, 20, pmu.pmcr_ro | PMU_PMCR_E);
> +	report_info("MEM_ACCESS counter #0 has value 0x%lx",
> +		    read_regn_el0(pmevcntr, 0));
> +
> +	report((read_regn_el0(pmevcntr, 1) == 1) && !read_sysreg(pmovsclr_el0),
> +		"32b->64b: CHAIN counter incremented and no overflow");
> +
> +	report_info("CHAIN counter #1 = 0x%lx, overflow=0x%lx",
> +		read_regn_el0(pmevcntr, 1), read_sysreg(pmovsclr_el0));
> +
> +	/* start as CHAIN/MEM_ACCESS and move to MEM_ACCESS/CPU_CYCLES */
> +	pmu_reset();
> +	write_regn_el0(pmevtyper, 0, MEM_ACCESS | PMEVTYPER_EXCLUDE_EL0);
> +	write_regn_el0(pmevtyper, 1, CHAIN | PMEVTYPER_EXCLUDE_EL0);
> +	write_regn_el0(pmevcntr, 0, PRE_OVERFLOW2);
> +	write_sysreg_s(0x3, PMCNTENSET_EL0);
> +
> +	mem_access_loop(addr, 20, pmu.pmcr_ro | PMU_PMCR_E);
> +	report_info("counter #0=0x%lx, counter #1=0x%lx",
> +			read_regn_el0(pmevcntr, 0), read_regn_el0(pmevcntr, 1));
> +
> +	write_sysreg_s(0x0, PMCNTENSET_EL0);

Ditto

> +	write_regn_el0(pmevtyper, 1, CPU_CYCLES | PMEVTYPER_EXCLUDE_EL0);
> +	write_sysreg_s(0x3, PMCNTENSET_EL0);
> +
> +	mem_access_loop(addr, 20, pmu.pmcr_ro | PMU_PMCR_E);
> +	report(read_sysreg(pmovsclr_el0) == 1,
> +		"overflow is expected on counter 0");
> +	report_info("counter #0=0x%lx, counter #1=0x%lx overflow=0x%lx",
> +			read_regn_el0(pmevcntr, 0), read_regn_el0(pmevcntr, 1),
> +			read_sysreg(pmovsclr_el0));
> +}
> +
>  #endif
>  
>  /*

Zenghui

