Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ADC51A0DF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 15:24:35 +0200 (CEST)
Received: from localhost ([::1]:53366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmEzZ-0007a7-Ou
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 09:24:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Suravee.Suthikulpanit@amd.com>)
 id 1nmExL-0006Of-Bw
 for qemu-devel@nongnu.org; Wed, 04 May 2022 09:22:15 -0400
Received: from mail-co1nam11on2044.outbound.protection.outlook.com
 ([40.107.220.44]:2656 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Suravee.Suthikulpanit@amd.com>)
 id 1nmExJ-0004WU-6I
 for qemu-devel@nongnu.org; Wed, 04 May 2022 09:22:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISRr9JX3N8t5rro2GP/uYXbOiLeOGdLHxDFU3bvskEcDblcF8fPxuirQJboDN6DOxcYPXHXEFWHCa2fbGh7lV+UE1Hmu8bQ+1v5tYzovfX0dhhSmIRE2XDPg4BPer4PAGKw1a6lV6Raip+OF10cXakSeuwOlZl97diCK2lH4YbO9kq6R4WRvwhBBmpzSwUK+G7h6JXCa8t65YMfV+nzwSrKEOQW9mZ9OfI0GQHugvCRCdpTiuBjXho35Uv/I9LTDlj4RluWYxmYRvxVLF6zk99ZoTnoUust8rXbbqgSxvgUHq9JOabEVVtVnI7KMGGzlpo5HoA2fbblGG4pP3o2A7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdkRXByMS4anA0seoB0utGmKvM/+MSknN5ezd7h6RGA=;
 b=ivmUx48j8pbLo5pBBf8lVv2T+uupmZbpgL7RxraQ/NmqaE2R3Jg1pJrJuWFYZMPkJP3ItpHouQwFtgB3WJb6hJI01NF0GX3JX01yF1umQKRZ0XKBvduYEZ7GmPqy1tmJo9WM6ulrDc1zYyJLWexjgYjLpPawmrQXSt3aC3LaUh/cP96hBIDes61Gjr2yg/QOPqi0OzEBjB7FB0EBE7+v+CXGNmdNZCsjb+GdQpMHnjrBEVxdy6leww79APqA09wNQdgrPi55O9oQ/14DyYgiPlrmmp8Qxc42VAPCRhbgzWQ2DYuXxnoYUrKf6bRWbmzqUBTxqg0tzh0KVWXiTBgJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdkRXByMS4anA0seoB0utGmKvM/+MSknN5ezd7h6RGA=;
 b=k4kpMpkcAStbjUSsyp+kN+hfZgrkB3oq8Y9iRmAMBBD7HlesZx3zD2/CpXwMt49IqwRW3A0PMkhe2HoYoVH800vA1IPKlgey3ohY2y4u/xJBRo7PXKMa3xOOvn3QlFWCyn2Gspjt8uWMHtW67R9MTukZYItdTPEBz7lmVfLuQoA=
Received: from MW3PR06CA0005.namprd06.prod.outlook.com (2603:10b6:303:2a::10)
 by DM6PR12MB4602.namprd12.prod.outlook.com (2603:10b6:5:168::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Wed, 4 May
 2022 13:17:06 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::bd) by MW3PR06CA0005.outlook.office365.com
 (2603:10b6:303:2a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Wed, 4 May 2022 13:17:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 13:17:06 +0000
Received: from sp5-759chost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 4 May
 2022 08:17:04 -0500
From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
To: <qemu-devel@nongnu.org>
CC: <marcel.apfelbaum@gmail.com>, <mst@redhat.com>, <pbonzini@redhat.com>,
 <richard.henderson@linaro.org>, <eduardo@habkost.net>, <jon.grimm@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: [PATCH] pc: q35: Bump max_cpus to 512
Date: Wed, 4 May 2022 08:16:39 -0500
Message-ID: <20220504131639.13570-1-suravee.suthikulpanit@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec5462c5-dfb2-47c1-b21c-08da2dd062f1
X-MS-TrafficTypeDiagnostic: DM6PR12MB4602:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4602642C2A5E0F38974AA792F3C39@DM6PR12MB4602.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xNSJ+u1ZFuvNWEc5PGBYIUHnvOwwXGH/uclAja3ov556fKjhwhHLZ2xbhdpyZILcwPuY8ALNU9W7EFe046qnYXZOPyy0mdaM2UtxEPrTR+nazo5saaH8aYxoJ0jPNYTtxb641eEkc1KhBGGE+jrYtKtVDJbReABlsqLtIoSs5OEHAZWoRD+6eHZfklyD7+VH8iWxbSpu8lm3P+HFNJETjSNEsWOSAc6f4Pb5yFH7y65fpD8fHZ4ymeF8Iz6aSACWxFyiEbk5U/vgc7phMz7fldAIYHkz1oT6TlvruIljMJ49OS5YDy3SQ61Xitiok3xrGtV7OznsaAuHRgcK98GxyVF+RNfKjHhRR/EsUNhiTNxtlBTWf8VhKrGMgXxjznf8Tni+r4/L5hkEpqxPRoqV2h22AbtUCTMp61o/2xA+OSNL2e+thLiIOflh2AI2S+APT3PY+2aCx3hdPO4RAsZr1ShgUk1r0H70aCkCOYps7tNpFdncE94gxe5Myjil2eY30jPcJhkbaOPWTXQQm07o1E9d54MYKSA/v8oATNVlymy/kxVdHY0z5Vf4Gac0OyG7f4wXivTo2/OyUFhiNTziBmHo3Eo1IXxRiNw8MvtRCJV0KWaDmbrSjBRxA11dCzjkqfJbsLNekEmv10itKnONBQAGrZVjIunTblMCzV+wVs1oXOOank97kU2F28axO3lCOy9phUOg+S1eGAQdEP5QtQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(44832011)(4326008)(70206006)(2906002)(36756003)(36860700001)(47076005)(70586007)(5660300002)(8936002)(40460700003)(4744005)(1076003)(426003)(336012)(186003)(2616005)(16526019)(7696005)(26005)(508600001)(6666004)(8676002)(6916009)(316002)(54906003)(82310400005)(83380400001)(356005)(86362001)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:17:06.0926 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5462c5-dfb2-47c1-b21c-08da2dd062f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4602
Received-SPF: softfail client-ip=40.107.220.44;
 envelope-from=Suravee.Suthikulpanit@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is the maximum number of vCPU supported by
the AMD x2APIC virtualization.

Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
---
 hw/i386/pc_q35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 302288342a..e82b1c690d 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -357,7 +357,7 @@ static void pc_q35_machine_options(MachineClass *m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_INTEL_IOMMU_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
-    m->max_cpus = 288;
+    m->max_cpus = 512;
 }
 
 static void pc_q35_7_1_machine_options(MachineClass *m)
-- 
2.25.1


