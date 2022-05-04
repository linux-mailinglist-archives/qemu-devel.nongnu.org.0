Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F28151A1BD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:05:01 +0200 (CEST)
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFci-0004JV-9X
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoY-0001X4-W2
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:04 -0400
Received: from mail-db8eur05on20708.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::708]:59233
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoX-0001El-57
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMYTcKCG3CgH8jYCvRd2ClTnwn/r/V3gdnKu0V7EKy5brXXBLBYw9WTI6PH3ZoKgngC8spUMHuG91Qp0mYaNig9QA8Dq4oBN8Vx9Cw5BnvcUPJXitHeB72ctlDmwMK/vBZl26FxhFXmE0bIHKYjdAHQBbSBVvBNWPxdC0n/25VIl32XTnWnPYm0xSt4/Gh6ylJVOgb6sv1v+NSf0/OW9zKgDZSaQL7NqYCszmm8r3y96aYz7R+wBNCLEQprD3kj5STtD2IwDX6R3cUG9dBEy+/Zrt8HzSg5nwIJQc3YueScbZImTp+7RAlDUsglWe3dMUZuxQnslpJIedbQ+Gy403A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh4xnVvFj8U0XPjt/GXzqM3mor308dX7W1KtIlE5Jgs=;
 b=ffF7cVAlJO6Aluwbd92FxVrCjhkHzoQkbhqFkS4EqEghf4/s73nDWpzyx7mcHUrNa3NyxSge16sM7QavK/7ddCVp1WReavt1LHUddPhptR5xMGVOTjrvQRna6BvuSd8hXwVJ583Ffaiu2pzEdj7oJeNQgl+hBv4CGqaEa93/J3oSthO7A1TlfuCH4z7LYla/L1se4HXFM5oBh4u3lB7wmulrhRRs0is7tlhGbpGjJHt7lMdAY1Ug3/psb2PtD5UAvBG50iP9P/+GNmLBrPPZtvkGzEI9pAq6739CezGUKZPlSFhCZTX5ZPOl4ZT2EFjNO0RNVm1T03RzhDLkL7VhDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mh4xnVvFj8U0XPjt/GXzqM3mor308dX7W1KtIlE5Jgs=;
 b=UIciVEl9RYxqg78kgChbxvjo1At4pt5n/8YFe0Kn/hAo0zbtcjEwRHnFHQ8Z2uUm7nm98MmQNiNBuOHywE46POTeUtkTpmtLLOFeSi39FHboxTygesduJzqz2xnwtCnysUS5NjRUPYyhJgdeggApGzUiwYUXMIglGKNTfpeiUWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com (2603:10a6:803:11e::15)
 by DB6PR0302MB2631.eurprd03.prod.outlook.com (2603:10a6:4:b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 11:04:24 +0000
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463]) by VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463%7]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 11:04:24 +0000
From: Stefan Pejic <stefan.pejic@syrmia.com>
To: qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>
Subject: [PATCH 4/7] target/mips: Fix emulation of nanoMips BNEC[32]
 instruction
Date: Wed,  4 May 2022 13:04:00 +0200
Message-Id: <20220504110403.613168-5-stefan.pejic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3230f8e3-9a1b-4d5a-ea92-08da2dbdd94f
X-MS-TrafficTypeDiagnostic: DB6PR0302MB2631:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0302MB263107903FC698FF9F22C4BBF8C39@DB6PR0302MB2631.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IOUVkmOqoTOexqSUn2Ez2tlikS530Dsl8w8A7PSOE3oLdylbcix3gY/5Tc7PS9C54Necp8912sYUNtFTnurWUzpSYMTJigl+300HAaJKLOtZw01TddIRW2aX3XPPa93vJTfb3b62qH/4OOhjmC6U1Le6GbSNjwVeOxYZRO6KVfbNuuYEgfBBan1dlckoH1UF3J9ilDNoPzC6Zu//wq4xYRoMURMovhrO1PsX0oL+jyyuOY3G30PbcBR/k3FW8IDB5LptDeS02nm7Jv2ELxGcD9Mijx++qagON4EBTlt8QLDLz+pyqMAfVPVGMN8nWxnogjz6qJNlzRwbBacAcjZCWKGRoDyloJuNJMMm3ZVvPy7DSdfq3UjDr/6omfVFWodm4LW6u/m76ZZZqpFO29S4DjPgzSSzLw/WX9ONSjvtKD41/zQ/qJBBO8sAeITNpgOt/0xxMII1uI87Au+gncLDsE8OB7sUT0AyqZtqz5b7/PGFg62obMZeLeS26EWQ3ndb22lhLdIjuD7Brc7A9Cee+4OIytL8h/DIHfprE4CmmyYXsW38pIXujBBgaOhcf3wC7izdLc7WAgCdd6DjWATaN/wqxp+LuOtVxb06RlHBNjuPVPB4lt5EZNaElUFMSrsvrkGJXdLBbyyDDzMBaDAZlaMiZBhf4EBrhXFlSG6Rrp7lA/dzKRXqgc/Hg9m2vtxJjUID8C9zNs78mEdGVbXKkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5501.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39840400004)(346002)(396003)(376002)(136003)(366004)(52116002)(2616005)(107886003)(26005)(6506007)(83380400001)(6512007)(1076003)(3450700001)(36756003)(2906002)(44832011)(8936002)(5660300002)(6666004)(86362001)(4326008)(8676002)(6486002)(66556008)(66946007)(66476007)(186003)(54906003)(6916009)(38100700002)(38350700002)(508600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kMetzgHfk0C701abZKgyGVjd3hw9MxSIFX4CrDaSYePGmHCeyKc7AC3Rd1XZ?=
 =?us-ascii?Q?RZgP6mGrnV/DAlX7gg37h7PQUK+ka50Ax6Q7AChv08GB7rTP8GkJCXiAKExj?=
 =?us-ascii?Q?zoa1f7yuPqvaOa4CCFhJjpLToVveBC8E+aiwNFoPQHDBKe60oUMSeLpS+Ke1?=
 =?us-ascii?Q?AefjI/CqjsTzmDrrdfaPV7QXeiCcWzStUY1T1Yo02dvl7YPzS2qyyj//s6ig?=
 =?us-ascii?Q?rsOCaQQLgqPA2/6Lecnw5A5bHE9ydQ6zvLVCrWF7fAbgh4YD9rF26zZsmEtU?=
 =?us-ascii?Q?4FktzH/6/qMWkz0U/JY/WC0kJzKiSoHjKgVN/jl9AW4MhKG7VueSK5XP9KtF?=
 =?us-ascii?Q?9c/00qtR2Hnxr4m6DZ+xe3/1E6Btu4U4VTK8Sjfl1pJ0NmNH1cYrUyjVirfg?=
 =?us-ascii?Q?dFGMvf4Hskw2N4e1SAwg3YEHuz0sz8V0gkUrBc/Q4T4gmBqZuqy5brXKZqfC?=
 =?us-ascii?Q?6/VDkEYcmk2P6ZIYRUMMdJ+Sa0lYJ4zNLeJG/xY6NHllnzLgekzlV+48fcS4?=
 =?us-ascii?Q?KSOZvkvx3sfcdNOSbLHn6a9sZ8ZCrZ1nhZfSGSiv9O33ZRUrNMLGTHyC12JP?=
 =?us-ascii?Q?aA20a8r8IosWGzmDQXpJKjTwB3GOgd5eYEkk6k/eZEJZ7t4RlDizQGnMhtCX?=
 =?us-ascii?Q?q21oEhW7FrdJi5KrpXjlFDI189gi/2P/M0VuPGm8hxWxBE7+RgqtkL70qDtK?=
 =?us-ascii?Q?Pwb7skWFhXC7aQcBOoL1E/t7nDr/4VcPevIXpvPv/gUbpD0onRNprLFuxZEq?=
 =?us-ascii?Q?KvJgi/pXRQMHhw0niGzIwmIG2stnXKKJOdGRgb3GknSzb8u0nohOgJHa056m?=
 =?us-ascii?Q?GymaefcCv7zPjWCn9lY+LSz6us7KRLIBnBwSqTG3+Z8oDcMQWZhT2KnLFJ4a?=
 =?us-ascii?Q?7Wf+ilgf9YWu/qHHGhiCoV73ihVkOIx0Q3MaYVZRTB8R7eKXo8igbNq+SIce?=
 =?us-ascii?Q?bDtgcizzp4jygHOoiDCGPYLldngIjk9yrgGH1KtTj1uAkGZCZz7fWHs3wnR9?=
 =?us-ascii?Q?AsrK+MFjx1Nzeb0p0RpZyJ0tcYj+1RqZT3VpLGDWDm/MZPYEflvvxirHemsn?=
 =?us-ascii?Q?7YoGjIyPQmV1VEG0i5nJB+2e03158xNPUwFCKQNq3mmnAuLX/KBTiI5YLarm?=
 =?us-ascii?Q?ako2t/BtCv0EZjnV0Z8x+gkzcf03oqmNRwtWHzsJSfUYodo5kwOfSy6hLreD?=
 =?us-ascii?Q?yHPF1+ojXHabOwhr5OiPHm5t/hX3PXtNowzyuwdwu31pDEU/OKlmUrBFjWJi?=
 =?us-ascii?Q?aoaR/Wc8p/DVLUj7LArP5UBnuCSNw95xhT+j3JHUqwjNouQ7FL1cLNl0GlOD?=
 =?us-ascii?Q?vMxyvts5nlj5st7UbIxVXIjff7BFkb8yG/ehWnzTQKEPFcBzfK9S7LSsOzZ1?=
 =?us-ascii?Q?chY/Ju0eEpmHRpOqWIa3WWJE1tgAIfSYz/dLfC9ZB60R9jSCwhrzXRP8g97k?=
 =?us-ascii?Q?fUOYN4HxSliprjeqmsh1NHcltu56b+r2QMNxT6bo6lPAbSp01PA0cj/dhdOd?=
 =?us-ascii?Q?f9w7YYrdcqw+rcQS1g8epa6CYUXvo2ELxnxp2zkM5RNi7pixL1exw87KGl5e?=
 =?us-ascii?Q?0Uo5HmmayP1090KheTXpaJ7BTHWKKEcWSaktk8AYK4mynLH5Atk+NEzJ4SmB?=
 =?us-ascii?Q?w/poFCElM7zAiOIzXZUZQK6bm4mBKT5FWF2YWb/sWtdcPR82wFdssjLm6Kr9?=
 =?us-ascii?Q?Mw2RbfMoZnB7iwLlvhGPJNclwdk+O7cnJh6cDbQH7O85uohf1zqJnbwJTElA?=
 =?us-ascii?Q?a55qXDIrTugspWsQ8o32tN4u7rQNmjU=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3230f8e3-9a1b-4d5a-ea92-08da2dbdd94f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5501.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:04:24.5714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFahZ6I1pG/d/EP4KjdZLwljXlLUDuIfilqp8fEwBW4O/HuQOAtOZvyUnvHbQ0pgqbj0QQ3o0nRtgijpdU5A8g==
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

If both rs and rt are the same register, the nanoMips instruction
BNEC[32] rs, rt, address is equivalent to NOP (branch is not taken and
there is no delay slot). This commit provides such behavior. Without
this commit, this scenario results in an incorrect behavior.

Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
---
 target/mips/tcg/nanomips_translate.c.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 941cfaa6bb..1ee5c8c8d4 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -4528,7 +4528,12 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
             switch (extract32(ctx->opcode, 14, 2)) {
             case NM_BNEC:
                 check_nms(ctx);
-                gen_compute_branch_nm(ctx, OPC_BNE, 4, rs, rt, s);
+                if (rs == rt) {
+                    /* NOP */
+                    ctx->hflags |= MIPS_HFLAG_FBNSLOT;
+                } else {
+                    gen_compute_branch_nm(ctx, OPC_BNE, 4, rs, rt, s);
+                }
                 break;
             case NM_BLTC:
                 if (rs != 0 && rt != 0 && rs == rt) {
-- 
2.25.1


