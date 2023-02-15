Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D51697B72
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:07:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSGYX-0000id-4X; Wed, 15 Feb 2023 07:06:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1pSGYU-0000iO-UG
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:06:34 -0500
Received: from mail-psaapc01olkn2097.outbound.protection.outlook.com
 ([40.92.52.97] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1pSGYS-0001jK-Om
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:06:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wte6FfV/fTf7cugNXSC0NZfM5rnUsBRlnTEx+YQHiqaXt90ZqKi0MINYuwJSK89gDYFtSwikWyOfB8m33WyCRxGak5fyajx5Vl0FJdWq1WT8sNIUz2d1zSY7B6/RKPRRoy4RlqTbFPDFOTsHwKGEsNy8RMC5y2fiXmj5lJfsAgq+PbFk+8eyC9tAMevRtMRnWkV5thKIDLIYSWH8dYN2RsoVshDxKQfnrMKEwbplAxgzlV7Z9Mp8BMkzyy6oU/ONcQoy0y4wK515M3EVv3w3j9sfqpKBeMNRYfB6lM7W4vIRr6gX8JNeJhjatLOVjF6sX3V2Im59jAFKwlCOgSN26w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCYqZPCQwZKna/FGkyt0u1vGncCCGHozwkfz9SgReV0=;
 b=Z9WfysT/3rj0MbJ5VWMf9VNtg86NS1WrCNbWRFji0krnhiVti80z0em3g2p6etITw0rWbYP2K8kkWmUWPF/xlWmT171IuUAVm2/k+YKnADkbhS07Po4oO5iqi8JBXy/U96wpnp0CwePaCdt7G4LiAoBlNaLC3X0XoIINuUvHE0s23N2fqsWu2IaL5U7OjdVUvw86iXtn4mUkKKnagLmXi1e8bvYG6pm7qVHhBJHLu2Z8VX8wQ6Nfdg8dTKBcG0hX3xfqJkIJjjD+n/DZZrDSQasQk0dTffawCkAvRkzAUgxO78dfsIOzioObzemE86c8sxxjrI4CRmTaTrymq3I9bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by TYZPR01MB3902.apcprd01.prod.exchangelabs.com
 (2603:1096:400:8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 12:01:22 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::56db:1c2:8886:e624]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com ([fe80::56db:1c2:8886:e624%6])
 with mapi id 15.20.6064.034; Wed, 15 Feb 2023 12:01:22 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 TaiseiIto <taisei1212@outlook.jp>
Subject: [PATCH] [PING] target/i386/gdbstub: Fix a bug about order of FPU
 stack in 'g' packets.
Date: Wed, 15 Feb 2023 21:00:56 +0900
Message-ID: <TY0PR0101MB4285AF45F16A1AB6F156352DA4A39@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Y1ben3a3vLSAf2ZFquhSjmh62HyW0LYr]
X-ClientProxiedBy: TYCP286CA0158.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::9) To TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11)
X-Microsoft-Original-Message-ID: <20230215120056.500-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR0101MB4285:EE_|TYZPR01MB3902:EE_
X-MS-Office365-Filtering-Correlation-Id: 4335fbde-22cc-41dd-58e2-08db0f4c5afe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2V0LxkIT8V2LrCe3RyWevM78XlDantOlEXbFckhUAJUqEWUfeHh5kJoCjgf/VAVq9QMvQv7+k1SjQg+St7atAO83vXq2kt+W4fagkA1Rtb0lWLO5DFpoYt299R3tgThhClx2b0O6oOJZ3JkTwnqcwmHlFSr9eTHVkH8umdBkAwRA5XAgMF3wbTQ3u3ML0WMbtq7gjR3Si2lF1+N2oDXXQ4xYkMg97BnCbW/2G7Wdog++4M5BTljQ8vA9UViip9/kSRB6w16DSiL9/Dgv+MoCixl3v+O6StCZA/8Czfk8TgNJD92/KW2W23NstpFII7e1S4JlrE9HbfWgqwS1i3ds2ywWtehopUAuXe1GQ48emTHjhSSkCrddeyyvZiPm+PJmGqia+tUYRlOaFiQnKhBrCirBkoTVrjfd0xxTbBK9U6Gpj2H9pZKgjuaRvjp1i63UWibMsa5OwweiQRyRxIAvS2xOmqGcysH3U22M4ec/YSEnTCRdEAscWzDeQQdNB+gSBULJb6Rd2YluU6UabEN2vS8fA7ZaTHglBRH7PIiy6jvgcBSI+xwKBFpaYSy8DRl0uQ2K+wXQYqIt+8aUQQT+7aFug2KBwOYde31f1n/fMfiUSlgHX1IB0HfjXQNfv7oXLkgNRps7Wk0hSDp3sdO8mQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tIzvRfOABK3MKTi2xrSroKdY1CEBMcfHPodKv2XjR6XYh+ZjZJIQgI/D/OmO?=
 =?us-ascii?Q?Ftdj6B/GFd8IatEBkSlw3rhqzP4agkbvliwK4ln8AdZyAsI0ZYXaEIxLFb7j?=
 =?us-ascii?Q?Uyl6i8K6pVYZ1oOyrthf+qsc5mOzVjLIbdZvPvaovxmDD5kBXT7QV17LwyVJ?=
 =?us-ascii?Q?bzwcTqHHINoPafWUNdqqrC/MlGc0sAIVqHwyCHmjaL6ZoXl4jIOe/Z0p4tLK?=
 =?us-ascii?Q?gLHlKY935AJTh/HrQEVkc9Q1aWqL0mhpPdusaqun+najQp8Vzw8vu5T2aV9l?=
 =?us-ascii?Q?fANq4Qt9nn1lz/cqYy02gj20k0CNFIoy27Bos1qShxbCoaMxKrB2EopMNgJe?=
 =?us-ascii?Q?VaHrCYoynJL+6UwGZEcHjX7h4mZUeqhJDc4KhHtjuJX4i7q7rSNLhxM1g22c?=
 =?us-ascii?Q?IlwioGOHSu/g1iHcwpCNmBvui8PDGdAZSQu/VTf+N4+wfhda9Crkwh7t2e0V?=
 =?us-ascii?Q?l7PTEauYtSmCtdggOBjWIGQTYFQCUZkVQnFQ2X4PVTuseUzH2g5zxoWBiwsC?=
 =?us-ascii?Q?lz8LVQiIp8A5Zf2U5d6k71WRy/SWoKzorOacZjnc3tR092NA0uoyKy8rnxw1?=
 =?us-ascii?Q?I9T4vKhlxcPajTZPjQ2/PgOB6yEur0S+zIVEaMbnciU9jN1z+tGICGYlfCdQ?=
 =?us-ascii?Q?OLAEtIQMa4nVlI+ZjPOYyZhm+zUcr2SPbDLAYYHAQvakjk4EYOX1wKFWfm6s?=
 =?us-ascii?Q?TOvJPTZM6fjoY+EVPNRaxOkTB11ByiV+sjfUrajk+800Kcff9aJdkTRFFy9w?=
 =?us-ascii?Q?xTgVhe9ORusRXu8Zu23gvnRXA61HpiPBrhZpqejyn9iUmRvJrZ6qUG1pvIIb?=
 =?us-ascii?Q?UbV5vFGUHaUcNSZyOd69KvdSOa8DJ2x8Bdi1bW/GaAKdXI3/P5Hr9IgVhifR?=
 =?us-ascii?Q?D+T8iNFX4CeKp7E0jmdo5ZVoRpIVdp4w6f10Nla5dm9Qe4FFRy0+ebMtJ14H?=
 =?us-ascii?Q?JZkPaLDZ8tnph0uLzXpQ3jF+LzIDWihN4pVg8OzfUVtFjdRq51XSH6JMjm3x?=
 =?us-ascii?Q?K6Ym+qFLnp+sNDlQGssWqIZLA9lugJ4+rofmoQxCGbFnoiLWH7b0jeUq+zJj?=
 =?us-ascii?Q?44yvpwqMrZkXXmd/opjshp8ecJZ3CLOpDAtVNUC1d0qpxkyadlr9d2VUKIWx?=
 =?us-ascii?Q?7cntjDBIVzAWGU6d/jSNAb1ViwmST0Y4AL0aw05G8tRm+mbOVQxaY6zP8uBB?=
 =?us-ascii?Q?VUzpWp3mCcO5x3DtIvRiECucltHYybjDtXbB8JzsE6sJZuX8Ei1WjGUtM1ny?=
 =?us-ascii?Q?Gt2Osbektx5eexIPk+BwER06BA8hH6ncl85FEaw0Cw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4335fbde-22cc-41dd-58e2-08db0f4c5afe
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 12:01:22.3637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB3902
Received-SPF: pass client-ip=40.92.52.97; envelope-from=taisei1212@outlook.jp;
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

This is a ping to the patch below.

https://patchew.org/QEMU/TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com/

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


