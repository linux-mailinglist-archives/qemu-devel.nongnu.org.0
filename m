Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE443C8948
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 19:03:28 +0200 (CEST)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iIB-0002em-2w
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 13:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEY-0005PX-Kl; Wed, 14 Jul 2021 12:59:42 -0400
Received: from mail-eopbgr10112.outbound.protection.outlook.com
 ([40.107.1.112]:36877 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m3iEV-0005As-Ho; Wed, 14 Jul 2021 12:59:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dI0wSDXIyZ1a/qzD9EIyPyxfdhZ7wraqaEh7pQHBCEpdvc0aoIa7+l88nZ6WVVbEEfZiNwOQcm/kwiHPAmF8H1ITnsIyC6rFo/yflMqoymSXHas4C2njzl+2hhHNvbr0p1y+KL+NVLSU7bTGSV+oDVP7FyS4YgnIemDspKUNdtCDvOlxjlrkBKt4oAcnxOnGhT+bnI8o58403NcgaZWX5IMoMRSIT3mH9Q1IOW0bOIa5Z6gS2Eg5MGukMZxrx9lcXslJXWE46K44ijJQFgzTny5LY//L5cgdVGz3Ua0WoX4mu5xd/ZYMCnfXM2zyrpOewMe0ZTKFT4SjfqPXZY+Z3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlhwgMh2CdHNDXofl7xd2eJULuxsr7v5kVKg1Xqbe+U=;
 b=C51wfO/LiYsj7oaSlrXQ5NYPZwHDzQPALl4BX/o3+1YHlCjg1Yk1k66+CmNbFSVTwCzh7dEhgbidmuS2fV4X83pVX/9SQPIgb6+73DWYiPTcviBgKXSEKEFsbZ6839cZgpxkdkejXhqsOfQc+l5wpd5NtTiAWpmBAMRGnj8xCB8CMgKk/XYNHyDyhet6upatl4oZ8Ee54cxUJ1Cjs+cC0PEr7aOhOl8b6pVuYAjvR3Tu8lrSjb9woDaLwus9Ai3iMOATDpdJOils23zgnVWDP/2le+B01hD618XltWIuaEAK8BGO+Qw6J85sk+MW1kwQFo6yVHiuZfiyQCj5yn1M5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlhwgMh2CdHNDXofl7xd2eJULuxsr7v5kVKg1Xqbe+U=;
 b=W2LvSGpBTE8+kFeGuTY9mVxtSUBXGksxmfpjsKUKSzJXcAKkxsf+qzRQm3lTjs8LC9PYAcvxneAYt5kDdp+MDW0JdVpqM4Wg2WXZrtvexNph5psS/OYuqqBfTlxBSuMK06mogA84lAUgdAByjVbHwxCB4piyYCsGw7lYV9YDwJo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 16:59:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 16:59:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v5 1/5] block/nbd: nbd_channel_error() shutdown channel
 unconditionally
Date: Wed, 14 Jul 2021 19:59:12 +0300
Message-Id: <20210714165916.102363-2-vsementsov@virtuozzo.com>
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
 15.20.4331.22 via Frontend Transport; Wed, 14 Jul 2021 16:59:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff6b648f-fadd-4531-7228-08d946e8c02e
X-MS-TrafficTypeDiagnostic: AM7PR08MB5334:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB53346E87B15D4CF6D4ADD33DC1139@AM7PR08MB5334.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHMwuH3qtmYZbZ9cEedwgg3dwJjAPwgtxdMNCZA913Otp0jdl2mviPo9q8Ys9vS/DM6q7kFfAh14GK6nQNUpZDg1PlBAiUaQ+CVGPwGHrl50odPWv1HuEMIJQ7t+1v2nNYXh4GWT0oUi2nPVZADmyP7i8UAXKmJfsDX8p/pZzAKnKOd3MpZ+dTojQLeYBAdCf2HuiuJwYWn0jHMRTw2Cqr4TyJuCIOSe1CIJQ73RHfvsXN8by5syqjhw7EZALNNNlUqhQnpU9Uwr4L6yzW7zQJzlqL6ZfIfHNlfYWQ2m2WtGJS7YeU+2VPoROJRJ4/AOZQQ0/N8Zw0So8kB50Mz8nCzSiZtrwRQpkmos3Fmjs2bWMxMTHLgdky2UFz62WppcP1PzGh6MZuCMOE908ckDGOFXXSP3u86zCDUYn2kvjV3ONBnTtUC/ajMg9t2DSKWk7A+56VXRuLrfaXQG7ot+kDz4Zo4a0RRFJjy7w0IfkP8eYKyTo6yNu12Cav6s8RrXofjmGxWIndMr56qMABMfq98jkYTHy0L1PhIfrMEuIj/3W7VWoll/52JMI4+g/Jla4bPeKOedW6kH3JGxzDlzrYsV4VbihT++Y4kupRMn+Lc1Zw1IUHJkq1BaJ1IiGkh325ZiEonwId5l/xxliba4H6JwhEqWg0Oma9HEy58pLJR+U60GLFqouXem2AtEoRVsRyE/6jkdW57IGa9iHPfpKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(136003)(376002)(39830400003)(36756003)(6486002)(316002)(478600001)(1076003)(4744005)(2616005)(8676002)(83380400001)(956004)(2906002)(66476007)(66946007)(26005)(186003)(38350700002)(38100700002)(6512007)(86362001)(52116002)(66556008)(6916009)(5660300002)(4326008)(6506007)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QoRHhO0bWw3C7c93dWkEYRe7uOkMq2R+VXquQYlkO3WsXWyV/U/Giytm5pEy?=
 =?us-ascii?Q?KFPyPC7Ot6akEP3S7QBQR5YPSNleR7sMlEy3X8qocYn4eLZmRllJ9XoDUjxm?=
 =?us-ascii?Q?T6DkwrpVFYGfKPtARa/vq3OwppHsRAvp/P5jygHxV5FgTDN/CL8NEpoY5XBC?=
 =?us-ascii?Q?ggXP+RiCSccE7fNt2jH9wWxaZTehaEwTDEkJ1eXx+aQoX2DlLdLzInWoh3/a?=
 =?us-ascii?Q?1njK5kwxbSvU6JKE7eWY0qLY7b+GXSPxCZ4kxJ9ngfFTMKaKkVPyyxd/xMYs?=
 =?us-ascii?Q?k3JKdM2Kfu+lzaYYW24BDIV9T+bBQfY0p9EaPyU82EU0TfIOqErKp2hgTXY6?=
 =?us-ascii?Q?VAdoJhsbtRQWe3pGfYsEwJ3uOhOW6A300geR/XA+5IHpEYiiGuHPe3J8UK91?=
 =?us-ascii?Q?199v2CwbQRty8EzzfxfqRq1O4kfAi+VssbJxwKDNESRGxQpWUJ/cKDjnito7?=
 =?us-ascii?Q?xvHjDgJcxDg8tf5mkR5Cvy8Xr6ONQeEuiRMlj/UztUJapvmdZtIKKQihWQKw?=
 =?us-ascii?Q?ca8sbZw8YmBNsxLI8r93mnj+8eagajOS7RKUWn0dLHe4cdKdackkp6rJLnFs?=
 =?us-ascii?Q?W8oO7goupmfh8xfsCSrqOwZs+b24nozIcGZOv3cBC0DEFy2cmhjluwRG6y+r?=
 =?us-ascii?Q?WZtsKJAwc41z4bXSwcHDPTuBNZXtfnN+Rt9C04kKKhlICuHCIUM3EIrG1/o0?=
 =?us-ascii?Q?DCuGKnaJ1BBlX1TKn+qrK0IKxWfqn6zhGFH5B/p6RqZD7bmla0uW5j15Hcu7?=
 =?us-ascii?Q?dg02BuXSgyZ8UblahfivR5xFcjNZPC2usPgSGz5qgRyK/q604vwKV/mSbZlW?=
 =?us-ascii?Q?3gGnRL5Wn886H9M0rTLjKgY2JlR0wx2aWDsf4RS8t8Tt14tyXAwsJ1z5YyZ3?=
 =?us-ascii?Q?JMm0UPJQj1Lq8n35v8nXSDzhpPCbR6bayi4TRtTBgQXA7H/e3ActHPKYUP3o?=
 =?us-ascii?Q?OBMc8ti63zeVCb6+kILMoSP5iaykrJzYhpCanfggUlw536CEhZTQNvDii5e2?=
 =?us-ascii?Q?4lsRcJhANqtJ15O86pgfgxg6bKq7+T5Z2R0mJVvLvMfTFe9MKcIwsoeE725u?=
 =?us-ascii?Q?JUntLr9WCJlwDe+dOIehyo6iIjHqpMENI9smEGQ0eykh0JQ4ULH6loykdeS5?=
 =?us-ascii?Q?NpopQbls9nlWqO5nwKodc6g2zStGAlOMWoGO1Xc3DPkbfDnuBc3ufLCgQtHu?=
 =?us-ascii?Q?wwAdSyhpaQu7PCuriw525ysqPvGpegc2C1iHZgunSrm/WZUbEszvkvwSJeHc?=
 =?us-ascii?Q?ugiJ9X0CBwGFw4HZtY9XG7fVhVRs1FMKq1p3Tf74qVAa/ibO2TwHWi8Kc3se?=
 =?us-ascii?Q?c26R+ekM5XNIibcKSe+zvGn8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6b648f-fadd-4531-7228-08d946e8c02e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 16:59:32.1745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcrCEn+qZs1gClRMVerNYt6dR64VrQ0Xm7wCrhf/WjufstFbM2+ELIxd0ATL0p5rID2bHDbqWYfFKoanWjOK5cHZ7ZJi66q5C5ZzLsfmKFs=
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

Don't rely on connection being totally broken in case of -EIO. More
safe and correct just shutdown the channel anyway, as we change the
state and going to reconnect.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index f6ff1c4fb4..d88f4b954c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -129,15 +129,16 @@ static bool nbd_client_connected(BDRVNBDState *s)
 
 static void nbd_channel_error(BDRVNBDState *s, int ret)
 {
+    if (nbd_client_connected(s)) {
+        qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
+    }
+
     if (ret == -EIO) {
         if (nbd_client_connected(s)) {
             s->state = s->reconnect_delay ? NBD_CLIENT_CONNECTING_WAIT :
                                             NBD_CLIENT_CONNECTING_NOWAIT;
         }
     } else {
-        if (nbd_client_connected(s)) {
-            qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
-        }
         s->state = NBD_CLIENT_QUIT;
     }
 }
-- 
2.29.2


