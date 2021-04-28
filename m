Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A77C36DC74
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:51:26 +0200 (CEST)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmTF-0008B4-BD
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyZ-0006G3-Q3; Wed, 28 Apr 2021 11:19:43 -0400
Received: from mail-eopbgr00117.outbound.protection.outlook.com
 ([40.107.0.117]:54347 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyW-00021X-Nw; Wed, 28 Apr 2021 11:19:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9Hld1kpTwy0w8hn3xUnrtLviEYGIME/fS6qxYLbekJD1JMoX9G6TWQDTCCeD9YGTX4f9sXby3v15PmKfC+RtNp0xx9ngXkoVDYwgDd8zlC8WYQoNWN1l/KZ7vEAKCEuAdLZ7EWwHRo9jnl92Zvq8QSL6N7/2OFfZtdjFPsKPqVUigfTnoHmxXUDs8C4QovEB6msVFN7rr6fADs1Fw2JKYnjNoN918Zyob2S63xhHN2XaBLTREbKBTea7S+ipSOt91Le5J8/KuRHpFGpW6kYhPoOd/zsIVfeRONtrN1em894/+h2RgUKnjsdtKizOfVWQKeaVKpMldyaUd5pMD7kKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XUxGTmytsqEWZwxdNIL21mlno5zdhuVjIywBNkj6pA=;
 b=bMoPE0fX1V7mZd2JqASkFdxWk3VcajzECE0RiqkxkchPk8EdrLkW04t2xSdF2+W6iQ4NOa2jIe5FAr6lrF41L4X/8SsSlS3IpaP8qyimg2r+uBF9mW4VHysLLaUludZ1u86U8A9zoXFipExlD2umW7O6ESWYu4mw2waFpNH/PTC0lHoFUgi6Av5VAQwSyRk/SalY9UDfwx0hR/848A2i/BQpAxeO3ZEbkWumootf0X38ahPhD0Pzq2fK+CxRn9RpG5LI4Im8Ux0ETRMJ+UEF0ojXu5r5PuVeMUJcyL45JZG+slSwVvDe1RZxrEo5Sy1J1UTpamv+iEjrtMGk3VlX8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XUxGTmytsqEWZwxdNIL21mlno5zdhuVjIywBNkj6pA=;
 b=mBg5mvG/wo6EtxREeiWBSwKANFdb8+rvt3kNUgu98DAu2vrK9oBu+2McB2enDS105v21uvs1bSqQqV+6FFIva3pcYnWkBy3BmYWs4CIVC3RWETL2rT7JaDz60AMS2JmG5559jI9bpzwe710S2dBKJljnd6ctdspsGCf7TDC3NYo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 26/36] block: make bdrv_unset_inherits_from to be a
 transaction action
Date: Wed, 28 Apr 2021 18:17:54 +0300
Message-Id: <20210428151804.439460-27-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3baa9e22-4337-4350-08fa-08d90a58ee29
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6151098F9428AC905E6498A5C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:49;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 24LJzJ9aiO4bx0rQcVfVwAh+AWnxkk9/VhlZilZWWaUbkPoPBhCCvNkSWtBppjv74M1jX9awDlEahHR1uAJ5hFPHf9W+tTidcNNtVUGJoe9hvZ8tRdhMRmYsbnhVyfk9aLhtfCzV4ou+hXjQpW+7Vl4iRjgKvXGZcGwlyAns4fq8vLO6fZUmxo3iJJqF92Ji/CIKjSF4AiorT+ZHNpe71WSSCzc8WnuJFYQV39rppdFDFYcfT2x3ymJ1XBH12Zoc8dl+U/fKeL8xpmso1zjOgB0fo/s5B0zMKWl+hrxDN8y0XOSQog5tYeNpBpas7SB8jiKWEyBUmgMNhmK2tDrNjDItry0BJFQ+4zDtn5vRFHxrQNxR+zbXQpWNaUeetH5AEpPbqctaDOLRTZc2UjJ1B6g40I9A3dbpZwmpC4qGamlXov/fmLwYK78rINbk4XziU+1n9cDfmKLrOUOmGgoee+SK304irOAk5Pzr8qo1/RdIcgou1Z0OwOR4YCdr4to+0AR2tPAdIGsvFwKbsKRqRQJa9Q4rhl0dWBS3kQr20dQWAMi7F1gl92CY7Z5EiC65ue/JGascwbY5Q580M1vFkDEsYqP7AYs3Q+dPbY6Br3Bcp1qySks7OSYpH/VtOG7jhw42Ouhw4k3cU+SIsPzTTUyjFWlb78PVa2z8h6Acjf74WTuAi0AyhTEDYDyVdZcr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?q/kToWfJRFteqVUB1F41wR6by3RiqjrU7lsRGYv/3kgUqt8/p2MkznEykokk?=
 =?us-ascii?Q?B7ibmFeSLuWQ4HZtkheYdROrm0PIgrYdTDYJMgPo9dnp7ehNbffHD3dGgNED?=
 =?us-ascii?Q?m9PTm9VZ4H2RN7zCcVZ++rqRwLtELGAvRUuYlqMm4JrUlcR0OXo78xfBNM1e?=
 =?us-ascii?Q?+oebP1+oGvhyTfDf3GuBDeR8jeVemtbhyXhJaVfrZ4Kj/eUZM3iaxrf9NkTA?=
 =?us-ascii?Q?n0+/Ds1RHfizflWbewTBwINkdoyr+c9GjrUFD14WZKgdIWyir5ffh0hMRmYb?=
 =?us-ascii?Q?1V2qK/aCvICUMVAtry5YpMNZtHcslDBaGlVa+2RICNlE6jyV2Ial1qU2IztE?=
 =?us-ascii?Q?UwJvJoruTFSclqo/YfnCM4dsjzHvATCxzwQJdKKAgfg+RK7eXR138ALRxe/r?=
 =?us-ascii?Q?91v97Z8HnkdCu1zdz21lrxuWpeaVRuCS+w9oOo9Mrhu68M55G0sUIqvle9F2?=
 =?us-ascii?Q?fBrJ80PueQ8cgvv+yB1AoAxYfZfykbjIXcNSIBqLI68bfpKz9kiL4hmXD3Ab?=
 =?us-ascii?Q?T4hN6yu5O3XBdE3584nMD1hGQ5pp0GxoNaBT1+jyglsxUV52WdhIcF73M4b8?=
 =?us-ascii?Q?4TODr625B/KSFRX/gEnPubySEuJoNa797H/l5zhDkUHd9wuBktsla4jpEuqN?=
 =?us-ascii?Q?q6+jCqPiVBu9tpLX/42DqDyA/MZXVvZlQlVX2tZXMuW3F8oiBvSRqqWym7WT?=
 =?us-ascii?Q?Tc7nAjv3oY0vPyVqq7MSXDt6rc7mpfdinfz/GageP0TgI1jiF5Ls/XngLVzE?=
 =?us-ascii?Q?imj6uE1/wWEDRq8S83f07Zfq0SwnIdGXsYPjKtEHWBSog0vv+ktse0YmyTTI?=
 =?us-ascii?Q?mpDdIS3hBlpDWd8tOtlRcs2uPW2qnnfz5DF/bRATjatVrFKDnRrhxv+gNPoN?=
 =?us-ascii?Q?Rzou8KVco8xexUcASa4UprmYu9xRmQaIozONZhu0ooFQVxP+67TDrwxviJHn?=
 =?us-ascii?Q?g+QNzRgKpZjRPc02P9ALm9NTdlNoFPzy5V0WHOMAJE2GP5U4fmeDzSv66WBU?=
 =?us-ascii?Q?FoZ+yGB81knjI+WuIBqQgVLWK6jk0YgVJdw/1viynZyt2h25CNrd1vVq90V6?=
 =?us-ascii?Q?UmIKLO8WMPNz3XyAS5xiuDoRHYpghXclkUpqkyMezu8Zl7yUKmTCAt4vPVTl?=
 =?us-ascii?Q?pHf3mqv0R9Z4jPKIgGaj0GHAuWBv+Lki+5SlZHfLCiY3f1yzyyoOl9EOrcR2?=
 =?us-ascii?Q?UgsUFrGcSm1WCHXcXY3+6asMPy4amJv31tiM0toaFW7H2DHxdIe2gU6NGGV1?=
 =?us-ascii?Q?IFnUiW7/Q5bV/zD17PXvEvPkL9dIJLOColjrUNdPd8XwxVLaVtgChMDgH2N2?=
 =?us-ascii?Q?YzCpBMb2gMOzlBqA/wV4oWpy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3baa9e22-4337-4350-08fa-08d90a58ee29
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:52.0011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEo9bZURB2puFvCcc0zFHdhyRCJEyt58HEoXGstBHHzBDNNLHK3vRpWUIszcrRd4dbSdRahK+xn/tSx1C0QtXUtoncp4mwfyY+UYPjON4s8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.0.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

To be used in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 46 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 46af5852ab..1dc14908ac 100644
--- a/block.c
+++ b/block.c
@@ -3205,11 +3205,49 @@ void bdrv_root_unref_child(BdrvChild *child)
     bdrv_unref(child_bs);
 }
 
+typedef struct BdrvSetInheritsFrom {
+    BlockDriverState *bs;
+    BlockDriverState *old_inherits_from;
+} BdrvSetInheritsFrom;
+
+static void bdrv_set_inherits_from_abort(void *opaque)
+{
+    BdrvSetInheritsFrom *s = opaque;
+
+    s->bs->inherits_from = s->old_inherits_from;
+}
+
+static TransactionActionDrv bdrv_set_inherits_from_drv = {
+    .abort = bdrv_set_inherits_from_abort,
+    .clean = g_free,
+};
+
+/* @tran is allowed to be NULL. In this case no rollback is possible */
+static void bdrv_set_inherits_from(BlockDriverState *bs,
+                                   BlockDriverState *new_inherits_from,
+                                   Transaction *tran)
+{
+    if (tran) {
+        BdrvSetInheritsFrom *s = g_new(BdrvSetInheritsFrom, 1);
+
+        *s = (BdrvSetInheritsFrom) {
+            .bs = bs,
+            .old_inherits_from = bs->inherits_from,
+        };
+
+        tran_add(tran, &bdrv_set_inherits_from_drv, s);
+    }
+
+    bs->inherits_from = new_inherits_from;
+}
+
 /**
  * Clear all inherits_from pointers from children and grandchildren of
  * @root that point to @root, where necessary.
+ * @tran is allowed to be NULL. In this case no rollback is possible
  */
-static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child)
+static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
+                                     Transaction *tran)
 {
     BdrvChild *c;
 
@@ -3224,12 +3262,12 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child)
             }
         }
         if (c == NULL) {
-            child->bs->inherits_from = NULL;
+            bdrv_set_inherits_from(child->bs, NULL, tran);
         }
     }
 
     QLIST_FOREACH(c, &child->bs->children, next) {
-        bdrv_unset_inherits_from(root, c);
+        bdrv_unset_inherits_from(root, c, tran);
     }
 }
 
@@ -3240,7 +3278,7 @@ void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
         return;
     }
 
-    bdrv_unset_inherits_from(parent, child);
+    bdrv_unset_inherits_from(parent, child, NULL);
     bdrv_root_unref_child(child);
 }
 
-- 
2.29.2


