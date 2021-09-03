Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A543FFE37
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 12:31:28 +0200 (CEST)
Received: from localhost ([::1]:36716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM6Tm-0005hY-U5
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 06:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6Qy-0002sN-Ft; Fri, 03 Sep 2021 06:28:33 -0400
Received: from mail-vi1eur05on2111.outbound.protection.outlook.com
 ([40.107.21.111]:45006 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mM6Qt-00025z-Vg; Fri, 03 Sep 2021 06:28:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAqU5uRSITXgeNqbtUUVtaBTMeGK8IrzuY2pwrpm2FJ1rRcVspdWA43ENNKM4fq6aU8osR1pKddKOBli/6Lt/BQrVrEoraJTQN1FX9yBunzztQiYGrLQPnNMCD2E6e2urKutuoDqqy61E1KY8mu8VPV5wRRlQAGckAE/OPbdXxxbdgDe/IhgD5srgOmOqDuWoWyERZKjapoE10K7JSFwvbxorxF+9w7KHMpUglew5a0wxE1HVbAWC5IncoLnqyMcIN2XbBI8HQRBmOt0K7YU+29qx/bVJbGnSzVWpuREL6Cu7twTjHgCZIKxs2spAUavYOT3jXBkKd6tZYa9XG1p8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9UVOQU91pgfFowIoo0BNRqZZ4KeR3qCuvYPHk6zEBVc=;
 b=ViXP59CZrdC2NTDA9Dx4eVIiMauDu+36o8OuZDRpwYutpcns9jc1K6z6SCYXtyuQWNyds1tod27uuxmQWKCZ+FDPcfuJ/Dg5xhPRI3GEBi27srf4wOtNzSalbHvSWPxi0j4X404mAD8xcGrv5McaG7/JGOtNVE5bRIn0IiWqsA3uCVwx+gIp4zMCR6STVNKj4o1CPBXOelJdJTyx2E912KoZ79iu4cXB6Mz8V0Gexvzydhg7CflwYKX0XfEtxixci/y0B50uzDoSWFqFO+pGIxvrVB8+N2RK/LMqTQLRNo8vvZGmfyvR8g6iw41vtlzxPS+QIHZkZHNpDnJIANEmXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UVOQU91pgfFowIoo0BNRqZZ4KeR3qCuvYPHk6zEBVc=;
 b=Zd0g/SFqHNcOziq2VlPhQvzJ/NKS7XJsHfAFrfrj7qtjCNnAyFdwSSjjlAiSVeQqaO/0CP3yXZRS/O2CWQJg1vH2bC+dKKNcyxoJTm1yBzMSbCmtETgGftp4arRTlVCiY5u8N0leMYwnC37E42uRfLlExOO8olL0VXD76pPlsIk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB7009.eurprd08.prod.outlook.com (2603:10a6:20b:34c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Fri, 3 Sep
 2021 10:28:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 10:28:24 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, kraxel@redhat.com,
 idryomov@gmail.com, berto@igalia.com, philmd@redhat.com, eblake@redhat.com,
 pl@kamp.de, ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 vsementsov@virtuozzo.com, jsnow@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, ari@tuxera.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v6 01/11] block/io: bring request check to bdrv_co_(read,
 write)v_vmstate
Date: Fri,  3 Sep 2021 13:27:57 +0300
Message-Id: <20210903102807.27127-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210903102807.27127-1-vsementsov@virtuozzo.com>
References: <20210903102807.27127-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0163.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0163.eurprd05.prod.outlook.com (2603:10a6:3:f8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 10:28:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df23b71a-93f0-4cfd-ce21-08d96ec58f68
X-MS-TrafficTypeDiagnostic: AS8PR08MB7009:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB7009F57C637EF26945A94B8EC1CF9@AS8PR08MB7009.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K5UlQ1SbrClRwc2XPdIhGOuDjyLx/7kIdQy4gsVVMPdK6X97qkto8bqxRRR0ddTUhiF7s7YhywyI1vfmk6GLDH2Nh+ZLjvJmbsEDV2dMGM5/mJ1CZY8ISICZbsr0FAbb+idriX/8thxUgGaO0OTRuCy7Pk2Ht4dymKApBjxYD6RTk/3ZcOUTDaJFXtsSRXpBF56CxElKLilzQSIDnUZY1BmoZvAuPhbDRcxLxBGHNzas2EtcmeMS/wIFBGhpmNZEJQecYiyPuri3omt2WG9DLyTdAndAgUzeCFm9mDw7GnxylOxiLMvN4JL15vXhGVV/F5/UjdwJslojHR6eG7t5QDKD1tDsh5MDyU+YnrWVpvsssd626NDR++B0/CjJTp3cxBnSLlxQ3GSpLIVWgfcUvkLXLS0u0ILAu+da/Ge67jqMB144Qo6VQR2RPBrgfLjpZZMSYJwf7p0HuLHLTqfGPt2KygYMRPNhbbBdVz+J2RBFOUyNCdc2XCc6zoOMiqM6PMhtn2X9Zw7Eh7KB43n45pG1IBf7/xY2s1AgJXTEd5AB1Bx+WPE5YwU2BJ/O2MTtFNfdl+q7PV83tR0O8aao05qPqigW+X70KDHC8dORJEQxKxTzXaftkpegudpH86FSi12/ky5LjxnIku9LNZ12S46a7I0UN2QpIUFL4nUGwt+5jmENSLMguQFcpmG4ortD5rVM3+SZi9QDQ0S6PmXbLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(186003)(6666004)(508600001)(36756003)(66946007)(6512007)(66476007)(8676002)(52116002)(8936002)(83380400001)(7416002)(86362001)(38100700002)(38350700002)(6506007)(956004)(26005)(6486002)(2616005)(316002)(1076003)(4326008)(5660300002)(2906002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LSdSCCeK4Zl9Cy5sN2nqwmOoUsIsZm2s8FvhhyEhzmwckSMJ5H+rxM0T2u0J?=
 =?us-ascii?Q?By8SrcfEAzixAGXSW1xHWjH6qtAGwrF/c9UfU1m2aWv3DdwamIic8RT4t2WP?=
 =?us-ascii?Q?mfGB5IO4tsgK75RZs9DVe5d62Qgx5+gyVflVPhuK9G2Nm8L8obEK34Rrw3ZN?=
 =?us-ascii?Q?ZX9XDf/bXTh+Ty/thnJSGpYvd7ACnOtxb8E1h7hM0kKwxBTWV2D14QNTGCAL?=
 =?us-ascii?Q?VWPp8jyVRrn4VVwkWmwFTsD02a5Ro2b5UtEDbZMtePR+EpHVnlpjTdWunvmI?=
 =?us-ascii?Q?GW1y+0nXAmWnIf4/+wMxGsWqFc+8A0IkU/BMcp3OCb+I6VVzt76TVTK6wMT9?=
 =?us-ascii?Q?XmhJVUUSkzi897xdlzzrptarmhghFO/J/ImZ8qguRFqUV9ydBpOXPCfN22/G?=
 =?us-ascii?Q?wGHn83by1jiClD0qF3yZMNF4bhFLOihLTxuJpKDFDbM5a8tjBkrH4S/0TdEs?=
 =?us-ascii?Q?VksWIV5hZ2EacihlTWnC5TKEBqGJvqwfrjmpCm0tWj3atsF7rQY0U61RL56a?=
 =?us-ascii?Q?/GPqy2AmwJnReKOZNOQGMhCwUZogs5zzIIIp51P/Oh40TB0Ps96F2nmBSOyC?=
 =?us-ascii?Q?wiQ1NDLvyJ6VSIolP8ws6D+MaJy8LOx2I7p2Cm8XQXGQNfkEcMxG7gH+L0/4?=
 =?us-ascii?Q?3TmmaRUFXzrxJ/y1eZl5xZ/Qwag3qKbEqfGyjjAdbW1GAfVa4GYOZVYgjpaT?=
 =?us-ascii?Q?3MENCprQp4F6NzYCyonqlAFkB9D+jaAc5vRn3ER883zWISrypUCFIDJLTUAb?=
 =?us-ascii?Q?AiUvir0ZuAHMtT00Yt4Y6hXWs+u6ze0/6FQzAQGxiNhYjMmXXPD0Wk1obLst?=
 =?us-ascii?Q?X7C/aVVp/w2D3H2RAdodpEonXUYA3menclXYH5Lyc9dxaAunXCUjdx/pbuEn?=
 =?us-ascii?Q?yQEi56o98li5gfQQ/uqaFha4wKIB4kfGKFbAtLT/JFDnC4q7cb4CtRb/0CD8?=
 =?us-ascii?Q?emVEHD7rkVnYSUoKkAO0pwo80jHYBMs3InSZX0vQTcnjYKInYws9E7oWxBdl?=
 =?us-ascii?Q?xJzcAV8hRRWJCe5+PHgDqeqqAp13cUMZPe3VycJQ3HHDddfZb8/0+6dCQy0R?=
 =?us-ascii?Q?vzJWKVpfpUbdsh4G/xG8fxp3jctX/iwYKtl5DA68li4bZ5/9NSugM/Gy6cwG?=
 =?us-ascii?Q?97JkPMHhrAHwCQNiq4ASL86qOcDdoiwweEmetAqsYqfVwezJz6SkmQ7tZjxY?=
 =?us-ascii?Q?B+T0Q8LQAfNOFigeZsHBMZ7uxfM64i06yh62/2sESzCgRx+Irx4+Xu7xpGtN?=
 =?us-ascii?Q?pn9VX7M47kMfdDeA4WXIxfFGU/jIDgEdEFGzRkbbWfovsojk7j/43AqbcW9q?=
 =?us-ascii?Q?pWe+jVhg9ck29mrgN221tJdS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df23b71a-93f0-4cfd-ce21-08d96ec58f68
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 10:28:24.4851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gUCtNpGp9dzD3oDEoUGYYkvyJeMjYOvWEX52EOpxdVY4uh4KzrjMY8i/TTQXxxbAgrLa1cevPXsKWv3MbH+oA1LeRv81DQ8DwxySPueZrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7009
Received-SPF: pass client-ip=40.107.21.111;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

Only qcow2 driver supports vmstate.
In qcow2 these requests go through .bdrv_co_p{read,write}v_part
handlers.

So, let's do our basic check for the request on vmstate generic
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/io.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index a19942718b..542e0305dc 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2751,7 +2751,12 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *child_bs = bdrv_primary_bs(bs);
-    int ret = -ENOTSUP;
+    int ret;
+
+    ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
+    if (ret < 0) {
+        return ret;
+    }
 
     if (!drv) {
         return -ENOMEDIUM;
@@ -2763,6 +2768,8 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
         ret = drv->bdrv_load_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_readv_vmstate(child_bs, qiov, pos);
+    } else {
+        ret = -ENOTSUP;
     }
 
     bdrv_dec_in_flight(bs);
@@ -2775,7 +2782,12 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
 {
     BlockDriver *drv = bs->drv;
     BlockDriverState *child_bs = bdrv_primary_bs(bs);
-    int ret = -ENOTSUP;
+    int ret;
+
+    ret = bdrv_check_qiov_request(pos, qiov->size, qiov, 0, NULL);
+    if (ret < 0) {
+        return ret;
+    }
 
     if (!drv) {
         return -ENOMEDIUM;
@@ -2787,6 +2799,8 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
         ret = drv->bdrv_save_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_writev_vmstate(child_bs, qiov, pos);
+    } else {
+        ret = -ENOTSUP;
     }
 
     bdrv_dec_in_flight(bs);
-- 
2.29.2


