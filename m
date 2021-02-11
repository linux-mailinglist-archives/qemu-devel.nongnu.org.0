Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6AA318632
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:18:43 +0100 (CET)
Received: from localhost ([::1]:46606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7BS-0007Wy-Sf
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:18:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA760-0002kt-JT; Thu, 11 Feb 2021 03:13:06 -0500
Received: from mail-mw2nam08on2043.outbound.protection.outlook.com
 ([40.107.101.43]:54395 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lA75t-0004YX-HZ; Thu, 11 Feb 2021 03:13:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRu6y+6yqYsQRVhW9/kL5260goAtU5tmXLYCH5pDszNi8SPzBtVg3GSjffzwpnlap69OjFOIrJH9nJLJl/fTrMNVZLngSarjCYtG0LHdeKCM7Xm2vePP00skRIEB/A73FNYeY1VdOx0NxMSArrrltAeOF/vJcUamD8eTyzNMZwBAQHpaWKlwzR5+zI4Bf1r3Xto8RIYQKfKtm/Bbjb9yIFqvMoyzNoIunjdRJXAW0XyaPw8Mix/L7lV+QL7ZAUJjodjfN2+h0SMs1YwJPg+oP4yUSrR0rF4ZxIHWe5CxT4p5NhUHrH0YGnek0a3T5uCObAZs5ZXNRO08a4A61oanqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olQ+KWaTOdmYYxZqvp+1A8/OSAbMC4nU3TGGkseZmZo=;
 b=fi4Sc6Hcx6NvX8vVIFTeZ9vR5BS6IK3Pap3wlzDZnSaTi/xP/dId4d7LM9QlZPOvVhaW0jTHCtzqqN1xoBrG25Y6NVpkEfaRqZNk13DFsyHmDeUnsoc8QmMmplpaJrfKvUCxIbVZfPxLmh7d85J5Pr2yjAWmXrwdLYeYZK/Qb5bZ/8jDXztpTvbTh9+UqkHfAJ0C4LjC7KlQoMnyApKiFCm1cu6kZ4YxTBPlfrauBz31zAd0EnYbYabcl1wZp0PjentCu2ANVxLaAwcV1T1gIa6RycfYby+AmW3VHg+GY3r5lSi5p3JUauz/H/qxIBnViGycEBTgq6lIij4Pw8tYjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olQ+KWaTOdmYYxZqvp+1A8/OSAbMC4nU3TGGkseZmZo=;
 b=Kjre3pxagnTuF5OZIlp3bB2miVPTRlnGZyegnM457YDMkox5fikNUTQMuKuaBPAb2gywmvFYNYC3HatOrZUKm2cN0Wt3+i4HerrlLBMY45FNdx4Wdo10PwUcRqy+ivghCqfiLeiHXPZnCkUr6ZzSSsNjTfZg0/PxLcfvl+jkbVA=
Received: from MN2PR15CA0020.namprd15.prod.outlook.com (2603:10b6:208:1b4::33)
 by DM6PR02MB4233.namprd02.prod.outlook.com (2603:10b6:5:a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Thu, 11 Feb
 2021 08:12:54 +0000
Received: from BL2NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:1b4:cafe::8d) by MN2PR15CA0020.outlook.office365.com
 (2603:10b6:208:1b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Thu, 11 Feb 2021 08:12:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT063.mail.protection.outlook.com (10.152.77.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Thu, 11 Feb 2021 08:12:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 11 Feb 2021 00:12:49 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 11 Feb 2021 00:12:49 -0800
Received: from [10.140.6.35] (port=49674 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lA75l-0000Gw-2q; Thu, 11 Feb 2021 00:12:49 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 9EBC713C0653; Thu, 11 Feb 2021 13:48:11 +0530 (IST)
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
Subject: [RFC PATCH 04/15] sd: emmc: Update CMD1 definition for eMMC
Date: Thu, 11 Feb 2021 13:47:15 +0530
Message-ID: <1613031446-22154-5-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a16bba2-cbeb-4819-7fe2-08d8ce64d50d
X-MS-TrafficTypeDiagnostic: DM6PR02MB4233:
X-Microsoft-Antispam-PRVS: <DM6PR02MB42338B0B4F98B37DF8D8E5D8CA8C9@DM6PR02MB4233.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a+dInpWSSsTGP89w0pPxr3oI2uubqlUNORu7ZiXzqqdqrtwtIsbFtyUsU7inK5iW31AKOr38mALhhmqp0BasvLMyUHpXsEMCnpbIAm30WE4hfyvNiKC6OviCFzieP4VjMqFXYgudEMztr3yZLkdpc/3GtU2z7cXSCCBr5GwGCGiHernMmmzbv0HVkjv0p7xGFeClNV6MS/SX7gMc4v7q5NaKdgnX0e99drAqT9iRDh3v4YISuJKfN1T5iYEa98FBfgfPXvNqgch1akUNMFwpUpEFjFeZYwKK4ki4fgOxXrr/7fKAAQN02YXN7ifFf811sWVmaawX0KC44co7pYuP9biS8uHpaZENeEcLoyeYt5XKOjXSGpRFhx9sJ5Iq01HZ/nkXtR1whQq1GBh60BP7hjHPwcdg62MobAT9ZVvNrSjqnw6TYc8fFTtaBV/VZ6S89WctNCUyHwCqBPepr1xhhrAcqGX8InQRUR5rcaXpZMAVfmFFwraMibfTLWAiNMWc2TbMReaJcgCqd6yCSTXX1ADITRbeuiJ+DxWsdVSXkIh5lNqiWPBeO22PQbKR8Y8RaVmbQc9ImPziPa5ZmoINERZCZVoPhnbxKf0UqoZ3nQBaMB7PeUhvwcVVgRMr3imQ+e5Quq3nDG4n9t9KUsJ3/ot1gyH2i18VzlUFdiAYDG/8SAmk29ce74IPBY4+4/yBHl7oQS2wTFe0KxCPHg5/gA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(36840700001)(46966006)(107886003)(4744005)(316002)(42186006)(6266002)(26005)(8936002)(2616005)(7416002)(426003)(336012)(186003)(8676002)(36906005)(5660300002)(2906002)(54906003)(4326008)(110136005)(82740400003)(70586007)(70206006)(36756003)(921005)(7636003)(47076005)(478600001)(356005)(82310400003)(83380400001)(36860700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2021 08:12:53.7989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a16bba2-cbeb-4819-7fe2-08d8ce64d50d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4233
Received-SPF: pass client-ip=40.107.101.43; envelope-from=saipava@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add support to Power up the card and send response r3 in case of eMMC.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/sd/sd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 57fff89..e3738b2 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1033,8 +1033,16 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 1:	/* CMD1:   SEND_OP_CMD */
-        if (!sd->spi)
+        /* MMC: Powerup & send r3
+         * SD: send r1 in spi mode
+         */
+        if (sd->emmc) {
+            sd_ocr_powerup(sd);
+            return sd->state == sd_idle_state ?
+                   sd_r3 : sd_r0;
+        } else if (!sd->spi) {
             goto bad_cmd;
+        }
 
         sd->state = sd_transfer_state;
         return sd_r1;
-- 
2.7.4


