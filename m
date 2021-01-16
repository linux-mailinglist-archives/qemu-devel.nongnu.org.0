Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB912F8FAE
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:21:56 +0100 (CET)
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0txD-00044w-Du
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVU-0004x2-NN; Sat, 16 Jan 2021 16:53:16 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:35449 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVP-0000ae-Mv; Sat, 16 Jan 2021 16:53:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuK+UE58GI45Z0ZNJJhQG391sT/DP2PbviSVPf24Vew2dcjR7TOTheO9HLONlC9gwwLAC8Xyq+jbNX0fwvkaFrNif6djZrFxLQ48ym8NofaLVGmb4+X/ieHzXz0qnDzf7E8wAwJwVmH+hxl9ORk4r9EOnI3V7HbcvBMuq9ipqxv/RYxSYw87KdKgEmx8aZsIty5Pgv/5e6g5/W6DTA0pE3mOXrdOQ/BwUrQjtjEXWt2mf/7mVy7xVIxCgIE9O8Vaf2Mb7HZA/gB+FKYVqRlB1xCLmP8QgfrvRJQBLSIcNuMnHwIiT626mQrpjYUOppqWES4vlYxALQchCl4+XFRj+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lt+3wuX2e86j2Pnvr5qrDfn07c0EWNcNHtEUNru6QU=;
 b=A1whagXBWqQ/eQoIet/tqOwFagBjGqXVLJoEZ3Qg7Xx5IMUsGOw2S5F2g1RtK/An5H8pKVstqhfBs7vj0cHim3Gf1vRfLVD6Dk17RLANu7ZK4j5VWnzb7ps/k6+pz9SIJ/4xvBvMxAySBO2Qen9/F1Iabf+VSga9TV7DEA90rbXiWrG+xbVeFUnnauiDSWFjFJpzC6i9iAtSnb3k7IMCNrZUqbkY+j4Hv6fmZj6bMOOMx1VdxjjIp3LDWJA8Z20P11qULkGaNhb2K6pD4besg6WjZ0Y9Y/QuprACg4A9fL0C5ErdhKSv4GNw3IaPSA+pjfW+xKEU9zBVfFA8jUQWcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lt+3wuX2e86j2Pnvr5qrDfn07c0EWNcNHtEUNru6QU=;
 b=bTlhvPuuS79wvWt6USZeeTA4ZgW2UzF/DDwlzV2DU1BgQww2ExQsJZxF3jEUmE3W8jrV8m7w4ujtLHGj5uGHKFNKpDjVVP65EGWbsnvmxjG6smecqtLC3DLAZ8v6pn1gDJyXOx0oBzEDRHs0ev4ewzc4isdv15Bk1m8qij4a6Cg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:53:01 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:53:01 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 14/14] block/qcow2: refactor qcow2_update_options_prepare
 error paths
Date: Sun, 17 Jan 2021 00:52:09 +0300
Message-Id: <20210116215209.823266-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:53:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27fbd997-9f82-4c83-e6be-08d8ba6917fe
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542FA9F51799B0C8BEA17C5C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:92;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mz+4mZEFNHvsAbbtqXJ/8608tq8IVfQi1Mqocqc57UHjkA7AUmgpiaISCaR7Y+wR0BFn5aSLQjwWAAaKJ8rHjAxdB8aIR6SZPDibSnl32wRGjJujpzztr1/r3g3aBsI6cTf6gFwRh5P/kljgxB5OoC646fhDaxH9/T3k5uhRaRBrIFaA8UPaQJnBthQhhRopA4Oxhu2YHo5ZYwR/wtsKPS0EsZmoGIdgqnE1wYRRZiBJSHxjL+TGxgz6reQh5I9U0bDGU7o812IoIahwLNAMKR6CcXmTMF4JNQwlMG8wALCH678RdeUImfdYOoZpSYd5pzk0/czZAmVse7gd4vlKkAU4ayETzFr+L1NqAK9tz4FBqQFmvcz1ZUIbs7rj/YlKBLCojjRv5V6gShyfBpMAnYJuoBaNLxtgN1jcwkwWaBqGx3kLleDwIyoB+z1gN8I0e7NjB2wR5qwwP+Qoh0kdwMzocgMgVkod48HsyS+lUWdfcIM9Wp5OCtemZGsfns3Ty1xYacXwwgqEVE9DRtNIGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?n3rTw1vGeANE8DTy1nwRV0b3UyT2VdnPFnHPnrM0x9OYGygoip/a4+SNdygp?=
 =?us-ascii?Q?nZpvAgQLJEr1bOkmJaeWTMgjGuaioDMp49P6Gogtz5LQbMhKl2RoV1CRHQZ0?=
 =?us-ascii?Q?pwh0FhvAq2qheoCvHk8uC/H+8UU0hQH3iAOd62QzuSkswnLf6Waz3+oaV5ou?=
 =?us-ascii?Q?Mpv7x9YxR4clMv3NE207hjEWaUHhTBy6y58ZAAEsrYCRiBPnlZL/PETUpwy/?=
 =?us-ascii?Q?6zL/4H2PWpQFHm2CWiDvRiKl/MrNUDVBpKGKJBvkTnDxuv8CBpZUJKyCuwDN?=
 =?us-ascii?Q?SdFMGtB+uXufzbUbhJKWKpupa5ilE6UoT8sy2Ug4Z1wCSGwj4uc66ZUiJZ2+?=
 =?us-ascii?Q?svpHq7CoPRXEwObEsOBtmjWfImwGUU1i52UGhDuZAgII9TGVkJa5VOwh0IGF?=
 =?us-ascii?Q?WhT7gmel95DvLVkwnTSo4urfxyIz9mKWuVChO0rX/gCXBUxd379yNiYT2ZDG?=
 =?us-ascii?Q?o/Mvnza6QCifa/zRKpFBbnrrWV4yh+Q0ogyJHM8Do6wSYHNvIStxy5tQK00M?=
 =?us-ascii?Q?UJrybPENnmOqiitqYv5RghbCPfc/CEJ4fXQJLiUUdQGLg/uESBUlAHKlUK4N?=
 =?us-ascii?Q?j21azH2qR3LoIBH+vjcw7cwdpD40vQRa23TX9WNgLDcw97L+RqqiPbYK+gOy?=
 =?us-ascii?Q?L/tDCeP7elIQXim020563t0tV/oCm8IyLHTMLrGZcWXPU3ifeE7aYwuldqhk?=
 =?us-ascii?Q?iKr4zA7wxX0w3qGgMIHzCcpZG5h4OjbEl4SYHXQLbT21e8LInzhzjLCTkfES?=
 =?us-ascii?Q?ItGjEDJrzP1XeargKPhz+jCy3rtOk+fsbqqNp8NnBGikOJgdX1xKcFigx2Mc?=
 =?us-ascii?Q?IZHkZZSE85QrbwFjGohj5TN3QJKbKav4OCjMzWvSM4oYiJhTwS4e7TMuftn9?=
 =?us-ascii?Q?+j/JGBg9PzA8z/umhSTLOqr2Nct2570UqhtwslXj6/feBQ7NoWrm8D57gWbh?=
 =?us-ascii?Q?s8uQ1gWJ2xmABVp0IYu714p57kTuSw1OqzLjdvDXN6bpqRbRddip7n4nZtZM?=
 =?us-ascii?Q?PaJ0?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fbd997-9f82-4c83-e6be-08d8ba6917fe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:53:01.1372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZSKJ4/RkIGwbBXBXqIXi3lM3ibvJexbbwUMA6/ABxdxLyYM8WAcqMDh5bC/LKTQ90NR6+sgiWQe7pHpE/XJihqKGDyUoB93ClEJPtFYKCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.133;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep setting ret close to setting errp and don't merge different error
paths into one. This way it's more obvious that we don't return
error without setting errp.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 436bcf0a97..0aa6ae1e1f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1158,6 +1158,10 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
         }
         qdict_put_str(encryptopts, "format", "qcow");
         r->crypto_opts = block_crypto_open_opts_init(encryptopts, errp);
+        if (!r->crypto_opts) {
+            ret = -EINVAL;
+            goto fail;
+        }
         break;
 
     case QCOW_CRYPT_LUKS:
@@ -1170,14 +1174,15 @@ static int qcow2_update_options_prepare(BlockDriverState *bs,
         }
         qdict_put_str(encryptopts, "format", "luks");
         r->crypto_opts = block_crypto_open_opts_init(encryptopts, errp);
+        if (!r->crypto_opts) {
+            ret = -EINVAL;
+            goto fail;
+        }
         break;
 
     default:
         error_setg(errp, "Unsupported encryption method %d",
                    s->crypt_method_header);
-        break;
-    }
-    if (s->crypt_method_header != QCOW_CRYPT_NONE && !r->crypto_opts) {
         ret = -EINVAL;
         goto fail;
     }
-- 
2.29.2


