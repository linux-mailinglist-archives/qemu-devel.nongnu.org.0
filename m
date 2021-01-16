Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC682F8FA6
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:14:27 +0100 (CET)
Received: from localhost ([::1]:55068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tpy-0006Qx-QU
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVL-0004kL-MT; Sat, 16 Jan 2021 16:53:07 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:35449 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVI-0000ae-Ui; Sat, 16 Jan 2021 16:53:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2KrAhPXkLkW8nH9ONjsFTASdWr/2AQSv00ZQl5NS7pdKAyojXiY0MB1bnzdiTtv4n4nG9PhAv2a2W68vtvN1lcCzEM5SrWAS0iZjBYy6gr8UpQA6K4JzLRNZy16ymEHX7OXBNBi0lfGh2+8gNbSpSMt/njPei5oAOIZvj/YCmgY61gj13C+LpneYb/kdNTXE+NMQF96abohKD+kmt4jUXoObjya8inuUwMQZ2xQRx8j4v7S7lbgQNL45jH+1KWNrm2ORO7xZTJ0w3HMf5CVCNO293KJ/KbfjzRRoBMMGRwsnkh57jfz6CvHPWhMshJvPJh/VlljLA3mfDiu1Ox1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruW3MvB1R2DDEHV/DdJHcY9oGj/RsSlhNyxfOvw8t9s=;
 b=RSpWFgtCzh+XM22YZqScaoiERg1sxbiE38B/2yEhu9Di03uic29jtvCeZyclTEceGTMzn/JIcaK65bGRHc2wB9NdWPp6xlHUTkdgTxyXZOrVMktdXG4suww2mWMFbjTR5QLLzac1B3XziwevE670XPJCvZLkFCRiXBxYwleps0YyvWrf4I90qvQe/9Bin3ghQcoevW3SCgdMFS1iMWMBa/5eR3x4oHSBc304xOgd8jZROIzSbDufksOk4QZfqPixgY1d31zpzq7EX7KpGo5cg3zuBNivGDGGLmPFMSIff6AQXRDsjkhxDVtOzx2DDBR/Ug2akc/WhxMDtGIK0piexg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruW3MvB1R2DDEHV/DdJHcY9oGj/RsSlhNyxfOvw8t9s=;
 b=BvCERVu6N216+htsPGqeQEjAOmE7ciM3lXxNNcXKPDFfBpHj4r2Xswkp1wyTlc6fl/JX6V/65W0s2l2H7IBkwgDFrxXxjfA6eK3byMDVpNn5CUMwvaWrF0WeC86b+91L+/JtuBbmShnrHWoeBUjHI3U+XB/hbsaz5zIglSgtBrA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:52:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:52:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 10/14] block/qcow2-bitmap: return status from
 qcow2_store_persistent_dirty_bitmaps
Date: Sun, 17 Jan 2021 00:52:05 +0300
Message-Id: <20210116215209.823266-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03f19cec-34b8-4a72-7abb-08d8ba69152f
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542AC07FAE3C32562A4C29AC1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:246;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K3XxH0g9jka0Ye0oaFw2uai1bdfmol+b2qeLxT+KY3CYln99dsVCeLL/0rgmJIXTIV7PuX45iEhqyYlgNjOEUook18XinjuyLFHcXti3XJm4/jrH12AWB9JiNe/ZREBorAeFwXNk91w5+4jhI901ImfEKzucxE2xzqv1bD5IKFmIIdnuBM51Flx4NmYdntJACzz0FpPBEJ80qikf355cbC9MMZWrJ1Ts2iRdKVfsWyEA630qadJT8i/uB+4wq0ZxenVddT6NCKQxc9HjnRHuw7zi9slJsqrT0zaIqkEPtq83QwaCfbMmlMinYERNhOj0ASeZc2fTAtSGenqGanSaszaVvH8klGF3SRmSBUa9Mo8ncbqsk0vwCGrIeUd3XUqa8CLvZukwneD+3Xb2dNp8sLR4mlt/IIC4NAN2okdugX/z/17OA6SQigUTIN8E8qci9XXuDCT9ss19HQ5hIS9bmUZX+IK9YTGVJMaeZZ/brpXaHaGeRdqm9yqUpOCnX3qPcUWeAmDBu0E0tjeMW8S1wzRS4noelNT6dfewrfwCElEkdNc5DbiOXgb2VPtYxKUQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(19627235002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VNgSxCcVd57tQHCVEXftnrQMr+5HPQHGttz3/Ujtu6Spdl/uoqp19YUNkWc0?=
 =?us-ascii?Q?ZDw94GpnKWxh5AGjb/BEn7kEHPkQ8qZWaqC/MqGLorRlDxULBx8AWvC5DQaS?=
 =?us-ascii?Q?NBXT02ANF75WYQ68X69neSDlhSfl3pWOYLtuDWQvyoLh3Kn/A2GqmeO/aR32?=
 =?us-ascii?Q?LlnadUAwa064l46FhRCXjmEYDP8rhtHbHVd04mALnlX7OaVcfDe8AJb6AAHI?=
 =?us-ascii?Q?oJzwv+0vcGawwIqW7+0YSikgIvprlF53fj66A5UCuUnkaLoPIjN0gpkEXtlc?=
 =?us-ascii?Q?Xj+3s5cmcAAgGkE4jC8DVQmHkjp+n4KVqu0yAZM8WF+EFsbaYfZTvU4e+vqM?=
 =?us-ascii?Q?kEgbPQfzK8R97v7MZZf7pA/fEBy7TZdjD9DlAs4AKSAa6COApzFGgDcFzBeB?=
 =?us-ascii?Q?q43Fq9LDXR4UAiulzWh50UD+PJLo1bhEKRK0KnojKcsVXIUbt8SVtu+RFyYF?=
 =?us-ascii?Q?mcZrgvuvJnaso8sQg3nKy53a9Rc0l7PgNBt7Y1j5cenEa1YbE1A79DuWq3Y4?=
 =?us-ascii?Q?8DZPFG5QerYobmKxVENBKG/TuBZs9s5jbg8UfevUME0jaSdaDi9W8VdNaDRF?=
 =?us-ascii?Q?bmGnx9nphs+LSxbC0+94OJOmGZDxVxS2BPiFryzK8wZprU+BNXTbZxjne6eO?=
 =?us-ascii?Q?k0SiqkCswsiJkVKCoYVExQkfjdfh/3pSXZwI0DQdetsZsgVcfIQlzYGndkd/?=
 =?us-ascii?Q?xV8kJHaT3bD8w24STHKU3PGqg0CUJXJ5LDZt3ffWs7aoP5KIrWzpxl/ZFg34?=
 =?us-ascii?Q?p7hPizibF6oCNPwMU+jXG2MhK3/y+nZUK4DKb1yD7Ae4ivew6VH8xFCUsuaW?=
 =?us-ascii?Q?qZOFk28v49F6ROWFvzPbnmhsGFjJF25meWcZu9QVeec2X+Sc5SPToGrSU2Fn?=
 =?us-ascii?Q?flRWWTAJAL2YyDra3FS+qbeIVafzv+ZabhMguJrLyczXMR0IrDNrXIG95n5e?=
 =?us-ascii?Q?agpxIT4ZSX7YEWFmbpuACZgr9F/HMDxCMqhbGMIFTBbO5H8wNdfIW3/+4FMn?=
 =?us-ascii?Q?8dCU?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f19cec-34b8-4a72-7abb-08d8ba69152f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:56.4313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0Y0E9lqrbhrSm28DBHZDRYbiD7JygNDYYaDcsLZi2tq8/6xMMip9D0aPkt0l1zQDQAT5rZkfE34tZHr/CkUMeNVDe8sOoqef8rMoHWenu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's better to return status together with setting errp. It makes
possible to avoid error propagation.

While being here, put ERRP_GUARD() to fix error_prepend(errp, ...)
usage inside qcow2_store_persistent_dirty_bitmaps() (see the comment
above ERRP_GUARD() definition in include/qapi/error.h)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.h        |  2 +-
 block/qcow2-bitmap.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index d19c883206..0fe5f74ed3 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -984,7 +984,7 @@ bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                 Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
 int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
-void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
+bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp);
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp);
 bool qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index ca01f08bac..9eccaab7f8 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1536,9 +1536,10 @@ out:
  * readonly to begin with, and whether we opened directly or reopened to that
  * state shouldn't matter for the state we get afterward.
  */
-void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
+bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp)
 {
+    ERRP_GUARD();
     BdrvDirtyBitmap *bitmap;
     BDRVQcow2State *s = bs->opaque;
     uint32_t new_nb_bitmaps = s->nb_bitmaps;
@@ -1558,7 +1559,7 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
         bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
                                    s->bitmap_directory_size, errp);
         if (bm_list == NULL) {
-            return;
+            return false;
         }
     }
 
@@ -1673,7 +1674,7 @@ success:
     }
 
     bitmap_list_free(bm_list);
-    return;
+    return true;
 
 fail:
     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
@@ -1691,16 +1692,14 @@ fail:
     }
 
     bitmap_list_free(bm_list);
+    return false;
 }
 
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp)
 {
     BdrvDirtyBitmap *bitmap;
-    Error *local_err = NULL;
 
-    qcow2_store_persistent_dirty_bitmaps(bs, false, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
+    if (!qcow2_store_persistent_dirty_bitmaps(bs, false, errp)) {
         return -EINVAL;
     }
 
-- 
2.29.2


