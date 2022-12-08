Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2D1646FD3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 13:37:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3G89-00044o-Kw; Thu, 08 Dec 2022 07:36:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1p3G85-00044M-S4
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 07:35:57 -0500
Received: from mail-psaapc01olkn2064.outbound.protection.outlook.com
 ([40.92.52.64] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1p3G83-0006VH-0d
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 07:35:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKhweFaTbYvdM13tHEN7zpjQIlXrFg0EPiom2pvJU7h35fA78URNQr+Hhpm61cAI+TEmzA55AtOEjxkKj6J4pIB0lffx/SrI19YyAtqOL3qq8sxJQeCWd8yCDOYkhZvZh1sc5j/+41ETkSHtumrEqgqRacgpO1L0BG9G6P1drcYvHqMjeqcwuzxdakHVykOQRXWkVmjKf6bm3JReiXLbBlxzo0gfOQpaGaWES0FqfVZglNUNkjyqj1awIXrpUSvtr1b1P5X30kuOVEONBt3MXr/Z1b+w+S2OXOuNnmvUxqmGiD+6y2UtRHKH/ILCBMQfYcFSTZAAlcQJFjaTj01kdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lugLLZkYkuVMjtak3CDK0orHD3LJhXZk2XLINeNRso=;
 b=GRBu/y22gDN2UjnAq1CwhtCUmzRHMhwRJG6lV1axM7djHuaQBPL6e1nMl6KNIBiUdhH23w1djGJBveJs3pbMmfFmRSZdKqOFwzEiVmZJmhD+AMF3isBNWY3eSbsv6S3k6k0TMzcBd2obNjg/nJVEkr6i712qQ77XUuhPkyvTnCwsYV1t4356wnPwOBScOdyE/HybX9OhBwfe9QKsahF8J/L093bZOb+dwfU2xqULK6jPcyQpEtZx0dyEOojD7yuJD+IfqEcdK2rL7bLfhEFd5qeGCHagb7mM0gMroOzUBkw5pNYcSea2hvSko9hxNM5MJUGizF7Yn+L1/RGnIRlvdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by TYZPR01MB3790.apcprd01.prod.exchangelabs.com
 (2603:1096:400:30::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 8 Dec
 2022 12:30:43 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::56db:1c2:8886:e624]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com ([fe80::56db:1c2:8886:e624%3])
 with mapi id 15.20.5880.014; Thu, 8 Dec 2022 12:30:43 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 TaiseiIto <taisei1212@outlook.jp>
Subject: [PATCH] target/i386/gdbstub: Fix a bug about order of FPU stack in
 'g' packets.
Date: Thu,  8 Dec 2022 21:30:05 +0900
Message-ID: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Y0vkvAH0Xo3EWrDHFn3wDlwOAzSE66QQ]
X-ClientProxiedBy: TYCP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::7) To TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11)
X-Microsoft-Original-Message-ID: <20221208123005.199-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR0101MB4285:EE_|TYZPR01MB3790:EE_
X-MS-Office365-Filtering-Correlation-Id: e4276a27-5477-4b79-c0e9-08dad9180622
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vI3V3Sj+qQfNu6c79HvPYaeYOtcHXakKSYhNyr5L+szI92lsbHFgI7G4SUb1m+3VjB72tN3kYH63YrDcRc1peNMxiKD0tQ5Z+vlYlcGS7CpUwUY28GJLH/yOTJu9rf+xl8qv1M60taMeTyVAyD0EBcZ1yWG0G1pb/xQfcjs60lrdicT1Zv/oE9F+Z7jo/k2sEcWMGYYyJlsRHFyE1TxAe3VdgsqHmbodweTGrvvL++aBHAz/4pggXPIuWwADdHPNsGQxMUr9SpfsSuOSjAvf8am2HdKG5PRHQPV69yqHgpLuXahNvKx0f7nUd7LCw9wmBeIa0WJ6rsYyGbWad2rlv17PFMz/OyhLxOvZjiEdMDGi/GddTe50e3zYMdDXok3wYWbM85+csgkz9MH/7zlTTE+5RiJjO0QjX0blcOltEH2E3u0tSLe3a4fVfEDG+tp6v8uAAlolbZ/S2c2bjn30yKcLwBihDeXOx3nvCSP6G5YSmEAasluF1l8H3la3kuDiibpPVkPmJiDCJ8TSkv5N7FKEzFaV8dhQx9TnmUqGwyXXE22kQWwPToduDY8mpbxHiv0hEys2z4MOyIe4HKiD1zpFxhWiEUpCcaLbjfKo/eAO2B+yauxYX/eJwlK/yvKrGhAZ+owsNAnFFnp/I9oqjQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RPPVvosLJYIbg+ZR3Amw84JJ4a/PAmjR8ljo6GcQJaoPv6ImE7Kvs8SUkwWG?=
 =?us-ascii?Q?wfPgigH88TJ3dfio+mu2a3xJVnPWhWKFOD+sUwbJgGXo/TL4HyA+wWfdX3qJ?=
 =?us-ascii?Q?wB03Qhb9exrBrv5PQLK9GwcuwYSGsiEgRmXu+PDPwJk3XcnPsMFPQuiNQjaE?=
 =?us-ascii?Q?kb/RtB+GxkhitTufHGotTNw7MJytTmpicnfjsyJe+9FkHxu1U7tzS+x9M0MB?=
 =?us-ascii?Q?Q7djtFJa+fySsomfobT7CKMeeMajlt0crHoD+Q+V9GoHMBNzDkxJBBawePkU?=
 =?us-ascii?Q?vFFu/3jarDhQ2Yj537B+eWTzxMkGfjhXb3ZT1nxlMf3zXbsi/m3cjx5/IFTO?=
 =?us-ascii?Q?WxSnyL/GgM1uf3hD8qvZCyav5jjjBf8Xz4QEqWM97v+b38auC+UR2IR4eFYC?=
 =?us-ascii?Q?0KDqisq1oc4fixULU3BGVP+bujiOW8AHDnRojvds5xQgO7z0YUJkSme5lqBR?=
 =?us-ascii?Q?JgT7O2cYeK/Dmsaf52r3kxDZS9lRtL37kQI5NR6BBt4W02b5Ei2rzcZVVfCQ?=
 =?us-ascii?Q?isq7ahvPOhquaF2dxjDT9yFk3dcJktXfiDtRjmAcYKKsib25P47knQ7rnDmE?=
 =?us-ascii?Q?N6cYE5lesDgBUeId659wCoTGdRBhWQeN7NQIGyxrLE+DOfltBg2KdmqfkUA6?=
 =?us-ascii?Q?xvkJ72ilw7AQHB5cJCVWrA4ZG+80eBMfQFg3bWwYIeawa81x6R3Lq6/J+CgN?=
 =?us-ascii?Q?3k2y05lYKdKPMt30/Mpcyk51fRJcR4D0Z5xW3tzKMqOejKuOaQB+v9/D9o2v?=
 =?us-ascii?Q?FR+8VtqVEY5NaRyCnyCWt/NkEI1jXJ4mRFiMrqpBdMKLZpe7bZDytxZDunzP?=
 =?us-ascii?Q?oGPCCDlWX0xgb55C9T2fiZcFy/k5etDUqTb+LzxKqvT2WsUXCkAIk92tspVF?=
 =?us-ascii?Q?O51kIZSDVSeTzvKxobYmyBu+gTEjndDu4qoQBLLuKpexy380dhC5vFo+7hnt?=
 =?us-ascii?Q?nyRsgeDo8cJ+ZQGvKHZ3ONAp0xtd/Rk9SiTL5Knp8bClCeSfkw46sg/QiFXT?=
 =?us-ascii?Q?G45Vq/Y6WhNUqRTPcpGTyZw7Gv2+DgFr6l1Z6H8gyP+fxFKbfr8GfuflAdqb?=
 =?us-ascii?Q?JKf8hCwZKDTuv+BSh2hgygLCEf9jAV23o/tbhUdX4Rv7BZLAZ34E5zkpndtC?=
 =?us-ascii?Q?Ohw3eA22oWRHrUkxoieT9Edq716c9+L+2JAYRnrWeSzLlwdgHJfkcEBYjNRg?=
 =?us-ascii?Q?za2L4XtxkLznuoZGwTyO8JPlynGMY+Hd09GVXxOvQsfbZT3LlDnIekWwB3SZ?=
 =?us-ascii?Q?mO8QLVW72vn2AR1y9c9tKfIwgEHrXOaZOUUo8FSMMQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e4276a27-5477-4b79-c0e9-08dad9180622
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 12:30:43.6260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB3790
Received-SPF: pass client-ip=40.92.52.64; envelope-from=taisei1212@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
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
+        floatx80 *fp = (floatx80 *) &env->fpregs[r_index];
         int len = gdb_get_reg64(mem_buf, cpu_to_le64(fp->low));
         len += gdb_get_reg16(mem_buf, cpu_to_le16(fp->high));
         return len;
-- 
2.34.1


