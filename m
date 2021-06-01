Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFBA3978E0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:15:23 +0200 (CEST)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7z8-0003ZU-I2
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bx-0002zV-JB; Tue, 01 Jun 2021 12:51:25 -0400
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112]:35829 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bv-0002O8-Et; Tue, 01 Jun 2021 12:51:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhK2lCtCx5V/hl+9C/p2Cm7gqqFtukAJV0UXRA95OswJ9tVguUkDxCs3XUpzVNo7P/rDnU4z3OF+LWrz6sBf2Og516PGgm+jNDgQCWBmPD/lBjGrEQ2ADOFtYyUBsU66Uhkhw8e8nYjJshn/FGU7tVjQZIhWsoa0/in3qyi19Q2XCKXszvR6qCRXU0oJfBRoTmP1aXKuAE5N56Wtmgmxxddxa/dhAbxTsVHp+6xrlpkgWVTvUNAYhG3gvOtWtN7ZNFWBngrcbdAs5WFW+RVv3esIS1jqT7kY/oFziVU1fxjok3sW/50iKtGHjX4U+l+xxIoRTRUYws2QGL08WZlOwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=QnUv0+1BMkpK4ktUu2IBDayKf9fh4BoLSprY1OG7JJS85brwGW0CwE0RXf8LpvPJ4HgNKRA89b2Gf2ZHnhsI2P0x480X2qo01Dw+KV+zXHFXhDCXIhy8cryDlzOOAp9AYmVT/fg/CxUXi67XftiUHXh6y6wLNRP4EZ77RTf6GIYC6aVfSk981yZjh6A/KfrcZ162MU+iASqLwaLsUtVVsPicXKBHKsOwbVRzBIwux/U7xbDFuYKlOpaCEwPqLPX+eTQ1pjsdbPA683tHilSGRjx3qbwxdg8vOBEsoR3aRkdIyGp/7ygcp/et+3ONEmWnAC3kZ8GU3bxLg1G9/Qe74g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vfqnsp7hFTsT4dqLeM7DgaoDGD1UcygGkQvv816ee3Q=;
 b=lUxF4iRStQtzCrTzF+ZAes7Bgd/2nK0zaAvo9e83xWqJeAsEuN2lCdWU5QebNO2NyfU5wsqXkIskg3YGstegkFvFLHcFZbAEOK9lkI9Ai2T0myts6pFPAmCdji9NBQKRb+gDzzYL6kRY/SPg7to3xdKUr1IpXrkF9G5zxw0bUo4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 21/35] block/copy-before-write: initialize block-copy bitmap
Date: Tue,  1 Jun 2021 19:50:12 +0300
Message-Id: <20210601165026.326877-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601165026.326877-1-vsementsov@virtuozzo.com>
References: <20210601165026.326877-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0650f5a2-101b-44a8-dcc1-08d9251d75de
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19726581114FABB3EE5FBCF4C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:194;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IEigfbEs5G7R6yknCpUiXp3uOHdJCQZTthK22jUTrqLwq5RGFQA4Vjzb9mtsrrvvzLGiuiuvjEI4tAuLntci086+cOjH7sZThh9SoTqVqTxfvH9k3R+6BIvEw4EzJ/AuKKyPl26us7z35jbkj/AUrnj/nu8MjQXFd2bYQ5IOTvXrtszutxPyhlRxiL1ZCTiHaapWqX0KxeRSaIkNXVWtURjbfaavZourQopIloHgTtpplHw5jIjxWQ5RhZxRH/DmhZn3i6xFuJD2tSsEUukrkLMDfuDI7r6UMLXYghXQn1469E0SXKnT6pYPDUOq8Ikg4uRworUj4PTX8MvjU9eXb/lP/0iImLN5NZTk+cro9ne1qUDGH8hvuyMwlfMvSj3aCqqxTbcKkFIQ+A9hCjsadrYblu5XgZTuNcm8OJMT9SSaVzDJqYC4cpRDye+C5fexgDrAgPAs9LwbGZTHuFtTGYN3UyXQKZVV2nCpElNFNjgt1bA8n3O8MyGj7fHl0w640Sj4cCekffs6Zy9R9fK4NyN2aBqH/Tc7tltJhG9D1XNoJU45+brnX432F+w35RTLUnYxtAXkOLV5BaMNPurRpbj/hOGTTSZnxHKDWjehKqQkE/QBf2b7BKN4T7nq+gkDKtApWYdpj9g26CHeE99cpejiKYvEdyJb3dsvLysSzkIQsS3xqyLTn/gyG4MdU4kg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7SI5qvJAOiJol0huXLYWRceyc7c1lH3R7TckyMIiN56VP+iMBeoXPCKpTDGI?=
 =?us-ascii?Q?ItsGCSbOCcqg34X3CPLXMgBIOdrLomnX5mfv7MrpnIMX+N27045tEeQLR0KT?=
 =?us-ascii?Q?dtloL/Oyxzz1N7tiVrwgPHTbqbNMM6o8bfRReazdQjzjJ4qbgJQIz1AAoU0G?=
 =?us-ascii?Q?aj/o0zjab/923pj7ritP6xaY5HRhMyll6BpRwA4N2+biQJCi6siCiRLCJYqi?=
 =?us-ascii?Q?Uj2rbQlBovBp5XS8i5VKSJaO1cx1rOtVlDlX8HMICk6Beu/FAHpJ3boMB1Nj?=
 =?us-ascii?Q?C/lWDhy4cnOwCwoG/zDCYZ0sWbSpyGaPuLJ1q4SrQb8uYF0lHVbc03kL+pDr?=
 =?us-ascii?Q?0rENoP7lGCo/Ykzhp+SO1337caKuS0xLuyYAIYLll0E3n8hP0kU/E+g7o+Us?=
 =?us-ascii?Q?AloEy3bcnFT+LZexKuIPodueaIA91ngFxZQYde2HSYVvil08yDjxeHCYrjPz?=
 =?us-ascii?Q?4UuoJMU3KllMOXYs+FQOSDcIK/FMiULcPSesfOrM03ZjOxmDaogJR3KJCul4?=
 =?us-ascii?Q?V9wIRlKO3McyE3TrMqRSckXnV0w7XAoxzruWVr5R5uVAV8cIusAkPM9I/JhS?=
 =?us-ascii?Q?Zzix9OpsE9v25c3xtYdzUqmReGws/pp6kFfPQAWD3eua8L9FbRi9yltndV7n?=
 =?us-ascii?Q?pya+JI6YHrbTahRWipa9OP9sGcZ9U24MsKjVJL8dAcW4t4WNlra5z6OF+bWH?=
 =?us-ascii?Q?hcVFEN7Gj5sm11cw5vNPF74M5mlQ+oGwg5zg2T+LtDrNrV7R+tzPabKotEKH?=
 =?us-ascii?Q?N+cNiB+XLPOrgorQqHQ41vkz7FWfRvb6Wq9VrKTLY4TEsPPUtU0pwSzzfG/M?=
 =?us-ascii?Q?O8nJwD5t+xmCaHeS0Ifdj8Kz/fVfCv5+Xnwhu/c8zFj7H+4N0FKjxHY6pUPZ?=
 =?us-ascii?Q?J/Ccx2buPH+QdKBUh1BrRanIkAa86CfXah0WZqz5hZY+uk2F3clyX3yEzP+J?=
 =?us-ascii?Q?AfeNp45DMTXiRIS6r6jcTDVp5LNIy6cJ3qshGeWswdia9wzYGBpecIwfSx3s?=
 =?us-ascii?Q?rCbo8cbZAk7rBzViLu0g1vz6seOWqY5F8el0Y7g2yL5Jd9dmHlob3GgCOSYO?=
 =?us-ascii?Q?cNpsAU73wQ5o5O0uCyEiIV5Jg4xZk7y4+yPOTi4D8oV3/KeqgQ/CR79HhQ6e?=
 =?us-ascii?Q?a9j7IMqZuyDHqv0nPeN8OUjqVW/ColhYPDWD3dhpllO10usA/m5eIpxPNOZ4?=
 =?us-ascii?Q?IVlA2057FRfAQjNGWNrQvRGXFQTBeGnCr7Caa7htWdQyC/yPNAbZ9xw3NKZO?=
 =?us-ascii?Q?ozGVd0flkBwY9RCP2B395P314xeMYJSGgn60zaSxUgCT5GUkytQyxNiH67jn?=
 =?us-ascii?Q?WwNnoKsTVzcj5d48MIQAInBL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0650f5a2-101b-44a8-dcc1-08d9251d75de
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:11.2649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpMzF1lfsnk9G0hA6d3FucXW9LsSJk8AMTGRFJ8vIWTM3WY6tIa4WoUUeDWMoEPR3pIDqrvK5r0aRmFfaE/6enusnRzZ+7EMavA10UNNSYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
Received-SPF: pass client-ip=40.107.15.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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


