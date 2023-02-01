Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03672686536
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:18:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNB7T-0003jB-Ag; Wed, 01 Feb 2023 06:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7N-0003hA-Ui
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:34 -0500
Received: from mail-vi1eur05on2072a.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::72a]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7M-00059n-EX
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgUKHU/85At+x9IJijagqrZud6qM0Rym+9KOWWaNu2pRl1U5Auj+i2nHebgnANNcjKJaE3TS/8SUJjWL3Fov0SCVhCZKud+r4lk2bTtSQ/VoXAR94MjekhU56uIFyB4pz2DQCLoZ163WTYt3z76T84qz4Si16kqGHTp+kOgHlIN0gvdTUTbTd2a32yrnHnJ+dbDXe35bKHmo/ITixD1jY1GdZoo8W032ICcgfzpBfvChA00Y50kT4skH82YkKaiu1FlvP8OmWNPRBjMGvfnVN9vchidiNTvAq8qULrfD3QvP1ukpCjLxnK3z3sWYvGwSK0GABUe0XYIgmPQ4XQmZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTwi21pOGjPzlbVpJDH76cUNCux9AW5UeKcRHc7Nw4o=;
 b=btvA7vJA8QTRU+1iwJZ2NAfyEJZiarGuNVnVVE9APtJzE9eI3KChWrpREhYNiRV8RQU0aExfiNr63W9Qp2YiUyDFrdSPM8AV0tEBCCLhQqrElBB1twNon5hA7EeEFQ62jXzv8mq06WkQ1JyF5U0CgHEBsK/rRX2FHN88QTWbFU37QYJgEg1THZOgJ5/Nmg8b8Fro1PPm5V2rFeTVsGRf5igCKAkxp8S4oSXrmypn88zeXQgtGpv2rTvqiR3RK8cytTeOo2YA8M/hQWFJVij5pVcerlM3/ANkHeK/cHgP4eHjHgVWhk5Ktr2+Kw6Dw1uoIEpugeVDQOvgq77kpdWU6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTwi21pOGjPzlbVpJDH76cUNCux9AW5UeKcRHc7Nw4o=;
 b=iB/pWoxBBt2LlkIgdoBLcQQd0KlLGL72+gB2exfOI/byoZX7vlfHcQZPnVip0OHPcMB2D1s8MNNXYb6ur3wkYQ1+7UxWG2QTrVg9FlCAwl1ZNRh1oMXGK9sHBvT25vtbrF3pCftT7eB4l9Ja0q+ZeBGURrdr0VdsQemuG6u4GU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM0P189MB0642.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 11:17:26 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 11:17:26 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v4 8/9] igb: respect VT_CTL ignore MAC field
Date: Wed,  1 Feb 2023 12:17:21 +0100
Message-Id: <20230201111722.28748-9-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
References: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0006.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::11) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM0P189MB0642:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2af6f3-5ac4-4b84-1d60-08db0445e59e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ufF6eEdU7R4GQo9+gmGYTHJMhSg6Q/Z5NVGoeJJe3UVDz0RidWeF1P+7zFfR5jd/qYWuYqWVkM+TEjOsmfrwaR57jXG0KtPdrOq4HNHLlmMtAL2R/TG6PYzkcbUybU62Si2CU2aRGvtwVImGPSVUAm3Z2HYGm2ID7krWxRUHnml/srUYfYQaB7aKlFU/6SzuKt/egFMPTega/OtDHaEM7Al9YtsX4J7i0kKVAL5h2WhaJFIytgnMkEef1UPgAB4fY35NYLjuZYMwuKxpNSD4tr9LDho3LMVnV7OGwiYdbLpHgykZbMTF/jUe87BQg26zD/yzLLWi7SNRwVHEMwje/6yRt0CD5Pe+suDoNNfQCQZP/JaiRh53PZs2MjNhtF/K7wYKMYqkiycfFAK6KJx5msgnsdN8nm3BVVsXxAUbTtdR7PwLkWJlUf/OXViZL9mKe+P4mrhxeAW8I7oZXfVLAj6Ul4MoYGIROR6bybuEAVPoOqJctPAr+vhv5UoPxAgKPS3HRzCAlygCx3tktUAH2qn/BhIlsLVd96+CDmfjFFHaR5FEFw+RWub0Z31IuxObar2QwUYbFXJGPc3zMWh0EkxYeLdFQO/jZ5aOYGC252i26L2Imlg4uEZRw5v0KVlqniM+a8xCc9neh8uHxC31XiLh8wt6XwrlbRsBaT6JeYnQqfV4lgfpF+5iejnCrFLLVEuntkOao77r92Cetj5l5So65MVkgaw6XP3fl8dp1ws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(39840400004)(136003)(376002)(109986016)(451199018)(5660300002)(478600001)(2906002)(41300700001)(44832011)(66556008)(4326008)(8676002)(316002)(70586007)(54906003)(66946007)(6486002)(66476007)(6512007)(6506007)(26005)(186003)(1076003)(83380400001)(6666004)(8936002)(38100700002)(2616005)(36756003)(86362001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cULuatnyBKQw28MhBvKqlxVvqG+dpQTy4g6Hdq0Iv2HOzp5DD+YjMb9JUdNW?=
 =?us-ascii?Q?CWBqklxSDCdghxRL4qKsHNeZw+Iv5Sp3VTmTnC5NTB9zeVmjZRMXgYy4BIBB?=
 =?us-ascii?Q?rD7icns23s3/W/yoGlbfzds9cB8JDGcanQSVKPwJHdqj5yhZFxME+3Qgr5hg?=
 =?us-ascii?Q?u4nogo+NB8GYsYkDHVe0GOk2Dx//NktvIcKJH0zVoZC22fmPyaYoot5ShYmV?=
 =?us-ascii?Q?tB4/xiIaDA/5vut7ptKbv+CSthXhZZylJXIhvseFwqXjCAzW+fbuApEajHId?=
 =?us-ascii?Q?oHZmk1GZHMXQIxZMTl1YQ4zioJLaZ9qIiPCscFRdLUYPnfII0Pq1cBCVmK/L?=
 =?us-ascii?Q?rnSujmzzbdyFPJ/7ktcwqn1aA7Ip8wI33/vm6wfCq9jP/nx2UgIXt52zQPd7?=
 =?us-ascii?Q?VkPmjN6/IxfK128ULqqZJY1mVAWQIiDW6tURKsrGZQIDDBH338nhNQSRx227?=
 =?us-ascii?Q?HsUNvqrN6SYmLApl0N+1zg4WTLIhfE+tzaF9yLfksnJMRlQ9KMWfsTogVo7J?=
 =?us-ascii?Q?QqHURtUoax1a3/WVJ1Enx4RfyiM2LOJuFxEq2un9YAZ12OrB+NPIE4nbuZjI?=
 =?us-ascii?Q?+56goZIXZFAlgfxtXfGiteLhfrKya/LphJgzonS564Z1C9QYcjkqmZF8cBaJ?=
 =?us-ascii?Q?RdR0HIHnTd4UILlj7m6qxB6494oPQ2hz2v2fOJjEnVXNSs7pdIRT7dMizYNP?=
 =?us-ascii?Q?Ixi3iYQvAHITIquQfnSM3zTkaRfWc6rSchiHh9L3dXDjg02rxmTW2cvnxjmu?=
 =?us-ascii?Q?ldOFxrG10Kr/PaxeGT8La5U9Vpg2i5qTY5e+PDyspZ9w7CBC4PhLAkbw32WI?=
 =?us-ascii?Q?tEuEEB+lkNxBRZ5tUuXhCzmy0J7XiBkxEd1iK/faoKVPfJP8Cxhl26Z6fsUD?=
 =?us-ascii?Q?YpP3KZKwUlqlbHFmvH+dkt7c/0cnPTEX/Q+36kKOzfWRSil1ynReL4V3ZG5f?=
 =?us-ascii?Q?Buf005PRC9lAcw6VhomMotkPW3rqcLHPLTq3K9wCnBMUmaE/NLXBOa/pU6CI?=
 =?us-ascii?Q?MVczsw/bkgF7pC70Ndhk/9OzFccCr9lf883VXCEn2d3GrvTuKG+N99gJXAZr?=
 =?us-ascii?Q?IAtonsrLCpbvopedhhvN8LMLf0uUVf4yZnP1tLDwWYHq7g5kUVm8QYvLV8Jx?=
 =?us-ascii?Q?QGZ9RHVt+aJq3nK27qL7KVpSuBzR2ouJaleiskkX04joB4xwLbQUNdRrDov3?=
 =?us-ascii?Q?ThoCcDtr8I3nLmYugDxYqJywZ7RhC0dFGdA8c0dO7njWDTxDtcBzIptH33OD?=
 =?us-ascii?Q?qoPmg9aNSnWhwRfEQhtCTw0NqlfI167MvTFIRWlfTmm8fyI8SbYCUpEhBnYD?=
 =?us-ascii?Q?tlcu7XH03yt0J3t7RMIe8/LJiunvSVmMFg+5LHEirNfmytjyAvKSiWby05hm?=
 =?us-ascii?Q?T2nblIu9cl2q88GS76Q2t3SSiFPdMhJFU+BpB2lzOvMUfApTTHlY7keAnqDT?=
 =?us-ascii?Q?Q8/Vd6rU30/VxLSJtc2Zgcb+ClWlF4o8Y0lxfX6lhIHnW2WvLvux+MxR5uip?=
 =?us-ascii?Q?PWIa6ku/fS8/8BT15EWjpeor7voL4EHWcd/S1JVL89lzVRz7Sie4u8kXDXhD?=
 =?us-ascii?Q?QX+VI8WxeRKLcDjJDLZ+d/4rR+8lv36yrvxjJrfWBo7yofTxPcsrBbCfv3Lg?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2af6f3-5ac4-4b84-1d60-08db0445e59e
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 11:17:25.5593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AeaCn1bpOiAENbxpUpnZqYX+o1jUt6K2Hfxhz22ivTo8fUp1uBOqlmPIPUyskVJ3C5luvT0pqOR0r8/Cry54aNpjavPjTT5w16XYyGJ8eNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0642
Received-SPF: pass client-ip=2a01:111:f400:7d00::72a;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Also trace out a warning if replication mode is disabled, since we only
support replication mode enabled.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c   | 9 +++++++++
 hw/net/trace-events | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index e9b706df9c..d1448dfcd3 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -963,6 +963,10 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
     }
 
     if (core->mac[MRQC] & 1) {
+        if (!(core->mac[VT_CTL] & E1000_VT_CTL_VM_REPL_EN)) {
+            trace_igb_rx_vmdq_replication_mode_disabled();
+        }
+
         if (is_broadcast_ether_addr(ehdr->h_dest)) {
             for (i = 0; i < IGB_NUM_VM_POOLS; i++) {
                 if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
@@ -1009,6 +1013,11 @@ static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
             }
         }
 
+        /* assume a full pool list if IGMAC is set */
+        if (core->mac[VT_CTL] & E1000_VT_CTL_IGNORE_MAC) {
+            queues = BIT(IGB_MAX_VF_FUNCTIONS) - 1;
+        }
+
         if (e1000x_vlan_rx_filter_enabled(core->mac)) {
             uint16_t mask = 0;
 
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 5665cccc1f..a4d074557b 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -287,6 +287,8 @@ igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint3
 
 igb_rx_metadata_rss(uint32_t rss) "RSS data: 0x%X"
 
+igb_rx_vmdq_replication_mode_disabled(void) "WARN: Only replication mode enabled is supported"
+
 igb_irq_icr_clear_gpie_nsicr(void) "Clearing ICR on read due to GPIE.NSICR enabled"
 igb_irq_icr_write(uint32_t bits, uint32_t old_icr, uint32_t new_icr) "Clearing ICR bits 0x%x: 0x%x --> 0x%x"
 igb_irq_set_iam(uint32_t icr) "Update IAM: 0x%x"
-- 
2.34.1


