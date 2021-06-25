Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAD53B4414
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:09:10 +0200 (CEST)
Received: from localhost ([::1]:59224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwla1-0006gb-Kk
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlSA-0000vm-LL; Fri, 25 Jun 2021 09:01:03 -0400
Received: from mail-vi1eur05on2132.outbound.protection.outlook.com
 ([40.107.21.132]:46688 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lwlRw-0006Hb-Go; Fri, 25 Jun 2021 09:00:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjBuYzwlU5ch5wT8Faz60bERUFpZvkWpFMxHn8GvnFoMUR/4rP2pa9UuQUq268pzDjcPfybMRsamFe+1lEn05KkWr8weF7ntODk+uEORs1Nmet0lyALGV8GQIFru+OHeEG6Ny+3E9HJtOq4OID/7QvLpdJHOvCv9G8PMlc9ZvPmGSI/hyADQbWrGNbBSZw73EvKN/dgzcNUwZTXEOIAIJwS5sRT7rL7Dx9TfKlhu2NnuO6GG/S0Aa21NQwpFE96hyTjF86XHjdklc1wqITyfOd673sKOcoPvbtpmGeLSxMdv3ucCACIWnd/WxBMed0rq0FdUcdGLYTins1eDTqmneQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JvVpH8t9tUG1kNkFVLiszwYg2rDuEeJBxCcZEEAOrA=;
 b=UNpNl/xej8o0KgQt4Ung0wjgKcKyH+ak+0Iq34QjtjZvgG45cnoUqeGJjUDnsX+YFZoSGb2RfLdgVv5p+EJpI+Ilbg2WYIHkZ/fGjJ3Qi6d1APUC59tl7WpC5lnxYZhes8NINAILTAmx75m6rE0YTsLMnF7bTgZAgJaxVo0XrPRgIZI+4vb2HH1t2bQ5ftxTREoyz5le7bAGImqEYychuEi3eR91FZS6FBP1DnEPuFWonZtOOFT0BrXmmsA0ToLZ8nkYLMPkY6nHH4HF6X4NMypT26r7pmwX5LaaKKCRqgrLBEduo8Akuc2DSy3383ob4IowsCfES0B1gQqhp52hgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JvVpH8t9tUG1kNkFVLiszwYg2rDuEeJBxCcZEEAOrA=;
 b=sgs80VrMbWkqVZa9R3KUS1JaJ4wgS3h2a5tEb89/sC/lL2GZ93wLkftd0yjilRBJGgUT9bvVaR4Vye+iHwHDEgGjMYrWJOlRW7CROLDVGb963QDw/Ka5wQwopBsX+iW3vP5YMqnCeR4/1ltzTelhWLqtGIlX0sh/Kbh4/KFzDAk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 13:00:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 13:00:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, pbonzini@redhat.com,
 stefanha@redhat.com, eesposit@redhat.com, peter.maydell@linaro.org
Subject: [PULL 02/10] block-copy: let ratelimit handle a speed of 0
Date: Fri, 25 Jun 2021 15:59:58 +0300
Message-Id: <20210625130006.276511-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210625130006.276511-1-vsementsov@virtuozzo.com>
References: <20210625130006.276511-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.221]
X-ClientProxiedBy: HE1PR0202CA0024.eurprd02.prod.outlook.com
 (2603:10a6:3:8c::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.221) by
 HE1PR0202CA0024.eurprd02.prod.outlook.com (2603:10a6:3:8c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 13:00:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4989172-604c-4ccc-c260-08d937d93209
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1652392F8662F0ACB8F8D360C1069@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:16;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61RYiY/WHZ9SqCQDpNcV7sG+wYbOE/NR/9L+l0WyEJXEnuwUf2KW0ygHrLs3LQGl8VjPTaRv6Zb5I3uzDY7KmU8mHp0QljY4TgX5wPucVUSjAuja72NVEiKCoonOV1iB5KokpSKXCqr/V9tLAbv8Y3VFSwoklCuw9U91W7AQldzc57GGX3tPD6/uGh0+1EJEbgz561nv9zwMAKKkST0yKMqg8pgKkkxyWP4a+KjdVn0EKHPwmRAHIs6abFPN9e970IAMBxlCE8zBr0vdyueqpqAae4prqmr2noGpI3yXqXRfsCkac7oomHaUaaE7cdp63QZbgYzka8b/hAJEiXRhQMv0rfsCai2myVGLr2ps/PpiGu1OGwZ+SmT7LWMKq9bf6e/SSN4w2HwJMuiU+pJ5wsLWecPfyjgVIV8WfmcaYUQsYPQTMHHp1jBshLWkneS073KHy9wXszi03fi5+B2NYGbi2xXypHtRM1S+G0gfIYGcUlTXwA+La+VnHqrEoIaXuUVaJupcKUF0K3450khlPAJq7FK5eWgP8ISRMAEYqnACdwtHQ5a32VLRNu56aNHC88zC2qWnrJQoyV8JTDJea9wvmpCI6cBmGywQCV5jS6E/86D60a+WFFBY9JumxkBiyobCC5VyygBijyjgsKglgazyO3GAz7kdb4P28gf6TJgK0pydjccSYtd2Gim8xOAfe6sI8c2GiNWlASUjCRx79WdoogamH4M8XF+fesllWinGlKROGmABIzp9XnrTkaWF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39830400003)(346002)(396003)(136003)(366004)(376002)(38100700002)(38350700002)(52116002)(956004)(8676002)(66556008)(2616005)(66476007)(6666004)(2906002)(316002)(8936002)(66946007)(186003)(6506007)(16526019)(26005)(4326008)(478600001)(1076003)(6916009)(6486002)(5660300002)(6512007)(83380400001)(36756003)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yRBD15UXMrVZTB0ayVPDkoj6xqpWGjKQZvxO5Qqcx0Bacqz2+Psc7R7aR4MC?=
 =?us-ascii?Q?caduIFbAGQ6Mf4/ByxCTvCa0QrDDb3AifV7d5lyyC6IL/r6Av/ixtkgwDr5j?=
 =?us-ascii?Q?yAKpZPFANEFdvaKrk8CuLBbOljBPXOl++lmCU0jLSr+diL04pRFmA8HusCRZ?=
 =?us-ascii?Q?Ry8XKKgImKboL+3Barb/tSCU0za/xxztlAnU0RD7uaGu5MZJvEDHxc357Jkp?=
 =?us-ascii?Q?eKHt232YFqALIOjfNDi4URSaA/ohEE2RG+M1RzdhQ7BXhXXR2J7Y8W/1CPAd?=
 =?us-ascii?Q?RfTCRiDC+dGbRyRiMGSmkfio3txfMKx81y8+t8ZrgL0gnKUZFDTqyJ48O3oz?=
 =?us-ascii?Q?pJmYFNWLYWCT/tu//+i9KX/h5/B3VT4tHIikgp47U+HKteCsjlSTzVFR8CrJ?=
 =?us-ascii?Q?2gkD9X1HgLQtgMtGcUuLKWPr3jL/U6TYUSt+Z2oZNk24n4m65p9gNWEBRecd?=
 =?us-ascii?Q?sEEZ+QpyYK/YR/g5x+JZcT8wznG+/na1P9OWU83z+r4RyMfJuxAWaaKcZ+IC?=
 =?us-ascii?Q?Bs3Wt5NSVKyb83R+cYBF5Ghs1gdZ2KUwwhjcVL1QRI6Pcvff2pawiivOQT+0?=
 =?us-ascii?Q?UBPGzyarz2SREFGdqURhzgi2v/L9ltze3BLoM0Kghd617WUScqs4kiL8Dun9?=
 =?us-ascii?Q?0sSphHMuRZnYqhGUX7gumX9RQCaWSArMBM+0ozRxh/ACz8+z22jqgke8vk1F?=
 =?us-ascii?Q?tCB4v9KD9HIYprAHFkq6fQWDZEH9QK1pEhfoxY8Yn2FZKxTFn5uk1lb0Fkt5?=
 =?us-ascii?Q?W7HTS/Y+H6VNUFoc4yOaYYFKTD5b0qSRdACX4BCxRsILY5fljN2lbbJe1gkA?=
 =?us-ascii?Q?5EEFrGBbzMnrs1GhRk486mFNPAG0a/cQy0E5cwLXas2kiKjsrWoa41hjHCHk?=
 =?us-ascii?Q?0OrXH7Qa33cu0sAr2zBvGkDsQ85KhOd1znJIQ2vPNJyFLrgrmTD/Rzwi4VId?=
 =?us-ascii?Q?4mIE5oxKcgm8H7/6h38yB8C955wz/FuMMfptEubWINNfE8zNriOsCibWeu/6?=
 =?us-ascii?Q?E10pD8/U2awkkCYUwWIEPcygL+0K+xUK9aYZk1Be8S20DZX9/0fdMzMERIxO?=
 =?us-ascii?Q?7b03FPNpO5vzW9n1Bc04Jkoio8f5wOfbdoiEWp/S9ncu7077Lj2a3iOQ2HA3?=
 =?us-ascii?Q?dGvqJGK5KgDutXhH8uEP2EUqqiTBHPOFqd0X9CV5zZICBtVRj+l7jHFfTJRs?=
 =?us-ascii?Q?SP5NmRO2b+4aQg/r6NC/qDgWcxIaNa6R7V/Qmr8xB2tjCKg6xS1W01YU+HuY?=
 =?us-ascii?Q?fZv+b+HXk1EW/NaG0Fr5Hy+MThRLeS5+wUI4Mk/jOwonraxYaG5+UW6W1Vy2?=
 =?us-ascii?Q?lJ56Uw1xIZNMOamdHDQidKY0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4989172-604c-4ccc-c260-08d937d93209
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 13:00:23.7722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lscCZgokhDuMSGSU7+5312JU+KWixrAu6OPDOhlXyiP41/ZieBAP300PojcxriIkOzsZlO6ozBGIovVsDFff7ZKiLxXkt5FY/J0Zn7TCbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.21.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

From: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210614081130.22134-3-eesposit@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 5808cfe657..020f9846d8 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -114,7 +114,6 @@ typedef struct BlockCopyState {
 
     SharedResource *mem;
 
-    uint64_t speed;
     RateLimit rate_limit;
 } BlockCopyState;
 
@@ -647,21 +646,19 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
             task->copy_range = false;
         }
 
-        if (s->speed) {
-            if (!call_state->ignore_ratelimit) {
-                uint64_t ns = ratelimit_calculate_delay(&s->rate_limit, 0);
-                if (ns > 0) {
-                    block_copy_task_end(task, -EAGAIN);
-                    g_free(task);
-                    qemu_co_sleep_ns_wakeable(&call_state->sleep,
-                                              QEMU_CLOCK_REALTIME, ns);
-                    continue;
-                }
+        if (!call_state->ignore_ratelimit) {
+            uint64_t ns = ratelimit_calculate_delay(&s->rate_limit, 0);
+            if (ns > 0) {
+                block_copy_task_end(task, -EAGAIN);
+                g_free(task);
+                qemu_co_sleep_ns_wakeable(&call_state->sleep,
+                                          QEMU_CLOCK_REALTIME, ns);
+                continue;
             }
-
-            ratelimit_calculate_delay(&s->rate_limit, task->bytes);
         }
 
+        ratelimit_calculate_delay(&s->rate_limit, task->bytes);
+
         trace_block_copy_process(s, task->offset);
 
         co_get_from_shres(s->mem, task->bytes);
@@ -853,10 +850,7 @@ void block_copy_set_skip_unallocated(BlockCopyState *s, bool skip)
 
 void block_copy_set_speed(BlockCopyState *s, uint64_t speed)
 {
-    s->speed = speed;
-    if (speed > 0) {
-        ratelimit_set_speed(&s->rate_limit, speed, BLOCK_COPY_SLICE_TIME);
-    }
+    ratelimit_set_speed(&s->rate_limit, speed, BLOCK_COPY_SLICE_TIME);
 
     /*
      * Note: it's good to kick all call states from here, but it should be done
-- 
2.29.2


