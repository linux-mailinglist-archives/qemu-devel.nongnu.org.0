Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB945E7544
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 09:56:51 +0200 (CEST)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obdYI-0004fE-8G
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 03:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1obdSR-000293-Du
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:50:49 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangyicong@huawei.com>)
 id 1obdSN-00088z-1G
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 03:50:46 -0400
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MYklN2gpVzpStk;
 Fri, 23 Sep 2022 15:47:44 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 15:50:34 +0800
CC: <yangyicong@hisilicon.com>, <mst@redhat.com>, <imammedo@redhat.com>,
 <ani@anisinha.ca>, <eduardo@habkost.net>, <marcel.apfelbaum@gmail.com>,
 <f4bug@amsat.org>, <qemu-devel@nongnu.org>, <linuxarm@huawei.com>,
 <prime.zeng@huawei.com>, <hesham.almatary@huawei.com>,
 <ionela.voinescu@arm.com>, <darren@os.amperecomputing.com>
Subject: Re: [PATCH 0/4] Only generate cluster node in PPTT when specified
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <wangyanan55@huawei.com>
References: <20220922131143.58003-1-yangyicong@huawei.com>
 <20220922153128.000035a4@huawei.com>
Message-ID: <680df724-0a1c-f744-1a70-feff27ed660a@huawei.com>
Date: Fri, 23 Sep 2022 15:50:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20220922153128.000035a4@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=yangyicong@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.893,
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
Reply-to:  Yicong Yang <yangyicong@huawei.com>
From:  Yicong Yang via <qemu-devel@nongnu.org>

On 2022/9/22 22:31, Jonathan Cameron wrote:
> On Thu, 22 Sep 2022 21:11:39 +0800
> Yicong Yang <yangyicong@huawei.com> wrote:
> 
>> From: Yicong Yang <yangyicong@hisilicon.com>
>>
>> This series mainly change the policy for building a cluster topology node
>> in PPTT. Previously we'll always build a cluster node in PPTT without
>> asking the user, after this set the cluster node will be built only the
>> the user specify through "-smp clusters=X".
>>
>> Update the tests and test tables accordingly.
> Hi Yicong,

Hi Jonathan,

Thanks for the comments!

> 
> Does this bring an issue with backwards compatibility?
> I'm assuming we need to make this something controlled in
> virt_machine_7_1_options()?
> 

I'm not sure but I cannot come up with one for now. Any hints for this?
Maybe Yanan can shed some light on this since they are using this cluster
feature.

> One of those things we probably should have noticed originally but now
> we are stuck with the slightly messy backwards compatibility problem.
> 
> Also, looks like you picked up a bunch of tables that are unrelated
> to the change.
> 

The tables are updated by tests/data/acpi/rebuild-expected-aml.sh so I think
it's doing the proper thing. These tables are introduced due to:

Patch 1 - Don't build the cluster node by default, so the "virt" test is influenced
Patch 2 - Update the expected PPTT table to get rid of the cluster node
Patch 3 - Since the cluster is not tested, add a new test for topology test of all
          level for aarch64, with command "-smp sockets=1,clusters=2,cores=2,threads=2"
Patch 4 - Update the expected tables for the topology test introduced in Patch 3


> Jonathan
> 
> 
>>
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
> 
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
> 
> .
> 

