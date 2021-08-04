Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFF73DFE3C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:43:39 +0200 (CEST)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDR4-0005Eu-RM
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMM-0004Xk-6E; Wed, 04 Aug 2021 05:38:46 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:22757 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMK-0005wf-OT; Wed, 04 Aug 2021 05:38:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNQgs1VJTifnqDsdSu0yUkKzJZiRv5aipt84jG961hByYoEDMyPlxO9D4PkUcO54PSENqLphvn6pDVWlfQy0KZHFheRleqGbh/COH2kW55iawLlt5l48Gplcrhs9TQtzGcqlkIbnMigOJkS8d08ZE/Ivn4L/g++PnwlPty3JBf/akuyFO7htkAMW1Y6ZN01JvlJjG/9wdvseJ1pODr1roDvGscNEBMJgllYZiF2O65OsLL44DtCSn+46aMHv1DojG/zWOILldiZ1SbeEdIHYqoxyTinNubn31pBTPTGIL3HACowcc5N4BEV26vXv6D7SvmJPCllz0yVz9fVnVdOthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86yxeNMvCmwRKQqxnvVlBp2jN3bg7Kd0X2SNe01MIcM=;
 b=BBbnpVPU+5idsZL6EQ5uC+eKBQd566eFy+Z7eRc0a7D9tkbVbW6VC6MxwAAZgP5795RDBp3gSLj966cZkfrXhA4Z4NpUV9ORdedoF/z9h9u3sMilb3xVPhwLHiBBvQjAqNsC6rKonsHf88hkbO4/O7USSANQXbm99VoObrkuMd5HREGLxYoI+jKtLgwamI3iXvPWCfRf/W6iTSGmII1GFYjg44SVUQg1qF+nbD948hcJ4cu1dQn55MvX/UurL0DDSUEqIEwTzBaQmK1bfsaGCxS9NyovNN5sYctbkmMdiqm55EcViwyA8ZObPHj7vRiL2ch/plhu8bUMU5A9nUOXuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86yxeNMvCmwRKQqxnvVlBp2jN3bg7Kd0X2SNe01MIcM=;
 b=QZ75+yCeTchCQMMnPOZHxLOR5hQ1Rx6WyGu5lBVrbp3AaQle38czeNthHOkgFcwVgh5SkVdWpYBXq+crUGml+bw3uMzbYidFYR1T8uEj0gWDkPP3nYMVdJfm0dI3Ju149l3Fppxap8vG0WhOcw2LkLEDjbU8rvHYkogo/RHoZ+o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3622.eurprd08.prod.outlook.com (2603:10a6:20b:4c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 09:38:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 01/33] block: introduce bdrv_replace_child_bs()
Date: Wed,  4 Aug 2021 12:37:41 +0300
Message-Id: <20210804093813.20688-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41f065c5-1cc2-42ca-90f5-08d9572ba206
X-MS-TrafficTypeDiagnostic: AM6PR08MB3622:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB36222B3731807304AF4A0BC5C1F19@AM6PR08MB3622.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4GWIMeWQ8USMyj/2ZvBG+ktrlR/PU+E30wN5LUmtEe0L7uJ8ZHxZAIoBkCfSYZWtSWgC9zWdPxUtcCV4NmJi96+yzGQmjU0P1m7eqgYHGimByu7LV4SVsxmU9lfvgiYVexpRZywC0ldZZPYzuwzFFQ36QZpzvIHzcbAGqe/6xSCdITqWciiHlffS1Eg58YMtxoNrxkvxAkdvV3E3gETvzZ5yXeKAt0BZwKAphBnrG9UXQMoQ+Jd+LVqne1nJa0DgD1hqStEdu81rOq4KD1NKsoPMyoDvXKu2ji3ggmvuxaHtSyGG3qnH5tYcqcTLjTA20feeF7KhZaWk7af0FCYHXg14R/WxBKIXJ9AJSRFc52c3Uru73BU88BX63z93YWutr7EMnv5eYjsw3sRQ6QO/Z9MY7AlP7tFmlzThTrIpom+O/53SU+E0vPKDgJNVQwqMWlqOtvSG6pPa3pFnWF27bdeUeCMY3zjZI2M6kz51pO/Lw4J98WG9ze6BOSM585fUmPtNApjMEtD5B7powkOHfIBE30Uecq/j5gZJwiYfW7+ebdbrlMAC5t6uMlANMLbq9lGbZ2I+O1a7mdV3T87Z+p2gCf6UGE1xcwYumiTwIAklmOWqSpJopkvBWQMAeZ+EWoWWLQ+qS9bNFFowaqal4SFk97ecTAFIBxHtDGZjPdWBl9PLNduAk5G2SUPrnWdWVTRTVzhTV0eFQC2yLXiw5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39840400004)(366004)(4326008)(1076003)(26005)(8936002)(8676002)(2906002)(316002)(66946007)(6666004)(66556008)(66476007)(6916009)(7416002)(2616005)(6506007)(956004)(86362001)(186003)(36756003)(38350700002)(6512007)(52116002)(478600001)(38100700002)(5660300002)(83380400001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hdZ6KhYFZAVK6K33fa1QBKMf7QJaKhZnL1Hc252CCLmEmnbEPsdznoXC3MYo?=
 =?us-ascii?Q?L21HDMlNOR40LIiSSyHvDDBoPxhN4QEZMqlCMonFjrTRp9TJRz82RSA+c2eZ?=
 =?us-ascii?Q?R++W11OIVQLOP6CweuImAyRujej3stmljHW/Oof4itTe+ACyBzBsLdTWqk/u?=
 =?us-ascii?Q?/+E07ufuzpRypTVcIKKTaBtrIuDeuJM0C/mCl/gkM21JCgZP0NHd7k66bMIS?=
 =?us-ascii?Q?Q7Vx7n00EgXDqJvDcOJJXKxznh5kfqSmGVQyWxMRj0nwehzUsA63g8FgADNm?=
 =?us-ascii?Q?rYFj15WkC+iG6GceFlL7ql1YyitVZaU3bWafyrRFu3DDS5OED2eHWzx2jMZI?=
 =?us-ascii?Q?eNM6KyU9FMKZKJlPj4kBxNXK6rrrNepgyRFNQlvS6gEP2I3PtuR36Itiq8t+?=
 =?us-ascii?Q?MPz9gksaDZlxDH+VG8lctjLak+QYn0oWTKU8+W7/Z+EZt/3NE/zhU54Pl6Wg?=
 =?us-ascii?Q?85f2xYST3pAN+EC8Y342bV3vccSDsZrZumQzMI8lmihqEIBjl18peRSbBGMj?=
 =?us-ascii?Q?ZGOIPeP0PoY1oCd9nHyi403ae4N0catCZdqx1tOi0XNLdo6QTEZ1sdM4G+xE?=
 =?us-ascii?Q?awdtGh1AAjl9j7EjjfPwC6Zj9K3EdPKkDqwoe1QMLUR3Bel9VKZKdG6Xd+dW?=
 =?us-ascii?Q?7DrnBBJ9uX8cv0U/AtAuA1f3CxL7q0X/nHq4Y/RtRO834t204Vo5W2CxEyOQ?=
 =?us-ascii?Q?Z3VUOH0aml8YHWRo+IaMSd/ZDqQp9dlSyvF+L4cKbJpk2zATM0vSNHlwAdud?=
 =?us-ascii?Q?k7+6bxdjz3NvYr5TAbAHgOYmULgH3i6nreqoMlW4FB9HsA6ysOpGeNTevM++?=
 =?us-ascii?Q?68CG11GLKv8aFQFnfoqq/2jBRGcIMLByr8eqeaAweXi3qzGJxfefE1OXERta?=
 =?us-ascii?Q?RrU4GTqeCQ/5X/wf8hzX161lJI3n0rNFdw5FDANKhxBEJ4d4GUjLyzSV6EWl?=
 =?us-ascii?Q?QPOE6g9jKyv0JvETEd+BO6fbMbjd3dhxqKmbB6BPIwgs7vGQDv01ibslm72U?=
 =?us-ascii?Q?2S1vLrUff4AWSNGFHmZxOm3LTqOCWF2bpTCeIIfrd2PiENclTNCyknjtEBS7?=
 =?us-ascii?Q?8FtI6aAPUsJxXY5uTxksh9URK2jHm1uKjlwf0H7DxCcD9UVC+RdOSj6UHD9k?=
 =?us-ascii?Q?vDjDJlJN5Dr//w9HcZsTwdflj5QKdNlCD+GU/FBb9GNi0LW3kE3Vq7KrTWWZ?=
 =?us-ascii?Q?coptZCuSj4lZj3tkx7qhEUKM3Y7d7EgL2LhxqNv10ROJkQTO1wwM5l8UrQA5?=
 =?us-ascii?Q?PPhJK64zhPkZ0721ovtD8G5ADxClFoECYlsquxW4x6GhQMOkzni5U65vbIqi?=
 =?us-ascii?Q?AcxmdaVZ90q92vA6lV6N193I?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f065c5-1cc2-42ca-90f5-08d9572ba206
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:36.4609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xh/z2kTjwTiVQ7PPgyDj3/gaReXR5MTmssd0KCURXWfBLjXDWlNdRtU/zwD3w6vyLIkqucw9DNkKLVotgtHsbROAx8BwPEeEfupmPPjU0KY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3622
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Add function to transactionally replace bs inside BdrvChild.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  2 ++
 block.c               | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index 3477290f9a..740038a892 100644
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
index e97ce0b1c8..b2b66263f9 100644
--- a/block.c
+++ b/block.c
@@ -5048,6 +5048,37 @@ out:
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


