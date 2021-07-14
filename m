Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278ED3C8960
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:09:07 +0200 (CEST)
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iNe-0006fU-8I
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEb-0005am-EO; Wed, 14 Jul 2021 12:59:45 -0400
Received: from mail-eopbgr10112.outbound.protection.outlook.com
 ([40.107.1.112]:36877 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEZ-0005As-G3; Wed, 14 Jul 2021 12:59:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1d9q0fToxZEtz9lEZNtok2Nzvx6BGVcB8PmLWJDX2sqAGsJT2Q20WIRr+MePKOlcNO/pDR+ijAua8uq+1Hfq++i5JKEtMxSUSUl50UqL65i7Agwxe5hlL9mcDnkHGEb2gl8VnNoz8l42cmUy02523McEDX/1JQvc8ZK3+I3n8CDyf9Im4ReBS420PJChsL1+Maj3ingsNEn8pBKgqCMYodyBLFwdIEh9yAo3cMTHR3sWk9l8ci4z4aZYGgYVCpcpM/jV0ohNpm366hz+E8fsQYvRQR+0Uto4pr7cJb2rmq/jzH1YPRJzxIfznk2exM4tNGfOnY3ZOSmO3sHOgDOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l2wGPxTsYAAKuLH0ajY9as7c8P64Cp75ekT9fGi7ck=;
 b=QWgY+Oue1DbuIZzp0P/sh4e+1JZFYw4Jpr7jElGCXzNfzzR9CHEVDG8Q3uR0ttWmfBwAC+Sn72IV464x1N0mGWG7/dMBFD2QbM33yDBkBPsfSXIjvp75B5kzOBalQbQmd9KXJ3udcauROkRlMxC440BtEo5kWMDU1Rm1/SYcPIqzLUMwi3OBsrKzqipLLJsfr4EOEo/pwcnw1ZdcFGGXVM0FTXnbEf1WVgfzNckQqYh4etRI/EolHsOF8cu3EbOACClS5tJLt7O4ZbWkzrtmgsZq68fYS52AT5EFBpQ72ig0PZkiZMAjgZEz9/L8vqSo7Nw5Ufg/8K2dNjzJX/a3sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l2wGPxTsYAAKuLH0ajY9as7c8P64Cp75ekT9fGi7ck=;
 b=OyYOI1N8VnphgKWPzdolZo0fqt8/503dB5dqzyplyoEn3FFQPPil+DFpEfgCmW5F43FjGclZCEK5uYaf1VBHSwM//cqJRfz4wZJpBEqXaz/EiIZ0HHxEAOH80/UHVDNJfs3J1GzXo4riNYXUus/vA7V29dRP8GaIVqKO/REKXCk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:59:33 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:59:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v5 2/5] block/nbd: move nbd_recv_coroutines_wake_all() up
Date: Wed, 14 Jul 2021 19:59:13 +0300
Message-Id: <20210714165916.102363-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714165916.102363-1-vsementsov@virtuozzo.com>
References: <20210714165916.102363-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR08CA0077.eurprd08.prod.outlook.com
 (2603:10a6:7:2a::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR08CA0077.eurprd08.prod.outlook.com (2603:10a6:7:2a::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Wed, 14 Jul 2021 16:59:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38ef5052-b85d-45a8-fc84-08d946e8c0bf
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB533412911DF99D6B2390EBF9C1139@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DyEZnmiZXzFEFNj8m6cI4SkCrWnKibzJ1AmSgG4jot4i5tkDRTc1Nc9wqHL94Td47sXbCR/cSEp76NoQTT/uHp/ocp7hd8biyq9GKiBCZoWyDplGVx3wkfgWj8X9hQI8eJVRiLrufPq6YoYMeBec7S0pafdCTNJNBRY4U2CfMJeqCIGsZeGKS2Q9fM+M9rWInogSWbddWvhulLUaBAUD+sEm6loC5VOvcRyHkNVfDUl7ltYUCcWMyXufMR8mTMctq//q+UT+ddyIjMFmdB6gbWzvqoDA0gKBuoTPM2FSG3p/Y7E8oUfH5m4teawIkz19h2QReyMMuzYBOm/ioBrJ4sShhGUe5kFdAykDBLIWmnS5mnkVSmIczVADYECwNpTYVQZFDbaLdidJwc0e+iQP+GXagH0gw3DC8yeXMPTom60jS58Bcpe5Tewyzt3hmn/M/U/kRjXvwIR9/C/51g+CE0z2Pj/LQTWNcMFt7PKtz2tvwTD46cRIdQf/B7nm3kFchBbTMKa7d+OvYLmNtLAzd3yn16w59J9mmcKzBowsv595SQfcHnSfnbMpwXFiG+9qXdvEsWCHktItXoYYF6B/2b3HZj/3YqYvpJmzVUzcbLyPmfOfuJELGsS1i5il+y4wORb34KvcOxNvofJxhAwgCepsa4b12mMI2tb+N1HLu5XkLBhBMHtU7NPB6oav4+DG78VF0HrGkKiQ31PYVICGKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39830400003)(36756003)(6486002)(316002)(478600001)(1076003)(2616005)(8676002)(83380400001)(956004)(2906002)(66476007)(66946007)(26005)(186003)(38350700002)(38100700002)(6512007)(86362001)(52116002)(66556008)(6916009)(5660300002)(4326008)(6506007)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qZKTeXfrhJj86NxrNY2GUKR2SbkY8iWobGCCPHM+6AlROtlcM9PNptTEWZrW?=
 =?us-ascii?Q?IiMmqjpymzRNnW0Mg4rKa/ZDXJO9pDOSaBp6YrUJRUc1hU0erICt7P5H3YUz?=
 =?us-ascii?Q?12gwvJlEA98NioMbcQk0MAj3/7u+tEMEPXrs9GnU7TJeWNxgOf20crG3eYpz?=
 =?us-ascii?Q?kWRdNcInNn4isn0eH9om+rv5WXi0DwZjwBf9Pep2CM42Q6RfuyMvs5vPJaBN?=
 =?us-ascii?Q?tT2hUGUCMUCDhh7YI9jd+S2RLY5F24glVqGLgfcU2sZXBUc4eiiWyzR9DPIz?=
 =?us-ascii?Q?9JFiegEhDe1S8rkTVPf/e73zySS8mdnAky3PWdS55/fE4oVF3Ub3SIT6ErmL?=
 =?us-ascii?Q?C/3OktT7XAfyGxKaZDEli5PN6SAA1KMVNkq2KEK2sBFtUY6cwub5RwHZPsbO?=
 =?us-ascii?Q?UoFRV4W+eELtiTP3x8OYhho01wWJqz+10sgYRdx3mDpp8vIy3GWrnnskyAv/?=
 =?us-ascii?Q?Cth8XFujm5iPt/SKsrY1aAO08A2Jgu8G4N9kVbAQlHAN+CjFWSaSVKXSvLYj?=
 =?us-ascii?Q?Rw/0vtwIDkFGFHLAmMjW278utFbqQoDRLaE+tgMr1tYp4+yaghbytjd2mDJK?=
 =?us-ascii?Q?eV+/cm9IR5sihK/lLK6YDYmjTYFGSGHVOS3Zqash4kE4UdQAn08gfwwqde8P?=
 =?us-ascii?Q?cBw45GHEjOcaO/bmKwfIIVpHjTbIuf1t7efIoe9BGLsD8ac4/qQWe/LbRdqZ?=
 =?us-ascii?Q?JqeFuuJe7Ye1Su0ZzCa4I/yUiPTVunneu5BDzn5/w21TueJwJrtPKF31XHQs?=
 =?us-ascii?Q?s/wStlxvnkunsRrrsNsc/thIKsh1kjNQSJ5ium0i5hBRhxNevxX25rHntW5U?=
 =?us-ascii?Q?QiisyyTs7apNlho5Gbr632v8azmUsjz5X3SSxStuFpTzbvhmHt1k4dwTuLLF?=
 =?us-ascii?Q?CgNlVg2drmsP4i27AkJj60hvk0TBYa5vWYIzYdVDoBvDDvI8wvCPDAi1Fq+N?=
 =?us-ascii?Q?UC/xnMl3ENJGRDqPW4g2uG68hqjrnEsTi7SOYG/ctDs28bxrJozPsf2YwgZW?=
 =?us-ascii?Q?dtV98RN1X10UASCjTynrUYRmNzXqXF0UKe9m5C6Y36bqA88JoJOHFPjhR0iL?=
 =?us-ascii?Q?6u4avm0ewUp/OVNiW30wY4ubMJ9s2KkGSdOdwn0Macfdqu2B6Ab1lAQRT8mK?=
 =?us-ascii?Q?4xk3O2N8qpXZbpLaYgeER9axQbVhF10z3bnFuAVrUKhqUqgSU+H+n2K/QZsJ?=
 =?us-ascii?Q?BfzHi59SbuInydlYl3+Nw3sXzcNk4Q82TmZOVh+51rjjUS9n6FQHd+hvZ/WA?=
 =?us-ascii?Q?RfRbFc1ABu+h9V9qPOx3ExVLlpy1ohcDrRsG1KNEYgkKNLjZNgcncWP3cqui?=
 =?us-ascii?Q?Eq7pab0Cmy6GiTDy+gwLm/4m?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ef5052-b85d-45a8-fc84-08d946e8c0bf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:59:33.1243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rZ+YVCBX2DutZ8w+NMU7B8ZQvIUROTC6SuKu43aS2dEQm5hICGTn6WDNzUrhe73qbOlSkgkN4fB2Krt1rkAgk9ku8KARctVaYq/eojBHsfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Received-SPF: pass client-ip=40.107.1.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

We are going to use it in nbd_channel_error(), so move it up. Note,
that we are going also refactor and rename
nbd_recv_coroutines_wake_all() in future anyway, so keeping it where it
is and making forward declaration doesn't make real sense.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index d88f4b954c..32e3826ba2 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -127,6 +127,20 @@ static bool nbd_client_connected(BDRVNBDState *s)
     return qatomic_load_acquire(&s->state) == NBD_CLIENT_CONNECTED;
 }
 
+static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
+{
+    int i;
+
+    for (i = 0; i < MAX_NBD_REQUESTS; i++) {
+        NBDClientRequest *req = &s->requests[i];
+
+        if (req->coroutine && req->receiving) {
+            req->receiving = false;
+            aio_co_wake(req->coroutine);
+        }
+    }
+}
+
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
     if (nbd_client_connected(s)) {
@@ -143,20 +157,6 @@ static void nbd_channel_error(BDRVNBDState *s, int ret)
     }
 }
 
-static void nbd_recv_coroutines_wake_all(BDRVNBDState *s)
-{
-    int i;
-
-    for (i = 0; i < MAX_NBD_REQUESTS; i++) {
-        NBDClientRequest *req = &s->requests[i];
-
-        if (req->coroutine && req->receiving) {
-            req->receiving = false;
-            aio_co_wake(req->coroutine);
-        }
-    }
-}
-
 static void reconnect_delay_timer_del(BDRVNBDState *s)
 {
     if (s->reconnect_delay_timer) {
-- 
2.29.2


