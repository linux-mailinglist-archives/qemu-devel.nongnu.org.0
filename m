Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC83978AD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 19:06:05 +0200 (CEST)
Received: from localhost ([::1]:36306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo7q8-0007Oo-9r
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 13:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bp-0002U3-Lx; Tue, 01 Jun 2021 12:51:17 -0400
Received: from mail-eopbgr150112.outbound.protection.outlook.com
 ([40.107.15.112]:35829 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lo7bn-0002O8-Nv; Tue, 01 Jun 2021 12:51:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4SnlhoTnKNVj5tLgxpwXX2W7F/6E1U3UMvIVYTmr1FNWwD5QPxsDzdmuLryk/fRAa3uEESCQf1p7fTjdLBz4NGIAgfamaE1DLH+fwQMD4h0DKVUEiHEGabOdLwnIcYykh/DYqGGWFQxj+WT7/Zjo/Olm1AAX4FdL3hL8+RgFnTbePM3FExRiBFBIdP7Dc93XzxVow4g+uw9EK6vrn7HoEL/YOoJG0XpLlCq5QhIQg2tSN3uEbZaz/Lb7IocU7QGUE/qFBNX4SsH2upiu/iNAO5VMJkc8N0BgfmnKX6xbCIco5P62i+ZQTPMs2RmNIsXudJNWGoLnL7YTdNFdbX0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=QOVjUEYtPYBqWkbYS+u2hdo0ZNPrnJGVicyshHrTys2+3duZEpPUGlrWHKyOQCaAY6QnideBY0O9kYBbfqd2wy/HGZke9WqajDH5zXcyeCd25NP0QCuj5KRn0J4gVfXsMxJEZtSNptr16Lqp5rvXRCvzKqKGEuejxOPUdjjNNL8uQQSSD3KwG/ujcJ2mpBOlx3mM6Cp81LVF9I2Ju61IJDUUb2yBnAPy/sNoO8ijrOMSPYAJuinruvH4UHMOVO4Nm1CdQ9xEXJnpIn857Vs6fPY1ZXApm8W1Ao+XabYdVjmfxMCGbYVHDLRKQiMO2LEoFNFw8z/qGU9oqUO5SOW27g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=H13pHXZgwo9SRQD62Bznh2pYTEYrWPT9je6cXKBeBlP0wdqR3WWOrlsyZWO1JlcNMlTaK1vPrUA2SJeq+RVIO20eiQg7GMNDGmL4nQtptrXm6c1+V5zlBIyGKytNfH6a/HaoxbacxyDVS5JrhyPg4KTGjERWy0q1nQRMnCZw83E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 16:51:03 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 16:51:03 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 15/35] block/copy-before-write: bdrv_cbw_append(): replace
 child at last
Date: Tue,  1 Jun 2021 19:50:06 +0300
Message-Id: <20210601165026.326877-16-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 16:51:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c07c2fae-13bc-4546-de76-08d9251d7108
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1972B497A4D81BE965567DF5C13E9@AM5PR0801MB1972.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Bze0s42vt/xIMN9bG8VExeR44J9Gxvz+nVAVHLd0qqnJ0ZBX+Wp5TGTBWNa/05ciVQFWZFQzvfofW9ZDjpq11FgXhQg8ZEnATOl60LWo1/xPijfCjVUoQlsjvJq3DrzOjCmVObOQn7fnsMdIU17kbXDyJMFAdUgrqBtGULpCsmZLZHjGWFJCuDCiSKFmOVsylqgOoxItuQysSOYSAE1C8FMWOEJH9R4c7uwBdgZufCYYpz1jcggeoIy0c2iFYfKnLb36ANIresw/yju/4He98tzLvuKKLbaXe8B3Svj+WMM93/aJ0EaJwgREXT/Vj1VTsOIscFLGclwFObWHMUfV05tMo21zGSci4IcdH2kIjzxnDdgYqjZMbdFd/Mu2hgHKoR3Jc73t+doCecMq1oRbpvhCCm3l0tU1Ra0PpfYyw3fBbRqQwnGtkwI+/3b51iEM7LxEast5pkQY8JmcWMKgONgd4jgfGgQ8WF3HItwmW1uFtoh5s4kGwLgQOiAAkI/X4KZ/SkapeZETiBfMWm3g8XMsjin1bIJ9LMKOdGelBhVMse798+oxIFX3vqNZGOJYrXahjz/wLSgHd2bPPBn4yBALGZ03xNn/Bbaj9VqUg875F+JcZ5ZOVIfw18Pxfz3K+3LATc+CyN0iOy+SVh3Zz5HP3gbcGyGj24FPvNwfMrZxFRfoOpPbeHfVHyDNccO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39840400004)(346002)(52116002)(5660300002)(2906002)(478600001)(26005)(6916009)(1076003)(8936002)(2616005)(6486002)(38100700002)(4326008)(16526019)(186003)(38350700002)(316002)(83380400001)(956004)(66556008)(86362001)(66476007)(66946007)(36756003)(6512007)(8676002)(7416002)(6506007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JxucZ7cZniPThokChKZl4UGvOzsGLjCcPkEbukT4FMyRODO9+i3cUW9aPACC?=
 =?us-ascii?Q?Wm0cVXBJt40cborg6Pfu04ebFXZB9uRYkORS3tzpRq5IlW+O9eKMN1YUxfOq?=
 =?us-ascii?Q?VxHCOCkq+p67pq4lW33jrSKeAqnQlt60WxGcILIvwHxjE/+63pXNahiv83/g?=
 =?us-ascii?Q?/SzLYVe6pYL9TTR7GqVNBTQx2jYd/jvsnZi58vB3uLS30mQFfFoMYHzuJvOZ?=
 =?us-ascii?Q?MPyi0lvPaaqcnXUClEbBcMLJbsw5YE9FHZ6TFJNDGo9h3/08CCGykaRGiMLJ?=
 =?us-ascii?Q?a7kvXZtURZr1q3YseDXUeQY6Nr2ajJf4GbTQg9mQeWD/ZCgnakEca8DPJpd3?=
 =?us-ascii?Q?ndaWnNead2vQvQR+0oAAiuGrXD1CRQlPJMbddGbUfOms5nSimHHzkIrP9UEa?=
 =?us-ascii?Q?BU4Nnf3Pk/8OGBdcQ3P6Gzp/BY3teQUooJI5hJEoWTzdbpJ3XL6gj+SiZjEK?=
 =?us-ascii?Q?4aUWaj0+vVWoKH/zEeuk8Z8r1zULSRPjTcAMtzKKfvYy5cH4j5S6pe8pvW6f?=
 =?us-ascii?Q?k+MtDYnwh/Sr+691GN0ffH5WXRaRSDNxGArI0d64U03t0QAOCHzuU+M6qeZs?=
 =?us-ascii?Q?WjjU21idkcUzBWyxeoV8FYtrpjuIodgO0Cfl8nYA80UzpaLeRSygxSzZ7ekH?=
 =?us-ascii?Q?M/KJqZmC3XFN4V3DgPLrBgdDjg46QB7itvYa1hDA0fsuXGA0o8tBeOPJON/j?=
 =?us-ascii?Q?emOlxXTwOA1bi2jq8FA5plRahXIZlMMkHXLa9FSgyOoyB7u6q6CqzyF3LTLW?=
 =?us-ascii?Q?6poXWGbEyVooBZsikq8g45+KcmchY09XnUPJVlDrgKG2BpKkFI1leZJXf8xU?=
 =?us-ascii?Q?4VQYxlROFdQXOUwuBPojKfbgTB1yyAnKZWpBVAUByjtUWYZAFHl59JXbicNX?=
 =?us-ascii?Q?oBpB+nke1hoCeecw0ETxjZHZqRE5IbFvdFF0nmlYDEYwlTouUH8Zc3pMjSfc?=
 =?us-ascii?Q?1eyz6MAP9ukFsvX6rZxvm++cIVMcxJeNvti8gQ+1l9xFA4r9dEGSGfE2mdck?=
 =?us-ascii?Q?S9QYGDFkguka9ooMvyl77rq8YclIb0basBR/+VnoHYpYfi4ueyaAqbxPPn1x?=
 =?us-ascii?Q?lxF/edx67X9WM/uOLm58wtpZ9df/0abrj9Qx9NNodF/Pv6YyAGKYKyjuizt6?=
 =?us-ascii?Q?fH4SiYCQ3egCZWBueFy5UvY2sJ67viZevwVqegUEx1NT2lVLTyHHDtukf2l9?=
 =?us-ascii?Q?tksNk+2ujlKcUfT2FdJmxGExufltFuBcugiWRIJ9XoCn8Q0xmRTMqgWPGmFH?=
 =?us-ascii?Q?4VVdkYrqwoAVk7ZJ/QCxjUfAgUOnHQzk009T/93CwxKIJjsrN871vs2p46rN?=
 =?us-ascii?Q?8bNbpxp2ZRARgUW0z15U1kDL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c07c2fae-13bc-4546-de76-08d9251d7108
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 16:51:03.1586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXFhZ8kdbQodsuUyAUNklZbmiUjKNdJqTcHGRdhgeOGQHgRdLjFXQbjch9m+nWjrBakejus6urFqNNp5o0MEA2rPRoVUmGHmNHU93vbrwnE=
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

Refactor the function to replace child at last. Thus we don't need to
revert it and code is simplified.

block-copy state initialization being done before replacing the child
doesn't need any drained section.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 7a6c15f141..adbbc64aa9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -172,7 +172,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
-    bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -196,8 +195,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
         error_prepend(errp, "Cannot attach target child: ");
-        bdrv_unref(top);
-        return NULL;
+        goto fail;
     }
 
     bdrv_ref(source);
@@ -206,18 +204,8 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   errp);
     if (!top->file) {
         error_prepend(errp, "Cannot attach file child: ");
-        bdrv_unref(top);
-        return NULL;
-    }
-
-    bdrv_drained_begin(source);
-
-    ret = bdrv_replace_node(source, top, errp);
-    if (ret < 0) {
-        error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
-    appended = true;
 
     state->bcs = block_copy_state_new(top->file, state->target, false, compress,
                                       errp);
@@ -225,21 +213,22 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
     }
-    *bcs = state->bcs;
 
+    bdrv_drained_begin(source);
+    ret = bdrv_replace_node(source, top, errp);
     bdrv_drained_end(source);
+    if (ret < 0) {
+        error_prepend(errp, "Cannot append copy-before-write filter: ");
+        goto fail;
+    }
+
+    *bcs = state->bcs;
 
     return top;
 
 fail:
-    if (appended) {
-        bdrv_cbw_drop(top);
-    } else {
-        bdrv_unref(top);
-    }
-
-    bdrv_drained_end(source);
-
+    block_copy_state_free(state->bcs);
+    bdrv_unref(top);
     return NULL;
 }
 
-- 
2.29.2


