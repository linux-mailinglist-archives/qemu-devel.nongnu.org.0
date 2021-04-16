Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44856361B2C
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 10:12:14 +0200 (CEST)
Received: from localhost ([::1]:39840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXJaH-0002u3-1P
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 04:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXi-0000uf-3Y; Fri, 16 Apr 2021 04:09:34 -0400
Received: from mail-eopbgr80121.outbound.protection.outlook.com
 ([40.107.8.121]:41299 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lXJXe-0007qY-NO; Fri, 16 Apr 2021 04:09:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5F4yLvDOrEuCEJwxCyB9SPLIQ47AWh0lgp65+vnZWSBQFck0iFas5pjJO1lX1IQNwZIgImU3TP180omXZcPWzYe/Ak4ySrUMmIzdKCbjzACdzz6zrTmJ6zAkHlhh3MXkR9KqX4Pwzkjdu64QWiVL+KQ1WSMndxsnuQOBMFoFUuJIXfwO8ZhznmJ4L1Psl8YQ/YznpsxgondnGYjnxbm4HY/d2uHq39/MAX3X9pdwoojwAMM6Mqf9FzOi8c4Em0733msqTj8zGSVgFwmJA/hclSQTq8VMqyqfFOL868VUc3v4ACH8ASxm1qzNrPCyGQfPK07iqDj85Ac3PpGKeUXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFn2VRR5obdBQ/WU4iiKph9dBhIKncsMyfVcBHqUhTA=;
 b=A5AcDcoVGhxSgdUh7KWNommDtR/RWq/uNKeE09icUjpKLNNvzg2zUwKWdUfm50aNksm9rKyFs8oyWZNjFYzgVoNq5JdOW7sv24uSnKo8Hu9jyYG0RJF3z3d/uwUQt0/ilJ+I0/BTBXTnC5VNdbpDpEiWMnYjWW+4fchLl1y5s8y5qTrZR0c0rTyFRkvO3w4yCIRBYV0b3YBdc05IqLvdfzGFogPvooZmYZUSuUnPLGT4foN3tnP7AjSKo6Vcj7YGJ7ZyLldehop1LdN56Yv7EhhsLXmpeTSRMwFlbSYFAKfl7MU5TELMaHWLV3PwzPT6lGhaEVxrgeh63jH9cMEePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFn2VRR5obdBQ/WU4iiKph9dBhIKncsMyfVcBHqUhTA=;
 b=diy4ZV0tPjYu6llSeU1yICSTsEZFHbQ6I4cRFJuuXF4VfZMBy2izgCzGHS5kyrzvmdLlc7bm5Txnk+h2SHmFhaiKETn8Mlx1Kt2bqotLMuT0ov4Otp/Uul5iM1oq8SMvBSHl5391ssrIwQWbeCBHOkwkcf2xeqJWi0B/p6zx9bk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Fri, 16 Apr
 2021 08:09:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 08:09:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, eblake@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, rvkagan@yandex-team.ru, den@openvz.org
Subject: [PATCH v3 01/33] block/nbd: fix channel object leak
Date: Fri, 16 Apr 2021 11:08:39 +0300
Message-Id: <20210416080911.83197-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210416080911.83197-1-vsementsov@virtuozzo.com>
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.206]
X-ClientProxiedBy: HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.206) by
 HE1P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 08:09:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98f8d159-1982-40f4-2597-08d900aef45c
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078FAE197E0CE4B1927EB23C14C9@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ggNyEw6glhQNLvuqiN2y8yxCa5HR8HJHt9JmyEXNUAwXZHKhf4jFkeeOK6zSVr0NxLB59dlK+cQj6FFGePpq/4W46S4roNZ5/wYUVKYPyT1W4HJCpQYaUajP00aYtBxFVhiaj/P0wZbzbGQ0B5nIjfPGKyWNx5UbHxXt7+dTyXVK52DphNK7wgZFaQLmEVKIpMVkOz8hlLdB438JJh3RGk4KlUEdYhu1aGjxHgvydzcSJCG/m3grlpID7xwroYYsEOu2tdyFWSYNu8aa9WQ62GtsU4LrfjkVcpyaBiU71yno4v8cbutFYgGiuUwLzqbua0RhBPxO/7SGJDXDGsnbQtRTQzoxvu7jFRSMSmlhnZ3T1Tb2lve64oWcNesUY3aIxRCon21/saedVDk3UiaqOVaQE3TdWUiySH3SCO5988lK5ScXyHKuj/1fJKHQTglUZoVDrX2lyEINHxanQWypYVFptceGac+5esw5I//sDmUWmQxySAZJoiDjIZlMuA8ohYpELPRgFwxGGBrDAqR7ibPQ+mktkbAmPYmHbI3mARuL/JjBDr5zs/sYuyV1CytGWo9rcqcoeGoe3mKfSblc0Ecl7JjA2irM1bvgNhlLSYyJ+9Syv2BhQco1203cDB28cH3YnP5mv9YiEGIMwN0dYzr+dIR2HrMhADs5L1dA3Adf6csDvVg4uOz9X8Qegry4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39840400004)(366004)(86362001)(36756003)(2616005)(66476007)(66946007)(66556008)(26005)(16526019)(6916009)(2906002)(6666004)(5660300002)(69590400012)(107886003)(186003)(4326008)(6506007)(316002)(478600001)(8676002)(8936002)(38350700002)(1076003)(4744005)(6486002)(83380400001)(956004)(52116002)(38100700002)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZOKmlpiuL+dRa6S9n4Q5PmOhe/h7HYyUGREMaNrnAhvxJMBmt4aZ9EFJ+f1B?=
 =?us-ascii?Q?2FlW8EFbO9Ttg5MPanJHT0ZBqrqLLozaWdzMMCryNC4OJ8OCsMZJltXceHdv?=
 =?us-ascii?Q?gh2kKZYF4iEeqqX1cTzWRK2kpzG5+dJeGLZ37MkqnEmvd8K3l4U1CH4Da/cY?=
 =?us-ascii?Q?0YYraSgXBLbj/w4Yx2EP2xssZlJZjUFc/vEr+8A9t8IPNuAdk920S6Ol58nR?=
 =?us-ascii?Q?9YQMdLxIJNaMp1Fr0VDtGJ7bsakDbqr7yYjNZCCG0cHnaDxkPfWYAthKQb0V?=
 =?us-ascii?Q?ZO/1NgDURnd6Svn3lMwtb+jwQn8M8vE+rIUbBnAIee49XYNbPljxK+GVbgZx?=
 =?us-ascii?Q?0tjosy6EB34luV4x5Aea29z0qkIfI7jywU8jE8hY+55Z3ZMoP98hVcsdgYXu?=
 =?us-ascii?Q?emmaFVx+EAGLfj4K36WT55BHGi9+OkvoXWb6JhGy+M9/cHhdUKWS7Uvndkeq?=
 =?us-ascii?Q?ta1yVJarlxsxijw/ID2nRid5WsSX4qnxBim/hpRVkCYqY0+xhZmZppLN2IUv?=
 =?us-ascii?Q?8e+tCbOqmFeE3/GbKiHJkUy0Qnw+3CfgeYSVSDJmDkLZShnZWzXdCyWf9tBs?=
 =?us-ascii?Q?82OuAbY+eSRBCFDG6KyPQXMyTAulsRI/BePraJVGS1zLzloZEsWcC9ioh4Ap?=
 =?us-ascii?Q?IJ53/8FS5mOaYzE6Oo4knFb2DQu8+V8olivnSuTd5GUcWsivjNvKKv5L6uKe?=
 =?us-ascii?Q?m5aQPlqvO/6fK8vKxBCs2TltlxCb0tlymtv/SWsZMAuKgmZUfDZAPsGbMmd9?=
 =?us-ascii?Q?EPIsB65UpAydvKjSlPFzUtoFVC6bnBDSc57sQKnDKwLvYJoYhLCCM55ev4b8?=
 =?us-ascii?Q?6xYKgtLVT7v01LazIhh3Up8jO7gPOPY25PlTTU6ReTwAbac+fDgQxt6huoJc?=
 =?us-ascii?Q?NmTbEA0aWQevWMeG03DoGCJhLCwFBLJek1Zs8JqOSMw1N/rTg24vbWretTAs?=
 =?us-ascii?Q?kvNXMKocDrlgiqqVbMzu4XcB1t9wh27RT6CqO/HTMT6RJtjKOw5On4DAPkMf?=
 =?us-ascii?Q?BBYhrRudHFEmQYMeWH8sHRZCwJeikSX2faVv2+z4jgfYW880eMNTF2MTbHuu?=
 =?us-ascii?Q?1CYkwnSoezWQWV3tB4CXbXlPi84UQlm/Fk3CUiYO9SFNYaiadKkC5FEHsAo8?=
 =?us-ascii?Q?ts9xJ4iTTVcsEcRM7ZQXW3wovsM9pis/62n9tMvPLYtTQXTIDAnOjpn0p5fv?=
 =?us-ascii?Q?wyKaO8mVlDmSSJ9xAgvTkoCCKVRalKsS2z48xjysUCYIWTfRCUwVN0yjqHn1?=
 =?us-ascii?Q?UXGDzobsn6rOb0a7l/En4uLZQFJ//A1HzeGxHuAWWEMZHtW2krrtrQ0s8Dt4?=
 =?us-ascii?Q?jV/8HQl26o6QDneXnU3x9I7M?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f8d159-1982-40f4-2597-08d900aef45c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 08:09:27.5307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cDPKt2hx1q7ch9L9Bopq/3QpJxn3k2zlo9klp7wM3paL78IFONbmkr7QUJxjg14UPHC7/Mxrv923MKCz1L/xzsFYNQwEv5oRNavXGySsSlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.8.121;
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

From: Roman Kagan <rvkagan@yandex-team.ru>

nbd_free_connect_thread leaks the channel object if it hasn't been
stolen.

Unref it and fix the leak.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nbd.c b/block/nbd.c
index 1d4668d42d..739ae2941f 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -385,6 +385,7 @@ static void nbd_free_connect_thread(NBDConnectThread *thr)
 {
     if (thr->sioc) {
         qio_channel_close(QIO_CHANNEL(thr->sioc), NULL);
+        object_unref(OBJECT(thr->sioc));
     }
     error_free(thr->err);
     qapi_free_SocketAddress(thr->saddr);
-- 
2.29.2


