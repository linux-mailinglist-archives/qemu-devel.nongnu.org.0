Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1723E31BF
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:27:46 +0200 (CEST)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Jd-00016Z-D8
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mC8FQ-0008LF-GI
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:23:24 -0400
Received: from mail-bn8nam11on2116.outbound.protection.outlook.com
 ([40.107.236.116]:49918 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mC8FO-0001vq-Am
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:23:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCAEs7tM0qzkwcuPlr51+jL0k9n0Z3bE3C7xhfTQWZBypPGjOtpes1ygLxC1H3K8xi68LK3aobHBs89bT56mEpQiOeEaGJtHe+ElHgczqWA455RnoyrlruasI1bskl42nGRDmae6LeBt8zSEheM3Lf1tkLXyQkMn+q2utMOAvifM75p58Vni/B8pPi+4bpQ08DZf5/3kUYNJ2760kPo8dubzR1RkkL0TwmL4UN+VNnw8nfB6cSiNTZOFuROfTu2ZkW7X6QBs8MGNDTjDQuOuP5MD0SucmGZDPP5ffBC2QlDFfl5061ViNiOVHficBuzJwW/rpyM9aYzp8aBlK2mHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8wp3fvTIo4wB/fwRkDQ3GPqPHixCJwJgiqH/GS5CKI=;
 b=jOGoOq6H34DYpRxiAI1Izbz4PE0IILyFyuc927/KG3LJ1g/Mf9FchGlE4wE+L7KpycKrf1JuPttJHXbbOemdpAt2/I+wSLBQXsgIjjzU0ix7vcr7AVijcaAwuPuOs2Xf8z+Jz9/AvBxos+Knz85udqONszQ/7rgRAD/xPLWzwn9oqcd5Ocg05uTEtFUHQFNqwQMT1F4A5+W23Y5cN611Wafc9+JWS6NBQDcga3ZdJZRiYp4xUKwUCQ6ajAPMKdUKbCc3z9elslSu2Zp1s+HCqAMnS5eWC4dQX3XG+193GLCTQ99vsBjz0UG0/Ua1KvO+4MAhdi7NTTBXLdq6qvulog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8wp3fvTIo4wB/fwRkDQ3GPqPHixCJwJgiqH/GS5CKI=;
 b=TGn/P6XKSHl3xxLG4luSYkI62Z/se2sA7Eh4E/t/5kVC+8ERn97e6q+Oe9ElFT8Om5F5vnE4XIyoNZiHXinUiPUg1rvOKgT0KSmQGt112g8i7doNZqJlVQJqT9V722j+DNN5aFL9BDEz3m4BFIgMpbjw8V8DSdy9ZkLp2VX2hv8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2333.namprd03.prod.outlook.com (2603:10b6:804:c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 22:23:15 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::f6:2ec0:d576:8139%7]) with mapi id 15.20.4394.020; Fri, 6 Aug 2021
 22:23:14 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH] vmxnet3: add stub for encapsulation offload
Date: Fri,  6 Aug 2021 18:23:00 -0400
Message-Id: <20210806222300.417126-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0008.prod.exchangelabs.com (2603:10b6:208:71::21)
 To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 BL0PR01CA0008.prod.exchangelabs.com (2603:10b6:208:71::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 22:23:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dcb1f8b1-950e-4f89-8bb6-08d95928c7e9
X-MS-TrafficTypeDiagnostic: SN2PR03MB2333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB23338453CA3FA37328EC4CEABAF39@SN2PR03MB2333.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: McZCuLk3LGCK45vEJhvfUrnO1Hpwmjant90Q+rxvPFbeG9hnof6LsMOMWk9q+fP6B0uVxkvcprspyUrlLblOskNmvPfprlXnPTtmyWWW7+lbkPnvtHbiq4wKx5E2GQJZYHBJO7B/qYan0sQ5/bGuhORX4F/WVvsxTJpTMqUUS5scDoLAOTsV3d7VVOH3Kr1YoHR8taUXsX12vRXeVMSCaHvTf4fVlcHG73i1OBnSdQ9UcS9090GyRTAKUk23ZL58T5wY9GDB2liPbk1tte7G+6oeiqWIBhjgNrfhc2wTGcLUwrQ/RO3qsX7Mg5uitZRRagGSlFRLYYLeyQDz6CmqOBFNOtmignmBF5OAWrsbQcilV5mYw056rsv49KKjt2uW6s3tr8we6wuhYGVzC9u5J/9PkdXX1Pjq3H1CZZ9TM1W8SN9g0A2UcCuvldY8sLDBk7ikr92Z7kXp3mo+xD6gDTOn6Rtr6tUFAdsLEMS0YF6Urp5H7u+jNgttOFh4+jlR1KKfKgxf+HEp3AmJA6DE+LTwzL3RE7iUEmaXtFmCepeoq37Izwbga79ePL7QOtkOk2HEVLvkAoSompts7w27C+k/gG848sLHUBdMW32hLLfwRaMzOtpYsAjumyQlN507z2mtTu0WvK65p0QatCCJrIQv5hACUx6jhdv5Z6wxpjXns/GBacSgo3zy8kAuBgfLn6CqQp0XtfheqhpixYlPjzCnbW7dll77XL0XsIEhnZL+CYquq0V2sJGtsXqQi6S2GaikrunSOEDr0Os4ZZ7f7adrXygQQjO6Ze1V4l/HtFM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(66556008)(478600001)(8936002)(2906002)(6486002)(66946007)(1076003)(186003)(36756003)(83380400001)(5660300002)(6506007)(54906003)(6666004)(66476007)(6512007)(2616005)(956004)(786003)(316002)(4326008)(966005)(52116002)(8676002)(38350700002)(75432002)(86362001)(38100700002)(26005)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BK1Wze0JX5KeD5WD1kOrhYTcqIjzpTFH5bAmwuv/38wXyOa4LN1Kw0R/gzLI?=
 =?us-ascii?Q?Am0fgZ5WqKU9zJQpcLVoIPi0fffIe6ippk5kXBw+IdkDKkxSVV7B+vHnvsfG?=
 =?us-ascii?Q?SphM+O9MdqTL/lMnk+BnXJ0PLkZRPMrlc4QvisqoLSsOE5UeFAAhnqUETbfa?=
 =?us-ascii?Q?QMJSl2zXfoYTqAA+6VYwQA0Kq2SfySwf0ei4xLugO4WrP0nfrQkJ1zx96oaW?=
 =?us-ascii?Q?Pm1nkoT1xx6MNlmVGS+GG2/HSREWooANwkpLvUD5lFXcqOAslWpi5hT/3UFk?=
 =?us-ascii?Q?AOb3q6dZdchzpffUnYC9cIcHkmAmi9VfR23hMa9AMUwRcmKyy/UUHlhz4iza?=
 =?us-ascii?Q?L9zn3eD9x9vYnfSr797/AY1cLjBPdMlGOqYm6oym/5zVqgXUAIT2u3pN2kZs?=
 =?us-ascii?Q?y9zDyBNjyIR6er8Z6n+6z3/6QK32224KiMohT63qzTvp4HCwB96uq7TqYCH0?=
 =?us-ascii?Q?xDu5XLIhsKGGzS2Y1BwmvMuiKV6NqFB6BUiqctLALUNUTJ6RcgPbSjEPG0ED?=
 =?us-ascii?Q?6wsznTg/4lOfS8T3gEhXXua7iLLxRKs2mkteZVTguN1q1RvI+gBVtH8SsWQq?=
 =?us-ascii?Q?SCQWuXJkCaszSOUdEq6FbiDdedSKezu8PCyFRuokNPURr2GsX+kVqM2a74hP?=
 =?us-ascii?Q?9tixMst3DIyMS38Gt97AVhzu91o+Wxk4cnFe7CGnaO88cUhO+5p+yeJ849YA?=
 =?us-ascii?Q?E/hTJ0b9ziWdQbWk1O1pq2aLKXuGk8F7Fttj6doqQtF+Xu36IGbmLhV39wrZ?=
 =?us-ascii?Q?CbtArPsRnN7k20WcXVEL2C4ell3kiSCJ1RTNIyHe6xjPpHJ2BNgdZGUWvIN7?=
 =?us-ascii?Q?bQHNkLwC8HBSfCE/Oeu87IYLP3J6OA1NNeEIlVF+QZ66t30swDCJIELHKpiH?=
 =?us-ascii?Q?r5RuOcQbuKJKyJYacD++JkzcZSA1oO9WRCzI6zXmR8TvbS7HCiOfAxvZBk2S?=
 =?us-ascii?Q?uQjxZF/EcuTUFwYL9yq9/wN6gE3A+kia+uo3Uderlwx9hl8kFfqmiyOxJimc?=
 =?us-ascii?Q?LD6G9WaRr/NODrBCcW/o/zRJOwk6qZ40uMgiTx5bymqZKBybspRuH9m6jtKY?=
 =?us-ascii?Q?5yFm3fkQHv+3+FCXk5NXbLLKfoKOZz83o6DIf3/N3YZsvrTb5tZW6DsgWBgO?=
 =?us-ascii?Q?0kkUt3Wpk6zpfwBpFL6uGTfL5NtAy6AS5nIVlDYx7IRS1Ax5ME/M46FKIvh8?=
 =?us-ascii?Q?ftKfvjuuhxttDHhLS2HSAa6Nypq+ZzKEOT9PF4R8NN6cHBuJm4AKjkjx14o/?=
 =?us-ascii?Q?ziLmsVfZC9UX84WL6tHVuz6PC9DFu3L9CWzSev4+GjShDQqGg+zjPUv33CAU?=
 =?us-ascii?Q?Eybb+am7uP/fSPIRiQINbEPh?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb1f8b1-950e-4f89-8bb6-08d95928c7e9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 22:23:13.9779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8n7z9IUCkzLBdpFuHrji7KsSMuFHNTygHdRlcKFC8VX//qaFDwxBFUevf555rYyV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2333
Received-SPF: pass client-ip=40.107.236.116; envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Encapsulation offload (offload mode 1) is a valid mode present in the
kernel that isn't implemented in QEMU, yet.

https://lore.kernel.org/lkml/20200528015426.8285-4-doshir@vmware.com/

Add a stub for this mode, to avoid the guest-triggerable assertion.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/517
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/net/vmxnet3.c | 5 +++++
 hw/net/vmxnet3.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 41f796a247..62e11d0e3e 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -443,6 +443,11 @@ vmxnet3_setup_tx_offloads(VMXNET3State *s)
         net_tx_pkt_build_vheader(s->tx_pkt, false, false, 0);
         break;
 
+    case VMXNET3_OM_ENCAP:
+        VMW_PKPRN("Encapsulation offload requested, but not available\n");
+        return false;
+        break;
+
     case VMXNET3_OM_CSUM:
         net_tx_pkt_build_vheader(s->tx_pkt, false, true, 0);
         VMW_PKPRN("L4 CSO requested\n");
diff --git a/hw/net/vmxnet3.h b/hw/net/vmxnet3.h
index 5b3b76ba7a..36a17b82aa 100644
--- a/hw/net/vmxnet3.h
+++ b/hw/net/vmxnet3.h
@@ -273,6 +273,7 @@ struct Vmxnet3_TxDesc {
 
 /* TxDesc.OM values */
 #define VMXNET3_OM_NONE        0
+#define VMXNET3_OM_ENCAP       1
 #define VMXNET3_OM_CSUM        2
 #define VMXNET3_OM_TSO        3
 
-- 
2.30.2


