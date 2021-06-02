Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CC4398ABA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:33:07 +0200 (CEST)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQza-0005Tn-Ow
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfT-0001H5-JD; Wed, 02 Jun 2021 09:12:19 -0400
Received: from mail-eopbgr130102.outbound.protection.outlook.com
 ([40.107.13.102]:43141 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfR-0003M9-5z; Wed, 02 Jun 2021 09:12:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzBl4sXJCGUlMajrnjoJ/82uMsukh4r0YqxSJ7LuCEjuzFGjfklCvpwLTs5Qt/1N3VNMJMJhL6ksMwXVWPPNMxeYMYmuwagkEvxBZw0g62CVX0in0IMqHNKE/uLNxf9MaVyhLjoSmjhR5MebQjITPkdibXUegHQeAxim4W+CRXR2yrCSlF1BkVhtkE6YUOSQA0Ik0EuirL3Y/WlfV7gmm9kpDtj+d22YZYnHPI5ExFb+UE7g7mZf0P8UoshNiZ/LJtDzWgHMoUvsUwfKJYZPFSwxti9IjK/pCigT3ycBuI+xxGJ6bKcoMfhSWB8c161OGh7kZDvVBd854NU1S+8sLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=hAPhpulvO0VAmQdPbfdAFLlsPMxnR01YRnb82s1g5EAdqY9ArVo3l5FcJ04iOjtO1imJG0F+Rn0hpWho+Hw40ulKKO+3Pq1RO/U+O/9RbzSGq5MrcGXV/VSZvjBZ9gXajcZUA+LZMKUzTxTDs7Q2qWBD9iXAoO0PdZ/kcn0lbEE/PNls5bDjGG6JugMXtprj2x0QuEWqteKN6DzmVdIjD8QdZl2D0lmnSCyAO6tiRNv+1Rn3rhkufDh3B7K14YRy67XAIQ54LgKjDng/BssbJJ2QxX5HeTFwWBt29LVVTdtjejGNPE8cf2HRTi8iy71D51XGLoaFauV7n8ZIxjfekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=ALabwhe50Xd6pN9FL9dR3I7z269RmYpikqHrxnFRUfNoUwEyA9SUGlouGbarOMPz7BXApyvryJXRT+32kr1eBeOYa2he8iWdUa+CLO23SnphE412VqwgBwBmN5yUdYE2l/erekBEBqJGKY3TLhXo0rCaoR2SKhj//57dMXfVkXg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 21/35] block/copy-before-write: initialize block-copy bitmap
Date: Wed,  2 Jun 2021 16:10:54 +0300
Message-Id: <20210602131108.74979-22-vsementsov@virtuozzo.com>
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
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03b2826f-fa05-4af7-0a2c-08d925c7fec8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693DB4A316853D1A8C7D60AC13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nOdRgRlz3MJDVTpWEic2oTFtPPfxkpiCFoewKmOJwETH3bmyre398DpDYNNPy0z5ON/LP96FbXoFwSqtFxtS+fd5ky2oO5iit2dmfc2NUbsbfs22DstV6h0otSg7q+S3z0z5VurZtE1LFKjprcE+s+zBv7dTxbBtu+/yXW58bxNuX/WptL1P9QeIEnJqP5W5sgq0Td9kCMgB++fHNps3OIxwrBZS2wzqaJgyy1JNlnEwlP/R15ORn+JlCDejZUnslrRp51QHth/hhCzx6kuRcj/iFM2kD2oZwjwlOQDTCjJ4o08zZyu7uKTg+aR/u0nhYhubc5E2aDpOrMiiYeZm7LMgHKeU0CqoIFKsWTGz13+NtmCGsR7e7eEKhAOOH/vFdjTEA5G2z2HjqP3QwpoYLe8ymJLeqnYpB6WnGwyBXd8D41ia09/wg8L9tu08LULtln96lsaKaaHh5TQYYH1S4DnyFGXZ1ci/GVGlaaWQVd6XgIvDA+auCpNJcbXmRkoEX0TR/EnZGn1SiHY2pWhWZyQct16fZP9AA3jScQ2Ac/rj3gaXOoygEvo3BlD0E5grawvoe3DTANYbR6g2+R+ZrwjwGiVcLdgrRSFR4cgTIKtMRa+mQPlETG5tBpmcLNFjshc73YANovslEtX2y68ti/lgTelE6Cg/8oeWTVUGLFh0vj+utnSQbNKDU3K/HQ73
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?d1RlFHuqFzSfk77p5yTxkq5C6uI4aV0P1XWXNa0cobH1OuuPSyAm+ApcDVgH?=
 =?us-ascii?Q?fFSYzIMKuVGXbDIBnSXsdjwKxH08d8T9QriXE/BKm6oPNjr0rH0huZhFpndl?=
 =?us-ascii?Q?przk1FLzZpLI2g4ijJV3dde6VC6adq9K4ATCUeXlfWvnkDtOvgu8F7Tt/40C?=
 =?us-ascii?Q?tRVG6fkwJyyaSipD5+/ABD8wXLc1RQzldquEyXEgaT9aeBXiN2pqIB/Wvg1P?=
 =?us-ascii?Q?t7FNgGkKJE7RWTrlVPcOXdbPW+Up8ozTFCTqF6hKw9TiI4Z/9JA30cDS9d5L?=
 =?us-ascii?Q?hO7UNvs+/+oYSELdefRoJ8YPTnjNMdAmRGoQfQndaq0Q2h4K+AXVedkDSnSU?=
 =?us-ascii?Q?kaTdU5KGHYu54MU6afXfEnl6ta6ef6QDfVN/3vTumnmgbPynNnxNVD5Gmrc2?=
 =?us-ascii?Q?3XdhmmOTvcT/JWKHu9WSe7olI9V1ON9GoetB/OGDoYA2myyGC/TyYUQN8SnR?=
 =?us-ascii?Q?hv092jSyAGQAXauAUENoJi3snQ9L5U/OlSO0kniFOAzcszlJIrVv93dc5H7w?=
 =?us-ascii?Q?odKrWPQ3dnmlJ7o8/OPk5MjmKp00xeWeBcai/ast8XuDKv56RchPxZSNon7B?=
 =?us-ascii?Q?Vb+wWIonb/bRGCnJSc8f6x8LPuGocLAje0Bcc9wLCIZIX5Jhb0shMZZ73lxo?=
 =?us-ascii?Q?xsYmZINEq228OzoznJdHIyTm/8wFk7w06WjE4SY/zmVs/LSoTR6MG9irQTkL?=
 =?us-ascii?Q?gDbPwYyUuhaac1C6G2q5HZltOyf7EemRYQ1a0/Z7phN/L+HQyfRe4FzDtiwc?=
 =?us-ascii?Q?ae2lH48Ew5YjSY1d+sY2aLpL0qyCU2J32F66MLPrzvkFjXgCFw7vx0l1v7EK?=
 =?us-ascii?Q?voIdFWVDL1jktduVhWUMt4nasPcL744QaQlwp1aJZuDXoDEhn5Zo3Fl1VXi4?=
 =?us-ascii?Q?IGxdadi4tcKyDFyAjIUaJpn/tx8J0t3sPhWBZgajTplKIPJR5qT8D76EeYKk?=
 =?us-ascii?Q?ELyVSj0Oo0yj5tyTESwGmNv454kBzE6sc8nnUZuALpJYe/1OIwbWiyG41YUD?=
 =?us-ascii?Q?vaYITflTelvt1BaUq1QwBF3/a896gVMyloA3+r3QmjzTZbb+xU9DMu2BMawn?=
 =?us-ascii?Q?3QcH5kdWRPkPUIyxkfIEJKpKqicTUlm98a0R/wRSg8WmlzwJKbIehw9emfiT?=
 =?us-ascii?Q?QvYqqf1l+oQfdatOmjBkPQNjE+/fkWjNVJUKSAXIcxGE9nCc5d4UW3Cd7VNc?=
 =?us-ascii?Q?5GnuVxZc+6QII70z/foNqUk2F9n/X19gvlNZwkJEut/XhVbSeBjlvnBWZOb4?=
 =?us-ascii?Q?VDl+Y4STD2a2DcLKIneRl8HMtppB/q6Cjy3fiRuKLGgv0dRBJb89bHAJHGpD?=
 =?us-ascii?Q?efLCWPRyHzeVh7a8xE9nKU47?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b2826f-fa05-4af7-0a2c-08d925c7fec8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:55.4361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEpH+6F1MC9KzGEJqIKk76OWtTt7O9GovkaVpd21MdrU1+ilc1O3jBnS2rGxrrSLTxOC0he888Z9QamhN4nP9rtmQKmIazCeIJRkTkXSdWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.13.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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

We are going to publish copy-before-write filter to be used in separate
of backup. Future step would support bitmap for the filter. But let's
start from full set bitmap.

We have to modify backup, as bitmap is first initialized by
copy-before-write filter, and then backup modifies it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/backup.c            | 16 +++++++---------
 block/copy-before-write.c |  4 ++++
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/block/backup.c b/block/backup.c
index 4869f1e5da..687d2882bc 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -233,18 +233,16 @@ static void backup_init_bcs_bitmap(BackupBlockJob *job)
     BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
 
     if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
+        bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
         ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
                                                NULL, true);
         assert(ret);
-    } else {
-        if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
-            /*
-             * We can't hog the coroutine to initialize this thoroughly.
-             * Set a flag and resume work when we are able to yield safely.
-             */
-            block_copy_set_skip_unallocated(job->bcs, true);
-        }
-        bdrv_set_dirty_bitmap(bcs_bitmap, 0, job->len);
+    } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
+        /*
+         * We can't hog the coroutine to initialize this thoroughly.
+         * Set a flag and resume work when we are able to yield safely.
+         */
+        block_copy_set_skip_unallocated(job->bcs, true);
     }
 
     estimate = bdrv_get_dirty_count(bcs_bitmap);
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1cefcade78..2efe098aae 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -147,6 +147,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
 static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *copy_bitmap;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -174,6 +175,9 @@ static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
         return -EINVAL;
     }
 
+    copy_bitmap = block_copy_dirty_bitmap(s->bcs);
+    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+
     return 0;
 }
 
-- 
2.29.2


