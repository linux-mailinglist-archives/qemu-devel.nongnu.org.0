Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B4D369C2A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:46:17 +0200 (CEST)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3cu-0001ua-7r
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xu-0005Es-9e; Fri, 23 Apr 2021 17:41:06 -0400
Received: from mail-eopbgr10127.outbound.protection.outlook.com
 ([40.107.1.127]:4578 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1la3Xs-0002m3-AZ; Fri, 23 Apr 2021 17:41:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLe1VJ3bs35SjeXidCy8Ty167ATkaSn3QL2X7qU0ULqYKkdaBf3LOjf2V65cUwNwvuWCNJkT2vpAXHSjSNhTotzq/eE9K262U0U3s/Rb24/PxnjBCJc3Cms3Zm5hMwoyZEJGU4D3a+PgoFi33libNaip1PjjzJYB0zB5TJ2e55TxXB07tZScwZqGbABK6dC/VUiNC7jRs33ecaB9PLHsCTdhaoYuSukv4aOJh2rRJtRP3Oj/btrSHtUgINXbq+sznXX9wI/CnBqDfV+2pkM36gz0UWlwMFM9DK0xl5hqWjTJVfZ3UIw98fYVEHdtNd5MSciisb4axWgh8v9K0Y25uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0CLww6oHv816wdkB3jTEGI4imhm6esyB1dev91jFnY=;
 b=ANbxNhtcaPSaWGsH4F2pyVzS/M01KdtyX+JQ5QTDXCL0CyrVNoWoNkiWKrMtKUvZUWT27TdSZ0mhvLgc7BDEqSZVIzN47KBiT5d2WtgvxDRPpOcF/4GCJ0cTXtZzMB6kGBhpMIlP+E3EyU3pQc+UwgyHzvp94AL4qT2H3GKINfaRngq6ci0phbnEeh6w5iSS2RYqtociGihEzK6xheK50bnUeIe46F91pninzOaCyN97JpnZKKfAhUsiiM2Tk/A6jCvB9pyGrUjUO+QZBfUuT/TXqNtzO+t2iO7MJIL3o4p/rHsDHb4gooD41KnRaYIZ8o4uShjygIojvLG/kuYrrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0CLww6oHv816wdkB3jTEGI4imhm6esyB1dev91jFnY=;
 b=cJHYALsT+m4lbQKfyyF24QU/aOD9Xdx7jvcy5iiEg/25gcSwfn3k6aB0NqdaR7ySieqJad1wAQi9SuymqO6d927cX2fIQwny3kbj96+6Am4cnfnv5+oGLE9/Gc6Fy/LV0RcCApJCkkak2k+8MQ5yn5DOQTgeeuSyzwKjKaZ2UYI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6374.eurprd08.prod.outlook.com (2603:10a6:20b:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Fri, 23 Apr
 2021 21:40:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Fri, 23 Apr 2021
 21:40:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 philmd@redhat.com
Subject: [PATCH 04/11] block: introduce bdrv_debug_wait_break
Date: Sat, 24 Apr 2021 00:40:26 +0300
Message-Id: <20210423214033.474034-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210423214033.474034-1-vsementsov@virtuozzo.com>
References: <20210423214033.474034-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1P192CA0012.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 21:40:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f579041-8730-4aa8-98df-08d906a078c1
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB637440662D2D3FC8D0BE9C24C1459@AS8PR08MB6374.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vpmtg/Ic8fWL9SZaaJ8BsnE+QcmGI7LapeapejMJAEXL0dWODZezT1MtxRxhteh19KrbOSjToMLpygXkkR1mLGJVbWDV0F9q0oxqaASyb0+XqXHFx5r5IcZu/ONkLgwe4sIO15Xd9BQogJfGNe0FJQmDWidzk1pI0LQSue3wrlZ1i9k72wM3gyQ0bolV9BbuXsq5+c2ldENz6zQTm0d2XHtsQt1pOKUPkC1NXq57TrtvVTGjn8EANFq4AJaibAxYaTZSDrIBARRITm3zoIOoOPfFQLvwQb3wtPt+O6rOHFAig0rBk0A671RnYoIAYa06U8Zg3LY+DiUrEvDC0xuermi5BA4ybblBV/gJAU6778JrRcnY9MWSYgp1+Dll5abj/MC/1zm0Ldq1Qu8cEwKM2Psw3aLNAzlb/OJW0xxOO39yL2/xZhShtK8KVKAkEgb3kR46VrEsv3TR6r7NBQkWT3jpZ9p5+AEQGXhyxyubZlmtF1CsvzdwV1PvWQntifNRvKO/jS6hL9H8B3Ptrbh5gP3rN0BziNn94axLFXp4UjZ5rLLe4ELFhFhME0f9r5h/538oqyA8EpZmZzc+eWdFHCbN+yC79tYzQWNL/VyKbGnXi4+CP3Ui+JSX3nE/XILO+hgQs5RVkGukQjQWyj7DxEBZ8NsBL9Jto5hldLY9Elybo03S/8K8YJiR0EONse35
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(39840400004)(346002)(376002)(316002)(2616005)(26005)(956004)(83380400001)(8676002)(4326008)(38100700002)(38350700002)(478600001)(6666004)(5660300002)(86362001)(186003)(6506007)(66476007)(66556008)(1076003)(16526019)(6512007)(6916009)(6486002)(2906002)(52116002)(36756003)(66946007)(8936002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tArxdz5zX7rMy9cEHxhZrwahS1jTFuQavPFkd4vkUH8V+CatRQ8hLNOI/I0f?=
 =?us-ascii?Q?EO2W2Wr8ZH+TldmTFwTVWUlnzBj21+Ky7bGRXyUM03nxTrYu+JRRrOKMe4b+?=
 =?us-ascii?Q?nBPkQC2ABPouQjQP4hbZeuj5nPpq+LnOoA8vJPECeuXgixVCyiuQNNSmch5T?=
 =?us-ascii?Q?3eUKFsN+xpP94ZEWpPi3pa2IFdDnnUt+bsINKVCrFsykM5KRmDLd6ENx3HBp?=
 =?us-ascii?Q?wRAW685N5E0g4mwody8anIUSuH1DDCv0r+rxaiEHhNKNtJrOpPMpYCLgZAdW?=
 =?us-ascii?Q?EpOM4mHqx3+BfO/e4uly+nE5u+s+qn3uYKpMdkoukaUTKxMHVasNJeh9wyXN?=
 =?us-ascii?Q?MvSzqdUFtdj2OBANRcbJpYyO3gVh9B06q1KQNctV6Kr2d6hJyGEOjMvKTZdi?=
 =?us-ascii?Q?XKHA177IBEdu6dBVSNdWUv/9Dnp5jac89Vxr+5q5uYbcEotj/wTAWJadt2VA?=
 =?us-ascii?Q?7d5s9MtxIuXmCGoMKDqaMXN814WVYutRFYnQsCOA8tsLh8WPbiTiVFnKevRM?=
 =?us-ascii?Q?IENbjDbQwEPHbHo5IulnK0KUMZJk/HX+gWNOQHq/J9csC9Rc1CMN7zSUZSN2?=
 =?us-ascii?Q?ygdzYMJTACOZY+kn61tChYilED7RMDBZRPIL/VqsGxaFvIcmSmft7zx4v6j6?=
 =?us-ascii?Q?GbecKTfl/inseEMrpVGqxOi7AX4uQwxWiOW8r3Bv3GDXh+f9s0YqnFToUxAZ?=
 =?us-ascii?Q?kclEXdiSGxTKlKsq7NKsP+w5ASno3UAJVlxcMuBZMysWoUhdReMc474W7kUR?=
 =?us-ascii?Q?go3i+HeyHvEmzJ9yVz5agqgmtNpKIpzXJFRTJrtjSicHJqK+IYJ+uJW/iDym?=
 =?us-ascii?Q?L50gdOkmfoJtfnkgc2kV0QgLg5UNrY/i6oIhiCzgfLlTz618mKiwQlf4ZeWp?=
 =?us-ascii?Q?XdG8kTceCbco6yDpTqYNa2fPKwnUr47/rDbrGQqfoMYargPVQEEaejsX/Mgm?=
 =?us-ascii?Q?Uu74ch5xFx2WKCazpH8MIxV2rACB4eN4+knYqbNW67xa1VR7sc4heit83RuZ?=
 =?us-ascii?Q?H12V3SN+iztcbolJWo7gn6Hl1tPNmrkKHMr4bKXaDLUgp7HN/poUhjR+w95W?=
 =?us-ascii?Q?m1vAiyBTECRoz5pT3ihV2/MB8vjo6D/VNIuQtC9Mc9KBeCL0SuTNrfnNtjmn?=
 =?us-ascii?Q?XvZ/dT5l48M0fEJt0sYiCYsO5tnsdnX+MsOTgDzOJLHLXjGP9HfrGe7HTHId?=
 =?us-ascii?Q?NrBAxbXmylx4rKTJkMU1ESowUc0hHvZ/awloAddCAx8aNNeSlt9F2ynpjS6K?=
 =?us-ascii?Q?+2cWePWLhMDoOCu0Hz3/v1NS+jwVqCZFz68H8A4y8j1Z3mpKodZwxcEb/wWa?=
 =?us-ascii?Q?Q5m2yVT1y8JSoFPxEpeoVNfv?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f579041-8730-4aa8-98df-08d906a078c1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 21:40:54.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q24vnySDV0sZKqeGHhyzonShsnwBCv61NhmrnH1T1JqsAMLHg36EoTg2n4NoX60LdGrybgN/1GpudvS5uF57YU3ixydryCpVcHi1pFtjZt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
Received-SPF: pass client-ip=40.107.1.127;
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

Add a handler to wait for the break to happen in coroutine context. It
will be used in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h     |  1 +
 include/block/block_int.h |  1 +
 block.c                   | 11 +++++++++++
 block/blkdebug.c          | 16 ++++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index b3f6e509d4..e133adf54f 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -648,6 +648,7 @@ int bdrv_debug_breakpoint(BlockDriverState *bs, const char *event,
 int bdrv_debug_remove_breakpoint(BlockDriverState *bs, const char *tag);
 int bdrv_debug_resume(BlockDriverState *bs, const char *tag);
 bool bdrv_debug_is_suspended(BlockDriverState *bs, const char *tag);
+void coroutine_fn bdrv_debug_wait_break(BlockDriverState *bs, const char *tag);
 
 /**
  * bdrv_get_aio_context:
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 50af58af75..89e6904fc7 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -502,6 +502,7 @@ struct BlockDriver {
         const char *tag);
     int (*bdrv_debug_resume)(BlockDriverState *bs, const char *tag);
     bool (*bdrv_debug_is_suspended)(BlockDriverState *bs, const char *tag);
+    void (*bdrv_debug_wait_break)(BlockDriverState *bs, const char *tag);
 
     void (*bdrv_refresh_limits)(BlockDriverState *bs, Error **errp);
 
diff --git a/block.c b/block.c
index 001453105e..3ea088b9fb 100644
--- a/block.c
+++ b/block.c
@@ -5702,6 +5702,17 @@ bool bdrv_debug_is_suspended(BlockDriverState *bs, const char *tag)
     return false;
 }
 
+void coroutine_fn bdrv_debug_wait_break(BlockDriverState *bs, const char *tag)
+{
+    while (bs && bs->drv && !bs->drv->bdrv_debug_wait_break) {
+        bs = bdrv_primary_bs(bs);
+    }
+
+    if (bs && bs->drv && bs->drv->bdrv_debug_wait_break) {
+        bs->drv->bdrv_debug_wait_break(bs, tag);
+    }
+}
+
 /* backing_file can either be relative, or absolute, or a protocol.  If it is
  * relative, it must be relative to the chain.  So, passing in bs->filename
  * from a BDS as backing_file should not be done, as that may be relative to
diff --git a/block/blkdebug.c b/block/blkdebug.c
index 2c0b9b0ee8..10b7c38467 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -57,6 +57,7 @@ typedef struct BDRVBlkdebugState {
     QLIST_HEAD(, BlkdebugRule) rules[BLKDBG__MAX];
     QSIMPLEQ_HEAD(, BlkdebugRule) active_rules;
     QLIST_HEAD(, BlkdebugSuspendedReq) suspended_reqs;
+    CoQueue break_waiters;
 } BDRVBlkdebugState;
 
 typedef struct BlkdebugAIOCB {
@@ -467,6 +468,8 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     uint64_t align;
 
+    qemu_co_queue_init(&s->break_waiters);
+
     opts = qemu_opts_create(&runtime_opts, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
         ret = -EINVAL;
@@ -785,6 +788,8 @@ static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
     remove_rule(rule);
     QLIST_INSERT_HEAD(&s->suspended_reqs, &r, next);
 
+    qemu_co_queue_restart_all(&s->break_waiters);
+
     if (!qtest_enabled()) {
         printf("blkdebug: Suspended request '%s'\n", r.tag);
     }
@@ -922,6 +927,16 @@ static bool blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
     return false;
 }
 
+static void coroutine_fn
+blkdebug_debug_wait_break(BlockDriverState *bs, const char *tag)
+{
+    BDRVBlkdebugState *s = bs->opaque;
+
+    while (!blkdebug_debug_is_suspended(bs, tag)) {
+        qemu_co_queue_wait(&s->break_waiters, NULL);
+    }
+}
+
 static int64_t blkdebug_getlength(BlockDriverState *bs)
 {
     return bdrv_getlength(bs->file->bs);
@@ -1048,6 +1063,7 @@ static BlockDriver bdrv_blkdebug = {
                                 = blkdebug_debug_remove_breakpoint,
     .bdrv_debug_resume          = blkdebug_debug_resume,
     .bdrv_debug_is_suspended    = blkdebug_debug_is_suspended,
+    .bdrv_debug_wait_break      = blkdebug_debug_wait_break,
 
     .strong_runtime_opts        = blkdebug_strong_runtime_opts,
 };
-- 
2.29.2


