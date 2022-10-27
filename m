Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35760EE53
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 05:09:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ontEZ-0003S2-8G; Wed, 26 Oct 2022 23:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1ontEV-000331-36
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 23:07:03 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1ontER-0006PX-Ul
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 23:07:02 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MyVnj4y6CzVjDw;
 Thu, 27 Oct 2022 11:01:45 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 11:06:33 +0800
CC: <yangyicong@hisilicon.com>, <imammedo@redhat.com>, <ani@anisinha.ca>,
 <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>, <f4bug@amsat.org>,
 <wangyanan55@huawei.com>, <qemu-devel@nongnu.org>,
 <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>,
 <prime.zeng@huawei.com>, <hesham.almatary@huawei.com>,
 <ionela.voinescu@arm.com>, <darren@os.amperecomputing.com>
Subject: Re: [PATCH 0/4] Only generate cluster node in PPTT when specified
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220922131143.58003-1-yangyicong@huawei.com>
 <20221026105012-mutt-send-email-mst@kernel.org>
Message-ID: <2a6d604c-815c-d284-bacd-56aa3fb39e1b@huawei.com>
Date: Thu, 27 Oct 2022 11:06:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20221026105012-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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

Hi Michael,

On 2022/10/26 22:52, Michael S. Tsirkin wrote:
> On Thu, Sep 22, 2022 at 09:11:39PM +0800, Yicong Yang wrote:
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> This series mainly change the policy for building a cluster topology node
>> in PPTT. Previously we'll always build a cluster node in PPTT without
>> asking the user, after this set the cluster node will be built only the
>> the user specify through "-smp clusters=X".
>>
>> Update the tests and test tables accordingly.
> 
> 
> This will need an ack from virt maintainers.

Sure.

> 
> And I think what people are asking is about the impact
> of this patch on guests.

On the current kernel (tested on 6.1-rc1), there's no impact for the kernel
side, only the cluster node in PPTT is not generated. Booted with `-smp 8`

without this patch:

with this patch:
estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
ff	# cluster_cpus
0-7	# cluster_cpus_list
56	# cluster_id

with this patch:
estuary:/sys/devices/system/cpu/cpu0/topology$ cat cluster_*
ff	# cluster_cpus
0-7	# cluster_cpus_list
36	# cluster_id, with no cluster node kernel will make it to physical package id

Will send a v2 version and update this information.

Thanks.

> 
>> Yicong Yang (4):
>>   hw/acpi/aml-build: Only generate cluster node in PPTT when specified
>>   tests: virt: update expected ACPI tables for virt test
>>   tests: acpi: aarch64: add topology test for aarch64
>>   tests: acpi: aarch64: add *.topology tables
>>
>>  hw/acpi/aml-build.c                |   2 +-
>>  hw/core/machine-smp.c              |   3 +++
>>  include/hw/boards.h                |   2 ++
>>  tests/data/acpi/virt/APIC.pxb      | Bin 0 -> 168 bytes
>>  tests/data/acpi/virt/APIC.topology | Bin 0 -> 700 bytes
>>  tests/data/acpi/virt/DBG2.memhp    | Bin 0 -> 87 bytes
>>  tests/data/acpi/virt/DBG2.numamem  | Bin 0 -> 87 bytes
>>  tests/data/acpi/virt/DBG2.pxb      | Bin 0 -> 87 bytes
>>  tests/data/acpi/virt/DBG2.topology | Bin 0 -> 87 bytes
>>  tests/data/acpi/virt/DSDT.topology | Bin 0 -> 5398 bytes
>>  tests/data/acpi/virt/FACP.pxb      | Bin 0 -> 268 bytes
>>  tests/data/acpi/virt/FACP.topology | Bin 0 -> 268 bytes
>>  tests/data/acpi/virt/GTDT.pxb      | Bin 0 -> 96 bytes
>>  tests/data/acpi/virt/GTDT.topology | Bin 0 -> 96 bytes
>>  tests/data/acpi/virt/IORT.topology | Bin 0 -> 128 bytes
>>  tests/data/acpi/virt/MCFG.pxb      | Bin 0 -> 60 bytes
>>  tests/data/acpi/virt/MCFG.topology | Bin 0 -> 60 bytes
>>  tests/data/acpi/virt/PPTT          | Bin 96 -> 76 bytes
>>  tests/data/acpi/virt/PPTT.memhp    | Bin 0 -> 76 bytes
>>  tests/data/acpi/virt/PPTT.numamem  | Bin 0 -> 76 bytes
>>  tests/data/acpi/virt/PPTT.pxb      | Bin 0 -> 76 bytes
>>  tests/data/acpi/virt/PPTT.topology | Bin 0 -> 336 bytes
>>  tests/data/acpi/virt/SPCR.pxb      | Bin 0 -> 80 bytes
>>  tests/data/acpi/virt/SPCR.topology | Bin 0 -> 80 bytes
>>  tests/qtest/bios-tables-test.c     |  22 ++++++++++++++++++++++
>>  25 files changed, 28 insertions(+), 1 deletion(-)
>>  create mode 100644 tests/data/acpi/virt/APIC.pxb
>>  create mode 100644 tests/data/acpi/virt/APIC.topology
>>  create mode 100644 tests/data/acpi/virt/DBG2.memhp
>>  create mode 100644 tests/data/acpi/virt/DBG2.numamem
>>  create mode 100644 tests/data/acpi/virt/DBG2.pxb
>>  create mode 100644 tests/data/acpi/virt/DBG2.topology
>>  create mode 100644 tests/data/acpi/virt/DSDT.topology
>>  create mode 100644 tests/data/acpi/virt/FACP.pxb
>>  create mode 100644 tests/data/acpi/virt/FACP.topology
>>  create mode 100644 tests/data/acpi/virt/GTDT.pxb
>>  create mode 100644 tests/data/acpi/virt/GTDT.topology
>>  create mode 100644 tests/data/acpi/virt/IORT.topology
>>  create mode 100644 tests/data/acpi/virt/MCFG.pxb
>>  create mode 100644 tests/data/acpi/virt/MCFG.topology
>>  create mode 100644 tests/data/acpi/virt/PPTT.memhp
>>  create mode 100644 tests/data/acpi/virt/PPTT.numamem
>>  create mode 100644 tests/data/acpi/virt/PPTT.pxb
>>  create mode 100644 tests/data/acpi/virt/PPTT.topology
>>  create mode 100644 tests/data/acpi/virt/SPCR.pxb
>>  create mode 100644 tests/data/acpi/virt/SPCR.topology
>>
>> -- 
>> 2.24.0
> 
> .
> 

