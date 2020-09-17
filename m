Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B95726DDB8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 16:13:35 +0200 (CEST)
Received: from localhost ([::1]:58954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIufG-00083S-Dy
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 10:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIuQs-0006xW-0q; Thu, 17 Sep 2020 09:58:42 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:46986 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIuQp-0000HK-6Y; Thu, 17 Sep 2020 09:58:41 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7929D80EC5D4B68188B4;
 Thu, 17 Sep 2020 21:58:33 +0800 (CST)
Received: from [10.174.185.104] (10.174.185.104) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 21:58:23 +0800
Subject: Re: [RFC PATCH 06/12] hw/arm/virt-acpi-build: distinguish possible
 and present cpus
To: Andrew Jones <drjones@redhat.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-7-fangying1@huawei.com>
 <20200917082031.cmgwjk6s6mbechc6@kamzik.brq.redhat.com>
From: Ying Fang <fangying1@huawei.com>
Message-ID: <c961bf5c-0be7-7fc2-1506-b739d376a580@huawei.com>
Date: Thu, 17 Sep 2020 21:58:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200917082031.cmgwjk6s6mbechc6@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 09:27:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/17/2020 4:20 PM, Andrew Jones wrote:
> On Thu, Sep 17, 2020 at 11:20:27AM +0800, Ying Fang wrote:
>> When building ACPI tables regarding CPUs we should always build
>> them for the number of possible CPUs, not the number of present
>> CPUs. We then ensure only the present CPUs are enabled.
>>
>> Signed-off-by: Andrew Jones <drjones@redhat.com>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
>>   hw/arm/virt-acpi-build.c | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> I approached this in a different way in the refresh, so the this patch
> was dropped, but the refresh is completely untested, so something similar
> may still be necessary.

Nice work, I'll open it and take a look.
Thanks.
> 
> Thanks,
> drew
> 
> .
> 

