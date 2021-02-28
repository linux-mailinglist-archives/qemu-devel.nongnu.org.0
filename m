Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B46327431
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:40:14 +0100 (CET)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRvJ-0005Ti-2o
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRlD-0000Jh-0T; Sun, 28 Feb 2021 14:29:47 -0500
Received: from mail-dm6nam10on2084.outbound.protection.outlook.com
 ([40.107.93.84]:7041 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkz-0003Bi-9B; Sun, 28 Feb 2021 14:29:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjSTPUdKoKaMnHtJZQDx+ZPlbofIsi/dk6POwYB4nDF8eV4uVLXVoJ3+9qFsjHkwGLnMFjeJW3lsl2UnOQYl8hCKWmKdm9dibOHLNhRiDAfsqbbG0bPCtaXmWNeOU8zYV5KgDMhXqFyIGGpbrsPZJOzRMcymymnnbL54a9e32b3QN1DwE94zHSUihjkNi1UAuyIXPOk2gO9dlmoG2JJg1u7G9dmyfw4x/XqFvFW6bMe0zf9Q9JFCNMw2PaKO/N/ofpzReiOUY8Ox8onoYUNXfXFeoxfZ9L2EspfPqD2tgV4moi09wucmNpE48aYzE/yKa7gtiILajRxTMzoUEYLc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ho/XR5Sd1fi4MdutOw970iZqJNp5oVehh3b5BLlhmo=;
 b=RN5c4DXBRsFpNPRorABgvbyDr6TqQTEYx8W1MyaI3KY533BaFdsXQKw47ULKiI2VAjZNa2lYSpMRCs8/ocgOtXvojH+buBYOhaG6Ir2/4esXjKDLETgg159j89Zx5i4Ht9enLqv+sQqFFWFCA9XV2eZiavvmhxlmxhJQbhk3oWgbiJeECg6lTrBPLU7iSiaW/2J11lHgg94hYWoxwTBBWCw4niGkey1IGe/lqBiEHo6NUtNmpAhg5ImeyLlSWVK7xDijCCYzXoEzR1XHocmYf4ngKDXYFwj+fFQ3wa7FN+fB1ro6Rv1MCLAUioEY5EcDEHy2GnisrNkPF4RHiA/wgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ho/XR5Sd1fi4MdutOw970iZqJNp5oVehh3b5BLlhmo=;
 b=hXAwFtWWJsdIDhVX3a1LAkfIygTYMj0EiLUdUXOsMOkZ4WitJkCoUkm1akLIwaBLX/ourf58NxbQ9U/sUJh0FhaYEIYfPMnWL6AklH4gjJJPXEgvLIgFMh6WA41ZX2/HB3LyI4OGvuBBqBdVPAw/BTi6q/fCFEp9gzmv4URsVag=
Received: from CY4PR03CA0021.namprd03.prod.outlook.com (2603:10b6:903:33::31)
 by SN6PR02MB5696.namprd02.prod.outlook.com (2603:10b6:805:e9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Sun, 28 Feb
 2021 19:29:29 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::19) by CY4PR03CA0021.outlook.office365.com
 (2603:10b6:903:33::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:17 -0800
Received: from [10.140.6.35] (port=57774 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkj-0008Ay-FK; Sun, 28 Feb 2021 11:29:17 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 9303A13C0A8E; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
To: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>, "Max
 Reitz" <mreitz@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@virtuozzo.com>, Eric Blake <eblake@redhat.com>, Joel Stanley
 <joel@jms.id.au>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Vincent Palatin <vpalatin@chromium.org>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Alistair
 Francis" <alistair.francis@wdc.com>, "Edgar E. Iglesias"
 <edgar.iglesias@xilinx.com>, Luc Michel <luc.michel@greensocs.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>
Subject: [PATCH v3 10/21] sd: emmc: support idle state in CMD2
Date: Mon, 1 Mar 2021 01:03:16 +0530
Message-ID: <1614540807-30686-11-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc6e42b9-5676-4c0c-c6ef-08d8dc1f2ad5
X-MS-TrafficTypeDiagnostic: SN6PR02MB5696:
X-Microsoft-Antispam-PRVS: <SN6PR02MB56967CA4DEEFC52BC6E11899CA9B9@SN6PR02MB5696.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xdpOwCFZXuCs6zg/wD/n8MiL3W+v2UKxNEpColpVdwzb1q3dOYqgztDyfgvAF6IAur1+zOF6s1o6OL4kUuXZPWXKwwu82Bxhc5EJDYSI2KObZYSSRgSoq9b7QGFsMOockv8WO3tXLVLPvxwkIpHE5jTAKlvJVY+DnugFMmN/m2Qf+i+EBnA21g55tIvb3II0wdzrxHmPw7lCbpyQ4aeax1lbXTAAnEp3juezQH7LErVDmftzd4oI9MCEW2zvGIWnf8M6asgX4qK14va9MBTQwAyKctF0o/3njsI8rSABHBgMmk2+CUEXbs1tPCwzJMXipX+eqLLZXUh0Cree+bY4crI/DNWRpWdVdiqtw/u8ElwgN4h0wZkEkPqd/yFlh53g1hRPgBlUR4zb1Rb2LwvZNUgTxEPf5Jtb0SHFckHD0aY7nnj3b9v+6mJm8nnNidnFS8S/vuvOHAaBpl5RhV52roCNh/xUgli3WDaG2H/85ZRffCcUo60gtraMAzb2NIirDF262RRTLpixscgSrM2vZtbBufuKctzNFgKevq+OA82YlUAS8rxMjZ/zM++81iRjCdt1jMBNpVF6tm81vgcXD3ObUKMmA72/3OSFtrgq2WhWQnBKcV+yDEK+CbZHZS3G+OBCAs2sMGFdPY2ivWPQpIQrPQHYf0meXuyKH1zFQHxDJJGbdotPBIwofxN4htx8yQFWsK4uJclxR3ZePZBGIA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(46966006)(36840700001)(4326008)(316002)(82310400003)(36906005)(478600001)(921005)(5660300002)(426003)(2616005)(110136005)(336012)(83380400001)(82740400003)(4744005)(54906003)(107886003)(36756003)(8676002)(2906002)(7636003)(7416002)(70206006)(356005)(70586007)(6266002)(8936002)(186003)(6666004)(26005)(36860700001)(42186006)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:29.3045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc6e42b9-5676-4c0c-c6ef-08d8dc1f2ad5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5696
Received-SPF: pass client-ip=40.107.93.84; envelope-from=saipava@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: saipava@xilinx.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eMMC is expected to be in idle-state post CMD1. Ready state is an
intermediate stage which we don't come across in Device identification
mode.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/sd/sd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 054ad1e..8a7d0de 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1059,6 +1059,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         if (sd->spi)
             goto bad_cmd;
         switch (sd->state) {
+        case sd_idle_state:
+            if (!sd->emmc) {
+                break;
+            }
         case sd_ready_state:
             sd->state = sd_identification_state;
             return sd_r2_i;
-- 
2.7.4


