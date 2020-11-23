Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 289CA2C1591
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 21:27:48 +0100 (CET)
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khIR9-00012e-4C
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 15:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID7-0004S8-4F; Mon, 23 Nov 2020 15:13:17 -0500
Received: from mail-am6eur05on2106.outbound.protection.outlook.com
 ([40.107.22.106]:21121 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khID5-0007NS-7v; Mon, 23 Nov 2020 15:13:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gelzHn/XON5by3zZEW0lRFlwlpWL4NP+3R4mv8k67QF49zbPa0n3hIM8uyg7uIc6G1vMJmydKJGUeuZBmte4RQOJz3SJxtBKjLpclsQFOk+JbvqhSoKsSm96nekJ+kjdp8oBf8BKwB/d4hg4n91S1J3tNO1MV9jrTxN7yhejj+aefCbc/cZhRwGxUp/qQmDuPG3STg06w8gRVtt/dDb1p8aRHPQejuSSZG/g2dGVegORupZQSyp7QHJ/OoGPyO80YudiwRWm+aWzJo8yqRPHIW4VIuSXOLZiEMkKr3m866cXSk4gA/DlUqYscehS4lOQALXsB4KtELG3Btdx5Mn1Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gl2OmDZ+erNXtSQ1/rSKY3s2VtNapW2WBp6BAge3Mc=;
 b=MaDPmtPCaMYs1SBeQp1weY+E7xd2h3la/l0fjXGmi/z9GnqNS85BmLheIqiMRYTyUDXxnFCUT70VCY+nKx/VlzABBIyhtrnq/OlGABYLkpz3LsDx2kAH/fWDXufoQaBuxke2hhXkXcjTlByYU/CoFBs5iloIl2SodAggCQU5bOdW0r1NPSExB+l+eXygLTT7w7LhZLOP89uXQUzewqLjo/zVL9Hhhk5KeLkS6W3Df6Evj4iD+d61utjGMPBB8fTo9msH2hbAQZ3R9tlSFtG2XpqW8f8OawjP5lkN8oCX0NbgyjCWcQYNcynTc6tPsngjCbnj0Tznt9nCYafjbMp6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gl2OmDZ+erNXtSQ1/rSKY3s2VtNapW2WBp6BAge3Mc=;
 b=k+oZp62Rmx/Rlb6mONlMYABqgEWuv4FG2KDdnUXcCGDITv0ktfgecRaYvdFOEV0N1sqNl2x5/iLO6fYTs0dD6wfWuMBShx5+cUqxcihs+iIgbKqeOZFc0GRHKaZtm3nWyndsVXr/skpvoa4ytMl0zUsa8mdimM5HEMAvLK7MzXU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4690.eurprd08.prod.outlook.com (2603:10a6:20b:cd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:13:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:13:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 14/21] block: add bdrv_attach_child_noperm() transaction action
Date: Mon, 23 Nov 2020 23:12:26 +0300
Message-Id: <20201123201233.9534-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201123201233.9534-1-vsementsov@virtuozzo.com>
References: <20201123201233.9534-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.115]
X-ClientProxiedBy: AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.115) by
 AM0PR10CA0117.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Mon, 23 Nov 2020 20:13:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76025745-e31c-43b1-fd63-08d88fec2ece
X-MS-TrafficTypeDiagnostic: AM6PR08MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4690860F36AE279229F4C4A2C1FC0@AM6PR08MB4690.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MnKuP/Am03d9ovTUVjV4r1BxxIxZCOtyhRrphDAMxlL3/gdKl/pgcaXIP2zctx+lN76TcNufwaWNQYXLrIqdj5NDOQ6QtwR+3Pk5MMfxszgoWJK/HsRchAuokp/88oNi3wx9niGMUG713ja/ryRnfLmyTkbsk3scN6dSwbqBAw/twwzkXf9Y/dxxCBqbshR8HFY94UX4uCRzqAiY+hzAf1BFIsNrO9i1/OVMFXCVDCBQafxg+Zw6Jw3kbGQ6qedwilVZYCUl3Gw/sWYMe/NrPsPsNYMtBpaLg4zr673mhkS0b69nLEEQ8gGiwpsEL1Fk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(39830400003)(376002)(366004)(5660300002)(6512007)(6666004)(1076003)(52116002)(6486002)(16526019)(26005)(83380400001)(186003)(6506007)(86362001)(2906002)(6916009)(4326008)(8936002)(66946007)(478600001)(107886003)(66556008)(8676002)(956004)(2616005)(316002)(36756003)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: xOabd/0RSMoUz2/4lQ4Fwq08cnNxiyyHvmyX5Mw/mqCUifP04Dy30S8o1gvznuqiKKUJqfta85pH8LeDjxnvAIxQJ+yTLM+yb6UE99iMbyA2g2H4FyHFn11lZ748Y/5el4pUtVhYbNlIWJ72dsJwHezjAjHRpV6Npwl3/Bw/9KvG+zyLUj/+wZeNmZ7UjxPlhiGI1iBTl6GbS4pj2sC0QsCv8kCwZO5xHHvmQnS+v4DPwgCHeFjSBgQwR6SNslCQR9xq/WxfzwfxH83vbjYm0OCdvMqXXNMX2elvh71Ie/fdOEk8J+wQKaZAwwA0fcJAaWhq2tjHIabOJ1mhkhq29OyNzfQRdVWRN6vUux9ws1wHC+oEhjlk9SCVq8BvYp/sKGi3s793teKvcByjl6MjdTsL+yyRQsBQT53oxhEhmEEp7HnWF/ac3nGyjJWQ0dRFOXDm7VFqPpa1p1bKiFy7NoPgOG/fNn/0EEqWJWE99qWG/elTXFxo7uQqA4UFpFdDdnRDub0EkS4xxAk3V2/8rSsh8gWNBkJrNhlN2SCTCQdP7icLl5dCijq4HU1gp2E2PVmrSVwNYkfhzRH/ynSab2DnWZZPC6Ns3KaVPt4z3dU/dX9TRL5UKd305SkhfdfXBd7awgZ5YoEm/dpN7KCNzJboRhlWGJBVBHtIiMDUITo3Ezeh50bMg5HTXiJbyVAatnt75D/tIdK4xLmO4PwKQ/2bAPZV4H3qdvBoEPX4Dwc1SfBTx1absIKpz9UeE/IX6y1Z0yOjR+3DB4M6+LYyL73tAVyrnYgS0VJXKtAOoWR+BfKqyTkg7lbo1vQI+Zo1v9ECsxu9UNmzBqu0tdhmOUT7us27gBF74NVZQQe4pQuYzpHPze0qX6llwa7eBLu6s0FGrh2Q3JIOtmj9TSSwKw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76025745-e31c-43b1-fd63-08d88fec2ece
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:13:03.6452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPYsUw/rtDNsgMeH8HDRIJM3XYUgyjuI2p7na5mNV6xexM5/6BBN7O3Ur5QYN7EIRn75HygIwUY2gTEQVkfjZ4m4zUWTxk/bVpk3c59ISCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4690
Received-SPF: pass client-ip=40.107.22.106;
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

The code partly duplicates bdrv_root_attach_child() and
bdrv_attach_child(). Still refactoring these two functions by renaming
them to *_common with new noperm argument is more complicating. When
all operations moved to new graph update paradigm (update permissions
only on updated graph) all duplications should leave.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 90 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 08501350b7..5f6ad1d016 100644
--- a/block.c
+++ b/block.c
@@ -2974,16 +2974,102 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
     return child;
 }
 
-static void bdrv_detach_child(BdrvChild *child)
+static void bdrv_remove_empty_child(BdrvChild *child)
 {
+    assert(!child->bs);
     QLIST_SAFE_REMOVE(child, next);
-
-    bdrv_replace_child(child, NULL);
-
     g_free(child->name);
     g_free(child);
 }
 
+typedef struct BdrvAttachChildNopermState {
+    BdrvChild *child;
+    AioContext *old_aio_context; /* NULL if not changed */
+} BdrvAttachChildNopermState;
+
+static void bdrv_attach_child_noperm_abort(void *opaque)
+{
+    BdrvAttachChildNopermState *s = opaque;
+    BlockDriverState *bs = s->child->bs;
+
+    bdrv_replace_child_noperm(s->child, NULL);
+    bdrv_remove_empty_child(s->child);
+
+    /*
+     * refcnt was positive prior to bdrv_ref() in bdrv_attach_child_noperm(),
+     * so bs should not be deleted now.
+     */
+    assert(bs->refcnt > 1);
+    bdrv_unref(bs);
+    if (s->old_aio_context) {
+        bdrv_try_set_aio_context(bs, s->old_aio_context, NULL);
+    }
+}
+
+static BdrvActionDrv bdrv_attach_child_noperm_drv = {
+    .abort = bdrv_attach_child_noperm_abort,
+    .clean = g_free,
+};
+
+__attribute__((unused))
+static BdrvChild *bdrv_attach_child_noperm(BlockDriverState *parent_bs,
+                                           BlockDriverState *child_bs,
+                                           const char *child_name,
+                                           BdrvChildRole child_role,
+                                           GSList **tran,
+                                           Error **errp)
+{
+    int ret;
+    BdrvChild *child;
+    uint64_t perm, shared_perm;
+    AioContext *parent_ctx = bdrv_get_aio_context(parent_bs);
+    AioContext *child_ctx = bdrv_get_aio_context(child_bs);
+    BdrvAttachChildNopermState *s;
+
+    if (child_ctx != parent_ctx) {
+        ret = bdrv_try_set_aio_context(child_bs, parent_ctx, errp);
+        if (ret < 0) {
+            return NULL;
+        }
+    }
+
+    bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
+
+    assert(parent_bs->drv);
+    bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
+                    perm, shared_perm, &perm, &shared_perm);
+
+    child = g_new(BdrvChild, 1);
+    *child = (BdrvChild) {
+        .bs             = NULL,
+        .name           = g_strdup(child_name),
+        .klass          = &child_of_bds,
+        .role           = child_role,
+        .perm           = perm,
+        .shared_perm    = shared_perm,
+        .opaque         = parent_bs,
+    };
+    bdrv_ref(child_bs);
+    bdrv_replace_child_noperm(child, child_bs);
+
+    QLIST_INSERT_HEAD(&parent_bs->children, child, next);
+
+    s = g_new(BdrvAttachChildNopermState, 1);
+    *s = (BdrvAttachChildNopermState) {
+        .child = child,
+        .old_aio_context = child_ctx == parent_ctx ? NULL : child_ctx,
+    };
+    tran_prepend(tran, &bdrv_attach_child_noperm_drv, s);
+
+    return child;
+}
+
+static void bdrv_detach_child(BdrvChild *child)
+{
+    bdrv_replace_child(child, NULL);
+    bdrv_remove_empty_child(child);
+}
+
 /* Callers must ensure that child->frozen is false. */
 void bdrv_root_unref_child(BdrvChild *child)
 {
-- 
2.21.3


