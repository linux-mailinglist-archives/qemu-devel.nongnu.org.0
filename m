Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB6532742D
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:37:43 +0100 (CET)
Received: from localhost ([::1]:54478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRss-0001KB-Qm
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl1-0008W4-HZ; Sun, 28 Feb 2021 14:29:35 -0500
Received: from mail-eopbgr760082.outbound.protection.outlook.com
 ([40.107.76.82]:62966 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkw-0003Ah-BJ; Sun, 28 Feb 2021 14:29:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJ7JA3K+2HcBr0nGpZUMK11SkVRXhEox/ILMhf0pydKeRNsMb4mvQ6L9KJuu6aRxmsBoHTRcUaXcpb33mybkLyad2zLkZ/QyWuKFvW5Qi3m2IfjjyPxbRUyGWUmTbyBlvk6q4vVKKXVZ088OneGTUp4AOAiN2KS0j+GJRMHu4eo0+qRefqr9x8ytFJRF7us/kmTCLA5yiFRR1+bOt+ITcY870/6S7PfXMc0LkZuXCfe8u+gulUUQt2cUEf81v5qBWUHXqSEHRtm9EYFNAw+m7CbsQwQTF0kIQAkE9k1BeJD8hgY5UTz6dM13yDUdj0NdC9R2noK8TgYRClMqqJQr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bexQYWFQDKgVeKFcENO51wp6aYgVP9K4I8K1x1iMD+8=;
 b=d8e57URZm2Zu8t3PRU1nVBKZqAUv3/PJitGqh4g5zfhC7V9aeSf39QUzR5dRCNWwAYJlLUuEATnRNC26DFLxQMsROpxGhEl5GxDPprekGRqUO+bNCrEELHfTszGzWjF7aaWoQ4UfAOk3z6wBugtNV5Kyl4q82yzEuugYyCtV9Bjj9DFcBRWP6LFxLyspQdLI9Wu5oXGxJxDCDxnGealNDzrm9lRU6D32rZeBBP2DKOGk+ruda6ogucln8EyW/PBpIroGBvMKnUr5aqfjDIt+T4nR6MBiah5Y59b7b/xUMATT4anlsF883OF7g3qvvA/47pvkIZVnqyS2/smVSlsW3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bexQYWFQDKgVeKFcENO51wp6aYgVP9K4I8K1x1iMD+8=;
 b=e7fxeC7kR7FJ9UWG6EE207E1M3pLTLsBXDEGbOsUGWMFZdZEelR9nQ3rkMVQEF4yQkG7nOtLVp4JEWtvBvMDY0pQW5wspGJT9EUyKyTW1qj3HK1JEXq1MIIcLlSy30AMduYBJ3VjXbiw4iirlZadbvsdSo46MxQpftuBK8O6MlE=
Received: from CY4PR13CA0081.namprd13.prod.outlook.com (2603:10b6:903:152::19)
 by MWHPR02MB3167.namprd02.prod.outlook.com (2603:10b6:301:6a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sun, 28 Feb
 2021 19:29:25 +0000
Received: from CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:152:cafe::b8) by CY4PR13CA0081.outlook.office365.com
 (2603:10b6:903:152::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT051.mail.protection.outlook.com (10.152.74.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:18 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:18 -0800
Received: from [10.140.6.35] (port=57780 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkj-0003MR-Sd; Sun, 28 Feb 2021 11:29:18 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id A982313C0AB5; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 13/21] sd: emmc: Make ACMD41 illegal for mmc
Date: Mon, 1 Mar 2021 01:03:19 +0530
Message-ID: <1614540807-30686-14-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18fcd6e1-152c-4276-c856-08d8dc1f2871
X-MS-TrafficTypeDiagnostic: MWHPR02MB3167:
X-Microsoft-Antispam-PRVS: <MWHPR02MB316765DA15C0706176E26049CA9B9@MWHPR02MB3167.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gs7h/KtbUuUd/qRHyXAoj457Fr9iyxtllGl0Noz3V8q+7PED9d1RiEOtOwkiiMijNhjXC1/4JBFzRSf5is+G4G1Ck/kILNUBuHiEFZovI9kSzu/uKrrewicvBXetSAeNtsrwKCQpaMNRq7O+5Ow2XXrLEiSN5CTXHMbvC5yBKsSEbFlDTjo/DjcV4c+MGJYlC5gmhf8F19NBBVN3t7xipVUjvkLkXP2/E5ndi3gsfHNwMwzGXNvUJifRlz1n/zSfyJ3gPUnXKCVrbjSH+3KswYcO/e9RiRuuv+BeJi0lBh+XYTtFEY7SVupWiLDt9dR4VDkIBc3ShMRoJuieZEGI8452RghtD1WVENbnyS0SCshrtE6YoGarsdIP81RYcEXB2lha71rDINwjw8oJzS0hXX2T9ccuq0U4flhHOo2o/L3kLAMLptx51Int6erhxQiIOvMg9HGq4PcVVkLfQn4GK3LGlWTzCfOXp34+dPqvzQmaZcScq0PEnDlwM/+/AJ15luRtQfz8LLM2ToQxpIEyHfxxKjkg7wa8sD/eZ4ekBIuyTBi//aXsPdqntLAAgK3wE+8KkHFyWJh99sfEdAGIuy1xEDxwdgbwB7GlgKchKSA+sLl8adJ2MgOAkHW+0zzVK4VrMX8HBDD4XC3LHvp6OseUiZI+7x0NpMhvLQjCBRjFREz3y+UEIzDHo6L48dUibmoaIUryv87oDWIUlhOIfA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(136003)(396003)(376002)(46966006)(36840700001)(2616005)(26005)(70206006)(47076005)(5660300002)(70586007)(186003)(8936002)(426003)(4744005)(336012)(6666004)(36860700001)(4326008)(8676002)(921005)(478600001)(82740400003)(7416002)(82310400003)(110136005)(54906003)(36906005)(316002)(42186006)(2906002)(36756003)(356005)(7636003)(107886003)(6266002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:25.2917 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fcd6e1-152c-4276-c856-08d8dc1f2871
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3167
Received-SPF: pass client-ip=40.107.76.82; envelope-from=saipava@xilinx.com;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
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

ACMD41 is not applicable for eMMC.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 174c28e..09c1222 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1737,6 +1737,9 @@ static sd_rsp_type_t sd_app_command(SDState *sd,
         break;
 
     case 41:    /* ACMD41: SD_APP_OP_COND */
+        if (sd->emmc) {
+            break;
+        }
         if (sd->spi) {
             /* SEND_OP_CMD */
             sd->state = sd_transfer_state;
-- 
2.7.4


