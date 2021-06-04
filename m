Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBBA39C533
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 04:45:32 +0200 (CEST)
Received: from localhost ([::1]:48112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpMJX-0000wu-7f
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 22:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1lpIwl-0004jP-Ux; Fri, 04 Jun 2021 19:09:47 -0400
Received: from mail-dm6nam10on2065.outbound.protection.outlook.com
 ([40.107.93.65]:9748 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1lpIwi-0004GC-Ux; Fri, 04 Jun 2021 19:09:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9Liah++21yQT3wgqlt3m23vVtbyhkU/gzDOpsdm5Xne5h0hnnXeA/N9tM2q6OZIFf6pA3iyIJJwTkPwanR0Ro/973WVJDKjfqQDME3u9J+bFdWr8XF5VbS7GkkTGwLYd9tYZle8XbM9wRZZfchiQVQIdca3deVP7UiXBBg67x+uRZf1KlGw8lGg1Wm9iyfHfEs0piG5IlMx84IRuVoeyGQRxSJS6UzH/1u44xccD7kWczXjFq+qshrnW0ckYkDvu4A+opgnVQPwuZXTQg790VNJMMdZegnjhIx6gGf39kfa6r9DHFUDpPcdQpuWHxiAGZAk2MrJJ8CN2xjJRGjlvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSGgRFFQKLoE9hiwcblWmcouYftjeCYdT+SUTHPMKU4=;
 b=oB5LeyxpofpQtEJ148cKeXLd3cQEjrU8evINFt8tQaO/phmvt6YaloYWasdtzZAiFRX7QSx/zYLQIzVNJNF6W1ryfQB7itv1lQp9vLtSTsdJoCQB7i8hUHC5pQEqVbHSl9dSiLSds43gJEWr/atiqhKOWKQpzLN3cVbUn4RtN3w7ujpi3Hmn5/vBmLliaWG3VnWmM2P8j3mqK4MgsAk0vSyfbkce7SAD9aReufEXANDJfu7fa+hknBiAG7hJofdO7YRuo9zO3kos9keZ+j1QeIwbKgXSESlvWH3QZ8Poo8uMjcdWXYpv2PPWKDzAsa+1344Eb4Y+nTxqRWXpAAUnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSGgRFFQKLoE9hiwcblWmcouYftjeCYdT+SUTHPMKU4=;
 b=rjwr7ucYQwxnSbUijfxbX7G/V5+zLAjnd3o42FfY4upZb/xkQTrSKCOncmJIXJjnlTAwVpmcp/P4WfzYWlBbeo5O7wStA54GPARGJ0fsPrqCI2XbYZzzzRNSS5LcsUXzkB1zuD3kXzXRzw/X5yDXr7F622UyeB0h98By22+Jd52sqPIBTzxZEZHy2Z/WDEJ5nSt/LyO4He5C5W1yPuvxKNH20OOOc5nDOJ8TFN/sDM+Mco+/CEsGfv0Yeeof57xyi8BszFGzeL5anRB19JSWwrH8Nt7fyZaw0YVy4aAHM2dIxACVEiV4+XbM1RQ6i9guDDJxTArLOFIjF5ifkXeNsw==
Received: from BN9PR03CA0916.namprd03.prod.outlook.com (2603:10b6:408:107::21)
 by BY5PR12MB4036.namprd12.prod.outlook.com (2603:10b6:a03:210::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 4 Jun
 2021 23:09:38 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::ca) by BN9PR03CA0916.outlook.office365.com
 (2603:10b6:408:107::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23 via Frontend
 Transport; Fri, 4 Jun 2021 23:09:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Fri, 4 Jun 2021 23:09:37 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 23:09:36 +0000
Received: from Asurada-Nvidia (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Jun 2021 23:09:37 +0000
Date: Fri, 4 Jun 2021 16:08:27 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <eric.auger@redhat.com>, <miaoyubo@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: Multiple SMMUv3 instances on PCI Bus and PCI Host Bridge
Message-ID: <20210604230827.GB15599@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55cf8243-6044-4d6b-c657-08d927add35a
X-MS-TrafficTypeDiagnostic: BY5PR12MB4036:
X-Microsoft-Antispam-PRVS: <BY5PR12MB40360C4693AFA896CCB9D975AB3B9@BY5PR12MB4036.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yESHL66Hj0Dynl/NhJWURnxr3wo8bw8LlBqR2ZuaFGZk8KmB7hqxh4br4K+opU/NKDzdDbRyPEPcytylKmao3Z87elMCuAoi8hCX7f4+kKKmBIp0wBwCq0wSdM0XUuSSAwavwNV9UF5XuvW34wcaxYkUUVxqXYrxXs+I6iVrZWCqTaf2tCTYetS2Ttb6/vTto4yaB6HIbbHaoPrI8cYsJsg+Lv+GbJ718uVwuF+CsU4zy4rBxvS4gdOFD5ORtl6p+F0D+E3DNqm+6tE+8T4EPw364vce15ZjLauuez75N0uamLAmgDalQJ56i/hZWVt/BqdJmzacdD1htWI5LtqSjowgzPk+qALHzSn70XS323DVANtWDcys/X0Q2BgFQUHu3C/JCaD4kB32P2MJ3GMte5HldGG9f0527O+xWbCWcNfThtao8WlTYPQpGrseU/CZkkjnqSZzQLtZtPG0nvIXAlgNgZLr7h5WSlVcDqZUrsL0SOalG3wHHqYahI7XfXjtqHoXA5DfG5YkGirk7LqFG1/P4jD5Yujq5Zvo9AoxSOOwi5CcCyh+D080UcX/gAwVpFSmT00zeEE6BFpHox71lHLaDmsM54IUioEesjCYdNgN2EXpodUiEIccYO+5Zyj3WaQ4U0z1t4gigqs/LOTZ1kJq8ESkXr3A97fhosb99ug=
X-Forefront-Antispam-Report: CIP:216.228.112.36; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid05.nvidia.com; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(82310400003)(186003)(2906002)(26005)(36906005)(316002)(110136005)(54906003)(86362001)(5660300002)(33716001)(8936002)(8676002)(70586007)(478600001)(70206006)(336012)(82740400003)(36860700001)(4326008)(6666004)(356005)(1076003)(47076005)(7636003)(33656002)(9686003)(107886003)(426003)(55016002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 23:09:37.6691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cf8243-6044-4d6b-c657-08d927add35a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.36];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4036
Received-SPF: softfail client-ip=40.107.93.65;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Jun 2021 22:43:10 -0400
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
Cc: vdumpa@nvidia.com, praithatha@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Eric, Yubo, and other QEMU developers,

I am having a problem with links between vSMMU and PCI Host Bridge,
using ARM-VIRT (64-bit; ACPI) + SMMUv3 (nested translation) setup.

Firstly, I am very new to the areas of QEMU, PCI and ACPI. So some
of my thoughts/ideas below might not sound very reasonable to you.

My goal here is to create two vSMMU instances in QEMU level and to
link them to different passthrough devices: each vSMMU has my local
feature that reads/writes through a VFIO mdev interface to talk to
Host OS, so it has to be two vSMMU instances in the QEMU level for
my use case.

As we know, QEMU by default has only one PCI root bus (PCIE.0) that
links to a default vSMMU (let's call it vSMMU0). And I learned that
now ARM-VIRT has PCI gpex feature. So I was planning to create one
host bridge (PCIE.128) to link to a different instance (vSMMU1) --
later on I can pass through different PCI devices to either PCIE.0
or PCIE.128 for different mdev pathways.

I then tried to add a PCI Host Bridge using the following commands
that created one default vSMMU instance, as my first experiment.

/home/ubuntu/qemu-system-aarch64
    -machine virt,accel=kvm,gic-version=3,iommu=smmuv3 \
    -cpu host -smp cpus=1 -m 1G -nographic -monitor none -display none \
    -kernel /boot/Image -bios /usr/share/AAVMF/AAVMF_CODE.fd \
    -initrd /home/ubuntu/buildroot-20200422-aarch64-qemu-test-rootfs.cpio \
    -object memory-backend-ram,size=1G,id=m0 \
    -numa node,cpus=0,nodeid=0,memdev=m0 \
    -device pxb-pcie,id=pxb-pcie.128,bus=pcie.0,bus_nr=128,numa_node=0 \
    -device pcie-root-port,id=pcie.128,bus=pxb-pcie.128,slot=1,addr=0,io-reserve=0 \
    -device vfio-pci,host=0003:01:00.0,rombar=0,bus=pcie.128

However I found that PCIE.128 was also added to vSMMU0, which feels
like that PCIE.128 treated PCIE.0 root bus as a parent device so it
was added to the parent's vSMMU too.

Then I tried another experiment with the following hack, hoping that
it would link vSMMU0 to PCIE.128 instead of PCIE.0:

@@ -385,13 +387,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     /* fully coherent device */
     rc->memory_properties.cache_coherency = cpu_to_le32(1);
     rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
     rc->pci_segment_number = bus_num; /* MCFG pci_segment */
+    rc->pci_segment_number = cpu_to_le32(bus_num); /* MCFG pci_segment */

     /* Identity RID mapping covering the whole input RID range */
     idmap = &rc->id_mapping_array[0];
     idmap->input_base = 0;
     idmap->id_count = cpu_to_le32(0xFFFF);
-    idmap->output_base = 0;
+    idmap->output_base = cpu_to_le32(bus_num << 16);

Yet, I found it's not successful either: the vSMMU instance was not
added to either PCIE.0 or PCIE.128.

So I started to have questions in my mind:
(1) Can PCI host bridge (PCIE.128) add to a different vSMMU without
    following PCIE.0's SMMU setup?
(2) If the answer to (1) is yes, is there any way to have two pairs
    of PCI+vSMMU?
(3) If the answer to (1) is no, how can I correctly change the iort
    table to link vSMMU0 to PCIE.128?

Would it be possible for you to shed some light here?

Thanks
Nic

