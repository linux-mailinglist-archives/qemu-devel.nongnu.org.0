Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1927B2C6859
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:00:56 +0100 (CET)
Received: from localhost ([::1]:52312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifF1-0001vz-3w
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif19-0001F2-8l; Fri, 27 Nov 2020 09:46:35 -0500
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:40192 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif0y-000369-8r; Fri, 27 Nov 2020 09:46:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkhYSALyQ4szkvE0dbYVDfs3vqYQeVf7kkHS9T0dbdviSX6Q5+BrdkUtywFo9KLwX1U3IyhVqjU0drQzG5mFSlkh6JOw8ObDEl80Q3NzgxTEp1nd5M9pf8Sbwotz7TnARBp38bT1vD9Glbd2V3ZG+CJZvTdOQEhVvgm+SnwtgY4zhPMkDAMFDjyUuSeSG8f3+MI03QI9AQJaSIQIHcuIywtAAVBD282mZnTXWriBKaFf73QBBLBUgfy11zia7yiRAQt4viWzfdBH8ofgjIDEmOfdeMTVHPJl+bWRi/FmfjtX2Cg6Jd1aHDJxlgzpk8h+cvAjgfyJYXC3ZvEqXeI9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gz5aFpP0pFNJf+XRHJeM2GHXaL6TNAk3uERb3fkjda0=;
 b=dcWpu9rkn4lMqGrbSijLQQBFfEPoRs35Fjos5NAwCG8CnLVHUGYWDBmO+0MoTT8wlM0PbiMjiwDRxsrckDQv/+qQBjPSDIGaSM6p9CzpVmaRmCzoHRm6c6iymrFgZS0JV25eNkiCzkGLRkGHNg9RyX+WM1k9OewEMGLNK7sA1MCMJV9FEephWDiJw1lsxfpplw0GoXJ0NhLD8/fP+tO+JFSqZYk8FuzxNynvEnOZIyBGW68fHG1Btx5tC2z4f4CFuCslQeLzV420MMkNh63KSxypL+P1Xtv8zJGy2C2PbAsfo1O0fyESN1KJxQH85+y8M3lvcOOUC3222kkX6j0PgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gz5aFpP0pFNJf+XRHJeM2GHXaL6TNAk3uERb3fkjda0=;
 b=enN45Z67kfdMIAo7clRdyM9L9vL38sbr6dhQ18QX9gWkleh1YWaW3l2lTp7AyV45dnfmRij5bVRBrWTHBgZqLiJD5y7QjKYV5LlpKFXfuIF5LB4A3tXNu3xGL7AbbFAKb+aP6nvVUGHnWjbnkK8UZ2sH7ff4Fhu8AJfT8cwc+OY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5128.eurprd08.prod.outlook.com (2603:10a6:20b:e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Fri, 27 Nov
 2020 14:45:55 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:45:55 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 02/36] tests/test-bdrv-graph-mod: add
 test_parallel_perm_update
Date: Fri, 27 Nov 2020 17:44:48 +0300
Message-Id: <20201127144522.29991-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da371e7e-4ddb-46f5-b702-08d892e31afd
X-MS-TrafficTypeDiagnostic: AM6PR08MB5128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB51282C5AEB82A3C8500CC44BC1F80@AM6PR08MB5128.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZ2cZWL4Gf5d7q38yOPyzMnZLlP15hrkvhS+nQWl+xGmMYJphm7oTaHTNyC5KQTW2Vah2XJ2Ri3QpfysgnNcK7du0o4eq7epWf784GROanFaayjAjSCCkWbc7R0/brShmZEehsUpFTUsp/dekMyPQ2haLiWlMOESMRUwUOSGpbaMoIvsYg3WExASyFFMybFTScWSkTV52ebnlkxpCUdHkt0waNsHBEuNnUVrLHyMZQQ4Q3rIueFu2NntcPtYn6IJ5P9rJ1Tt0L+VDp5jXjevNBSN4LQjugc+qzZhpMbcGvJCzafDbp3hI9d3cPZHZKGhHZJoGgu8ZwIBNehRKVQONg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39840400004)(136003)(376002)(66946007)(66556008)(478600001)(6512007)(2616005)(66476007)(6506007)(316002)(26005)(186003)(6666004)(16526019)(956004)(8676002)(5660300002)(6916009)(83380400001)(2906002)(4326008)(1076003)(8936002)(36756003)(86362001)(6486002)(52116002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVEvZUl0NVk5QitKZE1rQ2RyM01zdlozVS9mSXVuclkyc2xCL1FEQllhTE9Z?=
 =?utf-8?B?dzRKQWs3bzdEb3RzeWZTUlB1aHFDaWpyTUlrWDhnc2c0aXhTZ3dxSk1qREgr?=
 =?utf-8?B?N2ZqMzV1Nmx2bys5eVMwWkx6Ymw1MXRiS2RyOThRM281K1FSUGl5Ky9zRE1n?=
 =?utf-8?B?TmJGVFV0bEVQaUtQRml5RnU5b2dtYjlCb3N5cTI5THc2Z3BUQ21uTExZSnNh?=
 =?utf-8?B?RndrNUM4Q2RmZk1vUUE3WW1OZXF5Nlo3a2dWQ3FLZnRoVEpOeXdycUxsQktJ?=
 =?utf-8?B?bUt5c2EzM1I1bXVkelRCQjArYmMxM0JEN2RKQWlRemMyd0lzUTBzT0QrajFO?=
 =?utf-8?B?QmRRSk1UZzJWanhTQlZxSzRyampOSEFMd3hnTWdBS0loSjlDVkt0L1Ezd3Jt?=
 =?utf-8?B?ZXQzOElUUzVhL1Z0Wkg0Qk0wdmJCTG83QXVjOE5ZdmdTUXZvcTFRK2pkKzg2?=
 =?utf-8?B?bVl6ZkZsRzJ5MHRLT1ZmT2svTi9vOGxnaDFsQVMvSGV1Sm15dWNZclhLT1NY?=
 =?utf-8?B?eFB5RzVRbU14YjJCWkRhczVFcnM5MkVtSjBEWE5qbGFnSjFxSldodWJHUWRw?=
 =?utf-8?B?djdTN1BRSFhnU1R4TXpMRTRzLzZscFJlcnk3TjdGR2NnbFp3eDZ1eStnb2lL?=
 =?utf-8?B?Zm1ManF6R1dBOXIxazZtWis5WWIzM3ArVU5hVjRNS0VrWFdhajg0bnA3cC9k?=
 =?utf-8?B?NXI1cUNHN3dqL0pobms2dlBWbXlIZUFuN055SURmbWRkUlNRMElrYWRTRHY0?=
 =?utf-8?B?UlZBVFlXb1ZhdFZCcW5xUDRQSXVkaWowK09xY0JjdTBMYVFlWEEycTFLaTlR?=
 =?utf-8?B?QzRINDZaMklaSWtUK2MvZXY3VTJUQTFwNm1rd2hjcWtQbEZiNDdaVHllYkhv?=
 =?utf-8?B?dE9oVlhMNXAwemloZXhaQmZXeHY1ZUJreFFNRzdUOW55azBXeXNvOFFIMi8y?=
 =?utf-8?B?Z2FUQkFaZFJDQWJmY0ZTOVRXRXNsbHVsMUpaNGUzTWpBSUUwV2hoRjR3MDZD?=
 =?utf-8?B?bXBxNkFabWZlMEcrdWtJOGpXNWdXMUViZ3FlME9ub3M4bk5VYnR0TDg2Z1lI?=
 =?utf-8?B?aVVRK3N1Q291WHlMT2drSnlsc1pOVVNDTFZVUW9XYTYvOUVLY3BuMnpPelZE?=
 =?utf-8?B?QWlYSUMraDY5ajE5dFhSTWY3NjBjZE9DeDhUa05pTWJvWDNhT1lvaVY0dkNu?=
 =?utf-8?B?cjJrdEdFMlVTaHRHTDMvcm9QSHZZdHpmb1huM3NnNmJ4Rlh5NmVMV0hCeVZ4?=
 =?utf-8?B?a3NNTmlGeDVrYTR1dC9la0h5TThuaTVhS3hIWTNEUjNFQWxVYmdmdGlWY3Jq?=
 =?utf-8?Q?WhT/fArh/BOHIoMHYhGtLUnpfhUzlQ/wHA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da371e7e-4ddb-46f5-b702-08d892e31afd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:38.2594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RStrhM2bzQ/+98GWpGJCIkKeupzQKYBktgQNKe4zGZr8oksZg28a6ksiOeUbbF8qggCE3/Qh2SrZZ2vYGzwSsZtzfrKrKQf7+RphoCNwIxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5128
Received-SPF: pass client-ip=40.107.20.112;
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

Add test to show that simple DFS recursion order is not correct for
permission update. Correct order is topological-sort order, which will
be introduced later.

Consider the block driver which has two filter children: one active
with exclusive write access and one inactive with no specific
permissions.

And, these two children has a common base child, like this:

┌─────┐     ┌──────┐
│ fl2 │ ◀── │ top  │
└─────┘     └──────┘
  │           │
  │           │ w
  │           ▼
  │         ┌──────┐
  │         │ fl1  │
  │         └──────┘
  │           │
  │           │ w
  │           ▼
  │         ┌──────┐
  └───────▶ │ base │
            └──────┘

So, exclusive write is propagated.

Assume, we want to make fl2 active instead of fl1.
So, we set some option for top driver and do permission update.

If permission update (remember, it's DFS) goes first through
top->fl1->base branch it will succeed: it firstly drop exclusive write
permissions and than apply them for another BdrvChildren.
But if permission update goes first through top->fl2->base branch it
will fail, as when we try to update fl2->base child, old not yet
updated fl1->base child will be in conflict.

Now test fails, so it runs only with -d flag. To run do

  ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/parallel-perm-update

from <build-directory>/tests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/test-bdrv-graph-mod.c | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 3b9e6f242f..27e3361a60 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -232,6 +232,68 @@ static void test_parallel_exclusive_write(void)
     bdrv_unref(top);
 }
 
+static void write_to_file_perms(BlockDriverState *bs, BdrvChild *c,
+                                     BdrvChildRole role,
+                                     BlockReopenQueue *reopen_queue,
+                                     uint64_t perm, uint64_t shared,
+                                     uint64_t *nperm, uint64_t *nshared)
+{
+    if (bs->file && c == bs->file) {
+        *nperm = BLK_PERM_WRITE;
+        *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
+    } else {
+        *nperm = 0;
+        *nshared = BLK_PERM_ALL;
+    }
+}
+
+static BlockDriver bdrv_write_to_file = {
+    .format_name = "tricky-perm",
+    .bdrv_child_perm = write_to_file_perms,
+};
+
+static void test_parallel_perm_update(void)
+{
+    BlockDriverState *top = no_perm_node("top");
+    BlockDriverState *tricky =
+            bdrv_new_open_driver(&bdrv_write_to_file, "tricky", BDRV_O_RDWR,
+                                 &error_abort);
+    BlockDriverState *base = no_perm_node("base");
+    BlockDriverState *fl1 = pass_through_node("fl1");
+    BlockDriverState *fl2 = pass_through_node("fl2");
+    BdrvChild *c_fl1, *c_fl2;
+
+    bdrv_attach_child(top, tricky, "file", &child_of_bds, BDRV_CHILD_DATA,
+                      &error_abort);
+    c_fl1 = bdrv_attach_child(tricky, fl1, "first", &child_of_bds,
+                              BDRV_CHILD_FILTERED, &error_abort);
+    c_fl2 = bdrv_attach_child(tricky, fl2, "second", &child_of_bds,
+                              BDRV_CHILD_FILTERED, &error_abort);
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+                      &error_abort);
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+                      &error_abort);
+    bdrv_ref(base);
+
+    /* Select fl1 as first child to be active */
+    tricky->file = c_fl1;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl1->perm & BLK_PERM_WRITE);
+
+    /* Now, try to switch active child and update permissions */
+    tricky->file = c_fl2;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl2->perm & BLK_PERM_WRITE);
+
+    /* Switch once more, to not care about real child order in the list */
+    tricky->file = c_fl1;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl1->perm & BLK_PERM_WRITE);
+}
+
 int main(int argc, char *argv[])
 {
     int i;
@@ -256,6 +318,8 @@ int main(int argc, char *argv[])
     if (debug) {
         g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
                         test_parallel_exclusive_write);
+        g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
+                        test_parallel_perm_update);
     }
 
     return g_test_run();
-- 
2.21.3


