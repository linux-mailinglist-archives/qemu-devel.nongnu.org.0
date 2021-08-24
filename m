Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF33F5A39
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:54:58 +0200 (CEST)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISCl-0003yv-8T
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyP-00032h-AJ; Tue, 24 Aug 2021 04:39:57 -0400
Received: from mail-db8eur05on2134.outbound.protection.outlook.com
 ([40.107.20.134]:13121 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyN-0007US-2h; Tue, 24 Aug 2021 04:39:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZnXO7gxzoSfdZ5AoJTqSe4Xe6rOEyHXvnzsZ+deh/PDrr8NBfBYm9y6LYB3oOArAtgKTPnjFcD+HoEHyW2GSQHkSK208jHz2YXTdLIkSlLdSyloJmcK7MNR3DIInRVKGYF4vWDXuHrXCrahwK+ZlE7k7xG1MKVTX1WnWgffamue1lMRsSMWsn/B2j8g0H5RrJXqxEMH6AaAuf8UxI1MTqKeW7af5Cxg+q6g3Ut24F03qIpIHvTRaLcZsZsTBip5ddbZqUgGK6CNl0MvnoWSrcJT0eISD2OTM9PpS/VX+K71fGV+ubODtaYyk4wmICbcsxohjkIt4EnItHMowmH1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjtzCUW4BM3J8oxtEaoIJWjbz/Qm1wPX4vwU5oAbMMw=;
 b=c96wwyxlVPdKZtIpyGUufV/RdwA9cH4W/9lBfTrZcIjMnvwuUBWAQLZFJST3OUT0jqFGV3AbgQWY3nCnSSCZWpzWiSH6AL9QqvkvzUBq5OpaCy2/NhV3hy/XJ53joDXI57j/7BhQuuOIaOtGgyQgMJ/ysf+n+4e0Q27wtzWDcSMCCkEqn3LWoa3wEc5q4Eyy4Q5KoLggSirZ6ME5MxlKoZUupyqPn+NRlX14LQH11Y2ggjDq1ruLRUbYQYJ8XQDlKznlEaBv/NTQYzvwtMllj49nB+TMYtPoFr16Bu50pBMUFwnm5WanswzkPkqsVIDzJIx31fkOiiSGbxfrCha2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjtzCUW4BM3J8oxtEaoIJWjbz/Qm1wPX4vwU5oAbMMw=;
 b=du0pi04Cq+Vw/HY/YCGabvfN/nuYr5HDYL81VyjfRg1JFRtPuSmmxFGg1TO7O3ZLjCPu6GqBuyz/gUorpznFwEYSyzXfjayyplHGQz/QaoOaWrVA4Ixctsc0oLYjw3KR3NazRFRYGVw+qIYwR8itSNWYzrRgF0m78GV51ZEDBuI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v8 18/34] block/copy-before-write: cbw_init(): use options
Date: Tue, 24 Aug 2021 11:38:40 +0300
Message-Id: <20210824083856.17408-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 313f2477-23ef-4de4-08cf-08d966dab7fb
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53332B811C31DC0E7C0F79BBC1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1oV0VWFnLY7KEF6ru05BLy6fnI4aPncsrtkfrbA1+YKwhxHq4cuNNvXRYaOGLxr3locMemUEU012K9XBM0aMdLufXYqvNcinaI/NbHNSlZHXrU2VNPT1ZjvWXa0EcbfriZXxkb1CQxlUWqU+l0j3XdvX7fIQqAYaTWEpHcg8iSVVCBqYPou+hGDzpQie8194o7foPYAzhXIcsXIT+4TUiMBQS6AqB0Q9+jPyzThpS1xSX3nBJdOglnCXJGWzfHvl1ERO/SkCoYXEOSP5lJvIjlJ4oAjcfh9x8HFW2kSXL9gk8RDXg8pLSfnqJQ0y2f2tRw64PzhDOzlchTsThrWELync8XzM5wOAmTIbjlj7ReyVQLDkQ55GmSRRYZe+DAkRz4A4yGJUvRLP25FRD8Xhl0z2yYS8EgMY396VexfPpun45GyLGGZq6hSq4uwQ7OkpHQi4Aa6GRUk4yOEbTPF2nXoGfnEe9HhQO4H+CJhNxOVo3/akK16HG/YP18uAEXBNUvebwv0zfMk1A77QaaYHyDEt1hvo6l/V4R1/BguDY7nON1nwBxOAUcr2cGAoetesbojRkL5nLOQEZgjsNXHYIa+2ieENjERVwJmuUSMww2kBZRclPAKDIJHUtnx7/1nczJSnrSAUZeXH6ixexAhRWPN4nbpzJTHmX+k/I3CKnB609TiQ5udsYDniyqEPpmNqrCq2AZteGxzeQPjWAlt4jQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wyd1GsLA+Vl8n43lGhlVGhZVcGCp797wtN6owSQIWtfPsHKt6Y/2ExEw29p9?=
 =?us-ascii?Q?Kd7w5RVIlt0/feBVVSJl+DNN0K1k8KNkSSwVUjefMmW0GHAS1t5t4saQbw3j?=
 =?us-ascii?Q?V81kY616mDoi7YDopRwfpzbJGchBubSIFMWJGDWrMw78yre4Ci5vCe0BMaiC?=
 =?us-ascii?Q?mWEN3TbouFe9RwJVzCql4XF4SddB6hat8VYcziQYSCZtl1GNFV/xDNeNoyG8?=
 =?us-ascii?Q?VFbpAn9uyP75hPD3zLsvx3lPBeD3ASvXyaZvkOs5Dcpk3BVMIeAxTmZS74C6?=
 =?us-ascii?Q?Z6FtrDF+j50KA/AxtAK5tUTsM5Z/bfaQCTDCk1DzX2wkr0FgqR5y6sz2sLRp?=
 =?us-ascii?Q?AUCcR82TXnZv47tsDRe6/kqYgSesjAlOZyOfDiB8txfescpjYBN6ZFIEQWFM?=
 =?us-ascii?Q?Q9Zt/TYw+m8jD08rmM34YrKWu2gtiQZAh5n9wfx0FP2ixTZyy5Ot9rJRLS2H?=
 =?us-ascii?Q?7ZUSJYfNeeTPD8KE4RL5UKPWHJOxFgzLAWzWNmmTFwY0n2qD26cqKgrWRnR6?=
 =?us-ascii?Q?hgDMe+URJozCcX/w6+quGL7kemHJmitnmTcRv3ObANo3M4fgs/G4zk8Y6lbs?=
 =?us-ascii?Q?rekXB1sKKBkB2qphKK2ISsZdIdwFGRUFQiDrvKoTBMAKx8hi/60cONmn9GcM?=
 =?us-ascii?Q?25iLgs5bNH8cmngslAAWUmEuoVu1ayG5b5onqkM7J9ssFYXZYjwmECx5GYbY?=
 =?us-ascii?Q?dRja+L1KL0Tgva6P5KKxCpfxrSGuiyyZ2EHRXvnoGLF3roCLPE0oQzed22gm?=
 =?us-ascii?Q?vf/LNlssZgIkGUQQfCAhZO8MWfzS8bbs9VCbf1SgrVA4xAhTwxPGrmV69XkQ?=
 =?us-ascii?Q?mgD+pe4r88L3agsdwVS8Uex79duFENcv6PU4xhX3mAkKk7JzlkJ+vuiyrCBA?=
 =?us-ascii?Q?LpDDIns75mw4tavB8gksZOQ4VkDhng+kZJsMheZQ+q/fvvh5hnRKqTk3eumM?=
 =?us-ascii?Q?soGgqmUI6PGC41MRvfvCMet4HcXZs7LkRuyVBgoaMI8cauczfhL+//pQps9+?=
 =?us-ascii?Q?bdtjmcPCv7Od98jUUs3UHX+gvKqcERgC1U4lvN1pdFkELNRf6sZ64zZ+4cP9?=
 =?us-ascii?Q?vr2SQ3aCiHS2oCgaFgk89edVMqH3CKvi3EoLBhR1j8AyPRd6CfX2FwylFDcM?=
 =?us-ascii?Q?nBk99Br+77b+TW9PPCUcX7dbWqS6irDCqi30hLvi7sEyrTaOFX/1fC1OFhNc?=
 =?us-ascii?Q?1sP1d/3WN/eMxo4m70veR+6zWUfZfObkF0MBdjFKETarXOKq2xyrd2po0NLg?=
 =?us-ascii?Q?vgStKllrt3+KyC057s924if4o+WOucaj8ODnA950qbIyk+Ua1nJUl6Uoq+Vu?=
 =?us-ascii?Q?6XXpLl/61nyyXg0YmWTse2jF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313f2477-23ef-4de4-08cf-08d966dab7fb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:42.6506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2CkTsWN/c+Zubqcus+8JXVZ/5KguQsR7zKTcygp+ES2zQBWHQisfjW8F4wB9CNBPHjY2CiafxulcZASipETeVfGI4ogpfczs6Vnklgxn/gA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.20.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

One more step closer to .bdrv_open(): use options instead of plain
arguments. Move to bdrv_open_child() calls, native for drive open
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block/copy-before-write.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1e7180760a..1cefcade78 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,25 +144,20 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, Error **errp)
+static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    bdrv_ref(target);
-    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
-                                  BDRV_CHILD_DATA, errp);
-    if (!s->target) {
-        error_prepend(errp, "Cannot attach target child: ");
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
         return -EINVAL;
     }
 
-    bdrv_ref(source);
-    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
-                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                 errp);
-    if (!bs->file) {
-        error_prepend(errp, "Cannot attach file child: ");
+    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
+                                BDRV_CHILD_DATA, false, errp);
+    if (!s->target) {
         return -EINVAL;
     }
 
@@ -209,6 +204,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
+    QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -220,7 +216,12 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, errp);
+    opts = qdict_new();
+    qdict_put_str(opts, "file", bdrv_get_node_name(source));
+    qdict_put_str(opts, "target", bdrv_get_node_name(target));
+
+    ret = cbw_init(top, opts, errp);
+    qobject_unref(opts);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


