Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC03467ECD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 21:29:57 +0100 (CET)
Received: from localhost ([::1]:60620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFBs-0005Ra-07
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 15:29:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8s-0000w8-GQ; Fri, 03 Dec 2021 15:26:50 -0500
Received: from mail-eopbgr150132.outbound.protection.outlook.com
 ([40.107.15.132]:11453 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mtF8q-0001bp-0R; Fri, 03 Dec 2021 15:26:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pi8UyQpbnsPOG1hEVcT82H8CsrQ9wrBCL3UtlLut470t0P8KZ7OCms2VUvzrfMQ2HmNEIlrWhV2poHljJ3R7zL3eM0kCJqneHPd3129iRmWKuwWO+PtFhE3qiS5xoE5YTZRdk46AHDKZGoq2UuWjrVo/wen4/hDr9D7KhGObsfNrN5dtvAb89lM9/95DOQGjqT6tiKJDToL92pbMTA27aU/0xm2fGFLjusqZtdkY4XRHX+wbBacS643eUbBGsegFie4emxwv5uP2856NuysI9ZqwddIWkp8xluaKAz7n9h7M16dz+gUfUsxeUyyX7Ei1ymmAN1G7kNsfLFRfRTQKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVEciihopY4LWBv8udTvqAdszKG8R0KJlDSLT6UCO3U=;
 b=MpYkwFy7vrjTyIETg7fPUG2eaZOvxokTuo7aPbnVpcSX7FeB9RnTmoXcDpdTvRtYXjDu86ogtaqhhQlwXEWNiwMJfy7ToYUW6HUPogTH4OareCbzHoPAdq+oe9VCC78KxLcgZamKGH20SmSLhkFYeUh+OQ42s80SRP5EIlwufzsvg7veKdHd1TOPrsEgYhDSP9VX+PNFTJIQGWv2bEETzl9ChYYTI1Q5mjeFCXIlDnQSUGhucLTDNsdYOX6dgOW7YBI3bdcxouYRH1Za6y+AV1LkOSKcXJxiemkaVLXYPsOYVT72KkISS1Nu23pDJlFFHteLY7VaLnCh3RDxR7EG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVEciihopY4LWBv8udTvqAdszKG8R0KJlDSLT6UCO3U=;
 b=HHFa2AaVQg5xsevieBOEPR/RblemTbhZ2ItT4z25ooa/1xdMQNMNg1jZYwgHfa+/IEoJcDElVWpB2o1W0iCMAAaDn8R6BfTmPIl6UUDsKl6vQC/9M3w6HQ9TPGt3Lyi0e7lvBWLDvzPWTQVAmh8et93JswNdx1VBXZXlrcHxDpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3841.eurprd08.prod.outlook.com (2603:10a6:208:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Fri, 3 Dec
 2021 20:26:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 20:26:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@virtuozzo.com, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 05/14] tests-bdrv-drain: bdrv_replace_test driver: declare
 supports_backing
Date: Fri,  3 Dec 2021 21:25:44 +0100
Message-Id: <20211203202553.3231580-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
References: <20211203202553.3231580-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AM6PR10CA0086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16 via Frontend Transport; Fri, 3 Dec 2021 20:26:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b32a485b-b890-4691-f298-08d9b69b2a7f
X-MS-TrafficTypeDiagnostic: AM0PR08MB3841:
X-Microsoft-Antispam-PRVS: <AM0PR08MB3841598DE59AF687067D602CC16A9@AM0PR08MB3841.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8ipvKoaHfMYQsVU3QXimu9tMCqHUKPZMXgF3rSfOwuOMzEByvZNISbfGnLeicOt0neVlcqoVVBimLRvZNW2ClallTW59FimE5xUP1aPi6U1sJqExINS37oJAXb0ngK0ay/UToP/daouq8gtc3quZ5Soi7CWTcKU78kQVsiXhP7lLHO3dujLM1ADSx4qywV5mSzT9R58YxPHk27UsJqzZ2p8sw16MP70/sWnauKz5eYhgjr1kan69MtAf1YHlxRfaq7i3HljdqtsP6U7lGRoeI4lzhBnZ6BUcse8TTjroIOpX33/uBTugt/Dw2tlKbrrlh1eJOObWRh4/vnuh2xT5fJGB/DCWI6K+1E1i8psr6btJ0klEIra2skvkVVlyBksbcsJ3tVBu5Etvp4cirvBu9NnLWgwzkeQkfmUaYgWWlnJj9wHfPQBBrLsATGBDvW9eWhVTya7MWt1XePrjklxaV21dDAXuNW5Ih0WYha9NdOgWwDdYwBVAGKKg2WBoqsTa3Gl0nzlNpKLgjKPaeHTmkSAPRPNqqlYJ3r/27Wm15Adct5W8KYndOabEeav96Ihwsf8wXEd7c/fIglsG2a2YJdZAuaM1FXo7idBzwq7mPYpCtxjgtjnF1zPicmJ/zn5krQuEJln9RTRNlltxmJwz/m1KdyRJWdZSeWNOXeor3ZzpYomDGduzqv38XCZA2r4deZJEhXLftk+CxPWqTpS+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(86362001)(2906002)(2616005)(54906003)(6506007)(6916009)(1076003)(66946007)(26005)(36756003)(6666004)(66556008)(6512007)(52116002)(38100700002)(4744005)(83380400001)(38350700002)(8936002)(8676002)(5660300002)(508600001)(4326008)(6486002)(316002)(956004)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T+ilbDWhnttXG0gHjR85Lkiu9/BjDDYeF6SBfP0hq0G3fBAfxujn+hc2tgKW?=
 =?us-ascii?Q?i7TZyo/tWV9ksw7sljKChuKy8rMoW3dBkrXT3c0ti6iFGKv2qrqBTRftMqy3?=
 =?us-ascii?Q?I4c/s9u/xLbhLUhrDGwIW7ROfYkmgGz9t8fdNfXpmDpX8Z8SF+8A97CuHMs4?=
 =?us-ascii?Q?rb7NJvlvR1/cn2CZAFbhQkhYcYvxlgTzD5Lkvd3KkGkg4nLUiOOXQNoqcoNk?=
 =?us-ascii?Q?wNSai1Ly4y0vVmRXp6oqTwnI9FJtm8lTrR6myjE+5l1Oq+WNiOb8pqdcRdau?=
 =?us-ascii?Q?NjwNvUTxJ/3xn4dfdE1nMf0bWw5IqlMcUBVKqPQnh75/E0ws0U4baPrOx+kU?=
 =?us-ascii?Q?f0wEfRKf2fzv+JMV75g3tBcNiNoSJndwGWRYEqNGcNTOztIGfqR2pAVITft9?=
 =?us-ascii?Q?a8w83UyFBC6CBGRoJrIy/JQU9fhrulCO84wlFFpW/JVxiXHvh67PXrg4wEEP?=
 =?us-ascii?Q?94aKWjkkuccjDEtxO/Xi7EnVtFaP2H3SSx8ZFhmsjXkbghs4x57bbmv5iaNr?=
 =?us-ascii?Q?+pl5n+/1axA+Pj81xv75/MZt/lId9rJn5nW1iRJMsmSQXOygykc0+hMIjILt?=
 =?us-ascii?Q?uPmLlFYwEPwJiryNshdaHJ2HsKVBD2nHveaBG69LOCcZFPiqmXTQlB8KMgVl?=
 =?us-ascii?Q?IieTHX/ldgHUkrrdwVZ1NpSV5A1fH5flBT69TxQwxwOaW4eD29rbhA57Zkt2?=
 =?us-ascii?Q?DetSOlDKgm2ODeIkYao6S+Qo7+5T3V6tTim8933M6r7wbQPiIv9nUTevqAUp?=
 =?us-ascii?Q?YNaQkQz8IfVQQPRQFwXBuL2caO7tw5HjksnaCByKjsVXTom+EUyVrCo1utZB?=
 =?us-ascii?Q?QBS+77sPYZIpj5meIrs1W50FL9uohxMoR+q+NrHraDS5ev7vbFEdYsnbAWzV?=
 =?us-ascii?Q?gn2h0RC0HsvZatHMtDnYv9SRnhx352TDSyHy9MlfzrE4FFTM3AFKFOKzdMZD?=
 =?us-ascii?Q?4QcN+ikyCiml2lci/EZ9QhHFOkIjSBnc1NRaud0htNeb9NssixrvSRA0J4Bb?=
 =?us-ascii?Q?hMR2l5OjzXB1YOUZ3CWiUnyNGpQtmuH6JQfisFq9oBvGh7DgVQaCAguvT3uM?=
 =?us-ascii?Q?U9LHTe71PYBJxWq8Yjq6ZzQfR+FnH/SduOgqJE4IABMrkjbkf0pAeqwXKl04?=
 =?us-ascii?Q?j+Xin0rS4t+VnLbrv3IkP7CFFiLX5cjlWKZMRqRXOuy7zmWP/oxLyMunfmCB?=
 =?us-ascii?Q?vEwrPG8HsXsKs306Rids51K23Gli8F2HhzC/H8MhPDybwYmw4l0WkrlEtAbi?=
 =?us-ascii?Q?IA3rnB4FoBOcLujUEZLvyEYPY1MYjHMSjtyFlQwpxZl2/iurGjzUo0hXLUjQ?=
 =?us-ascii?Q?z/KGxHcntXSfWQcL+Fdndrz3QllxspaGFISq4QgQC7SWVYYp51TLo+vxNIqP?=
 =?us-ascii?Q?WK/r7uMIaanvJVvMH+8PSPuOR5r5V0XhFPM4s7wAVnF0NoAi0LCIcJUOXsLX?=
 =?us-ascii?Q?//DqprjH8iYJusN7I5d6jYa5varPJvDQiQbWXp30DvxgOTcqObvygpXhOONA?=
 =?us-ascii?Q?2eGEy3aEz2xHCFllaetsxWroIJMwLNYx3tQSx6v1DPXNXWh0lmThqiekePg/?=
 =?us-ascii?Q?dB53MvALwkHbfPbnzD9BM+TxyN0q/rVMX9uM/IjzkyD94OOXEBu5O6MNyeCa?=
 =?us-ascii?Q?OpSiQWlujk/uxNoHVEiHFp/5RoiZmYhphhPR0LUNaKvb3UhjSPfaPD+zsbs/?=
 =?us-ascii?Q?f9u7vA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32a485b-b890-4691-f298-08d9b69b2a7f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 20:26:20.3599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RimJuYDp4JIy+dW+loG6EW/q+1ibDgRT58a/LEQFhPyo4yEk9e5eGE3OR1mb9a34J2JA7MErYUW6mTCYBC5ByWkKdJD9cxbG/ChxX5NPxW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3841
Received-SPF: pass client-ip=40.107.15.132;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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

We do add COW child to the node.  In future we are going to forbid
adding COW child to the node that doesn't support backing. So, fix it
here now.

Don't worry about setting bs->backing itself: it further commit we'll
update the block-layer to automatically set/unset this field in generic
code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/unit/test-bdrv-drain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 2d3c17e566..45edbd867f 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1944,6 +1944,7 @@ static void coroutine_fn bdrv_replace_test_co_drain_end(BlockDriverState *bs)
 static BlockDriver bdrv_replace_test = {
     .format_name            = "replace_test",
     .instance_size          = sizeof(BDRVReplaceTestState),
+    .supports_backing       = true,
 
     .bdrv_close             = bdrv_replace_test_close,
     .bdrv_co_preadv         = bdrv_replace_test_co_preadv,
-- 
2.31.1


