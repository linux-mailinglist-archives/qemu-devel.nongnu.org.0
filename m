Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6849A2C6873
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:09:19 +0100 (CET)
Received: from localhost ([::1]:49596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifN8-0004Lq-8U
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:09:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1C-0001LD-8x; Fri, 27 Nov 2020 09:46:38 -0500
Received: from mail-am6eur05on2121.outbound.protection.outlook.com
 ([40.107.22.121]:11777 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1A-0003Hm-Dg; Fri, 27 Nov 2020 09:46:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VH6qX2PkB5iIioMDuknGbwshFfgF+wCqZontN901DJuM2nHWYxLzi8lpD5GlVhvc9rHt/D/Mo1aYaGHg29eOU3Bw2vLbjAkVtY3WOHOG3jk053KLFxnTNym19DbA8fxgA8rSt1LwqtuiQFKPlCYcGJkF8ByFUdK4mVFjdc7tsWTC5DRF08qEqHkBu4h/fZ1UKSaJXkpD1NknEkBP5FWyr9Qjq4Em05ciukTwNzmcZDX7Zuqm0pgfPC/aut5fkCJByXR13Wm0tVypBf6w0X6s216qVG6XX9VQgWfqLM5qIJ0GsHuBAVp2KLdwpr7nUGVq5hR2iAQaigcDa08dolFasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdqWO7wOkTjwxDUptEpRMyE/UmFT6wo50Q77C0UtaaY=;
 b=B+QSmEuD/jEqoAH0H3nWwU5XDOWnnrfmnY2WccpGrnIYTihY6UdYucjYSNqoJPBiF3/0h2DorpxlDGTnZCCJCFvn59k8hr23JXq31WkH7KrSLYUn0fG563a+U62Hcc1pGtir1XvB5A38dYLWQyRVBz61JWLy0w+vNj+5qDQdfzde9j/DVyzAuhztzvj6Sgr4IeUcV/JhB7PzoU5TrChjVBuwcDmRtrY52D1gMRFHL4YSBtlSSU8LICCeb1SNKaS2TT+8XUBOuEazBG10ytn2QscNcq9at9sMUCzgv3J+m+NxnwMKcbOO/48myOcd/YOMcqozOiopihSHHTefN1nK0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdqWO7wOkTjwxDUptEpRMyE/UmFT6wo50Q77C0UtaaY=;
 b=rl+oMzxEOVX1fd37KMC72hOy2tvLSy0JHN2SCBeTmM7VJOuff9IxxbJ7mBl3yTUydsWQghgYYqAOXcGCWo2G1Dv2eg5mH3k2RQkz5YrtrsYLPuBowFXkqjZaEfu3U+E0x91SmJxDLudLkSk55URJuBD2nGaiY2zmrrIDZ/I44dc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 23/36] block: adapt bdrv_append() for inserting filters
Date: Fri, 27 Nov 2020 17:45:09 +0300
Message-Id: <20201127144522.29991-24-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41c7ca23-cc3f-4ccd-2cb5-08d892e324c4
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078542020BE5D52944CB3DBC1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xI4/Geu4c+Awy+nzGTPgfIiC5+w0U8XGJ6hTMJFRQElrfE8msHJt9eGlhXiDwsuPKhdvNqinGAaHvlHHfo4u3EkEfrNyLLbwt9QMuVMILiauKQVQ3XThV2oX17b/UIuUlAWzxEzx47qfrcDIN6hogD7PqgFfO5CosIqMUx8q7KHywz5rvwHYW65LGgtyW30rc3ahe3/B0odO51q7BRtL0IrfdrA7jd7l+N0AVr3VV8peqJ7b47fTyJdUzdh1v/x3wbt/bpbdTV8LcVrhDR3hvqUd+HfIvHRtnP4YwtjdwmbPdwtA5jOL1xi4DnzCXisqwyoW35bjGDPYTQqAiRjK4RniG7QdckgxxPgF/9uvd0UDmxgWfxB60Ka8iTJv8OFQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DKABlbfx+lyU8fSlxxOmEKUXNbpM500dFl8C9fMj0478aSBKbFnax3aOQBTZ?=
 =?us-ascii?Q?ggt6qgDdNdrRWoOBsVTLD2CLePN7UaLV4G5XGMQ4TrKI+ejfmLDIOTwWmZwg?=
 =?us-ascii?Q?L9LJF/KK6U9T0DLbq8XO5O85kLuQPq14XHmpFJ2cf1IP5gEY0yFg6kRu++5b?=
 =?us-ascii?Q?BPwf+1YFOp/kS8Cchk1YFUxkqx9VYmdfeaRke0QFb5Q/yHeBYBV6JVlsbHBY?=
 =?us-ascii?Q?94GUPWyHbAGXwG1uixhttbGK4TxZgK/u6Eg/YZiS0ln5QVoEm1iYch3mnJw5?=
 =?us-ascii?Q?q8cIC4C30o+9xw5lGExawI7zHibzZR+Re6Gwt1vBr6MtYT5Uqem74+4wRWAU?=
 =?us-ascii?Q?8ssdtDsO0HcmS7Zd5Enm32IzCss805zTI7wWSNU3+RLXzbmcyJmFLJwyHoNd?=
 =?us-ascii?Q?AAZhioZPewAeg5m/3a3Qa6NgkkAiNp7nxL32+ygbsNAuWXCfh1pEhaQlQN+r?=
 =?us-ascii?Q?ltDcNijR/ouz8FbH+YGCZbniwp9IHG5OYVm0xpQwyJwqmAGVoyqazLeZL1De?=
 =?us-ascii?Q?jJY3V6KuEjDdSYJr4QhlOzmwridoEzovLMJ5qSeBei8Z5NlIejJEpOEPHYup?=
 =?us-ascii?Q?O4xjaAugdzGNNhZFWv6B7BHtcgpRvJbw0g4HAxY1YNUTNIAOv2+KRUb1SGws?=
 =?us-ascii?Q?Pq5HUhpFXTXSdt2GVb/Jg3k2XpLQjM7a8OhcVN6SDyJcNFxvD9mqrlyk4ogR?=
 =?us-ascii?Q?Av/8g2UOpz4dbK0hFDzi31qBTydePxLqBgn4l6A0IGv+63KUN1MOZzTYn0Lp?=
 =?us-ascii?Q?r9N7jnMN0+zgC9d/VoICrY5oxNjrf6+LsYtEZCrP0QuHw4cqlYJA27Qel0VI?=
 =?us-ascii?Q?u1SmP95NXiptq7Klt4UH3LBI15pO0diI2LxiqGKwIk2tuYYMZ7BW6Df1cPy6?=
 =?us-ascii?Q?t/AWEnXyKpVcrguluuX49uUdmpIXuJy/kTomxXWw28mbxe8zpy/0QUyxfs+7?=
 =?us-ascii?Q?UdWtaPZFScTmKZA1JuA9f2GgJmUbZ2/UwibqTK0OVNyLp7x2y9VF/vPi97ZP?=
 =?us-ascii?Q?Edlu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c7ca23-cc3f-4ccd-2cb5-08d892e324c4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:54.6486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KTUELnD4sRfvUwJca3SnLwSFmTTsX/mywxl0+mulhHxWDh0FsN7jcOxI1JQxfGdrylXLF8tzvo6lcl1znGiujhV5UWZBZ9S32TT4Yas/gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

bdrv_append is not very good for inserting filters: it does extra
permission update as part of bdrv_set_backing_hd(). During this update
filter may conflict with other parents of top_bs.

Instead, let's first do all graph modifications and after it update
permissions.

Note: bdrv_append() is still only works for backing-child based
filters. It's something to improve later.

It simplifies the fact that bdrv_append() used to append new nodes,
without backing child. Let's add an assertion.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/block.c b/block.c
index 02da1a90bc..7094922509 100644
--- a/block.c
+++ b/block.c
@@ -4998,22 +4998,28 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
 int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
 {
-    Error *local_err = NULL;
+    int ret;
+    GSList *tran = NULL;
 
-    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        return -EPERM;
+    assert(!bs_new->backing);
+
+    ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
+                                   &child_of_bds, bdrv_backing_role(bs_new),
+                                   &bs_new->backing, &tran, errp);
+    if (ret < 0) {
+        goto out;
     }
 
-    bdrv_replace_node(bs_top, bs_new, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        bdrv_set_backing_hd(bs_new, NULL, &error_abort);
-        return -EPERM;
+    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, &tran, errp);
+    if (ret < 0) {
+        goto out;
     }
 
-    return 0;
+    ret = bdrv_refresh_perms(bs_new, errp);
+out:
+    tran_finalize(tran, ret);
+
+    return ret;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
-- 
2.21.3


