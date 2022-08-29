Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066F5A4744
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 12:34:21 +0200 (CEST)
Received: from localhost ([::1]:37402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSc60-00042V-0C
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 06:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblU-0001Am-4U; Mon, 29 Aug 2022 06:13:08 -0400
Received: from mail-eopbgr70135.outbound.protection.outlook.com
 ([40.107.7.135]:32646 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSblS-00066Q-9Y; Mon, 29 Aug 2022 06:13:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhQLX60CDGHU4P+uujYkchnmcrUkdOCrixhva/2N4Kw6uBYfCoNih4mdrKL6nx/gEDMqbsSDmuKBPPEt/kNUscowe6rFjfIB2rXROhiBueza5J5CPbbUhdkSZV3I1EyrvKRQBS6WM7UyZWUZgs5UdtlyrzE+0uyd/dBFGveM4oKOfyfLa85inFYxXvSxzxhmd/q471psFClNQW70keDBgBROlLy0McYOkmWmuzqCsgey2CKfU0lxUisCwXUJvTmtizh4Y1qwF1mYjpMhMqWUAhwNIt8vpLNRsKQVC8rcpqGTcMoG5EBHmNOstYUnATcYPnnOcLJHWeDlrTdtic83rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHAtEScGJd+8SaeeRRtxf4JjrblIDlJicxwATC0GIGY=;
 b=EEL1BxxpvSrjwjViQ0OlAngOzQKYBAd20ECaLwlsBEphDMQoKEDYHcLRKHsqG9w0KN2SLmIsFzKUhptj7A7+Meo5WVNKG9o/UGonXTfEDJMdEYM8ks9ipqOYjsEP/Zap4aRl/XmuARYxZa2QkrayYK0clV0H8vP5ntfnxPYw3kRc5z5x0i9L/AblHR+M74MI2/aDo/ukoijuGQYLQ1eyMZDLLlCv0Bipm9R2F2WKiRQ0erzjF7eJz3C8JeKAQeV+0gQ58BA58CqaLx2x7K3yxlhC9SokR0mQKw1V74Yy9LDqtJZDqm5za3D9W0VPWNTQlSrisLoyvfeRYfUArUlx4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHAtEScGJd+8SaeeRRtxf4JjrblIDlJicxwATC0GIGY=;
 b=lXNyPifjxOXHMGFQByUGNRfBd6jn81eOAstFU7fBEOXqEDt04NTx2NtTsto/W1Dov9SH8/cTgf+eq2wv7rRWM60+/dYVaXpadct10pLgh9iiXLB5brm7Drdrro+GLX+G0z0F09dv1AlW5QQ96MP7YYretSz1V6hXhcx8CCVzpyJU5Tihk8kLhkijQbdAZ2lnlgJ9UTBqNshf1FkEeCEjm9hmvOSVUkge5qfHQFQ3dunP6ZyBNx0aCCzX7pnzsMaRzYg33hmmBHBQMxzLwHiKI6f7yps8boGq/VYjWAD+c352DDuVVqOylAjq21qpIhFDgeJQd770SX1kmt2EoPu75A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB4725.eurprd08.prod.outlook.com (2603:10a6:10:f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 10:12:58 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 10:12:58 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 06/10] parallels: Move check of unclean image to a separate
 function
Date: Mon, 29 Aug 2022 12:12:41 +0200
Message-Id: <20220829101246.343507-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
References: <20220829101246.343507-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a3a4fdf-c947-48b0-2ed1-08da89a70baf
X-MS-TrafficTypeDiagnostic: DBBPR08MB4725:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BhD84fsywEa1nH0zha0dbxU3PaRP9grN+9+U+sk33hKPb1sNleBty8jsoNRIhlgFBNw5t9VX1O41ho9kcXcServxJ+KTNfW1wxMbiYcj2FD3K3TXuu9Rg++vPJLsaV7p7EC87WmGmMMsKsCp1eew9ic1F031UjzGtL6gnQiEBOFHyxK1kqa7/HLgIsVY1X0BRerAWHUvYa33BI6D6z3b/i82RRaZzOZFL5BUOx4KqvkiyvZzpqFRBrcOn0quP8Rhbhgefvp1b6qdwt2+Ta6jdGteLjsJ12GWdlGnfaGvPdhtGvuq1uMyQRCsM0x0ThBYTgHffVpHl+TJMrEKs2HBzZOmRFEd5dSw5RqPk94Jy4JCkMRSHOqOTQicQnZj6DjsYPQvrzp24eTiCiXtx18GMZ1x4nI0aU7++XdDPX0TWrrQtFfyieGQH9K0FVK8F1pqofVDIyHQ09qUS6XvWnZ9kRNA/RHMq2/7XcGWSPonhca0d2vD0uFXjgNlF5iAvGrsv+RJm0cAyhfPleNeHWebtAHG7tlH3MH9nVwUS1ujvJYzrFnNG7/RrWH6Qq7XtEJan2uDvCvw4b5fd88ozYCVXyWRCXAEbr8xGhlF0VohFX7u/0LbxQeSv2+x6BjTeS7pYjhXvjxuhZ0fNq1B+TO9X2sVStxeJdVkhPsMGDcMaefVMlGlw0om7Vu1fbxsTWLz2MB4Wtu9iwBT4cANimKsK+6QKtmsrdTQfwRS5hOnM/wnvNd0CnuYdfUUyAHSIDu/KgiuH6EdJ9MOaVzJUbrHuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(376002)(396003)(366004)(136003)(2616005)(316002)(1076003)(36756003)(38350700002)(186003)(38100700002)(86362001)(6916009)(52116002)(83380400001)(2906002)(478600001)(41300700001)(6486002)(66946007)(66556008)(8676002)(4326008)(66476007)(44832011)(6666004)(6512007)(6506007)(5660300002)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cqZbCMGCFP75+lRoFa/S3tN3R22isQ+4ST50mGRW4fKYHVxnvhtwec6l7O1s?=
 =?us-ascii?Q?x2BKg6fou7uxuiehyeGLLkcFBL2NxjVp0xmg0/qNohf8gB/erQKMQwvbbTMk?=
 =?us-ascii?Q?JtTlpqBX0DXSDuH3J9yKhUJc8yc9tyyGvEhef90ZpTPNyEbqEhMnZBm+vzgi?=
 =?us-ascii?Q?5CO8eMSJLHxkdS0xcVk2epPOdGdYQ+w2oJ0KYMAA8Y+eVA5QuAPpd5GWoi1L?=
 =?us-ascii?Q?/FcAPguwGYFm2IGOhQa6nYabnnlHl4fM6dYLhStwm9El++YQmI4pG+7lLrKf?=
 =?us-ascii?Q?17rFpMdVC6wd0phF1+SA8LOoOvU0VL7G69THJDcPHyItFfWOqMHtf/FcO+kB?=
 =?us-ascii?Q?/ebkhYddZgmdT6TgklI22g9Db/2XmlBeClFTJyxKIt0I+jVJlCnKp0XeEEEA?=
 =?us-ascii?Q?tTUUs8KdvUcCOeYUou/bh8Ev9RZlxqlsab0VQ7d+cvDDTolKHuIVSN5ofG6G?=
 =?us-ascii?Q?9OUlgfp/Dw1+zaRankJ2W0OOGMv6XaJPQDNCZeHrW0MlpmByLCjIjVQAlkZf?=
 =?us-ascii?Q?cRJwHnk8bf1dJNu5rX0LzZ0Kck/K52a7vnb48TpdSYdIDIkVtCyzJtMYIiTz?=
 =?us-ascii?Q?X9PraZm8f8tuyslj92bOmYCEFGfjXmn+VUSJpTuarGOazW6uDIDuo+H6Pu+G?=
 =?us-ascii?Q?w9hHp5l7NaPo9pI7bdp+BexlTCPLtlM5T9vp3uJVTAvXHraLy2raT3W1V+cS?=
 =?us-ascii?Q?82UF7cF+ACQhRGeaQLI8k8Lny/m77osxUPUFd6EA18/Q4GChicTM/bCb/1e9?=
 =?us-ascii?Q?pHKzUptQooukueiKx7iPCn0oG4aQ7zcJLrFjiM8jKEh/jkFRbFaSU7vKI16R?=
 =?us-ascii?Q?WNzdY4hqycER0dapK5fA3EryUWRNrfqTtlA0whDh/oz+S1TR3oBf1LHYvcV8?=
 =?us-ascii?Q?/3hVcrmpIOGfVB7QxCBww06h1cvG+mvdlzOhV+RN76nXyIoBcVWzZ+ozuiA2?=
 =?us-ascii?Q?960vtz6FJwZ6y2QTPffBvFQl5Br49zcul6gHRQt012U8huXUlvRBmClozNDN?=
 =?us-ascii?Q?yDhqbn5C6bxyjnumGakE7A3swq6L2cfhRwO17xRkNJQGurU+DZMwOUJ0iyra?=
 =?us-ascii?Q?bBpxloq/uKC7529DSeCn3MweqcSNZEu8s4BovNvYNjipf7PE22h1jPTWo/Y3?=
 =?us-ascii?Q?rle+etVbDDpOfldWVeWo+iP+0hSEijAHGuBdqoW/K1fG1yvXGabYXftmRiqg?=
 =?us-ascii?Q?ChKGQtIJiFRGDUsD2Wu4OceXXCYZbMkwNf96pLjEuw162eL9JMgfgdUqIIuF?=
 =?us-ascii?Q?7K31CrNQAQYpMFxrr8fCzEsukamYoCrBS4xb/iCRBaN2PXg2PWLOEy3+fPee?=
 =?us-ascii?Q?941pasaoNZlFWBM6/T9am2d+vuapmzZXnGdwHwXvkwWO06J3r5kSNdp0s1pX?=
 =?us-ascii?Q?UZqZc2bs7YyPecyTWXpCWxkcLrHTyd4EUFV8ySBEk+2McOoyGSbJ98sa5jUF?=
 =?us-ascii?Q?7f6Bs0aCJ6darKNuCJ+KeAzhoRQh77tiBI7dgh5jrGbO9toFy/dNTyBLMT47?=
 =?us-ascii?Q?JZfM953XZ9UT/mYcfo6BT5Tn+EUMdvY0d8Iep3l7651qJzVzV6cDcc7ZAYyW?=
 =?us-ascii?Q?MI28LxL2Zf/TsLZEhQTD6E5U/NRxCOaeElxAwQsr0AdggsN0jYvpeu+jlYaK?=
 =?us-ascii?Q?IL4/wpWtaWxXFqMzFtbvB9g=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3a4fdf-c947-48b0-2ed1-08da89a70baf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 10:12:57.6482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWLE176YEz7Rq/ilKa+7fMtYpuvLFDReVErvgNaWAe0qrOo8eSqvPOF5xaWWltEAzYMDqYT6w2ip3h7LrayVuow6C2oX77LUm9CwmIyhtAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4725
Received-SPF: pass client-ip=40.107.7.135;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index b4a85b8aa7..eea318f809 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -418,6 +418,25 @@ static coroutine_fn int parallels_co_readv(BlockDriverState *bs,
     return ret;
 }
 
+static void parallels_check_unclean(BlockDriverState *bs,
+                                    BdrvCheckResult *res,
+                                    BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+
+    if (!s->header_unclean) {
+        return;
+    }
+
+    fprintf(stderr, "%s image was not closed correctly\n",
+            fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
+    res->corruptions++;
+    if (fix & BDRV_FIX_ERRORS) {
+        /* parallels_close will do the job right */
+        res->corruptions_fixed++;
+        s->header_unclean = false;
+    }
+}
 
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
@@ -435,16 +454,8 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     }
 
     qemu_co_mutex_lock(&s->lock);
-    if (s->header_unclean) {
-        fprintf(stderr, "%s image was not closed correctly\n",
-                fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR");
-        res->corruptions++;
-        if (fix & BDRV_FIX_ERRORS) {
-            /* parallels_close will do the job right */
-            res->corruptions_fixed++;
-            s->header_unclean = false;
-        }
-    }
+
+    parallels_check_unclean(bs, res, fix);
 
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
-- 
2.34.1


