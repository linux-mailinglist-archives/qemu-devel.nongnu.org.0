Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0464AC6B2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:03:30 +0100 (CET)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7QG-0008CE-Uz
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:03:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71d-0001y0-TP; Mon, 07 Feb 2022 11:38:03 -0500
Received: from mail-am6eur05on2101.outbound.protection.outlook.com
 ([40.107.22.101]:1216 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71b-0005Gz-3B; Mon, 07 Feb 2022 11:38:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcIn10nWh7WwWH7NQeKIWMA3FjjF+yCZcqp43jtiSap2vVA5IKheZq/vOBBtTaP4YXSDp/R8nNC0CURuqWMPVrSJ9H1X/1+0izpLWS8Csoy/CmwQWx5EnrfxKlFt7+Mf97h2lNF2Jqfz51j7+IYTYLULmW5ncfGnXB1XO2Kq5GO5U13gnjXemY0p450CRZuDVrcW5Sk7U5Ymm6mpbhRhHjJqp7pOv+/G/JMAW67V1JSXtmRTvVVXRvrw9DAm3+UyJ3+0n0fo/46ismRq/bcnU/KekDfCWcNfJp9cYlCTLZLI8QVIDCicUEcsFf1YBB5ooO9sETmtGvkGB0qH6vvsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teNNot30Je7QmN/Gb8CSjZ1foW65qEOEJ6yy/d50Eho=;
 b=d9y407Qe8LV1hLYg0eDmXkZqUf16/y8kTkTCDXYkq55wGdJla1i+mEEvHROVAaFMzchTz4dM0NLxfhD91YjZb63MqImh7bDuwTNZXIYl4bwCCWT5kOLzqVfwNwBSCYvoVuvpLer1Md5uOmHA60wvMTOddJ5U4v6SvIzHi/Ta0hJDe4w52tC/odTKN8c2cLsiUAgdzddMU8+sBIfYZkpxEcdlQwjc3JQJDmg6uJIQRRVaaRJUoKXShSKJ5g5XqehIakwCqizoC3TDCNOiAPRx1hfJKID3hNVLr6lmnVvwAbKf0ELNfb5l9Km4GtO6+i0CGyu1mGIHToANGI55hHW3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teNNot30Je7QmN/Gb8CSjZ1foW65qEOEJ6yy/d50Eho=;
 b=ZlPvjwpKo+bD4YPzJ4gbj9uIPUqSLuqKUpbIVx+Ck3P/ExHxcLYol4h18Uja/mIRbA8azdTQniyKt9mrT3z+hFodEE4ouGPpXiXTltEvUhKZXIbW57fmmBDgkd5KuQ65q5ZMQdG/jyqjQjZHS5C8942ybuDvXXb8w9Wn7DqnSp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:44 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 11/14] qcow2: refactor qcow2_inactivate
Date: Mon,  7 Feb 2022 17:37:25 +0100
Message-Id: <20220207163728.30362-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6084d552-2fb9-4cfe-84bd-08d9ea5829d2
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB228872E5AD3BDB3AAE668108C12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:26;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YtxZ3gBOjQDrJS8dl6zKNAQkq6o6Nzr2bvfs7nNuv9hiiqiHx2njWpJDbG2Gk4jhhT16E6oz/oannwncMtbAfFNi2S7GSz6BL/Ri5DjElJiPzJLcrlwkr8QawlIpIcxvWjz6C76P0EPxOGUzl2IR1NU0MEkjFGQ60RCdwKFs6jYmI2tTxzVSzpEPBbH7+GNn1+BuyIytmPGzFRlpM/YSdh4BGBwCxt2DbK0IRa6Qqhh/bTE2RNO8Op2Ivjs3dwx+xlYYy817Gli15n7I6+XWj+91C5SSeT6GAYGGmvQfyNnHsI2WjJvrOBlG3anBHumCmsRRGpVxbxdDks0L9dtssK29hy2yzwnypu85/yHWu0FTBZYE6BN2M1ATrSLrV49jRFWX0WKv5R9aIgOydusvBDWDnVYpFRoh88+k//gPOrj4XKnomv0sUMBVJK9Zhyh4NnArLpfEiSIHVXh+yv1gORPptOOSQhgwdmUhgEJKkvbhO80lHV+6idd5Kqx5Yb8xFRG9OqT1rty6U3A/QBz9d8xUtVzGiqMoXTQFKpJ3OpbzNUG3tm0IT+DkPrnkrwe0jaa2PcWthu4EwR57OYn1CcJn69wTsAvqQJv2/qVqaW+zm0whA0QBRudlKnDvcXx6rt0h8+Kio61qT6mm2cPEoMMbOmBoRuBVFns1qgZxDuUO1AOBzjvGVAxZCoqwLg8YihgvK7GxXtj9OUKZ752WWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kRtsmRdMhzgCbQQuFVyHJDZqZ26HT5cai30+aACnddCt3cHXDbtggNY1dx/4?=
 =?us-ascii?Q?7fssGPYkqhOPO/j/90+Z3aFgCg5okIg7nhSJ8opug9S2oAb6l6CvcMGDYXfc?=
 =?us-ascii?Q?WcqknVjGXcIlGF+Hfblb5LtBpuMUmXWPU8Rn6/rpfY6WFei6K24gAhPvFGdf?=
 =?us-ascii?Q?wIybDD+W7rwd0U5h1808z4zoNznStF2IbIW+lBkxY0SKCri1rCFKBowRgXTO?=
 =?us-ascii?Q?q27ZzzZ/JVfsAKyI7jTGvTOI74UIftHRLoDKeNMjiOjhDzVEZ13lluML/S34?=
 =?us-ascii?Q?kQYR+Ohett4/LnY1i2A1s6sSIwPUT6o9m8ZNPbgT+UMPKEE6PtdeJoQI+wFO?=
 =?us-ascii?Q?G2CZWG37oQdVocGoG0J+LUtSclpi72vKB10kMVPQAviv10qd4kTg21yUB9D8?=
 =?us-ascii?Q?mBWxRtBcDROZaCHgc96BLGElrUTGxDyL1n4ICx/gYxx0Ak5SaMppSTu/k7Ep?=
 =?us-ascii?Q?bPVgC1Gi7ztNW7DKGvEHsMxVn/X2PayQPc/eF7+HRZaCQy4tlMssY2aF9qvy?=
 =?us-ascii?Q?f0j4h6D1wsv123W7CrGKW1+KJqvXdTHBJwGMLpLg2x4QtyjUIlgzEL8cucxX?=
 =?us-ascii?Q?XlF14yR00ciAh1zOUeBoQske4foSfftg3A1RR5Jyw5zzfIuKkbjQEklXs2Wt?=
 =?us-ascii?Q?7WxgqHPWth95xLmpzJidP7J9GT6ihlnNVB7OgTWTxO1mXzLvrijztNjhGU+Q?=
 =?us-ascii?Q?MUT9n6HwD11PTD2J4vleLJ9Il0Ogu0KYRtocEU4tdwdPM6gaTq4Gs8dbbnE8?=
 =?us-ascii?Q?fopvRRh0Cr5ll4RFWRgNE1Z21UUoy2V220djYz3+Yjgbo/XEAEhI57CYQbRk?=
 =?us-ascii?Q?C3Xd6quOwJeUhGU5vLp72W+uao35ZM+jpECvhfZU87R72iC+CSbjNcPn088d?=
 =?us-ascii?Q?i/uH90fENdXQ0sGPucBkVgrB4Oe0nVS9WRW+NTvTjUUrR7f57ZrYbNCZONr8?=
 =?us-ascii?Q?7fYAJqGbTmkeNkzLpXTag8+UbwwJBEGsONDXuRMDRKsndZV6ABwWmP/lKeQS?=
 =?us-ascii?Q?sLUasFEiInahP4jfyyUO3io54vtnJKrPi9Y8+NGzA0W4AOHfLsI7C/oBpPj6?=
 =?us-ascii?Q?8T8kSPJf069SQIAUfbMa9PDcM4BfKBxBrhwnrIKBAOaZBHswDsqPMhO8QrSI?=
 =?us-ascii?Q?hk0VLnT12DIryI3+r0utYmFiR6IJNAsYBeaXwxr8F/aZBo55qR8fFI2JAC4l?=
 =?us-ascii?Q?luCpAxevlwlBwLCOq0roKpL+TlUgVzmt4a6D+9EmiKXITusHjXzzBQsAQLYu?=
 =?us-ascii?Q?kk0qO2AtbK+bPk04p5/5obEBPU2oJqs71HnIj9VENwyj7J9mq+pAFRIZDX9V?=
 =?us-ascii?Q?g3UpiZ7JdTyl0/D3HntVPu1G1GM4jSlNHcTrHZr7ljQMLKfqloPXYM199xBa?=
 =?us-ascii?Q?DO9ZdxqfyYZYMt4b5FfKcYYLhRcnhWRvN8MBJduiz9tnMnYeMMFAuAdas01y?=
 =?us-ascii?Q?Q3rbu3yg/MHonf1SvlmNn3VbjWDW9nCEGpVZfR4P6rnC+uO8ZEbocU8Qd7Ar?=
 =?us-ascii?Q?JxLMOXI9QEh+NGzGl+Ez1pWKJlVn7wJ2I41ZG/jEVhDcF8lgy4+6IZVP+Mox?=
 =?us-ascii?Q?o3/rGH12zBHnYGx3Nn3t71ygndYYd+bIioGj18PM+tMYf8cOoH63FIaxcOIs?=
 =?us-ascii?Q?98ADhHBRkWajbGAklw7eGG9HalECbznKR8DZe25MipPmgovPXLFXwB+VvtCr?=
 =?us-ascii?Q?maUHUw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6084d552-2fb9-4cfe-84bd-08d9ea5829d2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:43.0413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6RxjeoywL4P8T5KBo2iYOM9DhUq4Th6EQO3z41nUFuwyeYdAkJob2QPMwnG28h6YCvOc+X+7RSgbLZjLRsWKq20DjmQQ03Yunp5yKpF03U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
Received-SPF: pass client-ip=40.107.22.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Add a possibility for safe behavior: stop on first error end report in
in errp.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index ccfcd0db05..8ad555feb7 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2678,13 +2678,29 @@ fail_nometa:
     return ret;
 }
 
-static int qcow2_inactivate(BlockDriverState *bs)
+/*
+ * With force=true, ignore failures and just print them. Don't set errp, but
+ * still return a value < 0 in case when something failed.
+ *
+ * With force=false, return error < 0 and set errp on first failure. Nothing is
+ * printed.
+ */
+static int qcow2_do_inactivate(BlockDriverState *bs, bool force, Error **errp)
 {
     int ret, result = 0;
+    bool ok;
     Error *local_err = NULL;
 
-    qcow2_store_persistent_dirty_bitmaps(bs, true, &local_err);
-    if (local_err != NULL) {
+    if (force) {
+        errp = &local_err;
+    }
+
+    ok = qcow2_store_persistent_dirty_bitmaps(bs, true, errp);
+    if (!ok) {
+        if (!force) {
+            return -EINVAL;
+        }
+        assert(local_err);
         result = -EINVAL;
         error_reportf_err(local_err, "Lost persistent bitmaps during "
                           "inactivation of node '%s': ",
@@ -2692,8 +2708,11 @@ static int qcow2_inactivate(BlockDriverState *bs)
         local_err = NULL;
     }
 
-    ret = qcow2_flush_caches(bs, true, &local_err);
+    ret = qcow2_flush_caches(bs, true, errp);
     if (ret < 0) {
+        if (!force) {
+            return ret;
+        }
         result = ret;
         error_report_err(local_err);
         local_err = NULL;
@@ -2702,14 +2721,25 @@ static int qcow2_inactivate(BlockDriverState *bs)
     if (result == 0 && bdrv_is_writable(bs)) {
         ret = qcow2_mark_clean(bs);
         if (ret < 0) {
-            error_report("Failed to mark qcow2 node '%s' clean",
-                         bdrv_get_device_or_node_name(bs));
+            error_setg(errp, "Failed to mark qcow2 node '%s' clean",
+                       bdrv_get_device_or_node_name(bs));
+            if (!force) {
+                return ret;
+            }
+            result = ret;
+            error_report_err(local_err);
+            local_err = NULL;
         }
     }
 
     return result;
 }
 
+static int qcow2_inactivate(BlockDriverState *bs)
+{
+    return qcow2_do_inactivate(bs, true, &error_abort);
+}
+
 static void qcow2_close(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
-- 
2.31.1


