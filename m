Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7252348348
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:58:06 +0100 (CET)
Received: from localhost ([::1]:50188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAZp-0003vu-JC
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPATy-0006MO-N4; Wed, 24 Mar 2021 16:52:02 -0400
Received: from mail-vi1eur05on2092.outbound.protection.outlook.com
 ([40.107.21.92]:36928 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPATw-0005MQ-3Y; Wed, 24 Mar 2021 16:52:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdvISCbT7lEiaorw1CqZYiKSN5Sf35DVvl3hHfZ5IjgN68iAgd+yn3iiilmGlyYF9ZvvEPU+/RQq7b3zYXji2u3fDPrL8u3VJy2UWJnyajnofOTbLb1PU2MJgMfoGVuZJ5F98SLScGqEkAdTEd6BcDV8H2W6yS+O+NjQaxVvdW4zkMdDrGE7UN8a8vUCAQ4h/VzQ0lBByUDPObWCK4VAGXWDWiJDR/ndvl+/OpXG/oX5uI6SZq7DQKeTa0Mum+ye9bes775w0dRVI0Mz6Ex6DxDTQZeq8u7MvfaDZlCQoQlj3LgICZFkc/IzV03QVcuxYQP6iDeTZJm/QQXxVM4w+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LXXx9ulPXjxpstjADDnLl2sVDKfeh7GcxkQc6eREcM=;
 b=nJSXOaM8Xx/N6RNhbFdfYQuW6pju7sD3owTf5OaNoqNKt7TRyiruBLKLQtrHsBDHaZ/7xYMfb18guz8llFkrLBpulhymE+ngvsuzavAQ3OhtGFQpdJv1/eODRZhFunbs2Na1QN0997NWybtdzNpCSyS0p0uVyrCc5kX3T357/ZDWrE06D4jrrkwDqxo9Hh4+dPy66ZjD+uvDHXw91fnGYmMYeURjVczdsXMoo9ehfjfuFuU6csmuNxU5pFMohvMDSf3Fild2DdG4OxZh0tc80SH9VSOSnwC756H07jkrcKjC0OalD2t90R/CdvbbV35/zCSA2c2nLO/TY8xO9MJZBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LXXx9ulPXjxpstjADDnLl2sVDKfeh7GcxkQc6eREcM=;
 b=Q/CUCMl9SEv0NVOyUafWjZooNoUw3H1eJQVEIy6ZYXxikYyuWg8q567T9m1TrDSP3akcoEOOlanZyXVPeJ4Vh1h/NR5p74MJNLcvr+TgmEzk6N1CI4uANs/xMlm5o+Z+J6qLVDrH5AoaCvG64MeTwWbIV0UepasD8Z5hSwlTMUw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:51:48 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:51:48 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 01/11] block/io: bring request check to bdrv_co_{read,
 write}v_vmstate
Date: Wed, 24 Mar 2021 23:51:22 +0300
Message-Id: <20210324205132.464899-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210324205132.464899-1-vsementsov@virtuozzo.com>
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR07CA0022.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR07CA0022.eurprd07.prod.outlook.com (2603:10a6:208:ac::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:51:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92c71332-bc47-41e1-b5b9-08d8ef06a48a
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5447E5B80FB327F14BBA76C2C1639@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fG93SnpEz5W2De1zfxjPdjOncsZT8RbTyr2lax78Y79jXghBNsfa4okFmqxHzoH9AqcpToliOr7CId+0yovDAU/4nujlPZueBKZMD145Qvi0aNvrm1VfuwR0fhRsvbCfbMppLpfbvS8lcC2Oud7qVoYn4F818GBaYotNlsVUazeKKXfeC9yU/UOTEF03EquU5MFUWMTnUv5YXeoynB7ObYZSRAjUkcAezuWUAWcYt2jD0szUL+ccEOtS5PcyKd8gkqc/7US6nSR0CeXg2nC/xIfqUKlCE38b9/EEjvUMwgrwFoWK0uMn7SgpSaAU+YTcoll8WJUTsIIL2+9kd0Qf2oZlremeaC7wH1GeMNZ3tct9xFamQODCjzi81T+9hdBXYr+rz4xAlzGwXbyQbX6Ia3BtM5cRwkI6dVtPUNcDXC5UqRxpEwYGCKHUu55zWwHlG7otAY2veMpydsFq9s3cj3fmixtkbH8X4UQ1+nsdzMOCw94AbqdC4z9YsyaO7LgKsMg2DD+0fGR9Zzlxsg+kW4UVavQFKusgaQEtqr5cDolZQcgUaT3wNSv5H6lBzPmOJM7qHytwuNypH7MJhkx6pw1FknJ/NcpJGHU00iEEtpPRDpDvebF/YJqD/AJOhceTip8GJfb00FvdHLgfK9bNZVDqvjnPVv+j1p8laf9JM4J4xsMidM1g0p+2MCbaLhe4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(396003)(366004)(2616005)(6916009)(478600001)(8936002)(66946007)(38100700001)(956004)(66556008)(6512007)(66476007)(6506007)(6486002)(52116002)(186003)(5660300002)(26005)(69590400012)(83380400001)(7416002)(6666004)(86362001)(2906002)(16526019)(316002)(1076003)(36756003)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7/fYzdRXxsFLwJrq7/L7eaojBRBp14ZpA+LNvm0J4WflFTzw8RypXQC+ooNa?=
 =?us-ascii?Q?oXQ1kn5ZtfefpZoSfnY/XYKtatedwpvcpwK8xlulBHICtOjNWK/gaLHAAO9X?=
 =?us-ascii?Q?L4LcCbHfN2thZ5v2A5ZKkgqdN0ERpCaYhN8eCrGmVLhfDy5AgpiHFlFR73Sx?=
 =?us-ascii?Q?m3r3lC2avLS3bYyx0bLkyGZ1tOtztCNjACCFINhA7expj7pnE0O4+WbNsUcK?=
 =?us-ascii?Q?dm/KRTVW6HxOMz93Ca5PPifKBCy7rve9R6Lg+WE1Ff7LYEJ5wLE4dXyXQKv9?=
 =?us-ascii?Q?zHYmk0dbfjJxlYym9MIpOr4M52zk5eZl8Mw+riPakO7Y3bvsShw9ugrDGb1T?=
 =?us-ascii?Q?BgUU1jC/Nm8PBesyMFzAiintEHx73hAGpUuRDpPXvNAr+bYki3swA/7RQfBA?=
 =?us-ascii?Q?sSt8IEk3tDKv4dk3sWf4UqIRYOm7uQeKRZ3Ndxya/1OYH7r60YnkHS/zV5U7?=
 =?us-ascii?Q?tFLYutvYfDgG+3YzsCwI47g5RMl9J8T5y133DW0NEACeKqk0ZwUVmdhh9Wdu?=
 =?us-ascii?Q?DtirMSUDC3ocyWVHw8rH1hMwm4HH59Q7EE7eIz37FBXMmOxfanD59vlMA8v5?=
 =?us-ascii?Q?LL0e/Z4aKHklm5jpJhnwFJfCh7MtUZJRvm0fdae+AF79hmovbHRRSIohN7hX?=
 =?us-ascii?Q?BX9IKMdvZpGn4PGJOkVEiAs9UxOLZN7S9UqmRPxtiPtni9INDwOHpJmo6YLX?=
 =?us-ascii?Q?LsLIXwNGDFYD7H8RWTo0OQoDp6x09+JHW1AGs2Fgg/qzihZdPRUo8lFjbnUz?=
 =?us-ascii?Q?Bb4QXgfKKLbeVai4kaMWDAC8LNa2tDDppbz2bQDwZhUXU2ArJYicuiV5wr3C?=
 =?us-ascii?Q?7fk+io2KS2WPAaOsyzDqAvpmU7qHs0rgqU1jxVkjGg/bxv9We4o5zfIdsRKP?=
 =?us-ascii?Q?eEodOZHxjQggHNJBkqdwnkpDAKGXdPl0EA9jwFy0+S49nq0oQZMH5LzcrfA+?=
 =?us-ascii?Q?IKgvshb/XkP4WXaOzjrgnds84G1qPdlgqcecfRCylyLeL50Zm7dn2WjqsNV7?=
 =?us-ascii?Q?PwOkgOC2dMqRl38cUA31uO9Qr8dCSyItgYtaELb/rpzoADvZsYmfFHG4/IIA?=
 =?us-ascii?Q?HMKju+d6JgeUY5KIrKhpo5Jb/9JqMzc6xiUAc9zqXi5rL0rajIRjMu39cAE+?=
 =?us-ascii?Q?7V4OTlAKw/b9M0kQg+O1zFBlcSXmgLi26ZJKMQi5RCjT8ozJOqruzLxO9+QX?=
 =?us-ascii?Q?C8g/ROJ5CJajnOt8K5UWTzZBxg+sTvccyb/gDXIWYVzLi4HYpYx3WJZAMZA4?=
 =?us-ascii?Q?XwAEuzADOFOV2AasYyvkLPEnQvbjSTVdsKpGknMbcXS8lE/mBSl+zy+e6wKy?=
 =?us-ascii?Q?eq1DqWWpcP+wUeiiGNeCsedS?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c71332-bc47-41e1-b5b9-08d8ef06a48a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:51:48.3595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJfjNO8630o2GNDG/E7I9cKhc+2/V+ry7dx4qTWzyQGUDM1z4P5/r/Ubwv1+A7MvUD2PGaGKq+J2eNxLFOQNU+qW+dkYM33imv+8sDlkLa4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=40.107.21.92;
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
index ca2dca3007..3bbb852da6 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2718,7 +2718,12 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
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
@@ -2730,6 +2735,8 @@ bdrv_co_readv_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
         ret = drv->bdrv_load_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_readv_vmstate(child_bs, qiov, pos);
+    } else {
+        ret = -ENOTSUP;
     }
 
     bdrv_dec_in_flight(bs);
@@ -2742,7 +2749,12 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
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
@@ -2754,6 +2766,8 @@ bdrv_co_writev_vmstate(BlockDriverState *bs, QEMUIOVector *qiov, int64_t pos)
         ret = drv->bdrv_save_vmstate(bs, qiov, pos);
     } else if (child_bs) {
         ret = bdrv_co_writev_vmstate(child_bs, qiov, pos);
+    } else {
+        ret = -ENOTSUP;
     }
 
     bdrv_dec_in_flight(bs);
-- 
2.29.2


