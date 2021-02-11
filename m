Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5A2318635
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:18:56 +0100 (CET)
Received: from localhost ([::1]:47340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7Bf-0007pG-2Y
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76E-0002q0-Of; Thu, 11 Feb 2021 03:13:19 -0500
Received: from mail-bn8nam12on2066.outbound.protection.outlook.com
 ([40.107.237.66]:9402 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA76C-0004e9-Kr; Thu, 11 Feb 2021 03:13:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5bGjGwoAlwHIgTxsni8+YuDKmmAlMPMGSD+zYGIWRBJGlF2BEH5XpekVOekA1aXxYin6ZNiqcYQpkHjluOlFM5rro2rF3bmkuNdkPm0kI3twX4717/QR8qLxTZ5JUQhR+AuPU/tg3NY8LQTjtdKgy6oijWEZ8O4eCPSOgpuW4NXwvO0RgD1uMJSVoefNkarHMwu8aXC7q6q+G+GnKWen028yArL3caWvKaGhagNhEULFCniNMpNgNV8R/T+9N95u/Aoq3Cv7ih7ljLFb01agqAz/OL3Wph1XTGQxWSazha7LMCdTkvcaV1HHwJqazrFdMIo/ZUP+j6b7dmbG2D7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvmZRIujVJxZWrSkLjQLkhTpXdpAeDzz6e5Vz2ef9vs=;
 b=VpvHL40XdWQjOQlFkLhroVMMA8eZbdA2OARWBNofIXWb3g6Cj+JzA7RTOS3wpIRFRY9J6GYoxgyQyPohbPI1jJXVNq7VfrXqizyPEl12e9y/0Pj39/BAIy3Mc9bymSyDSskEVsNNK0bD1iyR+4qZS5YdEUIoN+/VA/MrUJQ4snQMkn5JhyvLUjy/GrmpBGVOMJWGfhaBR0FyQb29cJ29Y9XUkKwxoOtnT6sRjj08eF9Bf1SzFxyk8QpwDBeh9gRNl+dwpgnRPCwEy7em1zONJLu0kgvMgxXl0BRottF8/J8ij3rHPEKQtcleT2yZMwncMXtP96XrKQR8nAFVWj0rBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvmZRIujVJxZWrSkLjQLkhTpXdpAeDzz6e5Vz2ef9vs=;
 b=IvkkOQhOFSbgBhdfVKm8fztWXERU3tV+SyfzwyB52dFUtznyYHiUMUKqGBcKocNjDscJwLGDQgbp/BJM/aF3HEmy/R6jgORHuu1L9gOIK/6T6u+rQieVEqXOGVSbUHdawRXFqp7HIv4ruZfuLELfKtvmDMbr7Jd3xQ9qfcFUlYk=
Received: from BL0PR0102CA0022.prod.exchangelabs.com (2603:10b6:207:18::35) by
 DM6PR02MB5289.namprd02.prod.outlook.com (2603:10b6:5:43::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.20; Thu, 11 Feb 2021 08:13:12 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:207:18:cafe::1b) by BL0PR0102CA0022.outlook.office365.com
 (2603:10b6:207:18::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.28 via Frontend
 Transport; Thu, 11 Feb 2021 08:13:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:13:12 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:49 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:49 -0800
Received: from [10.140.6.35] (port=49672 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75l-0000QC-AS; Thu, 11 Feb 2021 00:12:49 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 59B5813C063C; Thu, 11 Feb 2021 13:48:12 +0530 (IST)
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
Subject: [RFC PATCH 05/15] sd: emmc: support idle state in CMD2
Date: Thu, 11 Feb 2021 13:47:16 +0530
Message-ID: <1613031446-22154-6-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 574ad00b-ddc0-47d6-ec98-08d8ce64dffd
X-MS-TrafficTypeDiagnostic: DM6PR02MB5289:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5289D93D4DB12A1189ECB42DCA8C9@DM6PR02MB5289.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHVgiUXa30NXcu4O69QnowUIF7Qnh8k9spgnvg+QFHGEIAnmfd4pOqOHxQxckoUuC7ENwgJTLXIquff/FScIKsecyKRd/A3rZKZL56KPdN42tukrf+dHbV2EeYB9u9HnHZCh64e1jEyTziccZ50WzsmErX3wQIOArZ0I4KutMYQFOfxh0n+x45f/mvkrpPUf9jHcMlX3Ci2zQF/1xBsQz9LdESqBzm72+msktleMmFgH0aPCb0OaOyQ/bFmBNIcUcJ2S0cGCsGrbLkGwKDbxs73gdqXBpWm9i+S+nqI8YHbnMGmT9Gmyq4WcKa+Xc3EE8JReLE86ztUJaACSD9/jFNvLQ0JCnv2om+wd7PwyrXg3yoNEklwizaNkjeWBFn7kFA+6j3ziUkUGveNB9ZxvpxSv7247qXOlbXzmBT6vQzv37kUvG0HwuvCBaAQOMJa0gHs6hcKnKS02LJzI82LL2UDE/Q8HbA2lPl6ZZ81PPOSzGCClG4h90v/JDN26DOFsW0lzZ28BRoIYENB5e1AtELXgVjyoAkjsV2bUahcwMS0bYa2FlRLxbslwLQNC5MBryUigy+V4zZUF86dsHDpLCcliCLhp3t5zd0tYmFVivM0tCpES3ZYxQmAFknSpreaL0bbyUZ/sFCZAOwGq361sSpvuLrkueBdG3CtgTJBU/19CGRF4RRG3LQ8TdZ1bN0dnwlBZ7VLKaHtHUudCp2XMhA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(36840700001)(46966006)(316002)(5660300002)(36756003)(42186006)(36860700001)(336012)(7416002)(83380400001)(36906005)(186003)(8936002)(26005)(47076005)(82740400003)(426003)(2906002)(478600001)(107886003)(4326008)(82310400003)(110136005)(7636003)(921005)(8676002)(70586007)(4744005)(356005)(6266002)(54906003)(70206006)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:13:12.1537 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 574ad00b-ddc0-47d6-ec98-08d8ce64dffd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5289
Received-SPF: pass client-ip=40.107.237.66; envelope-from=saipava@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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
---
 hw/sd/sd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index e3738b2..69289e0 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1051,6 +1051,10 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
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


