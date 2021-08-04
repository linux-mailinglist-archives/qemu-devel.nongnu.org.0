Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666093DFE61
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:50:35 +0200 (CEST)
Received: from localhost ([::1]:41764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDXm-0002vH-83
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMe-0004rn-3q; Wed, 04 Aug 2021 05:39:04 -0400
Received: from mail-am6eur05on2113.outbound.protection.outlook.com
 ([40.107.22.113]:37569 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMc-0006Ho-8Z; Wed, 04 Aug 2021 05:39:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtG3vgfXn/Ye701dXaxK+ym5yojY2AsJVACq2T73U6aPH2KdMEryBcB2cMaaKlDs0Yr2HTFVGLTC1CC7sGmp75oMXjsA/jTHJ3Np+ANkG/mTMLnQaY6ykaMXE51FOC4PVjCrwVD/X9sLOh10VDQfugDy23GODFihIJNFt3IWpKCrM729etwrcYfptNVwFt2CkXkklrpPh9n7vtklV4P7zEkmXT+M1kkncBhKiXo7IWd4k9YWWqW+PGpkKsbWsQEvQ7nnmoNMBAjZbIi9TBmg+nb9dUuZc4oLqL+p3kIHlu8SbbTyl0qwwSA9kYO9CTUMuAvdvHb2QV6zCi6eYkgbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=U2Y/6t3b4/gJsgVb3Jx2+g3KzcrxjQWAHcFgSzJS5ljRS9rXmswQihVpvjbsp4Z10HupuGKlsaaM5v2bNyG2VDUJ2yoat4lRAbVKggL84421WLVpjAnUqSxAb/2t3ya2R31YjLAdNGghlS4pCxma0g0c3BE2XxutX3WoSjGmp7knq9VTDPjhe+mRF5BSjMMwRN95MwWrUXq4Q12nigVJx0iz0liZCiuX1EwjUVyFlvS87BSORh2xKc7k/1gNUZhmzlxgcjerREDgvqUlSdOXvLGqSFl7GXYhgLXxXCQc8JmIGXq9rq81j5gJTdQDJJkHeG3uis20YXnOZyjO5g+MBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=Qyswet8bfwORdyqmq6jUtOjdOkrAapztrA3Xl0743fnEb2KqxBpzoMwPEqJ3tF5W0NhELPsjZJhx8L6oorkS18OSfVv/1oyQu9uZkxE+DvwJ85vlMHzCtRfY0gZTDM++rg33qY55+tKa6m4BPN5WNkmRiG2KrPNF+yRr649VAjw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4689.eurprd08.prod.outlook.com (2603:10a6:20b:c3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 09:38:59 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:59 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 16/33] block/copy-before-write: cbw_init(): use file child
 after attaching
Date: Wed,  4 Aug 2021 12:37:56 +0300
Message-Id: <20210804093813.20688-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6944559f-48cd-42c0-e2ca-08d9572baf8f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4689839946BABADAF7CF04DDC1F19@AM6PR08MB4689.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rIltRQSfN+ktudUTie4aipI58VWty8R7CBV2zqgCT3qBNxnjQ7sAV1PFkRkdlnnPJ846dMI/FU9XF+x5BYYdkLqMuRbEIMVreoEFu5PjuX3p3/vWIVqru1/Gcva6htmjYJswUa0jloDpxYl5sxzVMXNfCKJFuhwve+YkD6kgu3p5B2hyuM6dVeTAJoN+SzdRsafWlOhGdTTXSBj1FHoMkKT+Mwk2uZ8aExEigIo6ATfRZF3eczOaPG+6bYkJLRKsuuzcztct/B/MSmoyTOjDubCoOrvrxCnh3jSWMb7n6IjqDPe6lPQzYy3RyVzNtavF8k/5o+qMeC9pcKklYqK994Ci+kon9C7OfF949J4eML/ctuRmu+8N4Qxh9DazazLlyJPpHbVcam/lLOrsGBWGDxrE45b30LJlOEPX/Q2wpqkEjQKZ0OIa1ohA6TpkpEth6cvEYHRmIxdKD9k9I0K6nZbGg0/wHvS6bRYuOfC0VpgnBGbslMOayWgAFaxbIjIF9FWdK5UXaxQHQu/ZCTyk+Aua4N/CmLwKpDvZeiaM2WwcwcA/pmlfzYXh0EFlsGD2mhiEnX/AyREM9rkqJPSD/JiOehm3Nrt+GGFTb/zrCaDlAgV4siXRwKho3WPm+L2STJT7ZHu8Y/Hlb7vJ8/bESXvGdORb2AymXPZjf5vz/uqqqTtdqQ/HGKtTDjxti+IM6G/1E0+lE8e+oNSVgQW/vQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(26005)(186003)(36756003)(6486002)(2616005)(8676002)(316002)(956004)(6506007)(66476007)(66556008)(6512007)(4326008)(5660300002)(52116002)(2906002)(6916009)(83380400001)(1076003)(38350700002)(8936002)(86362001)(38100700002)(7416002)(66946007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GRgF6FtiSvsuJNmrgXuTPDWiPfH6ymyNwurL5vLJ5mQy5WBiWP6Y/TOtmuPd?=
 =?us-ascii?Q?fEQHjS1sHilFTANqH5rjN6B4z0TeXpCo7d5/2cYAfhsPSRnNwnqofrmeViLA?=
 =?us-ascii?Q?hrTkWI1tCzAp22wn30BanVKO1cnkpMa21ywzuEIkGatLZDpLarQrEtU+ZHAI?=
 =?us-ascii?Q?9/fP8R8Mqp2HEwSTpPXzR6liKB/mMAIGxx5Sb02F1X/pjG4PDE+pMzAHGp7c?=
 =?us-ascii?Q?E9SRNz4RWNK8rs88SI5PEF6fRf0xR4EUzL8r4fPdNG8zmm0E1cXmR8Cug4vw?=
 =?us-ascii?Q?IZQaB8EddXKeH6u+JhrTAJlGR1zOC00nFA/vwjZkTcVz/TBzmIkWm4PxYFS3?=
 =?us-ascii?Q?DKSDfNkbM35A3f9KmPjXWgmUSMWcqZJk9w0OlyHW6bqBOYSTvdWdUVQA3Md9?=
 =?us-ascii?Q?ndOi1PHs55p6VDgMx4Yt+umZQMOaYtyx34S0o/o55ViwcywFsUFRGWOvu1KQ?=
 =?us-ascii?Q?OieCVRRtnuFODGb3gWivmVHdEgLyqMz3MIgLHBeWF16i4knqa/H7I9NcxUVk?=
 =?us-ascii?Q?Dl4IaMhkXP8tKBnrgEaVpsoyTi0VcpJ5aQZMXfnjVoYtFnG1hVOMA3kP6gW9?=
 =?us-ascii?Q?LfO9dV1cJ0Br5VrqRoA9h0MRel4lenL9jRGnQLhBtF+AdMD/MVypNSbRBDze?=
 =?us-ascii?Q?jm4B+0dXVAsOgO1icL7Dq5R6GsnL8FuufgiHUXx3eZnykAVp4cVQnEn8Iade?=
 =?us-ascii?Q?8q7O/XuNBR9Um35VewSh11ccQf4UOYwTdhzNRztbC+zIU1WzxxQeyUx39rZT?=
 =?us-ascii?Q?DIXN7aa04hni0pnKRH14WhEKGdLqqsv97nKdP6KHURaLRiEgNxYeQsBIB2f1?=
 =?us-ascii?Q?Ke5S6va08lrSHnUOXVP+tOt90PCO7ryUJe6ZwiyRFWyttuk+eCpjkv/IcSnE?=
 =?us-ascii?Q?ZQcPUqWZEAdcLh7308M8SGey9C5TDiWeKyoTvHCN7+LjYPmBA/9SoBXh7x5A?=
 =?us-ascii?Q?XuLe6q0krSl2jONweiIUKH8wnpZ7IsLhR7OqkiTxbQjYWqfUSU/YGbLQ63OK?=
 =?us-ascii?Q?/plQk/uEIjZSYo3GKClJlsEQAuslqb4f9zouBsjCkjJg+06TGBF5of8n2DWi?=
 =?us-ascii?Q?C9ET2658lk2cAQbsmKpxfcx4mtXzQu3icuSY624Q2JoruevdKJXewx6n+krT?=
 =?us-ascii?Q?SPA3pPnv3R/C1IzzTR7bzmLWbwVALQQ+IKuVrviAgESvm/jODgWoCcXJlxC7?=
 =?us-ascii?Q?O8ju4T+voVXV1HLfejun2e/PSOyZ6Jn5jq87Jvjnm0NUXCRDx6l7mpDFfK+t?=
 =?us-ascii?Q?6D4SzD7RoWywuLVv7MGZmUHtWN0R4AXDPHjNMuZi/1XLgi+klmPWhOwgc0Vo?=
 =?us-ascii?Q?Ea5IpNXBpD43oxIBLIhUAxvV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6944559f-48cd-42c0-e2ca-08d9572baf8f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:59.1791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HndHQ7ko1leA3muKzPy74mMZB0bS/PTbXY7xWgrjuUqANfWN+GM6j4Q1FBXu8zMih+sXwVnFRL8lCAuI+ZNKVjdFsrOp9nEtil+OPWMQodQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4689
Received-SPF: pass client-ip=40.107.22.113;
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

In the next commit we'll get rid of source argument of cbw_init().
Prepare to it now, to make next commit simpler: move the code block
that uses source below attaching the child and use bs->file->bs instead
of source variable.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index d7f1833efa..4858dcf8ff 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -149,13 +149,6 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    bs->total_sectors = source->total_sectors;
-    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-            (BDRV_REQ_FUA & source->supported_write_flags);
-    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
-            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
-             source->supported_zero_flags);
-
     bdrv_ref(target);
     s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
                                   BDRV_CHILD_DATA, errp);
@@ -173,6 +166,13 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
         return -EINVAL;
     }
 
+    bs->total_sectors = bs->file->bs->total_sectors;
+    bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+            (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
+    bs->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
+             bs->file->bs->supported_zero_flags);
+
     s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
-- 
2.29.2


