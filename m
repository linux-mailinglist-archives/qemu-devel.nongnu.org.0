Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F13F5A31
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:52:16 +0200 (CEST)
Received: from localhost ([::1]:33648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISAI-00054w-VY
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:52:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyL-0002lg-0b; Tue, 24 Aug 2021 04:39:53 -0400
Received: from mail-eopbgr50092.outbound.protection.outlook.com
 ([40.107.5.92]:39447 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRyH-0007cr-E3; Tue, 24 Aug 2021 04:39:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eeg4laHNdiUsqaPd+74ab6OYfcIEWFyC2VZz/hZHuUUL6/GlumyeYwdYMPP6eQQz3holb36yHfombF66lzXUYL0/0UktUAbkdDIiNRXoCOChNGCUFBrY7IiDuRc5TXveKuK87vj+C7f5udZfsj9/KgO45t+PKnZlD8sivMLNf+6Y2Twf52fg+2F97R8mW1iC5hnV9OTPLacTcRRJQPbzShDtMku7AszvHYhJl0ddoOf+NysczTFd1j5p9AyEq/4ZizNPUiMvIs+SxpaOYyMnRAi9Pe/KOaFKRb19bOprfbHKYzwfUluu7llzp0N2fk4pfQMXJjOW1Hfs5TzO8+eRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=Y66j9xu5dzCVXGYJfEhMpOdmJn7xtKsHQPr1ArWWTF2sgm2dGjjzlbAC6iaELjpCA2FJ0IKcr483YKjBVIZKswebKFwoN1o8MPJ2isad8L96eGM/l3ajaJQoJk6IPIerUibW9mecxKAaGlAC34kH9jiIQT9A2YWyUg16f8zMlGPWvkGbY7cyZjKpg1ndmFPi3TGRoMvGdWOOhJ+dxMd/SfcbKUp5tHJDBW65WWF+JtNIAg+vNHeVAgQebNOH+b8pDGNkXEKiMF01amwRgc0vJT8IIWAMK/ngYeqlQ1FMRGdyEnJRvS5X4OE9CGX7pcCCv5IvmrP/jRjuEZVr/tMw0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CxcOwZdKNFNzBx0wXYgJ5RkseoqLR9SUNfi8XYqszo=;
 b=NeRyf1q932WBtlMT+CAgNarTlsJijm3Fomf6QqxBXnlAoN2ryVYS4uZSixILRHfTvQCuKfh+GsgnHf+TJKa9iTgHIC4klgHNwzo3Ipz0ZnJ9bfB1xrttetQS4gKvP+toSBgLjiy0KTEOYIUhS6Xdxlm79et7qiu0jdVLxusluAs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5333.eurprd08.prod.outlook.com (2603:10a6:20b:104::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, Max Reitz <mreitz@redhat.com>
Subject: [PATCH v8 14/34] block/copy-before-write: introduce cbw_init()
Date: Tue, 24 Aug 2021 11:38:36 +0300
Message-Id: <20210824083856.17408-15-vsementsov@virtuozzo.com>
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
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95d70fdc-e7c1-473f-cab8-08d966dab491
X-MS-TrafficTypeDiagnostic: AM7PR08MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53333BCF61724537B041CA99C1C59@AM7PR08MB5333.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y7RoUbhPwaOYH7LBRBmfT5naJkT5nhnM6YC7sLUfqolPMpcGwgz1f12AdbPAzXnhlR+z5rZtEENnsZPqeaLJxt3r9Vxnnb2msHD4d6C/7QuvNw7iMNbF0yrx8MbOyCG1KgO167T7WzB9YODX9CRhaTxvrCiWPbXouwy4A3hx8C77Aepth2WAAXosxZLCcJ7cjOQ8Tzy5D1mhIotLaubbaYBV+UCmoT6mFrEHMy9s2ETJTd6QAcYJK0tPqqfPKj7OkaV9mte9wJmfZ1lgTHIIsl/NFvIxaHF0YYFZkZIzm2+sCc9wG/z8bdauZKNdCkBLyLpq+V13oM/TPLdl0lDU9irD/YNflnEEugYpuqBNBejHSp7ha2Vp9uSqA9C2PJZyAlQKoGr3gBMTJlmRJdIvsxcXTlphOo9+IJzKJljRzF/NhjlMPI+5VL9EG2hTW4w7enoWA75ebaqhwQfl26HtaUziZrfZ3LnRRLIU/UyiwzH8JsVZnjiUCYl6oVOWM4Vk394BB3zm/ogKodJQnvJfHlmta8tML+dIrQ3/6fDf613Z2PVFJJBjqSRuD/1xR6dIQVuITR4UMN/eUBhkKJI6P0E/CBboO4oBtEF1gdR0ooNCx/98vm0+X4RABH9T5Pe3vWEk2eyRL0xw5oSIU+axoOVzDkjFukBGxcszrdDqw50e5WpFTLL/gPYHyK03DRP5HXjKUncKT35IpKMHWgCOqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(346002)(396003)(366004)(376002)(38100700002)(8676002)(4326008)(86362001)(52116002)(38350700002)(83380400001)(7416002)(8936002)(6916009)(5660300002)(478600001)(26005)(1076003)(6506007)(6512007)(186003)(2616005)(66556008)(36756003)(66476007)(66946007)(956004)(316002)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZYFF1wXXAmEuX8BEjFkSEmBVPZpifa2tV5suHJRojDwsD1UpPVC2fb6dNHvb?=
 =?us-ascii?Q?wytze9k7T+uuJvvZSfcnwP9Mc5vi1Be2V3utn+4W31P0hpwuRGsXJrVppREy?=
 =?us-ascii?Q?Qlw/m7td6cBepiSbluTQYUg5Lcl7D2b3VKv+X4j6D/uYubpa1PrN5hOAI/3m?=
 =?us-ascii?Q?EOUR1V+W2XRHMDJHCqpORAN1QLv9I5w70bcmCN6dCA5zlJaJEyS/D/1APV70?=
 =?us-ascii?Q?Xi+X0H/5+IU7WgCp03x0xHWp7fhrZ+NM6zgvCEGKsLPRlCkjbB9zhe4+YI1C?=
 =?us-ascii?Q?7tHvzBjIHNoW8pYJUl2rt5G3Wr+gnz1os58A308+MxD1YzmUPfE4ZMb4er9V?=
 =?us-ascii?Q?unKiTnuzhhbMClBgg2oYb5CGKhvUyts5w7ox0OwqZpNfm2xbLWNfiYZHsYP1?=
 =?us-ascii?Q?7uMTk3JYSgGqaCpXENULCz6j1IVxtof3AJoC3CXrrwMyCRO+k2MvrOdPVIQt?=
 =?us-ascii?Q?aCH2fO25WHXsR2W7zlh2J0TuIZrB44yZ+1k41oVgoYCcK70SJ2vZdhLOjpzP?=
 =?us-ascii?Q?eCM1wKUEi78k5537JrrCT/Qf1EhP1DJSi7wdBZVMCg2xNxVCJBxOZGCa5/fH?=
 =?us-ascii?Q?b6G5COFv0/+zzNRsXcSd9/NHG0Y4NWIfkLUy7GwZTWPAKJ5lPb5aWvNhAbqe?=
 =?us-ascii?Q?sa96i6jq6186x0bdRUo256T3MH9SDRYFUhN+nt4MuAQqwH+U1MMQwHbzl8rc?=
 =?us-ascii?Q?Rz995oSrqnRSx+G/NclJTKVvhrRfNFhNOy2L6SH0JDQfJdsliiKW8YhivUg/?=
 =?us-ascii?Q?ZuFRbnvvt9RTozAAiYftmRNeCXKcSWB0lYiQ+MVHdkgGXe4+0B/P4ie0aOnn?=
 =?us-ascii?Q?3ynBqCAaICk4xUA8pMfcWh00xWN+/GogNhoPIAziWQVtRwPtlExKr6VGljE8?=
 =?us-ascii?Q?+BK4QcdnwS5rKFPbmu5rUq1VWGTS+Sobt75OXZVSLQEYBjH306DXQLSG4Jlb?=
 =?us-ascii?Q?HExnWI7n010eS7rMsSfQuwsusSB+W1BvpPDQ0R/q1eFPlHOqeXCH+iQHoMAY?=
 =?us-ascii?Q?ZVWmHgvNru7UuUVReqBhGRxu67i1yTdY6vgODEjrcotM3DQ1ZAsp5yn+4vDy?=
 =?us-ascii?Q?n4oJXRHvHNcNlgFw6/w2DokK3guQ+/pAwymROgrvLbTgDwHgKABkkO387vQz?=
 =?us-ascii?Q?bt81KmdEu9yRZePQgm4X0Ufh6vx94i8ihg4TYDGOJQdxIPpLr3MkvXVrPk5a?=
 =?us-ascii?Q?qFGLHGLmnDmqMV9cSUjiwX+ntGkwbJdYeAf0Y9Eu0zNd0+E8galcZdhVLwYD?=
 =?us-ascii?Q?89jdznPnKc/3dqulW83nT2yb0MVJqw2kQfSatF6oOc9qWIC+3scLyw1O/GWE?=
 =?us-ascii?Q?+3+98zV+wqqXiaWaAAD8ANfX?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d70fdc-e7c1-473f-cab8-08d966dab491
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:36.9237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkmtqbDOS5MVfzEwPWK32cOAvT7kNz3uO+4PsWH30ya8kMbXAVMFwcTyrN/vfSnBF3+kD/JrONLrALhK72z3txf8+gdOZzK+32qEt4PkxfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5333
Received-SPF: pass client-ip=40.107.5.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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


