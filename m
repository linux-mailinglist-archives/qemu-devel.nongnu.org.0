Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 868B74EFA7B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 21:41:28 +0200 (CEST)
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naN9D-0007Hr-BI
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 15:41:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1naN7G-0006Gj-TL; Fri, 01 Apr 2022 15:39:27 -0400
Received: from [2a01:111:f400:fe59::60e] (port=46624
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1naN7E-0005Pg-EE; Fri, 01 Apr 2022 15:39:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fafjSQCvtwbfZ+6v1EynbSLX0+K7/T7N7v+OD0VydumZmj0mEJIN4xwy8sCbh4QQtUW944yfpNHcCuTtd0o6QJ3OxSyC1x5W5CzSU4HZ3kB0X7OBCujjqpXMA+zQmSiZuLaSX8Bchif901rmxz59FVKwcCbyN4KbytbNs9HPXI4AvHcDrNW905caUA2eOUYRz/iD5C+5J0UjdcfdetH1RT3rW41rooKsy7oZj5nnkKkYgCzqZ7hdPqOJM0Y3BZRn4kfXI6BBsUGH4MjTwCijqr47rSuqiNB+xwJSJh4c5AZqe9q8cQ4dPkdFBl9N0ICoit6V/QVYyJkgiWzCWRW3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtc/FaJHJCAf9xUKEV7X9QEBQsycVqxtSqzPRcgmyUw=;
 b=I8pFfIqB2XvyzCJN7/qasolGEPqs58x1S5hIZdNRGSt+8pFhCS4qzXc7HDqVqXFkXPQ5gTJBz7HMExwMf5tLU6w1jKNYVXUau+o14iwjq7t/TD4h3azrLzT0bIC+LJjm3Y5gQtlbKrr1lGdw19KU2vgMhEIZbcrJS8t9RbP+LfXuS3sF2cOopYYrkx7jKRQVMKtpLTuV3Ex4As4UQJDhD2kfA2nFX4uG+Z5ds801t0kYRGAKlGhDnxEIzQFvZNzNybDYIo1Ou8GGUvG5tP1nF9tkY5+hD6cEUqdR3QbMZcgUokuP6/w+7pTTCGM3pOt6atrWwO03SIwX0xXBFAZMMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtc/FaJHJCAf9xUKEV7X9QEBQsycVqxtSqzPRcgmyUw=;
 b=fiZppbPcfLCUWwVKDXMeLZXcAy9iQAtrbpMxv80jigrbZRor5aUDJ8cTtsLAItszQNL6Sm7RVdqGlpNi5l7mYB9s0AtJ6qii2YX2svFK3CI0HnkBTxivEx0y+jetMyrRX4XhQSGmspeWqU6UcDYNIGEbgpMl9qMkUM31zbmS5U0=
Received: from SA9PR13CA0155.namprd13.prod.outlook.com (2603:10b6:806:28::10)
 by CO6PR02MB7650.namprd02.prod.outlook.com (2603:10b6:303:b2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26; Fri, 1 Apr
 2022 19:06:32 +0000
Received: from SN1NAM02FT0017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:28:cafe::2c) by SA9PR13CA0155.outlook.office365.com
 (2603:10b6:806:28::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26 via Frontend
 Transport; Fri, 1 Apr 2022 19:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0017.mail.protection.outlook.com (10.97.4.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5123.19 via Frontend Transport; Fri, 1 Apr 2022 19:06:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 1 Apr 2022 12:06:31 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 1 Apr 2022 12:06:31 -0700
Received: from [172.19.2.40] (port=36786 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1naMbP-000Fiy-Qp; Fri, 01 Apr 2022 12:06:31 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 0/1] xlnx-bbram: hw/nvram: Fix Coverity CID 1487233
Date: Fri, 1 Apr 2022 12:06:30 -0700
Message-ID: <20220401190631.1697408-1-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0be94b32-6268-487a-3243-08da1412bc22
X-MS-TrafficTypeDiagnostic: CO6PR02MB7650:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB7650A0CEE07602C12001683DCDE09@CO6PR02MB7650.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47SNTRMgiOkWzt1QAZ89Vv5K/MrjEI+Q3NZvTpxTUXb7QkA7VEworizYM/k7AkH/VUl46UWCUEN6viOrHgbL0Yhbwh0YmsAIoY4I8IggdHtrf2KuhizfUkuuaYIzDWy+aLgCng3J2E/+cMsR6iY2+iYDtFi2SUeLPBEWuXkrHpo4KIkKBMqFPN4Y4ToTggDf+XdqRz7ewEsarMrAkDIsplHuf1OeNeNTTcRlX9ZbEMVVh3THnW0875gibZpKnyI4joJtd73EUrVkTYMYVcc1tCiI0K6zcgvETPXLXfn1TxLfdzlO4OfNWd8oU+cAje6AduYTgH6iJIN3XW0qowUjC1D0qy+tLIunL1/55QBE9cWqdVkOhFst0UZUembFOnKNyEUsLlANoj/s28EqlYZ03k6yQbi1bR6523FPs3sKAmetwiHyeqG6FaOGyeXqo1hm8B6N6noMcTMa0D/lSidi9lgp9B5WwGr31g8+K8pEut+8iU3mG6kVwacCUavBdhzE2ioDunEu70Rg0pU4aleakyS2v4N52sFmoJImMS9yKhgHJaWjle7lCP47BDkSQLhI/FA3rZaNbR/XX60XOmrsaLbpnZywGkI4xlGVkka5Hclanplzd5KMsWR5ZiACaaFusX/nWpc6AA74XPKnn11BS9vp6ioZ8I6r6uaBWY8y4CwllM2UQIF8lhDzVjg0H9Hu06ZEfR4Jf5j5XXajqURnSw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(44832011)(9786002)(5660300002)(558084003)(8936002)(70206006)(70586007)(36756003)(6916009)(2906002)(316002)(54906003)(508600001)(7696005)(8676002)(4326008)(107886003)(426003)(40460700003)(186003)(83380400001)(26005)(36860700001)(7636003)(2616005)(336012)(82310400004)(1076003)(356005)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 19:06:32.3889 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be94b32-6268-487a-3243-08da1412bc22
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7650
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe59::60e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe59::60e;
 envelope-from=tongh@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, tong.ho@xilinx.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch addresses Coverity CID 1487233 by adding the required
initialiation of a local variable of type Error *.

Tong Ho (1):
  xlnx-bbram: hw/nvram: Fix uninitialized Error *

 hw/nvram/xlnx-bbram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1


