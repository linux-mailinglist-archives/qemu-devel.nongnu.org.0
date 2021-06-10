Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B7A3A2936
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:19:00 +0200 (CEST)
Received: from localhost ([::1]:38086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHm7-0001RH-NB
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHct-00065o-M2; Thu, 10 Jun 2021 06:09:27 -0400
Received: from mail-eopbgr80109.outbound.protection.outlook.com
 ([40.107.8.109]:1541 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrHcr-0005Ca-3X; Thu, 10 Jun 2021 06:09:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQn8cN82CuzXZlbiayG52w4F5SnjOSrfIHhXl2MZK9jsehIwnrS49oaERTRlusG/JJ1UpAifk3aa7H9PXvOYuofmwOwx9EC8e0lDHSCdJEn+sBiI99uYf/hTZoUSjASvQVBVtvK3Rmtyfs3mH0hux+JdNGtKjVhY/cE+H/QJaZsKZs+QYcj8ECqwMQdRcJc00mz/ApCcG8kpdjhjUqKObcbeOR/xGyzbwf1xolI8jz+bllW1GLmsjL54Z5Dxq46NawjZ78hHXP+S8s9FtpAf6DHzcLwFQeT9MS6iykqU1pcWtpb1MFaHBuD8rMI99Xwm0EnWDbg1x43kcn1llOcF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEIHR4DUExBaBDw09cjuRP4zRocsACVRyz+FNJYATTE=;
 b=CKPqRiREEt4Dy3PoC2sSp+mbGvLzBwBdQ14syS511IAkkhfyHmftEC8wZ1nTNq8vzSXuE3YnU7R+8mOtD47gb8B2L9h+rUBCzN9oP8Qr3JQbFDGPv57dfKil3mAdu6FlnLaGwRPTZmpk0shj7TpUN5CUVYlx/8vnENxvRbLPO+SNItGbOU7hZbEMKqE0Tc9k/jAtoVXrzUTtAhjdHE583X66edQasPNediYQUxc+ioWgVih6CQT/WC2PT4JIjjKmUtQ6ckxWx0hUgEMA4mVJtUc3LUCXj9pizQL/MvDGdifpKRubU8z2QDf4QQLqdgaSfbrONavULDGu6ALixw8sVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEIHR4DUExBaBDw09cjuRP4zRocsACVRyz+FNJYATTE=;
 b=SOGjiqz++J/1XkGh+B+BZAQqipNDjCtUE1zAyUqvd8EPb+5khGtxkNXb3p1gIuoltb5nCukHhdfhFA0f98r1o3J1y7pYcMuTxNFtQt8vpOx6wFUcR09VPQ5Inu1goOn8A9kCSAfc11rSwrdkgfBPc0oO0oZ3s++gGEc6ZcNazpQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6790.eurprd08.prod.outlook.com (2603:10a6:20b:397::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Thu, 10 Jun
 2021 10:09:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 10:09:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v4 24/32] block/nbd: don't touch s->sioc in
 nbd_teardown_connection()
Date: Thu, 10 Jun 2021 13:07:54 +0300
Message-Id: <20210610100802.5888-25-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610100802.5888-1-vsementsov@virtuozzo.com>
References: <20210610100802.5888-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1P192CA0020.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.22 via Frontend Transport; Thu, 10 Jun 2021 10:09:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9242981-bdf3-4f0f-496c-08d92bf7cc0c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6790:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6790FFD9EA8FAFBF8EA9BB98C1359@AS8PR08MB6790.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xwxPsClAnm75AzojhhDMPYZdEWQ1Nrk/othNyBZVcVgCQrSj9+aaDqh5l5Ueq168rYczPZfTotC1r95CwdiohH0zF3sny7xX/AftAAPhvfnWvsM0pLqxa9ZMtRGJp/9GZHbEQE3UYYDD4Yv7ml1NVk3KS2SJUxWGy/z4sjGfJP9lpK5pWw9G7+FLZRLamxO/+LRTuhAmDyT6oNTQkh9nLFVgoc8ZOlc3PZlw5wd5Lnx8KkHoQ+71NTdCTwqiMoy9bokFWEjUmyl0ZzuSduz4w3JzT3A/MlaQd+SSY+9g0rrDW0MMoiar/oul6nxm/pEotS6GUiANe9D5TX3VK+lXUoGI8DVSytCsFRs2iQs94PnmwpUy/aa8mPilpPY2THfNvuBblS7xg+GiAg3useJUl+JbmvGKAE2jtkhp/ozSFDgmrTginG1y/d0kuM8JcwGQ9Dn6txxRDPBOTbFo/82w7UR4kvB3Im6fucjZBJdJV/w0AE/OTTwdqTx7DFUZFEkQsgYiC0x2yozRX+kWmFyrA0JEbOO9Oto29A3zg3fTuU6p0vSHCFPxs/gMye8qixgJfMIb4deX50ljsBtHy22soQVOnJLT46pQJzbVhuV2w2Wi+ENeSDnZ6aZw+vKqfHbA6jd5TXPBhAPSyY4+XBbddoWItef6BCt4lYE+shYH4e/CWa6jTiZJOqfsbrLJzLtq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39840400004)(4744005)(478600001)(16526019)(6486002)(6512007)(83380400001)(6916009)(66556008)(6506007)(66946007)(26005)(66476007)(5660300002)(2616005)(8936002)(38350700002)(36756003)(86362001)(52116002)(8676002)(316002)(186003)(6666004)(4326008)(956004)(2906002)(38100700002)(1076003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QkOIXfQL2ZMdqfZor8ssgxhm8b5RGGwE7Kb8qjFnfMNrZDvN3E7YhmkkB37K?=
 =?us-ascii?Q?Eb5cAWglWEzoZJYQ50ho2EWxWOJhxg869eOtjvQ3okliRFA5k3sipUTOTh2E?=
 =?us-ascii?Q?IxWW1cNphUz2T+HcI3wMYRJMPpAlzLR8pe9d5tCURErbGUTCFc8GI90DQe+b?=
 =?us-ascii?Q?OsvbSlOahp81cXEEaxfKuZb45QnhgwLXSVLA84RiRyy1uBAM+al69A+gx0Ef?=
 =?us-ascii?Q?j55SJ1VNV5rO14bk3EWaCl0VcJ63vA26K2xYotNZAPMjtqaxJjuC8gyOqOK/?=
 =?us-ascii?Q?XxEFIzSg+auJ3nNzhB4uhBPU7ejmYDpVgmNZJFhw6nxgk5eDyIP0hz5ou8Ki?=
 =?us-ascii?Q?tMikvmJUXmPHIZUPaLtrfMaYL9FV2nf50hwHTmd7q967ug0DCOnlyaBx+X7W?=
 =?us-ascii?Q?fdDilpSmXsyUUxbpDl6Y1ZsWdKtpRiRH1MUkA2C3j7oD48ybR+cmBcMZIZa7?=
 =?us-ascii?Q?RExqADuQZtdGUZhS/EzcZmOtsDFwx15ucCtS7T7tXpeQw+h5WZngxKvFZeQJ?=
 =?us-ascii?Q?vlGMr/z7TpWGVcvubeMDwV+qYA7pWZmhvz7RxLX/i9+vqVvJPPaPf7rWPZBx?=
 =?us-ascii?Q?e9bU/BpiDiZv1jBDHGQOTzu4uu4/trhCHybQgSJUXQV1SNGbTq1Myb3REDPX?=
 =?us-ascii?Q?PC9TTN7IQmFyl3PFk3QD2E8/QI5fkRqmBgLkHnIWqdR0qaHfNOoPMGfRcj1+?=
 =?us-ascii?Q?xgjvsCo6Nx/1hn1MjZc5GXJep20J5PPMeJu8y7jKxOTVdRfN7dTM+yoiXGff?=
 =?us-ascii?Q?I2xS7jAAaPronXHkFl8RutW9tcepJzgUYyv0yegrCzRx8kKB8lyedYaEiQ5K?=
 =?us-ascii?Q?f8f6eaxw5yhtO4zOS9/Voip/UWVOOvw3gyAVZ9EvIxl8W15z59IWpj6DWYQz?=
 =?us-ascii?Q?PrrBHGLf26PiFn6pEVOUG+I7ByEiq+TKWYfkp/fPP7KTVf3edVKhF6sqU6BF?=
 =?us-ascii?Q?FHiVRey7Z9JdvD5l78/Hs5CdHxpElgZU9sR8+fcMDmwgWf/rLE5f1eJnsnFv?=
 =?us-ascii?Q?yZohIM0aCYwAoHV7pG+J+aO0BIFOWLGOX6jfoMWAwnJ12p7z6Lz9QzV2nt6T?=
 =?us-ascii?Q?+cdJL8QiJn7LVp9kZPnbJwqgQpqE/RkSRSA0UR0jwqx7rd+TFmc/aGdirCJ+?=
 =?us-ascii?Q?vCT5S/pqFuzBRzWz9vxKjLbPKoOaGT8M7IerTvYLujeQodJPnk51Yx/tg2lm?=
 =?us-ascii?Q?JPhqfH3AzySoF3y2nheXWzl+nxt2Y5goVnKHt7qELx9GezK/JF0v6Kr6mcbZ?=
 =?us-ascii?Q?Hhh0V05XoO6lZKgC04j8IUXIBUiZdarkN5H6Pd41gkz1ltAzK6g2ZACOTIa/?=
 =?us-ascii?Q?QPHRLngiPuK528PLXr1kMUUl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9242981-bdf3-4f0f-496c-08d92bf7cc0c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 10:09:13.1233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgOAyo4n71rLzAVrfTgBxUiRWg/rZ6DX/GOP6wgePax1F7YVGTLsp6Zsga/9oBxqN+EXQbV08rF+HuRRReZAjJbXMJEHopccUoy9UFrRc3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6790
Received-SPF: pass client-ip=40.107.8.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Negotiation during reconnect is now done in a thread, and s->sioc is
not available during negotiation. Negotiation in thread will be
cancelled by nbd_client_connection_release() called from
nbd_clear_bdrvstate().  So, we don't need this code chunk anymore.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 3114716444..2abcedd464 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -280,10 +280,6 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     if (s->ioc) {
         /* finish any pending coroutines */
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-    } else if (s->sioc) {
-        /* abort negotiation */
-        qio_channel_shutdown(QIO_CHANNEL(s->sioc), QIO_CHANNEL_SHUTDOWN_BOTH,
-                             NULL);
     }
 
     s->state = NBD_CLIENT_QUIT;
-- 
2.29.2


