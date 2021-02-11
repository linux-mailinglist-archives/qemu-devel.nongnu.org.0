Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59F531864C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:26:25 +0100 (CET)
Received: from localhost ([::1]:35018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7Iu-0006Q5-U5
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:26:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76B-0002ok-Uv; Thu, 11 Feb 2021 03:13:17 -0500
Received: from mail-dm6nam11on2060.outbound.protection.outlook.com
 ([40.107.223.60]:9056 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA760-0004ae-02; Thu, 11 Feb 2021 03:13:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuEvxg339yxtfldiM5TKNRqkYYT0oeTjUdLykGhc3vQA/2xlmtTJY4mhRyLgYRTUsjVaHN5nmMP6cKXZAzQREt8vV2iBnXv3PxRc6EJWLoKZsbxHxGN7OeJfY3Omu/jBAYu0cnwLH1lBNTPO8Hg0SS8VrCgtNYlWR39mvOSr8VABlEiT2CY74vgX51u4lnOmRDM6+gU5gJ1GNL3jUd0q4zNDkVcwPBgRkYbU5celNeOlXo8D3S8/FVi9k8Fau7gE5vVl3ylW64FOdX7R8o+9ZUoC+gAHPXr5EyJJaLisDiQlb3YZ/amV3URA7kT/2VFDM2ZBY4ieHruHVAk3IbDRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKLtoy5Cea4YOUvmMGCSoB/a1H4rcNhMKmCTZfHfQa8=;
 b=Ief1okCPpmQgyOmhhE5PRMl3KgcpQFf3O4WQAzV/spBW/a2eJpFo9oFz+LeXxbE8+xOBD6Sx5oZRryAuVAgyvjCgjGp7ZkQM5rmm44Styvpr9p0+pgOMctt83/FYujp7bPs0dnnfMjpu1eJT/P/mjyxfrhDSoM1f/gN+Yb26mZoYwOeQ2ZOmPwKJkFguY7tdd+smOowBtl1dnmD0zHGdSvr+cPCpcJa/WHnC6nIs29DbbbryITwtE5h2xVjV26ZKeIL7GhhUFuUO/BBNwKdfe2ZPExUfvGGup0qYhz4PpSj2H5Z9aR9BnEXmdweJS+L1ii/n130W36lHrmT6xa3k0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKLtoy5Cea4YOUvmMGCSoB/a1H4rcNhMKmCTZfHfQa8=;
 b=atfuC7fALTZRVKBtbJYQMrt133tQS1zslT7To9ONjA8jmF1u8j1aUo2Po+AH6aMPch4L91hHdXCMpjfQ7Pctxox31jE9Y+8uwqEdN9vXQDL0yZhmKlCq5GmdqQXS/uV6UHt+asGmTA9x7TsAfcV/PcVBdglh6DStkrKV5/tJ6ZI=
Received: from MN2PR19CA0062.namprd19.prod.outlook.com (2603:10b6:208:19b::39)
 by DM6PR02MB3993.namprd02.prod.outlook.com (2603:10b6:5:9f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Thu, 11 Feb
 2021 08:12:59 +0000
Received: from BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:19b:cafe::b3) by MN2PR19CA0062.outlook.office365.com
 (2603:10b6:208:19b::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 08:12:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT016.mail.protection.outlook.com (10.152.77.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:12:58 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:56 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:56 -0800
Received: from [10.140.6.35] (port=49688 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75s-0000HJ-3G; Thu, 11 Feb 2021 00:12:56 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id A454E13C06B8; Thu, 11 Feb 2021 13:48:18 +0530 (IST)
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
Subject: [RFC PATCH 13/15] sd: emmc: Subtract bootarea size from blk
Date: Thu, 11 Feb 2021 13:47:24 +0530
Message-ID: <1613031446-22154-14-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bdbc18a-68dd-42e3-187c-08d8ce64d815
X-MS-TrafficTypeDiagnostic: DM6PR02MB3993:
X-Microsoft-Antispam-PRVS: <DM6PR02MB3993564F200B091410AEB0C8CA8C9@DM6PR02MB3993.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HqHDQU4R73abaAyZo19YhVFiBbKBs9ENI26jGVDtD/jne3Hy4JYsLcGWD4AxAUTHBOsFrVSoljsaU/0OaRY/t6ZWtlQmVg8vIzKtx+MOA3Z5yWu7aMUuncLA67ja1qqXHEsNOG2UCx6/TtX8d/ODq8fv3Ptsd/uB49tTI36C+fqEnkAO70zRS+2IIaJ1Q9Uq9C7Vff3tllOvKwElwpo1z5UZcCbBXs9glIhTPIKR9pB0LMkkZx78LJp+adaQ/wTQLlMvOLNKHkxj0vkU/nS1HIQo276cr81jisRZagD0Mi5hDjFu6BFXHNNMscTVIBUw7eooMaW79/cBSVW1+uD2CsVRSp+VpLPFGydSNG5rxT09UsSQXXGW8vtdUD94p3Uxr2O9BhVbUKvZqJ7N4LuN1O4vNFSQxNFnwFxpwS2mtYXIw4iWANsi3N2w/UwY05Z0gMG599BlGMoOIdxEIK9NyC40Dlvr1WGvEVlqzqhFiR7bpeI44qJ+XrbUwDy/30VHv9264BLVwAMHltKynlt2/A33qcauCqH4bHaku71y+WuM2IHI7Ib/W6x0p/2GcxXqZ27pjcTqEphopQo7FJY+eDPFgxjXUcvhEPo/3r1dvbN8Gt24vSK8HhkVDv0YWgIjXgEp+CHxDdMwx6wQH2QpA5oR9Ajruf7tDUw9swDytGxNt45d8+z4dVHubiocKq0W53QOewXhuv1+jGraNjkgqw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(396003)(136003)(36840700001)(46966006)(6266002)(47076005)(6666004)(4326008)(8676002)(2906002)(107886003)(7636003)(82310400003)(7416002)(356005)(54906003)(83380400001)(110136005)(70206006)(921005)(82740400003)(66574015)(336012)(36860700001)(2616005)(5660300002)(26005)(478600001)(8936002)(36906005)(316002)(70586007)(42186006)(186003)(426003)(4744005)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:12:58.8820 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdbc18a-68dd-42e3-187c-08d8ce64d815
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB3993
Received-SPF: pass client-ip=40.107.223.60; envelope-from=saipava@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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

From: Joel Stanley <joel@jms.id.au>

The userdata size is derived from the file the user passes on the
command line, but we must take into account the boot areas.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/sd/sd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 55c1104..a2f39c9 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -658,6 +658,11 @@ static void sd_reset(DeviceState *dev)
     }
     size = sect << 9;
 
+    if (sd->emmc) {
+        unsigned int boot_capacity = sd->ext_csd[EXT_CSD_BOOT_MULT] << 17;
+        size -= boot_capacity * 2;
+    }
+
     sect = sd_addr_to_wpnum(size) + 1;
 
     sd->state = sd_idle_state;
-- 
2.7.4


