Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE7D36DC69
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:50:37 +0200 (CEST)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmSS-0007WM-99
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyb-0006Jd-Ah; Wed, 28 Apr 2021 11:19:45 -0400
Received: from mail-eopbgr30098.outbound.protection.outlook.com
 ([40.107.3.98]:58735 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyY-0001uH-Ru; Wed, 28 Apr 2021 11:19:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfJjTrmrpMPhRhZkojpJ0puUuPNakZaxuEKI+x9iJrNCHknOH/M4tdjyh2zupfI417sSYvrI5SWH91bVtZjTULOWooz4xHv1SJu0XH1LtYEs5cwp6kRWenI6bZNKw0aXaHU77DB/blnv9cEWE2GjxDJgxLADa3nJGfuL2TtoJe9JTIIfGPfIXtprnU5FfQgceAj1gOeBfONwxElr34E7y0OiGBQ0AA9nH3Srr+aM8lC2CfAzMV0hzb4jmCtvHTcjbsgZXpXzxxyWAsOEuBnHwLV59yDXXLrbNX+PPYfAh8QbvHeS9PrnsJjPPp6nn/WWaz7w0shWXWo3lGyniLoieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBHbKJj3PCAEtbYnKgqlWFwnZLXNpRe2kv3Ug4/3UyY=;
 b=IK8g/9SrJPIt9M2E6ta2JU0gzQmmshUovFx3qNl6+JOkrwPiveClqUWr+5vE8c1NUUbbmfzhdrBDwzxMtjqwPeYxpVrXe2yui2TB4A+4WeQY+rohvo/O/7t8Uq02amlSfLKEXmsto0hQTla7TprTuAqMkYuXKboV1I3anNbvxeo/jJ1kxI3dybvEXH8gt3QL3N9dqkE1Sb9PUbNaxgrbq9F4Dula+27u4CXRptjl6YXImupmIZtLbadL5gArvJT349QmbyCLC3neZ/rlYWGzPxV7u+6n/qEGdKHswYsa+94qBNLe66S3efu+njTovofJbx77DavFMKI8m0Y4UuF2jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBHbKJj3PCAEtbYnKgqlWFwnZLXNpRe2kv3Ug4/3UyY=;
 b=qOaZD/AWQglJzOHiAPUnjtqaI2lFfAO85Hg1+I0rX5DHBws2gtssNn3Bt5mBh+rOoDpzu2iuGC/Nyy6aK9h23uzb+7mEVdkFGgl2H4s44oYS6KlI3cZRAGT36EX2gNhFdhcu0sr1pO1NGi3ijDDJT/vJD5fTju2V7rVidO/Ol94=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 28/36] block: add bdrv_set_backing_noperm() transaction
 action
Date: Wed, 28 Apr 2021 18:17:56 +0300
Message-Id: <20210428151804.439460-29-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6039811d-3fdc-4df9-e225-08d90a58ef82
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB615120FAF67AA16EEE8B1EAEC1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ySnGLLi6U+Y/cU2BClR33RgeBlI15WAM7R5xUtXueJ2dbnvW7e+XLrfIbxnvjVeZFJSzRitxm2yqm9IWFQ9+iu5zZcGlSBZA4P0HlgwiHTlUnxI/tu3/v+df8qKxvv2yQTSgtVkKGTD3erBWT3MolqUg6bYDC/R+psDthySWLMVkgE6aAt33B15JDjEcliew54Ym0BkCYgxbdrrvGy9+zHLF5EcXZBiv9NnNF3vy5YKCdK5IthGT7FJfqCMlEd7BWYYb52yN3cjFj45IKyUmhjkLyK31oaz9xvOF7scYlEACbcxTFhIvd/ASe4akH8IqX9gQi2XUUAM+5wCZj2ktMShgq3d+BuXasK0o3uKPa4WN4OxYyaekJVXVDfqib4izUk+IULgU2AL2tWxKgk+rpVpoxYWnWKvRsS46TRhZkipm2OTxDyNjX7XMnHHZe3xINUG9lZT66guJdGkzVu3gBiqHBPwJryOo/BL6xZH4+Zqa2obOCBtpZhGWryo1F62kvofbGfY3kVtOx6nVE2du4RUXp+jURbWSQFq9y6V5Jjl9cIRZEPzHom1PH1N50dChfp8E/qK1/xCaOkbf0lId7P5qXaQxdVYdAEt7aW2JmIAsoSw+iATVscR8sIpbdoB2u5HSHs/YEyDV7sWAjoaJin4hwnMA201Wx3MKv9kWo5ElPNwfoZzgye/ddQb2fMbA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IrfgOlFqjvL8QTqshHSZFAjUAZGNMFhrMA7MdBDz86sDjPDdOMvIKEU0ei6q?=
 =?us-ascii?Q?rhHFB8zVV4JDxv/sX6Qfe36wSDWhlvPHilxoMq+DTn2v5khd0OmK5MqGml76?=
 =?us-ascii?Q?sr9lgkQ8qn/Sy/9whqhX0OaoMpAvZcVjc0fwn7cWIkOLMvYZZMPjjFQuXDUu?=
 =?us-ascii?Q?rf8FPq8A0lUYCJ1JxemSONcqxBmR5pstUUzlsI01985e0OejT1B5BiyNIdqX?=
 =?us-ascii?Q?qhDX19PSZ3eUftGZ9EcxA5HL6vkVY+8jDG5XXucFF5zFulukBw2kiXDDTn9D?=
 =?us-ascii?Q?4uBzV4+oM5Kc+OW5USZlsKPXIHwFFCEGHBdBm0O5phDea408WZcF7ZPsOHxp?=
 =?us-ascii?Q?aM7CORLgzBg1FRg1wu0f4wfqptoV4Wlhto+oYUI7wsnbgJdOu8gEEK2Jls0Y?=
 =?us-ascii?Q?9OJjDBAAGKP+M5tQHrecFqH/5UweeIF1eqnLUf8Cq0COMIVesXE+ETTniNuf?=
 =?us-ascii?Q?xHMfprhSlTKRV6Gg1bIexBf4EIQT4Pw5nqfbj1Gc7zf3cObShIfliCegz2Za?=
 =?us-ascii?Q?FJGoE5HvdIbiVyMrUQlhbkbp+kK7ea6lvwFt12ydkx30Ko/pDX4lBOvIn6qd?=
 =?us-ascii?Q?tmY5+x/PZjM3A4dA6r4owpln7anhUYXgHOEAC5mGZMayxw1jJzOBDCuyo0kM?=
 =?us-ascii?Q?t32G8mLk4yvyz+l0GaFG4WWE/CL3pB/rSGyV+VJzhtNMWLDLGt1TlZVizrra?=
 =?us-ascii?Q?4sUKuFIKQJV5oKErt85w/wXitz2vd2pNjR2BBI9AOP7ppFo50ZZ9ioVRlnkP?=
 =?us-ascii?Q?nAI2Qojv6VcxxghQs+Yv9XCRvZZF5Nvu4b14mrUNAOrJGFMG/Sq00H/ZB/2T?=
 =?us-ascii?Q?tb3dPeFsbN2bBMimIjfb9c7GLDt6ytSMrgXBcy1QvsvxQ0KCMlYjzdCMd6Yz?=
 =?us-ascii?Q?I1mrx2urEd8HknKYyrf+YmqRzXWj5eCLMbAr0WN1i9uDocMg8iIg9XBRxe3D?=
 =?us-ascii?Q?jfVI0mbPRrgm65dCAUzVhBGjfuSo3YNOGTvbcKlb7+AFd4eMhB+NPsQMwAFY?=
 =?us-ascii?Q?0pw6YiXZebI9TyDdWq0QjqYg/UdWThbUuK10tpnrhBcai/QsYXFQc8/iOcrW?=
 =?us-ascii?Q?ZbB07cQlEsV9c9CNYd0oAZNeqiB8Bu/jXqC7PWP8ioST1BosDQfxIZUMuTaj?=
 =?us-ascii?Q?A0laV5k+4Wul40bRhLhuQHWAu09eyndZFykop1mc0HdX8xrOUaudN+PAVFyl?=
 =?us-ascii?Q?BCOPYSQ4evch21ocPt8+ngbx6TJ8fLy1DHfrZqVrwMCWWOxaKc10X4R+Q3jm?=
 =?us-ascii?Q?ck8guCrWnkSw3YvGHZQW7LVrvgQ6EiG4QTtaPFz4bS+NZC/u9792Kk6Ev5ZU?=
 =?us-ascii?Q?xSQ951hmMkccLVDyFDCHC7Hp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6039811d-3fdc-4df9-e225-08d90a58ef82
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:54.2866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kY5mO/znnl2oL9NW6UweXfn54XA4wiJSlcBoBdWv1c5SCzF6Xgb4Qao2/TbcXeyIJ+VddJLTeCIt8RqZKHVNb9azf3PxAvn7BReBnboSJXU=
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

Split out no-perm part of bdrv_set_backing_hd() as a separate
transaction action. Note the in case of existing BdrvChild we reuse it,
not recreate, just to do less actions.

We don't need to create extra reference to backing_hd as we don't lose
it in bdrv_attach_child().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 54 +++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 9922943793..bdfe59d94d 100644
--- a/block.c
+++ b/block.c
@@ -92,6 +92,8 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BdrvChild **child,
                                     Transaction *tran,
                                     Error **errp);
+static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
+                                            Transaction *tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
@@ -3322,8 +3324,9 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
  */
-int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                        Error **errp)
+static int bdrv_set_backing_noperm(BlockDriverState *bs,
+                                   BlockDriverState *backing_hd,
+                                   Transaction *tran, Error **errp)
 {
     int ret = 0;
     bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
@@ -3333,36 +3336,53 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
         return -EPERM;
     }
 
-    if (backing_hd) {
-        bdrv_ref(backing_hd);
-    }
-
     if (bs->backing) {
         /* Cannot be frozen, we checked that above */
-        bdrv_unref_child(bs, bs->backing);
-        bs->backing = NULL;
+        bdrv_unset_inherits_from(bs, bs->backing, tran);
+        bdrv_remove_filter_or_cow_child(bs, tran);
     }
 
     if (!backing_hd) {
         goto out;
     }
 
-    bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
-                                    bdrv_backing_role(bs), errp);
-    if (!bs->backing) {
-        ret = -EPERM;
-        goto out;
+    ret = bdrv_attach_child_noperm(bs, backing_hd, "backing",
+                                   &child_of_bds, bdrv_backing_role(bs),
+                                   &bs->backing, tran, errp);
+    if (ret < 0) {
+        return ret;
     }
 
-    /* If backing_hd was already part of bs's backing chain, and
+
+    /*
+     * If backing_hd was already part of bs's backing chain, and
      * inherits_from pointed recursively to bs then let's update it to
-     * point directly to bs (else it will become NULL). */
+     * point directly to bs (else it will become NULL).
+     */
     if (update_inherits_from) {
-        backing_hd->inherits_from = bs;
+        bdrv_set_inherits_from(backing_hd, bs, tran);
     }
 
 out:
-    bdrv_refresh_limits(bs, NULL, NULL);
+    bdrv_refresh_limits(bs, tran, NULL);
+
+    return 0;
+}
+
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                        Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+
+    ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = bdrv_refresh_perms(bs, errp);
+out:
+    tran_finalize(tran, ret);
 
     return ret;
 }
-- 
2.29.2


