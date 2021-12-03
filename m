Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3228467EDD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:36:02 +0100 (CET)
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFHl-0001LB-T4
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:36:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8s-0000uj-5C; Fri, 03 Dec 2021 15:26:50 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:14661 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8p-0001cv-Bw; Fri, 03 Dec 2021 15:26:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1tuwxQ0mTDEu5jvvoSA8wvLsSbKKqOsgGPqxl42vogGcc41X5+eDLRFqsWxDyjrsdKGQKkgrOTZQxUJfPkWhWWeyjiTafGUiMaRcS03UM/1PPxvl5Kpx4dgMJdCVcGMBydeEapHPSvY+8eVHdZfKLCB2tbSStra2V4TEaftoNGjyVno7ncHWAVADNO2nVnX9IrhRHbBGlop7iksJP2dvX+ECqwiOb3Svgs45LDDZSJEtC14dPk365D5L7bvQDbSK84Bk70V3yPsQ/FPXr/oiwpISiEql0fvZ3zx29266HDWRA3N8b4fnb89M9ja5YaI8LTldx6wD2KmFNR7YEf0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ru2Qyekc23yNTSSZ7f+D4q9vcp3smdZW3BCxktVLiMU=;
 b=FFCeMP2cM1dIHkkmHXvVwtvHP3VnHVMhJ3oSv7KhtlLzEUB6QK0bngQJG8eV7tzOPtXjqUpfwQJQ+Bz6YSIRhvttrEV64jCvghIeAhMsVKPQSgzWSF7KZ6MDj9WrLYkA9AphDbvENEA5qROkcqiAEg7AtwDDILKVebuIxdqpJ/lnOPzREGAFMpB1Qx2UvVWVzyM4M5wjOZae0D/YaWuQVEDqyd8USq9+aJQMrC0F2rfkd000V7UMZNTv10BYo9mwZAi5D6Tnto1bMkewWcXDE0NjzewRbZ48geb1Ik6zwuT+YiZo3nmMy/HNHiy/a2e6+ecdjYgVmBbMwNZeSq5ZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ru2Qyekc23yNTSSZ7f+D4q9vcp3smdZW3BCxktVLiMU=;
 b=C6SsBQD/oZr1loYorjEMDpBvv6926RIxz1fz1/Js4CztGtBSMeSAYcbpN8HdC2afIE9q2dorRZSy2mC7DsVO5jwxwWLOfaZhjT37quZUFM6d1EiLrab39/jfqSL5BEvdX/DLWm6EKgpGvr1OzUJJMONs5Vr2zUV2Jt4jXygTDK8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 20:26:20 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, Alberto Garcia <berto@igalia.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 04/14] test-bdrv-graph-mod: update test_parallel_perm_update
 test case
Date: Fri,  3 Dec 2021 21:25:43 +0100
Message-Id: <20211203202553.3231580-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05cef809-91fa-452c-6a87-08d9b69b2a2a
X-MS-TrafficTypeDiagnostic: AM0PR08MB3841:
X-Microsoft-Antispam-PRVS: <AM0PR08MB38413C5DA8AE9127E160EB3BC16A9@AM0PR08MB3841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U6NvLSbLUE2HEv11V8w3lAUTg70aLbCX8rTXNnmsMCI1RMdesTr+F5H/tv8yTq0UY5RN2cXA3zwwBMIz/jWIHZffcY2yqjr+RyFTKd8OtTxq/8pdVOabNbMq6GGZbMgMzOipj8pyLE0IEIzdHKHwLaTnzV8OAjyWpRmwJvpkeHLpXPs2WxTOvork89NhWFczlyF3TgVHpSCzGkDFlTB3LUiWstgZGEdECR2yR1vcWhclSvbBNtOji8TwCix6GXJPyJuAoh/ks/r/+BWIvHx3bzGwJlGYKK8xSJ8yznpaXzeDGTaocEEqdCgrO63nawPISklln/xvPoFiLLOtg4K84+0k9LGP6EdRuVAwpFlUXaSE5linaKlIJFymGqScmivhmG0ZxIQMJDlBYI+beYK1U9AXG09j372+bM4SqGIsUFIOeRKXFslMbDhOerSakBgUYWR6dn6y/CFMaUhPZkgXRos+b4t7qZNVlkzdcS2fsXZSR++iQAoaA/RFID35f7vKYzJTFayixUBde25NEjhkxNRORYlBOeT61E4JUwVCEFSmexdm3aNmkN91x+pD+faeJRpLJRp7i/SwtAVtatzRSXyK/GJmNKukZnbukgA2ooDfXAY8NqXRzm6ot1NguuQ14no7Ut5dsODmgKnI3QDikz206rG2F9+JqxNGnbAhoj2CK0nEPr9s8bIaja4UQRwKZFolCRgvC/TY2onxFRXxnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(2906002)(15650500001)(2616005)(54906003)(6506007)(6916009)(1076003)(66946007)(26005)(36756003)(6666004)(66556008)(6512007)(52116002)(38100700002)(83380400001)(38350700002)(8936002)(8676002)(5660300002)(508600001)(4326008)(6486002)(316002)(956004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1MzdVYvTE10SjE0cnc0RjRTVURRZVNCdGxNVGhNVmtkMlUzeUFBMEN2aUZX?=
 =?utf-8?B?Y1E0cXY0cVFWY0loTW9PdURVRVEvTVppeDc1MmRucythLy9wbWRNMDZqQzBC?=
 =?utf-8?B?NTd1ejhIUitkaGROQ2FzTGIzUk9aVlM1clM0dU9GTjh1aUlyazJyNE5qQkt5?=
 =?utf-8?B?VnBQTXZlb3VwSDZaQ1gzUVIzSHhjOXhwNGs1Wk5meDdvQXkxMXhNWWxVS3Z3?=
 =?utf-8?B?bUxidysyL2FSUkJOQTBNbms1LzRiS1NJenI3NnFXZ0Q2MGR1emVsWXVnekFt?=
 =?utf-8?B?L3hnQlZEczVoakdrQkpSSGhSV0ZBVHJaL2lRMHR3alBqY0hFdi9xdG4xQ1FW?=
 =?utf-8?B?ekVvRXU1bUNsd1Z5S2hjSHgrdTRuL0dCaktUMk82dUpTLzNzVXZZa1dvMHR0?=
 =?utf-8?B?OHRwTkZxWjdlUzFSSlBZeTJsMUVmdVp4Vkh0ZG9SdEtTK0RhSEpQTGM4ODNp?=
 =?utf-8?B?c0FoNWdEazJSclpnbHVvUDIrYzMwOXNyUGdGNHVOQW9qdjdldGsrZlJweWcw?=
 =?utf-8?B?L0VZOG9nekxVdTdMVEQ2UHp3eURJc0ZzVHg2K0xKZG9hMG1QOWF3YnBFMTFB?=
 =?utf-8?B?S2RFWkx2ZlRUeElFMHdQUEtyNGJtSmxrOVNPcWIrcE52M3pUZFlwcGZrWFYw?=
 =?utf-8?B?dmsvNHhTdkQxT2F0MmJMQ2ZKQW5lSHJ0ZTEvY0IydGdBZE4vc1hOS0ZsR0tp?=
 =?utf-8?B?bGZsTDM2MjEzTnljT2JRZDQ3VWZCbUVEQi9lME5rc2plaUdXbVovQ2M2aTNZ?=
 =?utf-8?B?S25rMDFUY2F3NGxtVVVMZ0taV3gyZ1FSOGwwL3RZYVdZU1pOMHZMU3dzWExy?=
 =?utf-8?B?Q3MwMGdMSGZ6eUc1Nm9iUytSOEFuUTlQZG1GaE9XZFdDbzFyaWFTWDlDeWR3?=
 =?utf-8?B?QVJ5UEdxTk8zcUxYajYyenVCN0Y1L01xbkVybFdZeHR3emw2QzNjektRdU5C?=
 =?utf-8?B?M3ROaldXS1BjejRTT0VVTEpFOXpiWU55cjMvak1ZUjM5Y1d3TFcrUlo3S3lV?=
 =?utf-8?B?Ymd0YTMxKy9kbEZPT3lPcnRjc3o0TjNLeHpRRzFpWnNucEExaHI2SjducHZh?=
 =?utf-8?B?Z1ppVEJGL25BcHZtMjQrcDl4WGwzTERkVkI0U2ZKQm9peUEzdEdON2JKd2pm?=
 =?utf-8?B?eVp6SkpuVW1MWnI3WFVHV0VuWFNQeGRqQ2pMQUdEY3VvdG1ibEZOMG13emhj?=
 =?utf-8?B?TmhlRmVjRGw5bjlPNkxOTmhUMUtyVDVEYmNwZm4zcWtLOG8xbENzVmt6SE9u?=
 =?utf-8?B?WHBxbEkvRDBKVG1rZG5PcHc4aHVlWnl2QlYwU0ZPbHNiZTk0a2IvaUFwaVhm?=
 =?utf-8?B?aW9PUmxIdHVpVDk2MzY5RmlDSldYNjJnRzllZll6LzJJQ3hqWldWZHBRUWNr?=
 =?utf-8?B?ZjhhUTh6VWl0YkZsU1hQb1JDcmhNbWMva1VnSWZiUDdFMHp5NUpYUnhoNzB6?=
 =?utf-8?B?RU8xbjNUREgycWxNODN5M05oWnpxL05sQ2R3eVk3MU56NXc5Vm12dW1KMmNx?=
 =?utf-8?B?dmNoL1dRZ3FrTlV4MXZNVGF4YytKSkZ5b21VWjZTUHZYQmpNLzBnZ1h0ZFRH?=
 =?utf-8?B?WE0zc1dFTUI1bjRyNVp6Wkp2emNDM1dPeFplTWhkUUJ6V1FWWGdUWHh6VmVo?=
 =?utf-8?B?TVFVM3Jpci8wVEtSSEdUSG4zMEFYSGFkblkyUFhPRmhqbjZvSkQ2TGxzekRV?=
 =?utf-8?B?MHFuZHFuL1RYSXBGTTlmbkhRL0FHdGpWdURuUzdTS0h4TkgwK09GN3BzUTN3?=
 =?utf-8?B?VmNIZGFncDQ4Q2k5bTdVenJHK3dEc0J2U2xvazVQcnVYc09EVXNIaTVBM0Zp?=
 =?utf-8?B?Q3pvUjRTOFhWa2kzcXRHOXRMZ2R1TjhkTVNqWmpCTk14bEFqU1lLSDhDN3RQ?=
 =?utf-8?B?MnREVEFFUUxvQ00yc1hLTnRMa0VlbWFqQVdOMWxyU1IrdXovZHpSc0NDMk91?=
 =?utf-8?B?UEk3QjFjQWhBZmlFMHNlb2hKSHVBRmxJakx5bDhOcG00RjZSWTZUdzRNeWFJ?=
 =?utf-8?B?WkZ0Sm1laGw2ejlXQUhDNWNobEM1bWwwcWwxSUQ1cjVveCsxS3d1QU9BQUtW?=
 =?utf-8?B?dWNFTENiRDdmWmZNYWI5TjFic1NFdjQ0d0R2WjJ0MmVYdEdwclYyd3g0a0xF?=
 =?utf-8?B?WkpWSEZQZUVKcWR4TjJveEVDTHFOSDVLNkxVbU5ON1VnUSthN3BaSmJlU1Q1?=
 =?utf-8?B?TlNEa29tdVBvRk1IV0NHeTlwbGhaWE9uOGNselZuUWowcmpqbk03bW16VDg2?=
 =?utf-8?B?WmdveVpQV0NvV0ZIQzhoNFFxWFJRPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05cef809-91fa-452c-6a87-08d9b69b2a2a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:19.4887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39tT7ypFl1RiobYKKd4vI9ZnmG1tYDDaIRI75ZyWGUP7+FmE+HCRziug54CMrd/8ixSZVACC8BDWj64JinpuTYbjomF7qnIkrzotyvkjSg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Received-SPF: pass client-ip=40.107.15.139;
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

test_parallel_perm_update() does two things that we are going to
restrict in the near future:

1. It updates bs->file field by hand. bs->file will be managed
   automatically by generic code (together with bs->children list).

   Let's better refactor our "tricky" bds to have own state where one
   of children is linked as "selected".
   This also looks less "tricky", so avoid using this word.

2. It create FILTERED children that are not PRIMARY. Except for tests
   all FILTERED children in the Qemu block layer are always PRIMARY as
   well.  We are going to formalize this rule, so let's better use DATA
   children here.

While being here, update the picture to better correspond to the test
code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-bdrv-graph-mod.c | 70 ++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index a6e3bb79be..40795d3c04 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -241,13 +241,26 @@ static void test_parallel_exclusive_write(void)
     bdrv_unref(top);
 }
 
-static void write_to_file_perms(BlockDriverState *bs, BdrvChild *c,
-                                     BdrvChildRole role,
-                                     BlockReopenQueue *reopen_queue,
-                                     uint64_t perm, uint64_t shared,
-                                     uint64_t *nperm, uint64_t *nshared)
+/*
+ * write-to-selected node may have several DATA children, one of them may be
+ * "selected". Exclusive write permission is taken on selected child.
+ *
+ * We don't realize write handler itself, as we need only to test how permission
+ * update works.
+ */
+typedef struct BDRVWriteToSelectedState {
+    BdrvChild *selected;
+} BDRVWriteToSelectedState;
+
+static void write_to_selected_perms(BlockDriverState *bs, BdrvChild *c,
+                                    BdrvChildRole role,
+                                    BlockReopenQueue *reopen_queue,
+                                    uint64_t perm, uint64_t shared,
+                                    uint64_t *nperm, uint64_t *nshared)
 {
-    if (bs->file && c == bs->file) {
+    BDRVWriteToSelectedState *s = bs->opaque;
+
+    if (s->selected && c == s->selected) {
         *nperm = BLK_PERM_WRITE;
         *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
     } else {
@@ -256,9 +269,10 @@ static void write_to_file_perms(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static BlockDriver bdrv_write_to_file = {
-    .format_name = "tricky-perm",
-    .bdrv_child_perm = write_to_file_perms,
+static BlockDriver bdrv_write_to_selected = {
+    .format_name = "write-to-selected",
+    .instance_size = sizeof(BDRVWriteToSelectedState),
+    .bdrv_child_perm = write_to_selected_perms,
 };
 
 
@@ -266,15 +280,18 @@ static BlockDriver bdrv_write_to_file = {
  * The following test shows that topological-sort order is required for
  * permission update, simple DFS is not enough.
  *
- * Consider the block driver which has two filter children: one active
- * with exclusive write access and one inactive with no specific
- * permissions.
+ * Consider the block driver (write-to-selected) which has two children: one is
+ * selected so we have exclusive write access to it and for the other one we
+ * don't need any specific permissions.
  *
  * And, these two children has a common base child, like this:
+ *   (additional "top" on top is used in test just because the only public
+ *    function to update permission should get a specific child to update.
+ *    Making bdrv_refresh_perms() public just for this test doesn't worth it)
  *
- * ┌─────┐     ┌──────┐
- * │ fl2 │ ◀── │ top  │
- * └─────┘     └──────┘
+ * ┌─────┐     ┌───────────────────┐     ┌─────┐
+ * │ fl2 │ ◀── │ write-to-selected │ ◀── │ top │
+ * └─────┘     └───────────────────┘     └─────┘
  *   │           │
  *   │           │ w
  *   │           ▼
@@ -290,7 +307,7 @@ static BlockDriver bdrv_write_to_file = {
  *
  * So, exclusive write is propagated.
  *
- * Assume, we want to make fl2 active instead of fl1.
+ * Assume, we want to select fl2  instead of fl1.
  * So, we set some option for top driver and do permission update.
  *
  * With simple DFS, if permission update goes first through
@@ -306,9 +323,10 @@ static BlockDriver bdrv_write_to_file = {
 static void test_parallel_perm_update(void)
 {
     BlockDriverState *top = no_perm_node("top");
-    BlockDriverState *tricky =
-            bdrv_new_open_driver(&bdrv_write_to_file, "tricky", BDRV_O_RDWR,
+    BlockDriverState *ws =
+            bdrv_new_open_driver(&bdrv_write_to_selected, "ws", BDRV_O_RDWR,
                                  &error_abort);
+    BDRVWriteToSelectedState *s = ws->opaque;
     BlockDriverState *base = no_perm_node("base");
     BlockDriverState *fl1 = pass_through_node("fl1");
     BlockDriverState *fl2 = pass_through_node("fl2");
@@ -320,33 +338,33 @@ static void test_parallel_perm_update(void)
      */
     bdrv_ref(base);
 
-    bdrv_attach_child(top, tricky, "file", &child_of_bds, BDRV_CHILD_DATA,
+    bdrv_attach_child(top, ws, "file", &child_of_bds, BDRV_CHILD_DATA,
                       &error_abort);
-    c_fl1 = bdrv_attach_child(tricky, fl1, "first", &child_of_bds,
-                              BDRV_CHILD_FILTERED, &error_abort);
-    c_fl2 = bdrv_attach_child(tricky, fl2, "second", &child_of_bds,
-                              BDRV_CHILD_FILTERED, &error_abort);
+    c_fl1 = bdrv_attach_child(ws, fl1, "first", &child_of_bds,
+                              BDRV_CHILD_DATA, &error_abort);
+    c_fl2 = bdrv_attach_child(ws, fl2, "second", &child_of_bds,
+                              BDRV_CHILD_DATA, &error_abort);
     bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
                       &error_abort);
     bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
                       &error_abort);
 
     /* Select fl1 as first child to be active */
-    tricky->file = c_fl1;
+    s->selected = c_fl1;
     bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
 
     assert(c_fl1->perm & BLK_PERM_WRITE);
     assert(!(c_fl2->perm & BLK_PERM_WRITE));
 
     /* Now, try to switch active child and update permissions */
-    tricky->file = c_fl2;
+    s->selected = c_fl2;
     bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
 
     assert(c_fl2->perm & BLK_PERM_WRITE);
     assert(!(c_fl1->perm & BLK_PERM_WRITE));
 
     /* Switch once more, to not care about real child order in the list */
-    tricky->file = c_fl1;
+    s->selected = c_fl1;
     bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
 
     assert(c_fl1->perm & BLK_PERM_WRITE);
-- 
2.31.1


