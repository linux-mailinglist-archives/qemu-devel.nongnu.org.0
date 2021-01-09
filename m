Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B502EFFC3
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:18:29 +0100 (CET)
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyE8S-0005ZM-6T
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpk-0006kT-NK; Sat, 09 Jan 2021 07:59:08 -0500
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:46432 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpj-0003fN-30; Sat, 09 Jan 2021 07:59:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDCFK2L4OfD149lbXxSVgAd+hQ2iazAfv9L/r1IZ/RFfk8PnlizjAT2CEdgMwKw019TQlVrfbn957tHFk1wClPqohRlsXJyQFBFNIQVm9M2+ftaca1SFNl5HMQG0GIlmgARaijqCJEmChYAzEskUKTpvDweQnmUg7wP9lnhzQG+9QMLdLpclvkEqR86F27oSKNIaV1On2Ej91dMTOQH/+gOUXm1gMCqjcItRAA/p3uD0msxGK+ofpW5QZonAxvOSYpC7zWRrzdGAN4KX/HqZL6KdRRcOBjjpJBIFRpEoC4mNN/q426Rcu+480yz9cjhyMSfLWI4sVxLxtSkZ+/WukA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOQ1n15CcLFovwO48l7ZtnH79uFXHXo3GiY0wq61Ka0=;
 b=WJQ6CweUvv1ADK/ikCUn7WEQquwP5V3rB66oQPmKlmF/65jg5JSM8OTYX5TW6gb/IYqlT3L1jvoQU5glz937X0EMNicK4UA+qSPfpDgDHdPW2sNiO/lOVXQN0PEJk+LZHKMxw9i+fAGx+PqsqdoQ/37ag1GyMsld0jmm8LztEuBsX+sDBDwHin8jAg27gF+kX/c5BXPxKlXT5YI8N+81vJAiaId5e6aPxfu4u6FiVTRgd3ov5Nl3XvxACTByDLz7EGYIvcy/TIV3oF77GD//4jCyZfkX8Cm/TL1UvMxObEy4I4OHcqEQtELuMTW14aYcqCiaz4yYKVzh2yoDJM7UkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOQ1n15CcLFovwO48l7ZtnH79uFXHXo3GiY0wq61Ka0=;
 b=sFcTzUTkiMxuaj1yMeh1QGGDwTr1pUxFr33ILps3NSXG3IFXDNZF3qLyVLpg/jYlSBr1nxIowKAxzpvmyXuBz+XYMyKaS1Jj7gTwPFtKjq34AMy9B/T6JY59yZa6CfOmeGOZ44AH9eOLHj3lyhcE3H6zFsRpaGQs0cXgGrwlirE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 14/14] block/qcow2: refactor qcow2_update_options_prepare
 error paths
Date: Sat,  9 Jan 2021 15:58:11 +0300
Message-Id: <20210109125811.209870-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c56a4b9-b56f-4a04-ebe4-08d8b49e53bc
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24180B843358C27999D7E60BC1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:92;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6HWI+szJ3PfrErlYI2mDF9ofdR8vu/67bGQL5NeH+51fRn1eeUQ66j8P69U4Eju29yq0Zbg0YwJTjw3JoTGiD8LFnHWMlQOGRfAiJg6t6SltmM8ReH9nmRUKWdfLDcaDv0hedWu5KBqn31hWLbk6oXiXHgiQhierGg86l2P8jJbGcFpYsdusgHvSaUCSTcekT6S0rihXGZq2G5kQWmuzRD9D4P6daIee5DCt7ZVhJVcJ6kItNABgvPhqmWnPM6ZrNKyzZfznMDIlKakyqayCo09O6zNJhfM+u4t8m2HuAkcxWYStFpdIIV6jVkbHVHzG+ioGO0Nde/FnlELACBbETdtXCcaXwKpizPeINDXvGBBVSYf7oJFnZlo/u5TPypGSarf05MgVwYx6xyowdyYpKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?EXyF+7gU8dh3McFyewZKWStvHirWCyaOwCilUMDrEpWlCxW4do4cb2KXrXia?=
 =?us-ascii?Q?nYn7MzroiN1zj5Tu43BjIQeQXyPUX/0O0ROEsqZ8k4a725bh4A1qNtMO2LFx?=
 =?us-ascii?Q?OsVKsj73D39LnzQMwpRuvOYXJcgq4e8o6arWzvYHceHr8iljjNPMXcH0W6Vf?=
 =?us-ascii?Q?sBK0AEFD+NG1vzaBAXw0jG0LvqPR4pQWAWAIcdC6KTl635hySBu6bADlEQ+u?=
 =?us-ascii?Q?1qL9OC+GcDFVIrW7fChxliFkwKjmV+jmImazXubRaoKT1fQr5Ct0JJUURGY/?=
 =?us-ascii?Q?M8qYNeyQBnRifn89uPTzxwS9ow9+dpyNkr36y0wOy1L0fK9zgW5Dd3nhsTow?=
 =?us-ascii?Q?GENO4yunc9uYxA40gPys2jncWdDOyEOfGlVyUg3Sr3LFP0YCB5uCjLKxY7AW?=
 =?us-ascii?Q?C3SBCHBkSeOZDBnZdGZidmkJWG4jYJmPg8tnC8YQqt5KU6dfJexvfwys2UCe?=
 =?us-ascii?Q?+kO2nYIoe1GEBTL166bbe5/WZGOcSseucr7Gny3ATNrtQKzBNEJCY2tlYIl/?=
 =?us-ascii?Q?w+s8gr2Z/3CmwYC1nod2gtI8AyLTkARTc9Yx6+iOLs559fznxQ+hJI93DhJg?=
 =?us-ascii?Q?XbUSse98ML4Yv6m1YWKz/+Px5ZANrDNNaTt5VxroOs8hEZjO5T8Xa/qoiQ6C?=
 =?us-ascii?Q?zFMIENbmhsZY5IxXE6odSy2jj5gbz9zzNYnogXIJZ2rk/dg3TGOH9IICWI2X?=
 =?us-ascii?Q?69PcQmXt1GdxAM5lvDcpmgpe44HAl091/vQ3eivUafTkyqFTFto7jSZcRB4g?=
 =?us-ascii?Q?aOYLxHNnUYMUv3M4wExC1CR6W7KSffLG9G6C0ZrQy6rp2caFSpFhV82MAxh2?=
 =?us-ascii?Q?usy61yhzDhJKx9CyAskhjag8wSyEnlFXVAoZU80krF3tQXYgo0Sspw61CXvT?=
 =?us-ascii?Q?UNDa1EWwjEouN8sO0xJ3XwF6rMx2BDMUv2v8FOmv6w3xMoqcrCkPyjXPgCSB?=
 =?us-ascii?Q?cckklGeUSSqcTK692w8H0nJb59K323nG1RUtjkY+crGScYNApC1dWYATnCFN?=
 =?us-ascii?Q?zvxy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:57.4652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c56a4b9-b56f-4a04-ebe4-08d8b49e53bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdjSKL8GhINCfevQxq8QtSdGxKiEGqtHyeMgTA8CSruhmZBNVWP9bvvRUDouhOv9fsX7qk5T/PlbSZ85FJO9J7+ZWXCY71SfkYw7byJvLtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.22.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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


