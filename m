Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9653951A1CF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:07:47 +0200 (CEST)
Received: from localhost ([::1]:33626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFfO-0001q0-J8
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoZ-0001X6-PE
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:06 -0400
Received: from mail-am6eur05on20702.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::702]:5752
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoX-0001EJ-6R
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gK0Dp+WBKkN7xJrc8tLcUsxryWzKaHtpQJ5QuFtDwooxbh1pkDYSAej+kl4/ZSzmTf47id23awCkf11lfxT/By6IZfzT699FtQVrARSofDJAArDj/Vdr2UQVrmkeI8vHCAgVWnTyb/VMiovqUncMTV5f3y5sYS6Hngd5y9BSsx1e3CCtKEEkAsSCFGPiLveg9Oq+Xu5NiCwCS01p0zCWZVfaMMcN5z0S4kIxprYzuRhf+Z0rFC20POsBDqLREN25rP06yyQTW2KyKKz0pFISBt91ehmUKaz5DGynNqez8FyF/TYpbnI4tR7Iud8dGWahWJL30VhQEkFB+UC8z4glmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLcVULaT4HSJLyIyFFLZanGYxpcXYir5tcaegUgSLdE=;
 b=AJ6wZLLWjXoGOtAA+vszaOdIGzILG06xYIKHvWOq5jYL/xpUOkEAk82WPHPmRZG6IMrqzdpg8gk2Ldc082gj9RlPLGldw/oDNVE8zP3DzrjRSo6XjAbyAXkeKQ3aQunSWUJcAcJZj4dlE2Vra9kgppzWkivMwTvhfYMU7wESb9HCyCYkR6EctaUHoyQ7eFMeY04j5SaqHCNPpm0HfVpy+htflAYKrJc7yul0LMUeRC7VFq91aGZu5/SROLfEQbf580+3XjCga5eESiLWauGbMVJGI2m3wLH5AxUe+3+JiU6f49sYtSzpUKAfaMNrK0YTvcI3Rzd21O3QKUritDVtSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLcVULaT4HSJLyIyFFLZanGYxpcXYir5tcaegUgSLdE=;
 b=P//Cncw9i6w5BEa307jxzhGwJHL4TgAqHhjwC9i9I7RYsFRT+OOJT1w5Vylv2CVCMfUE0MdO+s1RGZKE3umsynPfDMb9BPJWiyPX3Y8q05LYw9vTvZbzSNN+EK/BccBoGbaQu4urdqMoZb4hjbrvAWmpkpL4NdjuMuFlnEMn91g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com (2603:10a6:803:11e::15)
 by DU0PR03MB8551.eurprd03.prod.outlook.com (2603:10a6:10:3e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 11:04:22 +0000
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463]) by VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463%7]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 11:04:22 +0000
From: Stefan Pejic <stefan.pejic@syrmia.com>
To: qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Stefan Pejic <stefan.pejic@syrmia.com>
Subject: [PATCH 1/7] target/mips: Fix emulation of nanoMips MTHLIP instruction
Date: Wed,  4 May 2022 13:03:57 +0200
Message-Id: <20220504110403.613168-2-stefan.pejic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 217bd3f3-6496-48c4-9b7d-08da2dbdd817
X-MS-TrafficTypeDiagnostic: DU0PR03MB8551:EE_
X-Microsoft-Antispam-PRVS: <DU0PR03MB855167E7886BBDFA8068D14DF8C39@DU0PR03MB8551.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3JQw2rWrUqS8Wz2g10KDbTvQ0jnl2tUmPVrTCrPBpt2jYrovhGtzr7+KKAPJ8eqTtaWzwkBJz8tqDkgU5qy3S2oHrUlgKMDGNeDpxuYlDT+iWxCs1nJ1rqrNiFyZxGLrtw4uyOl985nZkI3YPq5lxXs1UDkHuaVaRaWQVFUCeewPsH5XcSD7/DVrfTSq5WJ/VQpgJM4W7yLoyOqVpAhIqgwmd6UtQkpqdIxc5BXJOqsYIy6QYi016jgbULQR6/Tx/3pb6r2VniZC5DAL8C52S4EV31L04W/WEc0TroeKNzNobXm6+4j0TOpPmmexrCMfwbR7bqWLvLLjO4LD6kkE7hGCWejuwccJcqRq7J/nsDHMIsKO38jnBy67XhGxOkt7srImKx91b7ZKOXCTvSpxIra22N4T0HTOg7B9uYkOO9gG1wLSFT+PyfmWfIvCsRtN1KIU2CcMtY8b7YwbuBuichIt4VSTnSnG/IeJCDzdQ63v0q5HI0QXJq7eiiLrAhLJdGscXUbpq/z9mpxRP3iDdV05/lUlO4wC8fTFrXfPfBwBRcwD1T20MMQaHndFiLu1Rs+PWBhNigElfYKZ9kvrKEPsslXxU4GESgtyMBnkzFLknIQCvjItM3uDy8p5F6QxPG9nru48lR9mutpwrwDxMkFQ90WSQkuL6M9E1kolakhcmIy7QMRVi2gOvC+J5dzWkwJQeUf9t2pRqJjrqzUySw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5501.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(39840400004)(346002)(376002)(396003)(136003)(38100700002)(8936002)(36756003)(38350700002)(316002)(1076003)(83380400001)(6506007)(6916009)(2616005)(186003)(4326008)(44832011)(107886003)(6486002)(2906002)(3450700001)(5660300002)(508600001)(8676002)(66556008)(52116002)(6666004)(66946007)(66476007)(6512007)(26005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iKH7pI5Y1Kxqd7/qPc999RUMWoBaVfTuGWFa4dadhUq6H5ZM2XLCY7VaKIOE?=
 =?us-ascii?Q?JtdPecLU93oJi5D1v48YJtuHizCA2Q9/3OpPNUP88JJyfP3nuPknlT8DYOD2?=
 =?us-ascii?Q?ubdUJSnDM7f/OPedTq+KDJ+EI+G6zQbf42oNesBig0OEoaWSBCxH3UFXNzB2?=
 =?us-ascii?Q?FLY5zBgaUqYUK3HWfEXJoqMKKTQPNF6DjluWnzLEhYpiow3Gng7vS7RAZ2gp?=
 =?us-ascii?Q?BpOjZPTuvqa0BaXKcwhIl/cxS63nMkbUmLSq6jJubiSA/7Z5mT8NuPSv5MId?=
 =?us-ascii?Q?sBnoO/sslulyH+qJ+18kk615FROYqYlliEZDAtqhnsmD+BZaqN9/RwipiaDA?=
 =?us-ascii?Q?We/axyiIGiLTs8iNbEmbFQiN0VWqUFtoFBVM/B+ZV7rFfFf3H4qz7JIeWXPp?=
 =?us-ascii?Q?iyaa5uiwuwXZHOgKFTSJGkW8TNJvR2jZmmlKaq4DJyze0PEL1lT4rNdV5XhJ?=
 =?us-ascii?Q?OjUWOm2bGC/7izpu/CMf1rZhLv3LGkCD2fWA6yzMYClhlFvmJZVXTF0cqMV+?=
 =?us-ascii?Q?wDpRHGJPMf8OxUzU488FiVH2bEkQ0t8GmDYe1Z9v8KLVnDvmXvHNx/cLgi3V?=
 =?us-ascii?Q?9G5COgWzHtxf3jQxig1U/HtjkHK1FoWczBE2IqvxQMcmE4ame6bgitpUoJy3?=
 =?us-ascii?Q?/T/NrsjrxrPr8L3FZ0K22tymqGqmM8XBro3RzwAu9r+LbLT6CcYu8npZcRrn?=
 =?us-ascii?Q?12tESlNL9WwLhYCvFxzxsFL039IVFDnILvZnFO+PTXcRHOiVtzStBmulNBZh?=
 =?us-ascii?Q?JAjOv2pvyPdcOrv0GNmfk54BJQ2vK+fF0LQIOjnWeUz7w3aCSBVZUiavnSrg?=
 =?us-ascii?Q?TAX05RYYGMGBdpJIC9223VKrtBkgGFz+yIFZQBxdpW1p+CN/7fSjxjSjz1P3?=
 =?us-ascii?Q?ytBU5r0uQeldOGOliHjE9Ok93CLQen9M7w9HHaDXitu5y+OkL9L44fVFppWJ?=
 =?us-ascii?Q?2h2Qxnojaos2/lZcRMU/kvQ6zzaKT0c0uspfCeteE3WYCuRDXBwNyPBbbsEq?=
 =?us-ascii?Q?yNzdYfaNzvnYMiLr5yAOtff+HaWQkTmXEcO9vrGbvO+btSqalDYcgU625oJq?=
 =?us-ascii?Q?7d8tRNqCxzmn9x+W8PdT781am9V3Ji1j6ICBdRhxkl/4MomytNKyMR2xjCAZ?=
 =?us-ascii?Q?m9JHsC5REuzsd/fbs9sf9lBWkzvhfWKbFW56MpHOFrd4K0XaV8d5v0pq+6qG?=
 =?us-ascii?Q?KDqgvVkwYFzUqLgeS82uc6c2VGZUM9zgYEHuEfbI/VzyWZy3Tqjw9ezCdyPG?=
 =?us-ascii?Q?3X/cMOIcqGAU55fbar4wGl+RSlBF+mVT6Sfo02qjLpOPe1JDkOu40kwXuasY?=
 =?us-ascii?Q?mbmzTy0VBMd45a18w6iIb1Z3Eujq3WtmBqVWaceX+4yzX4XJTo2SY9AqkdTG?=
 =?us-ascii?Q?wYiGeLkzJwAczVyDm5QxHQavHyFFRMaMjQx57y+FonEmPrBybMz8E/LhJ9o6?=
 =?us-ascii?Q?7ifLONm6CQ7+lzxvHmlaz7FMavX20ji1hmAzL0m6iEeSS2i1V2/XLxGrlfgH?=
 =?us-ascii?Q?tm/DJR8uSsXyPC3lSj27q8ut9MIQqmPEeIFfUJAU+L0/fkSYobyrX2qiG41o?=
 =?us-ascii?Q?8LfDsmv0bt2UDV0jIbVT6npLbT9PtFKavlugJxdsiFGXDPn5c+L66cTgdpdS?=
 =?us-ascii?Q?CjhygwPx94C39ECyJUOAmWpECvAwFXunSb0ZZmVyVMyMqpmdsJqu1J/AUt6o?=
 =?us-ascii?Q?P2PRs0FWMH0YiShdKKUl6vFP5/d0sOnImXyk6t9IJg0c57iln2Xm47gCc/iT?=
 =?us-ascii?Q?+hI9OqWLwFgFy6J2KJvahDtx0Eg7iLo=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217bd3f3-6496-48c4-9b7d-08da2dbdd817
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5501.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:04:22.5091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQaTEodESK236fBJ5fB3oW4bEi6gvCOCBEcEKLMaQt8IYaBDaQ6wR5+1B32huVQW+S4HcaZ85+JkQN222ru3MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8551
Received-SPF: pass client-ip=2a01:111:f400:7e1b::702;
 envelope-from=Stefan.Pejic@Syrmia.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

The field ac in nanoMips instruction MTHLIP rs, ac is specified in
nanoMips documentation as opcode[15..14] (2 bits). However, in the
current QEMU code, the corresponding argument passed to the helper
gen_helper_mthlip() has the value of opcode[15..11] (5 bits). Right
shift the value of this argument by three bits to fix this.

Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
---
 target/mips/tcg/nanomips_translate.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 916cece4d2..58ae35a156 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -1597,7 +1597,7 @@ static void gen_pool32axf_1_nanomips_insn(DisasContext *ctx, uint32_t opc,
         check_dsp(ctx);
         switch (extract32(ctx->opcode, 12, 2)) {
         case NM_MTHLIP:
-            tcg_gen_movi_tl(t0, v2);
+            tcg_gen_movi_tl(t0, v2 >> 3);
             gen_helper_mthlip(t0, v0_t, cpu_env);
             break;
         case NM_SHILOV:
-- 
2.25.1


