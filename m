Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547373D0C67
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:27:40 +0200 (CEST)
Received: from localhost ([::1]:42326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69Rz-00062P-8p
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697d-0007VR-J8; Wed, 21 Jul 2021 06:06:37 -0400
Received: from mail-eopbgr80132.outbound.protection.outlook.com
 ([40.107.8.132]:21413 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697b-00027t-CD; Wed, 21 Jul 2021 06:06:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/uaXi3ODremG5vDEPVoOe3/PHnDAzQA9/ImO4GNFOBdULmQeZkf+76eF8fAgA96ZBUf/OlY90oLem0FnUAViDqgQTiyxDIu8YrZd0fJtkhJccCd3izbsVow0DxjOkGSVqV1TgejvANcz5TYbszjVdAs+LG85gyqTaCRSG6pRMjR3Smq9D/hrv+QdLfu3l9Ec2gQTgtDlN/L+IRqFTLpMOMIYmhK3Qcgx0qL91hgN9dXXbGtYQnFNJ7NP4JXdBqRh/ZbP+ShD0MPhDr8Yae4NXX4Y9AZFYf3sFywl5b1KGFHqmuGKNzDP5kv4aHYkEnS1kJJbgoi8QIGhqM0TnSIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=dxC24pntjpynhhebsaN/gbApUb4Z5pmVzN+78szycXLuca1/BFPWNUHmJdtwiXaaPDsMfBB0OnflKlt5tnwX7yF/YhMJPRLFoln6hm+dW4jmYVC7Wf07Ui+qx1pOqCS8mTe96tnWfKgFK1MSwJnDhJHw1f0acGqAMcc1J8j546rGVs6E7/5zajAG5T7NCUa829z/tfyFal+RiMVTChm9AB6o+j8oCFqILI9lSnJZt8VSW9riYFqZEnDOxmULARrUiCwnDVOe1CnHPY4IPXOrC/KM/gVK2QyA1Mc+cpSYCr2UhyYjQaHQhdWAYHJH02aNs2H03d5UnbuAuw1A0NhMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q9xcd+/7Yq7hQ6FYf2psORRuWQaXyG4dc0/KfIYO+4=;
 b=EmE5AV4Hbkpep10Yf9dM3qNuWXQHHU9UZ1E8j7NeNCxQoqmdog/+p9CoRH3BPca8bjQwz4bSXnDEgbEKZ2puJVOClBkU+z4Vgwub/PBat80/0YJhAO8UopRnxf4n1gyH9/6/lf8fT+4ezXz45+WtAU/kgYXaQPsDW/FWEjV3Sy4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Wed, 21 Jul
 2021 10:06:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 16/33] block/copy-before-write: cbw_init(): use file child
 after attaching
Date: Wed, 21 Jul 2021 13:05:38 +0300
Message-Id: <20210721100555.45594-17-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22b04514-8896-4f1e-550b-08d94c2f3762
X-MS-TrafficTypeDiagnostic: AM7PR08MB5494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB549405571E0C903334B2251FC1E39@AM7PR08MB5494.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:40;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NtSgbMPmsxa9tcIiUrpOqQvVWkEvYoTMYjg2EDc+F27RPPPVqLOwUxFZ2VQT9z74WnVMPtxjTUb4g0DmI+BNGYlVhmi5A9PftXai++qhZqh7hYvR3SkvserLIXsDqmJR8Odsg70rH5PdIcbj0maJIZUaXlw8wzrUthglZA6G7FQQ5f73AuDsvcI1l7FU6IOl64K1qaafPndSzGhdF1m4WLsAo9BKTolLWsYjr4pa9OpeKZSjXFH6b9usBTwHET0l1EK8p0jU7TpweVLPkdJrkhEmNyMJeuT6NJOENR9isNRPAPtuJwp4z2Hf6/UkGt11n9ZA8dtsCTawWoLOHrdCOZ0/9N/BOEBMlLiVDNNqwPPVxuGQ2Ucy6+QpGGnO3frCPvyWgz3/MPlHgexReE7DziWjHIPdbGdN12yAdwByyDWka4IJ2WRcDS8YU1kQWeZAEueUMnSQZ9iz4z9KekrKLPYvJw3ZJ2HeG89s+ei7Y9/vWBAXbY68zlDBzHi5d0POdK8J0N+ZvRSZ8uGG3S5DbldqmL50IzOIF8pY/KKm9TqCFmFCCH8B8vVcQtAVjlcG2eZpGVzesljHs96BCMTu3CaJKd87bfLs1cU9Mxwy/k6c5lKAGSkXPJ+xad4GH+tjnitnEv3yy9hAze07cL/xSETXdOe2nG0qsJXLdf2UueUVOLZMeIYdtu7XoHtbjf/GZR46MCkw8l3tT8yC1uQ0sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(396003)(136003)(4326008)(36756003)(186003)(8676002)(478600001)(66946007)(86362001)(83380400001)(66476007)(7416002)(8936002)(66556008)(5660300002)(2616005)(956004)(26005)(6916009)(52116002)(2906002)(316002)(6486002)(6512007)(6506007)(1076003)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vsb2lGIrM3GkUyvn1uiGVDbhbkoK2E9rYmTCU3Roo2o70y7ZcJiPDoxypHT6?=
 =?us-ascii?Q?02bCXdor9ngdnbqfAskvItYzXJ/p8QEiv1j5W9DZQ4luE5g/ezTV1Buf+r5/?=
 =?us-ascii?Q?bBvCpzzcIbQjerzo7iIDvxYvC9kNwz1k3SaP+KPUYJScqQ2X66czj+TJnpS2?=
 =?us-ascii?Q?tGHH72uivx62BeJWsRsmOG8yqvi+eE9PhaNZ+0rYEtqjZVK5hlPT3w/oFo9F?=
 =?us-ascii?Q?Rp8xjlXBLpKL2oET5Enx7ox14FsRNQLHG1/nNLSl4w6oAuGu/iZHld7nT1he?=
 =?us-ascii?Q?7wsmd4ZsjmtEEa/RvomscKwgpFU8ktLp5WIVcXtyJdO7AFKy63/QFieuqUkA?=
 =?us-ascii?Q?QJc+6DeCGKjXxodaSkPFKxuIUJHY5aMfRMTzVYDrxZqR+bJYvgLt7y2zqoAw?=
 =?us-ascii?Q?ycW5XGRpkOMHS8XvQnxCurF7q4/gYwLMVxpN8IG3E6vq9yVTJEgtmIEjXyVi?=
 =?us-ascii?Q?+bVv2YdfH4fLYZoRTdjsP5bS3qct6H7/c7P3OcDwcX4V3MgQOAkEAZQfRis2?=
 =?us-ascii?Q?QiMIwQ7f9JkYpevfOyryDcQRFIU+d05DC1KKXhN/IZM7JL6+hal/0YCmV9Tn?=
 =?us-ascii?Q?+/0rMwWTudrx8IUEHenypdnB7H+Ufcv79q7B6KqLXhYhYjDiOuFMLyXD2vS7?=
 =?us-ascii?Q?759ugwDFZcN+faSEtMiaGpanX4ldB+GqUDpgX7hGgZCamTGyFM5rNm71MZIq?=
 =?us-ascii?Q?wBvmSn/n2j93TmEk5XH+Hfq5FFk8+4GnvopZxnsICh9y0rLwRngNno1e6gNu?=
 =?us-ascii?Q?MNoFAoWCmVvcErPtMpnmXJ+WJFP6e02rglqqWWAjfE80uLU/Uyxwo4VMaLra?=
 =?us-ascii?Q?4P+aInsBPwHBpx3kgN0UghoQv0DXRTSpUqqig1GEKlaS8TqyUIp88QRqVn5y?=
 =?us-ascii?Q?JHuMR8bratweBNdCVDwzmrI4Raw6fwsy8nY9MuFWty8VYEqY5o2BkRfw0VtQ?=
 =?us-ascii?Q?dMzDgoH1pm0IzUDXnGt3NQqIrWLgiex8N+pAVlUCehXHUGK/GUJlWOsNsOpK?=
 =?us-ascii?Q?MV2PXZP4LLncPc+pj/Qb10CzmR9h/3LlkAW7GqvxNcP74bZ704sVrIGJdKs1?=
 =?us-ascii?Q?IPSUeg0c6ck91MJrklhSVuEArieTgwBn6EYshHylx8Pwo10GM0iJVaxZ0dwb?=
 =?us-ascii?Q?UfD8cCcxQ37JnCZkB1Uxt3T+Nh+lpNvhOTR/e39k2g/YiZGcIESNHn3tmfnY?=
 =?us-ascii?Q?KXbzaLaMkhJoK+h/wU4+BJeW0cxrzfxAE/e48+RlnHvbsJGYmWj4cLAjiYmY?=
 =?us-ascii?Q?BA2Bt9JMPj7AQqb8sCGmFWN9bOt1pqefERwwXfkcZKTWbZSIbIuTpiYBNuSt?=
 =?us-ascii?Q?8upphmrJMhHCibNaEx+CAgp0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b04514-8896-4f1e-550b-08d94c2f3762
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:32.7155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qi9PTitWsnX0THhvLK1hhlHxa/KUpIIggdGqKmQLtuC9gc6wASeEAhbo292WKalwtuPSBgN0rOrUpqS9+IZGjnxO09AoXOhfuCUppdSkIX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5494
Received-SPF: pass client-ip=40.107.8.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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


