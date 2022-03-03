Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AA74CC66A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:47:38 +0100 (CET)
Received: from localhost ([::1]:45770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrQG-0000Fu-Ul
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:47:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNC-00043x-DD; Thu, 03 Mar 2022 14:44:27 -0500
Received: from [2a01:111:f400:7d00::72c] (port=28672
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrNA-0004Wu-4q; Thu, 03 Mar 2022 14:44:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRAiqGuRRU7V3VtG6lYfox94ePjtZhB2RE0S1OBnG3AJFNe9xBz8HkrkT0tCn8U5pJJ1sQA9mOQRSxUPPp1CgnKT1vXKu0gDTNRqp4ONxt+nJ+KNhw3jEj1qjlaeUFWePSXLe2xE8pBbdtlYAY4wbIG94qJUeHK3HWkWhaPRmY1x+Fi+C5pQVLA7m0DXfa59ZIwhV5KEqXmh6llotGEYNo2lsInfkubMN+yoRv86YpSBEWY2cKcDR60UZ7v9LHw+xFTqWGJSwhbOgvEpy+V8jRatEjkPqZj2NVI2JbGqlI9RRvE2IUCZjrCvY4D4G7WSuWzALaJqL5MWG8swW1FlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk0CPYEsGMCibsoooULP+lClkB+WEx4/8kGPfI0xzIg=;
 b=alFmtYkN2qdR7d99kaG6z784QpfNKja6QINaADOal2wL50NWBP02iVMILF6MlEvLK8dT6S6KWdpXewHuM84fvjjvTAvtxnRx/dyJgwGKcOKd7d81+z5d1niwGN7OPTuMvwhVzobVKkLZ8zz7ry+SWavLNcsbGqIGwjFM6wJmFFGkdlnj/lw4UrFYVZHL1dlm+VXvNqUuFbbNTLylQBvcUQkB1F0eOvYIRrfAnsgt1waKIKEH77qXVvGcVstL9RV3wSDres0ONi7y/DbgfkPDyDvWIiU+bTJrDviLmT4k/yz4YpXuPtm7fS5RlgvCzLHiAcEwtYghIcKLIfIHzCYu3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wk0CPYEsGMCibsoooULP+lClkB+WEx4/8kGPfI0xzIg=;
 b=ZizVFDRvHuw+nU+yO92e91NHIrkUtCmevRSdFfv0OZe8+XnBg6GOzYnxYvtIA7l7qhy8S3f0jyo5eJ4kCvUks4CSWlAbLcpUyb0J7MCaBQdxLEiddpkpWkLglJ0zsVOXTH5DInM7cMYL0YGtlRYIiLe4ZPi3Baiy9jasGp2SQFg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:12 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 10/16] block/io: introduce block driver snapshot-access API
Date: Thu,  3 Mar 2022 20:43:43 +0100
Message-Id: <20220303194349.2304213-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bfe365e-f716-41b2-4175-08d9fd4e3101
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB473649E9B6F2A21981EEF356C1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eeJNGSYBi1b/8z8L1Ixq0rOtLaxRbEh+RTTvRm1n5Al+wnn5XszUhscgnRqwalpx/J+bvuAA5XbCPzSRmzw43u0uJpDuow7nnIz+BuAGlgJdwNthbvU1PtYFNTwO3z1j3V2GvEwDbqcXxKQCVUvn2j8VuHN87eClF9ty/+xi5f5dklXwPNOnCdXsclTctfeyZBIuqKYF5R93aoU99oXF7wTnCP7vNw2TfNF8v/TZk0VL4c8WUhHLZ2Lub4omciXWntZWeU3CeqCAU/om4sdB6Dl3ZCCJJMc9BnrBvsTFIk34LrFQvEgK0nEaCtsjDfDJ6IwFnJICRXiaqmsCTIZVnO5gyu75bYrseOTI1UX9pxsp/jCdXmOfOahciEWAf5FOUmQnowgdh9SAl3zfPZVtTDQtwZM8ahPuya4lJkPMLNe9bmIQNdXsrhRpaWSfV5GXrw5BScSowwNfKReFFBqKApCMocgBrcuGBYz+Y32TvwM5JEbp5lItrwOvuiYQS/XJ0jYBuaiqLf0rO1FHJf3idrLBB7hQBXhEJ0s3E9v8BQ8q2HcLMWw2NFMF9lobS4gHyIuJ3+Sl7/IH7xX4eymAhaRHJn7bcFcB8X6eRb9J2HBA+N/XKcocacf+67LEhXTeWvpqGM8+vaWXg8ILanHG4cqIq94E4azGRAjTOUe4nVaGBMgmUZuW6lAsyYyuQKBxIixDqUV/+eebzJQHBGdmTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h5vZ0n7+mDcXS3CvbGOYjVcf5n03JDA0+aGmXQDZJv1jgOgAJINiC3M5k9GG?=
 =?us-ascii?Q?R+WVeaqEjSjldjGD7EZxTX4om07LePCJMRHDgJrBvEOhEwwDzmh1PVTarEXp?=
 =?us-ascii?Q?GgqDcxszhAX6j73MBxZC6Q1QGGVqQjIDFb2oNM1UQWMuoJ6kzl3OtVOgcR2k?=
 =?us-ascii?Q?LWKsINEVh/vWqM5b0Tz099HNQ+pK4TGN6yW1WHxdT++l7rcHDYECksIvtmSy?=
 =?us-ascii?Q?A2JXBC3b/YWJFt5Lt9xGPp7Wdif35UHqS4ILG8+pMqhPT/WK9Jmj+J27EqJB?=
 =?us-ascii?Q?VlroJ+lU4e4hfW/IpznmjSUqnJ14tTb7m2jagwuBrRZ1qf3ByHUHfTYnpEu7?=
 =?us-ascii?Q?umdrAf3G4rrbLbnisqP/9dqU/Yn6adD+7S4DCjfitxdvkmVqomXFU3bGRmg9?=
 =?us-ascii?Q?tURVvsizv6EFVbTiaYc2p8zAwuWNb1Fl0rmn/5AMXtKo2tb+5NamUeXlKllA?=
 =?us-ascii?Q?HH1yaTlo5uF1pdBH9NW5SOD1nZx7TcqEAb6C+Bm6O2jYIqme6IbhqgqBZvGd?=
 =?us-ascii?Q?cWQtXttcc1rB7jYvutk8NS902p0nyl54r+7nG19bU9VkMEQRoIqGEbMRRG8W?=
 =?us-ascii?Q?/pe9uCv3PJ/tLLJ8Gt6K3kXYoKfXzpIetRKwJK5Ey8AKSBzR700O1W/osrTR?=
 =?us-ascii?Q?ciIUT6j/AsEfqplSb+08XtFhVSuna3oNn8fGxZ7NNE9y5T8bP3BOduhhBM0v?=
 =?us-ascii?Q?0U5Z79w26e9fd0VurnLd8Syz43cA8m2Mk6QWhZk1tcENuNlPPwKd6fTi07+9?=
 =?us-ascii?Q?ixmqGC4YCuDL2sIEtDjTY//siRfJdBJ6JBcT+Axj3a2CZE4LSRy0FgJplPeF?=
 =?us-ascii?Q?VIMt0a4uwG0ABLnRJJs0+4hVc8SC/zBhjIpRFJyAyqE8rnI9PtDLnHIkIihe?=
 =?us-ascii?Q?w2eVlL6Cfn/B9Am80nIttdiU6XzOky6UP4DbwyrB6YGUJkk+YLjviSsRfhJS?=
 =?us-ascii?Q?LbpOVI6aI0ZCb+bnnMeMhgL/5q++Y30o6tuCOeuEZ9RF7FFRR9a5YTuVenAt?=
 =?us-ascii?Q?SdrG9ImkPTbtGQEQhiuBF7X4wLxooe+OtrCPPWP0DAwS1gdKpb54bVkKdJGI?=
 =?us-ascii?Q?xNkT+lnrEnIHvukeLdWEzsEGqpK/RXFTLv79DuXrKqYo5S0w3u8sZEzO7bsU?=
 =?us-ascii?Q?+zKlNTdtRb15pJJzx/uujUM6/M1MDdJ0QUIr97LFdy8x111aPnNGrxyaBh+b?=
 =?us-ascii?Q?HqOvbGOHTG4AwzzDiC3yEjqnfM3Uw+f4SodGmV1kXgAu/ccjSJp467jyxtjy?=
 =?us-ascii?Q?ONrfD0S+zGlSqbAWbWGO7J1N6KHAJ/3UaxCR8CV0zgJOmiJ8VtcfMiySFp7G?=
 =?us-ascii?Q?X95Cq1m1ukrcWePut5CAP/xMLb+wwxLif2bkVdbxjmPN+Fho7VnuvdfpkrEN?=
 =?us-ascii?Q?RROan8cJ0j/Y4It8wffFrbIOUM64L2xmxV2DX0U5CarByMjrDmSyqTn72dZq?=
 =?us-ascii?Q?NgZN/RcRFvVgLo+Wdf8XxdV6/2tT4UfvTTT4FJB2csaLwXN84zu5CXvKkPOk?=
 =?us-ascii?Q?13CU9QlwqO+LEHwOEDcP68FCw01RHBN4XRFbzlFYcPAFJgcZUkarG+pIQMq+?=
 =?us-ascii?Q?hR7QJTZer8BuNe/Vw3f663yNOhGtljhbzowa6zdsa0wi2/nYtRdJVe93dQuq?=
 =?us-ascii?Q?S8wLZr5pTe8l9hXbWabtgxce/KWwjznzVT2Fo52Yk5NXVBSmkc4Dj+5RG/VH?=
 =?us-ascii?Q?lefNJg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfe365e-f716-41b2-4175-08d9fd4e3101
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:12.2484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9TLFypu0IP8KWb4XAY3pGFnGiA2dQe8zZl292+eLsDuyRBPkSOkgacWr6O6EgNHa7/4RU5xOyHvtn0VIeYP7ygiETvjge3f7hLHRHULlo+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add new block driver handlers and corresponding generic wrappers.
It will be used to allow copy-before-write filter to provide
reach fleecing interface in further commit.

In future this approach may be used to allow reading qcow2 internal
snapshots, for example to export them through NBD.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block_int.h | 27 +++++++++++++++
 block/io.c                | 69 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 27008cfb22..c43315ae6e 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -376,6 +376,24 @@ struct BlockDriver {
      */
     void (*bdrv_cancel_in_flight)(BlockDriverState *bs);
 
+    /*
+     * Snapshot-access API.
+     *
+     * Block-driver may provide snapshot-access API: special functions to access
+     * some internal "snapshot". The functions are similar with normal
+     * read/block_status/discard handler, but don't have any specific handling
+     * in generic block-layer: no serializing, no alignment, no tracked
+     * requests. So, block-driver that realizes these APIs is fully responsible
+     * for synchronization between snapshot-access API and normal IO requests.
+     */
+    int coroutine_fn (*bdrv_co_preadv_snapshot)(BlockDriverState *bs,
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
+    int coroutine_fn (*bdrv_co_snapshot_block_status)(BlockDriverState *bs,
+        bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
+        int64_t *map, BlockDriverState **file);
+    int coroutine_fn (*bdrv_co_pdiscard_snapshot)(BlockDriverState *bs,
+        int64_t offset, int64_t bytes);
+
     /*
      * Invalidate any cached meta-data.
      */
@@ -1078,6 +1096,15 @@ extern BlockDriver bdrv_file;
 extern BlockDriver bdrv_raw;
 extern BlockDriver bdrv_qcow2;
 
+int coroutine_fn bdrv_co_preadv_snapshot(BdrvChild *child,
+    int64_t offset, int64_t bytes, QEMUIOVector *qiov, size_t qiov_offset);
+int coroutine_fn bdrv_co_snapshot_block_status(BlockDriverState *bs,
+    bool want_zero, int64_t offset, int64_t bytes, int64_t *pnum,
+    int64_t *map, BlockDriverState **file);
+int coroutine_fn bdrv_co_pdiscard_snapshot(BlockDriverState *bs,
+    int64_t offset, int64_t bytes);
+
+
 int coroutine_fn bdrv_co_preadv(BdrvChild *child,
     int64_t offset, int64_t bytes, QEMUIOVector *qiov,
     BdrvRequestFlags flags);
diff --git a/block/io.c b/block/io.c
index 4e4cb556c5..0bcf09a491 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3587,3 +3587,72 @@ void bdrv_cancel_in_flight(BlockDriverState *bs)
         bs->drv->bdrv_cancel_in_flight(bs);
     }
 }
+
+int coroutine_fn
+bdrv_co_preadv_snapshot(BdrvChild *child, int64_t offset, int64_t bytes,
+                        QEMUIOVector *qiov, size_t qiov_offset)
+{
+    BlockDriverState *bs = child->bs;
+    BlockDriver *drv = bs->drv;
+    int ret;
+
+    if (!drv) {
+        return -ENOMEDIUM;
+    }
+
+    if (!drv->bdrv_co_preadv_snapshot) {
+        return -ENOTSUP;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = drv->bdrv_co_preadv_snapshot(bs, offset, bytes, qiov, qiov_offset);
+    bdrv_dec_in_flight(bs);
+
+    return ret;
+}
+
+int coroutine_fn
+bdrv_co_snapshot_block_status(BlockDriverState *bs,
+                              bool want_zero, int64_t offset, int64_t bytes,
+                              int64_t *pnum, int64_t *map,
+                              BlockDriverState **file)
+{
+    BlockDriver *drv = bs->drv;
+    int ret;
+
+    if (!drv) {
+        return -ENOMEDIUM;
+    }
+
+    if (!drv->bdrv_co_snapshot_block_status) {
+        return -ENOTSUP;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = drv->bdrv_co_snapshot_block_status(bs, want_zero, offset, bytes,
+                                             pnum, map, file);
+    bdrv_dec_in_flight(bs);
+
+    return ret;
+}
+
+int coroutine_fn
+bdrv_co_pdiscard_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes)
+{
+    BlockDriver *drv = bs->drv;
+    int ret;
+
+    if (!drv) {
+        return -ENOMEDIUM;
+    }
+
+    if (!drv->bdrv_co_pdiscard_snapshot) {
+        return -ENOTSUP;
+    }
+
+    bdrv_inc_in_flight(bs);
+    ret = drv->bdrv_co_pdiscard_snapshot(bs, offset, bytes);
+    bdrv_dec_in_flight(bs);
+
+    return ret;
+}
-- 
2.31.1


