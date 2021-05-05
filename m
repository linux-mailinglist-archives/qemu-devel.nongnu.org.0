Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBCD3735F7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:02:06 +0200 (CEST)
Received: from localhost ([::1]:39706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCTt-00010Y-38
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCJ0-0005uH-Qg; Wed, 05 May 2021 03:50:50 -0400
Received: from mail-eopbgr10116.outbound.protection.outlook.com
 ([40.107.1.116]:51367 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leCIx-0002fG-FQ; Wed, 05 May 2021 03:50:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y71nP9kEagi1YJAPDHwgogyRDpu0vtMsZvl9BoDwRWcdKG1NF2/Ed5wA/eaNmGtQ72mJfFTMbVin9HDskXOTfB0Rw5tZImhfT7yTKpwJ6YYq8mBItxTvoRxJ4mmAjtD+ONwLvOmVw4Xh64Bgm/MbwSAopas7MnvovVOJzpaXpXMfibKWhwXYo/J+KoMJu5dDhayG490QfnO0RvPRWbZi9Ykz1bhdHi7X6plmeqNo+RF8VIlA4WMbdjnVUGk0y80VSWO5SR7Ds2KgisZrF999fX6jhzx3EZBxpK1jhMq0Ukp1+s0aI1AoVBRyGf0khpKB6wzYkaa4cQyF7O+dPgIQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l4J8UuffPxvc0RdSXCxpXXeG964dtu+YwvTY7koGF4=;
 b=CasK5PrroKtupHTiRNk/Gs1Mf9aCn7aVQtzp8RW+w2d1+XR5RE5jyjGX5mbaLpUm378mNDFJlqztIp9ZLNxuRZFEqoonud2ZuFUvR6oGkteuwpV52BDRLzsLwG2+sdhbrmk1W0cwbUziIEqrDVJ+0+FlbqjIaE/f/JA3PfqBNPkbtEI8Yd+aX1hHPoGq2odpXVxZxVd05IrnyHGASkwP5YbT0PuxpPX7W4e9t3hXDLhnjXJNp2JG3oIx50xUrFIF7suyxzOyQpS0g9Lq5V+hftizCKMPP+KI3VRmt3JzRzncxKLu1Cx1Ql+XlxiGfPQcfjwIebio9NFPkl/8/r+9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l4J8UuffPxvc0RdSXCxpXXeG964dtu+YwvTY7koGF4=;
 b=fJIUj6QWr9o7KuMdtP7aVs0H5IaARgtXlgQxzyEuYNSQq7iRP71zICoagUQ9JFtx9q9RKf4/VaGc1u+FCIRTTLFg18xqr1rIe0rhY702k2UxW3fsBoWeIOKs29NHLZP99Btvn5pJn0LhAxUvQfysqHrfnGQiFuNrndGLrOMONAI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6551.eurprd08.prod.outlook.com (2603:10a6:20b:319::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Wed, 5 May
 2021 07:50:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 07:50:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, vsementsov@virtuozzo.com,
 Fam Zheng <fam@euphon.net>
Subject: [PATCH v5 11/11] block/io: allow 64bit discard requests
Date: Wed,  5 May 2021 10:50:01 +0300
Message-Id: <20210505075001.45041-12-vsementsov@virtuozzo.com>
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
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 07:50:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f16d50-7d27-4ff7-d9a9-08d90f9a7a6c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6551CD2E3F6115B98709A76EC1599@AS8PR08MB6551.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:137;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: spnrKtsSBX2iyNJOFC7dcriyWmTutu4AhBmS+eZikLMzoDMfD1T+lRQOnBbZNeWqisZyFd6YwKpQ8bit5UnkgdwZ62r3+7p3SW46Tw3SAGWt/eOUNEIPTIDteQhketsk25a94/CfmP8jWmDZfc+c7frlF0FHERcSqktaZGYKfHAJGfmsSKbeX2J9/7Iddy84ZNa7Iqto7RnaWgIXitFOYDA9kK1bAR4bZ3antXGidpr+golrTmqVcjMVrWvOPL6ByCzVdc/mdkSXxqrL5E+JKcA/fDgVStRTdzktptFsP9E8cj+LPN4fwVj4yAHavO2Bj9WBDw2a+9vSkY35JiyyG2k7oP/0OIj+cjrIyt3PqYjp0s10bLq28Y6Wl+/zjEncbFbg022877JuIFX6A/mD9OXTL430h1Vb3ixPyP/yViEBpoSvbyQMSDbl1G9rGL6FjnUuXU8QRD2U3ZKpwN+sCXiOFW4SWvmPY/lmQgukCL0BonwyVVDE8o/BdPdeuCzk9sPtOAkQalC3nUvJoxaiCXnJHucJ8xEpi7k403KQiLS0N08X25RsFuUHy9/4fvdfSn3M0rFviBJtBVlJDK2gm4/l8HdZJDrtlyFU3beU/BxT0td4z/onxTOC+H++LIB60EpMgXlNz1IOSENae24SL6oyIqUI5VA3jkuhDaR4pGyJ2HlEAKK6n4YaamCgeM8E
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(346002)(376002)(2616005)(5660300002)(1076003)(26005)(38350700002)(86362001)(66946007)(52116002)(38100700002)(6512007)(66556008)(956004)(36756003)(66476007)(2906002)(6916009)(83380400001)(6506007)(6486002)(4326008)(316002)(478600001)(16526019)(8936002)(186003)(4744005)(8676002)(6666004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sql78CiK6pkSdNyzrjNg6g0LDshvwt+YygcwcB6YF+Gwnjghvz5y4UX7JEuB?=
 =?us-ascii?Q?BXT1AnkMKihINA9wVFgy2D5WGPOPf8yuJcEkMZlgpxot9RF2avG6ylyLHGDp?=
 =?us-ascii?Q?eRK5HOmwKXWKkYF16PUl0oIfC6KADbhok+fS1KedG/om8iHh9mXQsYPw8OZI?=
 =?us-ascii?Q?hQgolq15vh6kH8b5yjFhc6E0mOljqJVybQBMb9/wBiHrRFnidvKoYFKuTUXD?=
 =?us-ascii?Q?VLwjql5wUs+Zn3ULqXtIiEcREDMAlBalG2pXVdKEWLiCr3zrQ+tavegGqPMr?=
 =?us-ascii?Q?1ucJOXv0JKYmjWM5f4k0brh3an4Q3EmGRmnRp3YXamyvchcFenPk2Ivz+ZRc?=
 =?us-ascii?Q?HJq9mQeVBQFq1P9dDGSYbiNiI6jxe5rcfc+zY27nyQd684E5w5MrFzS3Fwvo?=
 =?us-ascii?Q?8ZEjGK4TCJLb670Ex47nJLvlzOUEdlqhscqTgPc2/D0OVkw9PBZeGWZCXEBx?=
 =?us-ascii?Q?zSOqNARcscwovb1oV2mkOSlYJLmfiuJ3zasW7Sbhv9Sd6mlZ9lL0vnChFbA+?=
 =?us-ascii?Q?fhnacsxwW2JX5LZYtsceMIKI8UOavzhuyv+sgAEQ3GPZbiaXf6XMNbp4lLyM?=
 =?us-ascii?Q?En5g+5VaZ3xcLgNGEhDFtBVV7FQJsazsIb0PuX8/sfIZXBmgxMtQBVBgGrFb?=
 =?us-ascii?Q?tsgB+dt8S+YBBCC5Up6pBlvVm5AoooCRt+YDb+KohcOm9RHvXSvW5btvbRlK?=
 =?us-ascii?Q?ayYgAAp4njKSj9EMiLCU+dHfpmXHwdlH9s4xqaFfGAVZs19v3lNauI3QGnmE?=
 =?us-ascii?Q?TU7bn0w8v9eqHij9a7t4BTj4zuGwZ1Lb+K+TX7JYSW6Fkcos0YslaqBcam9o?=
 =?us-ascii?Q?h4j/xIh0XK1cHw2UGWLRUPMHr6KZShFtTHw7NAWum/pWq8ls6aJdMvVJ2N3d?=
 =?us-ascii?Q?tDGjA84vmr1IpTqF5eNHjSZPFP70zU15DoCXIr4+N0TUmrIEllj1I8R/la60?=
 =?us-ascii?Q?dTUaA91D8QA3IQVnPI306FAtGYAz3P/KgXlbVoEEtQA0KMGY+rjzRETdYjA/?=
 =?us-ascii?Q?J1bz+WwBMvK3ilN54zW3ZUBp0LAGZMM9AxeJ761O0l6nNB77rptb+YTM/JIC?=
 =?us-ascii?Q?ybCamzINFhqPf97qrmpVLk5SZrb6ChXR4cEMFiZxVtJZ7b1e3kVbQ+e5DUZi?=
 =?us-ascii?Q?jAkGAk1LJQZTf9q7GxmIhGvOuE2XnrjB1npfLzXtT7THTakKFuZ16tIvp8wu?=
 =?us-ascii?Q?eRHLDt7d/gvfAwpsdU+uNQGEfMJMrqqUMJ/q4TaM8eLoVKrXb6OEy/rgYfM9?=
 =?us-ascii?Q?K6rgdGlG+x74VAS117PNd+QE0lrppqxKAaiCl3kZ3PB249pN8cUSzKddRr+8?=
 =?us-ascii?Q?+u5iNOKktsi8O82AbDhgWusd?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f16d50-7d27-4ff7-d9a9-08d90f9a7a6c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 07:50:40.4324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZkKFgC6eTI7DbBwFT7uesWrxep8TVBZ0oy7/W/GHqPJYJalq/ujEsbjRUsBcnjhViMdt1+tG/50/q7nDK7PUTmRBTXkvv9NOFpZHDBrlJu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6551
Received-SPF: pass client-ip=40.107.1.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

Now, when all drivers are updated by previous commit, we can drop the
last limiter on pdiscard path: INT_MAX in bdrv_co_pdiscard().

Now everything is prepared for implementing incredibly cool and fast
big-discard requests in NBD and qcow2. And any other driver which wants
it of course.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io.c b/block/io.c
index a7edb1ef54..e0b3ebcc37 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3036,7 +3036,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
         goto out;
     }
 
-    max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard, INT_MAX),
+    max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard, INT64_MAX),
                                    align);
     assert(max_pdiscard >= bs->bl.request_alignment);
 
-- 
2.29.2


