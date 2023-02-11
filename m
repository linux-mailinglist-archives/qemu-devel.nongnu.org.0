Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9ADC692E46
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 05:16:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQhHs-0004s9-73; Fri, 10 Feb 2023 23:14:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1pQhHr-0004ru-32
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 23:14:55 -0500
Received: from mail-psaapc01olkn2082.outbound.protection.outlook.com
 ([40.92.52.82] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <taisei1212@outlook.jp>)
 id 1pQhHo-0007Ep-7m
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 23:14:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIJMfYyTwrj8aWGXLXjMxYzPz2bmPpoZSlmQfNFZELZq8rQTYDiRqBYzGyzbobQUeYXriZBJzRjbAHtvfYl+US/iA98Y2HjpDIApSQrEEjsKV3hgANnCUSO+1Ky8N3AzDfEgvGvK7+BgsSXMtaESY6G/5Ntyv6URt0yJOjzdqWYTOBHgEeQ72oQQDciqZCZiWII6DwzK7HFK31McPocpJI49uYCAF+7WOtFD3yFx11C5V+g4U0LKz3HZHhRVApoexnRxQuA4AXdMZzTcj/4RZaE9Nd/rUVHCyf5/epLJiddzb2v4xqB4UR15WuuN/VVDBV17no7NmRtHGAylTB6HYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCYqZPCQwZKna/FGkyt0u1vGncCCGHozwkfz9SgReV0=;
 b=anPawYbj+0wMrLHgzqSagGkz3KHq1xmxgcJKsY4eHZ79e6qVqwbzaR4e2l/7AHA93NdZVPYb3ayn2nKjUW1R3GBlfbmwKSmQaF2f4+h2J+r5rNQsMe3aeq+LK2E7sxuGUei45HjuZUEFz1i39lkdwPTyOsaEqpjQSVWfNvJiyuLuJFMm4/y+yh9MOXRkljJ4YrJKflrUG6hW1xvGxMXVJpFL5MkNWYk2ZKVvcAeP7PuOto3GzhIWQlp3t3jZF9syQgghyALC02M3H24CJ/er4w9ST1ZewDmqte3/Kxa0QQxwlnQQW6BuUO8+A6lFcc+yDjsrUxmiqqovya0FCPJa/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11) by PSAPR01MB3877.apcprd01.prod.exchangelabs.com
 (2603:1096:301:49::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Sat, 11 Feb
 2023 04:09:43 +0000
Received: from TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 ([fe80::56db:1c2:8886:e624]) by
 TY0PR0101MB4285.apcprd01.prod.exchangelabs.com ([fe80::56db:1c2:8886:e624%6])
 with mapi id 15.20.6064.034; Sat, 11 Feb 2023 04:09:43 +0000
From: TaiseiIto <taisei1212@outlook.jp>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org,
 TaiseiIto <taisei1212@outlook.jp>
Subject: [PATCH v2] [PING^3] target/i386/gdbstub: Fix a bug about order of FPU
 stack in 'g' packets.
Date: Sat, 11 Feb 2023 13:09:17 +0900
Message-ID: <TY0PR0101MB4285B3006CB19B1BF77C3961A4DF9@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
References: <TY0PR0101MB4285923FBE9AD97CE832D95BA4E59@TY0PR0101MB4285.apcprd01.prod.exchangelabs.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [AyJvLEP9GsAIlrWTf2DomFrOcATOfVaE]
X-ClientProxiedBy: TYCP286CA0240.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::16) To TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1b0::11)
X-Microsoft-Original-Message-ID: <20230211040917.741-1-taisei1212@outlook.jp>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR0101MB4285:EE_|PSAPR01MB3877:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be5d86f-18a5-447d-e24a-08db0be5cd7f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hDZYYIq7qN1MyaJ59tp/kUwAPrKuKaQuhGQOKEz4We3MSkzeDyqmKrzpxWGsCHXIGo3iDzjsjNdf02oAyXFaoDBrC+Rj7A2Ld3z4AxS6/Ea6lFd4gYv9nr5MhFkx/kD5OsG/pwMR0LVhTJR1SHkczd7IDrrKPHs1v7KySy2pXwLdMXzKk34rSyuP6ZojY0MeGgizWdQqUIgMKe+RKVTHe9b2zAY29UMrdc74/KWdtQ2OX3VyMIe9boVP4vK8XsU6Yn63tzfNIg5uQ6/uOw/sAg2gXGqLYpvqjaZ8vuLovVbIcsXQ9Z8bFt7xYk46O54l44AHlx7qXsqr0bx5npbWrKa03pQaCJ9J4I3s4edn3hYmb0ZtrpvBu+hrnjlILHt4xnCWOCYTj5O+HSmMtI2ke714S3eEwHCBGN/N0ukKfOpoPTABVpWx1mBZ4Um9q3A0lYlxzKTa4QRo3+2qYuvwSTuzpYWI4VLtGkE1lQmPx1gH7XcqbSoSZ+yvRq/xIP0BatgjVAZjOy5Hw5livIMqVUeKse5r0Z3zLbLhIvo50we10KiVba1hv4kalIqkWUgjGEuruhXFVlFVOpVGKAEEQCcjFq4U9QaXdGX/ix9dwLWRaplO4CG++aRoU/aF9GWMlkdLM0yYRNct3E35tiEsmw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S6y2pQb53o5nafkNjDbGWP2DxMCxj1lUOXL9Hiz0Z/S4XbqoyHKJOpUbKP91?=
 =?us-ascii?Q?JSYWFExCzc2Xxf+ywVDLZcWpNed6zOJ9DEpt3gyfn7MPFXfKBtdTr0glvJnW?=
 =?us-ascii?Q?nlnInUOjTRS4uX6hKn2q/yiR4AYMbVPMbijy5dAOJNVzqq1Y9QG//dxbB507?=
 =?us-ascii?Q?NCceG4W3+/T+U4Qqk7uYluO0SlumvzfoRA9RkDOM98r5AUYO/D/hVnZUiMi4?=
 =?us-ascii?Q?LhVQm+Ejc1Q8MCpojM9pBRfMdq409+1A+NVxTVlF+e4Z59RXcWIFd8KFurUL?=
 =?us-ascii?Q?1bMQXpVpC9OFTO+px5pNqDerHk1dP3q1JQo6dE87s472zdvk8XMp5dgK6kpq?=
 =?us-ascii?Q?v/VADNr14AW8/9mUgCKpD0x9qJP3OD+zKJhvZ76kp8ODBzuCkBCWi2ChcEHL?=
 =?us-ascii?Q?xMJWilsMtPPueWrE5RG8QroRDBhj4JmAsJTrXlg6tJ09xWPCQ4+Tohk2Zg2m?=
 =?us-ascii?Q?3RJfDlTek8rqIiFjlY6166iqP8+q8ZS29mz/Y7pVv3zTmM7Maaosa8b/+OtU?=
 =?us-ascii?Q?8bgyHax5VhJRq0tVni8FRyJWig8xY+PjjmVX76B4P4eLUnqxjxQj8CeltvLG?=
 =?us-ascii?Q?sUbV2ZadUfGQTbLXqcPCjdCFlp/GeYhTZvKfZ8JxZv4UkQURraXw4axP9gQy?=
 =?us-ascii?Q?IMnuOpc6w+1Jj2avDJg3o9OzouxIqfxT27daLUXh2uYAX/YAM70S+K7MCHtJ?=
 =?us-ascii?Q?FkF6wbA7jL0XfPm13FsiuTH+SOFrVZIw3Yc6ddnBe7TZ4lgHOU8Za+iKkorV?=
 =?us-ascii?Q?m+J01Vb3J/JLmoZleI4wq+lweY+ZjcVuuDfb86r2Ofj1+OHf6HwFfc96Oe9e?=
 =?us-ascii?Q?qTzANSW1D52KCbO/ZpW2s6yX8YyuxF15DkppVo5SjHnx8wkgI7vdR3fo3GbF?=
 =?us-ascii?Q?CvFXfAZ+nG0QaKjyqLgk/OwIKFewxYYbVFl9x0LdRYU2fLjBLMRZVCFTb8ij?=
 =?us-ascii?Q?jybnv5bh/q+5+4Kvj+4GDhrl1YhlZa/SP5hk6mv23tJVSoH3XbLc//NFrrPv?=
 =?us-ascii?Q?dHrjK6t77kFxdNbB6BB8//S2KJCMjhojovubefKIsCc+C8yXLNNKZSXiCSr+?=
 =?us-ascii?Q?RYYpsCLgbofQogb1W98QoZDTav+namIEshWKWF02jOKpyr02jFsNMCIgt9mH?=
 =?us-ascii?Q?dQfHs+WS5b7CroTBr53pKh3zPDF/uoNcVMRjBC8TxMaYSVwvmrvJvv2895F0?=
 =?us-ascii?Q?jS6sgxHVUj3pcgYoIBFjS5nk3nboBuhF2j6z2kWZnaM3nUXhjW9jL2yEiMZ5?=
 =?us-ascii?Q?TorL69IZ5gaeslQ+gZO8Jf9RTwprBsHmzMb3sJNiyQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be5d86f-18a5-447d-e24a-08db0be5cd7f
X-MS-Exchange-CrossTenant-AuthSource: TY0PR0101MB4285.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2023 04:09:43.3682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR01MB3877
Received-SPF: pass client-ip=40.92.52.82; envelope-from=taisei1212@outlook.jp;
 helo=APC01-PSA-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_RPBL=1.31,
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


