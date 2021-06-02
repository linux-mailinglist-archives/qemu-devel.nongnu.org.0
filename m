Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D878B398A44
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:17:42 +0200 (CEST)
Received: from localhost ([::1]:53528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQkf-0000Zr-T7
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQf2-0000Fu-D5; Wed, 02 Jun 2021 09:11:54 -0400
Received: from mail-eopbgr70091.outbound.protection.outlook.com
 ([40.107.7.91]:46453 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQeq-0003E1-Oi; Wed, 02 Jun 2021 09:11:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqtCI+wvqhDNdXPeGmbd/ShKX/yhmMvCXrY6DQTCIa/yVwtB2EW5qhB6No4oAmd2hfbFFCSbgtkmYI2c7mF6kx2+rd0lvmGtuTGJWYRZFPAvlP83RGnKVscFMIO0GJBp5kX9lwvZypdu9EcPBVVkTC8B08p9lsb/8BxXtqjti5n5NfJH1eFMHV8VbIzj6IDutQO+YSs6D8x8qvZqMxW/imvyecnv6jq8JQNbStNJpF40EkDDDOAgehErsY94fvG+X67HDTrUK+yqBGGasyHLxpf5lUDMuqayKfFlPfNh0AkVMwfB66xyagJFnsbJ4XAVUqB+ZWBo8/n0rZOdr+NU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZL1atromED1QE5mDCQjohgPAZ8+7OhQsQ9fiQ1H2O0=;
 b=BZ7ZgvNmci4a/XFbIE0UaFGIyuorUa3t55Eq0Ll8rj/2DoUYIp+ffJ7ACYPSTMIyF3aZdxPtmopUiwLPtQJejd0QPrJaNLUSdv7mu9xRppCm2pk97GW+Ugq+n9D+2DL8urDxVcgIQfVMYjvhbb2xE7751CtLem7Xffp4q6yUoSjxo3/jszsYHe0qACJZIHTYKtvJAcaePTSdTMdhT1s5HVoOjxJEIM6swnkGKxY74WvRwP1Pw6+ibyWnc7Wl/4cZv0cpjeZH8Qa2FjdpAMLFz+RjKDRvSsA65qOYTDVE5Az57MTYj02ybvUNQYS/YffudRhPcBXgDJUm6jocNwLG+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZL1atromED1QE5mDCQjohgPAZ8+7OhQsQ9fiQ1H2O0=;
 b=iPaN3m2GMmmDWF7w30GxRaC5RHyfd/2rLfjMPZFej+rEbrGc7u/WgFYGdW8Fl87YlzcvwYllrShvCXz57hR2eTmZslxnsbER43v+TKFnQkZ4lwjkT4l6K52lP2Z3zfUu8GsEKA8V2VVNHrfpqdpcq2JiS9Lo+kn8ltuRp8/NQKQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6376.eurprd08.prod.outlook.com (2603:10a6:20b:33e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 13:11:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 03/35] block: introduce bdrv_replace_child_bs()
Date: Wed,  2 Jun 2021 16:10:36 +0300
Message-Id: <20210602131108.74979-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 242f0c77-5093-4294-542a-08d925c7ef9c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6376E2B0DDF13329043818FDC13D9@AS8PR08MB6376.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Xkp6AFhCUZIxmMQMdq0RRvhWSqT76S75z44PUgJNIjJbNLZ8HEx+BlhKBtr/AncOM3QZqD9Llq/CWsgSUU+rt4u5IPjrBBiGViQ+/w6cajteeWL5mw85ws/c5ZjKQQqoMS9S07EOC8Z66B1QpcXivkvQOtbGe0p1mVCQa5ohmUD28tj7nQwZUbbhWWte1D4kQNAPgJgl+HZcKmMSNO3carF3T0QsLkEqg69m4xzhDrUlS31dYd6ETDukjSBdHVJzMuymnaJiZCMXrCloWA04gtcQ5Sffb+VX7Yi8jIy/4cHceIriDXuvg0qEyX1EBIjfP8MvyUI41uQ4OX4GdIZpl8XRCpnJtEIAgD646Yh2Vu7MEzHwAENUvUFzmD+k8tebw9qh2y/QyiG2LTg9scWrPHmV12QmgB1TKaDwJ6+054nf5bQXWg0BNNR37ME4HMA+pPnvGUCjpogTlNyOnGQvmBfxWeUVljBOGyOnYGiJI7vxpqvkDBWJy10cmiUmdNToxh71WV7HEZR0fyfBmYK5Vv5iuKBzD5llvnCyMkSRLUjgNIV2gyEpfkFYskkI4JPYsU1w1GKxd7aCH7HCbTAELCIXnjzrYk5MOFPZHEZ9YtazAuTEnmMpC5ReXp3XyU8tA2VxGJ5WyLLdo1byCs6fXr6QrqT5V7v4rrlueBpkO+rRH3dsM3bZ5DBq6akHJTY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39840400004)(396003)(346002)(8936002)(66476007)(66946007)(6512007)(86362001)(1076003)(36756003)(6486002)(7416002)(956004)(2616005)(83380400001)(52116002)(38350700002)(6506007)(8676002)(5660300002)(26005)(6916009)(2906002)(16526019)(6666004)(316002)(186003)(38100700002)(478600001)(4326008)(66556008)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?e/W8WaP4pdOzScYJRBlbMmUCrNlvcubs7x12YbSxJwqOjy5NQF7XwCw+HPbG?=
 =?us-ascii?Q?AhYyIzcOhiLUNjZu23q02AIXqSuLvux7ofrm2HItweS01zDxoVNInRv3HNnP?=
 =?us-ascii?Q?qmo7Ya62YX9BewCORve5k9T4oZ9n+xGtavxX0L0Msw4TMkubLmmG+VJfLMZu?=
 =?us-ascii?Q?AgNMT/MMUiYhVaaQ+mdsAj0dInuD0PYhiS6XjN5JhpYaahyOwFcz3lsKK67x?=
 =?us-ascii?Q?oC/UB29PrPRceXHgRFokrmF/rKGJATCHyMUtNNHOS0UNsduSGL926dFKkRcn?=
 =?us-ascii?Q?m0raRb0IFQxNCu4wdeNwRtvqktR6aja/Dje0iElaTn50Ms5INbs+C1AcSxO3?=
 =?us-ascii?Q?eoU+yMSoH2/Bj1PyjulUtk2OywgVyamj3SPv3vo0r2Ww0ghU5prY7rTFoLq8?=
 =?us-ascii?Q?tGwU+eWzPG5IChstbUCTOBV0nIdkcGE6BrnLdxakULkc5BMHATgFebwMB1zn?=
 =?us-ascii?Q?eTwhv8TRPGr6HYk3hGg72MQqvf9+wjqJsliGS1D9KsZO63q02o9RIE1ZZMy2?=
 =?us-ascii?Q?UJkc3ds1OwLN6OHLzubbY9wfUy8UpzYHryeDdsU1LXRdd1Lb6h5lsQDkxDRd?=
 =?us-ascii?Q?UFwbLbD77nFoqMh+sz7Wz7dsLm7QfpEyrU55ZPy5CGilrOr1QyxyBvTdHEZq?=
 =?us-ascii?Q?YYBIzCkUrTnwqj38wW5P95rjlWJ6SNbNdOU+D1Ae4yJVqV71UDmr78lMtcjO?=
 =?us-ascii?Q?bBasehC6lHQb5Aa0KVB4nqyHtGQI0UF6KJW4T+osOvxBvjijKMwNkzlchusA?=
 =?us-ascii?Q?0n6nDE10wSrnCKXb7jlba97TF0IXKEGn/3S+Sw36mTkZ2FHshXYmI2eaIMWR?=
 =?us-ascii?Q?P2LfGT6w8oswvdKTti8YghLI9SeUpknW0je5/NtjLJ4OoHluua0JFFaXORN1?=
 =?us-ascii?Q?WJ4HUQnkvWgbtdcrCGPGeJ0l5d2JFa70Oa3csraYD6ETleOwlUEGJWB0Wiz8?=
 =?us-ascii?Q?ICcdIByIP9xIB9pwxgMmonLpvLiTJLwugv4PennTmeOQedKoMhryqI5HKYyi?=
 =?us-ascii?Q?F8LI20me7qFqT/5bU8I4VdqC0spSVtnakfAPqvPvizHFcdi97r/aejzyNj0K?=
 =?us-ascii?Q?oIsM9AqR+5Z14YUD2CWRvS+SEaiYUeUThc8EBoRPkhX3OR7AkGTLqQs+XQRc?=
 =?us-ascii?Q?aPdVRqEsOlxodLD6Ph82jvtUxkucuIO7BDnBtLXiChwNf4GYqFQV3lqPyd7B?=
 =?us-ascii?Q?jqBuoAGnHkcuSGMCFCoJIS3NFC6QhtRi6ZgpETSq7cZ0oHkbZ29no4C4Qi9V?=
 =?us-ascii?Q?6OzFGN7BApT9Js6186aZj5B9/z5etlPxEC1DC5e4NOvR70FmjiCDkGOZP7Sz?=
 =?us-ascii?Q?ONFqKnYKmYmGV7mr8JkQ2/As?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 242f0c77-5093-4294-542a-08d925c7ef9c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:29.9719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0n+BMic1dAyZ5u0YXkFwuBiU5HthszvP+iz01J90SGo2qaGwuwWm1uLbxoNOP2Zif0+45eD9M5/QInGCq7x9pSj7en3LMP03auf1vDx0ytM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6376
Received-SPF: pass client-ip=40.107.7.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Add function to transactionally replace bs inside BdrvChild.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  2 ++
 block.c               | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 8e707a83b7..3a16ca341d 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -361,6 +361,8 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp);
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
+int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+                          Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
diff --git a/block.c b/block.c
index 98673e788a..b6658381e3 100644
--- a/block.c
+++ b/block.c
@@ -4987,6 +4987,37 @@ out:
     return ret;
 }
 
+/* Not for empty child */
+int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
+                          Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
+    BlockDriverState *old_bs = child->bs;
+
+    bdrv_ref(old_bs);
+    bdrv_drained_begin(old_bs);
+    bdrv_drained_begin(new_bs);
+
+    bdrv_replace_child_tran(child, new_bs, tran);
+
+    found = g_hash_table_new(NULL, NULL);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
+    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
+
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+
+    tran_finalize(tran, ret);
+
+    bdrv_drained_end(old_bs);
+    bdrv_drained_end(new_bs);
+    bdrv_unref(old_bs);
+
+    return ret;
+}
+
 static void bdrv_delete(BlockDriverState *bs)
 {
     assert(bdrv_op_blocker_is_empty(bs));
-- 
2.29.2


