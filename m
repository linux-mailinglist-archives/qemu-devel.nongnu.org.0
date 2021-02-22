Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F03321207
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 09:31:22 +0100 (CET)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE6cj-0006XJ-CJ
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 03:31:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OF-0004iV-G5; Mon, 22 Feb 2021 03:16:23 -0500
Received: from mail-co1nam11on2063.outbound.protection.outlook.com
 ([40.107.220.63]:49921 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lE6OC-0001o4-Jl; Mon, 22 Feb 2021 03:16:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDLsrrdt3MB5KoX7mUdOAN/87oDBFwc8Lsek4QBsLhYgEVAhyvwPlz+dPpLTXfBffCzySoHJGyiT20ArhmCyza8nr4Tvo6XcXpYD02aN84Iu+YrqyGRT7Kig8Zdrm3Q7+xMyygmFw8OHwzXILz6p7Jyf6Vwr/pxI712eJQihzoP+u4Ixbt9JuRwYUsUc8Odf2Fo8AhMjUrtAgMFENLaNDuZbaNTEOXZQvgceVvuhqwg4JfeMjOV0Bd3kSwG6mSAcGIlXgNPEcJwYoMJEJZJraR0thPLqQc/MhQ4rYDB3HWtQayS3qEtKfkc0Png7fkLTCIErGJKcvyEsVoe9AYE8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bReCfou5wyjo9QA3gvSeJrzqiJLk3BT/gbk9q9Qwi8o=;
 b=EmkrI3Xi4hFpCHPUJJS+4ajiIdeBXhoA3kVEywXHJ30+FIDQt4C/bJSsGUOyHEk0CTMrHG2gVmcs+eDOxqeyYwwvYUBdoFu+qe1ECQYRdKvZ/cMQWdzTCPo7gd2gioDFt5RP//epwPTaUY6HnX8oHLNBYdwkNp9UMNmXUCxty3NwYAajuA42eO9kaN+siY9D2RNmgKv0wdCiL5Kd+Z9hFzPRMGTyEX0pjbFEVOWVYQcBZ/8jaShO7sOb97YF7QGz05V8ICX25VbnP1nYhAXDrlmpaRd1Kl/dCk3gIyRtDwxy0SdexfzdsTwik4H5Sy/EhKD28lUJ/UJwczl8IiJXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bReCfou5wyjo9QA3gvSeJrzqiJLk3BT/gbk9q9Qwi8o=;
 b=hvCDvIGNVRkUa/m4rUr6ekPWRmljeh5J74bf6J7IUQKWGKqEnYKdJrTZyJFYezqvghKbGuFzswWT31+xIGbOrMgKcwg5JUPYWLL2YZVCVfeMmBsHXPTf3i+U/GUlRA/zMiBCNa9HIDfEMwbofOEJgfs5nPmaMoVSI/hIKRlgAA8=
Received: from CY4PR18CA0064.namprd18.prod.outlook.com (2603:10b6:903:13f::26)
 by BYAPR02MB5414.namprd02.prod.outlook.com (2603:10b6:a03:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 08:16:16 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13f:cafe::2e) by CY4PR18CA0064.outlook.office365.com
 (2603:10b6:903:13f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 08:16:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT017.mail.protection.outlook.com (10.152.75.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 08:16:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 22 Feb 2021 00:16:00 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 22 Feb 2021 00:16:00 -0800
Received: from [10.140.6.35] (port=59044 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lE6Nr-000371-Up; Mon, 22 Feb 2021 00:16:00 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id EB0AB13C0A8B; Mon, 22 Feb 2021 13:50:57 +0530 (IST)
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
Subject: [PATCH v2 10/22] sd: emmc: support idle state in CMD2
Date: Mon, 22 Feb 2021 13:50:27 +0530
Message-ID: <1613982039-13861-11-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78d314f6-f31a-4e75-c915-08d8d70a207f
X-MS-TrafficTypeDiagnostic: BYAPR02MB5414:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5414E9B357B494FB13712ECECA819@BYAPR02MB5414.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O0y4OZxGHb8MVMPimFTGo7bBq0IVu8PId4Xe48BEocgr6Nvdnsi0oQdRs9XTFoOpd7U6kyrCthxhLs7B5Qi4e2nybFMEEvrR21S7EeiogO82N5SRbncKstnP2OmfEDtg+5KmzfTyYIdAkNm/4TR8XE0oN4R11u+SbCNmdY+1cteWr/LkA5H7Zs5Xsmh4WXou1Dlus47UzkS5GAr7Y3qukBds2QogySH3BQNV4JwZmsAAb4pnzWxTuUuZYnt8ObuqfEKybUn61SJLMY2PB4ldBlKn+/DQn8xnCCMJZHK+E1Zc8uerSv4SmyU0xtN0zR7qlYC64gJfd7MDjwVU9IqZifRnf1B/MlBW0Ahj/cHUqUor6nWSCVSFZPJkmhu5O2HqXqvGfJQy+6SYAQEImHy5x7WyLPC/3LS9BMLOztn7cPrgCpUJrN8jVP1RZU6OWA4hL26WDVy1wMhEI97IG4zj48CTuWcuobDWjK2Q2KFfenr4gnBGFi3RAxEupPW395F2LIi1MAAYdNxHsv9Hwtg6DR4Iskbs9JY5qHR34w4maErjqj1m30PH/ETZZJQruzr6E2meI5y0R/NnmHttGDbjw/m3W4dYj9PB2SQTrHtWOKxvRBLYe3SS87GXfQcQ7KpGu82s84PuX20OIuLpo6VRQ2iOXDzodSzO5grP+l1Ow/+lWfet08Vlc++bVQ400pkh1cARsLdWeFEzAaZqhTGUgw==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(46966006)(36840700001)(6266002)(70586007)(36860700001)(70206006)(6666004)(336012)(426003)(7416002)(54906003)(82310400003)(316002)(26005)(42186006)(8676002)(110136005)(4326008)(478600001)(107886003)(186003)(2616005)(7636003)(47076005)(36906005)(82740400003)(2906002)(83380400001)(5660300002)(356005)(4744005)(36756003)(921005)(8936002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 08:16:16.7175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d314f6-f31a-4e75-c915-08d8d70a207f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5414
Received-SPF: pass client-ip=40.107.220.63; envelope-from=saipava@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
index 8bc8d5d..ae5c5e8 100644
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


