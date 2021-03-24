Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E453348365
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 22:07:10 +0100 (CET)
Received: from localhost ([::1]:41488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPAia-0003yQ-IG
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 17:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAUF-0006xK-6m; Wed, 24 Mar 2021 16:52:19 -0400
Received: from mail-eopbgr140109.outbound.protection.outlook.com
 ([40.107.14.109]:48878 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lPAUD-0005Mt-CU; Wed, 24 Mar 2021 16:52:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQR+5eLmhHmorL0MIiG6vEs3bf0lkvmUF+jGF8V+PBbTgfIXf0x6RKEkx08yYwCw4l3RydQl+YsLSjcjCBk4LQY5M7FPhHJsDAsxlzhrBJgwLZQ9b+jjDlqScPSg1rb9sFgZ0Nw9BsPs8jkimzDvrnpcHJmowNbQfMBUV14PlRs5nV5tD2Jwoho+Z33W8HUvIy6FX298QanMg4D1wLLmIhk8r4rppxysTsWksj2b6YJPlY4nuJNyFD9njPXDhyX6gCy7uzLAOhXU2cMHSv43TpW1GJUTh+FZqaHt6IC+9OyfTzKzx7y6Oq8rX+4r62z9Z/gnUKIkwUEGte2jkkAdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eF1dGGQD33N9dv9hNuzPTrsDg7dlBGwBDx53CxwPzoU=;
 b=c6NAUQeuksY6B6Kdlp4xm7w07GbQWUkxS4NAHdO4AZdA7r3Wt4Ty82i1cOIPwHjjOFs80ADugZ+7K/8P5jcXNS8d1vEsduCELN7Oj8/a+qfZeEAudAufzroXV6HCV8xMwGOFLHSAghr+5Ki2X0+aLmY+AhcwBqye1W4qmupa/fnJ23Fh0dagdhqSqm3u8Wz8rvzlJ5qCussCS8g9Zm3q1R7FwvoddiAMP36CT/1pkBkVdE0WjQUXFD2+pbl0qMFhTH9Bre3D7Cb9BFINp3NRyWr+PRbZkR9ekM3CW2bNLX/RuD4tM73BLMb6BBigR/DweJg46QLdMfgZzw32Lv2Sxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eF1dGGQD33N9dv9hNuzPTrsDg7dlBGwBDx53CxwPzoU=;
 b=g8DlJn0YD1eEmyIi04/LMznTF8IlaHSGVx/3XOCY7208YhCQKTk5l3aHcZFS8FIoXADZbJMVOlWa29FklDb9XIYK+Fd6l7+RA/ZIOPkY17TbtXTIn5gpz/8f/YMQCjUiTDYG1473+T5rY2FdaWcuf6pLpmLDyNOcj3l3qIeuc6M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 20:52:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 20:52:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, integration@gluster.org, namei.unix@gmail.com,
 dillaman@redhat.com, berto@igalia.com, eblake@redhat.com, pl@kamp.de,
 ronniesahlberg@gmail.com, fam@euphon.net, sw@weilnetz.de,
 stefanha@redhat.com, pbonzini@redhat.com, pavel.dovgaluk@ispras.ru,
 ari@tuxera.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v4 11/11] block/io: allow 64bit discard requests
Date: Wed, 24 Mar 2021 23:51:32 +0300
Message-Id: <20210324205132.464899-12-vsementsov@virtuozzo.com>
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
 15.20.3977.9 via Frontend Transport; Wed, 24 Mar 2021 20:52:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0be4a33-0045-495c-2f8b-08d8ef06ace8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6904B0500148689ECC59423DC1639@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:137;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q9WYrzynx9YMWDmRzpy+EY7tLauByoTMIkKOE25FrysP3pQ0hPWEh+kDC0Jvfl31r/OJohhg4zXrKCWzsXTQweqUKb+z2v/70vw46WVmU8i70sgSVztTpUxnOoMS4Eg8rP42GfoNYsiZkVCRsWhf4Fud51MD7xllMe9aYHXc8UCt5TrdBoTRwXAfk9RwaoKRg1bWpfJo8DDzey1QoT8+9qArmUMCPW5zi45cMySO2OJu+xIbhmjJCIpZg1lYEnY2A8Y3cFbeBViEoegJu3MJmJCy/uJcbcNnyK/WLIR6lFpyJSAdg1Bzo0Cfc7UAC47aXZJLFwVmk4oXGb0+viyFPqUURSeJDwz+KhhYFsaPTxOl3kOX7Seqvp5SuhEbRgbJjoxQfzKgk8w/3QMbaRXI9L+u/F0S2La9RS9a9lfN3mc8QahtiEbx988zgEaw8Y6/YOQH0Hvz2okrG1MBVktyhQuZlyRAJASH8/rtCFlmyPr2EKgx0cu7WevfGxohh17mvQdT6u64xtsFIBjNQR4NjU6bmkyEcTT/PQRIoFPxy1BcAqWImMN3Tt9oTmgxE4/qMpDCYnFFaQ+w0cmhFs/2uz/V1QdW3f4NEEi/9tdMmNsfpI+d5GR3ZvO3XPIZWOIUQ1ktDcLMEBxVjnHm7nKnDYVVeWm7LvjMgxBNIUzq08ZfU0kMKdnL2t39K0LiKCur
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39840400004)(38100700001)(16526019)(478600001)(6916009)(8936002)(8676002)(186003)(26005)(52116002)(316002)(4744005)(36756003)(2616005)(6506007)(4326008)(5660300002)(956004)(69590400012)(6486002)(1076003)(6666004)(2906002)(66946007)(6512007)(86362001)(83380400001)(7416002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Y4jvVZ3EhPkLhR9cqlmVZHEjy+xeRtZj4LYB7zTr+girch5eINQy89Sp7Y/q?=
 =?us-ascii?Q?O7NBIjAam/D2T5EbVXoUREJcf0+h0g5WPEDd9rBPDi5+tN651+Qd0glU1wd7?=
 =?us-ascii?Q?XrlH+FA6SchLPAweafhhktmUgYvxXvaHN2ltBrgSOcbgnXi/b/LgjSZQr7Uc?=
 =?us-ascii?Q?31BLnPBF8uktTYetJPpx4PCS8GUTykUt39WogxPdo1LNCHrH5CnPF2H5tn6m?=
 =?us-ascii?Q?3Hf4CvRwigfkUSOh64WoXtdc3QHjwY8XuGCT+IQgs6H8cbhFogqaAkuvHS/R?=
 =?us-ascii?Q?9wB6mu12Ct1spOd/BuvFuv3mi5WnAC9fyTYdFzHt3d7MEM/dWgHip28gseWy?=
 =?us-ascii?Q?WjAFP3ucvO3XOxCozgCTgvCokBf0AobBdK27W3YK/zCRKT4tjTSyFPMkT5gA?=
 =?us-ascii?Q?2eB3T65n8cWMDS0WK0iQzryvwAeAR0r6D1sv1NMk93DiswQFSh83CCP2gkUP?=
 =?us-ascii?Q?K9eMrNcy+NgBwip4HstlssFo6oOR5FoBEQS0TKBQbc/vP5TXEbeNg7Sr3CAJ?=
 =?us-ascii?Q?UHF5zbwJhALP5Wsxamr/uM34eIjNiYLCrYpb/VkMP9vG2dRsvyAqjnZDNJ+8?=
 =?us-ascii?Q?6c6r9iqQdhzoTAkI3Wljbd4kBXtbEY31K1OHwSxE+l0Rm7qbJIeQt2kKOFBB?=
 =?us-ascii?Q?GLA7t0tfJkq8Vp6JDEIDQ2sawaRhQDrurm9eN90o7JlbRB2MkiA3aYVgQOn6?=
 =?us-ascii?Q?5cuopcrpeMD2872FdHBPRnP+R2AHxn+Rx20/p1TxzhZuGGWdVIrIU95hgWu9?=
 =?us-ascii?Q?jcfEE2eqDhx9OiXWB1DApN7Kw1y70Ek/kwK96HEXWvblmgtywm8ojkX6oIq5?=
 =?us-ascii?Q?Mx1uzJetphYDa1mYP5CHWZzKsBSUHcABdV2dPW4mm/R8SNbBNVTC1u13pypX?=
 =?us-ascii?Q?0UHA2wSHV8gYkqSEzWH5n2BrsUCM3cmlZ7H7h/trATGtZUHQ/W/IH7ADJxh0?=
 =?us-ascii?Q?uQ5F8k3cg/s7QpWSvwOCMQ/QaDVbZEo+Raly5cj5SSl3Q9Aqf0MfIpJgqLtK?=
 =?us-ascii?Q?UtaQy1ezgWtPYx8mC2/08BD+6j+aYaL8BzOEReFduiUOg/9QfU5+Hc8F39Uc?=
 =?us-ascii?Q?ugC3glM5B9cK8AmQ0t5Mbhh9bs2nO60w61a2VIbngIXxFKN1FSbBnrk2deEg?=
 =?us-ascii?Q?UBu+xFOMyfvUa/jKhk9zYacmj5FrtMFKvMG3M+2TqBv6aYEiqDPtM9/Jxpiz?=
 =?us-ascii?Q?Fey937okM6jjy8YWfT6dV3DWH0PQOjQNuW7ssgO2c7P1xdvtUQDcuzkoVEQB?=
 =?us-ascii?Q?WbF9cAhcUNk2Jt3dVEaoVYuw4e+akPQvzVfJLXUsF/B/Oetb9Y3ROclUVlmR?=
 =?us-ascii?Q?wxEf3IDqIGDj/D2pthtV75Ti?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0be4a33-0045-495c-2f8b-08d8ef06ace8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 20:52:02.3929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWqgnxMNtm2eQzcXjOhs2mdxaUCoIC64n/MCAFXJ5ASZh6XKIiBwxh9JdgdWoD7HwNw1SdGprO81LjEoFVHx/CDDJsw6l4SakOsce6citEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.14.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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
index 129cfba68e..e3d0c1ae30 100644
--- a/block/io.c
+++ b/block/io.c
@@ -3009,7 +3009,7 @@ int coroutine_fn bdrv_co_pdiscard(BdrvChild *child, int64_t offset,
         goto out;
     }
 
-    max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard, INT_MAX),
+    max_pdiscard = QEMU_ALIGN_DOWN(MIN_NON_ZERO(bs->bl.max_pdiscard, INT64_MAX),
                                    align);
     assert(max_pdiscard >= bs->bl.request_alignment);
 
-- 
2.29.2


