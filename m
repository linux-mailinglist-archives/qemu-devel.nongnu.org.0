Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C898C2C6862
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:04:28 +0100 (CET)
Received: from localhost ([::1]:60558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifIR-0005ZG-SH
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif17-0001EF-Pg; Fri, 27 Nov 2020 09:46:35 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:13377 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0y-0003DS-Ff; Fri, 27 Nov 2020 09:46:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDxWdvSciAzzCsA1eqD5CN8E8pMiDcAnxdWrPk9VRpT+7lqi7hI+Sl9GA4M3aKUBo+czV5GbYNBeRzw7GURtavzhHEwHa/l0rqgMXQtSQjZFyrX1yu3J3jCQBua66rehgylk9sTBKCJwYjhGKQKHBt6LakxRVptCXlXOqEvdjhDEfo2DU8rmbhtzaf1RhEf4YoxPLg6B1HFT7khByZ5uzEPjhVod7FMdiqketOXnXPDnZ9/ngtFIaWDpQo+CjV1SxIOhwmXe1YqA/Hg9vb7uYuT5iC6mVqvENN6diQVJxKhwQyGzw9aW/R1hv5XhmL8IUscbvYH2Wp1S2Fg7jedKMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1U8uFl+7jWP2bNjt0/rStM5LG2dV5tOMAnYyTk/xNQ=;
 b=ltQnmSYyrzAfzkMcEmIpmk5IEHZCnPvkZ7aFO5tH6a+LHC5uEermwBpU2ImdSlfbCyrJe/uiXWoSwcMu3ktH81o7llRe1xCWZ/5nSFI9FWt2iGd99XVDkiXla5g8V3FwDJJxtXWj3YSNAhoZ4fJnN059rNgJdY5O2HG3vERhxijy3fZVaFrZR69rqLqTE/orLKPgZY5QF57Ypm2DHWjufgUTNdCOtnVn2iUHfchmLhWU+jhvF2igJAgP8DDgEyxnNRfJ6/q9LkRpNXyQ/1CWq2K+RiKPSIku1cpg3xnVgtzAPjYgLSF5xk1VJKDIP8A88jtBkqdJcJAHMGJhLvvGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1U8uFl+7jWP2bNjt0/rStM5LG2dV5tOMAnYyTk/xNQ=;
 b=pynXQMuQ5vLF81S377kGGYEEVD8LJc3+OTJ/mtL9HPvspzHlTBlMMc1T8JDvZ5NWd1ACXoKnyx6Rt4gonR9t6vfG6+oBgJBRtOvF7Ib4acOczlfquC3Yd5LH+LGX3clcSkqdW96m3tD6rhwHHcrcVPZXk3zjbz2PD2pcTB/eOGo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:07 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 18/36] block: add bdrv_replace_child_safe() transaction
 action
Date: Fri, 27 Nov 2020 17:45:04 +0300
Message-Id: <20201127144522.29991-19-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f892840-f104-4857-6669-08d892e32271
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50780B039860F7442D93AF77C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p3Q0/wogLwGc95iAzK0U8j79JFvTRNROP4n2nO889JUKV7bnuJENkmoc/cRuygDZgefW3vWMyFd/ocnktKUD4KDfOYQ/QaRKqItfDm8b0QDGgPAXYxlbhApI7+elqv3vg2OpbURml9fjVmA5aYXkv/kq8wBpJkWJTNRALEHeAePo8PwW0kqAQS8xUvrSBJZUZ9R8OeGO7KLeFy+J8FO/1zYje/yrP+48+NaRC0PzVMAl4EFx51wYqOEw2teBJPxeM8EmLAxzP+E8PnZe8jzfkYr1Vy7UIC5YmeOYH+tYHvmuWdKgoipOscKN+nl1lAuxvTvEXvpBytyUNeQH6nuiNjRA6SfyurIehSTqWCpC9rpG8KE6dkI3xy5bqeZDlzFr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iw6N7ymE1RnL3LbgxpdknV2awZuaYW5WBQpVVCGM2H5aA8qZr/pMjpMcRBLi?=
 =?us-ascii?Q?zmPJfdaICyLQBaonIQhJZ44c8q4ncWHCphM5ULuLyZ3bAK9nEMlw8JAPi4m9?=
 =?us-ascii?Q?aEleY2ERCrjD/8S5i9tWbu9t7X/7uiKm8n1Vi1pgCQktCps2rZ8r2ODCvWhT?=
 =?us-ascii?Q?t2yJY06aqstSuz7JhQ1MSK6q/FCrZ+9uueuPx0/rCC3+2z5mfr7HnvjnYnSv?=
 =?us-ascii?Q?R2H1zNkrKpnGFnahvqXF1XIMeMtLKg0pkE8edk+e8/LTgFEeB9ZGUwbzNOrg?=
 =?us-ascii?Q?5klY18byOIHg23X9NxFUCMfOlPPldYz5VXin2tfsd+bhyip6XkPFEYZh1bfv?=
 =?us-ascii?Q?fN4QE0h2swwyoD3fwauggJ5fVUhrhum2lB/A9IwBVrVYBHa7/Zf+djru7xkA?=
 =?us-ascii?Q?bupFWc4PB9Pl3EX+OF2+8WvIWPd5XSNWNC19YN+GAMyOboQyhkn24Uv/VVML?=
 =?us-ascii?Q?hyyHnjpbL0v6ytfpwCTN8vyaXv2L+rSz2U8y/rPcFjJHSxc0NqVEd+uNvboG?=
 =?us-ascii?Q?8Giqyq3+8nSMb6jFwiKYAFSq+BEFYwCqAA4nNYvtfn25AcSbD2hQtGrc0yf7?=
 =?us-ascii?Q?PXs2x34fvJxBtSo5RoeORDfSpLCh3mXmvHHj7PRnxJnTtfrT5HMxavBPtQDa?=
 =?us-ascii?Q?b4dH1g12YRenF5V7zLwO8NABevNSVil/XZkDbjAAZ2qOaCVogoh7+mGG1hsm?=
 =?us-ascii?Q?Q36Eea1jkS8VRVCFqyEQHYbFAXR78I8hDsi+0+/ddi/Y6x5eMhlS+/yTBGyu?=
 =?us-ascii?Q?YCzYdoh0nOz4MBs9kBTbEppjYeb6MNXT/QQ7ccdcfLc4qADW2x7E401ASz5O?=
 =?us-ascii?Q?+h623bpjPUIABkc5oIROfcHA8DRlDwD6urjw5W1dDHzhBsDAaAfh9bcn8+XB?=
 =?us-ascii?Q?/oy4FIn4wZUnptVyrq0XfXetEjsmX6yV6jNc9UMGembU5sAg0HBn57TeZQwj?=
 =?us-ascii?Q?ABVynzJMMdW5g7xKLwABDOrdTQ/vU+EmMpisZAQ/75xw8AyW3baaHdx8cEhO?=
 =?us-ascii?Q?UiMS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f892840-f104-4857-6669-08d892e32271
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:50.7746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0gX+TIMWM11XpohZeUbaMIjy8sWhaiy7xqeQI5XJ18j9ODIunJ77A8vM5z5pfPLj+sjqDf6ZJs9AvXgdPQghTTX0PtasM2qRBSgjbZ0lxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

To be used in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/block.c b/block.c
index 6996aee1cf..f24bd60c2f 100644
--- a/block.c
+++ b/block.c
@@ -84,6 +84,8 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 
 static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
                                                GSList **ignore);
+static void bdrv_replace_child_noperm(BdrvChild *child,
+                                      BlockDriverState *new_bs);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
@@ -2164,6 +2166,57 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
     return 0;
 }
 
+typedef struct BdrvReplaceChildState {
+    BdrvChild *child;
+    BlockDriverState *old_bs;
+} BdrvReplaceChildState;
+
+static void bdrv_replace_child_commit(void *opaque)
+{
+    BdrvReplaceChildState *s = opaque;
+
+    bdrv_unref(s->old_bs);
+}
+
+static void bdrv_replace_child_abort(void *opaque)
+{
+    BdrvReplaceChildState *s = opaque;
+    BlockDriverState *new_bs = s->child->bs;
+
+    /* old_bs reference is transparently moved from @s to @s->child */
+    bdrv_replace_child_noperm(s->child, s->old_bs);
+    bdrv_unref(new_bs);
+}
+
+static TransactionActionDrv bdrv_replace_child_drv = {
+    .commit = bdrv_replace_child_commit,
+    .abort = bdrv_replace_child_abort,
+    .clean = g_free,
+};
+
+/*
+ * bdrv_replace_child_safe
+ *
+ * Note: real unref of old_bs is done only on commit.
+ */
+__attribute__((unused))
+static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
+                                    GSList **tran)
+{
+    BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
+    *s = (BdrvReplaceChildState) {
+        .child = child,
+        .old_bs = child->bs,
+    };
+    tran_prepend(tran, &bdrv_replace_child_drv, s);
+
+    if (new_bs) {
+        bdrv_ref(new_bs);
+    }
+    bdrv_replace_child_noperm(child, new_bs);
+    /* old_bs reference is transparently moved from @child to @s */
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
-- 
2.21.3


