Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C252327421
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 20:32:36 +0100 (CET)
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGRnv-0002IX-05
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 14:32:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkx-0008S4-8S; Sun, 28 Feb 2021 14:29:31 -0500
Received: from mail-eopbgr680043.outbound.protection.outlook.com
 ([40.107.68.43]:30466 helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lGRkp-00035Q-79; Sun, 28 Feb 2021 14:29:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnLyJubD9f1vQshG2nxP9o0ej8Cdslbe6B5eqJy2VJIA3Hc+L+IB49UEU1WiKtpivylr477y/t0WBnjZitviQG/YSHOsjSvqMOuDIIowd3loiwaFm7DBefy26kAAs09yOYbOUL78HfdWxMNBdrVq2k61H7sOpQk07QeaZ0n1TvK+5L3MWLX8nYfZcJ+SMkbZXqYmw+oog/enzdeY6JFp/rRFgeqDDkdZ4gtvHcpkfj9+NpicfiNAFXC50Mgf4TjqrmgdwbYHrM2K7TdRLPYAUIL5QJWpf0JoblKzGptRCI/WEqTJu7/XwfuiGtGEgQXcmkxpyuj8AnXxh2MQSF0OwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcTdhq5/ZjbE4yLIDkftIyqLFevvx3Q4L90Zglaihvk=;
 b=IqAtpByaL9EMCXfN+RaXcDKaGe7JUeDt2Uo8hDUiAGLTEwAKG1BQSZPQ6nviBcrgl4fXYuMAhrLmdbgv3QZD811YJ9qDWn74NNse6rRbvXwuos2b58xz6FHFe+X6B+nZvSgAZuvDN+I4sgdXa3NZNrgQy2A4begadpVM/XkHeugDbtKdcGHNuQcqF+6fAtXbL9oMU4y55xrCB7X//TIXEp0s625m56c22FAfffbozhWWVxoNkF33X/0fHRIUb8emK9TS4KV3JM+BAPPN+uMPPZtQ3w1TxAvfMF7YRhG+a93DECiw/VdV70ZlKxCUrT85UD23y7iNMtl9qVDKcxqvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=chromium.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcTdhq5/ZjbE4yLIDkftIyqLFevvx3Q4L90Zglaihvk=;
 b=NPEGypQJ9u+r8lzFzEBbQFpD3vvz7ZHPk620iHeJRNFynFQEJuM8iW0zQoVeDIPEnpEYfcnZV+iuSCUSDroZF6W71NJ+/QJ3w6icDCGhUrFbner8pLHDp2mrF91hE/hZWT9FT8LIxPwYjOOIbDlgP4aMMu2iJLuCIrqcTVpsxMI=
Received: from CY4PR20CA0034.namprd20.prod.outlook.com (2603:10b6:903:cb::20)
 by DM6PR02MB5740.namprd02.prod.outlook.com (2603:10b6:5:159::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.26; Sun, 28 Feb
 2021 19:29:18 +0000
Received: from CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:cb:cafe::a1) by CY4PR20CA0034.outlook.office365.com
 (2603:10b6:903:cb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Sun, 28 Feb 2021 19:29:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT025.mail.protection.outlook.com (10.152.75.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3890.19 via Frontend Transport; Sun, 28 Feb 2021 19:29:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 28 Feb 2021 11:29:17 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 28 Feb 2021 11:29:17 -0800
Received: from [10.140.6.35] (port=57772 helo=xhdsaipava40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <sai.pavan.boddu@xilinx.com>)
 id 1lGRkj-0003MO-FE; Sun, 28 Feb 2021 11:29:17 -0800
Received: by xhdsaipava40.xilinx.com (Postfix, from userid 14131)
 id 8BD8713C0A85; Mon,  1 Mar 2021 01:04:01 +0530 (IST)
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
Subject: [PATCH v3 09/21] sd: emmc: Update CMD1 definition for eMMC
Date: Mon, 1 Mar 2021 01:03:15 +0530
Message-ID: <1614540807-30686-10-git-send-email-sai.pavan.boddu@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
References: <1614540807-30686-1-git-send-email-sai.pavan.boddu@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f1306c1-579f-410c-ee7a-08d8dc1f2458
X-MS-TrafficTypeDiagnostic: DM6PR02MB5740:
X-Microsoft-Antispam-PRVS: <DM6PR02MB57409AFB64A4F25EED2DB448CA9B9@DM6PR02MB5740.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wtqXd1dOSScRoT2OoZ7hW31tL3pv1wUECh5YSbG6W81PFc+3y/l5x7T5G4JWwMVuuSPiKG1USmFyP1Lq1NG1eQJ/53GLUQDc7U/eGEMBFPMzRGaCDB3TgtNI3awq5eAV9NoRFMPDEp09UjIRQ8arFWWF8gLvJPztlNuWrHlVb+0da5lU31aP3OfdK81TzfbzR2ykJ5ektj1yD0AqqBRXMMMmp2emLO2hdhIAGWMvAUYOC0+8wrq7APpc7WzsBD2AtzbE+aim1zjW3L3jhZ5V1AjMS/JKyIoIwgyrp5k8strzY8+U+2XpYnu8RW3PdP0VTLVWab4z3rNN69ezZxRMc6/PZb+RzuDUIlRwYTgD4EiciGn0v5zDIpraCD1Ym9GYGm87+LyjWTFRIEwUBJoRUPYUqc/pkHhtrcjnFfAEqVYpfVIS4CWkpVyZ6G9XqJYiAhXRA9O5kXvw20NOfV9hO2p6zXQtFKanUwscp0fAo6WXzVAm4pJL9SbM54k6wjpIb5pAjtZWODIpG6zAO1puqBllboYbHPLAryFwreoTHB0QObrlDgE05gZwRNeaVvxuXZ3l7CpkEVgbTolk8lZtPqX+EfoOEX2WdzzaFHEVt9HEiS6qBaRb1Fv58cJ8mL6Ur7uFYGWyM3/YMZM/EFjCI/DfBGlZjVmPOj6lOySbFDYz+TZY2wa14bABLROO52mGXVWrG4MruybQ9m+Xo6sqzQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(46966006)(36840700001)(82740400003)(83380400001)(356005)(426003)(110136005)(47076005)(82310400003)(26005)(70586007)(6266002)(42186006)(336012)(4744005)(107886003)(186003)(54906003)(70206006)(2906002)(5660300002)(36860700001)(2616005)(7636003)(36906005)(6666004)(316002)(921005)(8936002)(36756003)(8676002)(7416002)(478600001)(4326008)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2021 19:29:18.4200 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1306c1-579f-410c-ee7a-08d8dc1f2458
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5740
Received-SPF: pass client-ip=40.107.68.43; envelope-from=saipava@xilinx.com;
 helo=NAM04-BN3-obe.outbound.protection.outlook.com
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

Add support to Power up the card and send response r3 in case of eMMC.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/sd/sd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 2612135..054ad1e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1041,8 +1041,16 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
         break;
 
     case 1: /* CMD1:   SEND_OP_CMD */
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


