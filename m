Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D547A481648
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 20:27:06 +0100 (CET)
Received: from localhost ([::1]:59806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2ebJ-0001RO-To
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 14:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWQ-0006cC-HB; Wed, 29 Dec 2021 14:22:03 -0500
Received: from mail-eopbgr70107.outbound.protection.outlook.com
 ([40.107.7.107]:6337 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2eWO-0000B6-UW; Wed, 29 Dec 2021 14:22:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPbyIaesy17esKM52tfafwGJLAYg0AwDedgtNm8cKDTHaaySJhTa/amQ37/Jmlv42If+jZfvF0EhC+VASQRNp9IQyecLhi4FZVY6Qo1o+2QriKOmjUOf59Gf52ZzUVrA53njVx/bFdib33pinY0SUVbLSXTVF9vIsCf5E0S+kW+47Hw1zpd0CkpvoJORtMlEgxaCST0AwA04vukiVkjq+VOK4AvnKy0tWZi5hBscbljRAO0h59ekJefql4mKAYCgRie7VQV9bIols6RmmPpUXDiiq1KUVfqsCarpQ2YlDDcYJwbruGTytgr8TpdAuQmgOH4M7RWvSaM4l+F8D21xNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LswzA72BVL5U4Lkmc+vTGOi/f6t8KvpN5xLM3nXgBGg=;
 b=KuduSZziAqtbaKrOfYfDHWoCV3gFYumADfIxgTmkHJeC0PiKrrcOtZLjaH3e6JkJYJWaGGJJWygjhqq8Lp/V8/y1OTopyqu8xnVmn0sdy6I/d/t4N34+zCDTn3atk7vs0BtvOuQTiqY9+Kid9HY5BHW1rQYhb8gGqUkjvSPC+heyC2I0u3vsEXq0Q4n84UZcBK4ok/WeXZsm5ryqMlDeQaUqWfSx14+Td9LewWjt/uCgoFxhdGMn5G8srQ5+vDRtVzcFL6t7jAXD6kVikeU7ZM5SPUFVuhHIxzS9+gUevtf30XKd1IxAEf3zpoLEfVO5JeV0bTrTlz+dmupjo9kEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LswzA72BVL5U4Lkmc+vTGOi/f6t8KvpN5xLM3nXgBGg=;
 b=mgGtILgFvOCJq8/F8wlMfMrDRen+dLIlHrQkyEZAT8sLn/BPu/RWEyR/1j1gLfbbdItQ5L+XfSEYvCdwmB/xdaWB3bREuTGJt3eBGHiQCtsmRld5O1TP7qxIlmZyHOWhwc7AhbSVsEqjZZMjeFg8QoU1vgj2reQ84hSTX6l5fyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2276.eurprd08.prod.outlook.com (2603:10a6:200:5f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 19:21:45 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 19:21:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 vsementsov@virtuozzo.com, jsnow@redhat.com,
 Nikita Lapshin <nikita.lapshin@virtuozzo.com>
Subject: [PULL 4/6] block/stream: add own blk
Date: Wed, 29 Dec 2021 20:21:25 +0100
Message-Id: <20211229192127.1772134-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
References: <20211229192127.1772134-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0152.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bebd87f-68e7-4bc2-a3f3-08d9cb0073c4
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2276:EE_
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2276B0A0848EFE3DF52E09A3C1449@AM4PR0802MB2276.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wj0tneHXqoD9UJ0pBIVDLzugIR47SmNKLDhgQfdnttjivNGOQOYE++rNZmh25DSVtA3J1LDy6fpQ0ZJ+8zNTPgpfjnT78N68vZwyx7OsUqfFp9xvP7WS//6OiMPmLYOS/27vcKgsNwa9Gx+1dOyceeA1ix0xfT199CIhnsuoJowpFfOG4ZtFdbRw7BVA2DcCpdvF2VSbPgUgATVrKucjhIIezzfMZm9s6bgzAOXl1UliAnJp8k56qZnGXdDaZGsGaCytP6eEl8thM+MEhkRX6xgZEl4kmfUN9yDG04+CVTR0Yv98rvYUgg/TvsGQAlD+A8kevEu0s6kLAjHEewHNy38C8IHWhvSk9DidZ/TKPeWUtXCJs/MKpSir5hqpQIjAnz+abWjT7HxEmUcb7jzy9xOZbEPVicJTdkAhOpUegYwpRjJ12Fyc5hKkGJs0ysetSwG4IH8R6HPcScJOFjlNKdO40d7J8rZbeBrHKFqcX9jixVlO8dBsk04a6V4JC2/xZtQMoCPmY/9VkZzO43g9X8ZLPTLbXNmOiw18IC37CK9dwA0hPaeiM3BAyHzgpwQKugTR6hBG9TQyDyW3ml5jvQfIIK91C0Gv4VHtmQzEKXK3IxsktK5eq6OHP4WWyI7nEtzbsZx3um6KY4T80iTITddXyohtclDHBrCH5v82KOpopvLKkK+5SHNmYCWvTZp7KtwMFFglZ5m9Z58Tq7/+pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(52116002)(1076003)(6666004)(83380400001)(2616005)(2906002)(6512007)(36756003)(6506007)(107886003)(316002)(86362001)(38350700002)(8676002)(66556008)(66946007)(66476007)(6916009)(38100700002)(5660300002)(8936002)(6486002)(186003)(26005)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sqskrpNMuezbaryG/ZfpwaasigqRFGtOHIxfJ9J6ngnxVxCjBwk7DPpc3cbN?=
 =?us-ascii?Q?cMLgfBFB91qhf2In1gT96Kpa6wQyItmBQd/eJhRShOWcI2KwYQhT08xcMgfV?=
 =?us-ascii?Q?Tb2zhqMZnmjBSvB116PIFQnfsnxEA7vRno7gkf6LbphTe11Kpo5N3MeD3WwY?=
 =?us-ascii?Q?DicW3hwC8FmOaohBA14rMan+i2DL4TIXnzXoBiA38FQ+JqVccywNrP1SHSkF?=
 =?us-ascii?Q?AM4DFyDeomrCJBc4edXPeSX5uy41z0eu26h4Tnf0Y57XL4E6VCr8Bk1fj6gD?=
 =?us-ascii?Q?SP3qYra4wMIDxJ2JynSNQVp5UHj9fRhjIMDUjT1SWamqPlIc9ivdtAr+9N5f?=
 =?us-ascii?Q?T86p+a/NXpGhkhcwXtbyaMbuiESRciXQJNXWv1YcM0JWut134G4y6XgpLnbR?=
 =?us-ascii?Q?gJZgWRZ4pDK0gWBxDhmcujABoimpTOKpvWHeBnoiwNeFDmuWTwD4mmZyOjS8?=
 =?us-ascii?Q?sqypwJ5leZ16RmMGDGxU4Qo8ywmWTbtRLMq/IPPDsQXL81LOWEFq3HAx63n0?=
 =?us-ascii?Q?wU04zeK5x+5ccluHcDgwQjoqQMsBOB3/UF8T7R74R7rxy0auLW1gGSWL7TJN?=
 =?us-ascii?Q?mfViwGxBtyjGcNNo0ma3nNkSV8X6QmW+TEITiNHyHxJ3wVdeGcKEjaGiJ2lO?=
 =?us-ascii?Q?0Rbi9zD1at31gHLbGg6E9baCJ5r92zqTjjyyWNzQ2DD/+zAlufcOtkoTa8Gx?=
 =?us-ascii?Q?OBKmlpGJMA2x6Ff3FxW82TdyMzQJdiPgYIdIzQx7ZNyLcXjKIvz2CTPD2oGa?=
 =?us-ascii?Q?UZtbEkJ0m1ouTOqKJazQI/LrDKX/WVB9KXkQyaxGfnWJ/F3EFwFWTpLKGwky?=
 =?us-ascii?Q?TpH4BzjCanB/DfTZFQLZf946qz/QBDhxSWX2JXcPRlNvTTPA3hTdEu9AgNwO?=
 =?us-ascii?Q?2qr90LM85O67DvqwIjZUImCsT1rgQvQXgjZpXGmNIDKRZVZJAcainyBwIjNC?=
 =?us-ascii?Q?+rKl4z5hE5laYy3OBPgyQtDu94HebtHaH6IkoawQw1/e+NBuCNq4/wRl6BIP?=
 =?us-ascii?Q?KYTUgRDseej7czQXar1UxZjmqmQHZavyPx2apk8+q99fmaoeYkr5YOk4mopV?=
 =?us-ascii?Q?r16b+5lbzfeqEltExdbpCJwsGtoyBmekJ2vqUzmbe9pwguDPQwBomIrINZ28?=
 =?us-ascii?Q?fCS2YRByI7c85bBzou3wezOr+KvLCfvfc6sGEhD8ihlI/59MUF5ZpCsQVUMo?=
 =?us-ascii?Q?l+qNSIz+s1PRAIsxrtrPUjw7peFItJhTL/oE/g9t2CtxikL7Gz3bMlL/SaHS?=
 =?us-ascii?Q?OfmllYy2Qw6zYhhMjxz6Ez6HV2dWNSPk07chfdSSjGO7u9N6NSdcCwId97+E?=
 =?us-ascii?Q?KIN6ZsECdjoe7OcO4jjSDcCum5YMiDo14FF2Ayei3A1vXDyUnp0B8Ze0OCZK?=
 =?us-ascii?Q?p+Ipp4yBDMe/NAEhah04zuDhky9Xo3dfsN4wPgezrrh31kgf5b+yVIKE+jGu?=
 =?us-ascii?Q?AYSF1j/EDQKINV2y0WSWvknV49CKQq4WD7iZBc6X0SdnCrxHu9F4LlgKYBSI?=
 =?us-ascii?Q?Drl6nkIq/+FGF4xRBCfxhitNcu/wK7q1d2t6kP8CniZj9XYqwbKgCmOaLAD9?=
 =?us-ascii?Q?kIawjaKFeI+ttoQ1+8NBQbuEFuksLxHs0xOgHCaO+AZftl4Rn75TDWBfr6mA?=
 =?us-ascii?Q?Bm6OV7SIZ3kBp1mkndNV+wvAnNrIo/QZ+c4BUgUOR3VyEUNyq0Bt+s4JyWbX?=
 =?us-ascii?Q?jAljbQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bebd87f-68e7-4bc2-a3f3-08d9cb0073c4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 19:21:45.3278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0ino2FwDBZhIZC3z5S72pGLJD4e/kkv+7DaX7yHE0nXHDMQevTjX95/YmF9yIO1rui+x/0hX0X2ObUAklDFt0oyGZjo+TVAbCMyiAO7Egg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2276
Received-SPF: pass client-ip=40.107.7.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

block-stream is the only block-job, that reasonably use BlockJob.blk.
We are going to drop BlockJob.blk soon. So, let block-stream have own
blk.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
---
 block/stream.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index e45113aed6..7c6b173ddd 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -33,6 +33,7 @@ enum {
 
 typedef struct StreamBlockJob {
     BlockJob common;
+    BlockBackend *blk;
     BlockDriverState *base_overlay; /* COW overlay (stream from this) */
     BlockDriverState *above_base;   /* Node directly above the base */
     BlockDriverState *cor_filter_bs;
@@ -88,17 +89,18 @@ static int stream_prepare(Job *job)
 static void stream_clean(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-    BlockJob *bjob = &s->common;
 
     if (s->cor_filter_bs) {
         bdrv_cor_filter_drop(s->cor_filter_bs);
         s->cor_filter_bs = NULL;
     }
 
+    blk_unref(s->blk);
+    s->blk = NULL;
+
     /* Reopen the image back in read-only mode if necessary */
     if (s->bs_read_only) {
         /* Give up write permissions before making it read-only */
-        blk_set_perm(bjob->blk, 0, BLK_PERM_ALL, &error_abort);
         bdrv_reopen_set_read_only(s->target_bs, true, NULL);
     }
 
@@ -108,7 +110,6 @@ static void stream_clean(Job *job)
 static int coroutine_fn stream_run(Job *job, Error **errp)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
-    BlockBackend *blk = s->common.blk;
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
     int64_t len;
     int64_t offset = 0;
@@ -159,7 +160,7 @@ static int coroutine_fn stream_run(Job *job, Error **errp)
         }
         trace_stream_one_iteration(s, offset, n, ret);
         if (copy) {
-            ret = stream_populate(blk, offset, n);
+            ret = stream_populate(s->blk, offset, n);
         }
         if (ret < 0) {
             BlockErrorAction action =
@@ -294,13 +295,24 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     }
 
     s = block_job_create(job_id, &stream_job_driver, NULL, cor_filter_bs,
-                         BLK_PERM_CONSISTENT_READ,
-                         basic_flags | BLK_PERM_WRITE,
+                         0, BLK_PERM_ALL,
                          speed, creation_flags, NULL, NULL, errp);
     if (!s) {
         goto fail;
     }
 
+    s->blk = blk_new_with_bs(cor_filter_bs, BLK_PERM_CONSISTENT_READ,
+                             basic_flags | BLK_PERM_WRITE, errp);
+    if (!s->blk) {
+        goto fail;
+    }
+    /*
+     * Disable request queuing in the BlockBackend to avoid deadlocks on drain:
+     * The job reports that it's busy until it reaches a pause point.
+     */
+    blk_set_disable_request_queuing(s->blk, true);
+    blk_set_allow_aio_context_change(s->blk, true);
+
     /*
      * Prevent concurrent jobs trying to modify the graph structure here, we
      * already have our own plans. Also don't allow resize as the image size is
-- 
2.31.1


