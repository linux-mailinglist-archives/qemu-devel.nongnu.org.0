Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DB24B2768
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:50:59 +0100 (CET)
Received: from localhost ([::1]:51420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIWK9-0007Al-H5
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:50:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVt6-0000Zy-ML; Fri, 11 Feb 2022 08:23:00 -0500
Received: from [2a01:111:f400:fe0d::72c] (port=1174
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIVt4-0008II-F3; Fri, 11 Feb 2022 08:23:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIj75+SsT7ApQr1Ag0ripICNzjvcJPs8lCYFctS2D3jaY0sARGHtrI9rqrhnundPTkN4RNuDZNWBwoTK9TGFFHpHzg2xTCh95IMynkYRn93fmq8fTRn5avbuMmXt0oXF/GPB/eyPPxQ1R9NjTLt9HnuuE7wZJd8pUfeZSnzpreNtfvlnKHK39009EZvnpicY4x+kHyKssHJg5n1ZCeoA2MtD8kMS+ZsAzXcZZjwIXPUMeGpI2AAhK9VRawQEjBN6N40HrT8O77OetlWvjjQWYMfOZUkHPS/rWayO/ihqAfILsBOk0NDWp4A+yHaGGgVdlvRmd3D1SeQ6LVNMrmL71A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NYdSA2BqiFRPV1gA+QTmOONRrO9CQ1qa7k9tbx3yPs=;
 b=Vg0M6u/un6B7b02ZVhszZ3w9Ve4njJvpt6672i30F9ziDjp3nEv8971mOindry4dW9PxsWKylS0Re9zHTKGEHMnG5bqV5gsHAjKAqJ6geFAwvyzkI4B6sVrCONiF1tSVKVX3TVXUEegWmEXWNgbjdgXOAOyApK5rogTKp6d3ByDs1HNbK4vCrRHWTTxuddTNEhwrzv3297vpE8FNfp8TuQ+HT/IQeabgMV+nnuc1gFZ0+avmw6AY1dErysGwTN6Z5gbHOtuPVFtn4SzN01kf8ydqOvjmGxZbrWO1F1eFEP8NjWEHVIhxT5h/ffG6TS3emQeRhYMkeAQb5GbZD43eow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NYdSA2BqiFRPV1gA+QTmOONRrO9CQ1qa7k9tbx3yPs=;
 b=BWZkk7orjOD3afwy07WhxQaPOJbCA8CcqiVczWUEoYcGFOG8diD9zXdiHRxK7Wa09b3ZTkdnThL+mRoggL2zGcqG5rpImeT/S0IvHAAAEvWNxgL/1VXLD5XiN/PY6pnsysQrGiX6RUXL9yr8iNqv7fN4k06BdFzYX6BzQVBTIhQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR08MB3357.eurprd08.prod.outlook.com (2603:10a6:803:45::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 13:22:53 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:22:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
 peter.maydell@linaro.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PULL v2 6/7] block/nbd: Move s->ioc on AioContext change
Date: Fri, 11 Feb 2022 14:22:39 +0100
Message-Id: <20220211132240.781958-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220211132240.781958-1-vsementsov@virtuozzo.com>
References: <20220211132240.781958-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bd69a61-3a94-4f75-51f4-08d9ed619bdc
X-MS-TrafficTypeDiagnostic: VI1PR08MB3357:EE_
X-Microsoft-Antispam-PRVS: <VI1PR08MB3357D46BAD6F90E34D18356EC1309@VI1PR08MB3357.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S0PQptqiu1sM6Do9ldynJs2np//71dqE6Y+CiXN6sbF6MwkQR1CuF54PEwDGEqszNNunrZO8VBdB8dznumNWYNrUIfUjx7zjL/n4hlP14IZ0RcXM4R3grFUpLUvIwV8s3CtHO0ypekF0yDKHyT+gh7U4+nsaoJuyjWRktei3Ud+SX91TT5VxCk/ThSm3Br7YDvyMTmOnkIxZiIoDSElLHoKQz7wrBp67j4QEbBMyWBxKG3F2Q7mhdyi/8N/mYOVYGhAxk9964abEOTPExtAnoPTEcDVQdbbcAIoRSdpVZzvxAQvQ6oSJ54xUoztQY7k7vgm08NSqRypRFcN2MNhiS3Egb9pCdOP6Z7mJ15Nz42xoM/qaRJdYiImcFIKtOGvB4xiDRxHST5RH/wVQ41RhUeNKUICUU+8t+PKevIPECUPEeePwHXo73Bm4EB9E0zKkzsd0S34IfpgPlLerbKBM7iaJUJxBLFRWo9WAGqNnbSNll8dDP1UlQs9gW7gPdnWERslvS16buqWrahjJasekC82I4et/RwHwvWQXIqtu//fudGXEx5xxzgjmQnuEheZybR5/KX/KRMrjiwl9F31GAKPCPba7kW1Ii/I/B4qGR9vtU58/UUHium5Jd9sMYBExTv46gSrhnxTcaKJ1qXlIR6S8hb0oikmgvzbEjz1IgjJNUe4Haw+zNf/foPoN28CO/8oeyLuFVXmxqUR0pIhWfs1JzKHfw8Mi9aMMmJltmrhTYTVBucjMIRyaXRz7HM30+XODcTv+Tj7mqjF3g5Whq5tfxxy6rrSGwnP3Jcs8Dmg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(6512007)(66946007)(66556008)(66476007)(6506007)(4326008)(8936002)(8676002)(52116002)(5660300002)(2906002)(83380400001)(316002)(36756003)(6486002)(966005)(26005)(2616005)(186003)(86362001)(38350700002)(38100700002)(508600001)(1076003)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BkM0tbnfewsakNU7LZtTUTiEoQqTHFK7rWebwBWjDumngDVzsGRzn+wiLV+5?=
 =?us-ascii?Q?WSevywPxDSUNtoB4FqqjcAZhpLJgYNo5TOcE1n2zStOlZW1IPddN691+rLzJ?=
 =?us-ascii?Q?PxyeSXgOREZOleIQLY4B1ULS8wXodj5zDDxCqnqtOzNNf1NLvI8e7iHQypBE?=
 =?us-ascii?Q?lA5zgrkkfPvzS8EYpVMp4Ss9j2qw4ZVdLxwROjq7kU9m1ZZX19vy0miHH8ft?=
 =?us-ascii?Q?qIl/iubyshfjPBmV4QmgSmbAKouK9RGsCzAo/nkdMWJjDRXmg6gxZ832oSEE?=
 =?us-ascii?Q?aIJwf5Jd2AgPOoqyEJz0/WMk4iSKNkkGZiwdS/OAfLsu6a0ZNsFMsmyZ36+w?=
 =?us-ascii?Q?SEbMDc8laiuYJbwaX+fVkzRTqpHQ5+fYBkhI1ScdDKWWiAbWFNfDo9j4dacc?=
 =?us-ascii?Q?AWIy/ePJJy6qjQNS1dJNdIINNij6rSPgpljoxHm82+gHy8YrvhFydYK5Qi6u?=
 =?us-ascii?Q?LkTcx75PdQiMvaHJyGZSoLu51hbLR36gJaDHcnbpu6jj5Q9oeYNTPN2mM+iD?=
 =?us-ascii?Q?b3qsH7ysPHOlhv9TI9mpV6QV3G2LKUGMWrRn2TvSpIjeS1g5PU0LpmXJ+Lhz?=
 =?us-ascii?Q?KJiRsmwM03NwENQwXMp9eKAFnXkctkR25qb8gehZxG4oky9BzzTzvvZ15Hqo?=
 =?us-ascii?Q?4SCOI8jwqUucZ1uB/ARGzjlW+b4HVc8CiIVojKIS/mmj6LDb8mv+aPanU7BH?=
 =?us-ascii?Q?CNJjX3mzgT/Kow15eXzWpLn9K+FS6afXaULlQaYtrldhmk/KYiDaOMLvqcsS?=
 =?us-ascii?Q?s5QEgoj18nnKGYeIXFbgUv1D3VlC6Yp/O6IEl74EAGfESI7lxQxSn5kxCU6U?=
 =?us-ascii?Q?kiQrFJ10oZsaedS5DSRmGgPCBzSxz0W7dG2Luwkica+0/BjpgAT6Ap11dWRo?=
 =?us-ascii?Q?aj8VSjI4eLtG8FJ3fkic66hX67Jim72I2VJrox0pQ/BSpInh1XeoqUipE3Ln?=
 =?us-ascii?Q?8cJ1ZguCSPsy3JrBp5qb1XBG7flGtF8/FewGkprVqIaZxu7tQpv9TROFykdT?=
 =?us-ascii?Q?Lu5tz4NQzxErIPw/EFn5ijbg9V5KWIQGyhzLCrCbgmXm3KOIrccxMbqFdAhN?=
 =?us-ascii?Q?+ITcK8FI1YUJ1TLeOVCQUmdluRMW2l86KtdkrMadKsONeL4D3ZtzRNi+6+Xj?=
 =?us-ascii?Q?+WFCZQoFDpb0ONOe78UYOCwGhiAhobp1ASL1UdK1lJq8ht4x/pTEkdaYOJtH?=
 =?us-ascii?Q?BKHKsPNUCpPqqrrkUKMoJZ6OHs+TbHbv5wHZkhV6aEgvhA5CRd9Mac2qTZYl?=
 =?us-ascii?Q?F/i6t4aQ3Uo72o6633xGXswIgj7h6gR5twwt+oyASogr3mUTtn3KHvbl9Sem?=
 =?us-ascii?Q?B9US51vUzpKd4bUnsxCY6MsfTNAxKHshNsAYHCI6X1BOj18+5I2uKEXcNF4M?=
 =?us-ascii?Q?nz4457A6+XaYkcISVyOkCrUR+Hqr/nf1+emIzlwoqbj4+jyCNoANLlQmV/CA?=
 =?us-ascii?Q?kK4l+bfXaIl+LTDVo1Hss/3oAbunc2ibKGSaKAf/JXEjwXdJEdXh3gV6jF7S?=
 =?us-ascii?Q?cNG/T2FwKt/ClGssB4cbeDHI6Nr9FlwbvM8yWK+RgDbNfbTXFBqE4ssUv6FK?=
 =?us-ascii?Q?EZX1DpaSOMC+a90LzoLjtMT0woHIxT1ZtGGeICm7dM1rJQn7WPWfXaSD6Eps?=
 =?us-ascii?Q?fh5/b3PmFCNWo/Kie3aeGGXmYv+DGqRIXHvaCcwMWe4//AzO+z5Qu6Djt4xg?=
 =?us-ascii?Q?Sstpgg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd69a61-3a94-4f75-51f4-08d9ed619bdc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 13:22:53.4184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdkQ4opgLycmWTI52bTsJNRouJpOUkIAD1/qIoSFE6cE0pZfrzAydHroD3F7Olc2Kmaxt4jFycZLbkG2B0HNj0ufLbD8219NksmmhOy7mXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3357
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0d::72c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0d::72c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

From: Hanna Reitz <hreitz@redhat.com>

s->ioc must always be attached to the NBD node's AioContext.  If that
context changes, s->ioc must be attached to the new context.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2033626
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index dc6c3f3bbc..5853d85d60 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2055,6 +2055,42 @@ static void nbd_cancel_in_flight(BlockDriverState *bs)
     nbd_co_establish_connection_cancel(s->conn);
 }
 
+static void nbd_attach_aio_context(BlockDriverState *bs,
+                                   AioContext *new_context)
+{
+    BDRVNBDState *s = bs->opaque;
+
+    /* The open_timer is used only during nbd_open() */
+    assert(!s->open_timer);
+
+    /*
+     * The reconnect_delay_timer is scheduled in I/O paths when the
+     * connection is lost, to cancel the reconnection attempt after a
+     * given time.  Once this attempt is done (successfully or not),
+     * nbd_reconnect_attempt() ensures the timer is deleted before the
+     * respective I/O request is resumed.
+     * Since the AioContext can only be changed when a node is drained,
+     * the reconnect_delay_timer cannot be active here.
+     */
+    assert(!s->reconnect_delay_timer);
+
+    if (s->ioc) {
+        qio_channel_attach_aio_context(s->ioc, new_context);
+    }
+}
+
+static void nbd_detach_aio_context(BlockDriverState *bs)
+{
+    BDRVNBDState *s = bs->opaque;
+
+    assert(!s->open_timer);
+    assert(!s->reconnect_delay_timer);
+
+    if (s->ioc) {
+        qio_channel_detach_aio_context(s->ioc);
+    }
+}
+
 static BlockDriver bdrv_nbd = {
     .format_name                = "nbd",
     .protocol_name              = "nbd",
@@ -2078,6 +2114,9 @@ static BlockDriver bdrv_nbd = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static BlockDriver bdrv_nbd_tcp = {
@@ -2103,6 +2142,9 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static BlockDriver bdrv_nbd_unix = {
@@ -2128,6 +2170,9 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
     .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
+
+    .bdrv_attach_aio_context    = nbd_attach_aio_context,
+    .bdrv_detach_aio_context    = nbd_detach_aio_context,
 };
 
 static void bdrv_nbd_init(void)
-- 
2.31.1


