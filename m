Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FAB37274C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:35:28 +0200 (CEST)
Received: from localhost ([::1]:39628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqWd-0005xY-Ia
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNu-0007yw-3x; Tue, 04 May 2021 04:26:26 -0400
Received: from mail-db8eur05on2116.outbound.protection.outlook.com
 ([40.107.20.116]:45350 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldqNp-0007Kk-RW; Tue, 04 May 2021 04:26:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LE28ikcYLk28MVvE6cbuRSnn+rkxs4Jjs1ZYIeS8qJlcGSS+Em1YGQB5awYL3rVOMvY26oHs60/5PAGwQ/5NWXAGlDps/kwHQlW7o+GAHkZFbggfGYQa7GWwFpsWzWa5iBqqbf+zTk7JqQeEo1Ok/xgLTxosDqog5B06Gpg4meDU3RydWSsLUE+caoSpvp9TpojZVcUZr55ZR7v/aDZZ8s4Tpqoh/rlax6NUX7NqHVO2k2MalWpYl8ZHPm4suGhGukxrbctTqh+dA+LSLclxy5dJuA2mX2UaF4hXSLEkEIYVj2PTJ5ASzbCIbXolAIJ97t37lFAnGVY7RQcw6IAZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RujCyZGVC+T48Sg8vsxPAQvBpkzCIGoJ/nXzE8eWRo=;
 b=lweXBMlIdZagtLNi6oCdVJoasFrvexViRMXCZxavmpMTc4aRtSFGya0yPGEc8TyVu1Zem2mAYUhM1Zj9LBrUavnbbTgOc+Gz7MqB/jTOt9mjNnu9enQlGkf/BxTM4kwYkFWpm/IiyOJPxJUrLJnJQ+8x9Or2nj1E9DOe1hHX3alqnqErUpAkV3WEPtk6a+8NZdCaqxkfA5QgpJhMR/WBNH5ElUowiF4w65Z4FPplDxlRSSV26ryvzcweu9w94k3mdkPkKNoT9s5fIQR3irBm8/loW6KfVhc9ZZG37l7/iSYHfygdQ7TYdiHk0PPpjHQ5RojR/XfsljyJcWYQ5RW/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RujCyZGVC+T48Sg8vsxPAQvBpkzCIGoJ/nXzE8eWRo=;
 b=CNeFBQosEMnbsUBOAryv5PJzZPJzToVb5eszIk3k7JT0NUp2YWo+0ZcgqIw3/280c9ZUP0tmamf7afqgRuQZYmpUxPa8DXtHteR6fw/FVC19zJfEnPzM2n+Tn0NYULEJAMGDTJz5vS8waZsYa96bXFQa7LltWCHa7rDcI8w6REQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Tue, 4 May
 2021 08:26:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.024; Tue, 4 May 2021
 08:26:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v2 2/9] block: drop write notifiers
Date: Tue,  4 May 2021 11:25:46 +0300
Message-Id: <20210504082553.20377-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210504082553.20377-1-vsementsov@virtuozzo.com>
References: <20210504082553.20377-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Tue, 4 May 2021 08:26:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d49b7cbc-fc24-407f-79a3-08d90ed6456c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33815A3A7229AF926730BA40C15A9@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zlD/hhuDHyRQhrrV5R1x90C9ffVhv8MH6ZtTTT7m9XCs++oL+RtK62TJmzF14L6cH5bVDtSYcn1NRP3cpAnY2qt/LkO/r+zlq8EkaoYHogZvoqcTa7qNnwHb6rYL6t7pOeB94BdGXg0XpmjUX+qtdWtp4H/uukRrUipBnJqelg+GaAJJi9cze/iSsxguOkteXXqhXFwiDsCcWifBRZELwfD9y8S2kj6ynX9fwmcAo/q+pART9fNryc1V3u2zMaiEA52xhVfS7/ENtbNVb7j11lwP/BOoivy8BTCwQIWeiEppohT3b1JWOgLJyNrCppT43ugyqA+JXzIXSNeDr+Tq/XNfk6sVq5m8JkfAPzDXOGH0khdxSYlRDjbFQyVUHL/GPpk96KWPUyAhMUTkEWDXVULeg9UeZ/NrPGM+B/H+BNT/tCR7DvPIj7rzRJ7eZiI+9HI3R7H5C2iEBXYza0PcuSl5BpTpsyMg2si+ReAj6b7idGMAl9eQxPVz2iOoTV+8PILEtl9vJsfkiTrBeEc8XyjV1lN+w/SIE5ZJGNx1J4P8ZHz6YOSmNykNlh2mShLCChcnXAtLj53j1MDREhHs4kd0jnsDecc19fPDreizCwSXezCc3MsotQEIewXqHGmEKQrlvVrq707Yu5CaoxSE4pW7NA0HQ0RqWeHKZIwqDV36tI9NTHH/ih+f8eqh2qA/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(376002)(346002)(366004)(396003)(6666004)(83380400001)(38350700002)(38100700002)(5660300002)(8676002)(36756003)(16526019)(2616005)(186003)(956004)(1076003)(2906002)(316002)(4326008)(6506007)(478600001)(6486002)(26005)(8936002)(6916009)(6512007)(86362001)(66946007)(52116002)(66556008)(66476007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7KDO/RrMyUUOBr2AOQROboLVfb+tTQiL+LxGSFOTvgt8280uaa9SgbPjnrOY?=
 =?us-ascii?Q?1hSqt+NBaM82aZUb8CFNa6N8onKxXRCP8za8npVSjP0lyEbViwyPMicFH9Jh?=
 =?us-ascii?Q?h1OX2okBsEaGN2E9colYP8YJTDlptZ5yYBvPwvh7Lqxr3mL8nCvLMhHxlnK8?=
 =?us-ascii?Q?ddYoJtRvG1SuLTfUXuNEF4ZDul7Cw3xno57bVlLEXJu6I+FKaHp0abuE+NF4?=
 =?us-ascii?Q?R68zDwNPxL56OPYUI9nHkapyoA8cgsZJlphSSFGLaSWl/6HGJwGFamucdtBk?=
 =?us-ascii?Q?5BEC1YgTFS8BEEAA2xSeJQ4b5CfwOuj8dLbr3KgwPIbcusBZBN2jMIGLHXLg?=
 =?us-ascii?Q?gfR4rav+YGhQcXd3w6smVObuu73lVyTiBTNEBBf8QFcAJ3hDYJQXkkDAUSz2?=
 =?us-ascii?Q?/PcbYgFt+zVXdh/BrfXbjyg3NGY6lXgW4lSvnT3RyUJHH2QT6V+j9LPPDjNg?=
 =?us-ascii?Q?od/vtOwl4qXuK74ONmckR/QLgcReV+ecKFxvw50xFMcmJ3YzzpY9A+bs9E3g?=
 =?us-ascii?Q?o1qth+IMgoTOWEPZjUHYfxaSwD8RZlT5t1qeX0xkPUDervSjHLRfHiU9e34y?=
 =?us-ascii?Q?DkhBRonNMHWB26oL0hcHgKGFLVeOxVUqVGjs4Qz9artfhpI7P8hBxHtWuxsa?=
 =?us-ascii?Q?qtEle4Q2p+AOSymO2tG1kxhKD9UWWnkrVMzvujEjNLhEgoETHHeCRWnE9fFp?=
 =?us-ascii?Q?DpJk0FhNI6rpBWBIJ/ZBKI6GgrqDlUYatHatNu0dqzH3GqNjEY45+oqV/6Ya?=
 =?us-ascii?Q?uD/tBfsIwty/rYNda8Q6GfOrIIIsuIHeqZxlrWr0T/7B7sF/4U7dprVoRtWf?=
 =?us-ascii?Q?DSdfVh9OQftZSvnvScFMpZ1yxi5GaVnUfi6QoTRkGVLRQjhscZl9cTzvkHo0?=
 =?us-ascii?Q?+mXGDEiDI0EbkwGvd/6W5vZ8MHRxUE9pJYwiqVTyFhCyVUcgDBQyWMStc25M?=
 =?us-ascii?Q?XE5ihkLa2p+yfyGmTq7fr3h6yUmCqZpmD7jYRbMbHjOOBVqkgw1J262lZ8aD?=
 =?us-ascii?Q?CGrQmB9sWvSYn3DiBviw6LOFPGNqvWzXsC9dgDc0Bcq2kELLqSYpfLu5aPQC?=
 =?us-ascii?Q?HkkYLoAH5Q3vPLjaSDCbCarORBTYzq7pwZGmxVg/QSodT+/bc42qSLJEvm+x?=
 =?us-ascii?Q?l2lio24XLAEz/LTRTV4WMIU54lPoEB+DDRzn4bLbzC/mXg4Dal0E+jhxhwZm?=
 =?us-ascii?Q?GmNhfFCScG2yjLDmIKBFcIMlUcp4XpCB2enTzJGArul90UpTuPQ4uFcSJer5?=
 =?us-ascii?Q?3hdMgtKw5sDLq57TIyryJlHQwOUJq5hkaJjaH0SjVmPqyoEKOPkiSOTWc1Ss?=
 =?us-ascii?Q?d2BUoDYm98i1KpCZn68a6BVn?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49b7cbc-fc24-407f-79a3-08d90ed6456c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 08:26:10.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6z3sPkO+lvkHGhRZomXpGL1wxVIQ0G0u78yrWb/KblKRFAPKG1N0yGfPMVL5NbX3AgNCkudNN6r6w11UTrOL3mzhI3dNCWL3qunzlFDJSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.20.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

They are unused now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h | 12 ------------
 block.c                   |  1 -
 block/io.c                |  6 ------
 3 files changed, 19 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 51f51286a5..eab352f363 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -954,9 +954,6 @@ struct BlockDriverState {
      */
     int64_t total_sectors;
 
-    /* Callback before write request is processed */
-    NotifierWithReturnList before_write_notifiers;
-
     /* threshold limit for writes, in bytes. "High water mark". */
     uint64_t write_threshold_offset;
 
@@ -1083,15 +1080,6 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
 bool bdrv_backing_overridden(BlockDriverState *bs);
 
 
-/**
- * bdrv_add_before_write_notifier:
- *
- * Register a callback that is invoked before write requests are processed but
- * after any throttling or waiting for overlapping requests.
- */
-void bdrv_add_before_write_notifier(BlockDriverState *bs,
-                                    NotifierWithReturn *notifier);
-
 /**
  * bdrv_add_aio_context_notifier:
  *
diff --git a/block.c b/block.c
index 874c22c43e..e3c6c6ed93 100644
--- a/block.c
+++ b/block.c
@@ -401,7 +401,6 @@ BlockDriverState *bdrv_new(void)
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         QLIST_INIT(&bs->op_blockers[i]);
     }
-    notifier_with_return_list_init(&bs->before_write_notifiers);
     qemu_co_mutex_init(&bs->reqs_lock);
     qemu_mutex_init(&bs->dirty_bitmap_mutex);
     bs->refcnt = 1;
diff --git a/block/io.c b/block/io.c
index 3520de51bb..1e826ba9e8 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3165,12 +3165,6 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
     return true;
 }
 
-void bdrv_add_before_write_notifier(BlockDriverState *bs,
-                                    NotifierWithReturn *notifier)
-{
-    notifier_with_return_list_add(&bs->before_write_notifiers, notifier);
-}
-
 void bdrv_io_plug(BlockDriverState *bs)
 {
     BdrvChild *child;
-- 
2.29.2


