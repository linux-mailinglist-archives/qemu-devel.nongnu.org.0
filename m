Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1F5396E6D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 09:59:40 +0200 (CEST)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzJL-00029S-Hj
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 03:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCn-0001tG-C7; Tue, 01 Jun 2021 03:52:53 -0400
Received: from mail-eopbgr140133.outbound.protection.outlook.com
 ([40.107.14.133]:29384 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCl-0005x4-KE; Tue, 01 Jun 2021 03:52:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVvkpK2h11BQHQ1wThLhENaIwd22QwtCzdJsoRr/HOS7BVFoSHTQ52R4GuxOpmPARNMp3KQwN3Gyhcy55Od8NINWVEo39qPvAD0/qV9TY9YozQWN+AEpJQAyh08mW+pgQwQ1N+QM7jI8mkiZCMR76tkUMrfuuvXqHtnJaJO6bRW8XNFczkLHJnVdyBbDV115VhPKlseVk2E8FzhOUYNZDGeeWYviyTs53j8xvrZyksd/+C0i7J+2UbvxE7EdrHYrnSOLog7QQKgDGQX9dZuBksHYEPudgu4IvQACH5tVS/FubuklMirOUlk55VxaaJYH2fsxAaHGPVoKn5aWe4a7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhXh0NUN/dV7dl13patV8q2QChP73rJHMrBKqjkd1K8=;
 b=oN5s+VoFvTZdJm6tfLbG9y3ooZvS+oceicx1QjB8jGTkP7U20eKxohl9SldikEjhoBslhLBZUkExAAtS5AVLUKQhhF6j5wL3dSDUWfdDA309aFqJuep1vj9NEKuB2eYnCe9aN8gcnH3nn8feOccFVt1L6ZECEeZ8V4lGwSlBXRgFHV7rcllSxLYCWmM1uTcRYwGbyjv8v3F8wtV7T7X9HQW216JVabZYKIxD7f10YiOgSawEJA/h/KCK6U1DJ1DB/j/Y3ytnbjvAsP+l5jzbdulO27D4PpGC8QpZqTKYUBGt83yfK4gYk5bgUTRN1iyOV+M4rmwXZhNbpMJ5W+XLIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhXh0NUN/dV7dl13patV8q2QChP73rJHMrBKqjkd1K8=;
 b=D80Y/NbGntJVngUfkxazyybmfbc4hZPPbCXxWbOec26Zswtbn6lPdcHY6aZrf6tEsjDlDmzU6ueYLFd7t2hl2M3BsvEtz3XaUDQk7WrrKGPiDjQv678rdWVFmaeJqlwkHxoU76Vx5+UDg2Q4+bHqRwxmlj7AgYTnpzlelienGb8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Tue, 1 Jun
 2021 07:52:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 07:52:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v3 5/6] block: simplify bdrv_child_user_desc()
Date: Tue,  1 Jun 2021 10:52:17 +0300
Message-Id: <20210601075218.79249-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210601075218.79249-1-vsementsov@virtuozzo.com>
References: <20210601075218.79249-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.210]
X-ClientProxiedBy: HE1PR0802CA0018.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::28) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.210) by
 HE1PR0802CA0018.eurprd08.prod.outlook.com (2603:10a6:3:bd::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 07:52:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87f47806-c281-4f7b-18ec-08d924d23abe
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2099616A3DF6969005C83EA3C13E9@AM5PR0801MB2099.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:191;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MHBKur/e0HVfqK17QVwl6Sn4+z0u0jUoC3hJRlPGATHj4TbnhJgrTQ2OXgTbtTogclqm6Ov8FC/v3sOn8ZZQLe47uLrm0zVnptAcJ6g7lg2eUjO2CaNB7KZjckSEp2rPPOR7wFZ+0JaQOnvFcTuWlW6kHAaRlIrfS+NqckaNDTpd6exghDorbHCl9d4phBOf5UwnwfR6kwU4dy3UVZo5f5GQTKfKIwxK86v+hkaRZaMQpJ2urViz1N2u6ZopOkq6U4Ta0GdQnSFjVTTfTqLtXpnlE4OINmzvJfnHMEYCWYct6sBwJdACZYpAQYQPBUNtslX9t7TLBhx3pQsBzDHmMOlSMVCd/vXrEJpqVugPVWpzpgy7UtZ6vkDMN3gfljIHx9nVinZAP5EKqFwAyBk9M0vkyETUryDhK1svhYNNCmmk2uuDpwUXFGu9+RNnuixxLkun3n4f7W6TTZh8PFg9OMYPOmUXl4b3ZEgPoogiMmy9EC2Omf5JzWuZhvtBWhT0Y0DewPQbg+GasCS5zP4viQafxEmnbPuvLP1uvL5ioBjxq+ZXuYD5ETEVPgOtJiJEjvMqh6UNZ/cyEHZk21eG2WGXPvmn6Ni5+Kk1bq6MMLKK3TwvbuXSom3+aJXH+wglNn8uXm9dy76WnU8XtvtVLXJsQrToYYzwObYcyjUMp9N9qlMPjdb6MECNKR4/mLq3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(2616005)(6512007)(8676002)(8936002)(2906002)(956004)(36756003)(4326008)(316002)(83380400001)(6506007)(86362001)(107886003)(16526019)(66476007)(66556008)(38350700002)(38100700002)(6916009)(478600001)(6666004)(4744005)(1076003)(186003)(6486002)(5660300002)(26005)(52116002)(66946007)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yypH4HRUt924S3795XGnY6qt82ZEdmh1JhWO+xdJPnPMSdmNPkJGE6gzFsz8?=
 =?us-ascii?Q?lO66HKS5Fv1BkHld2cb+9SJzpUuLfB84o1Z9Ro4lfd/RcYo5now9lNF93OP/?=
 =?us-ascii?Q?WtVnbQFGSDYux8CTKl1RXGolWIXe4hyZQDX0TdqqT40AIejo5JADUF5jknnY?=
 =?us-ascii?Q?OiPn0tHZc0CUNV6g3WwpqGPcnYozchWbPr46WIdLD36wY8r0IlYrFt+12lk6?=
 =?us-ascii?Q?aDuLfuJ7+BAlDfvtkxIK6Cgvphwuk25dmvxEpTC1byDfzo7AYBRp7EjYmQMB?=
 =?us-ascii?Q?F0bGOm4yQWX+VuYt7Gph1LDY0WB8jXpnJ5frF3Th9k8gp5DDrgpFpxfRM5y7?=
 =?us-ascii?Q?7kGi0IwmFfoN7FD+pWbuCG3SZhKZMV2GBEQS+F9oLhf39m9NPXS7I2nVjisD?=
 =?us-ascii?Q?LoBCiX56XuUC7+r3c7Lj2uNhMXG3QfxyCGVBIft4avcfCJT0QSBiy/c59tgH?=
 =?us-ascii?Q?TvYBoNNkhztdXi6NBMapzGRm3OXyy5XKh3BjGVzfMGsiFfNv19n310ev3u8x?=
 =?us-ascii?Q?JwIKzD8AZGNeaeyJbZny65V18AGxfrlIUMq0xFpCYAXKTkJF6usO6fXUPotE?=
 =?us-ascii?Q?cz6I7VW+6fnklUlX92AOtXOzEpE1oGVc1qqk3g9fKH/snbReByd6Z5R5tDxW?=
 =?us-ascii?Q?42NpmqTYGyA9FqbxwkXr/Dw+S/nVcx46tIFB0129PEFhdZxhdlRLlX4Ywrcn?=
 =?us-ascii?Q?7I1loSuWwsnpn9Z+fe7lg/xEITXio+WdapKMLehIpIil+3mibH+b0IEiAIZM?=
 =?us-ascii?Q?n0D/edyb7+df8yLZKSBL1pJtUaJ4mWd+dCzDFtagDU5xKBiYZW9zfZxIIbn0?=
 =?us-ascii?Q?wGHSqwMF5BA8PnyvQOZzVelPfyM3kwR0hX0W1eSaEDEVI3/idyVWjstIvJf+?=
 =?us-ascii?Q?A7pc5uFEK3thJjm2Clu+hnwxmvgdfG1XM9JgaGr2TNW8HqP35onVLN1t/g6u?=
 =?us-ascii?Q?jPe0qgtwz3Nd/JD4TRk47UsWxa1IxAYGAjwFz99KvoTLMbJ3FJlDxLOJKeNe?=
 =?us-ascii?Q?4S+fC6vJ60ZPtgbgfYIPMkkZgEwp8EM3QUHF1oQje1cOWFbaSGFrM7u/MbdN?=
 =?us-ascii?Q?3QNmyIPyu2Ln0MTgPiAih++oRFMKzqM8dQFhcCAyaTyn/js4AxCwI9smuJ1e?=
 =?us-ascii?Q?5QITd+LrKCeDCuLurv+KPj04Gn6ls/w5m2iqd9yYbl5yQlKpTMq0AXCa8Sq4?=
 =?us-ascii?Q?TOtidav+Ju8z9T0QixToDJDs9WqPjPWBirZ+Bw8IbHnSjWt/uR5IOSGClZvk?=
 =?us-ascii?Q?hojV6gdf/+ExY4bC93EM68UeqZSKQPaM3W8Rl3bw2L/Uot1esUuV49imBem8?=
 =?us-ascii?Q?OUJmEud3xlViz2hhyTluWe1j?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f47806-c281-4f7b-18ec-08d924d23abe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 07:52:39.9105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U55oFpyqXptXPv4SV7E05SVa1OUD/cF2mUs30z0mssr2Hz2tb1v0/BDp3U6oSg+ejCefIxpQbesyZrQBV15ZtMexNwprhliSeGbngjb+868=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.14.133;
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

All child classes have this callback. So, drop unreachable code.

Still add an assertion to bdrv_attach_child_common(), to early detect
bad classes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/block.c b/block.c
index 94cb7b6637..3c0c3964ec 100644
--- a/block.c
+++ b/block.c
@@ -2026,11 +2026,7 @@ bool bdrv_is_writable(BlockDriverState *bs)
 
 static char *bdrv_child_user_desc(BdrvChild *c)
 {
-    if (c->klass->get_parent_desc) {
-        return c->klass->get_parent_desc(c);
-    }
-
-    return g_strdup("another user");
+    return c->klass->get_parent_desc(c);
 }
 
 static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
@@ -2772,6 +2768,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
 
     assert(child);
     assert(*child == NULL);
+    assert(child_class->get_parent_desc);
 
     new_child = g_new(BdrvChild, 1);
     *new_child = (BdrvChild) {
-- 
2.29.2


