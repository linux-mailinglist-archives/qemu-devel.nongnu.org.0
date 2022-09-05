Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC5C5AD04D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:41:07 +0200 (CEST)
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9XO-0008MX-3b
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tk-0004kZ-P2
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:00:11 -0400
Received: from mail-am7eur03on2118.outbound.protection.outlook.com
 ([40.107.105.118]:56032 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1oV8tj-0002Aa-8C
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:00:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBp8/sV7o296t0QcrfYd60RjF5C1/nozaTMRKetuvfnvHmOH19YVcENh+ZlaGw5wc7NpiHyNa+cBQa41U82QrPqZF3dJtCfw5ZcB2tyy4ZMBLpiBh+a3THOMDrVruq0apyV5gf9zkLT774uSKmKjhJrowOKLt229jrsXkOjRArz7EAwtugU4R3zchqpMKK4mxx6k3FOZzaQnUpLopWxXYDCVjfEteVslz7YcqXlenY3vZTC2UetKCkAItCyTpiooLwfWrmHDim/RTpB8MevuQsKL254PyagB32UDJ9YvF6ZiaJtqAxL4Fz3rSUNWcYSJ7C1TikzhKqMOWyI5kFhecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+g3KXVwltfoPI7ttJR4qMHztYZSzMRwZHmbZkv9Kc9w=;
 b=DhEkGe4CgSAKufNf3AJbhV+mCwUPr17WJBLz3mhmOmQyV1+hRgisFIlE4vr1VcIK/lQBkY8eKuONl6njODb4Rrxw5wLZX41p0SDQCNy0HPTN5KRbtyDMchtLcfozy4Ep7g8Nd2JT2rP2LCBUil4Xo26bQirrvu5wz75wTsrdnG3lae/tYYO+SRagWp3E/MR0t6lJ3vYuEEn5PlLiSlCjd9TIoX2I0EhG3QKLGDKkbkmeR8SdljkyF/wS6lH9pLmt0laLN0rSlg40ryM1HSsVVgmgWsXMxHN+qJkplhqbP8Z175OXHskdEZD7PhykpAmbDQCx2WuOZjJ4NkyHR/d/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+g3KXVwltfoPI7ttJR4qMHztYZSzMRwZHmbZkv9Kc9w=;
 b=OQl30LxxajF1b4WL/Ju9VRa0XfonrewaEqhwjHb0W7q8kWqgcD6gPOC/UJbpgFU7YT1EPhlEMq4aEOSbBfUQYjFhhZz+jU4/iKeSWE6EHKtEko/RWDz56iIyd1fpXu6Mcez8Bz4z8F+R48jbTbr3mBZMIGp0yfxhx7x8+/1dtZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com (2603:10a6:803:112::20)
 by AS8PR03MB8740.eurprd03.prod.outlook.com (2603:10a6:20b:53b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Mon, 5 Sep
 2022 10:00:04 +0000
Received: from VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9]) by VE1PR03MB6045.eurprd03.prod.outlook.com
 ([fe80::8975:df76:4535:fda9%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 10:00:04 +0000
From: Milica Lazarevic <milica.lazarevic@syrmia.com>
To: thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 11/20] disas/nanomips: Remove #inlcude <sstream>
Date: Mon,  5 Sep 2022 11:55:13 +0200
Message-Id: <20220905095522.66941-12-milica.lazarevic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0023.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::33) To VE1PR03MB6045.eurprd03.prod.outlook.com
 (2603:10a6:803:112::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a36f1ea-bf65-4291-31b2-08da8f2567a3
X-MS-TrafficTypeDiagnostic: AS8PR03MB8740:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxJwIcmryr9NBc+H1/yD5FLEOc4TNhq/lqIvODNa28lfQS1/Tq47wTjSGEM8AfcIk8aY915u+WLgWtRfmSR5vawlsMCqiPsMbc85d0EeAyUDldVRSu0mNZphCCIyZPT0PDSHdt09lUKqxBq7EDDRI628xdbJEMqQzlwtqI0Mtx1N9dbRO9xrjEtBHB0QIGnXe7aQzm6hmA8iNIqk31zObn8CbPnVaTIA4/g1jFwwK8CEku4FfzngtodZImO4fF9z+JrS6S1EJ1TkZ/RyyOBoNZUL1wMAFvOLoGE59QMie0iDD+N+dBVaDys6D3cSzmmu7nitQIc+fd3Nd79eEIWVxFLQ/NIjM1SuxFV8jGAgeBrNajnJzbKy/fVfROfTcj/62svNop5QhPtHCfJlVtHg1x5FdBQcBjG5nACeEWy+dU7+pQhz8kkz1wcsEWO0BNGcl1Qb2GZcfpnZfWEBtsl4iGhb0Ka4XxgXh4znuiuP7AwcWlD8freLXsox2acFOdUFMKGsDG0xDW+8D+c5Qza6esF0QBG8gA3E7O8WgeoSEOhS2t3lL4jUTJzWUYHOpEo9pdtbRoUf5vihsGD7UgVbMa0aqcQX4j2mCxEoO3gFur0n+wbNmOGF3Q1dp7JDc9E4Cx/5RF5ORRpDxHs9VXoZoCLlqcaRK/C1QzVCz1VgawZeqyMIdW5+XyZ/yPGPHCR/sSng0SVa9F4MIDRsr5vFLWphyUOqdMWHyI2Gl+FiGCxteEhgI6MSfbAkbcQ4lo9L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB6045.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(136003)(376002)(366004)(396003)(39840400004)(8936002)(44832011)(5660300002)(4744005)(2906002)(38100700002)(478600001)(6486002)(41300700001)(38350700002)(52116002)(6506007)(6666004)(107886003)(316002)(83380400001)(6916009)(66476007)(4326008)(66556008)(8676002)(66946007)(26005)(6512007)(186003)(2616005)(1076003)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tA0XpP1Kike8K7aeq0C5c9skp9KNdf7icG8SV0eGJwBwgccb+qDmAge5PKb7?=
 =?us-ascii?Q?uRa7u7UKTJdxiujbGzRxPji+F+rxcWUWa1bO6uoJH/no0WC4vilcc4+o/Jpt?=
 =?us-ascii?Q?eKMF/I+l/8q3Ck45Tzwxpkh8k7B5w6kqvC/eTVx2+8lYUqcSm7MTInbgxmK6?=
 =?us-ascii?Q?o7kavqpWMyOARPpUE3Zg6mDUTHU0hTZ+7nrmvu7qVyHleBTJvJbXyQOiTpiQ?=
 =?us-ascii?Q?5GTkIikabe/Pck63BpyxjmWr+/6LEiufI7feYmb2MaE3KRYnzvjCXBc+WRt0?=
 =?us-ascii?Q?O8+6JayeDdpjs4/yqBECTISsWon8SPybQX7v2zUM60ju/t8Br7dFW74zY/I5?=
 =?us-ascii?Q?0/sJpqUyQvjV66Jz0pKzgF/iZaMF4SXwNUcKalVERyVB9VR+O9o6tcgE1AJS?=
 =?us-ascii?Q?JeNiM0VhxdB4Xtovi3EmlGYFmmHyGwnNa7LAIlY+hYSQYnq/+8XCJ9m3UM00?=
 =?us-ascii?Q?R5D7zpyS/K9UWDEO1uSNXklD2chIjH+iZK1sdRKBjUZ6iOa8VWi5hHtZ1RNx?=
 =?us-ascii?Q?EK4pnYbxnr47XNMCXNCwOhEc8mN3rq5+C+zWlJlIcNbyCCl0JXvTnzVAML/T?=
 =?us-ascii?Q?yGZYhtRuQMLiQIrSfUDMWZq97cm8Y1qQ3JF3qeKAlQiimQMer9Vm0olQRlmy?=
 =?us-ascii?Q?wx4uHcQQ6/6mZvWWIdHERu7UAZ3RffyDFTwgcDs7zYAEGJPVM8sGJjl1/nmz?=
 =?us-ascii?Q?u5vn+UacBFxwjxPIfEZ07UQ7TeVULK9YIDEthBJX0rGXfkNC+ygngxe7NSR9?=
 =?us-ascii?Q?wT0Quu8L8jypYFQDEK3HbxzljIo1s3/xQg7b6CpQCbIoJofs+r3aJEdn6hKU?=
 =?us-ascii?Q?qO8NKnxj2PXUyQ3UuOwqEpQmzCaszuQRiQWWpO2ArkSzIcKmNWkb0mZH/PGM?=
 =?us-ascii?Q?1YJaRCF6z0E4Sko05bhkJ0h77Cjg6RyesSg4J+yumWM9Cj+T6K5L7Im1+h4+?=
 =?us-ascii?Q?ySFeHX2GatpN9ZmR9/uZIeitJbbnLwB+pxddKUmuqbAH49nsetCIzVzp2sDt?=
 =?us-ascii?Q?Zr6wD2zxzVLZjGLfLLg2du8hovo825rFCSj3FMhcf1j681I9suXcma/wJ84j?=
 =?us-ascii?Q?1grbD63kJVfubH8WPwkDurYU1I8uF3P2Nd1mHqohKtIK9Qsd5XLx4AsC25SJ?=
 =?us-ascii?Q?3wkWMcanJRtt/PfigiByCHljmt2AnwcrO1IZuA5U083dRIxoWLruKtCUIY2/?=
 =?us-ascii?Q?36oKbI36zYHFpWSQGcWpT8d5YoSjtFcGaynzPKSKzoiKhCM5N6KeLlx527N7?=
 =?us-ascii?Q?pwg9mQ/73JJ4CM0Do/RcBfhYLaoh4gBga6wJe6qOhWLar7bawQRhtOgvs9bX?=
 =?us-ascii?Q?a0YsBw/1ZakMIL4MJybCzAuZZ2BEFFrtEJ0o9zuxDxIZN3XtloS2B3dXzk2p?=
 =?us-ascii?Q?K9M+JKHOU9mZbmaga5mEE70Lt37jNeUv+1a1V9BGflqZxKs0NkhBs1hO/n9t?=
 =?us-ascii?Q?/9QO2QNXW4CaNDUVxfEEAZfWR4tZjJZUzF3tNg5N5iAMtNSifAJ3/cjhUgZb?=
 =?us-ascii?Q?Z+n+gizxFldVfN92044FaCM/AS2OlXM3phzZ1pMPBWLfJ4FYhPJCyzvpiAox?=
 =?us-ascii?Q?oB70tXWtgxpQ9vqYfxe1jdFXx6r83nhooERgmeMlTMj0SHzFIqO6jHw7I0k9?=
 =?us-ascii?Q?UQ=3D=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a36f1ea-bf65-4291-31b2-08da8f2567a3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB6045.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 10:00:04.3687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AOt5Jo5ygmNCfxsf4dkflN6NN5bUE837M/j+80Spr6HQi17Ut/1Ds3NQN3Q4v1gueXUhl7I1GqfTH62+0xtxeAhFws4P4R5b4vA23xDnrFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8740
Received-SPF: pass client-ip=40.107.105.118;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

<sstream> is a C++ library and it's not used by disassembler.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 disas/nanomips.cpp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index c11c0aceaf..bfbd472150 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -32,7 +32,6 @@
 
 #include <cstring>
 #include <stdexcept>
-#include <sstream>
 #include <stdio.h>
 #include <stdarg.h>
 
-- 
2.25.1


