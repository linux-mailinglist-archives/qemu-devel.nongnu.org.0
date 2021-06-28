Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 888CF3B5DD6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:18:00 +0200 (CEST)
Received: from localhost ([::1]:59488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqD9-0007VF-Gn
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lxq7i-0006uf-3C; Mon, 28 Jun 2021 08:12:22 -0400
Received: from mail-eopbgr10131.outbound.protection.outlook.com
 ([40.107.1.131]:39798 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lxq7d-0004eW-BP; Mon, 28 Jun 2021 08:12:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPzM7fIgUux3t4zn1WYosqWRUtM9Hdrr6gJkFkNW5lNgzhk4AJpi/BmcooKwXMoJD0/+mSIikjYPSG3OkbQioIgawdaNvcydEJi+NRr6Q+YgJSAE32SSMk4o5UWp6KZJyZ9t9rqKO/+ppI3ZS9xHCJiZdm2WL6fs/fp5hOWDDabo3iySPMSCbHgEUSOtlNrKFl4UqHrkwz/GwBk+immchSDehwaADe8SmwWivlRTp0slBRl1+ftb4tIVMF0V8U/22tPahvYMxabKpk91OC4bbd9BMnu4RoLsryMGTr/4QcDGh/uUI1th0BRVSA94ze+sVF8tacDcI8XCnX3L2eta/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmqoMj36hJwHv6E7LlQpVOTNuppyooZ8e3+T3fvOq+I=;
 b=ekrLGll4B1WrUf3B0yMfRzwe8TviJV/RYQvB8DqOPBNLGcB8egeuYmuFnQHxRB39ZjbZKSpWcWKTeuLwaVHGgZeRgKtUBTa+t8oLCmftxudJW8FiHVr8mLKiduPBxFgnO81wXIKyz6FwKCZ/tVC0EDC6GZuQd5I3bpsuWy7Yax9NsFEVdKluIonsLqtfq43M86mT9G3cxz4yazYxhZCm2xUkYhuS3XBQm1GxmSEXWWFaGugDOisnrsWEh3Xunp1wXRRDKW0ZQLBV0L4oOUCkpxSlc6SXEUzd9UJ+CHJ6VsscHkZOBnyTHHKP4hAhwwh0rxGEdloHNREXjMRZOcQ0Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmqoMj36hJwHv6E7LlQpVOTNuppyooZ8e3+T3fvOq+I=;
 b=I3LuuJlTfWgG26jt6JTB0UKbaOhcEoLGsXb359LbdBxkiYUFUIF8fOB/WbixbRMF51xbXG9GL7gQrJVWMFXex0sVC5lcbiJUdEsJmezXK8V6JGL7YI0L/MzutH1gSy3lqTOHf75h/8qsOTYJ1r/YGRl394tC9fVgfT/Bp5rCVds=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Mon, 28 Jun
 2021 12:12:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:12:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com, stefanha@redhat.com
Subject: [PATCH v2 2/2] block/commit: use QEMU_AUTO_VFREE
Date: Mon, 28 Jun 2021 15:11:33 +0300
Message-Id: <20210628121133.193984-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210628121133.193984-1-vsementsov@virtuozzo.com>
References: <20210628121133.193984-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::25)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1P190CA0036.EURP190.PROD.OUTLOOK.COM (2603:10a6:7:52::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 12:12:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69e2d007-31ca-4816-4325-08d93a2df1a5
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB16528D501DA99EBD539195DDC1039@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:12;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eIUxx+TXxyHmHpPfYImkUga4uUctrgMepEuWjPiDmTCU/HCyJsNnmHevZ9IWaUhC9cyW96BaNShEN35jdHIqtB+NherSKgpRkIedyVujjkNMIo6U74ENgBfvaSST3K1gDqWfo74ON7wtzvCfmP5SVfQpcn75EMpV7+IYJT7DldemxPLTBPdqrkY0WWpfEnvkFW40EHNaxPNlKdOOYM3cufL9WwZwaU0WgI2YTMcXHWfP5NJj/bMEgytuh3VSfHU2oz/lEOA06NGorCsona9+t7NTmGp8Ei/8A1b/49JGK3dXueeU/sawJETxQARWtIgK5G8fXZj4SiHTC98RjEnDb8CgFh8lV7hJedjwLmxBufs4xabzMXathG8p+iDeZUunviP/H28YgFVRJGYuGpzn4vyPC43uaYp0NwpNPSnjohGmlqAYvWsFRsHaFUwpLo6/wtlXI0+xOJfvSuP0TEPK1S9/lwgRjBsDHOxfHrP6+rIEdCbFkl87WvVditXkfk37rwpf5EF5Y2gdZemNgB7GL0A1zgDeslujHkrf+D9l2E1Uuv1kYum3vMynW9jPUcKhYMy1tp5JgoEqdnCKXAsrQVJExiC62vsMQhMyZ9QOf16QstncjW88hlOOJdhp8qp4a6LZ+QEVRjCZLBX63qiElVgmYF+nJDp2LBGMUaNVtZvligxpsY3e12JjIivbHeSl97BsxfZlnWWIPx6ZhW/7pH2ULg6hhX1VxeykFEXqnvSbL/y41F81WOFJhH+VyRQ+pqgk2sUWG5P6MC0dBmdTiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(39840400004)(136003)(66556008)(66476007)(66946007)(186003)(16526019)(83380400001)(1076003)(6666004)(38100700002)(38350700002)(316002)(86362001)(8676002)(956004)(36756003)(6486002)(6512007)(8936002)(5660300002)(52116002)(6916009)(2906002)(26005)(2616005)(4326008)(6506007)(478600001)(69590400013)(84603001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hNvRYSjawC8A7+3xTHoedCFwmeQ0mHziRqVigpBXMbxaX4kVdbfzbMU5NujL?=
 =?us-ascii?Q?6WQqBPSjhSmCAJXNT6ivZMZ9n+eDZIc0OzZxpY1fdVIsM2dhZOYxaDmaiy0z?=
 =?us-ascii?Q?gNT+y8xJ6mABXMDR2vzpaUedixKsunVIhiZnveY8BbgXMwiXtQzN12kWlbSu?=
 =?us-ascii?Q?85ieGXS3HoHjckrPbKDnrsiXl2tyEvML53Bgde9yj5HRKxpQMbW3hrBZ7FKL?=
 =?us-ascii?Q?iaoNNAOzEFHDfC57zO/q0B4beJAIcFRn9t/mOs/4rr18bL4nYB0rvDbyuS8+?=
 =?us-ascii?Q?sJrOV4d9BidT8/CeXIhAjJBRy/Jzh8lvFxu50AxgNr/NPg2tvmH5EhZawyPq?=
 =?us-ascii?Q?Rym7nQrLtFrnJcFGEfVypCpBc6nG+/vovIpKX5JbX7qkADFWEutuPHhjIGnc?=
 =?us-ascii?Q?Em4Y9JY6kVIyDk0s0oFzkWY077Qjqh7b3yKy+OTYVGg9hz8+BF5qiM2hvbBm?=
 =?us-ascii?Q?cU2Y/ISd02ln/Bu9bdDvgJ8/ZId3OXuhmtcp1m3XqONbhKrBUwi5h3BrCm4R?=
 =?us-ascii?Q?vMCVJVWmxlHpTSvtm/dNWiOlvzhjUMTThB0bzSrlz9gztl4Uo4VbtE86l1tu?=
 =?us-ascii?Q?bdLwgZzEcH+5XHB2sbuuca9DzJoDTFcBLDFIjR6UdO9iDKryhrp4iENGkf1j?=
 =?us-ascii?Q?iAUDBQLxVzfBhmYSJPb+f3fRdlyrL1S5ksXVwc2k0bTteuvgeCFqY5v5gyRW?=
 =?us-ascii?Q?IWFQ1wdk80BdUDF6zCNZz4csFLvdUyLpFb9dQ4tLPQJStnEvntbqrAXKQtOP?=
 =?us-ascii?Q?ZulD+LP5ySPM7yxe8nrHhmlj+9+ZrVq5zQugUhb7k0xrHfSJodPawW2/aDUY?=
 =?us-ascii?Q?F/6LIEL/3726318ke8Ud5gepZV0ULgc5QBKs85hlKd0KkSzhlJaHG2v6BQXE?=
 =?us-ascii?Q?26ROFqp9EhEE6uKGhnU0ZalKuPsFeGve5Xdlf1QH4g7SPFgOKJBhk5bNvB3c?=
 =?us-ascii?Q?T0EBvusECYukFWTjx4C4wLgPxQCJOzKRfa0B0v9VhR4EdO1nnRpa41RdDX61?=
 =?us-ascii?Q?Qh/H/EOJ7pusuBkaCJt98FyaotWc15XV+nm+eyP5oWSk2pOD828nXYTOG0FA?=
 =?us-ascii?Q?cgNuihXhAXKlA2PMLIk2IbsKSrILF5uHRHK4Wl7JjSwWJRbvzZ9C1OJy3gAW?=
 =?us-ascii?Q?op0deQveAofdWwWzwJa205IwutE6mqAHYSnejgVWwD4Em/LHSu2qiwDhYqI5?=
 =?us-ascii?Q?srOGRCpmTa2OnrHrXxcPE3ahgvZl6lIn409meZDx/uZwn4EYfUVydwZ34Qat?=
 =?us-ascii?Q?UoYkmgH1ac7ZNEa2YQmGuXpDFR83bILT5gUw+4o4mqvBeaOKgt//q4pqIH7c?=
 =?us-ascii?Q?/X9rQFuhX3yu2+Csng6Vp0Pa?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e2d007-31ca-4816-4325-08d93a2df1a5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:12:05.2760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtYYYqLfrBf+Pd3XsTtRhSD05bS3k9TtLoQrhs6tWzQGpTPEpvc/5GbNVh01NmrX8PI8z+bPsRSRIAZN62mnMcuePBNoz35Y4119GVlVtT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.1.131;
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/commit.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index b7f0c7c061..42792b4556 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -119,24 +119,24 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
     uint64_t delay_ns = 0;
     int ret = 0;
     int64_t n = 0; /* bytes */
-    void *buf = NULL;
+    QEMU_AUTO_VFREE void *buf = NULL;
     int64_t len, base_len;
 
-    ret = len = blk_getlength(s->top);
+    len = blk_getlength(s->top);
     if (len < 0) {
-        goto out;
+        return len;
     }
     job_progress_set_remaining(&s->common.job, len);
 
-    ret = base_len = blk_getlength(s->base);
+    base_len = blk_getlength(s->base);
     if (base_len < 0) {
-        goto out;
+        return base_len;
     }
 
     if (base_len < len) {
         ret = blk_truncate(s->base, len, false, PREALLOC_MODE_OFF, 0, NULL);
         if (ret) {
-            goto out;
+            return ret;
         }
     }
 
@@ -174,7 +174,7 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
                 block_job_error_action(&s->common, s->on_error,
                                        error_in_source, -ret);
             if (action == BLOCK_ERROR_ACTION_REPORT) {
-                goto out;
+                return ret;
             } else {
                 n = 0;
                 continue;
@@ -190,12 +190,7 @@ static int coroutine_fn commit_run(Job *job, Error **errp)
         }
     }
 
-    ret = 0;
-
-out:
-    qemu_vfree(buf);
-
-    return ret;
+    return 0;
 }
 
 static const BlockJobDriver commit_job_driver = {
@@ -435,7 +430,7 @@ int bdrv_commit(BlockDriverState *bs)
     int ro;
     int64_t n;
     int ret = 0;
-    uint8_t *buf = NULL;
+    QEMU_AUTO_VFREE uint8_t *buf = NULL;
     Error *local_err = NULL;
 
     if (!drv)
@@ -556,8 +551,6 @@ int bdrv_commit(BlockDriverState *bs)
 
     ret = 0;
 ro_cleanup:
-    qemu_vfree(buf);
-
     blk_unref(backing);
     if (bdrv_cow_bs(bs) != backing_file_bs) {
         bdrv_set_backing_hd(bs, backing_file_bs, &error_abort);
-- 
2.29.2


