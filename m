Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4004D3BBA20
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 11:23:57 +0200 (CEST)
Received: from localhost ([::1]:56046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0KpY-0001P0-9A
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 05:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiI-0002hI-QR; Mon, 05 Jul 2021 05:16:26 -0400
Received: from mail-am6eur05on2098.outbound.protection.outlook.com
 ([40.107.22.98]:14496 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m0KiG-00087O-U8; Mon, 05 Jul 2021 05:16:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdldybjdSyylxhZ8EcD20AONtnb1jSRfLjdS8+gQl6Ub6BWX4XU/Cbv29wNJ6c14G7YS/3Km6LMgLHlwFFcmt/0vAtZ/kb0v2FycUJNBKuSjhkECeY58WQd2yw/l9Ql6VEL7tEv8WStl91YAEvI1NLo6ZpVVrD/I8LPw0kc1pvkiK09jGfCsndtEDi/YVz302sx7KgLt20hu10BrXa0UaiE47M21GmnbP98a39W+blGbWna7Khy53788eHRebOo7Om1Jdn+ZYeqENX3fgAfGusdeAGhQ5Jl5P+IXxYp8ISNW4qSGsCpz0rC6AlzrOZPsiHIsShv1bBlBOOnl92MuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzXsznZuoqk899hJaKpDnXiNLTD797gd/5g5Lqbvow0=;
 b=Z0mG868cGb7DQxa6XD3ryD+Z7/yRk+J5uhnT2ZarPd21zW1XLXhXC0/qH4bAU+xSzn1tImZmM+tHxs5JRckNCuDy9NHJaXDkhlxssQPOCmCOU20BCqHlYWyChftUAAHR1Gp/PTIRyBDsRXlqS+V+xuVVd4x4USakU684S8SOX48ngSoYNlLkYp7gX8kncPvA7ZD1N3GPDZuf2ZQN5KeYnFpinVQq7l1kVpZX5Fjz7SLWPMAnch9ED/hwXjjo8x7iEsMZDSdQ9JS3IPJCwcmdgeFTt0n8db4W1s1ER6kyD6N4HRNYPy5n1Hfyr+3XyxomDCU8AlXyhaZ7/0UHMoGh+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzXsznZuoqk899hJaKpDnXiNLTD797gd/5g5Lqbvow0=;
 b=HmikUP+JlvG1YRY5PI2fLpFRjgkcTNB+o5HDalKiDXybrW4eDagOvqURIynobu4G2s6ZuhEGLCqiWzc/HM4a9/bM0jwGEmyLrY8R8/ysVsq/vADT70WLJo9xFOI23Nk76qpticOl80TX5RLrzzEZ+DE062MqIz7+kJlInys0rvs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Mon, 5 Jul
 2021 09:16:19 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::75ce:1d52:cb60:e955%6]) with mapi id 15.20.4264.026; Mon, 5 Jul 2021
 09:16:19 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Subject: [PATCH 14/14] iotest 214: explicit compression type
Date: Mon,  5 Jul 2021 12:15:49 +0300
Message-Id: <20210705091549.178335-15-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210705091549.178335-1-vsementsov@virtuozzo.com>
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:16:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d474a258-45d9-4bf9-76a1-08d93f958ca4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4533A6CE7C1C6C6033BBA334C11C9@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8kItEGjWfTbhdp1k8vnCRHp21GQzLmfRA2FwAG4LBYFy3gKr5zjt8v+zYUJfHR8PlECbB+RM3Bu4bPLyh+vaLYkBv6VEEMPRs9DdsDxP+HIT9W3AZ7vfIljufsNtYEAoD+Ege1sMoR76Qmy6M6fMEUFxr2mlFCAuT3m92BYlrZSz53yfQYQ53mO9r9jZKR9u4hAOlVzxPqpDB2fOdLGZFPKvdRkBoTPmxvjvpboJVZ70u1Z1XuvifkYh14fFh9o2FVRsM8nkiCCfnhmrSFUZaevWIibWFAlKJ9k7VPbfyGziV5bF1tm1jULSMLZGgM2sfbikhCrYtwPFVn8YeZpFTV3I5zWnE8fcfaCSgnqirhRbVS36vLtwW2dw3SIwbvzDNBDXdFTWWuXzAS1vHZLFjJ5qvFxrH6hIzBXomz1yV4MKz2QIHFeeWExQ5j5ZV6p2dNtbTq0YmCzjZo7a01x5RU8SuXhUU5xvdAPydoVJfNvwYMmhLmxhyeLgV1mFEHD/mger78sSzs1gaaH05MLI8uiiyZOFSDz1DcH0P/i9bSG2IZI6neSnmbh15S5X3HGRuQprdzH/BQoOFh+jYkWcjdQ0E4Ap19xd377lLTUXnvmXU5nBWhoP7x1mniljRiIs3bVd2hb6elL8TBL7n6qfAx7+un+nhVTdxP5GZ4aAhTlfD9bM+B9m95Zsk547pFUVwbVyFcqg9x1swuTYLHkojUVDFmT3u3fDgmrhl5s0l4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39840400004)(376002)(396003)(52116002)(6916009)(2616005)(5660300002)(66556008)(66476007)(83380400001)(316002)(86362001)(36756003)(956004)(6486002)(478600001)(6506007)(2906002)(4744005)(66946007)(1076003)(6666004)(8936002)(4326008)(186003)(38350700002)(38100700002)(16526019)(6512007)(26005)(8676002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p282jGPf+azFqgA6IiUsTDydJ1gR0qjwCNLCj3C48r69QEITBqhBltWV5lKL?=
 =?us-ascii?Q?Q7iNyjbXH7lG2nFrbzZfnNvTpiwippq2cFzPYXxeh812UZ/jpY1770kqyv5+?=
 =?us-ascii?Q?clWnrcweGeqVufZ2dX6e4380AFge5MPGcDoq7gt7gF9HwrN5lpdq3TAw49lC?=
 =?us-ascii?Q?B907A7Ix+sdyzOv+baMAxxcyj7KgJfR94/bQc0gP6dYdOc4h1xE4eLJJ28oN?=
 =?us-ascii?Q?FAzmZCV2JD5nS7zAaG0KpVBKOP+N3GXQhQ1waN3rW4oPE5X0DmKRmp4N2oQu?=
 =?us-ascii?Q?D4WP935EN7hwdWMHUaRNfAgkTEg8e3QkXMigHeLrfdbsMgXAh/lSdmFtIkox?=
 =?us-ascii?Q?dbSC7kQTRryAXH5MR6jnQyQ2RNtPxvc0/NhFqw8whF4Me/pJBLiLHdwI3N1a?=
 =?us-ascii?Q?HpMOx3Q/U3HcPnGeTYXAaNbExT5bHXpDbb8mtl+sprniNzV9Zv2w7h0maPBs?=
 =?us-ascii?Q?C38i/pJOJzkmx9H8UCW4Gh6t4MeDrldUcRoPHQ01zOHCVWKDqAS0LLcV+raZ?=
 =?us-ascii?Q?1RQH2opj6arxyedRrvTKtDgKMZixbVQbQ2N9REaiQ7sOjxZSHyMWShBLnpt4?=
 =?us-ascii?Q?8Bb0k2F8Pyy/iNVZHD3utezKjKUdbRik5Cz66x5sMMYc1VwpEUCPlhDQC95a?=
 =?us-ascii?Q?Vqpa+y0VLOdJKW8DMdClqUxfT26AkYcspZxtXq8cMAo0onP2AiJmVs/vOKMh?=
 =?us-ascii?Q?KH8G25UqP+NjxUNjpX6qOkkQN+oGFl3eLO7MebOK3PVZC5nvsPEEMczEm+6O?=
 =?us-ascii?Q?XUcA0AZM33FLbg5ZVESKMMjtkcbT/5VzgoRYW4bYqDjhVTeecO0Id35KUTbU?=
 =?us-ascii?Q?QPA2UAwPzq+wQMQiquPHQFjHscXO946aFZSKviUHIUn/jZkIdCDaDYXqCwVw?=
 =?us-ascii?Q?+wb5PhPYocbL2Q9MxQ9hVup/OBSNecuMSSWaQSmZRMwNAAExPeUi07JB2FBs?=
 =?us-ascii?Q?CPUMZKmcprA+RFjhd+6FhDaikRDQu364yuVtzLbnLkhqCCyh9X88C3TwfnIS?=
 =?us-ascii?Q?cwMk1XKTccEAE5uDLR6zqnuAF5yvrt9agovfY1virqWJBLmBQC0p8YPXRlNC?=
 =?us-ascii?Q?JViddrSrNA+BNfUjcK1qzVKxVhW/7drCytuVlN0tugOmrmcXn560Gpks/hPF?=
 =?us-ascii?Q?gHnIe6bm7XLVLsv8MZyKpOo3ngMcPsWT6iFX7gVyP5B2n80u8eNoedvRZf1M?=
 =?us-ascii?Q?PQb9pPZqpL4Bq1kWRAsuANx1PNLB8mu6v8P4T7UxTRyGWEUrhhvRgMAFMd6w?=
 =?us-ascii?Q?uuLmCGr2fChUWkL9p44H6n0sFuXkTjJFYKktLn9Rv+qRsbZxD1RA9+JoaLkI?=
 =?us-ascii?Q?HAJgHhVoo0+w4lCzmLwUgmoJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d474a258-45d9-4bf9-76a1-08d93f958ca4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:16:19.3653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHtDU5U/7i7/miuHo6nAv2EItEEpRM3srB5SxLQ9L6EGkcQDWOlsLuxfCYERX6qo8MbOY4qDUa0AHDNe2bU+coX6oYMH5iuJJtET7zADoIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Received-SPF: pass client-ip=40.107.22.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

The test-case "Corrupted size field in compressed cluster descriptor"
heavily depends on zlib compression type. So, make it explicit. This
way test passes with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/214 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index 0889089d81..c66e246ba2 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -51,7 +51,7 @@ echo
 # The L2 entries of the two compressed clusters are located at
 # 0x800000 and 0x800008, their original values are 0x4008000000a00000
 # and 0x4008000000a00802 (5 sectors for compressed data each).
-_make_test_img 8M -o cluster_size=2M
+_make_test_img 8M -o cluster_size=2M,compression_type=zlib
 $QEMU_IO -c "write -c -P 0x11 0 2M" -c "write -c -P 0x11 2M 2M" "$TEST_IMG" \
          2>&1 | _filter_qemu_io | _filter_testdir
 
-- 
2.29.2


