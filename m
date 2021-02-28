Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F2D32743D
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:45:15 +0100 (CET)
Received: from localhost ([::1]:53078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGS0A-00040Y-QS
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:45:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRlC-0000HA-1o; Sun, 28 Feb 2021 14:29:46 -0500
Received: from mail-bn7nam10on2055.outbound.protection.outlook.com
 ([40.107.92.55]:41166 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRl4-0003Eq-0d; Sun, 28 Feb 2021 14:29:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp11Uq1jTvI2Tb/DNn+M5UYqcsreFr4Dy5Niq8+yNsaISZnZQtVJ1M9t6lPmuiErWaB5e0zY0e55wrLR/GLL2K6AjkaO/pYdJcVuwpESKbY4mur1AZ/azfONi7jKbT+Goh6t7ncwZPhR+WgC/vAddplZrSZYyk4HJk4TukrTA3cd64kzJo2ShBODvCRdA0Da7uSuHEjMQ0R6uh25J+ZTK9+gu7mp/l/goG7m2B14IfnTEK2eGs5pqcVIbKxkyYa9MXCZ9qwgQ55CfxeA5Nnd1azqCEGc34lf1Vv251NQopi/b6k+6dIncOOj55wQuAll35DSByvJmt3Y0C2mmfafsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONaUjwyttncTJFMFFQQWpbnFlFdnI6o3ClKeDqPg8fo=;
 b=AJh2VoA4jY60Q0vc5/n+hbg6FK9A18LlpfV37sbGiuBrcjdw/N82sax3KaZVKceV1PjHc2AE346Dg8jJjdFaP4RpTZI85xubyveusqrSGGHqSDpHaNbLHQVX3OsMLmJ4AypPeRtkW4lGWDVDHT0/bM8G+dwfshGyhxruUM+ZZSKFCPSzXMA3CUUZ87WRZOe5/dfkL0yCpgTsMPXu68736/N4XQFW3KC5nSpwKgFGxj4DznWmaZmKM5l7Y3TkiZs/DSsiDW9D/LlExRkZWmD9RvvZEahFc65SW3aBOkgaEFrdg2TpVxdxRa5A2nsuWub9nvkarRVMjCdz7RepvusY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONaUjwyttncTJFMFFQQWpbnFlFdnI6o3ClKeDqPg8fo=;
 b=gvC3+ppYxjUFo0n2+hngxryVR2lPlq28yS3OyzoBLSxTUyyrVSFEl0NRpsIBe90GJH1G68ZB+8IEn8zP6I2RaWrddJ4xjfJ3SYLXXLqk5Xn2sT6CeD05pUXelUGIp/xm93hNrtZk92KOo7fahS6tKCaEoqdjcUuL8yJgFqxq6Ec=
Received: from CY4PR03CA0010.namprd03.prod.outlook.com (2603:10b6:903:33::20)
 by SN6PR02MB5648.namprd02.prod.outlook.com (2603:10b6:805:e8::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Sun, 28 Feb
 2021 19:29:33 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::fe) by CY4PR03CA0010.outlook.office365.com
 (2603:10b6:903:33::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:33 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:18 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:18 -0800
Received: from [10.140.6.35] (port=57766 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkk-0008Aw-3O; Sun, 28 Feb 2021 11:29:18 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id C044813C0AD2; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 16/21] sd: emmc: Support boot area in emmc image
Date: Mon, 1 Mar 2021 01:03:22 +0530
Message-ID: <1614540807-30686-17-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1869b37-a5e3-44b6-6e27-08d8dc1f2d53
X-MS-TrafficTypeDiagnostic: SN6PR02MB5648:
X-Microsoft-Antispam-PRVS: <SN6PR02MB564814B33F9841A1775FD064CA9B9@SN6PR02MB5648.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ggaQy71QIKWUKtH3uKeL0cBHcY5HQVs5QxWW+SJ5u2G8OdXh/CUWaWehVO8BzT/WPuPJ4uhrkwYxpp9cOdPFCVusLEHVPJGlHnzroohyfRVc7+G+OWZB6J14vIc+ziNWIMVg2rbmifig3NdZy4/3/2YRat7hKzEOmDiI/YDWw9aO9k3tnSAIh3iM9evNBF7fCiX/Bd14DZMjzFaEYs8IGUDckEJHuBcuO/bs7l9+MSOmMXxVShoqhhQae7mcoZ5WAhzarb9cT50hshgQFkxBlps+lo9GjcZ49zpFs83GyPR02Vgdh/X3/0YUBqi15zaFHLwrlKMwjaKkuQG/aNme/qoMooDb3wvhRZh4WFoifcnUiy8bKrfryA70qv6vAaYzwRzP20wFiLq4rcKFkmGYy9HBErtLUxqfHT9DtjPtkw9JMAP9dvvyRyf9379S5EDl9uFl4iixkshWOhoCVIMsCDOuXg9uhWNYtxi4EIEsfdhL0MWglJ4JsBGjYEaXp5cE/F1kJ3+eK7tXLdfg6AZKqV2rYqXfKILuixD+v4OhEdM3s7S1yUoFb5YVoRsSqi/8Um2FcwGcOUai2jvWdekBT1ORVta7pfiXhEYfLcU4QUk3oSojVoCSKP2pJ7R6hkmkbLPYOusO0VxdxadwoB3Ugb0NDYYLxxJjOWbJu4AL4anBSNipTPkAoNainoQSfYkPyQt8oj8dPH6d+Xsynd1eLw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(136003)(346002)(46966006)(36840700001)(36756003)(186003)(336012)(107886003)(4326008)(426003)(66574015)(2616005)(5660300002)(82740400003)(26005)(47076005)(36860700001)(356005)(7636003)(70586007)(70206006)(921005)(478600001)(6266002)(8936002)(8676002)(54906003)(83380400001)(82310400003)(6666004)(36906005)(110136005)(7416002)(2906002)(42186006)(316002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:33.4834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1869b37-a5e3-44b6-6e27-08d8dc1f2d53
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5648
Received-SPF: pass client-ip=40.107.92.55; envelope-from=saipava@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

This assumes a specially constructued image:

  dd if=/dev/zero of=mmc-bootarea.img count=2 bs=1M
  dd if=u-boot-spl.bin of=mmc-bootarea.img conv=notrunc
  dd if=u-boot.bin of=mmc-bootarea.img conv=notrunc count=64 bs=1K
  cat mmc-bootarea.img obmc-phosphor-image.wic > mmc.img
  truncate --size 16GB mmc.img
  truncate --size 128MB mmc-bootarea.img

Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: - changes on the definition names ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[spb: use data_start property to access right emmc partition,
      Clean up PARTITION_ENABLE support as incomplete,
      Fix commit message to be generic.]
Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
---
 hw/sd/sd.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 08b77ad..d311477 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1044,6 +1044,34 @@ static void sd_lock_command(SDState *sd)
         sd->card_status &= ~CARD_IS_LOCKED;
 }
 
+/*
+ * This requires a disk image that has two boot partitions inserted at the
+ * beginning of it. The size of the boot partitions are configured in the
+ * ext_csd structure, which is hardcoded in qemu. They are currently set to
+ * 1MB each.
+ */
+static uint32_t sd_bootpart_offset(SDState *sd)
+{
+    unsigned int access = sd->ext_csd[EXT_CSD_PART_CONFIG] &
+        EXT_CSD_PART_CONFIG_ACC_MASK;
+    unsigned int boot_capacity = sd->ext_csd[EXT_CSD_BOOT_MULT] << 17;
+
+    if (!sd->emmc) {
+        return 0;
+    }
+
+    switch (access) {
+    case EXT_CSD_PART_CONFIG_ACC_DEFAULT:
+        return boot_capacity * 2;
+    case EXT_CSD_PART_CONFIG_ACC_BOOT0:
+        return 0;
+    case EXT_CSD_PART_CONFIG_ACC_BOOT0 + 1:
+        return boot_capacity * 1;
+    default:
+         g_assert_not_reached();
+    }
+}
+
 static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
 {
     uint32_t rca = 0x0000;
@@ -1359,6 +1387,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_sendingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
@@ -1378,6 +1409,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_sendingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
@@ -1434,6 +1468,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_receivingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
@@ -1464,6 +1501,9 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
                 return sd_r1;
             }
 
+            if (sd->emmc) {
+                addr += sd_bootpart_offset(sd);
+            }
             sd->state = sd_receivingdata_state;
             sd->data_start = addr;
             sd->data_offset = 0;
-- 
2.7.4


