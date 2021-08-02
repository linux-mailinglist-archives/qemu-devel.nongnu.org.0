Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A2B3DDFA7
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 20:56:58 +0200 (CEST)
Received: from localhost ([::1]:52902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAd7R-0005Y8-Gu
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 14:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5M-0002Uq-83; Mon, 02 Aug 2021 14:54:48 -0400
Received: from mail-vi1eur05on2137.outbound.protection.outlook.com
 ([40.107.21.137]:42689 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mAd5H-0001pD-6E; Mon, 02 Aug 2021 14:54:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUoG6MsX+HboUZT2VO/LieGHB212Ibjnk/IHvsfGsTDqm8gPhM19JNaphZIVt/dr5qOggzhTaiT9Wk0w/dIqwHbcbL9Se7e6snXiQUL7y9GH1dWaY5lstlXnI672Ch/jMuJ+kQzZWvXd5mLPX233c8N8Ncec0o3kjoNH4089Ai1ybTZRA86vsmQQPnIt5FagrEAIZeFJKKT0U/JDWNlXjFQrIUbRrzmrbqgHHCDkCPjGX+CxOwJ0WaW96pi786Cdawx7oU99mtXBj0LHkaKYk2Z7uYrdddAAZBXOQeBoVwzGIgPE5uCp6pbrsIX9Q8alWCrYjZu4RVo9UTlEj0l09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MucbcBTCBp8tc0cZf0YiJ41WmFMJ7c7UGBvOfdNNX2g=;
 b=ba1JzAt9VPEYpe6g88S7Tn9s/Gw4CaOJ5KnPVzyFKNsCRk1B1OMJTTkM9ksfqsvpmErN12k76cDvjXffMyQtNSCsHhx1wvjuPapD9jDNlONgQ7sZcYVGXCtdNicxawDJuW3XrOiudPjTHuTSBJxDavSOYC2b81k/fNCrNWTHbYEg7hnnBNDDh/62POerhhQ63bPaNtfR+WZbCBs8WdgdDAowrBa+hNGbrepeG6GegiL/f0crfb/c9rxSpYL99S1EjR0NDfngl4iZm86nT9X316ON+M/CAiAZv/1w0Xp0YvvCzyHIgSfmuwpKSnSxlxFYKKUp7fhXP0n6r55H5YGlDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MucbcBTCBp8tc0cZf0YiJ41WmFMJ7c7UGBvOfdNNX2g=;
 b=dEXbg+1tEGdX4miGSBY2fvXcsmHbvCnBCIwCLp/DyXNUv8o+wntpiewkYdPSOGTiyZuXAPQUaNXhEqM1Ga5swEcR0QnErfKaXMwJmurAUcSZzLj+hINj1t+xtnT+oMumzyrQ2uDBVq0tk8jwkKVQJ7pHyFu9nZuIvLAarbAgW5c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Mon, 2 Aug
 2021 18:54:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 18:54:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, armbru@redhat.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH 1/8] block-backend: blk_root(): drop const specifier on return
 type
Date: Mon,  2 Aug 2021 21:54:09 +0300
Message-Id: <20210802185416.50877-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210802185416.50877-1-vsementsov@virtuozzo.com>
References: <20210802185416.50877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0240.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR05CA0240.eurprd05.prod.outlook.com (2603:10a6:3:fb::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 18:54:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 493359b2-e534-4966-782d-08d955e6f8c7
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44051921BBEC1A09BD8D331EC1EF9@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ffJfbLrT9sKwzqoejZN4Vh5AW6coFvgvatCOACNKM6oh6qfQAQ+7SUnV929DWRAdOJI8UzIbn7FPBq8h3u5YnmeISaHFLXM4NcbzjSCsFs2z67KNfdzaLxl7DXJyJqVeR9yQTt76Q8eztsGhqNU4Z2pK2aKIuBsAkCPGYhFwlZcOm0gbyvSa21zqizMjaHqP1cXjTuo5DKtfgziCLJNKvz/2biFzgapjrK/uoL0djKPrmfpuR2zFS+HI/H6GsH7NyFo3S1M/fo556I50KPaTrJWyAhmllkRMDlS/Nw4dkm9ECUtwgYEmtBsu8ziXDXWHMhclv1XTBImbcRcL9a6AjJ5Y4ntBMYGn+Ro0GMyOmBoxovasgpSA9mnGCS80ip+zZ0tNS4f9aN8aRw/YHfagQybRueB9oCvtoM2ASCfyWDWRStf8KHkZqUvwOa7a2Wsa0F9wk0Hn9Okx71wWxhArHkcOqf0OkW9MtMhBaa31igZwZgPsK/9vhttjH38M2yJ96g02SROLdTlgx1xLSl6QHJJxYKYsu8U2BU8M1muPtzWILa/rPAlxp+F70L9EVyCSOpq5hz40o8QI6WPpKw6Ml3HkpAHBnKK+WJdGEesIeHKNUV0pS7wu/qFMxaj17eGleGOp6xwZa3ckArj0sfmr1UeJEampjvVUk8PjSS2k1G0bJhNl5laOt1DS2viSnaBzibnr82I1snnRNN6hCqlGFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(396003)(136003)(376002)(346002)(186003)(2906002)(316002)(5660300002)(26005)(6916009)(2616005)(956004)(38100700002)(7416002)(38350700002)(4326008)(36756003)(86362001)(6512007)(66476007)(66946007)(66556008)(8936002)(6486002)(478600001)(1076003)(6506007)(8676002)(83380400001)(6666004)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jOX86tNqfPlPcFHkwPTDqlV3mEO5Zju/42C+2Wasdd+183wSMTIB3VryMWn6?=
 =?us-ascii?Q?znwQrzUtEdmqR54i3U+wQb9soFEG7Dus7YVdoDDRwFQUqn809y4aML/QEsVl?=
 =?us-ascii?Q?bOlIBBscfsEf8QVzgHlj3P0EyWv0w64je6h/wPxeUrNGUud9/NtuZmCIkMwB?=
 =?us-ascii?Q?VpmEBP84SYSrAY5iKyBOutGj3IxrhgcM9HddlJ16VA8USW9Cg/Fej7jZHl0p?=
 =?us-ascii?Q?aBk1Pc/QBFGru8A48j9qnhyGPOYY0sdVVcUq4XoI1aymQPImsMmBrpv7nu3g?=
 =?us-ascii?Q?cYnCu6p1FC1dtP/pMmY5h8szvpvGP9tbxFyj+D/BgOoMaQvx6bV550sGTtVJ?=
 =?us-ascii?Q?SBMgHeIIYtxcOAFYCI6/h55/uqAw/+w6cKzzn54GHOwThUPYS2+w3CvLvrLB?=
 =?us-ascii?Q?TkWQd2iB3welml/XKSzi/kNJmMmOuN5V3YSjFYxY5p51J5AV7yfICG43NTQd?=
 =?us-ascii?Q?lRSUkT8kCa6rouQVuyCW63biRifvxcqIP6j4A2unJoSNGkMr9M/oOthstw2t?=
 =?us-ascii?Q?D/unWYmZmnpdalnaL+fxmW+Fo8hh6kjIbzyh4GaDZVCdM0LWls1JOCQh3JIy?=
 =?us-ascii?Q?rbNtYW1Q3b3SIGrqex2/4tQIgeky2PRZe38Pt0EIQJeZACm6P07vAclcBmxf?=
 =?us-ascii?Q?1p2ptzK20pLEidUyERzqNtOv2lsx4WF5eR6fo3p7ftQVvmxs28FLcXGfmlkT?=
 =?us-ascii?Q?WFpqHRQzbeNGiGVUH+dsI3oUaWU+o/dyEei0RvF7+2ypLzJtdkkXCe4neDXd?=
 =?us-ascii?Q?K5NBByfeI4S5j0JeU6X3GrtqLaIGjU9HA6tFTDu/1MfGykTmQDq8+Ef0sZyz?=
 =?us-ascii?Q?5BP7GbJmFvuLkIS60wfLzFTPv3ilJzqiD+PEZNGdQoB3h/ZYWrOrrq1jINHI?=
 =?us-ascii?Q?TIUosXoeTqP7ShBGXpNaTrMjpf5ji4GmmzuqUhMZUFhpq5G+EejGNdEC1id9?=
 =?us-ascii?Q?MOtoHUbnhh5TZWra0nwRbgjJq81eiqp5NyKX651oXgR5BdkP8H/G0lCaKQnq?=
 =?us-ascii?Q?/8naNnVLLqA4vBFNFvoD4c3xmkXhqi0E/dM31j7c6SeFmbephNO1uUm2J3Sp?=
 =?us-ascii?Q?qamBC4Wz5leDoy3Fu6cKLE3lTL5/1PL0rGVTanQYg/FiUcDz8jncLN2zys9p?=
 =?us-ascii?Q?j4iB/08UPPpvtwTSO2SCF2majDpERh3M4lFjnEReOqQO0HqVzkUy/gQucqF2?=
 =?us-ascii?Q?k+6D8J/CuTEhSGRnho9ZfNcQOyQYn52xdL0sA6Iss7Ozi7PcAHNDPX92GNuV?=
 =?us-ascii?Q?e1GCVMkBwMTmuOFltYukNPwe6K0xu141ZMBx9/60kYQlzIeS+z7RJAqzzm4j?=
 =?us-ascii?Q?qfW/PYC3xNvbB5LYUUgTqQA7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493359b2-e534-4966-782d-08d955e6f8c7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 18:54:35.6118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPjaDWoqtY33n9N3PA+jyDbyD+lRPA8l/ZjESPHaF8YRTJfRqTB5IREvcCkoKfAL9ivqCPmZskmncn2syakFvk34T1Tam+AYNdpGb9IWN+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.21.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We'll need get non-const child pointer for graph modifications in
further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/sysemu/block-backend.h | 2 +-
 block/block-backend.c          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 9ac5f7bbd3..be03301123 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -270,7 +270,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                                    int bytes, BdrvRequestFlags read_flags,
                                    BdrvRequestFlags write_flags);
 
-const BdrvChild *blk_root(BlockBackend *blk);
+BdrvChild *blk_root(BlockBackend *blk);
 
 int blk_make_empty(BlockBackend *blk, Error **errp);
 
diff --git a/block/block-backend.c b/block/block-backend.c
index deb55c272e..7a0a1e1ae2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2455,7 +2455,7 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
                               bytes, read_flags, write_flags);
 }
 
-const BdrvChild *blk_root(BlockBackend *blk)
+BdrvChild *blk_root(BlockBackend *blk)
 {
     return blk->root;
 }
-- 
2.29.2


