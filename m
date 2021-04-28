Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D389836DBE3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:38:23 +0200 (CEST)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmGc-00050L-UN
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:38:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxf-0005gh-TA; Wed, 28 Apr 2021 11:18:47 -0400
Received: from mail-db8eur05on2106.outbound.protection.outlook.com
 ([40.107.20.106]:17025 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblxZ-0001uP-Ki; Wed, 28 Apr 2021 11:18:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmYlgxti0KotQzbvlZRtZSct4GhYljbQTCpgXw8kiZHISqXvH0SaljpZd1DYLAdnKJs8qJHzhSVXQq5RFmoGNlC1IwJnSHMK6dEtvF2wtDjbQuET7e1DsVIXR4pp2DzAVaOOzzz/X3OhORI4Z56BSkTH8QHAkFQSazthqPcQ6w6Vs7I7VREbIHKNOaqx5Az20+eXlZ1ZYBiELXduWAQUi2qWb8YZyFD1vIXcwg9l/j6Dt6s8yS4/K70bhsvs2AR1wDPbgX7//ZMbH9tZIkjeYP5xC3ljvlqyZ5vtp1XsBSJN/94s9jXiF2scOT/Ky3TYv7zWtrU8/HzFWVdJKwa1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTOZv3OREJLR5AglgF9rBm9RojtdA5kecMa/lmwv6O8=;
 b=n7D4cLAECn0RAuU6N0Zc17UEOaqyoXGrw93c/c1T919ODDqJV0oV41dCw5yDU51UOOMURq9g+/MtjOcoXBMQVzLQ12ejC4zwe10Doxsu6v4+4KmY9dzszZavZWto8qmofFbNppVSTxFd5ozFCF8fOx+7MX4HaymL8Lu0HX9WqNf+gTVQI8FC7rY1dY16tTToi/lY6wzppe6Z7qyGjZjBGvUpCfj/D60DmnE1joPUWf+gR6/nLQIkgiEqyGwt6Cb+kIVFiuJgvTepr7aXqPDJwjOMCZ58XDPxQPxQ4QO7p62/Uea9zC65f/ftm0bEvMukLr1yQ9D+b7/MGImFBincfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTOZv3OREJLR5AglgF9rBm9RojtdA5kecMa/lmwv6O8=;
 b=bw0lx3F5jaq5wNFjVkPSIzvRmSzQQk0tN3s25yhQOuqqoSD5sGGQpc7yHI0zkdaYYNrj30EiqhstU0Z/QIY84HEiKunDuLArCvyHjqQlBQXWhbSANhaI3y9n18rqMNDtD9rBptB3jNBf4Kjo4JiBtf32TNW1O58VDHuGOUgE0Cc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5909.eurprd08.prod.outlook.com (2603:10a6:20b:297::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 02/36] tests/test-bdrv-graph-mod: add
 test_parallel_perm_update
Date: Wed, 28 Apr 2021 18:17:30 +0300
Message-Id: <20210428151804.439460-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e536f2dc-f18f-4eaf-23da-08d90a58dd69
X-MS-TrafficTypeDiagnostic: AS8PR08MB5909:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB590991E6AEB7740E91A51081C1409@AS8PR08MB5909.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dLXHbFXqhcWlCxohBUuic83CVTnOBh4VSb/pkSoEGYmp1h6HWWsrUVh9HPTBslZlUxy+xdlQaIZvzcQxKgtIQWRBXA2TeVwzcexI11Ne7CRCm+exAnKfol8LR3AmnxpRJp9FwAeDaOKLqHNcL5k81LD1+xIr7FMfI9edSgtD7lcinwf38UkWhxYXbPGsjKruvEGF4uPNlpP7o1v5fxb09dYxWuQbVBjDSOp/pUJjp+RqzxEvG4cTVZbKkC5dgLEAf1BLb6hPK8u0OilmycbWt+AhEjB5USHmCXnS5515q1/Xx+2V8pgsWNW6GXBhOGlXU76baDN5vdKZv/WTT4ZTSd5VjyPfEdWDc/quLLx2L+c93MCH+BoegsDRodrE/KOV5lMIakvvln6eLihYeSSgtMDZdo2/aK6VsVq0PvXQcKbjc6DfTUZeF0MaWv8zOneTZffpxCeNzQtdp2Ul1H0eO6QfSXy03Q77rdqzvN7aGsLTqSf6q3b1eIayTZeNIU7Elu1SEmt6LpprBmxzlglPgMuXX7fsP6RbFFLDVI7XZHkZrmmxN1NY9v1L/LzSGKPk34s8H3pRW4f3YmB0kKIPpaZel+Qw+AZZ94iRE582mwgd5bto/oYZS6HF3aRt74PRpN7wuMynbnVrdA91oChUAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39830400003)(8676002)(478600001)(83380400001)(8936002)(36756003)(5660300002)(4326008)(6486002)(52116002)(6512007)(2906002)(6666004)(6506007)(66946007)(26005)(86362001)(38100700002)(186003)(16526019)(6916009)(38350700002)(66556008)(66476007)(316002)(956004)(2616005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDdzQUpxWkdoc1RIYWpIcjkzRkdOMzI3Z3lvZjZFL1pkdk0zLzh3aGhOOTlm?=
 =?utf-8?B?dERIcXFoeXV4R2s5Q3Q5cnhVNkZ4UjdkL1czQ0JMazR4eUtzbzdqRlBUY3lY?=
 =?utf-8?B?OXJaQXBYTUlWMlhSUTVtNFlxZjI2cStDNEFWZDU0bkw0QktCcUpjZHpaRFdL?=
 =?utf-8?B?YWwvRnBHRnE1MVExdWxDT1VQem5OSVNkdDlaKzJNb0hOV1JzV2pFbFQ3a2NP?=
 =?utf-8?B?b1hhWC9odTdoOGpuTmhmL1RtdkVuTU9MWmVTTUtkdFNsVmliRVkwMkpCNU9C?=
 =?utf-8?B?Vk44bnY0aWxnSjE3Z1BpQnEwNzN0dzY0cDhvUXEwYUk4TWx1bmZxS3JqZ3hv?=
 =?utf-8?B?ZjVqT1JRV2VrZk1YSW8veHQrRHYrVnlHS2tlSFBMaUplYy9vYTRZMFFYc2pq?=
 =?utf-8?B?b1pOdEdGd3ZvSlB5bG5KN2E0bktJZFM1T20xbHlLSS9TOEZveFd0ZW84NjdV?=
 =?utf-8?B?ZXNmQjd3RU5rUGlmem1yeEl4Z1J4RktBVHZxck5DRFQvOW5Cc0o4ajIzTy9x?=
 =?utf-8?B?QWw5Z3BYV3VmZkl5MlRYdFhudWdFdHVLZmdsQlFnNkxVajVDQ0RIeGUvRkdF?=
 =?utf-8?B?SEY5b0NwdUVPUUE2bjBiekZ2a0lyMHlYa1JYTzRicWdTY2dqanpheVRwZ2dM?=
 =?utf-8?B?YXN2VFNvV2tVMmNpZithL3pGbHpUTEd6MzNUdXphaGNJb1F4Mmw3a3gxdVhI?=
 =?utf-8?B?K0dtbllnLzZtVWIzT3p3Z1ZtdWRXam5DK2tqUzV6YklKcTZBbTdlWldsQlU3?=
 =?utf-8?B?VnNFcUc3YU9WTHdQWlQwRDY3NDl3RXd4dFBnNm1yMzQzSEtBVnAwU3ZTZ2Vr?=
 =?utf-8?B?cGdUUlBlZW5tOWE0NkwzKzJUdy9mUW9jY0lzZnZHWlVyK3N5ZmQxRXhScFVo?=
 =?utf-8?B?RjhNTDRYSENXYlUwUzlCdGxrWmJxU3hoaXU5YTI4Uk90S0dtWDNvRjVqcmFv?=
 =?utf-8?B?ZHpGMExUK0dFSVJUbnF5dExhVklPWnRuR0V2RmJscTQ5Zm0rejNPRmw0NEM4?=
 =?utf-8?B?Slg3eXBjMW5ib3YzbTY4MjBMZnRZazRwYmVoaG5GdXhybVpWWjNpTk5pZXpx?=
 =?utf-8?B?bzd0Nmw5TFJFdFE1cE5FbGNyTC9aSnViVERWeVFTdGR5eml4SVpodzVpUjNS?=
 =?utf-8?B?eDBhNmkybG5mRmM3aDk3R1QzbEFVb2FrMGw1akJrMjMvbkxCeHhSNDdnT2Yz?=
 =?utf-8?B?VkZmMktSRzF1TmpqWG9aWlBPV3ppTkhWZExvY2F5TWtmVWc4aldoOEwvZkhY?=
 =?utf-8?B?eXRHRUVJbDBpTlhXQ0FDdk4ya2NDdmd4ajFMcndzSUpCbUpsVStLandISW1B?=
 =?utf-8?B?UllJV01LQUNSUTU1eGtMUlZIczRIMGN3enAzS2M3ekordGtmbElqYit2dW5J?=
 =?utf-8?B?TDNNaXlFQnBrVWo5Y2t3VEI4ZFBWMjFvY2Flb2QzMHFDUFVwbjlSbTZlaTVz?=
 =?utf-8?B?UytYWFJENHdocE9MalZpc3paSXZFMTdya3FyLyt0ZERZSE83Z3RCVzBMUEpz?=
 =?utf-8?B?M2w4ZGZQeWFOb0R6NmNZdGg5dVJaT21Tb3NmMkx1cnN6bzdQOElkM1NwK1FL?=
 =?utf-8?B?WGdMYWJKb3ZVN3MyNzJ3S1R2eXROYWE5WDZIY3JjNjJ0Znljb0pxTFA5T29x?=
 =?utf-8?B?aEZXeHdmMXlmL2gzMVJ4TVpBMk9wV3d1bnBSUkFuL1g1cUdPZUIzWkVZdlRq?=
 =?utf-8?B?VnRTdDZDNjFmSDJWNUVsSy9iV1htVU1hVk8rYk1BaVgyVVVxc2tuZm5NL0Nq?=
 =?utf-8?Q?JK0TbIFPsIz7bkKfmMTU6PFEePg9Dj7uGeFHQKP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e536f2dc-f18f-4eaf-23da-08d90a58dd69
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:23.9378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: graa7fVok9c6Wfw16hWihlMa6EJtYgq0qrazD6d6zRybnYh4fLFoe4xepiJxt14dpyGeRHgd1IUoYNdm6w1Tbppamj/eBMORaxPcgmbOHZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5909
Received-SPF: pass client-ip=40.107.20.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/unit/test-bdrv-graph-mod.c | 116 +++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 80a9a20066..a8219b131e 100644
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


