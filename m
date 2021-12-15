Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1731474FB6
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:59:08 +0100 (CET)
Received: from localhost ([::1]:39404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIdP-0002hX-Pp
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:59:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHzx-0006Ix-ON; Tue, 14 Dec 2021 19:18:21 -0500
Received: from mail-dm6nam10on2083.outbound.protection.outlook.com
 ([40.107.93.83]:9920 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHzv-0006VW-Kr; Tue, 14 Dec 2021 19:18:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ohc4uEspkM2YumEa6nvZHafyIHQD6aRabU881gAkcMKb60GawXdsmHZlegZ2w6mMfUMIjfYGHL6MBJfijk2jN2TEGGS+uIUqOSEfvza+bWb6xsxyp8PPkul5/hfKGz9/SwNZpgoaz6hzt8CqvPEUvsQiHSGARh3chQO7Rkzf62Gj0fK/j4u5HeFbA8rf3brfVcObC6/WcXdoUtfJyh+0RRR8p8IGbzRIjjKPaYHXUAsRBjkKojXn5t1ug28Kcx17zMBa3ar2GrY292scr8v1bVfCx7YQ+n9AXj8EnCxH2SdxM3CW+Resu07xyc1wKITFWPsSQsNn7rE3hCpHNI0Gig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2THFWeCphuhca0DVKHmnf1l00C5TfItgv6l7x7WYNXg=;
 b=cZzLjXFx1wTjaghn1RXLXY6FOAQi01mQwIcJcNDOEBfKqixPUORqslEbqDGC8MorNCnjGTclDEK2ACiiwfdTAjqVYkm2BkCMbepwtaA8SEbyC1mFYgoRzB9dyEVlC9jHhbnJ31Oks83/NiXA25dzdy6nKXkFLHkQ2qT0ARRNRGiCQDNr/izerrie9WV4Z3bNmVG2FgwH2Mpzak3/DSCTdjCb/PqrYwv0lXi3BKeqG+6SC2Z/Q+SZEmB4isM9p/obLRW9FNv0ziHo625eb5Tf6W+Uj1zZkC5XV9buCMEvfsGDlsDpstPk1Cu2T3OB95ZZnVSr8ZO9MG1Y5IuKQTrDXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2THFWeCphuhca0DVKHmnf1l00C5TfItgv6l7x7WYNXg=;
 b=RqFF99X9t2s5eDyQQBD23SFBvTEYLOAtFb0KVyypMeK1y7ynFs7eKRWevnV5ziEdT7La0vovyomhB/qQWgXsyh/MgIFDRvt3yYzQsywRKbgSvdxU5jZ+jKT5ysACnOFFQhZqZDTfi1NvhHITEpztofbwivPgr5WqdLA91XHoiFE=
Received: from BN6PR16CA0033.namprd16.prod.outlook.com (2603:10b6:405:14::19)
 by BY5PR12MB4950.namprd12.prod.outlook.com (2603:10b6:a03:1d9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 00:18:15 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:14:cafe::fe) by BN6PR16CA0033.outlook.office365.com
 (2603:10b6:405:14::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16 via Frontend
 Transport; Wed, 15 Dec 2021 00:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:18:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:18:01 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Jon Maloy <jmaloy@redhat.com>, Jason Wang
 <jasowang@redhat.com>
Subject: [PATCH 47/47] e1000: fix tx re-entrancy problem
Date: Tue, 14 Dec 2021 18:01:25 -0600
Message-ID: <20211215000125.378126-48-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215000125.378126-1-michael.roth@amd.com>
References: <20211215000125.378126-1-michael.roth@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb8b5097-18cf-41ad-f357-08d9bf606294
X-MS-TrafficTypeDiagnostic: BY5PR12MB4950:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB49504EAABDCFB1954DD6AFDB95769@BY5PR12MB4950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:178;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/Mfc5CJUzAfLfQZ1EumgTVGR7Gvx3WAK1cE56tj4wZVyCGpiGztwnOKMV/hwjxfIN1ImwOiR7VSEBk+wFncYQSF/8pd3d0oKSOgjHggoNOBtZKOWasfHLFfcWCG2OMmzEEAOXxyzu4IGH+O5SBa80Va2qk9M6WrH7kvmILOjJ7rvLGAbkhCmqeaIF0MvujXYpALsqnvgAJqz7yqgMsxMUUrM2o2rcCVMwrtCINXz7ZAeYQQYsk9UVFEOdQL3nERNWbr6Bc8FrIN9H5Qy2+LXZKzCG5GXhOvo4aGccNw/rope8p75/gNo+yzsfSHqBzemlQzC4+4VgvPvCUf0a21MgMuc3kCnV45FyLtYdw/aMrnt2/yk9hlHp48G0SAadEVmOsumr1PiOKn1P5BSEgxx9tew6MqKFnFf6VsxmVl9l5xm0g+GwfJH99fWMhUZLN+/NSWpzmjW+/6amDACtmKW4yUPaAT4utex9ZGCnreH+enCsx90YS6zsTsDwGx4eLD+etVgkr3zORJB476NK/sO/i5VnHeFCDXSoW2SpdvBbM1uCatsch5aU6p1vtLb97HDPxaM/FRpz6s/IvoH2G/3K2bRhCFACSBLLpuYzA9QuPmVRxfHzT+fdMjnsey+05AEWA7sb961pDkuulSsAHpckbLh88KcyVpazZ1bYQwMTGnTupPW3Zw9CocTo/jBGLaD0Hoxt6xWjGOA7xE3n4t/3r+nttvS2ovDhEmsRBmn2ZCxpbywO87mmHA2910fVDF2hRiPr5Psxue7upVw0zsSPSaVm6qQ+GIs9AmQZCSTwg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(44832011)(4326008)(54906003)(1076003)(82310400004)(5660300002)(6916009)(36756003)(70206006)(86362001)(6666004)(316002)(47076005)(8676002)(336012)(70586007)(8936002)(426003)(16526019)(83380400001)(26005)(508600001)(186003)(81166007)(2616005)(2906002)(356005)(40460700001)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:18:14.0861 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8b5097-18cf-41ad-f357-08d9bf606294
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4950
Received-SPF: softfail client-ip=40.107.93.83;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jon Maloy <jmaloy@redhat.com>

The fact that the MMIO handler is not re-entrant causes an infinite
loop under certain conditions:

Guest write to TDT ->  Loopback -> RX (DMA to TDT) -> TX

We now eliminate the effect of this problem locally in e1000, by adding
a boolean in struct E1000State indicating when the TX side is busy. This
will cause any entering new call to return early instead of interfering
with the ongoing work, and eliminates any risk of looping.

This is intended to address CVE-2021-20257.

Signed-off-by: Jon Maloy <jmaloy@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
(cherry picked from commit 25ddb946e6301f42cff3094ea1c25fb78813e7e9)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/net/e1000.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index a30546c5d5..f5bc81296d 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -107,6 +107,7 @@ struct E1000State_st {
         e1000x_txd_props props;
         e1000x_txd_props tso_props;
         uint16_t tso_frames;
+        bool busy;
     } tx;
 
     struct {
@@ -763,6 +764,11 @@ start_xmit(E1000State *s)
         return;
     }
 
+    if (s->tx.busy) {
+        return;
+    }
+    s->tx.busy = true;
+
     while (s->mac_reg[TDH] != s->mac_reg[TDT]) {
         base = tx_desc_base(s) +
                sizeof(struct e1000_tx_desc) * s->mac_reg[TDH];
@@ -789,6 +795,7 @@ start_xmit(E1000State *s)
             break;
         }
     }
+    s->tx.busy = false;
     set_ics(s, 0, cause);
 }
 
-- 
2.25.1


