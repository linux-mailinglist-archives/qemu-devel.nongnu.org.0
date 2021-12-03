Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4800C467EDC
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:35:29 +0100 (CET)
Received: from localhost ([::1]:50204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFHE-0000Ys-Bv
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:35:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8v-00016h-Ct; Fri, 03 Dec 2021 15:26:53 -0500
Received: from mail-eopbgr150132.outbound.protection.outlook.com
 ([40.107.15.132]:11453 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8t-0001bp-2G; Fri, 03 Dec 2021 15:26:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIHYYHz3876aPcqjfmxh6rW8aj995FuEAlh2z4uOxDDykHtef8hExctHCzba8qfpp9YNT+N4lMqOjuWcoO7dq3dnZe04ScvRWg6dfWXMX0xuqOSfllTPzQhjNmsCOBm82qIlbBCq3HJrHFoVSNHGB/7PKNrPZdTSzSw4KCJK0q2smnBF+ga9C+JM2GHeIEslQTKVYXcACy3OJbrStDlQgtTjE6/uYkuHi+rQQQW/SwQDPmRj3/GwjU5WBbe4gBgEYfXtXVj7BO9XS8ITzue1Yk4U3FAG/nVrxj5rxW3dmA6rnsg1VNbK1J8oP12codTczZlnVoYpfRzUyGM+3lB0OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YhoxgGe3Ea0Tt6RFHkgMQQ5XGu0P2U3WzRhaJRV7OeI=;
 b=gJZYRS6JuqbVQ+0HRRNnxJ3Fp6bGfywGDsj+h7zhn30y3N8gw6mEosgXZWrLPWinC9KMKQa5Mh6cninlnyMKCQhmTiZAuoCNsXz6RcwNzQx2AFFVoBfi3PDU+G7oePRoUKH0Q5dbF1Mq+gYggulaNSezJ41P1wi1vEfZ8Sdx1fLl4FB+DMYtQI5HnGW4GjdoE+QuN2c4Mqase+IfqsFDmP2h0Hkjvgt66C0JmRhg2IH+J4purIkcDQ+2Gd/QyC1TeSv2OHrAoA5JUsFVM7PO/6iQE71qWzbxg0RAeZMgn7FmAUG9KWXm7oaQ8W+DOCgVa9HbkSClyZuAdS1L5eYfdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhoxgGe3Ea0Tt6RFHkgMQQ5XGu0P2U3WzRhaJRV7OeI=;
 b=X5EPESk3lVSQ9N7MHMm3cJPDquZWbYz9vdlAeEdHrp77td1KSDewvCB4Jxy2VeixjRlLQ5Zc5jiibOK5QLTGReagBwIkCCnArvCevc8apKPNs9OkgyjgBPhx70NHPDRy70m0fWBebh7Lez7pWJ8BRhWeFVnJXUoJ6oyIM5/w6WQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 20:26:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 07/14] block: document connection between child roles and
 bs->backing/bs->file
Date: Fri,  3 Dec 2021 21:25:46 +0100
Message-Id: <20211203202553.3231580-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5f6ab20-8082-4344-13e1-08d9b69b2b44
X-MS-TrafficTypeDiagnostic: AM0PR08MB3841:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3841C78EA979D6E936CCFBBBC16A9@AM0PR08MB3841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+d+Uwh6viZ/9yOQLrXtUjYJBGJ5oPUJjCq1eCV8K3tzZy07DObjNx9Ang1pN/J6rfb2HLORza/2dZ/ZskZoBb0noQfrOwvPAiL61FSVpdlHIIO2HCV20Vcc0eKNmcu8OQUmxaNIviymroUO+6FMzcmpeUQgmOluEb9HpiR23wHahCqpc/RFwyNIQGFyAYN5I4AVAePAkl7x5A+WyuREEcRoPB3nf+Jq8u4VsALXv1gbEfWAo9FFL3Zg6bPHAU4D1xvVeNbsi8U7dqsAXhj0IkF/+n7imDG/TiLYX+wQTMUZSNU7sn3cJUk07oF4Wyq9frCS8zjUzwZnkuNaKIPLcqibQDnx24fHZousaDzGiRDsxCHvePYTT1635dgiPhszBGCJR+OI1oDaai9xXebOQqXTCLea2B+6tM5JGFYBT7CAALbwPZnaqe5UDL1LctzjlUEmRnWwZtTNRcr4gVxzrwN5K4cdYrJ2o5eLS2kyEdeK2/xqSV1mZBiXONO0hjGcMT59BhCm8t+0fWM+gT62fLWw0Fn1C9DEE7nRqW/BIx+v9yJh3++9yyNeTfDhDRrI2PmgGY1fBrzaFeCTrC4uVn8P4uU0WCRkNYItmfT2XjsR4ju1x9HhETFEBL9UX466PIWbt/8HDLFRkHgSsLaYHGfwd8G+LSumbsiPDfbvENPhnqbfU8mmfcVYOx1yJYqnofEXXMbjX/F1CXUmGJ5Oow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(2906002)(2616005)(6506007)(6916009)(1076003)(66946007)(26005)(36756003)(6666004)(66556008)(6512007)(52116002)(38100700002)(107886003)(83380400001)(38350700002)(8936002)(8676002)(5660300002)(508600001)(4326008)(6486002)(45080400002)(316002)(956004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SbN7VIVw6j7TcxkE01wZ2gYGs/U32M5+cMT5o5eHUhLJcQYsVrZjCGnulwtF?=
 =?us-ascii?Q?3keDSbhibxUHcXdzZULupWVoOYTAJg00ra7JLkZsbDK4IMsgVCK+MkC363sJ?=
 =?us-ascii?Q?yBo6Lr78Hqh/EDV+4PjDVpO9a8sBG5IDUPgqONY5bk+wjE1B0yOMERl2HF+p?=
 =?us-ascii?Q?QfxJUEI4HJCVGMMcQ8/F39l3BB2LYqy9Yhrq8KO5Y7IFzsMvItVB1aFx6tnc?=
 =?us-ascii?Q?4o07kHcvzM+r4hLrXY/hT/E2pqyRWGBXqc2XXWtO73AuG9PthAfnvSa0CGZK?=
 =?us-ascii?Q?TkwdPeeknf+gVufZvlQlFh7wK6lMI1f7y7I4vC+oJrZJvS74SduG2WYhaQ9I?=
 =?us-ascii?Q?AElbHdvK0WJ/65TO74fVn4guqpTP9v87Mi+XQzIfIowpl//5DhDujAhliEet?=
 =?us-ascii?Q?LlyPTmmd0oBuUmx3jnQm2/KZ8Qi5r12VJXbd+v8bpJOUxSTQVTgDYqGNEj1Z?=
 =?us-ascii?Q?GhP5TU2zadUz6rFKhBuVoiT8TUqOx+EPPGIFc9XEmfEp15sopBd7FTbjuzld?=
 =?us-ascii?Q?lkudpA4r165kzM7bY7zxFpK6LpBuWa9rpXWomGoruyUwwdw22qx5k8oEQFsf?=
 =?us-ascii?Q?47DoxgfK5FP0I8ZtV68tyXshVGsyqSdsDC76aB3j5sTC540xWxhxUSHiTYXS?=
 =?us-ascii?Q?/9TsKHhNpJgZqA75RMt46rCf1z0ffkX5PKdrd2KhDtSAO7STTReHUjlX+Qx8?=
 =?us-ascii?Q?/iPJOS3bNrRftcPEA+V3lL85IRhfxVGneBCNidISNb292qFiH1Qx2p8z3HXX?=
 =?us-ascii?Q?UaQuUqrGP1OxwgBX00/dpfS96F9HnGHNbPUAwg4HyAwTAOA27FlFQKtunV8k?=
 =?us-ascii?Q?f1oKr5YS9mVGFpwVXg+JALjZEVfdNNVgUmsqyfUO9sLyPKVhkAqRXq4AFPr+?=
 =?us-ascii?Q?hib2aAKt2YfasunSket8Bor5QxXtSdCOizOOwNhZIbj9//1xFi8vKpfGzJ9M?=
 =?us-ascii?Q?tZQMby4iAkw1czzjh6KmksocOjhhaKPGIpunlWIjgqtErswHC137YNyjGaGo?=
 =?us-ascii?Q?xEg9tnKNc6PvvquxRPP1Tix+LPcieMlka82nLdBNs9NbNAXQlrQhbjE4+zgo?=
 =?us-ascii?Q?Wh1UXsyiyLz6STLA9FiBpSgrDsdEHUpYwFINgpIj1uCr3F/lsK9ohCrJsL2m?=
 =?us-ascii?Q?IRPvKSbSyite+Vyd0G0VbRM+3E0L4rmLmcNdZ7ALyfXhpNc2NbQa10SY8Jab?=
 =?us-ascii?Q?In9aWYbiQ5KG1ODPBWwSWtbGY5k9AH/mgdZ0y/u4k72mlGHU2k7Yq0nJVANu?=
 =?us-ascii?Q?Q7STnZkuFxFgEBo7SSgFWnZXSqKRRB9gWUjeyPaViAV+9ekie66UEPlPFCug?=
 =?us-ascii?Q?cXNPylmJNXeaQiqhZRM8E5luNGF33BBeZNCbK7qWCIa18Sh0VqkGUnwCzv3j?=
 =?us-ascii?Q?7ZLk49YmoquRj+lh4OX4Lt5Dose9qIyRfyX1MDzJoTNjZlvZd6Q3GmwRlLBv?=
 =?us-ascii?Q?OZnAJqGo7+0ew46QdlLf1qBSUXhrcRT/KT3XnIkUjrj/xWEsVJ/h5AYWKyKo?=
 =?us-ascii?Q?K8uVWCpHMMB+perfpVPIHKAB7wt3tALpykjJqLbJq3PITL0l03pH51rfRM+9?=
 =?us-ascii?Q?vx44Qki7NTRnWdV90it4DmZgUNWTB8knG305n+8lKBO8XyS49cRWixDccaE2?=
 =?us-ascii?Q?3Rd8WjeNpdXHGnjEYtM0smH341OASzHmFEK6T+2dpxrUa8UIQzrTxjB/qSxv?=
 =?us-ascii?Q?l+It0Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f6ab20-8082-4344-13e1-08d9b69b2b44
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:21.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8IUMcWSQ46CzzEKAWU9avPgINPWC0sMVVigqVvsetdSg3kYmjHv17Gk6XNVpvVVacHlI1CBY1iW7CuG5WEFmSLHiCQb1ImqX3zaNZ6VXks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Received-SPF: pass client-ip=40.107.15.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Make the informal rules formal. In further commit we'll add
corresponding assertions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index f885f113ef..8a3278d4b6 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -290,6 +290,48 @@ enum {
  *
  * At least one of DATA, METADATA, FILTERED, or COW must be set for
  * every child.
+ *
+ *
+ * = Connection with bs->children, bs->file and bs->backing fields =
+ *
+ * 1. Filters
+ *
+ * Filter drivers has drv->is_filter = true.
+ *
+ * Filter driver has exactly one FILTERED|PRIMARY child, any may have other
+ * children which must not have these bits (the example is copy-before-write
+ * filter that also has target DATA child).
+ *
+ * Filter driver never has COW children.
+ *
+ * For all filters except for mirror_top and commit_top, the filtered child is
+ * linked in bs->file, bs->backing is NULL.
+ *
+ * For mirror_top and commit_top filtered child is linked in bs->backing and
+ * their bs->file is NULL. These two filters has drv->filtered_child_is_backing
+ * = true.
+ *
+ * 2. "raw" driver (block/raw-format.c)
+ *
+ * Formally it's not a filter (drv->is_filter = false)
+ *
+ * bs->backing is always NULL
+ *
+ * Only has one child, linked in bs->file. It's role is either FILTERED|PRIMARY
+ * (like filter) either DATA|PRIMARY depending on options.
+ *
+ * 3. Other drivers
+ *
+ * Doesn't have any FILTERED children.
+ *
+ * May have at most one COW child. In this case it's linked in bs->backing.
+ * Otherwise bs->backing is NULL. COW child is never PRIMARY.
+ *
+ * May have at most one PRIMARY child. In this case it's linked in bs->file.
+ * Otherwise bs->file is NULL.
+ *
+ * May also have some other children that don't have neither PRIMARY nor COW
+ * bits set.
  */
 enum BdrvChildRoleBits {
     /*
-- 
2.31.1


