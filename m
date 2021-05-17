Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E593824D8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 08:55:41 +0200 (CEST)
Received: from localhost ([::1]:53178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXAC-0002Al-GV
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 02:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX08-0003mm-Hv; Mon, 17 May 2021 02:45:17 -0400
Received: from mail-eopbgr10124.outbound.protection.outlook.com
 ([40.107.1.124]:1412 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1liX02-0001ta-3G; Mon, 17 May 2021 02:45:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLROZKGzoycEaek+V67wtflFEPsj+4Xc57bGgqljH3wD/Aks2uRc0J0Ob0GtORoSs0Xm+iQPeiuErUgtx+ZWKxroNk1ekqhVGR6X2dKOzFgvs9fd1gYU49xmjlDtQR5NwFqdmX7veFExkmkf+u+9zHkbN5E3o0jpsRlhnKgWttQ4lLy5Kxsc8iHofBiYkG95Ei9FwfuJkz3v9qrBalJKvP9W5nLrPu2RBOTT3jk5rPMmdz+3a5pCDppw0Jbhu5/uN+rsCw1EJQnjUC6YPkRU/SrbmYc2UqfRKjOM44YQveye8UsUz1zwco8EjW7FKzG7Nlz+6li9qIP80Z4sPqNkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfLJFkWiQWYGT/wsVzyWieZJbb6qjHcJA1KOMII7TU0=;
 b=Fl6oxFqkotq4+xyaNANO3+p39ha1AxCANo893dHqaAxJiVrYt6vJ95qxLr95ipHUQdmPwJoPb4IEraC0zD+pkiApLHUQYO5F5j9KoOLyWu3MY7IsaJtIItqxLpCC3eDj5BHjnhSL01u5OZM0SbpGH1By5VSpLdXRJbnuGh6dR7rbgW7PTVAsBnH7OT+s7liorKhXtQB/txz3+xmjr0SMfxZDlNG4YbulwN1c24z5PvFZZu9pzZLVoBWmoD/5AFSQsqJLZ1HTQXPBGShkgQGCrtceHeQHZ6HqhG9NhvmUqZIv1J0Ep4Pe6kG3HPTvaD+EV8QZWLR4qCoVb8fbnm/Iog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfLJFkWiQWYGT/wsVzyWieZJbb6qjHcJA1KOMII7TU0=;
 b=GdEc36uoSU33/+kpctrfmN/7wm2LVbhENvP93RnP+hGTYsHz9wPCr5JuxNbRjJWHuRoZo9t8bplANiVNp6uhe3kwJa4mdIDWRl8lF4MkWnfvWEnOX8IZjRdOMlc1HcTw6R7WhckihBkZkAL2LUoUd82qX9YpF3LQqNqJFGsqSVI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4341.eurprd08.prod.outlook.com (2603:10a6:20b:b9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 06:45:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 06:45:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org
Subject: [PATCH 12/21] block/copy-before-write: bdrv_cbw_append(): replace
 child at last
Date: Mon, 17 May 2021 09:44:19 +0300
Message-Id: <20210517064428.16223-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210517064428.16223-1-vsementsov@virtuozzo.com>
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.231]
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.231) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Mon, 17 May 2021 06:45:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13778ca8-2520-41f5-97e3-08d918ff4bbf
X-MS-TrafficTypeDiagnostic: AM6PR08MB4341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB43412AF4711954D0284EC5D8C12D9@AM6PR08MB4341.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /kBP0hRKCGx7TNW/YLc6pEyKmW8CkV8U16Qcad0j6CHw90NDVziXMF5e5lOlz3XwH1N1hXBCcHSLwlmJAC1YrLatDt31EGh6SyU0dl3oWJtdg3I76T2g4SKIvDMUZ1lot+0U6YPkoeUdqgHjoJUM6kKLQyxbiyAmQlKz2LzCT/PR1l/yaC3mvHsF2pd7DVslwWyZXL5rJJCa5BhmKauSOm0loZ23orKqVPm+KOlvtQEdxypskwR3EBXITNM4B3+EBJL7Df/R4eAchxf4srOycHjAHSyyX/MVlLv65tOPUl+6zS6BTdjU1gpnESLBVfxZ2Z0jVhUFeMtf+u5grXxKbytIV3aXRB2S3Gu20AEl5lxHxs/xpgpAXMZRopzdRfdkiwCrKyadw2eowWYQpXPIS4lW12dZ2Kn0QDlBM7gJ8i5FWtRZXsgzEVT5OtLH1QKifV1nhfOz94zjeL0szFOdIUEK410mQI0I5vj/PysoY57vWWIcmt3r5N8sxeNNWWZ2bOZ4/VQ4h/dlVYh0Y/JKWon7GY8tChUFBlZowD3XqVvgayYYRzcSc1F8Z5Jz4KFD7t/XTSn2IEgkrZfFHjVXK13WD1p7LNmTBHd+jY6qSuJ+vaeu2C+wXVXN4P82WVCpJfVLW+i1L1J5tytDPXILamCzLTpxvjYrL0aG1z7AIhLi9z0J9NkfHk039KqjTXbm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39840400004)(366004)(1076003)(8936002)(316002)(107886003)(4326008)(6916009)(6506007)(38100700002)(26005)(8676002)(5660300002)(86362001)(38350700002)(186003)(7416002)(2616005)(6666004)(16526019)(66476007)(66556008)(2906002)(36756003)(6512007)(6486002)(956004)(66946007)(52116002)(83380400001)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UIW/whtwJ+z8Wq763/ZlZlzezyaDbDGDo4UuRXIAB6YKbUxMVZsFqoi1E9rv?=
 =?us-ascii?Q?rUWgpLxUpGXcHWg/tg9+EexpbtK3ZZ48i2w+disArLV7BcxI7BBsbfamENvV?=
 =?us-ascii?Q?MxM8dV++yr7OH/Hhb7jKlNdG4TOPwYBzTm0IxDifJCOKstym3mEhMHPZE+4I?=
 =?us-ascii?Q?wr7mKklVl72xZLGxHUMdv39Zod2Hs1xXSgbXw8Sa089v6m4u0Y1XYWZbwIrJ?=
 =?us-ascii?Q?Db8zADA2Hmi3CiyOL8AS16XUXS7yxG+2ukzy4N4xSixctrE+UGpXJux732Uf?=
 =?us-ascii?Q?0aD3rnytVlgjQKaGNfIiv+PqDPPEAoMSiNS3hJabzYMLOpGlmmRvMyvOVt2W?=
 =?us-ascii?Q?LWSSzCCgQwbRsSkRpqlo8btheTsFfPABvFp00Bm1qa6CvzNaxvfEWGbxHr9h?=
 =?us-ascii?Q?n8NPS/ugSZykuQSDbo9HreMaSBmxvbxsnT8AQPx9OaNvGxgGgUAm7YNCBXgP?=
 =?us-ascii?Q?RZvBrQgBsa+CAUi37JuEHRnH1mwbobRKE/2o38Rl47SQUv+knZpnT5QsKTV8?=
 =?us-ascii?Q?K8t5n25yrU1OIH00cGCuQoOqb7+gf/ecE5yNa/8FZ/92eMC8VxD63FT0nm95?=
 =?us-ascii?Q?7VKZ4hlZtVLJFvJlGfmk5E9GloAac+m+i/IhlVomOOMH0wVBMFEVawZQ/SvU?=
 =?us-ascii?Q?U93Etxh0I8uavRo19DLtiYgKJUiajQMDihwplZX6RwdAfaODGfFe3xbrJ/J8?=
 =?us-ascii?Q?oRxh4bTs1d1AIY+eGL+L12IziyfjYh/6k9yIfG1Ru+h7ykjs1E1SvzcZA1Q8?=
 =?us-ascii?Q?3nj4z1d5CvshYdX+eODgY2cXEjR2iIuAoUaU3+y+cQp9svj9B5lHPrjNzxph?=
 =?us-ascii?Q?DPW0dcMB2aifyZuV+8jA7OZKl68XjFnSgFqdwMKlfi8ve5IPrU6jl7oxJ4X5?=
 =?us-ascii?Q?OsxWo8JU4Cdg4ErdvsVYgyI146oKSlFCgI+Yp4IyVYwHw8z6uN/sD0tIdz5j?=
 =?us-ascii?Q?6xzGHs4xHuLj+NK2KYMzLpo18+doGlZj/BUA3WZv/FSgySMu63gs6u+Y4QlA?=
 =?us-ascii?Q?E1Q1OcVTLdaps5W4PFywjMF7IYE6yc6NImdPbVCMFpY+nCR10fgeddKKVodm?=
 =?us-ascii?Q?GvhqHerexIgiJVfKa2Ocw+Lj88sdZBliWgQ/bNUcpcaf2//hN2m//iT/zlNm?=
 =?us-ascii?Q?E+rwJ3W8Lo/dwks9KO+1a7GZIQXWABz7hQsyeNQ4yfD8XI0RwMsl4ep8Whvn?=
 =?us-ascii?Q?PzCNnDmImCz5zp+5lWJ8KU0d5SZuMRzHYtVvvu5EcXfWGpwvDZpSvLV4Jd9t?=
 =?us-ascii?Q?MinSOfwM99KoTAN0SFmQMr8CozW+l8RNk0w2CE0oAAsgruQ4CLmYtNuTsJ5m?=
 =?us-ascii?Q?e2Ah0HCUU3KHn0SVRx8uGtyJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13778ca8-2520-41f5-97e3-08d918ff4bbf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 06:45:01.8092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsnmYMWK+fCGdrg49BzOEiEwIuCwwdOLgdqCHml4Bc2BYih/kj5EW5VksX7CqIJD+cXdOecsnM6uxUN/d/H4viwBOLwX5JcI5qPoxLuICVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4341
Received-SPF: pass client-ip=40.107.1.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Refactor the function to replace child at last. Thus we don't need to
revert it and code is simplified.

block-copy state initilization being done before replacing the child
doesn't need any drained section.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 2f06a524b8..35a9aa163d 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -172,7 +172,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
-    bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -197,8 +196,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     if (!state->target) {
         error_prepend(errp, "Cannot attach target child: ");
         bdrv_unref(target);
-        bdrv_unref(top);
-        return NULL;
+        goto fail;
     }
 
     bdrv_ref(source);
@@ -208,18 +206,8 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     if (!top->file) {
         error_prepend(errp, "Cannot attach file child: ");
         bdrv_unref(source);
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
@@ -227,21 +215,22 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
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


