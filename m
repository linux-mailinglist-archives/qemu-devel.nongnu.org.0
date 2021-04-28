Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F028036DBAE
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:31:39 +0200 (CEST)
Received: from localhost ([::1]:40962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmA6-0007Lo-Uv
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxw-0005nu-F7; Wed, 28 Apr 2021 11:19:13 -0400
Received: from mail-eopbgr30098.outbound.protection.outlook.com
 ([40.107.3.98]:58735 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxj-0001uH-5D; Wed, 28 Apr 2021 11:19:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkU4EZt+Ys1BTnRLEmBgcwZZ3+1sLGPMEM6jawxl7iFTwg/Z6imkC21GlA6czN71navtHknwVziJsuRXP/cPBVV5NmOBD0XUEhK2bIcyrCcljCA61AAC3B5lo+gn6bZgS1R+6UZK233suhlwzdKIqe0lxc2wjkUeM1ijc7e8QWno7eceuYi02ZUiFJ4i6ppgkBpf86Wdq41rEh2IcaEOhbiR2rY373iEr769Lfmk5hn+SvxpSqB8VpoLcYdK6ta5fp/pGMesBSNHGiT4aD2UsA6wGZaUK/LPKQdSsaGm/6N5Ro1XC4C8EwE86z5P5QIEaFLI/gI0qDVnPTIY1phDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2+tV2FMrGSSkzrYmtyH9O+NsjPqNwLzweJ4ff+SUuo=;
 b=OttzcHgpli19GC6+knyXIRwlPNczIxPex/oK1BUsSTQKDKcbWG8c1+W1j1rwh7Qv5qozCqTWCzlUcQ4/BxgrhKiajYLm2H5deYbysoOIy3++TViS7e5rK1zBYfI7K35oLCEoFAw1OArE0vlvtNbdCA8/3e+0UYupJPQtKQTY/kRUDGaWb8RPiJPVSYKWiLtH9vEiS2WUKZ4ytoKlGxg2fk/9LQMyu2NXyG78pMyHpUbfj46AHni73yceeagBXvW+r9ILQ4CYJxZUlAt7ZdgCjiFu+Ix5v+g3SUEStYoqQ4ykrZAqzfqNASq2YAC8R+Mrtk2mYnQh1g4xQhGgWfzSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2+tV2FMrGSSkzrYmtyH9O+NsjPqNwLzweJ4ff+SUuo=;
 b=lW2AyFDg+FG45TpPL40K7TQ7I3f9pPe/HYs/s0mOggP9LUPXaKoX9LQYaVkmxVT6kqM++Bjs7hlgbmL7nJJyY3c8JsFc9TPGOlNwPOW2gtDyX1r+nft3KZDJgpWGr3h8sSoKFuM6xGsYwKhoEQgfM2iuEdsck9CZ+e7GW+HB9sk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 16/36] block: add bdrv_replace_child_safe() transaction
 action
Date: Wed, 28 Apr 2021 18:17:44 +0300
Message-Id: <20210428151804.439460-17-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 94d6f3b8-3a99-4256-5398-08d90a58e76e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB615118A5588DC5FA6BD07201C1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ds3gWjRsrkv2v7QQiFFnwi6aGH0gg6n1PkXQxvx4Ze24GRawBqBNkSrc0bkOm6e2V2uQEKbREGrQ8A1MRPnkaibbxV57hR1u3ttEhlsZgq/xvNf5Wa+07bx6l7UDpXIShHUEn1JLaCACWmpJrQ0iQd+caueg+UgqELkUz5XWDvH6ZtEvd/Y1JMdva4EnqDDV9ai4LNUw6d/21QM6Sl0QC70e27g+2c6snGeFiLsrzE7tOoUgg1LdGKsLNcl+c10DFxD4j2NuVDQAyfjWvozaheXhGUeIvhyYSSw8YyPdc/dUS3QX3jGajsamhjPwo0SLZYbqAbFIwYstlrgNuBgk66fpOjglbwnF35y+unTRpOVONSoSezuT7woY3CrCmQmIV5lB+jkBSH66iX7IR2JRF1jheLy4y5yIqeaYj9DFppp+GwSuZJnUGcejJhapEMCaHi8zcXoo8OWHOnF1pxUYlFoRKCzAf3hUPp31dj5lUURzPC4ZR+gnnX6csUBX7xVhRPeEPe5mK9RGQzt7e8g0nIzIe9z0fI7qOU1YMVlC+bO6ajnAHqYHfryQ1eolm762Pzh/mreYpmVCRZEguyz6nmilvPxfBMCs1fv+MIN/rGiWb4pIAJjN7cR2lOc94eZ/hNWKRPJzUR5zPkrUKHQNwx0h4oPqlrIkw0J2ipz6x7IYTOfnbjhsVm/ktCK5IMkM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(6666004)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4OZ0RWdQjBqdU1gIxlZ+dQRyPrm6dNEWXX/bJaIBya5ADdkoKTBDUIFN5gkI?=
 =?us-ascii?Q?T0Rrqn9VrlYrycF1H2bq/BCocQGJQ7cpI3l5eMNZz+fD073S7eWHilfIRDFm?=
 =?us-ascii?Q?THyS9G7vItLWuAQoMNTl/EMMS39aptelSE9R88HRm2DN8FbbcnMLf7D3XwaA?=
 =?us-ascii?Q?+2fS+NdSSxbNLuoMvl6A9Ml2TUFHw+MZ7jTewSCXrRVsTTuQ3KjZft18rDns?=
 =?us-ascii?Q?gdUx1HmXpt0M7YGPpECgdezZYv3mIhh8FOLIE11XhX9Ua4IjDWu56pnGJog9?=
 =?us-ascii?Q?fWpu+EtDOudk5mWSMEsdJ0dp4YCYZqYMLKYdOw1NXpaA0uU1Naxqap8iS33p?=
 =?us-ascii?Q?7/iNrL2KJHH0xNmz+5xHX97z7VdkLa/DUXRkReciWkXu4LePE19LVjgtraxg?=
 =?us-ascii?Q?BRuNXN53YEoy2tc8ciDGJjNGEiAWZETzCHphJgVFcHWNsal94WL0V60rdLGJ?=
 =?us-ascii?Q?QAefywQgSO64j+l/64u21l+b6ytUEiOMax2KsegG0NBs1gkunYOWvMSdXqan?=
 =?us-ascii?Q?35/EgksnFzriKzAlaqTgr3mk2O6CnNdPIeQEkwjRScHOi2iaOcs05g+/0Clh?=
 =?us-ascii?Q?3J7iVozVc9BVqsxqH6pEdi+hS1VZ2Um1/DovgaxORSd7/DldDda52+4o6t8z?=
 =?us-ascii?Q?VGsiCXpe3z4k1eWZ8zl9r3DYl7OTVn+iDgXzzKcb27MexkyamxHoJvXL1kWM?=
 =?us-ascii?Q?LRHljhg7sXpmsaB0YhOn9jWdZMERijh3eio2Lmv7S8hZhKazwjAl/pQqiCtu?=
 =?us-ascii?Q?izUQfFrbnWbc1x01ii8Sv+hv+fUiqTaoBllxKjoihJssmHdeGrxTKt6q1Q5X?=
 =?us-ascii?Q?+9bmMJs/ymbJm/d++5L97TPq4y7+5Lmgowle9lCJ7iK6sJIq32Cf9B6Bprvl?=
 =?us-ascii?Q?uY4sgjeY/MioW/04TGTZzS+GRv0U80wOMD5y+GO9jKba0WqHj6Ep/VFrN2hM?=
 =?us-ascii?Q?QjHsArut2lh+dmjlyd1sDM1D0AhNENEQKHoR7XkAurjmoZOM2LZLhicn63PV?=
 =?us-ascii?Q?kgo/hiB0Kv2+Vz7h/pe47iCevVrjhYqsQa6GOJsLvK6Ig6LB329Yw7bO7qXe?=
 =?us-ascii?Q?Xr9/7ZnDCTRowtpiQEYK4fy4X1NBc8s0alW2/OsOPWtjcnAzzozaxWvdvzH/?=
 =?us-ascii?Q?DRo4QEHD9Y/SSnzVjTcvwrs4FHDjNurvdsZ/eMVffAG58AhCzC51gQhofWFo?=
 =?us-ascii?Q?0+lyoS0ZelLVkXTlp5ux7uDEoPuYcpnlKPaVFu4a7MWQvSFa+G9GlKzEkQ9D?=
 =?us-ascii?Q?lIlY3bAgp2xlLvApkP3P1Q82461pO5JHvvUG6M6FIWeoM1EBVOOQY8eswq5N?=
 =?us-ascii?Q?I7eaV2yzlKRWSP3u0MWdj8eS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d6f3b8-3a99-4256-5398-08d90a58e76e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:40.7087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfrtrmweCXOhcWy5x/+1CRDLd1/kuM0goKjca/PUC7I2CabD8Z1KdmGirESzHWrUWjeKEfc6EqN5p404Q7oNfjaFSKq+z7rkLmY5Vl0MpOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.3.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

To be used in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/block.c b/block.c
index 98b7bc179c..a5305662dc 100644
--- a/block.c
+++ b/block.c
@@ -83,6 +83,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            BdrvChildRole child_role,
                                            Error **errp);
 
+static void bdrv_replace_child_noperm(BdrvChild *child,
+                                      BlockDriverState *new_bs);
+
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
@@ -2237,6 +2240,57 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
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
+                                    Transaction *tran)
+{
+    BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
+    *s = (BdrvReplaceChildState) {
+        .child = child,
+        .old_bs = child->bs,
+    };
+    tran_add(tran, &bdrv_replace_child_drv, s);
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
2.29.2


