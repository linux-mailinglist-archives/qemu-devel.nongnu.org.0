Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5145C51A1BE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:05:03 +0200 (CEST)
Received: from localhost ([::1]:53488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFck-0004S2-Cc
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoe-0001YA-ED
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:10 -0400
Received: from mail-db8eur05on20708.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::708]:59233
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoa-0001El-UK
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEiTXVfhZzc8Xvo8QhGvnj3EyuL2sroUcVNqvqcdg5YVrhPN+oAzEt+fsDgHwPfs11bCPyTZjg+xh8lhVSHY8j4QAF3EJkbT6lFtbD84DJoAPRGbVezpcI1AcGurjE1s+oC6CEQpLs0rRbuVXF+Pot1LnEoB3/CxYOwPdU+SOEkfe412xVqefWrmPP/yFABniuKVWrrQR6VBHIuwR+oWuCerDux7zYfioU2qPJcYpMZwpfenzQNmG2VOqCyjs/1K/Qvwlgi8Dsr9GTX4hNMkvUMHQQJZzOa4uhcIwOXwcwhZKKpfpqv2jf7IvpLvacnDwsABoR9pwiRkWssDI8ElZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ktf/CYDPPZp1t7KMKK6DoHL3nW3Baxiiib2OyTyzXUA=;
 b=YpCPXsrmJD+S/FRkDto7lpN8tnVRLJe56aEo8R84kwiGqk6V/nAHGdRc8M0q4dc5b9MTBi5pYZ/XCK2HqJ44ZI5NSIjQQqMav0Bt54tHqLsxBaYsXFurPb/xJDGnkX/HbrQUApdbIQ8PjUT1RBZntny1uBew1r9G3B5R6hsAhvrvHvE8E8H19PS9XN1EC3nJw3EyI3W/Kpax4obINLrx1Wso/Ih9A09orop/n5gsZJzNF/OX8sz5fMedx0g3qS2BsTY8YQ7FSXA0fUIUr5SRShTRscipgs7WfXzD3eDAnncSm+oen6G5b3KsyXTOo/H0BWpBKBV4EbSroL4h8KTjqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ktf/CYDPPZp1t7KMKK6DoHL3nW3Baxiiib2OyTyzXUA=;
 b=MaQ5XOWCfzZ8oxNBUgExm+6FP/auBJUBcSL+OwKlrGvBeH9jrknCbKL2wk14dTRPGE8xoazJ5mXLzUb65/ZVKHIRA/ekcf0c8AE9Bc1LeAIttyp56tGnKWdrH2dMO+XeyuF9zBqht7/RNoGgRLeXYSrSZDzshffYIrOG8azGi4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com (2603:10a6:803:11e::15)
 by DB6PR0302MB2631.eurprd03.prod.outlook.com (2603:10a6:4:b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 11:04:26 +0000
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463]) by VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463%7]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 11:04:26 +0000
From: Stefan Pejic <stefan.pejic@syrmia.com>
To: qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Stefan Pejic <stefan.pejic@syrmia.com>
Subject: [PATCH 6/7] target/mips: Add missing default cases for some nanoMips
 pools
Date: Wed,  4 May 2022 13:04:02 +0200
Message-Id: <20220504110403.613168-7-stefan.pejic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5ddfc7ae-1ddf-4e7a-c4e6-08da2dbdda72
X-MS-TrafficTypeDiagnostic: DB6PR0302MB2631:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0302MB26314C286E9CFDC4624F4EC1F8C39@DB6PR0302MB2631.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGmVaH3+qxlPXPrXWZExCfGsJkcEKTCoKuATGmM9bATVLniRrqa/4LGXfrSBCRiI4L2/0V3W+s+D5vV65UwnKP0CpOKSLCf6S8zBr/BLnzMh3ggLMW16AoiGJ3XXaMExQikVtzVqyvVX5LkmZVgrAppAXotH91Ve2KxJUJILhmdU8ptrdSG76U8j5Z/6v4qHa4y4PkdT/ixIsv5FfXS6y0Y41Ib36aBYgMo7GO/PaP2qqLNqCXzLVpOGohv3SsJHjgEfEo5ZqUTWVG6fF5KaRGbYSeMpi748fXMy288WrBH+UZcIru/TTob3I1t7QEpAS3UUaJWDutiY0s8L2cwBC29b8fQ+MIyRbPPs7HCvSaUqBBBpzRoj96D7xAxIe/ilHcIh8alu3VQ5Ibncj3+g+8+rXPt6RG17uZgao7Hl8etxbljMjtvIuakALjkU9Tw3kyE1s0BarPIGrbEdKGv74HnD6UE5p7va84/Rghym+YvGDTJtvqEfjvWWNbS9bKnhcM8Et7A4jU57Dq0Z9hAAWQRDEoInlSkf5IvvJSt63AGglmPy6d4KBLTX8H8KBU6nfBRUoY7eHTbta/Hbdaz9i23hqcRR5aLmIdtaHL6b1F3wuFvFM/hwCsDeBdTwOmzBI+ZDieuszpRShq8u3WRQWG0hBAhnUaCvYXXLdA1G2FdBN0NPhW2UCwxQy9v39qM4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5501.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39840400004)(346002)(396003)(376002)(136003)(366004)(52116002)(2616005)(107886003)(26005)(6506007)(6512007)(1076003)(3450700001)(36756003)(2906002)(44832011)(8936002)(5660300002)(6666004)(86362001)(4326008)(8676002)(6486002)(66556008)(66946007)(66476007)(186003)(6916009)(38100700002)(38350700002)(508600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WxB4Wvs8XTPbsMjxV5vMbYyC9rZ87blTCj7kx8zHtFZ4nqm1OAo5z1Qb+aGj?=
 =?us-ascii?Q?mCwKgo/oWLX6wwJDFnbucD9duNjZ2Sxnk72LIRfx0IgEJ4SMK2o8PAWADNOE?=
 =?us-ascii?Q?ppGPGyIAV1RIK+84lx6tG89tOOBEs0YeWx0mIClXnitXJc/yz5XHK0CIuNBW?=
 =?us-ascii?Q?v9vNmO4AMbqwcDPp8330NK2nWPY9Rl3MJTMOz28amuIQ/uq6GBXXn+3xuYfd?=
 =?us-ascii?Q?vv3Dm1hRaL3NZI6Mf5jvGX0/Hr/E4lWLIkfsMJ2azzZP79VC4wF5rgw29q/C?=
 =?us-ascii?Q?gjZrpWW/0RfJ/kcjJWgvLVJUeWPXZf6RLCFUTJNDrXwKSrgfGzdHyUbVLRXF?=
 =?us-ascii?Q?W4y5MOASFzbuRskFyRbIvHkYmmzGGA+iQRnni79FYY7VGT1j9uYwZcHuY3N2?=
 =?us-ascii?Q?xLl+FXGFDKRFF/egoaY5KrbqhKxCZfZOf9XtZRO1IQYwEYAAB94wVwrWUtsP?=
 =?us-ascii?Q?rNWO+jiLfFH+Bl3URTGR/piueWTDPcui6CWADqjeM9eOHP4SGl0ae5ewqBwe?=
 =?us-ascii?Q?aNQ+5FdxnHO+h8UE4abM9WE2vqAUTH12W1BGMkqVfM3i7DJlsfQgyF9KWOXZ?=
 =?us-ascii?Q?AR0Sgot3ar5puBkqaZci5rr13nhvxo+YGvbMjvsV+E8lWdPda2WrEpZGFjHy?=
 =?us-ascii?Q?oDi9aOJETeld4cFXvV9vTfWX+Mp5CAzVmDoq3b3wn2z4HlBgcjm/XRZqbiwL?=
 =?us-ascii?Q?0G1phvm7WhL42DibeSnMlf7WqYBN+SJP/2234uR8Xlk3lCUfA/t+tw9wYbrM?=
 =?us-ascii?Q?tNFo4GAJqe77sEwFw7U9cbiCmSgyzoWvyJnDrlKQxL6s6MEcPSotGyonfb3I?=
 =?us-ascii?Q?hMjbe5GCnnLMIqB2aQLC/uf0jtalLFtR9+yFGnxRCzYdPQSkK9YcTvjOtDjk?=
 =?us-ascii?Q?6hN1SjQU5ydEmyS8q19rW3Lx1axg4P7vkhF3MyaHb7d/QhJqN6wGmmpsh23F?=
 =?us-ascii?Q?8/53rkXTeQGzC1LZzGJ9a7KqEMigU03oJIKEPHNGN048E2OPHJjg7Py8Bw4l?=
 =?us-ascii?Q?mfmY9iK/j+f9Gcvq+yeBGciVhCs8bY5vOQ9mWkhuez3Pt46MYyGSUe1+eByk?=
 =?us-ascii?Q?KuKeiwc9OmwS5Dd/oEi1oH3j8pGbQ/ssdXJqMddSVgUoBZ5+tkrwsHs+owX5?=
 =?us-ascii?Q?o/hOMCV6QwUTRZ9yoBEEC0kDqGEYGuenfu6qkN2uhnU13atZHvoZnU8zfCL4?=
 =?us-ascii?Q?WdHz0HOkq+oLpToh/rN+xTcwP+N250w0fvOzIID2PiIX5J8RvHfT0oIDxIK5?=
 =?us-ascii?Q?MTtvmAjLPZ8I2hg69la+ktN2+Ei71UoM4M2KMgHDZOa4PW5hnSWDiKSPvkFS?=
 =?us-ascii?Q?BiL/M56DcP3b1NVqX/1SQbVtTc4fUfJxlLf2WEmhFVlJlrSHj+lvYlah7m1A?=
 =?us-ascii?Q?95d8qS9OZYpc0Ux5xhUlRROhMnzLPGQehThONXRJzAWWxnt6KOgRPS39yUjG?=
 =?us-ascii?Q?or7ie7DCFS3pK4tFVjmmfZIo7CHc/dtQGqQl55B8fxVRdxXCZr07Z0F0+tjp?=
 =?us-ascii?Q?F6NycY5AOcAUb1/NkcMD8ls4xtep6lH5N4hEMCocCHw7xCcOV7zgL/n0TYWn?=
 =?us-ascii?Q?8f1s8e8195FjhXVc4sbxNuUDaSssNkD0fNZrQLB52TA4B96SetJZR8hwlcR1?=
 =?us-ascii?Q?Gak1zbRPywl8E1PNSf3xnAynAQLF6PUqI+LRW/n/az95+MLNvsA4DLN/L1rF?=
 =?us-ascii?Q?9D4N5VN/LlmdFfK0lj78m88VGrUFoT17+54r8tsUth+EgWEIG9MjW0yr2AOg?=
 =?us-ascii?Q?G8AyCV11FTA6FOSnIIJ4tg0qBx+tuxw=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ddfc7ae-1ddf-4e7a-c4e6-08da2dbdda72
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5501.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:04:26.6182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gaAoE15DKaoaWktmeY7WaMyt2oRlr2rJknAlxT5LrIeszeVJd0EkebRuMDY//+DvawWl9SGN0R6fjHRv/05hA==
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

Switch statements for the code segments that handle nanoMips
instruction pools P.LL, P.SC, P.SHIFT, P.LS.S1, P.LS.E0, PP.LSXS
do not have proper default case, resulting in not generating
reserved instruction exception for certain illegal opcodes.

Fix this by adding default cases for these switch statements that
trigger reserved instruction exception.

Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
---
 target/mips/tcg/nanomips_translate.c.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 1ee5c8c8d4..c0ba2bf1b1 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -2707,6 +2707,9 @@ static void gen_p_lsx(DisasContext *ctx, int rd, int rs, int rt)
         case NM_SDC1XS:
             tcg_gen_shli_tl(t0, t0, 3);
             break;
+        default:
+            gen_reserved_instruction(ctx);
+            goto out;
         }
     }
     gen_op_addr_add(ctx, t0, t0, t1);
@@ -2797,6 +2800,7 @@ static void gen_p_lsx(DisasContext *ctx, int rd, int rs, int rt)
         break;
     }
 
+out:
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
@@ -3944,6 +3948,9 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     gen_shift_imm(ctx, OPC_ROTR, rt, rs,
                                   extract32(ctx->opcode, 0, 5));
                     break;
+                default:
+                    gen_reserved_instruction(ctx);
+                    break;
                 }
             }
             break;
@@ -4245,6 +4252,9 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         check_xnp(ctx);
                         gen_llwp(ctx, rs, 0, rt, extract32(ctx->opcode, 3, 5));
                         break;
+                    default:
+                        gen_reserved_instruction(ctx);
+                        break;
                     }
                     break;
                 case NM_P_SC:
@@ -4257,6 +4267,9 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         gen_scwp(ctx, rs, 0, rt, extract32(ctx->opcode, 3, 5),
                                  false);
                         break;
+                    default:
+                        gen_reserved_instruction(ctx);
+                        break;
                     }
                     break;
                 case NM_CACHE:
@@ -4265,6 +4278,9 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         gen_cache_operation(ctx, rt, rs, s);
                     }
                     break;
+                default:
+                    gen_reserved_instruction(ctx);
+                    break;
                 }
                 break;
             case NM_P_LS_E0:
@@ -4371,6 +4387,9 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                         break;
                     }
                     break;
+                default:
+                    gen_reserved_instruction(ctx);
+                    break;
                 }
                 break;
             case NM_P_LS_WM:
-- 
2.25.1


