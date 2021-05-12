Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0600637B3A6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 03:45:42 +0200 (CEST)
Received: from localhost ([::1]:51964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgdwS-00008n-IQ
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 21:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lgdvJ-0007gy-GS; Tue, 11 May 2021 21:44:29 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lgdvF-0007FB-9g; Tue, 11 May 2021 21:44:29 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfyF66mxRz1BHvl;
 Wed, 12 May 2021 09:41:30 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 12 May 2021 09:44:03 +0800
Subject: Re: GICv3 for MTTCG
To: Andrey Shinkevich <andrey.shinkevich@huawei.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
References: <1f157423cc544731beb743287a4be5cb@huawei.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <4aa792d6-96d5-45db-39eb-08885323a80e@huawei.com>
Date: Wed, 12 May 2021 09:44:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1f157423cc544731beb743287a4be5cb@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yuzenghui@huawei.com;
 helo=szxga04-in.huawei.com
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "drjones@redhat.com" <drjones@redhat.com>, shashi.mallela@linaro.org,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "Chengen \(William,
 FixNet\)" <chengen@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[+Shashi]

On 2021/5/12 1:51, Andrey Shinkevich wrote:
> Dear colleagues,
> 
> I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 host.
> The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:
> 
> include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8
> 
> The version 3 of the Generic Interrupt Controller (GICv3) is not
> supported in QEMU for some reason unknown to me. It would allow to
> increase the limit of CPUs and accelerate the MTTCG performance on a
> multiple core hypervisor.
> I have got an idea to implement the Interrupt Translation Service (ITS)
> for using by MTTCG for ARM architecture.
> 
> Do you find that idea useful and feasible?
> If yes, how much time do you estimate for such a project to complete by
> one developer?
> If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?

Are you looking for something like that [*]? I think it has been on the
list for a while.

[*] https://lists.gnu.org/archive/html/qemu-arm/2021-04/msg00944.html


Zenghui

