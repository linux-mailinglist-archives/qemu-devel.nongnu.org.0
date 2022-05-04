Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E76551A1BC
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:05:01 +0200 (CEST)
Received: from localhost ([::1]:53238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFci-0004Ie-9N
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoa-0001XM-Nt
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:06 -0400
Received: from mail-db8eur05on20708.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::708]:59233
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoZ-0001El-67
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXu9x6SB3uq5/d6v9VRI5NyQURBh+VG8+/6JsX06hON2o3d2fFQ6zA2pUOMFfJWZ03SaEVSozAGwNNGM9fpXwYgzjoNONJTLleBMvH4GrlYMoY2PKqjqqDiwO/ihOrfv2Ma3T3iqAjM7Nm2jnryVbxxOi+Uq6bkqiDNARcKx3CSU0bweW8p6Tu9brcD3AGZDKdN4dyI3eDC4Wvp0/uV3HqDe4c8u3UUXLri75hK3n9lBCaf8r+ufB0o4apftEf/by3B0ZhFmGuhv/D+3BrkuhWfYnXhw4svXs3gkQyzycbzhi6Do04dONvp/6Sd3IazM0qTGNwFgd5IVwxBHEWilag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2joZhY2ZLeNT13d+F5SnzjvlrYThQf6RX4V4Guehc4=;
 b=Kp/zpsTJ5ZeZW8A34OnbVPxAcEaY/yPq6MgtE7SZLeCdqtMP//gTaWh28L2FJCIq4L29/tawSr5muu73jNkZZRJNX4OvOMAUnGf5W16GQeKI/zaCVZmhCdon9bV2VAQWh/r9/v8pXBjCmd2+U0xQAULDIsADQYiCxUWqhpcRxmUPVxjVo43bbkfVwmjAqQAUdszmT3ytSF52x/lEAM2Zb2aXLHrHGuzaopRU4WXkePNCckkvngvJFT0Kzt2l9XM3EofqWZw85ha19NatfpzoIEhdqT3fC4Y4Dpc7irmRwpLA0a3WbuzbTxyjDSx6Ixj9qS6xdONjrp9b0i7FPYu1pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2joZhY2ZLeNT13d+F5SnzjvlrYThQf6RX4V4Guehc4=;
 b=YlX0mQujngywruH/1u3OQq1EjK67wGEqgczOp1q9mJSzFjeCIevU4qEgCO8xsRJ3jpjneIQ05OL+z12d0Hery31cSArtMDPu1AaltYtXOaSHga1pndl3arzXzf6EJOQ4dVS0TybOYtasX1sIlGrI40Ju5WgfbpNod/x7Cedz1vI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com (2603:10a6:803:11e::15)
 by DB6PR0302MB2631.eurprd03.prod.outlook.com (2603:10a6:4:b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 11:04:25 +0000
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463]) by VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463%7]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 11:04:25 +0000
From: Stefan Pejic <stefan.pejic@syrmia.com>
To: qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>
Subject: [PATCH 5/7] target/mips: Fix handling of unaligned memory access for
 nanoMips ISA
Date: Wed,  4 May 2022 13:04:01 +0200
Message-Id: <20220504110403.613168-6-stefan.pejic@syrmia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504110403.613168-1-stefan.pejic@syrmia.com>
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR06CA0132.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::25) To VE1PR03MB5501.eurprd03.prod.outlook.com
 (2603:10a6:803:11e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14f09c75-81d9-4430-57b8-08da2dbdd9e1
X-MS-TrafficTypeDiagnostic: DB6PR0302MB2631:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0302MB26311E1C7A938528FA31308BF8C39@DB6PR0302MB2631.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yi1Nc9Ue+O8/T7uxwqymyjJp8skt83PzhsJDhaGcpC9xk/RWY5cbZ9jLGNF1wAw/4kDqX3cgxerqs7wnoHKCsBDPXUiZjNXTkj2+BLkZ2ed9qCq0OfhOFXRuXmlvctkjiSAsaOulQf+uajWfOJl7Xc+C4Zftdked9sTf8v5hGSXEhL60n32E8PUmaRX2KCPJs+Tv9ovWvmFVg56NFDkEyAzCGyO4auoOPJ+TdBLcnhwOI9KkmjbM2+vDs5pibjnItvaRJWRoei/0Ygdc7VvFj+cFfYiN0tu68ZUkyeSCvhCIDiQhbzxlQCLvD4bo4wmL+4InF11j7/ATG2RxTOgFfeZR8rgfwSAU+w4egHQeD+GVfoC0t3DdHNNJ9g++hT7gvica3CBXrku7ULasly+3Qjwn4QEv0dE9I7UGeBxN9WjCWqDjtWbKQOY8kB8WvEyENa/j+wqh5P2cwVnR5RLbQgje/b/D2zUsWI01+pA+sEFo+yrRzFk6O+O3DGO81hri//tU14bfyJ35CfbbgIbhcL2k9w6XV27UTkdn3su45FsdoaMqREc62ZER+2fQPZk+5in5z0CkEsA68o6YE1EO+qwizhpF8qp6IJx3QkX8c2Rh3vdBOxWO3eBVVZRhBMm/ewFaa5Co+UQbcz1QYpVRxMgoU5aj787hu/KmaPShA43pJPCOEVgiIaC3OxYg7jPI9LAMnEA1BE4h9Yv/JEkZiw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5501.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39840400004)(346002)(396003)(376002)(136003)(366004)(52116002)(2616005)(107886003)(26005)(6506007)(83380400001)(6512007)(1076003)(3450700001)(36756003)(2906002)(44832011)(8936002)(5660300002)(6666004)(86362001)(4326008)(8676002)(6486002)(66556008)(66946007)(66476007)(186003)(54906003)(6916009)(38100700002)(38350700002)(508600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4BhnDR6nGvU5BkmANUbrDqYatWhRIKf4sow7983W/9LjYYbI0yRh3aS7muVH?=
 =?us-ascii?Q?p5xkiXwVSTa5gdcb3Rucz64imO2aZfxwfaTJXZ+nCT5M+NPv+S4xd3SP2v2Y?=
 =?us-ascii?Q?xpwiesDi6Nm7Tnl9osT1RVjj766APMAD2/twEcWbf6uDLTR/Y/VXWwYeNzZe?=
 =?us-ascii?Q?SU7p22Hixh2pHSHEg317CNeFeqQT68qzlskrNq7E0D8ir4R94Dj/gkbmWSQu?=
 =?us-ascii?Q?vr8Fe1Zi1Iub9uMFa/zVGii+vfYloOIzHylZLp9/T26nB9dznmnxCOwono/R?=
 =?us-ascii?Q?JA9KZeRxx0g2oUA1x0TQn7fbJBgu5EN+zDNzBS5E1o3EKRYePH9hzInMbqis?=
 =?us-ascii?Q?rfqJpEMotCDyxVRYf3cH2+uXoVKuh2HlR+e75XfNNYSZbg/yjkQhIvNC/9Mh?=
 =?us-ascii?Q?O1VrHnETTU+3oVn5NDTWw29sS7DZSuDmsPnzZCVogp45YuPLUJc8o67wg4yU?=
 =?us-ascii?Q?GzQh+QFG8iSNrsISD5sIS3SXpwwp0FBOWrZFrHddfqjagtCsIGEWd8gLIG64?=
 =?us-ascii?Q?eXpYKAh+xTcRXmLdZ/Fj/qq3uWgk5zLkifuM8EzrqyZV6khGeG3/HgBDIJKI?=
 =?us-ascii?Q?SqY5NdwVVtkG6RWQENsYEPXNmKwaBO9ll4bJHcepUU2lDoLpgwphsPJLnC1z?=
 =?us-ascii?Q?1/H6xqf9SnRSQ6xQc/jMttpeydbwqK4Qh96/amOakWl5QOiyuYMTKz5A72E3?=
 =?us-ascii?Q?J8NIs4eiSyg9Df/UAdVDocI9/SYsElZcsQ/4ANoJuPtp/DbYQFmzbSv8VTaN?=
 =?us-ascii?Q?1GHVF36EK89dI7cQDfNVO4f4Lt18DSDmo4jiv4LaDbP9Icy5WO8KV/+dQcDT?=
 =?us-ascii?Q?ygeTHbZdyS3ty1oFeBO10xx9fX0Ux0AbeU0BGGJ88CUz5jKp3+7eyMMSpPls?=
 =?us-ascii?Q?ZlennLOnc9H1+lMV8e76zzf203VpzluoNtobQQWdBY+7flXkSfRMxSEWo5Mv?=
 =?us-ascii?Q?01fceBRJNgYqAg1h7UQ0UrtzYJtKcoToh02HU/tKFHTYCdJowkDEd27Dqp1Z?=
 =?us-ascii?Q?DpsIHxKyy2QcV/G/2HnMG9W6X42IbyriwVfXr+XGdTLWa9DBU5i1Immgm4Ub?=
 =?us-ascii?Q?6dQA3lJEIfU0fpBXuJF+8ja6jDvOxHjMmEKxMNr29y7jnRNKWz5mn8Uu2JdP?=
 =?us-ascii?Q?sgowScIpJn61R4VttN/v/eiBLjW5XlKKnao9XFyKOAxxWW1ZAkVC3cBN8JJU?=
 =?us-ascii?Q?MZRVVDm4qcifCkZkk1GIBqn2FOfqbZ3clFgPMe5Y5DB2XYx/KnerhjJys0Sd?=
 =?us-ascii?Q?h9IKNIL5J/xR454+rOvCiQgm34/mcQMpEmSOKN1hRdUUvwYL84BzorkCc+yC?=
 =?us-ascii?Q?OlO+WGeiHhCJkt8dnivsmgd16oTkKd9cJf3GGBTJStZJRN2fLfc3wtRyQ8MC?=
 =?us-ascii?Q?8ZNNQebWUtj7wgwsUPIgqyzTx9ucUHpYSsqUHO4viItg2JqjMeQFW8OppaUx?=
 =?us-ascii?Q?jO85/QzgNIyPtrw8pxdvKJGzTEzNLPRDiAtLytql5BNnDqfpYjYVpHztlOyu?=
 =?us-ascii?Q?bXGCs/S0QgjYj7+oW8grGwKnYqmVy1Awn2sofFUVkuk1ptTvczs+44EcGG3f?=
 =?us-ascii?Q?+AgQu75Wxw4yDKS+J2csF1D7fXCwhfppHTsnsyAwTOBDjrSpFnV2BRXZrXSa?=
 =?us-ascii?Q?nJwbz2DMv1NsjYuqNEm798nIix0r0zkv4T8xJtaOKRBT33ohrNXGDN+9KbFF?=
 =?us-ascii?Q?fN9p1caNwo7JlMP0PczSvGVhDYD9rMGB62dNN434hmOCmJrFl2H3AArnxqlH?=
 =?us-ascii?Q?lKxe7yJL3OPOaD4lT0ZJ7U+SBf/SmxY=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f09c75-81d9-4430-57b8-08da2dbdd9e1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5501.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:04:25.5401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53ZPeWUGm7ToLJV28680xZlAwY2tIUZrZnhRfXExpnFXPzSHvWC3IhUXowXU6IjJ+l3wiGg9HWzIw5y7PK8R4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0302MB2631
Received-SPF: pass client-ip=2a01:111:f400:7e1a::708;
 envelope-from=Stefan.Pejic@Syrmia.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 04 May 2022 10:01:55 -0400
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
Reply-To: Stefan Pejic <stefan.pejic@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>

nanoMips ISA does not support unaligned memory access. Adjust
DisasContext's default_tcg_memop_mask to reflect this.

Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
---
 target/mips/tcg/translate.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 6de5b66650..5f460fb687 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16023,8 +16023,9 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 #else
         ctx->mem_idx = hflags_mmu_index(ctx->hflags);
 #endif
-    ctx->default_tcg_memop_mask = (ctx->insn_flags & (ISA_MIPS_R6 |
-                                  INSN_LOONGSON3A)) ? MO_UNALN : MO_ALIGN;
+    ctx->default_tcg_memop_mask = (!(ctx->insn_flags & ISA_NANOMIPS32) &&
+                                  (ctx->insn_flags & (ISA_MIPS_R6 |
+                                  INSN_LOONGSON3A))) ? MO_UNALN : MO_ALIGN;
 
     /*
      * Execute a branch and its delay slot as a single instruction.
-- 
2.25.1


