Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE4310E0E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 17:43:23 +0100 (CET)
Received: from localhost ([::1]:51368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l84CY-00065Z-Cj
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 11:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l847A-0008Mn-Ch; Fri, 05 Feb 2021 11:37:48 -0500
Received: from mail-eopbgr20092.outbound.protection.outlook.com
 ([40.107.2.92]:26183 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l8478-0002Vt-Qs; Fri, 05 Feb 2021 11:37:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRJ9mJI3cc44NkMSRbYUTf5bDh+G5lUIN/tJllzNctLR4v976kdnLHeJnVDBi9mzXUdesJ02FeDCG/lnhkrszEL7wpvSgQmo1sB80jdQqHRkfwz4DS1KQqI1CEhlZkEThu6QbfeiU3gv2HZlQq7rd8Lbmb1eocDnTBw5pTKcgHfC1j2mE5R+s2pgo8L3xl7O8UtrCoDVmEKfZQW0n4pDNMj0lrPALoiwfsf/68l9Gi6Ma9M4owwn99EWE+4fseCS2g/uJDnP2eJXX5Vlnzpa5vpo2m0dejtF9xLZZQZAuSXgUiM9bHEejFt+BRMHjv/wjS6YL5BBRvpwiAmy3v4umA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oo4XSiHE1fKjUyVUBhyCffIgsCiz/WrN5FsbeVwFgHM=;
 b=NyT1RBAzOslKyp0dgUS/eHCyrKECcaAxKk6etGqWKvWlHAhWuRkRQnZczVr/MATMaI6rA0dC1gYkON6BiwHyacWLsFuySXNOCkN1xN1YWq/5Mf446LBMk3IpwZtoHYQxUbzNOUEIbRouIp8KrEJnpVGJYxz7IO7T5pcCOyv1stSJqrrHUE/JspcHsmnwpaBYW/GNjpdTlf/HtwZSmaIH3bwM4ilHOsVnwSfQyjZerqh0MKjJOkxSoPKLH2LMiCm+Exwylu6rJllqDB/DDjbzoWgdtHXFawprCaJCgIvXj7z4ax+vMEQNp6OD4B8ytYL/sOrzM50wNxJrlC63bovQKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oo4XSiHE1fKjUyVUBhyCffIgsCiz/WrN5FsbeVwFgHM=;
 b=dDo6ODciK+8s/cMbcxLHj6ziaGUEL4Q/XUOngTrTHkU4qk1xXMjt0IgQj4QOgjzdHcQfgAQ59j30cRlEAlFdJklUbQUSGQvjfhZX1eEQMfU6Pb7TDJVbvyMJe+6POorBbmSbzuyLJGdiw/rh7Qw1rv3p07wuqojZMriYmoQDoW4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4470.eurprd08.prod.outlook.com (2603:10a6:20b:b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 16:37:35 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Fri, 5 Feb 2021
 16:37:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, fam@euphon.net,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, den@openvz.org
Subject: [PATCH v2 02/10] block/nbd: implement .bdrv_cancel_in_flight
Date: Fri,  5 Feb 2021 19:37:12 +0300
Message-Id: <20210205163720.887197-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205163720.887197-1-vsementsov@virtuozzo.com>
References: <20210205163720.887197-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.213]
X-ClientProxiedBy: AM9P193CA0029.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.213) by
 AM9P193CA0029.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 16:37:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18db3a9a-b650-4b15-e182-08d8c9f45757
X-MS-TrafficTypeDiagnostic: AM6PR08MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB447056AA28A07115D3BE1CC3C1B29@AM6PR08MB4470.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:132;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2iA/Hdhq5J8iGsYeUu8c3Vor54Wnc2k1LL2pIJtX8CoUN4gUcbpJ4jgILVAbZy+h8Xm2u9VE4oBVgPJzj/Vb9nl6331PZ4rlLDsZPOKk3E4X0UNsR9WShwspg1DPPW/C721bppQFXptH+pFtcZo0xPbo1KIgHl6VdMfGTJVxvM3uRNddveXWHtZ790/eGZhEWmIg9OqpK5L86rQeZ9pBS3+f4Z+OgYdbQ6taMhZ3jpsEldsx7qp9LpLH3ZeyjIOJq1DaSKrnp/tl3LVD9Xu1VetQ4UUv4KlQMk30i9WupSh+8oSNzXqqebfDMel67BUBJ7/F5rwtxYnFTBRcZvyYKFM4fVmyIcgKhYXl+puuUv1/c2ItKtr1jus/QpLRl/EA6fu44Qd6jdcxWyrNYuCyZxgaLaR8ArkFXy4N2A5SqrKdNAOkApoE7x7ohkruFBumNhEey3b5AFXPAQ/HIyOPACrk22riLzp9jQVf8h7oAiaV0ZLfYcCyr3+8vXpv45VkSXhreycYy4YDhHb6UzrbIZaQsvfFH17Ce5huzk/w82HCbV/JWzkdZ7DbnXeYIVad
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39840400004)(6916009)(4326008)(6506007)(478600001)(86362001)(66556008)(66476007)(8676002)(316002)(66946007)(107886003)(6486002)(83380400001)(36756003)(6512007)(956004)(2616005)(8936002)(26005)(5660300002)(52116002)(6666004)(186003)(2906002)(16526019)(1076003)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WaCrEVKnK1eAp1P1jYs7lhDa1uupEFiCeldhZ1wqxmX2dN5d+p7G4ZA0/VKl?=
 =?us-ascii?Q?E4JQbiF+lLKExyMOAMYciheyxhN3eNXobYOCTlkRYgjkrcLL/zp1BVHBHDXt?=
 =?us-ascii?Q?+SvUAd6ZkrROvWoIakloDzajoR/wdGY89a1+zFqnQZDzgP/3/hXKY+qhIKpn?=
 =?us-ascii?Q?pWXrGaSJKMHOYnv/2aa8rFy2ITA4w5LjHkxxsWTGijnZaQUmFZSVUSaA6p+R?=
 =?us-ascii?Q?xs4W51nq78hG6FxdniyFMtMsdMQb7CdGJ7N8TwmLaIb88R34v92z/TF+c9UE?=
 =?us-ascii?Q?ExPEB2c4IrLouqz6vF08FXinU1IFov+eBh1Jloa/yNZX67KCZ8MRrTowm+Te?=
 =?us-ascii?Q?0lgvPL2BKCeLrULgeP9EhWaQ5rKNzaR9IMZsQJNLmO4yD0B9D4sZsACOhDEW?=
 =?us-ascii?Q?o0YgmNVap23BwfK3JGk7XwGlWzVNQEOn94YIGwDfhOnnxwYiTNNHwcEm+sV9?=
 =?us-ascii?Q?3vJRSObLxKEuvW3kcQ5sJymfL/hJ0WBTYrYC3B1viNaP2Fm47FoRQZC15LeK?=
 =?us-ascii?Q?b4DSt29od0JU/Cj3jkDI8HCTgI8p0EuIOMf5QokhWnvBTB1pzYwkfVcZlTCI?=
 =?us-ascii?Q?SRxRyvaYhG7M8n1xJ4lOlkdrXj7TrhOx0d+AfHxnDCArzc+fLkz4pjJW5l+E?=
 =?us-ascii?Q?0SDfjyaY8+nXVQ2nBlb4fgPfojDoNasvb/WBsfHi5yYeQ0r8l8P4uEWr0OOY?=
 =?us-ascii?Q?5aB+UYkB7bFr53UHS/s5qKXGTFO4d9l819TEU8pAP2fvwycmCpW/3CMYOavr?=
 =?us-ascii?Q?2l5tVN5RnsFsH0dLxE7lb7DKvk/SySotYNuRgeg2Avq3pN/oHv6IjTZIC5ua?=
 =?us-ascii?Q?2Fs8E/5fvNsjWkRSR8LjoDsAoWE3474L+ZKiboqobMs5VZIuMM8GJt3o+7Ao?=
 =?us-ascii?Q?Qj5LdJ+zuYOiRFrsPOFo4f8/y9u0hA4XGZDo8utd+iwkYZZcQlkhceR6pYGG?=
 =?us-ascii?Q?o+Dlehsg/BAOYlTdxuKN8aROdsaN+nqmbhWPidGi02ZlZOdx36wKIPpTFo3D?=
 =?us-ascii?Q?QThLFruCPx/QcV27U4b5DG/FcswimMR0yEeMbvsEBpMOJVhpMZV2INeg/3E2?=
 =?us-ascii?Q?8X9vpF9ZW7wtCeSMoC+7p593wpvw7XJcUmY3d6MksCK1OwvgkUAwCQzD+NwY?=
 =?us-ascii?Q?iaFB8RQYVjW2ny8scxw9ERLNDIn68LfewBGzr9Yy+L9Ov6Z47PlSHsExEdf/?=
 =?us-ascii?Q?XUvU3xKcbU+IrZ0nPkuHK0d0nHzkUGjCyUAdVropgwI5Q9sbPSMmpbFwkQ6u?=
 =?us-ascii?Q?JKN07ZOpy6F68K+G4t/bRyP+hMlAO2IuBsxMEwrrI6Z+LsTVAauYv/s5eRS1?=
 =?us-ascii?Q?aSYqr9+mf9q1tjZ5wZJN2bZ6?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18db3a9a-b650-4b15-e182-08d8c9f45757
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:37:34.9875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKCGXva5GcoiX3DW6dwQvpg6mu5Ip/V1tk0qngXDnqcHxfiFm7YhJ543AOU0l3WB5KBi/fYi9XlM+0tJhpwripqlA6nkIKrxEQeXzzFt/zI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4470
Received-SPF: pass client-ip=40.107.2.92;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

Just stop waiting for connection in existing requests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index b3cbbeb4b0..c26dc5a54f 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2458,6 +2458,18 @@ static const char *const nbd_strong_runtime_opts[] = {
     NULL
 };
 
+static void nbd_cancel_in_flight(BlockDriverState *bs)
+{
+    BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
+
+    reconnect_delay_timer_del(s);
+
+    if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
+        s->state = NBD_CLIENT_CONNECTING_NOWAIT;
+        qemu_co_queue_restart_all(&s->free_sema);
+    }
+}
+
 static BlockDriver bdrv_nbd = {
     .format_name                = "nbd",
     .protocol_name              = "nbd",
@@ -2484,6 +2496,7 @@ static BlockDriver bdrv_nbd = {
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
+    .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
 };
 
 static BlockDriver bdrv_nbd_tcp = {
@@ -2512,6 +2525,7 @@ static BlockDriver bdrv_nbd_tcp = {
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
+    .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
 };
 
 static BlockDriver bdrv_nbd_unix = {
@@ -2540,6 +2554,7 @@ static BlockDriver bdrv_nbd_unix = {
     .bdrv_co_block_status       = nbd_client_co_block_status,
     .bdrv_dirname               = nbd_dirname,
     .strong_runtime_opts        = nbd_strong_runtime_opts,
+    .bdrv_cancel_in_flight      = nbd_cancel_in_flight,
 };
 
 static void bdrv_nbd_init(void)
-- 
2.29.2


