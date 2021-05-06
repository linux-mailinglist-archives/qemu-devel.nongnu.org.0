Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719C3375162
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:18:20 +0200 (CEST)
Received: from localhost ([::1]:45490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lea9D-0003su-Gr
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyI-0002RA-5A; Thu, 06 May 2021 05:07:02 -0400
Received: from mail-eopbgr60093.outbound.protection.outlook.com
 ([40.107.6.93]:50670 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyF-0002tO-Uu; Thu, 06 May 2021 05:07:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNudTH6RVnoEx+Mu+anf+gYewiyiRmTdtYb6rENqp7VVIFSIJWl/k2Liqu/4jkuKyLLduXr9H1e676mpngr31LIirRX6J4b8YfWKwYUWv++VlTRLyoGq6cdDa5JKYnIBAJjdTzYz86NjnnnXjhoVclolfH4yca25QR5P3mzxeanpU0LQ+n/ERKKDiAU0XP7X0LMAQACoDuAuPiSlq8Dfl4gWELScSBYdlScOE+UZPH77KvMJq/STw5EmEjxbGP/iQilbeaXzgooLprrT9T313Vzc+qPv0/uDCOKDjtPaNDuOOs+LM9HzRLBGmsa6wV1hciT6bUPE7ZWBiCtqzQn6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiCXCrN7gt37Xiv+B5Eb134+ojHTs61X0eeJFlW/qSs=;
 b=PMO5KemAHR2mXLJK1BAVJgsou/5yW+UjeNuxSeGyovwEvnbEIyKEp4m9UJ0fG/btEVdXDh7wAaFGlN590NJKn+rEWYBYR7nm2vtKWElBM1Tg9DbUWhZoT5RBnVGUnryeUwfMT8hjTYZLD31TkDYuCueHX+3+Xip9LWt+/wgl+iXVFqTjm/9RA48ejKInu6uCXnqfsuqwFvjhnd0H3mJ4YXN3d9T8KYxutrbe/6vBhcUKo4MIR6nkU2aZuvAwDxCRZS0mBH9jNv6X4xLeIrL2YdxlKmMmBXTivXxk6b7EHcRtT+VdUgl8nArmTrfgIoacdLrJYTYijMlci+8odgqLCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiCXCrN7gt37Xiv+B5Eb134+ojHTs61X0eeJFlW/qSs=;
 b=RdyDflDyjssTSt2EkVyCKwssK1lXCEtuDj+cGPtrVyUHyDGhO1wiGXWYNIBU6eapC1EDZmxXNThzfvJTDZSsG0h0p0PpsOtW3E2uX3jo3VZno5/3Yj2Nll5+fayrMtMwwyl8OnxsY0iuhJpBsv48S3LjKeu0la/jUErSQ2D1n7A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4166.eurprd08.prod.outlook.com (2603:10a6:20b:a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 09:06:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:06:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 4/8] block/write-threshold: drop extra APIs
Date: Thu,  6 May 2021 12:06:17 +0300
Message-Id: <20210506090621.11848-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506090621.11848-1-vsementsov@virtuozzo.com>
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 09:06:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9892681d-03f1-48c8-8f03-08d9106e449f
X-MS-TrafficTypeDiagnostic: AM6PR08MB4166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4166C044B40D75B17AE23B5FC1589@AM6PR08MB4166.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e9dBjS2u/QvVuYNHSX58qmYg6ys5XyjptbQ9bvWdp37vOQa2fnCjsB77kkM9nTYm+8TY6otMYwW9YtsG9DgQw7R0VaYIWiqj2SQooVrIVvjHYBCDfoYRuhpms0425PeyU0MkAJoW6xxdxxHrJd7yYfYxnrKaqky0jh+M887ES7Tng/UcQTtqSoVdwPgv9As8TayErbSwSFQzMr271R+v7csVZ92d/ktQNtoV/yAQcAmFnWaj531tJ5ZTrN2DIf5kI/LNJhWkZNGeLPNbBllWiN1LjRwmxrry4CdussL3NwHNkfYghmyFWMflSdY33iV0CA1Xi5xNX7o3b41WiP+/t5Ff6+ocCGh4OblCEIs1RaeAnqB6AoHZEzbnxuDMJYIdJE1rMKSIqvstkMixhlITeu8vUiiiHhsDkF7l/0wLo7V1HqM8ki/HgVHCBH5dUKiMeowts+mxrsAiep2DaZafGFo6vQxd7+mE6n+Puh9Ltm+NVPyO5sqqf04XsHbDh3LqpSoWZB3qwVB2rd7aDBDvMA1lBERhUPnJusMvgMfCVfO99kwGpe8lj/4e23cA7IYhS+7q2dnNLwHnDZ7In9RwkLXehk+3xLPHfx+ZnYkbXsi/dJAEjh5jrnWnjCjiDC6EM4ZZGW7hzKhoGJVtEIwCecSTdbTSR8p4stlqCyBNXa1CcIAE2ssCUS6ReVbcy8Ui
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(346002)(366004)(376002)(136003)(86362001)(66556008)(6512007)(8936002)(66476007)(66946007)(316002)(6666004)(8676002)(36756003)(6486002)(1076003)(52116002)(4326008)(478600001)(2906002)(956004)(186003)(83380400001)(6916009)(6506007)(38350700002)(2616005)(38100700002)(26005)(16526019)(5660300002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ex2bJz2Ap/nWXlTyUdAGP241PbjdQhjakGM507fCUyK7tSoawTn7506PjHW6?=
 =?us-ascii?Q?pnSW8+FKkzIbRpzpDrY851NZQqN3KYsVEcwiLeDdX0rOmTAVHe17RC2FNXJ7?=
 =?us-ascii?Q?2VqORowWBti9pYvnBH6HoegoCQACQMOGzjS/Qk4729mAlGmo1/VjOk2ZmLgu?=
 =?us-ascii?Q?n63WfMAFbgeo0N7qm55nLFoAioU3KY341BLLqxE5euX3yEZIlTEDyjGbShVI?=
 =?us-ascii?Q?aZSTLyCoVNuLCme1c2AXlAK9f5E4U1Tl5L38QAEE2hIXkLa/iNSabl1Iw7CS?=
 =?us-ascii?Q?voklync61eoTFCPLaAgcVOyUTVOgu9DyYApgP/ZfosgTcMZGx61N9P5D/jMP?=
 =?us-ascii?Q?3Ywu3Srs0W2rXxrLzHZ1GRG3ysKzm18Wz91/ZuksPmDl4tdg4f7k4GG5265R?=
 =?us-ascii?Q?M4yvMksCYIANpp4NWGQupI4VugbzrtXCXuA3ruVBTMenpLyXtpx4Wo3wBhzu?=
 =?us-ascii?Q?rbuHEZK279Uo/xWM1srQoiocv7QcBR1rQoFg8ZiEg7diwPjWNBJfkDd9eeOE?=
 =?us-ascii?Q?imLBDqfi8Wa1Jct8ehzzXICc1yRlajUXq5Zh548f0rgEiRvIHS5B2EdxLmMa?=
 =?us-ascii?Q?/7+EMEDVfeTyEVQsrt53hxdYtRb3jS+n/Iw0jh4RDdl+ZD+oDFYR9QTH9lZE?=
 =?us-ascii?Q?eef9fGm3Wxf1J4eRSatQzGWaiOP38zcUvEpxz3cU373MGXDacwocNTRCp+UK?=
 =?us-ascii?Q?wZh3gYMnocBCG6W2xATMqfecHEkDncDaVL6px0hFNkYaUtq0CipPvNVSh9kT?=
 =?us-ascii?Q?fvan2fzN1+sunHB24FxXZ39NWKCbAkpIv/l9i5imuENP5xhHxxAxrlIXzIVo?=
 =?us-ascii?Q?6zs3I1eBoNiqgtPtURwnLrY9E8UDSnWf6gXtKh/Xf/x+Kgtfonvdec50qkXc?=
 =?us-ascii?Q?faQ61ULDEhw8NB/MyRtxtMFKW/2MNF54s8Hi39QshZxto5KL/biPNAip/awL?=
 =?us-ascii?Q?T2NzHexC2VPN7geRMe88E7/HR3qj4mocWAlIExmqKmM93bOLT8RxnPRdU3jq?=
 =?us-ascii?Q?yLt12d8DpBFskVhAKltLm1HWDaLRH0Q4iSrv+Ba7ATn0zEuydeXHv3mX7ZNa?=
 =?us-ascii?Q?SBiR6nQEgjHAQ+HHu3s5Bpcn3Hg7NJYpzKHduju6/oBz7xPVGnd23fGjqtCK?=
 =?us-ascii?Q?SD4B9FChAYx6WDByUo0r38l9W4oO+n+ySHN+/Shwx8guga+vLUwk/UzVHvg2?=
 =?us-ascii?Q?cV6wyeBSYUITkTArvIv7Y7eQwCaDq45+/owZozYWk88OqQMryx5QfTEbRmWx?=
 =?us-ascii?Q?K4Y3UY7ijLRqbQCx5EWDMnJ7gSRj9c/sylzFVjYsNhMWWYm3gxyHg5ZbX40n?=
 =?us-ascii?Q?gtYu2HY9Xso7beWlBfM6lSxs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9892681d-03f1-48c8-8f03-08d9106e449f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:06:43.4435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqjuhUS03Z3mgypLGyhclsY6pVJrPKGhLZuGZu+UoGyc/JKsVkzBKwIuoeCacSbyqjdYfLfw3e41I8UBTohIKbk25tTachEpNGlWtA3bWNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4166
Received-SPF: pass client-ip=40.107.6.93;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

bdrv_write_threshold_exceeded() is unused at all.

bdrv_write_threshold_is_set() is used only to double check the value of
bs->write_threshold_offset in tests. No real sense in it (both tests do
check real value with help of bdrv_write_threshold_get())

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/write-threshold.h   | 24 ------------------------
 block/write-threshold.c           | 19 -------------------
 tests/unit/test-write-threshold.c |  4 ----
 3 files changed, 47 deletions(-)

diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index 555afd0de6..c60b9954cd 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -35,30 +35,6 @@ void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes);
  */
 uint64_t bdrv_write_threshold_get(const BlockDriverState *bs);
 
-/*
- * bdrv_write_threshold_is_set
- *
- * Tell if a write threshold is set for a given BDS.
- */
-bool bdrv_write_threshold_is_set(const BlockDriverState *bs);
-
-/*
- * bdrv_write_threshold_exceeded
- *
- * Return the extent of a write request that exceeded the threshold,
- * or zero if the request is below the threshold.
- * Return zero also if the threshold was not set.
- *
- * NOTE: here we assume the following holds for each request this code
- * deals with:
- *
- * assert((req->offset + req->bytes) <= UINT64_MAX)
- *
- * Please not there is *not* an actual C assert().
- */
-uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
-                                       const BdrvTrackedRequest *req);
-
 /*
  * bdrv_write_threshold_check_write
  *
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 71df3c434f..65a6acd142 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -24,25 +24,6 @@ uint64_t bdrv_write_threshold_get(const BlockDriverState *bs)
     return bs->write_threshold_offset;
 }
 
-bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
-{
-    return bs->write_threshold_offset > 0;
-}
-
-uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
-                                       const BdrvTrackedRequest *req)
-{
-    if (bdrv_write_threshold_is_set(bs)) {
-        if (req->offset > bs->write_threshold_offset) {
-            return (req->offset - bs->write_threshold_offset) + req->bytes;
-        }
-        if ((req->offset + req->bytes) > bs->write_threshold_offset) {
-            return (req->offset + req->bytes) - bs->write_threshold_offset;
-        }
-    }
-    return 0;
-}
-
 void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes)
 {
     bs->write_threshold_offset = threshold_bytes;
diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index fd40a815b8..bb5c1a5217 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -18,8 +18,6 @@ static void test_threshold_not_set_on_init(void)
     BlockDriverState bs;
     memset(&bs, 0, sizeof(bs));
 
-    g_assert(!bdrv_write_threshold_is_set(&bs));
-
     res = bdrv_write_threshold_get(&bs);
     g_assert_cmpint(res, ==, 0);
 }
@@ -33,8 +31,6 @@ static void test_threshold_set_get(void)
 
     bdrv_write_threshold_set(&bs, threshold);
 
-    g_assert(bdrv_write_threshold_is_set(&bs));
-
     res = bdrv_write_threshold_get(&bs);
     g_assert_cmpint(res, ==, threshold);
 }
-- 
2.29.2


