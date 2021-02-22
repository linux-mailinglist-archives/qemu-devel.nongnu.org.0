Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FB332120E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:34:04 +0100 (CET)
Received: from localhost ([::1]:34058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6fL-0001ja-6D
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OH-0004oa-LM; Mon, 22 Feb 2021 03:16:25 -0500
Received: from mail-dm6nam10on2085.outbound.protection.outlook.com
 ([40.107.93.85]:43904 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OC-0001oF-Na; Mon, 22 Feb 2021 03:16:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cdy7t4aAP8D28CFh4oUQ3piErDy/zJFLHTg/BmD3dR1yW+6+neNYHBxP1pDDyyn0poF5YhLrVOnSO6RhgYAgHeTyN59p+oC1RiPmjjNvx4vmMCAtn3Kvj+eObt/5I+suY6cZb3PZWYq302S1C3opYTfUy1xMbf0pBFht1kx8c30m40QS0O+t46xr20yo5lf/mxkFc7bPWZ4ObiKT0jhlKU1JcrKgrCMsNCJV+5nC/tfnB80MV3hsXqSGufU1VMQbjVdJDHxHs6kSP4VyLwe63nUwhIMbd7fWGXvGjV04fk+BT/bbyAymprHyaQUOcYnPGE21v/XILmDz/NQX32vgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owCPV3kjQARbf1ccbOE1LxlZvmSn0BChFk9Xnbjeq7A=;
 b=ZkKE+72AbFE5dL9O81vSF8XGpQQyxF0LcyDLo4FcdbHKrDcSqUdyDL3rKQl2+c32GnEnT24rASb09v8ENtFgyQ1ultToRrCqXpNgzm8JaMDy5iv0kN5BTu6MbDLJ3YN9qkFynIPEwYaZWnGFPXJ5kDf4o0mzDNmvojPJxZmblcw15LHaIVE9Dy5L7ozaQRgo1Aj22viSxeswEvYydf5+BSd3yl7sdJtFB1eAVcpTMiRFSffH9+esyXplDiSDL3KKYLttWatNRJC3mj7snoUz0837yHSxsvsialY8fU0juLsTbRsI5HCIxQGGva2HuKuKSDj9c/DiMl4K9TH3ehzD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owCPV3kjQARbf1ccbOE1LxlZvmSn0BChFk9Xnbjeq7A=;
 b=Sk9k4tj2mhrVzJ4a8WHUVdRSqR4BO5ipKugWbG+xpcDBbvxnPd6k/tJMTVeDEioHwCG3OfoAIe1N/71WwczvPKh+dT2vF/gCO3b1JQ2uCw62b1k45fM4/1Pq3Kj0EElHxcq7DhrGxZaxodkcQD4upT3hjle5fEtE2ltwGE23q9k=
Received: from DM3PR14CA0133.namprd14.prod.outlook.com (2603:10b6:0:53::17) by
 BY5PR02MB6417.namprd02.prod.outlook.com (2603:10b6:a03:1fe::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.34; Mon, 22 Feb
 2021 08:16:16 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:0:53:cafe::66) by DM3PR14CA0133.outlook.office365.com
 (2603:10b6:0:53::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:00 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59040 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nr-0004M3-UI; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id DC01413C0A77; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
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
Subject: [PATCH v2 08/22] sd: emmc: Dont not update CARD_CAPACITY for eMMC
 cards
Date: Mon, 22 Feb 2021 13:50:25 +0530
Message-ID: <1613982039-13861-9-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ddd270c-3a84-4b35-3981-08d8d70a2036
X-MS-TrafficTypeDiagnostic: BY5PR02MB6417:
X-Microsoft-Antispam-PRVS: <BY5PR02MB641788CCC103F04D5ECD5EAACA819@BY5PR02MB6417.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yC43w+hdHo8pUvSvSdRWVKUJR8nG7AFAVVPRSokJrheRZ0XGy+zuol6JP2+sxne+9kTN0sEIfDFPCFGgJnALGP05o7GiS6paLi5G4C7yRMaVcaZnvzXntfIc/WO2U70KYuYrPOnKyF6fm7JH3JwuhJZTfWb9nPBMp9JuMNg2auVRF+nn7hm1qIcYK6oAfT5+hkaxH8dlcyrYTpvgQSciWxj/wMxLHdruLJnMJcECKnUy5iIpXF0OUImV4Bz22rH2B4Dqm91LckB20OEYqDn1X7EptD6vtlUUdtfcKTp5GjOWzE9dT/eo/r+J7N/BB39f3zrRzj6ngCtsFqNAdeiEdvPJFEANmrkD7dmXsRm0V4ikyb9iC+1sApE1PUSIokaAHAgGV3sh0oEDagMDbEwwm3pYeLsvYk6cQ/Hlc0IoYJiI77crGHQ26GxFUE90RtCkiiVgPlISVDUm6LAvqO+6pbv8QY3IhMH/RDLMGsIcispjCsVwaoTyTIsxsJg8CcfuzFmBM23O1v3OzL9iaVjR89nMu0362b+wzs7/+s8vcbKr/6dF6H0Yd+eGXGNWgEWzm39wjFniOnyqZnQtf1Ikg3ts07DbQu0lU7QnnTfr9YYz88h6n+jAF6GmzNhD3yNjbEYXHUoM0GHDTxlg/RZmKGj0GcZgre+zciW8+ZBnd1oPrLvfpwNCSxoH/HwYy3yBn5rjhijIoOWjpyC0HRAeiiArsilMH93GlOCbbfA9wwc=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(136003)(346002)(396003)(36840700001)(46966006)(36756003)(83380400001)(26005)(47076005)(356005)(54906003)(5660300002)(6266002)(7416002)(36906005)(4744005)(921005)(107886003)(110136005)(8936002)(4326008)(6666004)(2616005)(70586007)(316002)(186003)(336012)(70206006)(426003)(478600001)(36860700001)(7636003)(82740400003)(8676002)(82310400003)(2906002)(42186006)(102446001)(192303002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:16.2354 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddd270c-3a84-4b35-3981-08d8d70a2036
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6417
Received-SPF: pass client-ip=40.107.93.85; envelope-from=saipava@xilinx.com;
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

OCR.CARD_CAPACITY field is only valid for sd cards, So skip it for eMMC.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/sd/sd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index a4f93b5..9835f52 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -324,7 +324,8 @@ static void sd_ocr_powerup(void *opaque)
     /* card power-up OK */
     sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
 
-    if (sd->size > SDSC_MAX_CAPACITY) {
+    /* eMMC supports only Byte mode */
+    if (!sd->emmc && sd->size > SDSC_MAX_CAPACITY) {
         sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
     }
 }
-- 
2.7.4


