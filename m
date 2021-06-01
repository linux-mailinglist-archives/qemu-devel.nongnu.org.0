Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8CC396E51
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 09:54:39 +0200 (CEST)
Received: from localhost ([::1]:35164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnzEU-0004IS-63
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 03:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCg-0001Zr-Q8; Tue, 01 Jun 2021 03:52:46 -0400
Received: from mail-eopbgr140102.outbound.protection.outlook.com
 ([40.107.14.102]:37351 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lnzCb-0005zI-Mz; Tue, 01 Jun 2021 03:52:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H82QuKsqldF86Lov5S/wIXwHp59wb8kznIXCMJPnziIuxC2uHJ0b1k3xe8//2m3EO4yc0YJ7RAhTUq8p5/XrnDaycAXf0P2SkP+QaiQa5NRaiapM5CFzzeTV3qGLFEADzjMM9aQeZsm8Plfo5nM8mrkNp+a93dIDULjq4QA/N33oi1Qh2A8vWiioipciLngLYIe6k1TlX9C9/hN0E0hKCbIzcLiCugRl15bSJTigoZNiMK49qqpZ1s/73Eqertga3iNrj0wF5O1Kca79DQwcZNOBQNg5+uknBSC5ttE72HKd8wEsIJVbgyOs3ayRzYdsB+4PIu4iqFMPQ1WIgeapPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a195fif5d/Qp7zE3GUopT9eeVo1R/IbEJqdjDUE0/98=;
 b=l+Gh8iu2+EncArjVszKBNCeyCTFQrl6L/z9QdYmHhGOaoXmXyG5uYXIQx9giqw/2ZhKKS3hkczN3Dtgi/nsdHE7h3Z5roeTZZyk/C/dBnNxDqu1myzdpC2Rqij2k92UMIJ6b/tcyuJv9UIoGFpOtFV+hVw3PNrqZsdlAqyLROVpMO4K5uBDeI1mODc5sNPNQ/Jl7AQDiuhbxtp03GRiMs3W+1YP/8ZLFqQiVp282xLNn4I4iXuX6i32girTnNZdl8Sb6B6O7G+KAmZF0Cx/+LnY4oSZ7MnI3umHP+LrZBQXUbO/nBHvmCGg1DMT+D+wzsMknL4vXBct8qpucr/Gtxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a195fif5d/Qp7zE3GUopT9eeVo1R/IbEJqdjDUE0/98=;
 b=Slf61Fil+E2rc0sUxctAJzY/ucTAHCgEx7yPeEY9k5dkgybQBqKO0cKKmSS/iMv52hqvhMeOFhYLfHnpDcMP99+9jg4812O2cGvmTqH832EEWPzBEpAbltxgWksXHYrg8/WEwXcpkNuRIRZQYcCgfUq4RKUShGeC82LIR2LiVM4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4952.eurprd08.prod.outlook.com (2603:10a6:20b:e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Tue, 1 Jun
 2021 07:52:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 07:52:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, Alberto Garcia <berto@igalia.com>
Subject: [PATCH v3 3/6] block: improve bdrv_child_get_parent_desc()
Date: Tue,  1 Jun 2021 10:52:15 +0300
Message-Id: <20210601075218.79249-4-vsementsov@virtuozzo.com>
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
 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 07:52:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac267242-65d0-424b-68ad-08d924d2399a
X-MS-TrafficTypeDiagnostic: AM6PR08MB4952:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4952FCC890F5ACAA5E99C711C13E9@AM6PR08MB4952.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RyvOSllRM7fz3+d/Rz6n6oN5zEeQ1K8XUr3et5a+LcVqdtFfM9NBEO0LQO4oMY0HG7BpG1uCBRrgeSIeHFSaTDR6HNwCEXTGVaRIsADfgqpZOrf9OgzohY/SnR3m7eitERc7GpDcYqfgPHqOd69+cT0pdI18jJP08+fSHHw0tB7NOSvhJTGTk6mFoNW5jYQLVtoZfUsWAaT8PeLmITV+Daz0Qw7w1NSnLSg+Zth5nZkxYwMA1pYkV4To2ok6HuamINXCu3+JlK9MvyhYu4cKOcnji65BN6NckDaFlmn5pDdZxN8CDt3jKJZ3C0RV1Ih9994T9GYvy73SpE5gYC16J+N9FWRn2iL+FKe2BUFkt/fuEAV+WJHSeysNMOhzRCZda4f7cubR79+g+ljwG8BD8nJqyi9909wIF7M9WrqejR+ghrKJ6gYlD9NLTs0lAoakQ4Y/UMHEzOPYgSRRbiTgVx3h2y1wO/MLGnD+OhRKWpd5KGwp6eOr318ymQ/+BUrPlzPRTi8G553IDacU8DEf8IcENWzTZ0p3fM+CCSYX6yRCCiVxxVYNwnGhOrmlX1zvpHBLLNRFpYfVq93iQvCmiwQlh6hU2ktYpSVdUi1ezgsTNwoyiriOr7T4lYiJ8lCnOMYmZRlImvKjBmb7DhhKW1WfwbL/mco4ZpzbzU64pkG7PXpIh8prEaieS2cQ2d3+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39840400004)(396003)(136003)(376002)(16526019)(6666004)(186003)(66476007)(36756003)(66556008)(956004)(8936002)(6512007)(2616005)(6506007)(2906002)(8676002)(66946007)(5660300002)(38350700002)(38100700002)(6486002)(83380400001)(1076003)(26005)(316002)(86362001)(52116002)(6916009)(4326008)(478600001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?irc1RXEtnDmncZ4/dpAm4QRrNYkQZ73idmzoUO0IaT15Hn1EMrc3ilaNbv08?=
 =?us-ascii?Q?gBYG3uF0yZQ1cLyFiZePL4N4Q7aSY0cmWWfPWGZTFZDRTBpJj+6+gAvGWz2h?=
 =?us-ascii?Q?BSsxLo8QeePQHACSiYBnmVxi1mZW2USRgmtHqmDNCR+jsMeZWargnpmB7Xnp?=
 =?us-ascii?Q?xr2eeZkAHwmDBWS3i6F5ewMqJP2Z8sb8+8eWKBxfVWosRz9A9QeZT5pSGYZs?=
 =?us-ascii?Q?svuEfk08el2LljmCIhQOn83cAc/UO7BeM5imasRnT9B3vzAIVuz52gZ4F0W9?=
 =?us-ascii?Q?b6oT15+dh2ywEe08HjxsBLtMXOODtpJy2oQedqcN9/1kZvyI341IrHyOlrIC?=
 =?us-ascii?Q?2Bv51uV8KB/8ChdUMH2ZmT4NFa6WRy5n1cHr4m7CGpU6JDM7wshwqXHon0y3?=
 =?us-ascii?Q?an3sAd6pNb3HwRU89ngBukh0JthvBm3vd7bzSiPq7KS/JFN60hhu02Kb6YnU?=
 =?us-ascii?Q?oCNh5xrIJbX23BW9ZykO4WwZPf2tXjl/Wx13DGXWUU2As7534PLlO+zIpFoS?=
 =?us-ascii?Q?WxR7zhYTayHTFwmQxImEeWH3HigSiKjMfDfCac66UKveEgSuiAjH5ihcFJ1L?=
 =?us-ascii?Q?/Mb19OiRGnr07mhIKiu3WzGdww6EPdsPEsj4KOykt1FJJ1qyBSyBI3Kbx8Hc?=
 =?us-ascii?Q?U4B3JNEYpxmq3uRuGQWUt+XF61Rh6BAF0gXp9vqhuJXOj1+mg4ZEwBAukipV?=
 =?us-ascii?Q?GNlWCF1Xi3a+ozA4C63gidePmLWF2pOdLN7bnf8TWhF11O+bo6JfMfWpZpnb?=
 =?us-ascii?Q?WKFnXHkEpK3SLx20BL/aM5wHXtttFoAas6WvCR/khYFwtgXaj8a4vRAWrAZ4?=
 =?us-ascii?Q?p8Kito3G0AHr6Onj8KiZ0NrtEEsOdw3N0uLKcUADw4/8FMz2VCA9s3zNet7M?=
 =?us-ascii?Q?Iz36HJ5dsfC7Atej9z8yqTcGR8CDDJYbsISZkMxJ6cYlHcZKOB6FPr7xOPUA?=
 =?us-ascii?Q?ktHHPusn/PRPEnZ+agOeQ70DWgJ+oh3ArXqSBe7mic9JsYr7+/phIMEhn9fs?=
 =?us-ascii?Q?QbX2wo2JpyYcoY5JAebkdvRAHVrLaTf7Ztahajx1Zuvm7fjDIpfeAaL9PA8r?=
 =?us-ascii?Q?fm+FoBcNYwFFzDlDlK8MCHCk8/Tm7LApOGEHnxP7lR0EPlywX2Rt3Z3D8xRY?=
 =?us-ascii?Q?dm5Z5NjcBqJktqYYJS4gRHJBTX2nPJmhEKfCXu+6qbp2J+4+2YZJMeHIeqNQ?=
 =?us-ascii?Q?dJfzDEuCelIVAWXSwz5zj9MzuWeRDMH0z3YEASjLOEhouu1WftFmR92oMalr?=
 =?us-ascii?Q?RjOelHdCPhMn43QbKJoJyuwMMcwM6OoDJQpKqE6k2T/KBrqITk1K/sz60m+J?=
 =?us-ascii?Q?mQdJDZUn+5dErNxamHvxn0Ob?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac267242-65d0-424b-68ad-08d924d2399a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 07:52:37.9212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: up7Hfh1cR3PcWm2aHjEWnezUILVNUVvDDY4tUbZJwjEbOhxMRAqOgXGPryrr8z7AxOMdGRDXQkS+SekpRgV0t1nI4SDrTs/2XaxZZZcbrfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4952
Received-SPF: pass client-ip=40.107.14.102;
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

We have different types of parents: block nodes, block backends and
jobs. So, it makes sense to specify type together with name.

Next, this handler us used to compose an error message about permission
conflict. And permission conflict occurs in a specific place of block
graph. We shouldn't report name of parent device (as it refers another
place in block graph), but exactly and only the name of the node. So,
use bdrv_get_node_name() directly.

iotest 283 output is updated.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block.c                    | 2 +-
 tests/qemu-iotests/283.out | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index c0fd363605..94cb7b6637 100644
--- a/block.c
+++ b/block.c
@@ -1149,7 +1149,7 @@ int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough)
 static char *bdrv_child_get_parent_desc(BdrvChild *c)
 {
     BlockDriverState *parent = c->opaque;
-    return g_strdup(bdrv_get_device_or_node_name(parent));
+    return g_strdup_printf("node '%s'", bdrv_get_node_name(parent));
 }
 
 static void bdrv_child_cb_drained_begin(BdrvChild *child)
diff --git a/tests/qemu-iotests/283.out b/tests/qemu-iotests/283.out
index 97e62a4c94..c9397bfc44 100644
--- a/tests/qemu-iotests/283.out
+++ b/tests/qemu-iotests/283.out
@@ -5,7 +5,7 @@
 {"execute": "blockdev-add", "arguments": {"driver": "blkdebug", "image": "base", "node-name": "other", "take-child-perms": ["write"]}}
 {"return": {}}
 {"execute": "blockdev-backup", "arguments": {"device": "source", "sync": "full", "target": "target"}}
-{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by source as 'image', which does not allow 'write' on base"}}
+{"error": {"class": "GenericError", "desc": "Cannot append backup-top filter: Conflicts with use by node 'source' as 'image', which does not allow 'write' on base"}}
 
 === backup-top should be gone after job-finalize ===
 
-- 
2.29.2


