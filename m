Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055BB33F396
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:43:40 +0100 (CET)
Received: from localhost ([::1]:50222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXOc-0002nM-TZ
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHS-0004D5-H8; Wed, 17 Mar 2021 10:36:14 -0400
Received: from mail-eopbgr10137.outbound.protection.outlook.com
 ([40.107.1.137]:61154 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHQ-0006nM-0t; Wed, 17 Mar 2021 10:36:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPogMbUXmIMGcxkqK3uNtXYpRrFj9lDkzDpba6rh5RNm9feHw6bsDlIFuNeoQZLKK2FrXytAla26ENbpdM1Wo2Mf1V6ro78wVPj5DHx8h9K47J0UHm+//+ZQDhu+Sq34OBItMzex+IRrk/ZbbwzX2QeUzrz+VhNEKeaevVG2Jpo2qKWsBY987HgAKDcs+SRHjEugxkB7qHzmRTQQbSelv6I6dvWvqVb2bstC8EuQdsJkY0/r5j0gpQAd6rTjLSlpyBxOxenzeSycqTwWghXkMtcEhLtMvvJFiSS0XTVkwKj7dvyQ9tgDXQg5EGJxVWnyTlWj6C/jKTXu8aMKtlahPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5FpE3f1ydvQQrnt9yPGT3iOztTVJ6HG5Jt1oGDWGYE=;
 b=l3sdk7vgFIB6Ia2DJi8XLTlqZFv8Rcm2ReRdFTyNU0qo0b8+UApPeLp367bgGBiFU2gWWmnIsroqNa4xAfDqHx2R+azkpufobb4cZf3ayJaG7ks7V/+o0ykh9uX2Dq9FEvFhjh5mbljvqEFoy2HrPMcARdvAlXwE35pkrBU/u7Cp+lnAaa0zRcyd+UkQkiNOqLeUmrNL7LaZ+s44GJqmQcBStl3dXkbhXuMBHl3DskSyHgpn8jLXBKFhRgHYEp7mDQf2IAjaIlw4FXvt/ZqedBrxxzDfCXAF+G6D+oqwZHbrRUzM2aL2KZUd+vMgQ9P1LBfbRaJZFJ52wwhwlJoseQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5FpE3f1ydvQQrnt9yPGT3iOztTVJ6HG5Jt1oGDWGYE=;
 b=EYSRAJ5VzeWKOq+MogUiKApI9U9mQ6bcWbRXf7vn76pD9wDjh5Hn0Nno7Wkvhpi+B8h8syY5eOepxzhBlOHr5d6FULyoterInBmeGuX9dKmUAVgVBREobGXhoIH0b7FCTtmsNaVGIyZ/u1CRgRJjqjpNsCS40AQPwcVdRvzCwgs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 02/36] tests/test-bdrv-graph-mod: add
 test_parallel_perm_update
Date: Wed, 17 Mar 2021 17:34:55 +0300
Message-Id: <20210317143529.615584-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c15e57c-8861-4e74-b5a6-08d8e951fefd
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16508E5AF5C4F27A538482F7C16A9@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: seVJnx+1rVTWHBzSkfkRfLSDdeHi9twqDYmKovm6Hrv29Rsi9L12Tii0aFy6l7/EOIYdx+ul5av7tH79JbWWmBLzXbmNFq+ugYuJaOpQxrFIthDPnKdw8JBwmEfJzGCbxT1ybYLOnax3WdHmYja4qwxi9oA9sg924M/uoeSWPQLgv9qHXpF5JmWep3TyRXHIkoGKegUBhjWKjsPHNoiO+/Abj+9iwuBQ9KdeswhbzhRf6iUA6qEx4kf7Eg3+fCm2hX7gdbDHyEfLyosMgE/KprPfuVc+Vm0g7VXFDV1qkC9dvPLoVbRyxAksY/wiLqltnD5zJ0R7MhvU3VV38v2tgUSRE+3GGFKCo8orHq4YD2mjR+X+6Kczc0orMXHFCuRbifwG1e/MgZw66b/wUGrXqsnJQTyLabegc668HXPdLwNvnnuqvlvclKoGJUjuKjjac5mMRUBp+C1slEUoDTLZkvX5nxIrmhWsqBeR+AX3vmPowrE723f0g+USFNJFIiBtdFq01jNStNcpFyCKpmmXVylbUp42glP4+RfpbLAZBHuDk7nsu+FSkz+dr3qLvC/x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(396003)(376002)(136003)(366004)(316002)(1076003)(956004)(6916009)(6506007)(66556008)(66476007)(6512007)(26005)(4326008)(5660300002)(83380400001)(8676002)(52116002)(2616005)(66946007)(6486002)(6666004)(186003)(36756003)(16526019)(2906002)(86362001)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eUlEV1VHYVp5dFV5QzZSeHgySzFZKy9qNUxmaE1yczMveDcxdjFDR2VXR2pG?=
 =?utf-8?B?a3JFZElrdmduMUFuWUdaYWpIWjFlQUR3dnhhalRoK0lVa2lNNy9NN1lLOW9z?=
 =?utf-8?B?ODFnT0RqNXVGaGNRdTFSTXE4UDVVZmVEUlQzUm8wTzFwd3ZtVWpnMTJnL2Fl?=
 =?utf-8?B?TEp1ZzNDdkowVC94cHdzQ2N2ZDgzaFo5dzRBeVphSHB6MUg1d1ZJeXJmVUg4?=
 =?utf-8?B?cnJrdmYyeUxiOUkzV1JnZlpJVHAxZ0dHdUlvUGZxVWRZWVVtdU9YOHl2S0VY?=
 =?utf-8?B?VFZqbHNrRmptWmNDUFRPNys4alA2a0NrYm5iU2dBQ0NPUjdzalBQRThEZXZj?=
 =?utf-8?B?aThnaUxTQi9Dcnk1OVp4QVgwKzBxbHp3RDlRRXRGeDdtcVFZN29uVlQ0V2xx?=
 =?utf-8?B?WElMQVV6OEd6K09lUkY3Q3RveHFaTmdEUzJITmQyWmtvSFFZQ2dyb096cVhE?=
 =?utf-8?B?VFp6TW5vNVNIanVCWTh5QnhkTkxWZTlXUFpMT3lUdTYwczRGc3NSbEJZMHlh?=
 =?utf-8?B?YjdodGJVMzNOSDZ0bG9NWnQ2VHRwLzRkVUNiRFlFdWtSR2dWTUdxTjk3K0Fv?=
 =?utf-8?B?QnhoZi90VW02b0lqcmZGU2dRY2U0TnM5Y0IzSC9XU2dvd3puS0JhVEtISEFr?=
 =?utf-8?B?U1U1VXBJb2t1eUNZTnhOdEUyaHJNY0ZVNGNjc3liR0JNd2RkSzBzN2IxcWZy?=
 =?utf-8?B?aGlteXBkYTQ5blJpdVpJY2JBT282dFZmeERuMEZtRDA1a2xKTkE4dmZpWG5K?=
 =?utf-8?B?WXAxQWhYL0tpdnc1dnFCNi9YR3ZTVE4zUXZyZCs0YkEwdmM5eTQ1a3huVS9K?=
 =?utf-8?B?cUhMeUlIVEFkajhRNkwrM2VNUFRBMm10OWlHSW5pbkk4dld2ODBQc1l6a2tN?=
 =?utf-8?B?Q08rWVV4RFNKNWlUMzE4Mmdpb3djTHNJdzVONmxDenFpbExsMXhDaTNKRnpq?=
 =?utf-8?B?eFNmajhqOXkrRkl1b0lqd2RFRE9ZWjR6SlBLNHIycWZiZE9WNlhpM1NueHlZ?=
 =?utf-8?B?b0xsL1hXazRwZ3VtK0ZwaTBScjdTbU55N2tSZ0xSUUxsSEZ3TUQyOGYraEF2?=
 =?utf-8?B?bG9Wb3grZXkxakJWR21zSGtZWjBVbGVUYkVDU3VFVXo3MkJHSjRBemFnd3BJ?=
 =?utf-8?B?N1ExSnl4ZTkvV3NXMEl6RWFjWTZ0bWpiZWpkSHpYV2FCTXJzSi9lZWo4dmRZ?=
 =?utf-8?B?aFFLNHJQZnhHL3BVUm1KMFRrejMzdFdmaFN6SmNUbHFxaXhGTENOeFhxUUlS?=
 =?utf-8?B?UVN5N2t0VEEyMWoySkUrWnRFQjBGQjFQMDF6WDZmZ3BBM1BDWkc5NzB1djNJ?=
 =?utf-8?B?RlRhL2hxMVUvMGN4WHVHYk4zdmJIMlYrZlg0OWpXQ0FtTDJIU0NnWnlvUHNP?=
 =?utf-8?B?bHZFWVlqOXc2VnlSSGlZNzdqazN5bGJIOXZuMU54ZzlHaWtrN1ZqNldabkgw?=
 =?utf-8?B?K2JsZ3NLaktqSXNWMGs2UVdQRU5YZDl6ajAvc3hSbDVmVGFidWR4Y0JBWjUv?=
 =?utf-8?B?YjY5K1E4UXFRcXNPcU1wL0JNSlNFTXYzdnVhMzJqRCtsYVdUNXdDQVFUZ3BY?=
 =?utf-8?B?aDZOMmRVcXZKNjV4M09lamNJaTBYN29UNG9iK1JORkNBalhzMXg3S3dLc3du?=
 =?utf-8?B?R2NHMit2V3BrSUs3cVN2d2ZQcXViYkZvM2NpRDIxK3BtVFRxWHMvQnBMQTBV?=
 =?utf-8?B?Ni9qb1lNNU1ha0o5UGlIUVV4bUh5ZUJ5ZEk0TXZYa0dsMWlGV2RsQ1BrUlI2?=
 =?utf-8?Q?v2fUuitkp8Fx4SPGHSG1y6jK8gWWZOIjgm586at?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c15e57c-8861-4e74-b5a6-08d8e951fefd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:05.4290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LmBCEjR2nI08Qd33nIhcf9WOMykv4i7ZW73bnob4MftKkD1jWothObNOZXr4kLF8WBDu5joJ1hGJXsPz5YJcQU5hQwAS9O5duwcJiR5nUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.1.137;
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
 tests/unit/test-bdrv-graph-mod.c | 116 +++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 4e4e83674a..3b3bba1ee3 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -238,6 +238,120 @@ static void test_parallel_exclusive_write(void)
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
+
+/*
+ * The following test shows that topological-sort order is required for
+ * permission update, simple DFS is not enough.
+ *
+ * Consider the block driver which has two filter children: one active
+ * with exclusive write access and one inactive with no specific
+ * permissions.
+ *
+ * And, these two children has a common base child, like this:
+ *
+ * ┌─────┐     ┌──────┐
+ * │ fl2 │ ◀── │ top  │
+ * └─────┘     └──────┘
+ *   │           │
+ *   │           │ w
+ *   │           ▼
+ *   │         ┌──────┐
+ *   │         │ fl1  │
+ *   │         └──────┘
+ *   │           │
+ *   │           │ w
+ *   │           ▼
+ *   │         ┌──────┐
+ *   └───────▶ │ base │
+ *             └──────┘
+ *
+ * So, exclusive write is propagated.
+ *
+ * Assume, we want to make fl2 active instead of fl1.
+ * So, we set some option for top driver and do permission update.
+ *
+ * With simple DFS, if permission update goes first through
+ * top->fl1->base branch it will succeed: it firstly drop exclusive write
+ * permissions and than apply them for another BdrvChildren.
+ * But if permission update goes first through top->fl2->base branch it
+ * will fail, as when we try to update fl2->base child, old not yet
+ * updated fl1->base child will be in conflict.
+ *
+ * With topological-sort order we always update parents before children, so fl1
+ * and fl2 are both updated when we update base and there is no conflict.
+ */
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
+    /*
+     * bdrv_attach_child() eats child bs reference, so we need two @base
+     * references for two filters:
+     */
+    bdrv_ref(base);
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
+
+    /* Select fl1 as first child to be active */
+    tricky->file = c_fl1;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl1->perm & BLK_PERM_WRITE);
+    assert(!(c_fl2->perm & BLK_PERM_WRITE));
+
+    /* Now, try to switch active child and update permissions */
+    tricky->file = c_fl2;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl2->perm & BLK_PERM_WRITE);
+    assert(!(c_fl1->perm & BLK_PERM_WRITE));
+
+    /* Switch once more, to not care about real child order in the list */
+    tricky->file = c_fl1;
+    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
+
+    assert(c_fl1->perm & BLK_PERM_WRITE);
+    assert(!(c_fl2->perm & BLK_PERM_WRITE));
+
+    bdrv_unref(top);
+}
+
 int main(int argc, char *argv[])
 {
     int i;
@@ -262,6 +376,8 @@ int main(int argc, char *argv[])
     if (debug) {
         g_test_add_func("/bdrv-graph-mod/parallel-exclusive-write",
                         test_parallel_exclusive_write);
+        g_test_add_func("/bdrv-graph-mod/parallel-perm-update",
+                        test_parallel_perm_update);
     }
 
     return g_test_run();
-- 
2.29.2


