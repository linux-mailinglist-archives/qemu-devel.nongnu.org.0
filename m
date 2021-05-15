Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA655381930
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 15:52:17 +0200 (CEST)
Received: from localhost ([::1]:44042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhuiH-0007jf-0F
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 09:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhue2-000702-Ne; Sat, 15 May 2021 09:47:54 -0400
Received: from mail-eopbgr140105.outbound.protection.outlook.com
 ([40.107.14.105]:13825 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lhue0-00039c-S3; Sat, 15 May 2021 09:47:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QujVobE4DsnCoUmRIrbLhfziNEvfXY3i+qU2pYf6siMXkH55f76J4EIk7ny0PhW6tn+Tjo5p5oS5HiB6WJnzlceAm2/yIMac63++ez5v98eFK/3ACUV6LbzJCrcce40dEbU2xbr/knYAdu0n7uRgdJmzfy63wcry4yELVihOWZBHkOYqPFtYdGVuPl8I0JRMU/fUHy924fwJySUqd6nQjR5VGt1HWKVieGsWw9vGJYyTv8QTyCV4+qOXoXvewcvF+sZZBGXTqXqjsRu8r9ULb3id2lURR9VafmuMDsggDNEtOjxisH//M4JlGKrJNXDEqSA+clfLlNliHrvMqiLFUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyjbEBEqY3tZ/0KMh6AlHm7+4ZAj+uuDS+g7uoSfyRA=;
 b=Jni2TTxXU9ywCIb0bgNx7AIZQk0K0ymLdHCQ9/p9i1OxbCy4rU/pOHfEBWwGIn86nbu3pLuTyfNHzX2GmLQWWx0FrQp7syfIIDRIpDWLFxMAw0C3OpOn7tXKk6mPu/v2Hea71CUiTNNC7nFvEubGXmA51AHggz0u8OPGDIZPOGOZ5m6KzSg17f8gBpRgyoFOVZm2aleHrpA0MLQqFi7CJ+UfQVBqcIyx401nq62LF8q8I9SQtippxhnL4gIMxuUFwqZALcE9VV3UXn9i1yFottxwfAjVHfABMGNujRC07w/03CfQfnHgk6pBnKQvSnjaCa4luzHqLn7qNnbi8jnQqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyjbEBEqY3tZ/0KMh6AlHm7+4ZAj+uuDS+g7uoSfyRA=;
 b=VAl0bLHQiwG0OSBkYOoRNidqafDZiXxH/Xd01Qk7SmbToCm8geNBiYraiqAVFNbQQTLq4VWBJ5BbDel97gQOxb8YYQYYZ5xSesvSH9Rts9CkZhSCcFkbkL4LMDyizagy+E13D98+n8KgSycLZgzeTFIJxEXIBKX+X00U98alAt0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5206.eurprd08.prod.outlook.com (2603:10a6:20b:e9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Sat, 15 May
 2021 13:47:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.029; Sat, 15 May 2021
 13:47:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 berto@igalia.com, vsementsov@virtuozzo.com
Subject: [PATCH v5 6/9] block: move supports_backing check to
 bdrv_set_file_or_backing_noperm()
Date: Sat, 15 May 2021 16:47:02 +0300
Message-Id: <20210515134705.433604-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515134705.433604-1-vsementsov@virtuozzo.com>
References: <20210515134705.433604-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.249]
X-ClientProxiedBy: HE1PR0101CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR0101CA0003.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Sat, 15 May 2021 13:47:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11809077-b6e2-492a-87b4-08d917a7fb54
X-MS-TrafficTypeDiagnostic: AM6PR08MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB52063B96B2E22A6F0B3EDAB1C12F9@AM6PR08MB5206.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t3sL5RT9T9Q/UQtXLXR0gNoKynRu/4vRl4wWOhIL/k2GDCcM+zxjO7G386OKHtns3/EWQZ49CDjX1yjmh4XnNzBunMWYKEbV6B2ffvlw+SpvzXKn0kgZx/9RE4o23YddMvkqCdouC4LstB1kGppuh52fYulj75h9d6p6pL1HKlGD3ZgE/fMnKjRRX83WbbsIBsQ0vLi4imwlxYkfSdKt7tg9iuDLMhcJUMrdFQWg529NOuABNnZiUHHnK2qsBe+vWILlBVR+5QtYPDWY2X72TUhGdkqsWhqCyrdmEfjaBoo8p/CWsNcE17czPPVbNYe61R6qQPL0l+HMvZ065Kw9ofZOddQQRV2XzziUZlg6uQxYuEP0VSxUnCFM+AEfOX3TAoSMVCqi5UCxf532Z6WjXAtTMdKrrXJvHSKZxZXs+N/gFmp4iGNP9X39u59qSB6+MvJ4s/9rxF+TMdyoKMTfXOvdmbjuuJ7r3KuD3e+TAFgRj0ytekVGQefCh2AFDpLSEuYqrM8UtuAzlc4gZDi4IWOKepXxcd/ScRwO4iR0egazNtPIKFR+FnnFKQqYaAq9Utm5xFXyrwX4ElgaPh7aGvJ4gjgg8eJDAOJqNQ2cx6YKlm6+4gy8mdl2kalZhK/lYs2Rcv9csIGapGw+mYdWlp0EmhFr+3+GEaUjxLsIG0xwMPzcCXIl/zLLwMeVL1o1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39830400003)(396003)(136003)(376002)(366004)(6666004)(316002)(6512007)(26005)(66476007)(66556008)(66946007)(6916009)(2906002)(38100700002)(186003)(16526019)(478600001)(107886003)(38350700002)(956004)(52116002)(36756003)(83380400001)(2616005)(86362001)(8936002)(6506007)(1076003)(8676002)(6486002)(4326008)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OFUe9vYge+uyv+OYYysqcSh9EyKiZkpVkj9qwEaXm6cWwMnWJidxJ1QI9L/o?=
 =?us-ascii?Q?47WFeD5icMZpotNtpBXeysWBSXfWwzu1dg34Yb3WT33JxQaJ7V5P6mPaRaps?=
 =?us-ascii?Q?re46DB51iMGDH/L8tQL8lZsJ+ZfnH1fBzdtGDB03SNayJitket+ujVNPqCbQ?=
 =?us-ascii?Q?VlAUMEpXxJB+SLidI40XT8njTnPFA+5JMjE05Sz2ziVxN+tv47bbGjoJxOvi?=
 =?us-ascii?Q?vmWLIciOCVD16+gzsF8CZ8ApH50wIc79lXkXviSDR8/W4JYX60rRUmtUkriI?=
 =?us-ascii?Q?yLUNj7z5gzSTfh0LX874yERB+E861J8tkMyoTat6eMRIvzzHE1bb6VRl5hmV?=
 =?us-ascii?Q?xZz7b/7mQsR4OLqBYWmwTSUEmQNTBvcN3lsWwSK3VDTHbwI9Ftfe+ZRphICN?=
 =?us-ascii?Q?X+Qns68emQNdYva42S6qLgAYSHOti2Q2svB2O/WEXm07O1hjzLxNQ1F6aqTg?=
 =?us-ascii?Q?SSON6QKoM2SZbZgEDtFcxKPR5b8WDmzsY62UupP7VzXTl6wBcEe7bY0C8VuC?=
 =?us-ascii?Q?qUu8KUsnjpjB594wWSdwZQpfsXKvqpEEAkUPKPKR5QWoWbTfqCVFkebYAKCb?=
 =?us-ascii?Q?Fa8XKotkbPMZbDx//sLxUUSESuh7x3EC61h5+3qIxenA8CdlwNgL5LOWVaVN?=
 =?us-ascii?Q?oHuwdgW6lvkPPYWWDEOmURkt3uGftrrIslIoVrI6Es23iE9tEM5pXB1LgQaK?=
 =?us-ascii?Q?ceW/GH/hCPndGIZJG8LCI50nPJNxAGlGMOP0cycAqkGWR/Lq9JW6fEHq+bsB?=
 =?us-ascii?Q?8wYNJCVnDjYMg9DZCZI5aSWGmbnUjYIxHbDyURw/7qhTb3KVQDgSuOgrR2J2?=
 =?us-ascii?Q?Tlw1mM2OsP5rAHhM6DfMml+wU8ksGEQwQ0CDzo7TymcIl2PEol1zqP+vFfrB?=
 =?us-ascii?Q?//vgxxillY+bqtY5blBykXW3qb5SdTejn7RHEkyhzqtmFoTiDw26uwQesd9x?=
 =?us-ascii?Q?4Ar6Q/sbj5o1waXBi5ebsLtxknF+mo+rOYWIDvKdAcBEjrA+GeRu5bfB1Ql8?=
 =?us-ascii?Q?d9O6Cl6kpeT9VRwsJRQb7dsUV0UOTlq6qpSs9KTXMWHrwyA4rQF0xhqSKRQp?=
 =?us-ascii?Q?3bfek8HTEA9nugH/i4LcJKPJNk8J/HcUZbAe/O5A1GIgYnO6c+bluYhFg840?=
 =?us-ascii?Q?ByUtmts4GfzVxlyUHasFAf0KCcLQuCwjKhaFDaA79VNKA2tTZWRICi2tekgs?=
 =?us-ascii?Q?jTXOV1AgdEMFbSj2bC041j+HbSdQiTMqGNkPzM9BBhAhfPr4eMR0NXvXXmv+?=
 =?us-ascii?Q?OEJAZ0E4xguh2s1jLcUJtDDFOwkBafRGjMPo2bNzVrfYQnvPY0919Dm3D4pb?=
 =?us-ascii?Q?Ty4h3djirzDQyqejOpZfSFgg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11809077-b6e2-492a-87b4-08d917a7fb54
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2021 13:47:29.4707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eg4veZRDSMuT0IMpacqBcPMtJLt4dwixXdxmnTin35GiUdG1Xz+q6Hca23cTQQInjGRst3WGGzUzyUMbnVptmC71zWnYv9LcVNoslOy/Q8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5206
Received-SPF: pass client-ip=40.107.14.105;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

Move supports_backing check of bdrv_reopen_parse_backing to called
(through bdrv_set_backing_noperm()) bdrv_set_file_or_backing_noperm()
function. The check applies to general case, so it's appropriate for
bdrv_set_file_or_backing_noperm().

We have to declare backing support for two test drivers, otherwise new
check fails.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c                          | 29 +++++++++++++++--------------
 tests/unit/test-bdrv-drain.c     |  1 +
 tests/unit/test-bdrv-graph-mod.c |  1 +
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 7d208c708d..d90b35f8f1 100644
--- a/block.c
+++ b/block.c
@@ -3127,6 +3127,14 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
         return -EPERM;
     }
 
+    if (is_backing && !parent_bs->drv->is_filter &&
+        !parent_bs->drv->supports_backing)
+    {
+        error_setg(errp, "Driver '%s' of node '%s' does not support backing "
+                   "files", parent_bs->drv->format_name, parent_bs->node_name);
+        return -EINVAL;
+    }
+
     if (parent_bs->drv->is_filter) {
         role = BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
     } else if (is_backing) {
@@ -4253,20 +4261,13 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         }
     }
 
-    /*
-     * Ensure that @bs can really handle backing files, because we are
-     * about to give it one (or swap the existing one)
-     */
-    if (bs->drv->is_filter) {
-        /* Filters always have a file or a backing child */
-        if (!bs->backing) {
-            error_setg(errp, "'%s' is a %s filter node that does not support a "
-                       "backing child", bs->node_name, bs->drv->format_name);
-            return -EINVAL;
-        }
-    } else if (!bs->drv->supports_backing) {
-        error_setg(errp, "Driver '%s' of node '%s' does not support backing "
-                   "files", bs->drv->format_name, bs->node_name);
+    if (bs->drv->is_filter && !bs->backing) {
+        /*
+         * Filters always have a file or a backing child, so we are trying to
+         * change wrong child
+         */
+        error_setg(errp, "'%s' is a %s filter node that does not support a "
+                   "backing child", bs->node_name, bs->drv->format_name);
         return -EINVAL;
     }
 
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 892f7f47d8..ce071b5fc5 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -95,6 +95,7 @@ static int bdrv_test_change_backing_file(BlockDriverState *bs,
 static BlockDriver bdrv_test = {
     .format_name            = "test",
     .instance_size          = sizeof(BDRVTestState),
+    .supports_backing       = true,
 
     .bdrv_close             = bdrv_test_close,
     .bdrv_co_preadv         = bdrv_test_co_preadv,
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 88f25c0cdb..a6e3bb79be 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -41,6 +41,7 @@ static void no_perm_default_perms(BlockDriverState *bs, BdrvChild *c,
 
 static BlockDriver bdrv_no_perm = {
     .format_name = "no-perm",
+    .supports_backing = true,
     .bdrv_child_perm = no_perm_default_perms,
 };
 
-- 
2.29.2


