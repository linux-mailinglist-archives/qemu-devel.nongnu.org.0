Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8D36506F8
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 05:07:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p77Qe-0001Lp-Q6; Sun, 18 Dec 2022 23:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1p77Qc-0001LX-CX
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 23:07:02 -0500
Received: from mail-psaapc01olkn2082e.outbound.protection.outlook.com
 ([2a01:111:f400:feae::82e]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1p77Qa-0002LT-TV
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 23:07:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joT847AgaA5R1SfT5lcAKeRHevYE/j8kUgfW/qBuM40ULhRKcA+2ctFZ0uW6j8X2Snnl28ucJzDo+8v7MARmroBNQ3BmITWf2kgPcUT07nDe35pw0bmHzJS5ufwjtJdnSZGzDW/423xRQHxbu3iIIfcUWPOGlvLGYkJFBNPSlW9oDHKmw5lcDXSJeJ82AG2xsQWRtd/JN1f4p+2sgmr01ujotpun2VRTBsYf+a1aknmSyG8yhiJ+w0ruqVt2i2TGqNS0/KjWeZFUAKVgu+vGIVEAjhE2wf+tT4JcPY0/HKEZU0MRp9iwEgudyyWTWAFSmWU6v+HSHKVnq+OXlw+64Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pl9O6+YEQ/SbSAGNTjfBWNFKRMZHHw9aGUPOIq8DZcQ=;
 b=kpKiMYePBX6iw9AZODzwvLCF01DUaGVscPASwe6ehf0n5ss4zDLrvfY1WcCQgee2GWAxAJGYbU8QZuJr0tZ54NmQHoLIgGDHI9VdSdeNwTV4k2n1OWC5bVLiQ22lJkD1WeD2Bn+Uo2eTRJ8iKKV39C5AFSeG9VQD+ZKVhy/XfCa60EC7qPcaQ+d+G/9z3d7QGZGrtt2hYn2/AX7mrJ+ae7DoCMpWmWkjCe6i4ywTYntaKkvrkwTfCc9WF9TRJCnaeW19kGW1ASoIoJJ/2tbu4mUH26hGCzx1lEMo4spd81OO9t4ReauIMEKkkpFG8fiU4jEhc7vuG/jl9Jmlt9z/bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by KL1PR01MB5116.apcprd01.prod.exchangelabs.com
 (2603:1096:820:dd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 04:01:50 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::56db:1c2:8886:e624]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com ([fe80::56db:1c2:8886:e624%4])
 with mapi id 15.20.5924.016; Mon, 19 Dec 2022 04:01:50 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, =richard.henderson@linaro.org,
 TaiseiIto <taisei1212@outlook.jp>
Subject: [PATCH] target/i386/gdbstub: Fix a bug about order of FPU stack in
 'g' packets.
Date: Mon, 19 Dec 2022 13:01:20 +0900
Message-ID: <TY0PR0101MB4285E56A696C6A58C4567128A4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [XTePjkHbf1GmgNj9sveFpVv6EG2QTkwy]
X-ClientProxiedBy: TYCPR01CA0194.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::18) To TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11)
X-Microsoft-Original-Message-ID: <20221219040120.19-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR0101MB4285:EE_|KL1PR01MB5116:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c488070-51a6-438a-aaa1-08dae175c157
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHDhysqFCuR2RnxNfQwpUaBI9dAZG6vrHYEch0vHu6F/rgZrvDw+INZaPTvjAuo9KUsCwhPr58x+fHPGqrUsWvxk6C+Dgx0DEFRR3fOmlqLp8jLKXbrc47ZA/u5RMO1iyBFm4Ftj6O1UI3yIdqMKM/MTpT1d+w7mTbOiPiDW/OUYm57kGfDXO61RIBttusYwBPu255QkcJA8ek8De/Soueox0b42QobNK0yMdO+gkr3WztpvUbf/0tkTb4/oAPz/kLpbIA8+YpnbNVvJSy8gEBJ7/fuM5IPW8kBWzlBFbawtwJhV37gwueItI3opq5h0Y6vqq+lAF+khsqjpkycuzKfGeBEVACuLDsInxhKDaLWqHl6/ml4KUKDml+Iin3D27HXjAUqw7Zi7dsaDi9A8UcwyC3NJZreG3J25UCs/AYHsHLV9pJXsPdJFH6Q40RX3eioQc0nfK9GnsAgiIHhapMLEgwfs619U9RuvalgNNiA+i67IUzW4qjlkXbJuHxL9M0hTPwfjAjzokeqxtqZ/yg79PB7DcEYApuPmwZOtK6pwWjl+88jQzGAxkOnxnmaVnUsINT36cw35TqBp0JVs8uDi2MoVYQ7ynK0BH65JUp7yM4Uv7qtzn2gSyVwZMRl2xYcRtjeE0W616SaovhrxdA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kToqKMq/krekHZUASPKUGLIeEY4+i9HmyPK+tcgezhXwO0tSojJMUIqj5ro+?=
 =?us-ascii?Q?ms91Sgg/gaM/8TYEmsrxil4dOvdfhNSqqwPlUwiFSKZZRcqv2W/Lhjy9xoPO?=
 =?us-ascii?Q?K1RNdK2Run+rq6PTTfm00JwRWWgts8JTxVc52sjRsWCl6X6gkmjbRYyRME2Q?=
 =?us-ascii?Q?BzmTBt95yFIgiV3xL9507ORKkPUntNcFM59UvsNs6yJ7D5gkB3jeY/75VH2E?=
 =?us-ascii?Q?uHLcOnQ7GOiD1BdFYHRXAwNMrBNxAj4N9bhG4p8dGq9BmMrY5meTIc93701N?=
 =?us-ascii?Q?xrYJiw8s6lzkET+SJrlYdwtm77j6JSZXUIGtH4O+T1p56UNWSHCVhEXJTELy?=
 =?us-ascii?Q?0D36zHXGGqMXAlz6mdCfiNclOd04v1MIrgyxwWJo/JL1A641ahwg5junzaiF?=
 =?us-ascii?Q?/H4fNcAyxnBgqEcG56WqGiTwO2bRpGLmLDLBCNjW3G/DAfugrUEIycrY+qC0?=
 =?us-ascii?Q?ihXdEM2thBybJJAnSAaakbSV7bhY/ZMs0TOQDWCzs/qThgTEbzE4kFEOv6WT?=
 =?us-ascii?Q?Of65AGDjDx6/lrFoDqHozGLdmOLpIjZ7r38keOzpbgjMmKi596KHSRsqTPpt?=
 =?us-ascii?Q?KGpCnshv8p9UI4lFuxL5BcRyKfxgg1BDSFG6/kAU6L2e1G0X5f/LbebSsZ/5?=
 =?us-ascii?Q?4ET9WpvDq+nFff58HrcvTBv4x0YcwVsNoCajGiFUtia+e+/K0KA2XW6iwgqd?=
 =?us-ascii?Q?kHQiEEqYs4aHaMN8uggUdDGjCtJJNxhCamIxRavyS8TrO7dNss8uQgveZ+zn?=
 =?us-ascii?Q?tZSklj8aayGrdssLwJJ0/rrvIYQD0Zuo9uq0RT+Hej6YR7B3fX/kgYf6Gw4c?=
 =?us-ascii?Q?lb/AcB+0Gcw/cLSpdQzXeVHmAR+qTDVgxvgvpBLC4UUf2z9FLE3U2aq9O9t6?=
 =?us-ascii?Q?ZES8csDeiLRE1YcB9/ViQvYGHKTjGj79M848LzWD8iBTed3IblIzUSww2ZPq?=
 =?us-ascii?Q?e0Qyx8QAGpL+wL+G2DMZmtH/2kjjvnEd0b1upoZ4U7Tl5H9+S7zvQDEJE5q4?=
 =?us-ascii?Q?SPXDdUf9+7f/lV/JZdbbOFbYj/52isNI3IXTeNW81hCRTJsWXhzZz5eEBscW?=
 =?us-ascii?Q?HFRs1JiUQ4lgHDWyzuBein8e1wR6cNbZeuSOVdU7jTHKgdXHUpNgDUsGi2pY?=
 =?us-ascii?Q?oe9+kIciS9VGZO58+E1SSOjAQoNxknx+LnzZ5Y+FphSBOj4ewuBhiw4KCSBj?=
 =?us-ascii?Q?m8ozxcEZul46BxTmMIdbHwAyFxeJu7kT43eN+00aw3mo743EUbNVGfMmfI12?=
 =?us-ascii?Q?OH0zz33L9Xpyntcc2XQzFska2yYAFmVGK2fMnM1f1A=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c488070-51a6-438a-aaa1-08dae175c157
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 04:01:50.8169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB5116
Received-SPF: pass client-ip=2a01:111:f400:feae::82e;
 envelope-from=taisei1212@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
index c3a2cf6f28..6109ad166d 100644
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


