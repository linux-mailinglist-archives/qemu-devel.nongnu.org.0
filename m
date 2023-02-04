Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2266568A82E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 05:30:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOAAT-0003Tb-MP; Fri, 03 Feb 2023 23:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1pOAAS-0003TQ-3V
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:28:48 -0500
Received: from mail-sgaapc01olkn2084.outbound.protection.outlook.com
 ([40.92.53.84] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1pOAAQ-0006W2-AC
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:28:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6UkB8uKOnU8mR0eZ7ym0Y2Uw2TPERVL1GegsJkum7hUSrGUzok84UZ7iJnavo6fopeM7p3Wq7DqljJMA5DXTowWsUsDuatLIST1VUlGNlbxHV1i5VAE0c53NJiWM30aaHDsQosaeONYtEIcIDkJiPAYEEhu5w+ZjefWveGNnVX5yG4RpgK+UNgMFaaJgiDNzk04OWw11pETemGwaBMs+rOgfa0whlbjP2p5+fnyB7jC2MhstnUduy4DTxtuRGKbXxjlduHYo0I2aMwLZ88WNpZtRKhsMccpK9ZdnSUFWfgK11yZpHww7D8h20q4SsxS1EyPgZzn24j2UegpP6FU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Os2U5XnRCVIhbuQ+D23ClLqQ9yHaAltnUbxlwLW6KUU=;
 b=Uw2Y6VvA/bv/Lg5FOXlKMeebBgXDUD3tOqeg/6B9QS72WcxxybAAsC400D3nqsYFhWyxgHkjGpP9Y3+fOBEz5lKLyw12XWwf02r3SOTMyrcWSRTyK74py4gvuANunnawuMxzCtg72CidAM2xeqdr9Z7PHpCbC5hIYGmJ55c0ZbM1+yVHSMYQeewkyDy9OQUyr7R5CC+rMIZCDkYbuKW6TYF0VzUIINDjO1GP7POU0p6YQNBiwSUP2kxm0PbLBq1MKtXoiWSfhd69DViIfMnMKygjyKVRCf1Qxr8ydcSslKNhz/OMkAXL7EtRUVrdKUKWLuch7qSZX3aCavy12o35Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by TYZPR01MB3839.apcprd01.prod.exchangelabs.com
 (2603:1096:405:7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Sat, 4 Feb
 2023 04:23:37 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::56db:1c2:8886:e624]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com ([fe80::56db:1c2:8886:e624%8])
 with mapi id 15.20.6043.036; Sat, 4 Feb 2023 04:23:37 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 TaiseiIto <taisei1212@outlook.jp>
Subject: [PATCH v2] [PING^2] target/i386/gdbstub: Fix a bug about order of FPU
 stack in 'g' packets.
Date: Sat,  4 Feb 2023 13:23:10 +0900
Message-ID: <TY0PR0101MB4285C35D5788FA10558D06D0A4D49@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <TY0PR0101MB4285AD60FE3976F1AD5C6D02A4F89@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB4285AD60FE3976F1AD5C6D02A4F89@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [hESlrfAqFdSHuL0NNS6qNAaeaYWE2LtU]
X-ClientProxiedBy: TYWPR01CA0023.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::10) To TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11)
X-Microsoft-Original-Message-ID: <20230204042310.22587-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR0101MB4285:EE_|TYZPR01MB3839:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fbc213-b2c3-4f7a-e6e1-08db06679509
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ImuxSNU04civgNXW5wEJLkMFwU3U2TqZ2vWnw1u86s8BCLj0mW8POO0paX/7ODqWn1Ro0vpkq8BlRmMh8Ro/mKo53/aRE6ujc6+awLn6Pb27ZAbO2Zspkrq17CDabyiSnXmn6wB+ZlZJB/rUN1t/93Wwi1YmfQl7mXh3Q+NBDlprCLVk+ApaVOX/i2hlthwowGiZcRat69CTxZo2AKZko4COLtcryEc8LSPKS3/DDm8Xxtvol3CGYj9GdVvfgxcKzSVqyI5ynfilG5gPvX9NfRx1QEo/FURmMiBVk5y4oPdAiz+26JAeTF5rhwAhwpbIY5eEN5mP8Cmlb+m8Mn6pij2CtYLHQUpP46ZZ0yVDXZ5YUEkZ3r+68Bzyajjx1DDR3CfRtJrq5YCd+/Vud+xHUrcLEbR+vL6XU+05aVM2RtKtchebbiYfg3JgkhFlY35+osPZMv8f7l+mey56ZEKf2kN2oae9GMfGPes8P7sb3cZhIDJw/eiK7rIeFhRt/nyRPhmeEOSdqs2KfSzeKOzP2UzBs4aP/BqJ01GTkCWNTRhTm5z4tB4nIp4XHr5ev+HjMavSXLpxmNuUbZOcmBHRrB64Tlm6/NvMDVogih89YKr93gwLruzCPC9g2/NfcmNjgviQ0DZk8M7/9WW1TcW5QQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yuzmtiUPDYipWNPcf6uH+apDA9VSjS8CaY/QX7H7F64WKFcQUnz3duH38eBN?=
 =?us-ascii?Q?u77HU/Vv/PZN1Z2PtCPigEv3IJ3Jq+4M9f+gRVl27tlN1DCZz6PbKR/EecAU?=
 =?us-ascii?Q?mARQYmsYKhWiuJsCLAyEoWRvXJJj3bxgQtCiF2MgVw4MwfxCiisToKKTHr3n?=
 =?us-ascii?Q?WCvUKarDKBt8XHXbEpt3kxRf4opKAkuOmmcZ/2SREtlLAqfBzN4Pa0WC6i5/?=
 =?us-ascii?Q?hoo7qSfdc6sZ+jU2yIiTmsa8uy/aj3Vx2zrllfoFPZpug6zEu/54YF9Ji20i?=
 =?us-ascii?Q?XXFjuJ/oDn0UOlwBNzkn+sFC69rpen3mEGXnF/9rAOpQrt4d0vRfbwEmeeRd?=
 =?us-ascii?Q?JjjqCL1J4EyCWYHFBuvdHxEBeCIO9PHHXsXhO2IzlcclWWEEXE80RvJfPMwW?=
 =?us-ascii?Q?1Mt7iYgaWoCG4pu5obspLr+AkZiWVen1wzNFPx7+MaTSCFru50UV/1JDLb8m?=
 =?us-ascii?Q?AGoXMSl5n7g2YGIPAJ0urXM/FU4aSFYJIcDTy9HPqBabGx9/kwzA0klNkQFK?=
 =?us-ascii?Q?eVY+xt4y0pQ7l61ZCVNWphLu03VvQbZ2fJ+Q5NEk3fT46dBrGQG77+FSDpnQ?=
 =?us-ascii?Q?WMfbfY7FJ+xrKWh9i2/SBCDRfh0wVFMXMTS0Hz+iJQCNaRB9JaqNF6/gy5ec?=
 =?us-ascii?Q?z4h9o33YXKLL9JeY95ajeXBMbXH75AaDg4yvFnJT/2lZlRh1mLqBu19nV1lO?=
 =?us-ascii?Q?1/ua+UV6EhAUrqmjIol9hmTw1DQjrg6eYrVeo+UVj+QrBATvKdFdoO3rTRhh?=
 =?us-ascii?Q?+HFfXG1oNhlJJY1tuJ5Z5bBWzkf9TVLandDf8QGjB4z5lkdRJha4j5/Kr5Me?=
 =?us-ascii?Q?jq1m0DlM/z2Bhgk6OphdEx/xuJE9buAKTL6t+Jt6YRgMi/mV8kZhrLgqkBC0?=
 =?us-ascii?Q?bh9AG9CchhpRxng3wIq3KSmGZ8xEBwhv2fZCSuk93I7LX6dCHw6HW1I14iOD?=
 =?us-ascii?Q?G2IPcelrUodf1ON2EWAXjF5FNUtxAfF2IUBHwSpLREMSRqitqOxr6qL3Zgb+?=
 =?us-ascii?Q?MlEnk8gRtYv3fl4FeRPyUyRVZqBVCfa9FEiAcZ1ams4Vg3Uzeabs3dm0wcoO?=
 =?us-ascii?Q?vyHfcS8Qn+g1Kmo/tSQgGMYFDjwlIufNx7gx1X/DEYTYWrBJEwuLdg0WZqiY?=
 =?us-ascii?Q?JpqvqcG1eYPZ6N9vypWvrhAdrC+GilYLu74FE3LaLybUukhWJ8bO48dWtAoF?=
 =?us-ascii?Q?xeoT4zUnO+BM+rB7TFxgcN08ptV1KP7nsfn1/3vKo77JqVDGFlQLVQkfHKdF?=
 =?us-ascii?Q?GLhM04El55izB1VtKkbrdtnhRHUs4DMcX9c3gajH6Q=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fbc213-b2c3-4f7a-e6e1-08db06679509
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2023 04:23:36.9919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB3839
Received-SPF: pass client-ip=40.92.53.84; envelope-from=taisei1212@outlook.jp;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a ping to the patch below.

https://patchew.org/QEMU/TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/

Before this commit, when GDB attached an OS working on QEMU, order of FPU
stack registers printed by GDB command 'info float' was wrong. There was a
bug causing the problem in 'g' packets sent by QEMU to GDB. The packets have
values of registers of machine emulated by QEMU containing FPU stack
registers. There are 2 ways to specify a x87 FPU stack register. The first
is specifying by absolute indexed register names (R0, ..., R7). The second
is specifying by stack top relative indexed register names (ST0, ..., ST7).
Values of the FPU stack registers should be located in 'g' packet and be
ordered by the relative index. But QEMU had located these registers ordered
by the absolute index. After this commit, when QEMU reads registers to make
a 'g' packet, QEMU specifies FPU stack registers by the relative index.
Then, the registers are ordered correctly in the packet. As a result, GDB,
the packet receiver, can print FPU stack registers in the correct order.

Signed-off-by: TaiseiIto <taisei1212@outlook.jp>
---
 target/i386/gdbstub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
index c3a2cf6f28..786971284a 100644
--- a/target/i386/gdbstub.c
+++ b/target/i386/gdbstub.c
@@ -121,7 +121,9 @@ int x86_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
             return gdb_get_reg32(mem_buf, env->regs[gpr_map32[n]]);
         }
     } else if (n >= IDX_FP_REGS && n < IDX_FP_REGS + 8) {
-        floatx80 *fp = (floatx80 *) &env->fpregs[n - IDX_FP_REGS];
+        int st_index = n - IDX_FP_REGS;
+        int r_index = (st_index + env->fpstt) % 8;
+        floatx80 *fp = &env->fpregs[r_index].d;
         int len = gdb_get_reg64(mem_buf, cpu_to_le64(fp->low));
         len += gdb_get_reg16(mem_buf, cpu_to_le16(fp->high));
         return len;
-- 
2.34.1


