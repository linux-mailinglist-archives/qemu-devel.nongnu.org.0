Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 339B74C5259
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 01:00:51 +0100 (CET)
Received: from localhost ([::1]:53160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkW2-0001NO-0p
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 19:00:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFe-00079Q-U9; Fri, 25 Feb 2022 18:43:54 -0500
Received: from [2a01:111:f400:fe02::720] (port=38968
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFd-0005i5-AW; Fri, 25 Feb 2022 18:43:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoE/GtN0nySVH3OoeFydSGOm/Wr2KHo4ThqBhxj117ogaMKM6SJio88RRTHJDJi5tvHNB04vTmuAbyKA/Bf5/l6jhmcJnrkmQLfwN6z6iO+0vTnX7/5614AtKhcZk5siGAbGRnmtxESA3dJTPCCbX7mw3DT9KXt0zEeMv3FBfawCogtCtDwGvyfbPL/D5+rQjwP+En7kvd6Jykgw+A0d31c002v0f3madb46OfZTcVYvU0VsmIg3bGsd0kWxU7JZqS5bRoBevJGaOUZVYHTl3K9pLVS/0s/4DhTXsKgEPR5LFKcnLOSnjmlb/OPPUY92FGal8fYMx8YgSdxtK3Mpyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EovN50qBlzPZ0bVClbI8Q4nS94lEAfr15AVQlSLMwsU=;
 b=mAL7sDLegRA+i0DoErjNk7J5kjPVyYsKZ1K4vv/zPZFLJfS1oX1WcS2OfkZH0GUGOH1uI/WdKK+3f29Lw86IDtSuuHC1oYyQyWzpVkpwDzrTCnyXOo4A5ztPDRFMpvWf6NJFl1WGuQ3u0EOmGSUCiKhN4FpprLM38T0QgIT1BLFDUeKA4GZo7AZO1vhK4ZXh9M5tIWYZZ6fp+EcTd2MvoDsMAOXxOkB7g+daYmiBT/s0aq5dZxkgYHxhVLv2ysSMaANSxA+GwPd2ZkE0c/1X0GT4i4Zo7Y9f6Z2h/NPyN99GMDMZi4Zdu2Clg15/R46e3H0tHp8pZ+p3bdK7ReL+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EovN50qBlzPZ0bVClbI8Q4nS94lEAfr15AVQlSLMwsU=;
 b=NoeXlRjuszsVFrMZ+EM3U+/EBO2vvuGaq2rNTeKfpjxI2lbn7pWZ3ZjFj9wvEnYOZxMrBX6TIBsSiofV1XLAqPGi1F4q6o0sUcKKIlE3ixkMY1/txgxo0LTGXMXJzuFAwDou+yDwWzWOX5k94is2Ix0EKjbpNSfL+bMVQHyu6J4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:47 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 10/11] iotests.py: add VM.qmp_check() helper
Date: Sat, 26 Feb 2022 00:43:07 +0100
Message-Id: <20220225234308.1754763-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d529dd2b-0640-4b3d-2d43-08d9f8b8aa3d
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB41721C71A450BC670FE525F1C13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V3MyoQcKtlxrNtewyXAdGZDZJFv/DJmVPyziMnrTr4sgPTQH1GgdUFUYnyJAz8+mK/oIhfiYvD1KzD92d1F/OsNX3niUM9/xZhFeZzMQwZPiKx9j7EBHoG3L5bIwuoCvpjetlXE43VzLZcspHFUVBF3NqrnWjssAOGh3REi9GgB2TwvNjmwXYBhOEy6TXqsg+OQzTPU0hJAT+Y/427xe5W4H/AhjiXdupHsNJXtIcu39b827cGth9jv01W5QOATb1xWcvO72nx8mLPE1u6IbjR6nOupYlvKbl+wUZSFFr4rc2L9Z8onB4luSAbXNTXmTeM9MHRx/4XEgDx78Yw9g4FV+kKjUOhLsSFuyci8garV64fAgcE3TXH1jRmVvEB+yxbU9WgV6MYNTGMz1bTLuRX5/uf2491vv6NF7sV+X0bGAeZUsI1k9++pUfpK9e4lMB/++o4U2riADHaIzjojV/DaGyKbaT9ndzkkMjwCtja0CNmPQFcfmVhEtP8WarXJQUjPxGIVWKK1zbT7Br3DLC2/UaXKuPCeKRxnvqQxhe5H6VfIt1pL/P25TyXzKV806vMhlUd7XO6RfwDm+mjDz+u8tobBnCMZElwOUed++tYT8dLQLQh32O0eDgM24aSf4sCa65jtk8vsEw1RzOwbv2iIr2ZwfwJeYE683RkITBtjaj016S+A4RkbfAg0ltKPp3RsR2LO889MWHzCqvnVYlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(4744005)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B2q6wUaGiPV/B0DqBVyaHxabMsAhB+ZY4uFgwObzuSpn7lWsWaauvGgZr1c5?=
 =?us-ascii?Q?dw5OYwgnPq/35u11eenKLLR3rNbwURqHVKf40qQcibc5nMc+0sPdAgVzhroN?=
 =?us-ascii?Q?rNkwHrSn/hA3U4Z8hA5ta1/Wb43+Q9CAWgPSjJzu5fkafQtEZNYr/fvvFqh8?=
 =?us-ascii?Q?D84D0gTG7LaOwZL59RYLzzMAg5H3F7XC0XFk18GwtVO/GVj/9wvzD9rT04OY?=
 =?us-ascii?Q?iqgfe/DBHcfHc0Qb7EAYoG4zNCEVRAoiqJbqavZmgguq0apcN6A37xhM/2Du?=
 =?us-ascii?Q?2BP1el/lkOho0Lm1JdzdMfEd+Kg9sitixVHkGd4PzT4YGtJseTpAYMft0if9?=
 =?us-ascii?Q?mCDcrHTyALyiqt1+S0zHKAXky5whQ3/QBhG61tRTYyoUs+Sp+lOD6DJsznF6?=
 =?us-ascii?Q?+bL/nuFOk3+uIo2utg8vw2x3lVGnCuRxchJmI18MUEFreNNluDAjWPjhC9ro?=
 =?us-ascii?Q?J8jOd0TjzN4SeFN6iRMWj361s3wEqV7l1s8jOWyskJbawq9UadeK3/2vcPCD?=
 =?us-ascii?Q?lfRUAFPRTruAt1EKaPEA5CkXo568/tE0JqI1ZyD62fCg9hwwC0X5IyqpqJ/l?=
 =?us-ascii?Q?+Utg1YJHCUbSdCOIMpsjdtLPyLy4BxK0CjpWTZa8rcYr+4tokcHHt0GOIHb4?=
 =?us-ascii?Q?OaINDX3OptiDZoT3i2jRxCPFX1fp/VlLd1y7aoH9+MLZ1ASxQmCeTcwhav3R?=
 =?us-ascii?Q?FdwUCfK3aXWZjB9wsbF9WZIJIZk+vTqFLxoR66MUqkz7sxIznOyTawvta8Ub?=
 =?us-ascii?Q?asHTdF1DNGB2ty/7k7k/RtrWQwbQ4DLsB81KNOfWqboynw9/OmzTByOZIV7g?=
 =?us-ascii?Q?+8vg3ilEPqMuISvipcVzL33MCp7AyY0MSfZiOBXtAJRH27AdiOF/bkDOGqUj?=
 =?us-ascii?Q?qli+BVl3jOLR10n1noOkAHufDZ5UpJBMXmxh0bCUHXEH/uEdEU/XEi4mbHH3?=
 =?us-ascii?Q?w9nLX4pTBzZhTqJ/QWdb8WXkMuwvcifjF+7GrySaP8i3Oiuw+7M+CayUOr0Q?=
 =?us-ascii?Q?APpxg8sUshQJFizM/bEn26Tswl7UF+5gpvTR7ALcT+t7Mj6amiay8FuodxI7?=
 =?us-ascii?Q?CKNpAqAN+iwP37MUtdsln1SmDApRXxA43dhfePYJw0BnZqpjkQktIhERZkV8?=
 =?us-ascii?Q?UetUtDTjVSwIMlUd/Lm6KRhgEFLNH7PTMFVPy04VOAZgDvGf/DBisRVdQnP1?=
 =?us-ascii?Q?hc6YZoa+Tgdm4AGDNFhwaOSq0D1sRxeZ05bfM4N9nrIQv/tT+I0hhYNBCXTu?=
 =?us-ascii?Q?1j4HKryI5uahX6nB6uqzjeddMVKIQj5hEW0cEV/vRgwP0wujYoNYE7fxAc5e?=
 =?us-ascii?Q?GAPw5Ui9NgZP00hn+MpTghfCS+dvBdxXY7v3Js3ds+ZQHzE+9t1hC021FdH1?=
 =?us-ascii?Q?vzuj0TapJQgwKMAnV0jCbOIjDivcwwkW77NhvTbISSRnqMzpbr5cD7u6647c?=
 =?us-ascii?Q?tJMYHzcXpQzioB1SCNi209Vul1pdLYkC9kgGgaFT0KFNibohARM/OxvxReXa?=
 =?us-ascii?Q?UROCKt78L+XdgMMqCh6ZGcZumVR1Ya0t+ENqz7VnLnZKxgPoxNrNaUKLR3F9?=
 =?us-ascii?Q?S6/dlhUzQvZM3FSrcy7s7vqJMQJaYmU9HqvfX+qGdInc/UvCXeipBU2MVeKv?=
 =?us-ascii?Q?5KuGacnz1Zyoq6hNpf3XdA2L7vTvWBW7Ev1I2iS5fxheJux7JwI9CkqN04ZU?=
 =?us-ascii?Q?eNyH7Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d529dd2b-0640-4b3d-2d43-08d9f8b8aa3d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:47.2794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f115asgwFh48it6s4ViEYZHrWuT73NN61leICkK4KEYYAGQeuqZ5WRwjzdAUGBExW0yuJiubYaQ10Zlo8RCCwAqEUfytQIo7PPBsId2nPbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::720
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::720;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

I'm tired of this pattern being everywhere. Let's add a helper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 1b48c5b9c9..dd33970454 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -977,6 +977,10 @@ def get_block_graph(self):
     def assert_edges_list(self, edges):
         assert sorted(edges) == sorted(self.get_block_graph())
 
+    def qmp_check(self, *args, **kwargs):
+        result = self.qmp(*args, **kwargs)
+        assert result == {'return': {}}
+
     def assert_block_path(self, root, path, expected_node, graph=None):
         """
         Check whether the node under the given path in the block graph
-- 
2.31.1


