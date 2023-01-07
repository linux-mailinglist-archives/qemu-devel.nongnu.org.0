Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694FA660B81
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 02:35:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDy6O-0008GL-F3; Fri, 06 Jan 2023 20:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1pDy6M-0008G8-A7
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 20:34:26 -0500
Received: from mail-tyzapc01olkn2082c.outbound.protection.outlook.com
 ([2a01:111:f403:704b::82c]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1pDy6K-00008n-AJ
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 20:34:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAjVphpH/iYzB00/Jzf4pcXYrjKMbdN71V6q5JTOQbekmN/nD+mxIIWE86Te7LLP24QD7td1gaI8GtFqwMe6tnZ1pMhRcJcmc0mNketN8103RgxGabKm+1G6lqSOLzYT8+0+fhwcf6/yi9F7dEaArPr6SAdMlYM/6M4hlEkTap2XWMn6wlNO7gQQTT/fJXCpESi4ao6PPzMoie39+AyPrsRC9qGomCg3ZWyOa/9Z76F0n6UP02Zq1SJH6rgRPH99PRW5vmsVrAhKRrPmd2SmzOHsMPfdpddrXAv+1HQrV6IdvGHaqH6bqiq7JYoaQqBW9RInWlELHr485qoDWHJ+tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Os2U5XnRCVIhbuQ+D23ClLqQ9yHaAltnUbxlwLW6KUU=;
 b=Wvm48kxWjXvp8I8Qg0ZUxBqveBpfLBqYPrMeVbLkl9gPkjNpyimZXMNc5qznKCHQZEX1rV+ZtellYR8GMzRVOewaxbleex5P1WDA2p+SfcqoxhckNaiV4EJIys2tM5WEVSv2Uw4P3/d6rch4bi/o/JkF2Meka1N+CQqhbnbPQXDRVZXzjjWfi84KS0CaRhvrfWxp/UFbIu/wyorWu8V4jZVHHCcDQQRwG74+Mt5GEHxaf1vsDyxhwBHTWAUxCSPyIjlQ3viR+bNYiqF/YV3pYkyox4wA/8ma2f9LNLkkQMYm8khjqjxPbnMlA0TLlTx/+gHoflA8EShVRwcd/tPOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by TY0PR0101MB4336.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Sat, 7 Jan
 2023 01:29:15 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::56db:1c2:8886:e624]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com ([fe80::56db:1c2:8886:e624%4])
 with mapi id 15.20.5944.019; Sat, 7 Jan 2023 01:29:15 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 TaiseiIto <taisei1212@outlook.jp>
Subject: [PATCH v2] [PING] target/i386/gdbstub: Fix a bug about order of FPU
 stack in 'g' packets.
Date: Sat,  7 Jan 2023 10:28:51 +0900
Message-ID: <TY0PR0101MB4285AD60FE3976F1AD5C6D02A4F89@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [x9K900KLPBb3hW9EPZCTEhTTKlrA9FjN]
X-ClientProxiedBy: TYAPR01CA0216.jpnprd01.prod.outlook.com
 (2603:1096:404:29::36) To TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11)
X-Microsoft-Original-Message-ID: <20230107012851.21561-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR0101MB4285:EE_|TY0PR0101MB4336:EE_
X-MS-Office365-Filtering-Correlation-Id: 3103e067-b049-4817-0449-08daf04e96b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qELo3S/8F7Q5IUth/hR/ikgJs2pH2T7fvE14wviIzi0aiSuz0anwDnScDBaL21MTz04gXxXFktQEhQyG0k/g2W7zKyVLMDiPUGEyVe3he2ysDUM56SWfwKyo7wCyjnsm4Pw/6Eweghmd6ODG8kh9d5g5zavijEtbFS4SXuKNk+EhKIVPir4nkuV8h0sW6VkzxETop50diewLbflTu2B1E6JBdHVoPuAoSz87pR31Pp3tDykpZXhm+xknJOw5fZmuaB0c201HIg4IwCMZUHtCaIa0z/HKeTcrst8W58orYQXBvf4g3Z4HdhfYmBbEDj9d/MEtTbY2VUw/J3tqKfHZeAnL6GOdK7K66A9EqghakQNqQJDPZlK7wNLKZdYUCoFKQB0r7S/MecrbtTSHD+BxI3GCmpCxZRZyNuOvb+f5ex3yy2idvGTNNV9amiX6R5Ml3rH4LC1MoMRhXHqAJ0sFfwND/nz6WawQjcz9NYoS20QbGZKuQ/1Qd4XZ4Y5GqylR7ry3iEpWo2RhoYG65QUi94FTfGMDSqoEmIw5/Iajs0Wi6tQl+kQ9ZBjNxOIo1ayeyBAE+rIRBZ0hUDek2MF8VLa6DWfJWAFMrJ5asPMXIOuA0TBvxig4VzhORrkFZKbLhfCZQBBXjWn3KPGjT4cFPg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dGDpRnniGlqvNwm61Zu787H1Sz4OS6gMo4FzaP+KLn6m+YNH+j1n9HV7qSTy?=
 =?us-ascii?Q?AhRxzxBTLX/7u0mXUf4N7y3Ap9us7q8zmY9grlqqs6F9nXJwpBydIz3d9R4O?=
 =?us-ascii?Q?ou1b/JqHmj+cwkbYWElvXyChPJAntj5023queZJ0ZwADKuIs5ORYs9hvSMo1?=
 =?us-ascii?Q?7aAOVP3XIb/J0U1prLkoNIrc8N5IneVvurdUrUzXhU8XcOflgl5NBoAHgn6v?=
 =?us-ascii?Q?m56Ku9/bx30ta0D9k120oBAN09erMuihZsGEukTOwycSE5oVRw0+8a8mewTm?=
 =?us-ascii?Q?whbr9mcCSf8jrkVXdLkMDOWUebcHLbBWbjgoh7bHUBaWii8JQCsdTCN+3yX/?=
 =?us-ascii?Q?w1EHTR28iIKOhYDi/uTADhixgaEYteWX68n9tqZEAqXEdCR/wvpr76FUjWtR?=
 =?us-ascii?Q?zoOIHLWJq6fmSi8x44k2TJtTJ12f2PEY8/jNGluywRxAe+8sN/we9i2cWzn8?=
 =?us-ascii?Q?Q+sKWJIxQlEn8dqqNFEpg42l1SC4ogr1x9DFfl3OHqAZDiuIlE2twO94/Ui9?=
 =?us-ascii?Q?Gccp7IIF5yNVNR+p17JHX35UDwGLeuFao0ctkqbo3GfT5lXFe1v0kRz8AVfW?=
 =?us-ascii?Q?CLoegZi2DaTfRJYnWFd8ueFysrlkxG7OORiUgP+8OsX3RnyPjsQA88eJfOJc?=
 =?us-ascii?Q?z7Rbw0LtuW5VOHA4MWvpFiWJP4vev+EijNcgheKTL3cpYvMykVaf6HnBjGcZ?=
 =?us-ascii?Q?XYkeXttnhv2uSrZf9S4sX+IyobPiczb5zo3oqPMdGkKpBF+lsTv7J0z8tdvI?=
 =?us-ascii?Q?vbvUJ4XdGVyDD6qGf2Ad2+dWElthhxdl5hdo5im6KC1jwz8uxxnW/z3uIK0a?=
 =?us-ascii?Q?nxQXecvHgaw1Kd9jc//EgpdQIHh0cqOZmoL+iAyOH4Fhz6fYZauSP+frFZxo?=
 =?us-ascii?Q?JF91oIZLwI04PycbwxAtk//urNMTCplv72XxUKAdQJnDlW013/Iyg9zHy/sN?=
 =?us-ascii?Q?oAUCNI6FqRWpXhbsT5dy3FKvUs8r490UER47aNZdJpcCAGxEcjYfZg8yAHXJ?=
 =?us-ascii?Q?J1wMal7DqdE8Z1nz3savIDMdQVXgVTfDwQNC7T+6NH1dC5gHYkWJJO7UjpWN?=
 =?us-ascii?Q?Siz5z1ho5YtUY5fZfgOOkOCIX4ppldTqP60qiIdXKVgUkQW2r2/Q4RVwvOVl?=
 =?us-ascii?Q?jlh75xm8PmifcbTJ448Mrb4CdObk5zvd4hxTIWmjfNs+wv7yBmZI/wWqH9SM?=
 =?us-ascii?Q?Id/oGlm9aMPtf9WHhmysnn6aTCBLWxaigjmkSkdZTpu0er23bTcToble0TlG?=
 =?us-ascii?Q?1YCYpTDlhCkzXYNQgHfbVvZq/aehmWJXvo4R8LxsxA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 3103e067-b049-4817-0449-08daf04e96b6
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2023 01:29:15.5765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR0101MB4336
Received-SPF: pass client-ip=2a01:111:f403:704b::82c;
 envelope-from=taisei1212@outlook.jp;
 helo=APC01-TYZ-obe.outbound.protection.outlook.com
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


