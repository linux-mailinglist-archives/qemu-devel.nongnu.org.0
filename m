Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89D465209
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:47:59 +0100 (CET)
Received: from localhost ([::1]:46192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRpu-0002qJ-EO
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:47:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRjH-0004FL-OV
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:41:11 -0500
Received: from mail-bn1nam07on2059.outbound.protection.outlook.com
 ([40.107.212.59]:63118 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRjA-0000ER-SS
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:41:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msSS4sC6T4mhJ46fP0wrBl5q42j7PGT9YNt3+x7DbbCYtiNXRXEkYoywpCox9rD0EXSeon1ZAX4LXh7Yf8AtSTbMF8x0Z/4oabPSAHlCeS5LWqeaBFfMddaUaxeHCvvu0iIBvCqpC8LT4ceDVYEA2faewDiXpDJGxp2A8Iskc9Gf/9GbrtQeCLEiGiIenMDaYe4KQIxT9505LoW+jM7OC7ZMMq9eynL07yWS8gY1Tqo6Oy5QsYbj/kgMjmoutTqo5aERvYlYCRoyBP1LvWmJ5kVHcEWmua1XYnoB4P5HcnUZ5wNo13pLs4XfhV8RsTWe5nN8DX5X/8nD0mzUO/dAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=IVvuRnRjcGFEUvaF9U5cIYAHtBenAP4I7SJPFgAXFDmgJxiZ7Zt1F6R2/d5yn+lu6A9FrAIoLNL8pJ36USCeYoAp7a+x1+tMtL0y17J1B8wdvQfhBXyhD/unUfHiCTVygo1LS3Lli6z7sI5noMMU1QgGCeyI2RrJOAWZ+OC0U1hnnZksdvdWiSMlix1kS3K2LzVe5Rqo1Lg/L3cVqjwBcXJ9601Ua3Sbgcrck+vj9rZTLXjDrQhcsktJ05dyHpECQam1WI6AjDojcK4ShLY9gYDp+u0FokDu+CP2eFqHc9/yzZF6emIUU1xOwe0W9xsLwu8tbA8Uf4oTsRk7nCX/XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NXWcAGpGYTM1GyWLMa074F/PLliQUrToa7R+JYIFycM=;
 b=iWv5VRyMDlMnSRNQiO0uKyeOLvPfNWG880yvpOTRG39eaBs2F7wMYzgsIwbi8ew/iC7eppTkRL4oU3lwEY4U/7iapmIgQNX+zePIzuDXkyia1VzceoEkvezeAK7j9ewz+Pg9enB0/PqlvcXf79foAUxCr57cnK7LuY8VOlEtw8I=
Received: from BN9PR03CA0164.namprd03.prod.outlook.com (2603:10b6:408:f4::19)
 by SJ0PR02MB7391.namprd02.prod.outlook.com (2603:10b6:a03:2a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 15:40:58 +0000
Received: from BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::bd) by BN9PR03CA0164.outlook.office365.com
 (2603:10b6:408:f4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23 via Frontend
 Transport; Wed, 1 Dec 2021 15:40:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT059.mail.protection.outlook.com (10.13.2.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 15:40:58 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 07:40:41 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 07:40:41 -0800
Received: from [10.23.121.245] (port=59039 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1msRir-0002FY-KC; Wed, 01 Dec 2021 07:40:41 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 08/11] hw/block/m25p80: Add support for Micron Xccela flash
 mt35xu01g
Date: Wed, 1 Dec 2021 15:40:20 +0000
Message-ID: <20211201154023.13931-9-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dfab391-45d0-4c68-54ae-08d9b4e0f896
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7391:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB7391C01BEC3BD31CA53DA300AD689@SJ0PR02MB7391.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +rt2LnKxfikwyuhzd0ZdUFpRrjOS3fHE8sI9Fpo7nxU+46BynGvMbXRosHM9p2ZdEk4vd5D5DFJXlRkIJ4sSdStCDxTVNWnOnHG/7Goza9p/TK7CeBCj3hbD7Ec8wT9X2UTuwdNbZIAYDf31a32a5QtJLdPnlNsQoEJXto6LvCUzagXqBWivsktd+JVaxv40P+MVSkTZutcvuiJXXaM+cjMAfwhVJYR/ZPEjK3gVNBm0B0W0IlWTiP3zkXQIVR1VGXF1SrVvuW623meq3Yy8+/sIQ3va6uCle/9qV+IUifQpVDWOiLQo9czdAeFVmH/cUC/WOq60ckMkHrBTKOMr+/elEIOr9iO5pWHGiCh6EcN6zz1y81zxc/qa1H8EnRvf3ChLxeHR0xbjW9MIDZlcPlw2II3d+ZzN02vRLodl6kq0YXuJF1jkpPy5sLRIbzXnyK9RFuOuW8qWnS6M+J7xmfl7sP989UOqjm0f8b3aQ92dLG3eFlXCGTAMzWDBPlBnSbVdo6QKrUHxB9Y+R0fD+0HJfJ9KQekTwlEdPb8qHI6WR0s0/W/ZQ09561mgLxuzB35sRyJjt96D+5XFDoEKRk1wsXGcOAU0QGjO/PkzJGoemkHWyMIzDk8Bq69wiHhCtc156dnEJ28nfdjR1aBn5uODBlur6HmqFCsciyBndRElWWw9Y58omGQ48ggndEnlPC5hnYhOnuBuSI3S0h1pr2VUkw4wJaxhFywHjlhf3h4=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(83380400001)(336012)(1076003)(36860700001)(54906003)(4744005)(186003)(82310400004)(5660300002)(47076005)(7696005)(316002)(26005)(4326008)(6916009)(508600001)(9786002)(426003)(2906002)(8936002)(44832011)(8676002)(6666004)(70586007)(70206006)(36756003)(7636003)(2616005)(356005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:40:58.4505 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfab391-45d0-4c68-54ae-08d9b4e0f896
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7391
Received-SPF: pass client-ip=40.107.212.59; envelope-from=figlesia@xilinx.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for Micron Xccela flash mt35xu01g.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/block/m25p80.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b77503dc84..c6bf3c6bfa 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -255,6 +255,8 @@ static const FlashPartInfo known_devices[] = {
     { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
     { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
     { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
+    { INFO_STACKED("mt35xu01g", 0x2c5b1b, 0x104100, 128 << 10, 1024,
+                   ER_4K | ER_32K, 2) },
     { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
-- 
2.11.0


