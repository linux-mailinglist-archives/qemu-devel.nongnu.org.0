Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C529A3DFE67
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:52:33 +0200 (CEST)
Received: from localhost ([::1]:50116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDZg-0000XE-Qp
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMf-0004uH-Fu; Wed, 04 Aug 2021 05:39:05 -0400
Received: from mail-eopbgr60114.outbound.protection.outlook.com
 ([40.107.6.114]:45925 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMd-0006Db-NR; Wed, 04 Aug 2021 05:39:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDCXfB8Owslonlj5u+DwabZjfbmRtx18yWfx6yQqVY8NLwz3I/jeLA8XZuRd3MIcRClR6r32MEu72t3y9/hIIBJY9qWokyklk/v9yZSE6P/2SQ9p2HoIoqDgeN5s4Pm0dsnokX6mJPY1E62a0ipeHm2mmckWi5orpGkYme5Yp/HnYqkkesKqE1J7zsO1IVhiejJZh9Hk7DXezSH/oqm/+ZTyTib/bIyFz6ZAe6NPB45f3s4VHvtha5FqcOnNzPOLUpRmSdusl2YVQpoRXz+F07nDM6iUrXNLnbo3NLNHjUxvFM0gH7KgerwbcViIf3Lad3CEuSqJcLe1TI8cCrnyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=WcNj7ctwTaHW+XtTwdAy6jLkTCZw+5Ed5pWihh/WF/IcO1IhbYV42aC3ABNOYptoMJbgIjd83c5KjPWEJzryhqFvtJvV5JRgVhBHuWMfhV+5oX6FrXBeFm+DUNLVBeJCdNPtEwmAuStO8huLh3RX1Za5X9VPf5gRaidQfp+auZyrtZkeLFb29H0vEN/JL53iyVd9pNoj01zN7Tu+XxV+CgPIrhermmaofs2h8aO2pA6QCqthI20eIzobOkUrvxXCGrWE89P8qv3GosJZ0et2+SzW1ocRcTzNa3zDLAQbByI39N7j2ip8EUpfrdNk+z8PuOl/joz+oHDqtZBJiS3vhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=RfkErRrEQh72G/FnyTi63ddm/5+rffK9mN2jS1jYRe2tYPUu0bwlHN53I73RYWzLKxUJ/hvCQz+E2efHG4/+b1ZQG4NadOHnYzWiD9o0QbHM5NsAPskkeuZjS/l/PdgXNFcN1dwzUGeAfd1sjp2u9aznOWVB+oo/qkP9nGFBdw8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:38:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 14/33] block/copy-before-write: introduce cbw_init()
Date: Wed,  4 Aug 2021 12:37:54 +0300
Message-Id: <20210804093813.20688-15-vsementsov@virtuozzo.com>
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
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7fe0fef-dae0-4fea-8aac-08d9572badd1
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB503236B304D37E6F32F5B91AC1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8FVzmeNN+8R1oHh7FPlEFgDEK2/UenjkcxKcVPc7yDru0NNccJmCK56bg0xRFIKNoI78tNTBMU2WRXj7k8Dkhq8C+G7VES//AkAYZ3pqH/R9hDlNM5JjM/pqsdD3uGlbNf4j4ntexUPtsInzlTarhuIoqBunCg2lC6oZ+VQ+1kq/LDAjMEMTvF4RhV116MY30PreZQHO9RbYTN8klXDwQMeotHBCl+9yN6wgGQIbzy0ni4dMjbcmfcjs+7Z6ypYb0z23RosijYKPGkIdHjF+s3+LlwPwCGnz8qrQJbjZR8khYSm98lPmjoOH16YFNOIVvMGcKauSNxYUYNswPW1jCa8KdhKuOkCj2x8MJFQiPPQl2XyuVMubBynoGc7bdzUMzg/NNaMKUAd4C/F2xXaluXoNUVu73OYjGVa4TQcJ2rZrDZqld+XVJwiCQ2mpuQlfydsayAlqUtlZA88vNZWvlf0OOjxlOjCuVoz87n/zGdDbsIu2Wlk3yoy4fragtN1Uw+CCuX+Rg+toO7liJMQ/t01rDG85euXeO57jkrF9DxdazAjVw/+uOC+yvxUKjj58Fno+14Z2y2iJQgOrJ4mb/tUEuvO3SYTQCPwD8ncHbpo9NTCSaXYOL8XgfZ+J0NDCBuQZJYJ4Ji3EXIHbaIVmLxPLBU4DBw7F+u30cMwuzXkLZdsLCukrc5SU4LZ29S2ndV6fssiVJhH6GupKjmnesg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fyHDqg1kV5OcagIh8vEoV+LHXQfenx5sZzQbUycbg2GpKYjkI/VkXnVWz3Bn?=
 =?us-ascii?Q?XKaUyKoU2qPnDVhWyulRWDLlyvriL0h8ygaC2cMmf77f3vy4K/zPvYoqDtWh?=
 =?us-ascii?Q?sBTVCIQ9v+RZQYdLE0wcDekpPoVw445um+xJmgwXckD/oxPUoBjMVRpUZSY5?=
 =?us-ascii?Q?6mXjMMPGG61+S5B9Zwno1J2pTFrgbWxfdWCaYbU98obJiBPg7NCiCM+VnnrY?=
 =?us-ascii?Q?jvQU7dOF6HxLnYtIt8wfTYxXDRikfefVjKi1TqSI4lItfXTu/yAc7xVSPI9X?=
 =?us-ascii?Q?bjVr68QvyLOvrz/LfMCqx3m2nRkIc6B8LO6OPto5svXVMTHM99clr0xEYEts?=
 =?us-ascii?Q?KZ+akiTHXm/b7CzYxsfYK56aLyq8uK3bQkGKmF9sMkjbk/NJ8fxI9xWdBm4/?=
 =?us-ascii?Q?6zqn7KLF0lLDH3UEi3auW1MvVBgLLsQX9DrDeodVValLQawDMEC8u1nMbn3V?=
 =?us-ascii?Q?i4KPDugJ9AfdJ/2LL1DCSqENKnIhNSDjtDgtqoHBaOsNEQDeSxnRPVazEWtg?=
 =?us-ascii?Q?4oi9R40altg0l268pyrKfLOsjOiCvb6DC0cWVpygLXVCJnzeT8MXk0j1mRMw?=
 =?us-ascii?Q?CcyMJzHSqcCNzBGtW1VsKOVTgVrHDYa+irPi3hN/BgXjQYVfXVv1+uqkBeS0?=
 =?us-ascii?Q?rNH0PXVjEnOrwvJ8LRYTA+8Gz74m5g5X54XAojVz3XtrdeO+FTi0gT9+jD0f?=
 =?us-ascii?Q?Mv3gK21+/XB5iLNo3ZljUX9mPRfu9vFUmtUHz6DHodRB9JlVSplY7sg00gME?=
 =?us-ascii?Q?Aev1sPpiX+zWhmYAUO8KUZjl/nQ+AkS9682Utac3wTBtl+15mZ+Q43s2uQHL?=
 =?us-ascii?Q?qvjaFqxDWUDjJMo7zEd+rsQ9S3g9f/EHwNe+j3oZNgHCTpistnVLoIdpRY8s?=
 =?us-ascii?Q?hv/5fYVV8hUY/vlHNhkS8zCHJ8twAPWst1zKR3i3ujk5OkIfYB0jF6zqKtcp?=
 =?us-ascii?Q?o96u/EKVGmsI/06Tk9hM0KEuzf3SQg8i0VFOpI6IoysW3uHvSVOMjeN3T/x9?=
 =?us-ascii?Q?8CpUF1A+ie+B29rWHUkEMymGJV3lwKu4qb1gN+nHMNJ85HD4/N+5CXvsFqYF?=
 =?us-ascii?Q?M1S4KcK1qJkmWcGq9fpT8Gurh3S2dVWftpLWfCLwJvCgokmzQo+iO5ruGpBD?=
 =?us-ascii?Q?/5Sv2jlI6XA284+ChzrrnMLrQcfrwLgkYYyHRzJNoxPDq482r312tVBrZvb5?=
 =?us-ascii?Q?AocE6VTDv8j1m0Q28Y9CsL5tfWIJ8U36YPWVpiUYKP7EDbH0lEcIDD3TeHg8?=
 =?us-ascii?Q?CaXHl0xwYqMQCycp1yj5P28O6uHcMPrXPfr5GyIJV6jAZjZADKYUDN7ACzZz?=
 =?us-ascii?Q?e1jI7xUUcLoO4lHGu0p438ym?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7fe0fef-dae0-4fea-8aac-08d9572badd1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:56.2580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tD+3wlTr7sV4WqKFcesLOjz0AxjOghDUwG8qENb2sfQun38mceIJWIWaclBYjaxdMM9teHyMLSk64wHya8PW0Mdwgy2sdkpzCyIJS8mhZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Move part of bdrv_cbw_append() to new function cbw_open(). It's an
intermediate step for adding normal .bdrv_open() handler to the
filter. With this commit no logic is changed, but we have a function
which will be turned into .bdrv_open() handler in future commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 69 +++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index adbbc64aa9..a4fee645fd 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,6 +144,45 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
+static int cbw_init(BlockDriverState *top, BlockDriverState *source,
+                    BlockDriverState *target, bool compress, Error **errp)
+{
+    BDRVCopyBeforeWriteState *state = top->opaque;
+
+    top->total_sectors = source->total_sectors;
+    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
+            (BDRV_REQ_FUA & source->supported_write_flags);
+    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
+            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
+             source->supported_zero_flags);
+
+    bdrv_ref(target);
+    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
+                                      BDRV_CHILD_DATA, errp);
+    if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        return -EINVAL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
+        return -EINVAL;
+    }
+
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
+    if (!state->bcs) {
+        error_prepend(errp, "Cannot create block-copy-state: ");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 BlockDriver bdrv_cbw_filter = {
     .format_name = "copy-before-write",
     .instance_size = sizeof(BDRVCopyBeforeWriteState),
@@ -181,36 +220,10 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
         error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
-
     state = top->opaque;
-    top->total_sectors = source->total_sectors;
-    top->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
-            (BDRV_REQ_FUA & source->supported_write_flags);
-    top->supported_zero_flags = BDRV_REQ_WRITE_UNCHANGED |
-            ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
-             source->supported_zero_flags);
-
-    bdrv_ref(target);
-    state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
-                                      BDRV_CHILD_DATA, errp);
-    if (!state->target) {
-        error_prepend(errp, "Cannot attach target child: ");
-        goto fail;
-    }
 
-    bdrv_ref(source);
-    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
-                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                  errp);
-    if (!top->file) {
-        error_prepend(errp, "Cannot attach file child: ");
-        goto fail;
-    }
-
-    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
-                                      errp);
-    if (!state->bcs) {
-        error_prepend(errp, "Cannot create block-copy-state: ");
+    ret = cbw_init(top, source, target, compress, errp);
+    if (ret < 0) {
         goto fail;
     }
 
-- 
2.29.2


