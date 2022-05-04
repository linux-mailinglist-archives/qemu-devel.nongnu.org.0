Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491EF51A1C8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:07:16 +0200 (CEST)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmFes-0001OR-Su
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoX-0001Wy-1d
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:04 -0400
Received: from mail-am6eur05on20702.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::702]:5752
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Stefan.Pejic@Syrmia.com>)
 id 1nmCoU-0001EJ-Eq
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:04:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MbujUQrqBJNWYYWRqt8V3u08ND91in/ad2pKjMxPQw0wQLVa19QDm/9N4msxa9vUmQcv2mpLb+GYOi3ioiN6ZaQh6pQ2aBUl3ZGqjuuYj+LR4i9P/06iu4ElYvFhrwwtXIhfx+Hlaz3EJSCgNn2CPoJ6aTLaPWrKUqAnJ7P9HsHWOsdJiJKPhdGWW8blrqXUxKKKsrlGS6xFrpr5EuONy3PYEH6hLSs10GMDEJplNcpL56UmN2zBs9O7zo3QbTZnVpc1k3poN4dG439ZWBicp4yviGyDRB26a9EaC/sfPjiW2jhrC5ZNReLVmwq/UZ/6h0kW8RPuLb5H9wkBA5IJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eWEKkeWWtnDzqZYQ8GW2QUsplmJ2C3cad4vZJUg7uE=;
 b=e2549/MG6MfyQrsjLVNUrBGhsZDpgPKSXFhFdPbIXfYaQspAJtqCN9SNEGv0Sd4qWmHqQZEv+8wC+EOgrY5dSu6NUoD2ZeKg1M7bU2PDVWY4DC6+oVRlgu/034RAJTc7baOTgpEQ9QS7FOU0KRvo+QIIU0+tq1rRcU5qRYLD0V6TMiaC07BvSn7j5otqHqtzYHSQbyQrRtFNesQJ5z6PYV/QXqLAfghh8n2JMJwVQAgGai7i6gLs9ZLQgJIA8YucIbtvk/82IemdXD/5foVi0372orCb3kNAKkq/WoeNmGTY4ELIrP4+TQzW8ArHJuVETXl6VhVjX0fqlxIb8yVQgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eWEKkeWWtnDzqZYQ8GW2QUsplmJ2C3cad4vZJUg7uE=;
 b=vkFC4butsn4AnDKhfiiZihVNCATC//aJUD7/v2Ll7234+51ifBUdfV6vAVTcXZHPi0QpUBsE2pP2b29oQIpNafkJMN/Kvk68CHnssX/M0A3ISb5lO+ksLEKsugA32ALcLUgH2w3vnTUuehaWy64hwj97m52K4XqhojXb98aWGAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=syrmia.com;
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com (2603:10a6:803:11e::15)
 by DU0PR03MB8551.eurprd03.prod.outlook.com (2603:10a6:10:3e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 11:04:23 +0000
Received: from VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463]) by VE1PR03MB5501.eurprd03.prod.outlook.com
 ([fe80::f0a0:695d:75c8:b463%7]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 11:04:23 +0000
From: Stefan Pejic <stefan.pejic@syrmia.com>
To: qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>
Subject: [PATCH 2/7] target/mips: Fix emulation of nanoMips EXTRV_S.H
 instruction
Date: Wed,  4 May 2022 13:03:58 +0200
Message-Id: <20220504110403.613168-3-stefan.pejic@syrmia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1829e020-22f5-4c62-20ec-08da2dbdd85f
X-MS-TrafficTypeDiagnostic: DU0PR03MB8551:EE_
X-Microsoft-Antispam-PRVS: <DU0PR03MB8551A94CD99684C49DF7730BF8C39@DU0PR03MB8551.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g/k6q9+C2J9bbbJCR+BmVzTGhtKOFOIWFar7Y0hfrW7LbV9d3EzMX26kvwxa/KAwxo/oGDO3NvashTeKGNTxbsPh2u4CtfCsXf1YbgC40TsbTktzIV60RwX5l/uF+Gnbr2CmoUSs2f3NL1Hmr4SOwXJc1pW98jkDt/rO1PWA9O6/lWQXeriHIfq84c0QiJKhu0tSpuvwbxVGx65KMp9d6sQ3JZT5NTl2I2mv7PH2D4MjOG4MsNXi34DKiwrTeYyxxyC+vP7MytEnLsPFiaM+RcJCZBmdL5e3hCe7a/itkBECmMFZUO6Kj8Zm0OGrPsIoFoqup5KtwT6/Vw/M/2pR+dwVjhXNY+TCL8AepvMs/QrwCIoYm3i5aZtUlwPhq4A8Phfxb+yLG1hxC2AfS7g+HtTLGMkabeLD3i+/Ng9eXbvJKMvOb+ZG2qB4AE0rFnzxQHyCCkLRapfRiNP5YyiCjXLFqrTzfyOkeiU382l8/q58PQQx5WF43QgFcxozZ/NY7svpI2WDbi+nwg25A4CJ3Z8OyJzc97M/OImdssS/UEcA59vj3L5WYyzmN2y34WfhySMCt5tzeqx5WXW5O7boSwlCqaWcq3LcGtRC7/jD6ZKU1rQtRtE/Gd7nSyMd8LTP5/stf6toH8WjS2n3d6r5xDdN2Mujq6Ka+ImcAAEc1bNffL0/H3mKeF1p0Q3zznvR3XXgIYA+PY/oKP+G+0ZkhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR03MB5501.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(39840400004)(346002)(376002)(396003)(136003)(38100700002)(8936002)(36756003)(38350700002)(316002)(1076003)(83380400001)(6506007)(54906003)(6916009)(2616005)(186003)(4326008)(44832011)(107886003)(6486002)(2906002)(3450700001)(5660300002)(508600001)(8676002)(66556008)(52116002)(6666004)(66946007)(66476007)(6512007)(26005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xqQ2D6a+JfwW/odEDNA+xIEj+OGDNIUGFUqDaMvpJAQLdX48JhveWhqyo7xD?=
 =?us-ascii?Q?OX95T9RQI9my/uksTvSMt3MXgDIjaOsXpUUzzqqKyIQMMOFiauU9ejyI+n4O?=
 =?us-ascii?Q?XdIMOeFmMdvMGAdqoO2ta7YCvdec0t3QR9FF2bCX4OuQ3vtyOBzHV6XIdgAL?=
 =?us-ascii?Q?F3NCSIhq18PDTg7WcO8PYQWv4YkjRNCRdTKMoJCTYvg+CTEI73klGxyOzoJs?=
 =?us-ascii?Q?3IY0Xj3qgkZWz8y8qMBhizwN8EVW3uXBmMkSYRkP9eqxzY67bH35Bpi3weUt?=
 =?us-ascii?Q?WcDXXwPNBX2cJr7j0KWQXbRwA6Sb2LDpkYS7pqkO7mp9cgGB9cQpmt78/Idz?=
 =?us-ascii?Q?ZbeAMY1cAVEiMwJq5li1mIfiIOUlYgCosuW4494YKRyNsgagHWX8hXedQgYs?=
 =?us-ascii?Q?DvbEZnnxaL5fTXjxVCQeXVZ7eQ9bGFOvPHnEyxsG6HA9w8a/WqJi8Ss7EKlR?=
 =?us-ascii?Q?2ffcnXA0XwzwAvxAWv1fvIwqcfQnyzuawsE+PIqsBD2jeH+Z6C6BY9e7yoow?=
 =?us-ascii?Q?emuOUuw0M/zqkP1boad1/8f2w4ubQVgI0BlAIyAU212Q9IWB09o3//as92q8?=
 =?us-ascii?Q?b6D/eTx+w/wkf1xtGjTuGAwzZjB6E4OiNJt8qM714bYTSkegHtk11ArFnp1r?=
 =?us-ascii?Q?S8p4Nj/nqiWOxnUlZjofuoaxKA8g2OZJ6IXKRnwPSAb7LZ1SzDiWD3GGxdLd?=
 =?us-ascii?Q?p7vwdxv3niag7Jl2PHCyEHC0xqRLnEtjJsKKfAA4+YQOmXznhoM/8B5x7Jjx?=
 =?us-ascii?Q?w1JN6PhTDDEkR9aW42SoE3fI0RJUuIZ7MMzsOVv8/0DEfe73CMbzoevVMarw?=
 =?us-ascii?Q?p/BWM77J7UExV2x2lhFvGjNWTwX6lrUQXxYBnpWZXBdaicl7GD5b/06KJ6Df?=
 =?us-ascii?Q?TJO2AEuAApKS/OC5T+ZhOGVHIbIPURS8S7qQEUeahMRIDWu9iArfSDeJunhu?=
 =?us-ascii?Q?YCglj+FFmZ2NfVdIV7QO7DTacQHSlcWbgiW/XKSk8aENaLR4NceYSnuvWlS/?=
 =?us-ascii?Q?tkcDqwHnf1ZyhNrJ+vu3jOSq6jdwO5DlVSCwGcsjDvSlnjJDjW//NFPXslo5?=
 =?us-ascii?Q?rJ1MpxWSjQeMAbHuqWgKElmadCj0BzgNvYb2rYMOyQDdevkEifCpwHawrNB3?=
 =?us-ascii?Q?3MF06hYzhioqxEZjY2YliLJ4Su5K3dlKRQ8cfUfsdZW8pavijXliXmKQFjyQ?=
 =?us-ascii?Q?8bmSNqpBXHrPH8+UVgBnEm9u/AfviOBr3pIkQAEiAWvaWMi0S+ZaXBdznVuG?=
 =?us-ascii?Q?v7CL4SI1V+qz0Ay/mpiNsUAhEEKlbhbKNvEU+jshSBF4sDl7kW+KrTpCAU0c?=
 =?us-ascii?Q?93n+MmVLLgOEqHe78qTp4AjrgSnpGNlrHQihtt31eHbaw4RhVTCtLaqfFc0i?=
 =?us-ascii?Q?fWOmPUQpSDtPawqQg2NldxJ39hE+A15uoQnorD0nEQzTD6+oI737gGSkrZc5?=
 =?us-ascii?Q?Q7OVOch/gYpzWLLHLJp7TJFEwUDvXm7r1/cJt88Gur5ld581ft+zNEypdO6v?=
 =?us-ascii?Q?iu7SM0/Z0YfD5Ebd/P1ehFQ/Cudgm5JnLc4vL86EgiDNNehBms0UX2YlfUEK?=
 =?us-ascii?Q?VBbtURv7nG55EnlxyE7i16GlN+JHU+FF+a9rNMdgG2TC6kG1B9/gGtBYBddV?=
 =?us-ascii?Q?aQSeNvCyp/XZnQC6w5NJB25ndFOywSnLh+LZqMIrmIGH8wp2ZkmaHQRdzFKF?=
 =?us-ascii?Q?izb8NqLJto9wpyE8On9QcnfMB88hUgYHeyaEYryUqQVa2ZtlrG5poovyVB3j?=
 =?us-ascii?Q?GT2JORR6V/h9gFkfI2hbQU+A4gNzUBg=3D?=
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1829e020-22f5-4c62-20ec-08da2dbdd85f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR03MB5501.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:04:22.9778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKdZJQ45xVsXT97SjGde/djCSie+g/8J0yMSWRZzmUlCd8KfnRH/TILkjdUxO4rBoLWNpyHL0osb4bH4UzePlw==
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

From: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>

The field rs in the instruction EXTRV_S.H rt, ac, rs is specified in
nanoMips documentation as opcode[20..16]. It is, however, erroneously
considered as opcode[25..21] in the current QEMU implementation. In
function gen_pool32axf_2_nanomips_insn(), the variable v0_t corresponds
to rt/opcode[25..21], and v1_t corresponds to rs/opcode[20..16]), and
v0_t is by mistake passed to the helper gen_helper_extr_s_h().

Use v1_t rather than v0_t in the invocation of gen_helper_extr_s_h()
to fix this.

Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
---
 target/mips/tcg/nanomips_translate.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index 58ae35a156..9ee4df2135 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -2036,7 +2036,7 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
         case NM_EXTRV_S_H:
             check_dsp(ctx);
             tcg_gen_movi_tl(t0, rd >> 3);
-            gen_helper_extr_s_h(t0, t0, v0_t, cpu_env);
+            gen_helper_extr_s_h(t0, t0, v1_t, cpu_env);
             gen_store_gpr(t0, ret);
             break;
         }
-- 
2.25.1


