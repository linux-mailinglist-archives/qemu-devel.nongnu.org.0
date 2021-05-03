Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CED371544
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 14:31:42 +0200 (CEST)
Received: from localhost ([::1]:55374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldXjg-0003QM-VW
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 08:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldXhU-0002fM-AZ; Mon, 03 May 2021 08:29:24 -0400
Received: from mail-eopbgr80115.outbound.protection.outlook.com
 ([40.107.8.115]:10478 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ldXhN-000872-0T; Mon, 03 May 2021 08:29:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axp9umTed+tMpaPQJlpXWE19Hyn2vD7zDSkNC07Wy7fJi4YDONZfIrW8QPqi8+sCtMa2jT8jbqP0K9BO+tBjla3H6uFXw/cCKzho7elWVYaUc/A9aFoWV1UGLM1bEtbzHcvwUP5a4LZkVqA3E+h326TUyB7QaftpMrdBaB5Mb66iTMYLGc1DpwSDjHXoWQ85DyKRVCa5S17fq0keiTC4LsjzdEOLsciWBc/5nTcfhz8p+82EVG8iFXEE1qDnuG50IgHcqCCtrl+oai5Diy4SE5Gym6M9JlNxaK7w2jYzEWwPd8tmgdKjHaVseyaqAem46fmEkqJAt/VKQgIRtIyq0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLeZgVfmlAREVjHiEjMoTzWcRY1bUfrQh1Cz8fQFEA0=;
 b=J4hMGpl1W9Op4Rtf2WQVytuifn4xStPVQDG7IZCyP3C9b5sCoRZFxRgi+aeOZwbzGFZt4G0J6+jVfOcyshk0KdcbapSNCv27QYBa8+31rinvWWhIi/CkM/uWtgxiuOezYxluzzQGfqZO3eX9hWH4FHQPYZNcC8NxieCHufpHz8IAM0g2+G7CfvPQpVqT5ITxH4ixIXmL+99M2lEiSALGp2rqhJgr3SISa0IUJ3X8oW+laKybnTu7P6IvkB4En8sM9PDNKiETiAWkBbpEa5z1pCv2BzPs003+PYsQmAoMxEibRg8zZtdrL2XU21saVnCcyhuS3nDwa/wnuBAJt4aOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLeZgVfmlAREVjHiEjMoTzWcRY1bUfrQh1Cz8fQFEA0=;
 b=TkcVKQdL2aW28RiZj0omdFTyO0PtO+7xHQNgsawfUQTVx+CmJiFF6ShaMINNFBw/ebv/34cEWrv5vPZWn/VnnfLu89+yuyoU0kgA24E91vGr/HUtJIi/JFcew31NebWVoY+jgkuwrV9xFiMfbswTmTGgk5w7IZB7m5wGqAHtJNo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2034.eurprd08.prod.outlook.com (2603:10a6:203:4b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Mon, 3 May
 2021 12:29:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 12:29:13 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH 7/6] block: document child argument of
 bdrv_attach_child_common()
Date: Mon,  3 May 2021 15:28:59 +0300
Message-Id: <20210503122859.187159-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210503113402.185852-1-vsementsov@virtuozzo.com>
References: <20210503113402.185852-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR0902CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:15::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR0902CA0045.eurprd09.prod.outlook.com (2603:10a6:7:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Mon, 3 May 2021 12:29:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d30a28c-2e05-41ff-0536-08d90e2f0f0b
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2034CDB44B86C55748E359A6C15B9@AM5PR0801MB2034.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hs5M4+1E9vX50XD+DvC9STUzzn8Q5HeRr0cf0FCQ9nYDOUeIY/iOV9u8aWp0rcOGwLZ4nwY5lQ3xrghcRBGR/u9qZzak2QJqXYk6sLT72qV/IG0ZUOZ53TARabZ611nhm6HAPhONpTUnRcTPmQjycoIrxEBdHKwGqjPsE1X94EPC+BZ+gJ3amUg/Z0eMS0lbIUuqbPGMtKbySgJPjBGKM+fEdiN698G9x4uKhthSXObSlrioIwpI1V0Xb+srkXTsN7x8PoCjfy5nDGn3uK7S9KD+8Pu8g0rF0wsdWxc0RkO82BtbO7ehBXhRiCnTtoM2CMBOaeCAptT9TXU9VzNZG0QAOH3AzlozoAoZgqfqPszuvuBb4SGDhRotnx4bh9gJOvZigSDEv67cJ1C2SNEIWZHWBVjkoCEuVP/XooGhXnicrT15FpFbompNl6KpPgwTxmkB6i4hHil0BOwfsHQbXJTAySxLTJuXxRv13xCBn0q1q8xLRHLEHQR5YpTAAUpgvrlIaDRq8sj+n2wlbPEi1MKep7vRkuIvrR2UrreI8w/e/ZhM98lqhxcIfyk+5HGZ/ZGnnlGfWNbOoN381PfATfMiMqFUxfF8RED2k/GeUysxFHhHfxnIBF8YNh/NRlLpfvCHj85qSwsuUriDl5i+NvB+U7ON6EJ9wUNP434t5i6qh1LpO+Ozg3Lw1yfGRxIv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39840400004)(956004)(52116002)(1076003)(38350700002)(8676002)(38100700002)(6916009)(6666004)(2616005)(86362001)(478600001)(16526019)(4326008)(107886003)(2906002)(66556008)(66946007)(66476007)(26005)(83380400001)(6512007)(36756003)(5660300002)(6486002)(6506007)(316002)(8936002)(186003)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VE7R6IXDZEtiophb7QRj/mFkaiRQDAce17ek5q/SJmukA4sWlywoRZVf1GyZ?=
 =?us-ascii?Q?KKTTCsXOrQafC/RmezfwASx4/rLmk1Ca4glqZKWGJe2tmga6gLwfSD6AkHv5?=
 =?us-ascii?Q?HtipmqHXJZyNP6+/voD2PHwfLOg2O2R3nuxHDLSxWenLtXbOivc8yrq19oGm?=
 =?us-ascii?Q?RuBlplOgCnRN/5lOExEsYsR2wKVXFPllE1nFLZebqTaH7yR3EOC6ZwxpEoOR?=
 =?us-ascii?Q?YGxzqz0BNsBW4stqQqbmAc/dPNh4xRoXjuW7S5YKpIcuEmyo2nAELXc74CbU?=
 =?us-ascii?Q?MUBhv0WkYk7yuFd+AJxRoGTjBg01/Q/51r0mYgji0buweahkv/7XLHE32zS9?=
 =?us-ascii?Q?ruL0gRkXp7sftSW6dbKpkFvVKprni7+ceP4L90cmWWmwwdHkd8bXMxgJup9J?=
 =?us-ascii?Q?lJVj6gKtYFlhAvwfYj8XFhWgs1gd4SBz1B8VpFJDwNbTeztiXlNUX+/EBWk3?=
 =?us-ascii?Q?9P2Mw4BCXOGIUSyJ0uCYyDOO++NealiSNc7y08GNpoK04nf2BdjzUHL3UKzM?=
 =?us-ascii?Q?ZLPFvqzsBjG8D0skZw6SLy7a3WDxUBmhHfYHxnIYO4C/sNv9T7t12bnc9T7g?=
 =?us-ascii?Q?5gaIIPBnT5xv20woFNWD8npKl4Cm9q18VNE+EuEpy7tn4PK3icms3AY0WH3Y?=
 =?us-ascii?Q?mZpH9tOYe2iBNgjqaArI6XO34AKBoL0VD9Rk+VyW78uATTEz9ax6iBj9U4r5?=
 =?us-ascii?Q?XKr3e96DMJlkrl2mgbv/zPz/CqrHjFukf069T8Dw4db5+mGopfuXwzEMuTKb?=
 =?us-ascii?Q?3P/THN8oZguzU1XbfJX2Hf/ALKB1S6IpV9phzx64HY1Dqlp1kDMbgNOwMSav?=
 =?us-ascii?Q?8ORdYN8Ye9gx6It9KssYGswySW23W0+ZjUi/beVubd/N5t5hrodZ2fdQpip/?=
 =?us-ascii?Q?AVp4OTNFsx+eUMQyhBHrffSJWnX/yJvdtKOnJ6aHOnqWLwL9XR6CgNef6uwN?=
 =?us-ascii?Q?KF1M10pu9MLshGwDQNkNOTWR7jii/1nwkxsViyZqlUJ+66NREvywfd8lpGxf?=
 =?us-ascii?Q?lLEjJH+29nPTYOa5yCdaEDrPHHS8LfBl8dz6ZN8eh7sieoFPG1EdCJHDqVEw?=
 =?us-ascii?Q?ceYI0R7Maa/WuTPVrCU1Kmjjpj5VNBKc+Bl/ssV40qaj+VuTNpiysvmnqHHQ?=
 =?us-ascii?Q?o5ubBxLlAnXOjWTIXjEqNK/LX/CN9ZbIhySfL65Rtm1VIFirlMsRcIsaO5+T?=
 =?us-ascii?Q?2PB22r4cMuav2KEsTVQRD2IvYikQGqd4CQ8uJADehWdqAfDsAT0l/2Zzf03o?=
 =?us-ascii?Q?M0W2Rixjv//6YOJmClNN/HeYVEdWWLSG21KsGrFLU3CHQ5pbWsi7ke7dylUV?=
 =?us-ascii?Q?Vhn1DuwIL79N62OIenkWTkX5?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d30a28c-2e05-41ff-0536-08d90e2f0f0b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 12:29:13.0299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ug107oL+pipFMMdeNHN82jzbhubqmVIYrlZPlECENdFng3LLq5IsuzBMByes6aIfI5FRJBG2NpGuQP6o2lpfAEnecbg1OIX+7DKYHn374E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2034
Received-SPF: pass client-ip=40.107.8.115;
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

The logic around **child is not obvious: this reference is used not
only to return resulting child, but also to rollback NULL value on
transaction abort. Let's document this.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/block.c b/block.c
index 3fc87fbf90..1f89be6f97 100644
--- a/block.c
+++ b/block.c
@@ -2773,6 +2773,12 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
 
 /*
  * Common part of attaching bdrv child to bs or to blk or to job
+ *
+ * Resulting new child is returned through @child.
+ * At start *@child must be NULL.
+ * @child is saved to a new entry of @tran, so that *@child could be reverted to
+ * NULL on abort(). So referenced variable must live at least until transaction
+ * end.
  */
 static int bdrv_attach_child_common(BlockDriverState *child_bs,
                                     const char *child_name,
@@ -2847,6 +2853,10 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     return 0;
 }
 
+/*
+ * Variable referenced by @child must live at least until transaction end.
+ * (see bdrv_attach_child_common() doc for details)
+ */
 static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BlockDriverState *child_bs,
                                     const char *child_name,
-- 
2.29.2


