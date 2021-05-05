Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DC43735D9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 09:52:47 +0200 (CEST)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCKq-0006vn-IX
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 03:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIi-0005Ee-ON; Wed, 05 May 2021 03:50:32 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:41697 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIg-0002WS-P5; Wed, 05 May 2021 03:50:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq8SGBTcV7xsWY9QVoyrGtEHMTZT/GIUFokySJm6ZIAFHRzg0eFCL0Cvdd2IUuVd+qQqzhXGOCgR+qc4w9IMZ1WF4mZ0ifpbsf9I0VS+FBmP+mq+IvcikDxC2Pu9wR8PanxpRQ3Cq76r6r5fljtdrse9T7gbOGtJ2GAhxgAEhx1B9JTgHQlC+D9SmR+CVGytlg8NZBer5WilNGApsMBT9cXhBIfs1WqM5vN7ft89XjyvdDPIJqjV39GqI4vJXUG5UpMa6qHs+61uoJvOaE8oN9K+7vVe+kYZuDajZpt0pkZC0EiqATr+WiCH6aRbVwEzDmPh8pOG9xsf72sfc5ZcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiV61dGe1qTIVM/d0JADQuX/3yopVilba7wx0Z/kzUQ=;
 b=FiVIcz40wkgzi6Tv8jSNFROvHsuPDNxpx4W/g21wNvE3R8GMOqVRxKfEvcU6JQHdy9Ap6Vrdgj6yBd3tU7LJeU/7an4w70EUSn8+eyu7OQovsw/0Uch8aXRaRo2Nh4nHffxzDZSf4VhMsB3WAYKv5awnlY22iTUmXVbNTr5yGofIIRmObWAgortlFlLxK+P1Re+3ZxZtXLtbIQsSb6YxTFReOiFQltZAfe/o3DKtLdkwMCOQSYX2pzu+uIHemoq9oiIGhXqXDQvAvbA7Cj6wex7/4ocyl5I7tybOyn19MZzmRCLwy5N49Dbh6DAD7jDl1NhlFQL/MtKPdql4Ho2zrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiV61dGe1qTIVM/d0JADQuX/3yopVilba7wx0Z/kzUQ=;
 b=USrtCKf8GXEKU5/AYeJw4Q9iNsH4Rqxwo8Vd3LlF+yk4A2SgJqdPmwTXjXT3Iuy5+HqhcYOF6xDHZSrE5Do2aHRMhhca/sClboS9j5LsmvLVXbultL+W8Qg3ZD+dcnAAWriu+iz5q78ruHUdjI2YJ1LxZU3zn2wJKXLpt9zx7mI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6839.eurprd08.prod.outlook.com (2603:10a6:20b:352::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.39; Wed, 5 May
 2021 07:50:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:25 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v5 01/11] block/io: bring request check to bdrv_co_(read,
 write)v_vmstate
Date: Wed,  5 May 2021 10:49:51 +0300
Message-Id: <20210505075001.45041-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210505075001.45041-1-vsementsov@virtuozzo.com>
References: <20210505075001.45041-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2137c435-9b26-4758-e260-08d90f9a7136
X-MS-TrafficTypeDiagnostic: AS8PR08MB6839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6839FF10A12410A32457A05AC1599@AS8PR08MB6839.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LEwXph3RahvCsLi+Cix0T8AVnHe4bLR0Vod54cvMaIlstyT78iQSA3OECybOIMJKfgQbU6sY7GrkqgopDze9VRFBeLyhrnMFawybW43sMf7GG0dsebqsK+5/vpfJo3omZZlhtE07CK/+TylQ9PswoEkqClSHbh5aqNT3HQ59elHZSboPeQWimuPoFdupaWtqLoDdNwVMoRetbGQgRY1UHhJYP5kUMoSF9VmOCDSHXPNyaZ1E/hHwqYaVWiKYR6gtGT3EKZXoaeGZVkqCozCF9h/PLmCff+uuhXBmAcf1+T37n8PNTj6a+VweGWKQZpA7blSZ8KSLZPE16vil4I9WoTynMweENzLy3nb+dWD1qUDJMBH7mSWqUUjnlPIec66Qxnh3ILRBc+WIrdsxgOC2zep1hbn987e1Vv953XYi2JUsdtCS2zi8iW8xBoKrDa6bVZ8LZXQSSFL7zJaz8zWeuSku47w2QYOMM05Etiqca+9CTtOQARqyoNw/LTi2XmirUH2xhKZETBaIhdChqCdDQl0MyOP5XkakhNM9iPUM4Fj8+uv1eRagCO0OUjEua3lKsA3gYMuMqv2PWvHR5BJvPI5Vk6vWsxVfy6DWdMIyV39wUAbai+dbuoZ/7sviRRlkmnaNBhhp4TQJy2Lw8v37jvEiQE8RY2t8WhwhIfmp/Pmz8TWCcx5Z/T96B27WWsJ3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(346002)(396003)(366004)(136003)(38350700002)(38100700002)(66946007)(26005)(66556008)(6506007)(66476007)(86362001)(16526019)(83380400001)(6666004)(6916009)(4326008)(36756003)(478600001)(316002)(8676002)(6512007)(2616005)(2906002)(186003)(52116002)(956004)(6486002)(8936002)(5660300002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zMr/e3CpqyYShjl4pTrrO5HX1w3kpMQ2oxKJVKtyqioTZGNiD1p9k9A4b3nN?=
 =?us-ascii?Q?LSZWBLomKPmQrb1RP1fcy/28fc12jc9chWX//CNWfy+9iAl+u7V2b8zSDVVm?=
 =?us-ascii?Q?ceYcK4zWdey0u4rgI0biN6RXYFPnW50E3Zvt4V5ndMJuWCMm30ejiSODw6GW?=
 =?us-ascii?Q?TNndSWWd2JLe1S0YI7cP0J2j9QLwV0TXKdNYSRVGGIHtvfot29yrlLYtGa2s?=
 =?us-ascii?Q?/YwCIzsW/FNMdbA/KR50QZ07n1ktxd/VBfu2cHcXHPZRLR6nU6Z7iGZNIhWo?=
 =?us-ascii?Q?5O7k8uRWlPkwhR7LXUUOOKX1OaVgcoWLeZtNOV07FZleeheVC7Ic5SDWKDDP?=
 =?us-ascii?Q?rArtyAsp1XE44qE9lgHS2inrurfHVYbdXUmeKHi8Z2OUQFL5QkDer/l9EkWy?=
 =?us-ascii?Q?OSbv2PwO+LDVWwW3Z/pnPXNzp6ycKcTkr3GKW7KA6VwdPf+wDHsXayadaePA?=
 =?us-ascii?Q?HAaw8jHHSKNrtqCJHJwhLEOaSktuXu6Te303mrJByK7HuEzb1J/gEnQ9eD97?=
 =?us-ascii?Q?BUMwwY9OvuNCvck33aDAnNhyjdipaUrihpTv3rsBkOVe8Z+sVrqsJwHy1eAj?=
 =?us-ascii?Q?vn9gmXZCFmnRhi5ev/xiHmn2wfv2Xpk5nV2RrxT5+ezGYu1f6ZaLmv1C72Ru?=
 =?us-ascii?Q?78JgsbBLAoTEYW67mqznvzzVzn2vLfp0J35NmSmBTUzbAJKwTuOe06oSfr5O?=
 =?us-ascii?Q?2KkvwLCe9FEuf95wbH733hZzcqVq1rUDaaL34P0uZYOp3HeVXd+l9QwQpfKH?=
 =?us-ascii?Q?PLMol6YjefeZu9/xCDWuamxqRaFbgkvYg/tG+mh5bjhec1D0XrdvZUBmWWjJ?=
 =?us-ascii?Q?t5eofHZNX58TsoXASAlI91VkcgosBlM7QUF7Qa+9ExPwbM4mNlBvgcR4ssNx?=
 =?us-ascii?Q?MVcurD0VjwlCB35ottdEyJEk4vEDzNIoAApcibViVtP3x7/3aCY14LjlN0NN?=
 =?us-ascii?Q?ThBzH42pIblyi+gqtIHUP8eQYn7E3G+4WfMRrUjLgkpV7KyjqU9zKpw5X2Um?=
 =?us-ascii?Q?Q5nJI6xYUqxpjlFyCNRlykveQYPwdeYSfA0RY3QN+dmwnt8HJlx2msqnGR+I?=
 =?us-ascii?Q?Gi45pa2Nqotc/nDHPYdDVoVVzsVizGVSuD7y/Av8LxFzWLOPJ4Pq6ooOnG9W?=
 =?us-ascii?Q?U3ttUlm8oxmU3BecWKW1QO42fTTP5Ygxz8IrBxQ57MPYycehrV3L5x6WeYOT?=
 =?us-ascii?Q?JkbmjQJj8/XyLkoHL7cd2IJYAeE99uNC1qXjsEoGtGx2jx0UIQlBuWz4l6oM?=
 =?us-ascii?Q?ITGGJHlJAC2R1EP4AafPq9qYTUFL+GE0De2E+IZeIwXTRL/QYfpPSYXPApA2?=
 =?us-ascii?Q?2Nc2lS5z/eVkoeusj88/2XrK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2137c435-9b26-4758-e260-08d90f9a7136
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:24.9782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lD4D1LbQigWrbSFSs0j4Geg9urM3bcSdVqXIQeLzJrTqTYLywcGttqLopvDq4xYpggPasoyYaCag45ZoKchfv+A1VlwsE1OHaGtxmN3/ckw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6839
Received-SPF: pass client-ip=40.107.8.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

There are only two drivers supporting vmstate: qcow2 and sheepdog.
Sheepdog is deprecated. In qcow2 these requests go through
.bdrv_co_p{read,write}v_part handlers.

So, let's do our basic check for the request on vmstate generic
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/block/io.c b/block/io.c
index 35b6c56efc..3eb6a38008 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2745,7 +2745,12 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
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
@@ -2757,6 +2762,8 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
         ret = drv->bdrv_load_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_readv_vmstate(child_bs, qiov, pos);
+    } else {
+        ret = -ENOTSUP;
     }
 
     bdrv_dec_in_flight(bs);
@@ -2769,7 +2776,12 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
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
@@ -2781,6 +2793,8 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
         ret = drv->bdrv_save_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_writev_vmstate(child_bs, qiov, pos);
+    } else {
+        ret = -ENOTSUP;
     }
 
     bdrv_dec_in_flight(bs);
-- 
2.29.2


