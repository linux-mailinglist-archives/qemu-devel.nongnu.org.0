Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B25B41ADA7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:12:29 +0200 (CEST)
Received: from localhost ([::1]:38468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVB2C-0000YD-JY
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVAxS-0004HY-NJ; Tue, 28 Sep 2021 07:07:34 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVAxP-0007NH-1W; Tue, 28 Sep 2021 07:07:34 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HJcBQ194qzWVmc;
 Tue, 28 Sep 2021 19:06:06 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 19:07:24 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 19:07:23 +0800
Subject: Re: [PATCH v11 11/14] machine: Make smp_parse generic enough for all
 arches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-12-wangyanan55@huawei.com>
 <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com>
 <YVL1UuCQ6+KiPwfR@redhat.com>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <3ba8bc1a-a315-bf10-c920-1e5ad5c2cacd@huawei.com>
Date: Tue, 28 Sep 2021 19:07:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <YVL1UuCQ6+KiPwfR@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme714-chm.china.huawei.com (10.1.199.110) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.562,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/9/28 18:58, Daniel P. Berrangé wrote:
> On Tue, Sep 28, 2021 at 12:57:21PM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/28/21 05:57, Yanan Wang wrote:
>>> Currently the only difference between smp_parse and pc_smp_parse
>>> is the support of dies parameter and the related error reporting.
>>> With some arch compat variables like "bool dies_supported", we can
>>> make smp_parse generic enough for all arches and the PC specific
>>> one can be removed.
>>>
>>> Making smp_parse() generic enough can reduce code duplication and
>>> ease the code maintenance, and also allows extending the topology
>>> with more arch specific members (e.g., clusters) in the future.
>>>
>>> Suggested-by: Andrew Jones <drjones@redhat.com>
>>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> ---
>>>   hw/core/machine.c   | 91 +++++++++++++++++++++++++++++++++++----------
>>>   hw/i386/pc.c        | 84 +----------------------------------------
>>>   include/hw/boards.h |  9 +++++
>>>   3 files changed, 81 insertions(+), 103 deletions(-)
>>> +/*
>>> + * smp_parse - Generic function used to parse the given SMP configuration
>>> + *
>>> + * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
>>> + * automatically computed based on the provided ones.
>>> + *
>>> + * In the calculation of omitted sockets/cores/threads: we prefer sockets
>>> + * over cores over threads before 6.2, while preferring cores over sockets
>>> + * over threads since 6.2.
>>> + *
>>> + * In the calculation of cpus/maxcpus: When both maxcpus and cpus are omitted,
>>> + * maxcpus will be computed from the given parameters and cpus will be set
>>> + * equal to maxcpus. When only one of maxcpus and cpus is given then the
>>> + * omitted one will be set to its given counterpart's value. Both maxcpus and
>>> + * cpus may be specified, but maxcpus must be equal to or greater than cpus.
>>> + *
>>> + * For compatibility, apart from the parameters that will be computed, newly
>>> + * introduced topology members which are likely to be target specific should
>>> + * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
>>> + */
>>>   static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>> Can we have it return a boolean instead?
> That's unrelated to this change, so ought to be a separate commit if
> done.
>
I agree. I vaguely remember that there was a discussion about this before
with Paolo. But anyway, I think the suggested change can be in a separate
commit if necessary. :)

Thanks,
Yanan


