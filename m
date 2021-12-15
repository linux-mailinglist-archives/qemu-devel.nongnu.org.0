Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848ED474F8E
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 01:51:29 +0100 (CET)
Received: from localhost ([::1]:43992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxIW0-0003LI-M4
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 19:51:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHzQ-0004bA-52; Tue, 14 Dec 2021 19:17:48 -0500
Received: from mail-mw2nam12on2081.outbound.protection.outlook.com
 ([40.107.244.81]:1664 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1mxHzM-0006PF-PQ; Tue, 14 Dec 2021 19:17:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6woojJ1agVhPgMueX5mCOXBulImuTblSinlPbS6FHQo7e6DtzxqoYuKJ8zrbkH5dCtZcmVl4j2Uk37yB8CZ+TkHfLgntXbUnXb9Oqn7DU2FyFAXOwP8WvlhfqY1Zk/XQARClOZmcbylCVL4Lj1CNGNMfprMPsmjasqmavqrtMFcqfRs++r8zspG7kcRc60eZN6nGr0F/8g1SzXBvLb6u29USQLlTxgE1wtG4Uzdi6WfUDL8bRWI7RmtvPWQRfDkV1DnKc2eKy5J509hAL310f4Y211r/vpr5/LbtXV+I/kQ6qxvkTJ+kMBIQyyW377iwcHnfwqBbrRZXl3Tvbk1bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TpXAUynaovkP+NJSm7ozVjStq7YZWLkqwCPppTC45Q=;
 b=Bn6gNXsWmlvofIDFutdji/LWHAUVtcg/Qr9FtYL/sFSNRWvbnHB9UjrQ9t5UvFQLIzyh9ZZBUNVmRYLFmX0OrSpDBd9VfMJCr01x/rpMVixxiz0z3FEDqF5PLaEVUJ/wTDdfZM7VS8mfiP3Uqu6NSDKlODrqoM4M6Q9t7b7v/2eGB3HKbGwUzCZvfHyXybDn3pbN+e1Vrt+dHY944ofw+CgikmCXLLFEOaz5xtT1OPWg7PbnTcLCr2Hx+gRzzXUX8I/ikBGozhXJ2FZu/eXSIK3q1yD2MrR78N6iu4Jhge2MzBIdSCiFuMpM/2RU4m8ieuvNnT0sy44udkcfyJK3Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TpXAUynaovkP+NJSm7ozVjStq7YZWLkqwCPppTC45Q=;
 b=obAV8VJ2dNfVS42gGH9ZkbgyERWATjA88WGuQ87Zs4KKQ6aaViA8z3iRaOhD26KiIGEwxG+TAbuds/BWfEzjcKApfJhiLuL531eE1RA1M2uhkzwPShsa24c2vc4++oF+2gj9HEndbI5R54GINpoanTa988DOVcSfwQ0sEUZgwUk=
Received: from BN9PR03CA0600.namprd03.prod.outlook.com (2603:10b6:408:10d::35)
 by DM5PR1201MB2523.namprd12.prod.outlook.com (2603:10b6:3:e8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 00:17:41 +0000
Received: from BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::ec) by BN9PR03CA0600.outlook.office365.com
 (2603:10b6:408:10d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Wed, 15 Dec 2021 00:17:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT014.mail.protection.outlook.com (10.13.177.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Wed, 15 Dec 2021 00:17:40 +0000
Received: from localhost (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 18:17:40 -0600
From: Michael Roth <michael.roth@amd.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>, Prasad J Pandit <pjp@fedoraproject.org>, Gaoning
 Pan <pgn@zju.edu.cn>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 46/47] net: vmxnet3: validate configuration values during
 activate (CVE-2021-20203)
Date: Tue, 14 Dec 2021 18:01:24 -0600
Message-ID: <20211215000125.378126-47-michael.roth@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 095e0d21-36aa-426a-ba26-08d9bf604ea3
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2523:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB25239FEEBF7CF0701A2C7E5995769@DM5PR1201MB2523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:16;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zPILc7xuTcRFkFjcjyCqMsmhplywS4tlXrx8NXZHWArvRBNWLC8gAPI6hJJ6iFISBnQo+MCWYyo+/knOeQNQLGGJSY7GmWrtHS42PNSB8b6ZG4/qb3YiYL85GyfbThJ/2T7o4h8OoQqUa44LwB6gxOUwInwGK5XHhs472fxn/khVvwUmj7hp2CvrOBU94tGJgj5Mi47PRub+B2u4zLX+v7qUiueE5rAwjcvJ1r7+1+Ln6U5ZCmPdpQSYOqIukKDUqJpSCzazFwfD20FNb4OK/ZfeG/W8Uvy2b0M63J3FdAS7gfOfYsAIssuegISL7DnFpPlGed0X7Y5gZRvOTUUcjJiJkH7mRbl+HYWG9rQSzho1YNQVqBOGuXkEt1tJ0iZq+Mf+wkaVdRwv/lCE+ChB5HWZsqajvlHHwsURv895q9dO3JkQ+vSpCPKdgnwMYn95rmYdUFVC76KP75J1MvIDFbukWoK1VJFOyVHLAXf9ZzBu0kI+azdsuhq1tCewXnT5YEnibewWBx3PpTgsNgE7mUWwyj4jTuq7bNoPfsY4M3rEubHCiFZ6VY00hl5ct30WmsivAjdr/RFg00WuHtLZOUN0eNVDoyHEEZqvA//y+ho3llv0H4FxAIXYNvwDEJlnI9AoE76pz4svIrLnaH9LHR7Z+lyyEa9GaFuRVFr5FmT+YKW6blD1f0QoYvo3H635hjLkqjeTQ0urgcgYRLE6uYEqLplkNBV1LgMzwIE4kXWS/Ge0LNrhXUCN11ZzCvBFSDRxQAu+eOQM5aTem/MgbpXrVyC+TVbSxyEDbn6rm+dxfJkKJAp6rI1PWD3Bwl9Tl91zKkEXd0bOPngBn8FKAYxjwlJFif4bPgOPHlLP7RLx2CK2kuj/Sjjh9gjN3sge
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(6916009)(16526019)(36756003)(4326008)(86362001)(70206006)(2616005)(508600001)(186003)(70586007)(40460700001)(54906003)(1076003)(47076005)(316002)(5660300002)(8936002)(82310400004)(26005)(81166007)(44832011)(6666004)(356005)(336012)(36860700001)(2906002)(966005)(8676002)(83380400001)(426003)(15650500001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 00:17:40.6325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 095e0d21-36aa-426a-ba26-08d9bf604ea3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2523
Received-SPF: softfail client-ip=40.107.244.81;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

From: Prasad J Pandit <pjp@fedoraproject.org>

While activating device in vmxnet3_acticate_device(), it does not
validate guest supplied configuration values against predefined
minimum - maximum limits. This may lead to integer overflow or
OOB access issues. Add checks to avoid it.

Fixes: CVE-2021-20203
Buglink: https://bugs.launchpad.net/qemu/+bug/1913873
Reported-by: Gaoning Pan <pgn@zju.edu.cn>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
(cherry picked from commit d05dcd94aee88728facafb993c7280547eb4d645)
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/net/vmxnet3.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 41f796a247..f65af4e9ef 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1441,6 +1441,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
     vmxnet3_setup_rx_filtering(s);
     /* Cache fields from shared memory */
     s->mtu = VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.mtu);
+    assert(VMXNET3_MIN_MTU <= s->mtu && s->mtu < VMXNET3_MAX_MTU);
     VMW_CFPRN("MTU is %u", s->mtu);
 
     s->max_rx_frags =
@@ -1486,6 +1487,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
         /* Read rings memory locations for TX queues */
         pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.txRingBasePA);
         size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.txRingSize);
+        if (size > VMXNET3_TX_RING_MAX_SIZE) {
+            size = VMXNET3_TX_RING_MAX_SIZE;
+        }
 
         vmxnet3_ring_init(d, &s->txq_descr[i].tx_ring, pa, size,
                           sizeof(struct Vmxnet3_TxDesc), false);
@@ -1496,6 +1500,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
         /* TXC ring */
         pa = VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.compRingBasePA);
         size = VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.compRingSize);
+        if (size > VMXNET3_TC_RING_MAX_SIZE) {
+            size = VMXNET3_TC_RING_MAX_SIZE;
+        }
         vmxnet3_ring_init(d, &s->txq_descr[i].comp_ring, pa, size,
                           sizeof(struct Vmxnet3_TxCompDesc), true);
         VMXNET3_RING_DUMP(VMW_CFPRN, "TXC", i, &s->txq_descr[i].comp_ring);
@@ -1537,6 +1544,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
             /* RX rings */
             pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.rxRingBasePA[j]);
             size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.rxRingSize[j]);
+            if (size > VMXNET3_RX_RING_MAX_SIZE) {
+                size = VMXNET3_RX_RING_MAX_SIZE;
+            }
             vmxnet3_ring_init(d, &s->rxq_descr[i].rx_ring[j], pa, size,
                               sizeof(struct Vmxnet3_RxDesc), false);
             VMW_CFPRN("RX queue %d:%d: Base: %" PRIx64 ", Size: %d",
@@ -1546,6 +1556,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
         /* RXC ring */
         pa = VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.compRingBasePA);
         size = VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.compRingSize);
+        if (size > VMXNET3_RC_RING_MAX_SIZE) {
+            size = VMXNET3_RC_RING_MAX_SIZE;
+        }
         vmxnet3_ring_init(d, &s->rxq_descr[i].comp_ring, pa, size,
                           sizeof(struct Vmxnet3_RxCompDesc), true);
         VMW_CFPRN("RXC queue %d: Base: %" PRIx64 ", Size: %d", i, pa, size);
-- 
2.25.1


