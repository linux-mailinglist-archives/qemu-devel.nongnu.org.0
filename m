Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CA164F6CF
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 02:50:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6MKG-0007O4-Pl; Fri, 16 Dec 2022 20:49:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1p6MKD-0007NH-A6; Fri, 16 Dec 2022 20:49:18 -0500
Received: from mail-dm6nam10olkn2030.outbound.protection.outlook.com
 ([40.92.41.30] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chaosdefinition@hotmail.com>)
 id 1p6MKA-00026Q-RX; Fri, 16 Dec 2022 20:49:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKs9/zSgvYFPNmnKhiwGd/Y4OHljb9LsmxgkdE4+bZdDrHq2qyz8cTdEulu3OqOriyC+ibJ5iIHPsHEUnmsjHl6CW0sFXRJCl5O34DnkW59Ats8OuTzbk6OpZqoyjTwqo+iNLAo6zNo5ExoE4CIdXaFF0++ksgqdzTCDoLuooF70CvP2GTwD6WJq/Vvmf2BaKakJYNLaTOuCpJ6rRWQU7P6R0ONZWL8eBIA1C8N381WEPvUoKwvmC201R6qJX46wKMY1FiE5pGJa5RJrUb/225MAGm26ha+nGKYqXgshIo//b7NStpEJPq+uF2zPTuBprBhPsLrdMdtJ7wrVQEYGhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEUA4Sc05IVyQdjj4yVvuRyzuqaN2l/0LgETzE2ty4Q=;
 b=NxF6wcAXv8r7TEqcxmCpZj+Z/aOj/lcZDSS0xeYUrupZBWXoy4/7DFRCzQvmIe7I0B9/7ue0fqX7NOmttivHvOnV2h2q/DZIGjV7bTrUCbSvfLXDrXUZgWTzqnefZjhxfr/vJYkGGkjgIpLPrqOHfCbmLsZDiCAKRND5r1wfOlYC96oH3Tf1LBYzGp0+VZZKvjJ13cyEz27FQNbUxki338ylI7uvEfJqCKopoTlZHhOAj7phQbpl0yM2ioaXlfn515blbPcVrtoiVT7AZG+JuEMb5ehnymdgYaICrTmW3Vq6EmgZXj2a4nxfLEFvCVP6hV+lGufOUDc0w2ARj9PdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEUA4Sc05IVyQdjj4yVvuRyzuqaN2l/0LgETzE2ty4Q=;
 b=VBwfzYZDObIU8/iyBch9Aq8DXuX1wykYK/9NAR3KW+c40ZiGy+3vu13zgrHkUner2X9Vdlx40G6TVonN+R3WSbqr4crUgcn3WzGCHFpme3MRfbS08lPzmn1EXaf5nXqvjUYKGvLt11tdWq/UxPNJBPJ2DWoqSSvzCNAJl2W3cICRR/mY809fJBfZiFWQfcd+eTcYC9kPjyOGHvvQ8ZsZ3gBt8x853hINZWIzl/HWrcJyx44RvAtA7pUvRpDvxgwnbGYPR3kKQmsaRcHGaFHgDt2Sua2cCJIBq4w92ycFgUQ9JSkiUbwtSCjmScVKAPvnjxw71vPJ2NeZGmOcmgplww==
Received: from DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) by
 IA1PR12MB7736.namprd12.prod.outlook.com (2603:10b6:208:420::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Sat, 17 Dec
 2022 01:49:08 +0000
Received: from DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a]) by DS7PR12MB6309.namprd12.prod.outlook.com
 ([fe80::6481:82ef:ffb1:4d0a%8]) with mapi id 15.20.5924.011; Sat, 17 Dec 2022
 01:49:08 +0000
From: Zhuojia Shen <chaosdefinition@hotmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Zhuojia Shen <chaosdefinition@hotmail.com>
Subject: [PATCH v3] target/arm: align exposed ID registers with Linux
Date: Fri, 16 Dec 2022 17:01:26 -0800
Message-ID: <DS7PR12MB6309FB585E10772928F14271ACE79@DS7PR12MB6309.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.38.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [sQ7K/pCpTFSj/SDax3l93hP6SfuFoAOF]
X-ClientProxiedBy: SJ0PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::28) To DS7PR12MB6309.namprd12.prod.outlook.com
 (2603:10b6:8:96::19)
X-Microsoft-Original-Message-ID: <20221217010124.302184-1-chaosdefinition@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6309:EE_|IA1PR12MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: 289352d0-d9d8-4014-1590-08dadfd0e30b
X-MS-Exchange-SLBlob-MailProps: znQPCv1HvwUiiHyDbt2zU7zcdMLK3o4WS9IAWdkFOgOD3LTTp9zjDXQmStVBHTzP0+3UYpWXfdhIDN5Sx0B0FyfwGeZY3A0jMIglW+joWUJEAY6QkUi/KSEjNNzHMszX6luZ7AZFbR+z+kaJ+sDWkDcQbzxk1qdAreNvN1ljewq7yPUIy9y+SBrR5GUY4GfQ1L+++EEFK3FPBl+EQd9LeqC0vUyxlOthb8Gbb5tRk/wgjMA5Ye9hP9zYI03TU/3bUCtTcdCWk+zwotq67Y6yAr1AGZOd+BkX+nvxRqW5ZltrMzlB2yQ+p3oVq/3O5FUrwn3WsvemRijX42ScKAtZZs5B5voSXtXMtxR/ZARgMs6MsePA9QoilwvdRYerM/jQ9zIEe5IWcm42opCHcl8A1XlixtGBoAbLqOm8hhdKqJy7G5NeOTK3KaIP7n+GH2vaXgOjZghwzZJWRsPkYjgm7BpHZEbGL7Vz/kfPvgLLInGW0Xdn0LY079n7jhED6DjMbJui58ClO0Zzqlx57kN0OjNUWgmmtzT5xan3rfE8eAvNqJpucljMh46cGlAIDBFFstwHIjttfNinPVeoaUUR8GMSrn32jhEIm8qdVYEufVGcY+l5qmW5pzFIeZ5kVyVOcySNTXsrgfJT6/HUPBe6JIh6tc1FJG/jwknMRWweFcqg94ei9GZ4C0nZq6T59wK3+nAWoMKxmiBVXD+crTrgEZW5dy0yv2gFHtTXgC2vYrboyyh0ePmd1WSKIDb/XGhf+g97oWkeIxs=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dglTgZZvftsdADb8l00vI5wh8CQ3VMRBPcHmu1HRPcOvA0ssuZ7xf/RXoLwTYXIAOplfx0vE9ko8e+LxTd1aib8bXnIJEXYW+B1o0GIvKBcvznBKXlIciR/czik5pp7fnJNhAYw6SYvcISXxLiwz4uDhH+GjBRcld2OJNmHjCn1oRIm5c63Conz5xHMYMUjby8CYHeOgM1IAyo+LYFkgvh3YGUzdHnEkBab/nERCykdCcnverXnJS1i5gDOm6eLRn8CXKWotNYilAaJ7Oc+RWDCwuxUcD3/gnCvdXAn71F2DfLzgTbAR6dNkBLz/art7Cs4GawRkU1Gv68GSp2wy/oXUQOCWqVRyLdLfozO9aujc/KCPZoQzNfwS6dktXKUZxh2L/l2Zwmib4hFKdMvwd1wFCMNrfSLglS1jHwxyYcdEo9QOMwjjeqTVOxeqBw7RQsxUMZjWgnKzZtPGLZknOl7ZoPczVOHpfYJuguwiztFYRBhy01xeAaQMUNJGjOBlf5NRm1M9wH7OJPgnm2QCUDmCBAMbgNUfiUpD3XUaM3NwP2/c2qmItelkRC48LyiQKwJEGH/tJ3+qC+UOsryzU4RT+3oCfFb17P0dWeB0u6MxKMpQZjNOQsF4BOtPLrsjXkouGOwMAGSiZFvh0/5Agw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SHIYH4QeRvhvOtNTgTTMUECWeHMIxS5lsSoFS8g2AVNTc2mV9+gfzH2IuoLv?=
 =?us-ascii?Q?/49nSafiqXD2dcwLx4ciPUgAon4KU2zsTk7uLJQwHXxLJmvKISxZ6+Fj8Qrn?=
 =?us-ascii?Q?VWlRXtMYMp3ERGrKdWVevSY2bQcx8LNnA8b8LEvLxF4oRlh9Z88oCdnPgkxk?=
 =?us-ascii?Q?IYBiTtusv7JTAzT8JLPxSVsBLtBmORnmD1QkEe6kClKLXd0OYn+nDzBCNW/f?=
 =?us-ascii?Q?StbNSSDBlrEku+bEu9PZQsnX7z8f8cID5wxlxD8imS5aa5nbGHElPQvjtuC3?=
 =?us-ascii?Q?vHWfk/zgtTGT5ir4QL/0l0k1hq3W5kDqo/LBVU8Hb0IQ77lixHeeG+aS1o3+?=
 =?us-ascii?Q?sQoFkOZVNi8yh7AzUiqQE96tMNanZ1LdzE0QcT0nDF87g17nD8QJ9uRdLbz5?=
 =?us-ascii?Q?Frrlsx+CJGqadzEBjqdy0rfTq/SgF09kZN8Mng9U+CLgaAzQXG2Y2ROEgfvI?=
 =?us-ascii?Q?/GB6X5S+f3ikBdZWWUulLk3lbCLBJJbWT4Y/87eP9WDuWW3N9+jldwetQ73t?=
 =?us-ascii?Q?eqddjNz7M/om3b9INWKGfv65M/o2m6G/e1fSBL/lQIw8pis+ZWDE5WylLPwl?=
 =?us-ascii?Q?SXySWmwnpGfY9Uonk2MPNLFoqou6ElBciwBnv2QEmwucWfVhme4Wtt0ErPnY?=
 =?us-ascii?Q?MKEhrAccALa5HV+ptGB/kzkqLKlR3JdGvXqZ5PZWb+/SU9H+FQpF80J6Qlsm?=
 =?us-ascii?Q?GZESWQ5A6kU2HEevuPSTeAwcOfn78FDhbIABO1JzvyzO8h3IbrCvrV9g230F?=
 =?us-ascii?Q?/v9mJmkMlnA7e76bcuSW3zt+8s9oK3QlEqsW0D6IXWJBxVst+2q+8nrrIiSc?=
 =?us-ascii?Q?EvMd2zZFSBEKYxQWa5JQ18ML+PQW9X7QiCNWsqIdXGaN1/4wWE8RJOCpNUoU?=
 =?us-ascii?Q?4y6Q671zFH+L24ugIriBRu/oUzzFtUgPsOeXSBmmF3tc/5dq4qkOhtSWxPvg?=
 =?us-ascii?Q?FD0AuAyAOEA7wRfZansBWls/roASpVQE7DEJsxtdVyAK9Y69JFPuQlkAggIJ?=
 =?us-ascii?Q?ivV5P9QheFTzaHlgN99PNqZW4F/tnaNYXMbMj4hnvmUVpkpc+WPmdEWN3cCi?=
 =?us-ascii?Q?plvA989asKjTla1BfPzRTFbAr1n3MQ9GxZXRyR8aQ7LqqotJi4F+9ZPu0HnS?=
 =?us-ascii?Q?+Cqy7UlvOnKNCnCNhd9XLj0frIi61ELWIzZ7ZIi0qQZSxuVrhhsOrO0yvVtO?=
 =?us-ascii?Q?wj629Yy6wgpR7mPw6nD8CTEuCA1AAd/YLkIpP6mlIGQbqtttv1JKH0s5jvi5?=
 =?us-ascii?Q?9TXz0hTtmOYQhxee6FzuYdgdsVOHPgBfEMEVgYzfvi66uMvpel975z+Bb5bD?=
 =?us-ascii?Q?Fbw=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-71ea3.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 289352d0-d9d8-4014-1590-08dadfd0e30b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6309.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2022 01:49:08.5441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7736
Received-SPF: pass client-ip=40.92.41.30;
 envelope-from=chaosdefinition@hotmail.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

In CPUID registers exposed to userspace, some registers were missing
and some fields were not exposed.  This patch aligns exposed ID
registers and their fields with what the upstream kernel currently
exposes.

Specifically, the following new ID registers/fields are exposed to
userspace:

ID_AA64PFR1_EL1.BT:       bits 3-0
ID_AA64PFR1_EL1.MTE:      bits 11-8
ID_AA64PFR1_EL1.SME:      bits 27-24

ID_AA64ZFR0_EL1.SVEver:   bits 3-0
ID_AA64ZFR0_EL1.AES:      bits 7-4
ID_AA64ZFR0_EL1.BitPerm:  bits 19-16
ID_AA64ZFR0_EL1.BF16:     bits 23-20
ID_AA64ZFR0_EL1.SHA3:     bits 35-32
ID_AA64ZFR0_EL1.SM4:      bits 43-40
ID_AA64ZFR0_EL1.I8MM:     bits 47-44
ID_AA64ZFR0_EL1.F32MM:    bits 55-52
ID_AA64ZFR0_EL1.F64MM:    bits 59-56

ID_AA64SMFR0_EL1.F32F32:  bit 32
ID_AA64SMFR0_EL1.B16F32:  bit 34
ID_AA64SMFR0_EL1.F16F32:  bit 35
ID_AA64SMFR0_EL1.I8I32:   bits 39-36
ID_AA64SMFR0_EL1.F64F64:  bit 48
ID_AA64SMFR0_EL1.I16I64:  bits 55-52
ID_AA64SMFR0_EL1.FA64:    bit 63

ID_AA64MMFR0_EL1.ECV:     bits 63-60

ID_AA64MMFR1_EL1.AFP:     bits 47-44

ID_AA64MMFR2_EL1.AT:      bits 35-32

ID_AA64ISAR0_EL1.RNDR:    bits 63-60

ID_AA64ISAR1_EL1.FRINTTS: bits 35-32
ID_AA64ISAR1_EL1.BF16:    bits 47-44
ID_AA64ISAR1_EL1.DGH:     bits 51-48
ID_AA64ISAR1_EL1.I8MM:    bits 55-52

ID_AA64ISAR2_EL1.WFxT:    bits 3-0
ID_AA64ISAR2_EL1.RPRES:   bits 7-4
ID_AA64ISAR2_EL1.GPA3:    bits 11-8
ID_AA64ISAR2_EL1.APA3:    bits 15-12

The code is also refactored to use symbolic names for ID register fields
for better readability and maintainability.

The test case in tests/tcg/aarch64/sysregs.c is also updated to match
the intended behavior.

Signed-off-by: Zhuojia Shen <chaosdefinition@hotmail.com>
---
This incorporates updates to a test case in tests/tcg/aarch64/sysregs.c
and to the Makefile that builds the test (it requires a more recent
-march flag to test id_aa64smfr0_el1), as well as a fix to a bug that
mistakenly exposed some fields in id_aa64mmfr0_el1 which should not be
exposed otherwise, thanks to Peter Maydell <peter.maydell@linaro.org>
for running the test and spotting the error.

 target/arm/helper.c               | 96 +++++++++++++++++++++++++------
 tests/tcg/aarch64/Makefile.target |  7 ++-
 tests/tcg/aarch64/sysregs.c       | 17 ++++--
 3 files changed, 96 insertions(+), 24 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index bac2ea62c4..9feb8789e8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7864,31 +7864,89 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #ifdef CONFIG_USER_ONLY
         static const ARMCPRegUserSpaceInfo v8_user_idregs[] = {
             { .name = "ID_AA64PFR0_EL1",
-              .exported_bits = 0x000f000f00ff0000,
-              .fixed_bits    = 0x0000000000000011 },
+              .exported_bits = R_ID_AA64PFR0_FP_MASK |
+                               R_ID_AA64PFR0_ADVSIMD_MASK |
+                               R_ID_AA64PFR0_SVE_MASK |
+                               R_ID_AA64PFR0_DIT_MASK,
+              .fixed_bits = (0x1u << R_ID_AA64PFR0_EL0_SHIFT) |
+                            (0x1u << R_ID_AA64PFR0_EL1_SHIFT) },
             { .name = "ID_AA64PFR1_EL1",
-              .exported_bits = 0x00000000000000f0 },
+              .exported_bits = R_ID_AA64PFR1_BT_MASK |
+                               R_ID_AA64PFR1_SSBS_MASK |
+                               R_ID_AA64PFR1_MTE_MASK |
+                               R_ID_AA64PFR1_SME_MASK },
             { .name = "ID_AA64PFR*_EL1_RESERVED",
-              .is_glob = true                     },
-            { .name = "ID_AA64ZFR0_EL1"           },
+              .is_glob = true },
+            { .name = "ID_AA64ZFR0_EL1",
+              .exported_bits = R_ID_AA64ZFR0_SVEVER_MASK |
+                               R_ID_AA64ZFR0_AES_MASK |
+                               R_ID_AA64ZFR0_BITPERM_MASK |
+                               R_ID_AA64ZFR0_BFLOAT16_MASK |
+                               R_ID_AA64ZFR0_SHA3_MASK |
+                               R_ID_AA64ZFR0_SM4_MASK |
+                               R_ID_AA64ZFR0_I8MM_MASK |
+                               R_ID_AA64ZFR0_F32MM_MASK |
+                               R_ID_AA64ZFR0_F64MM_MASK },
+            { .name = "ID_AA64SMFR0_EL1",
+              .exported_bits = R_ID_AA64SMFR0_F32F32_MASK |
+                               R_ID_AA64SMFR0_B16F32_MASK |
+                               R_ID_AA64SMFR0_F16F32_MASK |
+                               R_ID_AA64SMFR0_I8I32_MASK |
+                               R_ID_AA64SMFR0_F64F64_MASK |
+                               R_ID_AA64SMFR0_I16I64_MASK |
+                               R_ID_AA64SMFR0_FA64_MASK },
             { .name = "ID_AA64MMFR0_EL1",
-              .fixed_bits    = 0x00000000ff000000 },
-            { .name = "ID_AA64MMFR1_EL1"          },
+              .exported_bits = R_ID_AA64MMFR0_ECV_MASK,
+              .fixed_bits = (0xfu << R_ID_AA64MMFR0_TGRAN64_SHIFT) |
+                            (0xfu << R_ID_AA64MMFR0_TGRAN4_SHIFT) },
+            { .name = "ID_AA64MMFR1_EL1",
+              .exported_bits = R_ID_AA64MMFR1_AFP_MASK },
+            { .name = "ID_AA64MMFR2_EL1",
+              .exported_bits = R_ID_AA64MMFR2_AT_MASK },
             { .name = "ID_AA64MMFR*_EL1_RESERVED",
-              .is_glob = true                     },
+              .is_glob = true },
             { .name = "ID_AA64DFR0_EL1",
-              .fixed_bits    = 0x0000000000000006 },
-            { .name = "ID_AA64DFR1_EL1"           },
+              .fixed_bits = (0x6u << R_ID_AA64DFR0_DEBUGVER_SHIFT) },
+            { .name = "ID_AA64DFR1_EL1" },
             { .name = "ID_AA64DFR*_EL1_RESERVED",
-              .is_glob = true                     },
+              .is_glob = true },
             { .name = "ID_AA64AFR*",
-              .is_glob = true                     },
+              .is_glob = true },
             { .name = "ID_AA64ISAR0_EL1",
-              .exported_bits = 0x00fffffff0fffff0 },
+              .exported_bits = R_ID_AA64ISAR0_AES_MASK |
+                               R_ID_AA64ISAR0_SHA1_MASK |
+                               R_ID_AA64ISAR0_SHA2_MASK |
+                               R_ID_AA64ISAR0_CRC32_MASK |
+                               R_ID_AA64ISAR0_ATOMIC_MASK |
+                               R_ID_AA64ISAR0_RDM_MASK |
+                               R_ID_AA64ISAR0_SHA3_MASK |
+                               R_ID_AA64ISAR0_SM3_MASK |
+                               R_ID_AA64ISAR0_SM4_MASK |
+                               R_ID_AA64ISAR0_DP_MASK |
+                               R_ID_AA64ISAR0_FHM_MASK |
+                               R_ID_AA64ISAR0_TS_MASK |
+                               R_ID_AA64ISAR0_RNDR_MASK },
             { .name = "ID_AA64ISAR1_EL1",
-              .exported_bits = 0x000000f0ffffffff },
+              .exported_bits = R_ID_AA64ISAR1_DPB_MASK |
+                               R_ID_AA64ISAR1_APA_MASK |
+                               R_ID_AA64ISAR1_API_MASK |
+                               R_ID_AA64ISAR1_JSCVT_MASK |
+                               R_ID_AA64ISAR1_FCMA_MASK |
+                               R_ID_AA64ISAR1_LRCPC_MASK |
+                               R_ID_AA64ISAR1_GPA_MASK |
+                               R_ID_AA64ISAR1_GPI_MASK |
+                               R_ID_AA64ISAR1_FRINTTS_MASK |
+                               R_ID_AA64ISAR1_SB_MASK |
+                               R_ID_AA64ISAR1_BF16_MASK |
+                               R_ID_AA64ISAR1_DGH_MASK |
+                               R_ID_AA64ISAR1_I8MM_MASK },
+            { .name = "ID_AA64ISAR2_EL1",
+              .exported_bits = R_ID_AA64ISAR2_WFXT_MASK |
+                               R_ID_AA64ISAR2_RPRES_MASK |
+                               R_ID_AA64ISAR2_GPA3_MASK |
+                               R_ID_AA64ISAR2_APA3_MASK },
             { .name = "ID_AA64ISAR*_EL1_RESERVED",
-              .is_glob = true                     },
+              .is_glob = true },
         };
         modify_arm_cp_regs(v8_idregs, v8_user_idregs);
 #endif
@@ -8206,8 +8264,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 #ifdef CONFIG_USER_ONLY
         static const ARMCPRegUserSpaceInfo id_v8_user_midr_cp_reginfo[] = {
             { .name = "MIDR_EL1",
-              .exported_bits = 0x00000000ffffffff },
-            { .name = "REVIDR_EL1"                },
+              .exported_bits = R_MIDR_EL1_REVISION_MASK |
+                               R_MIDR_EL1_PARTNUM_MASK |
+                               R_MIDR_EL1_ARCHITECTURE_MASK |
+                               R_MIDR_EL1_VARIANT_MASK |
+                               R_MIDR_EL1_IMPLEMENTER_MASK },
+            { .name = "REVIDR_EL1" },
         };
         modify_arm_cp_regs(id_v8_midr_cp_reginfo, id_v8_user_midr_cp_reginfo);
 #endif
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index fc8d90ed69..db122ab4ff 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -23,7 +23,8 @@ config-cc.mak: Makefile
 	    $(call cc-option,-march=armv8.1-a+sve2,         CROSS_CC_HAS_SVE2); \
 	    $(call cc-option,-march=armv8.3-a,              CROSS_CC_HAS_ARMV8_3); \
 	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
-	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE)) 3> config-cc.mak
+	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE); \
+	    $(call cc-option,-march=armv9-a+sme,            CROSS_CC_HAS_ARMV9_SME)) 3> config-cc.mak
 -include config-cc.mak
 
 # Pauth Tests
@@ -53,7 +54,11 @@ endif
 ifneq ($(CROSS_CC_HAS_SVE),)
 # System Registers Tests
 AARCH64_TESTS += sysregs
+ifneq ($(CROSS_CC_HAS_ARMV9_SME),)
+sysregs: CFLAGS+=-march=armv9-a+sme -DHAS_ARMV9_SME
+else
 sysregs: CFLAGS+=-march=armv8.1-a+sve
+endif
 
 # SVE ioctl test
 AARCH64_TESTS += sve-ioctls
diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
index 40cf8d2877..7d9b0168da 100644
--- a/tests/tcg/aarch64/sysregs.c
+++ b/tests/tcg/aarch64/sysregs.c
@@ -112,18 +112,23 @@ int main(void)
      * minimum valid fields - for the purposes of this check allowed
      * to have non-zero values.
      */
-    get_cpu_reg_check_mask(id_aa64isar0_el1, _m(00ff,ffff,f0ff,fff0));
-    get_cpu_reg_check_mask(id_aa64isar1_el1, _m(0000,00f0,ffff,ffff));
+    get_cpu_reg_check_mask(id_aa64isar0_el1, _m(f0ff,ffff,f0ff,fff0));
+    get_cpu_reg_check_mask(id_aa64isar1_el1, _m(00ff,f0ff,ffff,ffff));
+    get_cpu_reg_check_mask(id_aa64isar2_el1, _m(0000,0000,0000,ffff));
     /* TGran4 & TGran64 as pegged to -1 */
-    get_cpu_reg_check_mask(id_aa64mmfr0_el1, _m(0000,0000,ff00,0000));
-    get_cpu_reg_check_zero(id_aa64mmfr1_el1);
+    get_cpu_reg_check_mask(id_aa64mmfr0_el1, _m(f000,0000,ff00,0000));
+    get_cpu_reg_check_mask(id_aa64mmfr1_el1, _m(0000,f000,0000,0000));
+    get_cpu_reg_check_mask(id_aa64mmfr2_el1, _m(0000,000f,0000,0000));
     /* EL1/EL0 reported as AA64 only */
     get_cpu_reg_check_mask(id_aa64pfr0_el1,  _m(000f,000f,00ff,0011));
-    get_cpu_reg_check_mask(id_aa64pfr1_el1,  _m(0000,0000,0000,00f0));
+    get_cpu_reg_check_mask(id_aa64pfr1_el1,  _m(0000,0000,0f00,0fff));
     /* all hidden, DebugVer fixed to 0x6 (ARMv8 debug architecture) */
     get_cpu_reg_check_mask(id_aa64dfr0_el1,  _m(0000,0000,0000,0006));
     get_cpu_reg_check_zero(id_aa64dfr1_el1);
-    get_cpu_reg_check_zero(id_aa64zfr0_el1);
+    get_cpu_reg_check_mask(id_aa64zfr0_el1,  _m(0ff0,ff0f,00ff,00ff));
+#ifdef HAS_ARMV9_SME
+    get_cpu_reg_check_mask(id_aa64smfr0_el1, _m(80f1,00fd,0000,0000));
+#endif
 
     get_cpu_reg_check_zero(id_aa64afr0_el1);
     get_cpu_reg_check_zero(id_aa64afr1_el1);
-- 
2.38.1


