Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECDB3D0C63
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 12:26:38 +0200 (CEST)
Received: from localhost ([::1]:39740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m69Qy-0004BA-SO
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 06:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697a-0007Rb-Ej; Wed, 21 Jul 2021 06:06:35 -0400
Received: from mail-eopbgr40103.outbound.protection.outlook.com
 ([40.107.4.103]:23364 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m697W-00024a-ED; Wed, 21 Jul 2021 06:06:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dft5U8roU/scxzc8sN+R2cbD96o+bKklK0cvYYJCEqyzl0OP/HRlCMM0axuSDZGeAuyCkZUXtYUwj+eSq7JP2JYrrjJlp2Mzu/77cbcHqreU/t6nf1CvzpITiMpBkwe7zbXl2N1jkBpRVteroG5Y+QMALVJkv4TB9n5X3RhW3doum8TJRCNSf3nmrnAcIf19Ot5tvTp+QioGfE9LETEsKIvkqiCoJr67iPxhX2de47dPF2RFuAhQV+DceM/6AhmBD9o7mxHqpK2ZmLBySqIcmShP147XKalpk3fH3WD9DOhL1Z8PSIAOHmq81TfiVAkgjP955ANrlSWlJRFYWx6gKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=JDJQQ9CFJ1/qKBEFXZRSFNccUIQkOc92Oa5SSDnS8RRSYcasBEuBVSwVYSBqulQfLNZORlvFw5VK36jK8sfA8pvOuIH3RtHPbodPqhMWn5zNxBJ43jbg9V7aihW+LWqKhogEBg3Wm6hWIIs/LogZFcJ3dZwaG82vtltakyysO/4pkirkA/T3TAMySugNih6O44LUQ21ixuP1ffHCM8S0xzWQNwwqNbeqolPaVFOfPZ/JhLdvyK55IRKGzR9hRP7SHK4nv8T+sSxGmG6PIBwoYveYaTgi+eJ9ux6uEZwG6YmHFjX2iKs/FZtz1hsLJFQoYeUKb1UjNwJl5soh3LTWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Y9zwZ4FG3jmKMdQhuvSmetg9/t2U2WeUmbUBzVXQuA=;
 b=X0b6XmyOV6CGHTUeNAWV8s2JzKPdlUcT9MG5Zo1fAOM/4B2jH7QLzDkhPzaKxAlJrzc3VO+m6bsAwP0QzCLgV0br5uQwoCbfAN4xjUpNdcnaBhocR9kqhVf8Y+XTehqqOsNYb/q4r5Eo+L+fPSPSVFlhIbBlx/q/5Sr8XbCdqVk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5911.eurprd08.prod.outlook.com (2603:10a6:20b:292::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Wed, 21 Jul
 2021 10:06:28 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 10:06:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 13/33] block/copy-before-write: bdrv_cbw_append(): replace
 child at last
Date: Wed, 21 Jul 2021 13:05:35 +0300
Message-Id: <20210721100555.45594-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210721100555.45594-1-vsementsov@virtuozzo.com>
References: <20210721100555.45594-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0701CA0068.eurprd07.prod.outlook.com
 (2603:10a6:3:64::12) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0701CA0068.eurprd07.prod.outlook.com (2603:10a6:3:64::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.12 via Frontend Transport; Wed, 21 Jul 2021 10:06:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dd01b02-8838-4ff1-9f6d-08d94c2f34a9
X-MS-TrafficTypeDiagnostic: AS8PR08MB5911:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5911E745A4B233BFD9EAD957C1E39@AS8PR08MB5911.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cQ+jqTlIPgZ4BrivpvSmf4ibyUnFIkCM/pbtU5lwC8Q5bF1SPNUw45BTYi3Ns25OGGWCZ0C+iDXfYkHCmYOv4Z6UnVglRC/ummEEmErnIBugQk28BPhIb1lwwJpJ4FqHt6ZXKTVxQd2ywDS6aUm3d5UzhCtqEk8MZSQO4uVMODbg2eNMRM18f8elDL8w65RTBldzk2UTOIyOFnPPpj5DuiEqS+YS7Azy4clUm9MBhoE7Hx8B/lmqjAnVvZqCosjMGhSTRkHxfP2ccFKrThqNo6AVukN8v7p1RI1PT2OdPdgM0xb+8PcLPkDMwAID47yePT8fo3vU3wanwnTvANWbpQakaUeXzEm9dzmYpYVtYRpqpsP0jfMJBqPVfxtIz48DkHdir1GROIJZrXZVGy0mUq8PVqwM1HXPg/m/Pphe4iXaQ3Xm2pgmN9wfEkD163k4EODFNMv0qmyHLBCGczJ9cgKs6dgtr7Uj7bXcdPdxvYT8pxPH9Q2pNo30zR2hMA5RXpHPpO5b7luqtJOHvF7/xyygBaNChzF4jrfYpex0eHYMS/TBWNqMVLp4+a6bUkAwPbAJ6WKHMOc0f7iXyd2DUjbqOP5e5e8oYrCAvudKI77lzVEXIVkuZMEdUkM26rsQi41SNFshpKyOoClbqcSc8f1E2Y9Olr04/UeMtlJmISaN75YeyA0v+6TMtSsKlGYmWdMwsgodW14k8vOaBToPZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(396003)(346002)(366004)(136003)(66556008)(4326008)(6916009)(5660300002)(7416002)(6666004)(66946007)(6486002)(8676002)(6506007)(6512007)(2616005)(1076003)(66476007)(52116002)(36756003)(26005)(478600001)(83380400001)(86362001)(2906002)(38350700002)(38100700002)(8936002)(186003)(316002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rk7ZSVrtHv4vbNMXTaLnZY6eHX/q2nrrjgSEjScyIIM7Yi6DSIEF6DrU8JaZ?=
 =?us-ascii?Q?SlsV4mt5jDaCg2K2arKnJJcPdEC7vYLUvBf6fH9zkgrD/5ZgHz88G/7I+noN?=
 =?us-ascii?Q?sahWfOlvdestpncZjrWC70/3APIyVECc8GPqzMcuI1vr9urZaAjX6uT82/n4?=
 =?us-ascii?Q?Zf1CzQeHQOdY1qn7q/iuFD2jMsyvN1hoha9nLVv6p+fk7KSCQH1DJ4dkPuiZ?=
 =?us-ascii?Q?TTbU3M4cijX8S1q9n1W7f1sav+zhU0/pIfJ0M2oVJseZY/g57/ON2xsOLk4s?=
 =?us-ascii?Q?TxM2+yWlZE/R2bcoT3laMBhYKF1V8Uw4U5aqqUZzTKP0Lg1Cm2rO2Jq1ta3X?=
 =?us-ascii?Q?Q+GQGoK7wzNF7MRZ0pnl+WX4oOKK4+LXOZrftT+zKXkO918rZRK6pZ/wIRHa?=
 =?us-ascii?Q?mvynnKLeatdiWzGwX7Rsd6HoSPC5c1sIcR713emLqcIa2PlldC4BEm5J6owI?=
 =?us-ascii?Q?bNnMro7g4rmZXTGRSbb5A4f/0fWhsK4h2nkggSiBfHWbbWcZNiebJ6IBO+8d?=
 =?us-ascii?Q?KXAPDYLgHtuOcDmT+OrHb3JX2tadH7AyeqAO1Tnjr7Om5wo9Ym9h4QMfdUGp?=
 =?us-ascii?Q?qlFMhhUb+SXxVdhStdylwHt1FcKN0Eishh4qJeeHFm/Zvb7pCrijYIgjsntT?=
 =?us-ascii?Q?hKLh5H8AezYjCovd890WNgtF0Dj2bnI/80pRz3z84d+YImR2jjPkjJOmycVG?=
 =?us-ascii?Q?XFREsczRTB+bCH1Y986Oo5bri/U96LKejXso1gMu4sVqP67KhjXJLMCOl2NE?=
 =?us-ascii?Q?HnV1de5j7coBBrsT/NrQ4Vlz1FElyzTj5/51gvj/sxWHUx2LrNvndEbXAZPu?=
 =?us-ascii?Q?sn3X9DIHkwWqq05rgcbar2W816krvHfCe2fkj4uABkeA7pYbtAb3/s+I8wl7?=
 =?us-ascii?Q?5l+7i76wUHy7HhC7sbc5y+sVaXpcAUNJBT4JHZV+bqgo3HdFmi7MFtBMIc/W?=
 =?us-ascii?Q?B7tWpb/ehMj1VlgL5rm5AovJJ2Y9dW6COgFQ0GjBdVrrIg09eUrEv40CrGz1?=
 =?us-ascii?Q?k9EEBqZHFxIAv7J7f/43JGikMqa61z7HuRlI48dRutFFWJCLED46dRL7T+fW?=
 =?us-ascii?Q?Ou5ygGVvnPTSjSndFyQXga3TXEoYLGapzSuiilpQkGeiOB6Df/C9I1Gqkh6Y?=
 =?us-ascii?Q?6PctaoEbTeTLqDagpbtArdYFhlSFMzrwrPebGBslGFKMGyMEUKVuOTfCwp5L?=
 =?us-ascii?Q?mPpPi7xHwXcK+r0Itk60Ik3ZB6v8rHvupOvwVcoO++sYK1Mt1x2sgczVS1Y9?=
 =?us-ascii?Q?qHmFSshUVgzy02lGtPNO40y1tr48s7AdjedDf8WC5GZ9bi1QVyWNugip4nbp?=
 =?us-ascii?Q?vXpvpalJeRqcrrVyR59yiR6a?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd01b02-8838-4ff1-9f6d-08d94c2f34a9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 10:06:28.1157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkkIgFxy7f7ZwsOaWVu3132mOHm4nRtnC69U9ulDt1TlLJONVAnCtork9iIrlDgDe9X6m10Q1wjth3vn16gjmkvV+kIpf/rjzHFrRKsLTKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5911
Received-SPF: pass client-ip=40.107.4.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Refactor the function to replace child at last. Thus we don't need to
revert it and code is simplified.

block-copy state initialization being done before replacing the child
doesn't need any drained section.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 7a6c15f141..adbbc64aa9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -172,7 +172,6 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
-    bool appended = false;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -196,8 +195,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
         error_prepend(errp, "Cannot attach target child: ");
-        bdrv_unref(top);
-        return NULL;
+        goto fail;
     }
 
     bdrv_ref(source);
@@ -206,18 +204,8 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   errp);
     if (!top->file) {
         error_prepend(errp, "Cannot attach file child: ");
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
@@ -225,21 +213,22 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
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


