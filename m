Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D2B617C64
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 13:19:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqZBb-0002yX-9H; Thu, 03 Nov 2022 08:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1oqZB9-0002wv-1K
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:18:44 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1oqZB3-0004wI-JE
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 08:18:38 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N32pD2BjRzHvV1;
 Thu,  3 Nov 2022 20:17:56 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 20:18:15 +0800
CC: <yangyicong@hisilicon.com>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <ani@anisinha.ca>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <f4bug@amsat.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <prime.zeng@huawei.com>, <hesham.almatary@huawei.com>, 
 <ionela.voinescu@arm.com>, <darren@os.amperecomputing.com>
Subject: Re: [PATCH v4 0/6] Only generate cluster node in PPTT when specified
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20221101071048.29553-1-yangyicong@huawei.com>
 <20221102040935-mutt-send-email-mst@kernel.org>
Message-ID: <48551344-50a8-0982-f103-bf007b9e41ce@huawei.com>
Date: Thu, 3 Nov 2022 20:18:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20221102040935-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=yangyicong@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2022/11/2 16:17, Michael S. Tsirkin wrote:
> On Tue, Nov 01, 2022 at 03:10:42PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> This series mainly change the policy for building a cluster topology node
>> in PPTT. Previously we'll always build a cluster node in PPTT without
>> asking the user, after this set the cluster node will be built only the
>> the user specify through "-smp clusters=X".
>>
>> One problem is related to this but not fully caused by this, see the
>> discussion in [*]. When booting the VM with `-smp 8` and 4 numa nodes,
>> the linux scheduling domains in the VM misses the NUMA domains. It's
>> because the MC level span extends to Cluster level (which is generated
>> by the Qemu by default) that spans all the cpus in the system, then the
>> scheduling domain building stops at MC level since it already includes all
>> the cpus.
>>
>> Considering cluster is an optional level and most platforms don't have it,
>> they may even don't realize this is built and a always build policy cannot
>> emulate the real topology on these platforms. So in this series improve the
>> policy to only generate cluster when the user explicitly want it.
>>
>> Update the tests and test tables accordingly.
> 
> I think we can classify this as a bugfix and so allow after

Not quite sure about it as I regarded it as an improvement of the topology building
policy. And the problem I met is not directly caused by the policy before this series.

> the freeze, however, this needs ack from ARM maintainers then.

sure. Will resend after the freeze.

Thanks.

> 
> 
>> [*] https://lore.kernel.org/lkml/2c079860-ee82-7719-d3d2-756192f41704@huawei.com/
>>
>> Change since v3:
>> - Improve and attach the diff of the affected ACPI tables in the commit, and minor cleanups
>> Link: https://lore.kernel.org/qemu-devel/20221031090523.34146-1-yangyicong@huawei.com/
>>
>> Change since v2:
>> - Add tag from Micheal, thanks
>> - Handle the tests changes with bios-tables-test-allowed-diff.h, Per Micheal
>> - Address the comments per Yanan
>> Link: https://lore.kernel.org/qemu-devel/20221027032613.18377-1-yangyicong@huawei.com/
>>
>> Change since v1:
>> - Only includes the test tables which is really needed
>> - Enrich the commit
>> Link: https://lore.kernel.org/qemu-devel/20220922131143.58003-1-yangyicong@huawei.com/
>>
>> Yicong Yang (6):
>>   tests: virt: Allow changes to PPTT test table
>>   hw/acpi/aml-build: Only generate cluster node in PPTT when specified
>>   tests: virt: Update expected ACPI tables for virt test
>>   tests: acpi: Add and whitelist *.topology blobs
>>   tests: acpi: aarch64: Add topology test for aarch64
>>   tests: acpi: aarch64: Add *.topology tables
>>
>>  hw/acpi/aml-build.c                |   2 +-
>>  hw/core/machine-smp.c              |   2 ++
>>  include/hw/boards.h                |   3 +++
>>  qemu-options.hx                    |   3 +++
>>  tests/data/acpi/virt/APIC.topology | Bin 0 -> 700 bytes
>>  tests/data/acpi/virt/DSDT.topology | Bin 0 -> 5398 bytes
>>  tests/data/acpi/virt/PPTT          | Bin 96 -> 76 bytes
>>  tests/data/acpi/virt/PPTT.topology | Bin 0 -> 336 bytes
>>  tests/qtest/bios-tables-test.c     |  19 +++++++++++++++++++
>>  9 files changed, 28 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/data/acpi/virt/APIC.topology
>>  create mode 100644 tests/data/acpi/virt/DSDT.topology
>>  create mode 100644 tests/data/acpi/virt/PPTT.topology
>>
>> -- 
>> 2.24.0
> 
> .
> 

