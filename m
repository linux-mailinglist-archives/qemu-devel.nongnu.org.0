Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F4B3684EE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:34:06 +0200 (CEST)
Received: from localhost ([::1]:32812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcHF-0000sT-Ou
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEQ-0007FG-6a; Thu, 22 Apr 2021 12:31:10 -0400
Received: from mail-eopbgr00116.outbound.protection.outlook.com
 ([40.107.0.116]:34309 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEN-0003vI-CL; Thu, 22 Apr 2021 12:31:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gUmYLLte4g5lNBj1W0bMeWn+nTnGA4akmU4HHx4Pprppe9Ktji9+GlpehQs+0SMNbLXh1mfVqCOsYA0j2mRsb8Ul4WPol2UWVzoHDHw0Pz0fox618kKdf+KQSeSzzWxVjJczRkZA5E4f3p7waW6hgEI1QUx7QFdYPkp7DJeR5TRh3qca+PyR1Q6ANxHZQmdqocagDsnR0eQXaPbf/sFiJpWOuaUmZM5or0yYRkg7sF9O1HcD4TqZLLVkutV8Is1zQJl6KT2wY8OA8Kp7vwBLRxbYjvklWVzVvTN1DNY0YH7j75RsYo+sW4mRZgLcOk2V8+b7Oq7b9JaGmWUNDRvL4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npxNJiFest1z8IJPxdmXyA8pKlwHD2qgBk1aiTw34KM=;
 b=bjIkkkqceemP1ed3Vi6rj1yByu2oArlswpOiDz961UxOvsME2xk21WMPwuHrOtWPBYoKS+wL09kGeKAswwqw2IdztFIuptuuulQxUP13R32J74po6LjYhOPyUEqGVG0CW+oCBSrBeETY9yj0GxpIXaXSv9xhi77uf0f64Ym1wCqkPdmgu23EvOJeeDT21xd8lNTBAaciK9MPUDZz3IeeUeYudHLkmUGb8ngeKn1nneonJX5HHawImSvdxUan54ierVj3xYJbjh8PXScehOAl0ZNW2j4h7RRphaTDA55JPoE4jKLrkoYllJ5Fdi5c/8ermrkGswWWoEFABd+QzExDhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npxNJiFest1z8IJPxdmXyA8pKlwHD2qgBk1aiTw34KM=;
 b=BPt+g5MYO1EYRBit/jh2CRWGztbBsZrSQybc5azPBkZ9Byv0EkyQjMw1DnfhwWz0IV6bvo9qMIkcRlNtLB/E0XXjQ+oipntqOsPOSCTQe+g1jouE6uwJwhAG5aiEO1yXYCho16D0QLQlhKPrAqrc3fJABbovtoA2c0V9regifpY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3861.eurprd08.prod.outlook.com (2603:10a6:20b:80::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 16:31:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, Alberto Garcia <berto@igalia.com>
Subject: [PATCH v6 02/12] qcow2: fix cache discarding in update_refcount()
Date: Thu, 22 Apr 2021 19:30:36 +0300
Message-Id: <20210422163046.442932-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97de162a-d349-4db6-c8fa-08d905ac0592
X-MS-TrafficTypeDiagnostic: AM6PR08MB3861:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38610E63F3AEE8B100D02529C1469@AM6PR08MB3861.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUUY+y7NnwII1kU2bOYp+qknHr5w0qCyCNfEI11U9m3w3MP7LAavKWSI37M5ZQQ7B5CVE1AEOY3Cyi3UmPjoFLWjTbheQCO5yt2uDmRfarQG2po755mTm9zOobb4jzcbBMguIcQz+bajkNLRr9tBgT/1vIDbfF0XMfX8eNTTiGv0VYjGSCyqZQZtKdlIFnxyDRbYvUuNAMGd8CIW1khH94pHOrJvgBpIk3bXs8umqzOG5I6Ea7nGLVy77ZimsMVkNWcclqGZtqFTFV/igNgECyOZoE5I+4BS89d5sWwiGIBMuncKuddfuxfDtEQsRUoG2bn2Xdi9H6Fp19M12kT8otb76JUo2anAGwSrz8UInU2Nkkh/Q5yHbUkRWhvc0/+pUQHrI8IeU/CeF3SDYG+2u0kdNT6fxLW8OSeUTkX/6IrVimJ0kVYYHtaIZp/i9WmLoI0fhlKn9eXyeA+sikga20Eer99evUZx485XNepUMkvugMXfRpw6pDOryuDVV/sjA2ztZznCULA3Ln5MUycaBgtM4VfiGH6qZQE05MJ5QuzYb5JVkYxJCkt14MwV/8BQ+y+8G6HFbKTeepFzIzWff/v9Dvzklcjg4UmiZYphCXBy/EPVC1mJCDoXn+Llcwpju2QtlL/T3MrZ/4Yx1fvk7I5Fr6SQPloKzu+D/UetH+b7Vg6+LIekOCon+G1kR+3B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39840400004)(396003)(6666004)(4326008)(26005)(6486002)(956004)(2906002)(83380400001)(2616005)(52116002)(316002)(478600001)(8936002)(66476007)(15650500001)(6916009)(66556008)(66946007)(38100700002)(1076003)(38350700002)(5660300002)(6506007)(8676002)(186003)(6512007)(16526019)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GMiGFEp9Zx3+7VZ5FUAKMzo5J8SFziMp6yMLUhWFjnvlRHCc3Mg3pqfNegpa?=
 =?us-ascii?Q?bU7SLq/r/eP2YqrPxGGlnDL9j21swZFcKhBnjFBAo0615l3KUKcNUht+VmBO?=
 =?us-ascii?Q?6EML2/6E9wxD2NITM+NEIgyEuuSM/U07dMF3fSnV2yjLm6pEuy6Gwin4L27q?=
 =?us-ascii?Q?KwNYwRjJ3pEKjWNPdaevlXHLtCgpu+WpE8lTJKQ8t4vCK+U5DoIXgJ+xeWOZ?=
 =?us-ascii?Q?4w9B9XGLELlJNfTQMexVP8Xm5WiaAOdQrUUHdHYc01f+p8QmWO80ZonR+X0U?=
 =?us-ascii?Q?dqavQjAgq6GZ2BdyEt2qjkO+yZi7BFU3bA6X04KXNU8dyWCULIsCsG+liF/O?=
 =?us-ascii?Q?Y3J/8iTwtHiwygcYNBC3rBSZzskKnw+78fG5gc8A+2Bst3acjW9ZUOe0EbVD?=
 =?us-ascii?Q?fTkhkIoi2LinnF1giPyGY/i4LfhBMcPmTWdxoThv4XrC2fudbaeRyY+aDqzE?=
 =?us-ascii?Q?XdoO7il6bFRZwSkmdoDOXRIAZKan6/Md+Rqa36s1rJqoX3Rr9GKTWw+kQjP6?=
 =?us-ascii?Q?D71kIGScgHLkCoASh1FBy9CfI7CppfK9z45UAuw5OdSRXQMh+pZyTeN5jy/H?=
 =?us-ascii?Q?L2z62lXUuQudu62RtgXD89Mt7jsAiAixXeQgHm3iWJIv8HmsLPv5BHojaMW/?=
 =?us-ascii?Q?cnYCaSVfZCKRR750g4JrNq9FijejIDIPcXkOUwMlhMH4yBdqlbcM/L+IVcpS?=
 =?us-ascii?Q?66MKDMd7WWcyJtE8e/oIUdipS6OT9ErCzvlgUJwzV8WIKT5oIemf+VlgvDxO?=
 =?us-ascii?Q?GDoEeqCait4pURK1Bi5g/JNMAKMUnG0egqq75tdkU2uDL5uOcY1+Y40qecSn?=
 =?us-ascii?Q?N6RB6WVVR9OOCMd5mz08Gfai5oR6vEehZmXH1j/WrBtGJhEEgx2rz2cYY3qz?=
 =?us-ascii?Q?HrR5DToA+xrT19ZyRq3M1TLW4jWZNB2dgbjpNsW5oAOsF4Zkk22pM3Q8H2e2?=
 =?us-ascii?Q?6XJWImlX/jK0J2U2WBqovsn9CJDZYpc3fWbxWi2bL+xtOW4N8oIzdEG5QJ4p?=
 =?us-ascii?Q?idwYwSsZusmkSMuCXrDm38lGkyTyIFu2WWzwF+Uh3cS25q2l/A/uQXI0TVqL?=
 =?us-ascii?Q?5SVDzemX9jxvPXwDzNrUyLaBXCAc++LR8Ats6s12qp1ZOroNrXcJNNsduZsd?=
 =?us-ascii?Q?aHOBz2dgEub7qHVyaWUkinw/wJ5phTIRZn6ILVPxPz9W+d8V8w/1EYvTXpiV?=
 =?us-ascii?Q?fLTImNCbkAhU+tNMg3RWfm4ThvIYt2DnWL49sYGY94KTxz4DT5HMYhDmzBe+?=
 =?us-ascii?Q?FjYKYn7Y5nCLo5quTuKHwHVslSclYMWDC7CX4a0gHHh3CPgKTS9CvvQJDswN?=
 =?us-ascii?Q?9I7tlxalt3KENFv3g5z+D8j7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97de162a-d349-4db6-c8fa-08d905ac0592
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:03.7208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PdMuUCsg+SnNGjF2S/cGIu0D52RlqGyM77ni7zzQtdie9DlJ2b+urOq5MBiOm2/RYJJtyUeu/+uWiqW/DavnYwFKsU2h4vuLLQufv5csnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3861
Received-SPF: pass client-ip=40.107.0.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here refcount of cluster at @cluster_offset reached 0, so we "free"
that cluster. Not a cluster at @offset. The thing that save us from the
bug is that L2 tables and refblocks are discarded one by one. Still,
let's be precise.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-refcount.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 8e649b008e..543fcf289c 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -887,14 +887,15 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
             void *table;
 
             table = qcow2_cache_is_table_offset(s->refcount_block_cache,
-                                                offset);
+                                                cluster_offset);
             if (table != NULL) {
                 qcow2_cache_put(s->refcount_block_cache, &refcount_block);
                 old_table_index = -1;
                 qcow2_cache_discard(s->refcount_block_cache, table);
             }
 
-            table = qcow2_cache_is_table_offset(s->l2_table_cache, offset);
+            table = qcow2_cache_is_table_offset(s->l2_table_cache,
+                                                cluster_offset);
             if (table != NULL) {
                 qcow2_cache_discard(s->l2_table_cache, table);
             }
-- 
2.29.2


