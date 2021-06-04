Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77B739C3C8
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 01:18:40 +0200 (CEST)
Received: from localhost ([::1]:56962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpJ5L-0006IM-AU
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 19:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1lpJ4F-0005OF-PH; Fri, 04 Jun 2021 19:17:31 -0400
Received: from mail-co1nam11on2054.outbound.protection.outlook.com
 ([40.107.220.54]:11709 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nicolinc@nvidia.com>)
 id 1lpJ4D-00014Q-D5; Fri, 04 Jun 2021 19:17:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/oH5pX4IgCE2lRmps5UDLCasOcBxE96kNUTaBy9z4BKVd683/xowRLeLGxs2+/7D25BCirSR7YW6EeeB9MEOSMVUy1xRaGm0IwyyvZOPLbqqbnGWbF8F3mwhlt5L2aqPi41MfSyhLTvmn/1g26oU9NyAcRyQzfGHD2r6nvfQNC1s+ILVm8ftKGsmPb+6yE5UuEFAF1y1D8wWQ4dkKZsccauwOfqfuDEP4/Lxr4dHCpLGfQZgpyoi6Q4WZQ8pvBfEXIZKaBkRZuLv3Ir0PG5bS/j7NmCPAfVo+T/UMUgfUKAy0xvXwKY/yYh7TqGWhSNrmG0fCUjjAEHnBYBaBmJ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8reotzZisZHaQisy6/V63FVn8Gr7SxHjzQSwAK7b6J0=;
 b=k1Klc98/7oNLjLM00LzXjk0s/zXMmK/murNZpw2oZtzp8YAxBZyqXXML24sksdZFlcgNiU6KA/hceXiLDpdDHUXoVlQ+IAdVmlT3ZWGVij7FyVC8AvnVoHAtebGO7/khVRt85bwpCj/SY3tuCIO0qQn+9hCowHj4J9k51ZcB81Rh8DqPCYOLl62EEH4jzP6jPl3pyrK84cXS9NcBSwjVEB1yIZaI7zypufiQ1hEkuUvKt9JNzxV7YD6r04vtikuLDwDh8lM2EQS2/uBlrrxKHDj/w5tZR9ygi5itPiYj8jSC6WyiWmYviu2YVJddma0tkops6qBoqM8IkIMbMmWbTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8reotzZisZHaQisy6/V63FVn8Gr7SxHjzQSwAK7b6J0=;
 b=J+nB5MXdNeQlRr5GsvUYE1qSk/Qbq8Th1qtFW+kT8HOzW8tMyKw8Y12hAJiIZTST4dcrtuuFnSJdMYUvGoAJFJilx+M2vULN7TW9ilr7JCZGDj0hCaPu6eepRbXTIWasQ238JwjeU1mCso2dbHJI5L3mp6tQnFIWQQKVMOY4BRuLqOtyq7G0CF9sajpmbOd40BeS/ttA62IbW/uDUdYE6NrL8XE5nW8J0RHBrykPeINHTO1cpt467hC8pQPJoexK7ibSjMlGXVTT2ank6DqJzaYEBQZi9+qgWAgPYG5Zcuw70NtkIqFKuYjnkJPknmJaxHNeG+f9S+wqX+NNpthugw==
Received: from DM3PR14CA0150.namprd14.prod.outlook.com (2603:10b6:0:53::34) by
 DM6PR12MB3482.namprd12.prod.outlook.com (2603:10b6:5:3d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20; Fri, 4 Jun 2021 23:17:25 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::f1) by DM3PR14CA0150.outlook.office365.com
 (2603:10b6:0:53::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Fri, 4 Jun 2021 23:17:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4195.22 via Frontend Transport; Fri, 4 Jun 2021 23:17:24 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 23:17:23 +0000
Received: from Asurada-Nvidia (172.20.187.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Jun 2021 23:17:23 +0000
Date: Fri, 4 Jun 2021 16:16:14 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: <eric.auger@redhat.com>, <miaoyubo@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: [RESEND] Multiple SMMUv3 instances on PCI Bus and PCI Host Bridge
Message-ID: <20210604231613.GC15599@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 672b36e5-8fa5-4ff0-5090-08d927aee949
X-MS-TrafficTypeDiagnostic: DM6PR12MB3482:
X-Microsoft-Antispam-PRVS: <DM6PR12MB348209F09D181CB2BF46BC5BAB3B9@DM6PR12MB3482.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3hd7cM73+Gn4sBhS7ZXxkxtHRHDR1YG0uKO8L0ld9btGy1ilTjvHRqJw1K4d9NZ2M5SxUWLjgVTLB0KL39daFslVBIcTlD1sFluWPBmJqL6XTawtqXH50V1UcyVs6l07T1RYH681WKtgDGv0aR6s3Zdu7pU1QSV7uoxmG3qjmBmGz7hhLQ3T/EIQf4/lsZeKw2+L0Ng5oB6xQmP0n7SlCzc5llnXIPDO3QCbjbeSqr9Z9JHRs5OqJ7QmALk0au1vpgtzNsP2VrFPthSf+c/kFkhlXFAGDz7s33eKwYOJUg6wgjKZdhGtNB8mSGXC3fW9DH/2fy3yMZy4OYjLjQ58WF8/wg1+fwARKw3Hboe7ZRPwPEnHBN2uK5yeXQP9YGsqGVL2ooKgwXPwY55RxV9H9hbSFnBaoWxrXR0uY/LtIQCNU3EeG5wSkojFimTWc/LdCxomOkPsDHoPXcpBfrD1zdPCrElNEpefaPDX+TwOldccu7pIs9SYcNEVN8sMDiK0g6RePYEw2GD7M6K6Be69t7aMf7BRuvenEnZ2fQEUrSEVCE+eu6zgpfNhfIZRjYIEgTpFpGrvY/h9FfHm5CGPlKGOHunyenb1BjEQ58zpdYqsEsNa8mjoZPUcQDtk8tu9TIGTCSgPX8uHYk8abctE/bi+dnT/loOKOf047ZFBG9E=
X-Forefront-Antispam-Report: CIP:216.228.112.35; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid04.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(36840700001)(46966006)(54906003)(426003)(478600001)(186003)(316002)(36906005)(6666004)(82310400003)(4326008)(70586007)(2906002)(55016002)(70206006)(36860700001)(82740400003)(86362001)(8676002)(7636003)(356005)(5660300002)(1076003)(26005)(9686003)(33656002)(33716001)(47076005)(110136005)(8936002)(107886003)(336012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 23:17:24.0215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 672b36e5-8fa5-4ff0-5090-08d927aee949
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.35];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3482
Received-SPF: softfail client-ip=40.107.220.54;
 envelope-from=nicolinc@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: vdumpa@nvidia.com, praithatha@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Resending as my previous mail didn't go through mailing lists)

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
    table to link vSMMU to PCIE.128?

Thanks
Nic

