Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437F6506F6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 05:06:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p77Oe-0000Rc-F6; Sun, 18 Dec 2022 23:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1p77Oa-0000RK-NQ
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 23:04:58 -0500
Received: from mail-sgaapc01olkn2021.outbound.protection.outlook.com
 ([40.92.53.21] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1p77OP-0001o0-KY
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 23:04:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZjTubK3t8KARoE6nidV0QYgaUj4iJ1lCsr/O6j39GuSwfXDRq11pOUmVtH8vGTriYDKxuiI3aPbeHZWQVNCLXKnxKjE5LDKb2wmxU9BE6Uf+U4iBgqPbGe+RcGkgLtDQlR1YgZtXHENoIHWHBYVXcuvU/kdcQVegycnhRnYAW+mKIPU5RqdlbdIXMIFlJR8Xb2ARPzKtFJ8eyooxLIP4TodssULNqhwwC6nDLD4Bmcsg2zBz0NSPhurs/b7f2TShLmnJJL8/lFzE8r7mvukFIz2F7bqoD4PnTiAor3s0LV75a/e6Or1OIOREPdRxz/aK0NzWqD5ZsBcPZJymKVpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pl9O6+YEQ/SbSAGNTjfBWNFKRMZHHw9aGUPOIq8DZcQ=;
 b=fWgeswYAOavdV41URXRBa3yMe2FM3ce3yhVTl//ra/m0O2Zw06HfVcIEYyFscGaKeijcdflFHU3QnS/SmNuAvjWezydh121e1z1sh4FUjoXY1pCZ4aqqlLwz39BC2KOyCcylgWAZTjOT6oLIQKP76CLsMLTvbR2f9Our7WQOK9vowpDHOrgeISt9AA+STpyTAgxqY3WF/lEPA/0tQRiI3AujswxjmZCdgbLFBCNLP217UnQfaGzjhP4LnsOITMEumlKyoHhttpGgnk4CTIZ+wMN2IMQ+aVohFwX3mAc6+Qzv2lb/q+yP2121svJ6I/U18E8te7zBz675U63oGYqTQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by SG2PR01MB4241.apcprd01.prod.exchangelabs.com
 (2603:1096:4:1c9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Mon, 19 Dec
 2022 04:04:35 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::56db:1c2:8886:e624]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com ([fe80::56db:1c2:8886:e624%4])
 with mapi id 15.20.5924.016; Mon, 19 Dec 2022 04:04:35 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 TaiseiIto <taisei1212@outlook.jp>
Subject: [PATCH] target/i386/gdbstub: Fix a bug about order of FPU stack in
 'g' packets.
Date: Mon, 19 Dec 2022 13:04:12 +0900
Message-ID: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB42855925D8414E4773D6FA36A41D9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [EgGiCgm3x5s2Q3PGJJDrkczIKtlaehXJ]
X-ClientProxiedBy: TYCP286CA0186.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::14) To TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11)
X-Microsoft-Original-Message-ID: <20221219040412.36-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR0101MB4285:EE_|SG2PR01MB4241:EE_
X-MS-Office365-Filtering-Correlation-Id: fb451f89-f483-4678-15aa-08dae17623f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6on0h3vY2xqLgX988ykjG7S+74NZs5VjQAJZSa3M2kfRLS+sxD9SgPeZ15/4mOx0ueo/r0jv0+770apo3s+IL3bgwO1mj49NpehDrxVvSUOQbg+57MInM8ZEKWEFktoRUaEclfb2ZafAlSpuh4gshwTwxYnK6jP1852riOUsTOkxgVHEMV+/++lglOXzaXQGZxH4eqEhUo8RRiR/X488MhGT9g4BT4SVyKwBFYjF9UfB5g4B0YQWWB1mZyO/Ou49u+sN5LJ9CiMt7i8UCkG2xGlX3l3h9v5sHYriiGi8SgJ73owL+VKAXQb8XvR9TQyeTBT0XSAiwR5tHBp89xoprKG+dxTyOtG/rCz9MKbgScBXmkuvX3M0Dx76ZZn4jcXu7ZTZEy59Bq9fKwj7VpOr4K19SeBJE/mvvGZrau2ynMIsp5ILPxP/EUuB168HBNL/73A0cuT49C7HQh1k0whkIZ+9jORM1hmQSlSLiTIS3Zc3OiehnV0kW5N75HRIm/DbWAI7jNAUnQL0PENXqLbmYZpkLJT9SMOpCPIEAhwRSPGbkRM3u6i+oJcQvegCg++9xXzAfr/QRjJtZJ3WVMPVlmSl1DhHxqEqYkjjhY+s7eFWhPTRhkRyuVduOfl2YW3eIYGY8RCMMdQf+sF7zmcew==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GksYdYOW53JtKxiOl0+aqKOtiNLKnFkFLuaIANmnDXA5Mwj9zaJuXbx5tfrZ?=
 =?us-ascii?Q?wz1N5PUb+uN+mQ0gAqUg8ZADCDJluhaoqsE3IUmsUJ40fZ+Nf1K/8ugI1KoU?=
 =?us-ascii?Q?KqyJNYd+KbkUOk1z6NQ1/NL9vhChU0LwilwiBp4EdAMaMV/VAvbXtu6vDWqP?=
 =?us-ascii?Q?KqOm950Ft/MYTW4x6d35f/9RAsxPBqzTMjKkcVmkfsjy+XmWTWfhznMbqUt9?=
 =?us-ascii?Q?EqH4uU2Ql5jylgC9W4cl8yKVE5SVzGcY2y9h559syX+ao4IGaUdm4CqVgWp5?=
 =?us-ascii?Q?fWoLynVIawoUBCJGhZenJrK4WmpwH8wMaS+DfDpg9TdVWQr8HyQaT4RHmVLw?=
 =?us-ascii?Q?gDIB+V3bRYV5knItDr9qIQ40uQaucmRanFJ6n3zcQ5w7sYafvDJNStm9pqrF?=
 =?us-ascii?Q?zjgXr75pGP0ao9LCFYAmG5Ptyt/dKJ0AxqKgXp2QBUZQ2TYHNS4h01E8/bEa?=
 =?us-ascii?Q?YP+kTgPwkd19CSeddojys95WEpehm2hKLAM2BhCoAi3urGuMKcEqg03DQauR?=
 =?us-ascii?Q?LwUU05amr4kPxFSyswG/OMNW8+VDfFc9bYfretd5nQPJYlAp3KAfeptYgdoQ?=
 =?us-ascii?Q?5CKYV7FJnwhOjDnNU77E5vNYtwK0YSNZMskF2S2NFazpYUX2g7Iob219GA8T?=
 =?us-ascii?Q?F+CE5eY4smpLA65oMxB/wqOYTSJWpISizTYjb99/sYMZwOlQDeuzQ5ZAlPvJ?=
 =?us-ascii?Q?SryokVacspmhgu2Ea1Q1iIRiCvAZDkncNe7LoiDrPcd9jRDj7y2p5uH5hQX+?=
 =?us-ascii?Q?5jbVRkFMJXgTzEQRjAgFmWG2SQqmnitA5/xCPsHdGT/vXLCsa/qy28nYNIb1?=
 =?us-ascii?Q?OIPMPLWB4VXuBHuaGlrsjlqFC1KgIsUNmaRqNx+i43inBUF05DPCMV0sQmQY?=
 =?us-ascii?Q?/XPmc0NZszWko7bTqGGZUk6baCQK0IA2PcnDEqk2Jb6iRabeO+BJfUFGLTkU?=
 =?us-ascii?Q?fGIQjA1rgt+3xTaH/Eh01prdtqQXR+eeE63IGnEImxz+MrsSQoUsZXZUWy9e?=
 =?us-ascii?Q?Wi2jR9gW/1RxXhQi9lpUsngg325uAQfeuh7e1oUmvjrcnYnGgT0Orr2lU6cj?=
 =?us-ascii?Q?zZqs2TkfufF1d/k2tuuuiLpw6uMp2hy3gOCBjF4sLLBx/oudG2QJrw9/xbDy?=
 =?us-ascii?Q?zw6Ytt+b2arUiH/Wxdv3/gKjl//UVFecKeWnSmlLFe3ViALAat/DVNIe0UiJ?=
 =?us-ascii?Q?gt14mHFFxLhTKKywRDhcZiNGDNyd71JFqRmJXSQ9JoULTwiDhJdyZqmWxisC?=
 =?us-ascii?Q?gEUMfq+p2zyBOH74Wyyup+yc5vrP75eHCr1/wl4Cnw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fb451f89-f483-4678-15aa-08dae17623f5
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2022 04:04:35.4188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB4241
Received-SPF: pass client-ip=40.92.53.21; envelope-from=taisei1212@outlook.jp;
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


