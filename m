Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40B06C5788
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 21:28:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf52L-0001cv-Lj; Wed, 22 Mar 2023 16:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf52I-0001bI-LT; Wed, 22 Mar 2023 16:26:18 -0400
Received: from mail-dm6nam10on20714.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::714]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aaron@os.amperecomputing.com>)
 id 1pf52G-0004y6-LI; Wed, 22 Mar 2023 16:26:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W13wJokKe5kKubJc1QCatZzEeprlJQpZ1pqGyRROsZmRGD2LNRluty9QdF7uSfcAbNTncCcJKBBL8Hov6nKoCXDUaPrVbxxiQZNM3Q98A4T+J2d2txKR01bfHFMzb+MoJKXeBwbs2I++4Xnm+uCoPhKCDf51oba8/7hLtheyuf5GR9vQnVgFDJW/YuHsPEzUo4nSco3enrmCl0UyLzX/Xb/9iVzkYI2nTBBJb0E4hGwB0oiFTLyKPNsc2PrvzyVf5pxHx64pdGFSmRJw/Sw5mqJAHM1pozXCNVAfpVKVM0LSs5bWSI5UNzq+nXlFgTwIwEgPYbmxwfGAeYLLDWJ1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjMpdvpZf2EKvduNMnVcLvrq5EToUqvotgBHgsD+Aos=;
 b=OEYTRINjAul62AiQkeKWob5gl/FUxoZxxHteNnAisHbrHp2XjhYIqna9/Tk89v/nOAhUq1znjUYk9OpZTQynyAeve05rRoEsstIXd0M19Siuyp6j9cIcy7a90k25rQ+WLNXSei94G+JzR4aiM0c8j6Hpx6mhVdinb7hZuGOyhbIyB5icaJ/8pJDmWKO3LpdYqTU6EXMEBoZBW0oHqSBoXLrTHDjXf/cIOSExyz25iiCkbjsC6RA0tgNGf/XrK9gibNr1nh1HFMqCjgnDmWUBLnm3ORty/LlosMJzz19gXGWfb0f64ecS9nG80DPILlHtgCX0YYj9F8OKM9OuTisA5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjMpdvpZf2EKvduNMnVcLvrq5EToUqvotgBHgsD+Aos=;
 b=ur0o0IWDVgjnwnGR0gJX62KMmBFafl4bRaThMptJ/1XFmt5wUV564tHrKmAwzjU+PEo3OxfO7JG/Ox4MtQ//1G9yNxegJk0Vkfa7VXlZhVaLVGjzOrnIaNQ2b4NPjJFFIImsv6lQdYX5th5Udl9g4PsvmIW1QriWXRdLT4tNInI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB7124.prod.exchangelabs.com (2603:10b6:610:f3::20) by
 SN6PR0102MB3406.prod.exchangelabs.com (2603:10b6:805:7::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.26; Wed, 22 Mar 2023 20:26:11 +0000
Received: from CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c]) by CH0PR01MB7124.prod.exchangelabs.com
 ([fe80::cf62:d511:8228:b39c%8]) with mapi id 15.20.6222.010; Wed, 22 Mar 2023
 20:26:11 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Dehors <vincent.dehors@smile.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
Subject: [PATCH v3 1/8] target/arm: Add ID_AA64ISAR2_EL1
Date: Wed, 22 Mar 2023 16:25:34 -0400
Message-Id: <20230322202541.1404058-2-aaron@os.amperecomputing.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:610:59::18) To CH0PR01MB7124.prod.exchangelabs.com
 (2603:10b6:610:f3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB7124:EE_|SN6PR0102MB3406:EE_
X-MS-Office365-Filtering-Correlation-Id: aac51025-5554-4202-5035-08db2b13ad4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5v9nlYvbg7qFXKAIb96U4ibMk/zRTerxf3DyxljpXrtZgsvzrvB8wVCNqXt82a81lMGwcFFugDunbLTlANY4VUNGko798nwBp/Cyo0LSJPAziPUC81wVbDi9zwP63nh3P/5IrlYopWYKxwcqwaSgRDtPwOFiElygszdJf5FlNQxav3JHplHXDqL8Hv4N3d8GNB0p1Gd91A+oY/eFjSp/70Yz2QrjJtTSBdG4e/qUd0im82EQsXC4jnVEtyr03PXYhNVmf0xI0UxtqzrNZielYhoM4ozu3geup60HJBzhmpC+IYd7sU4FrtzQvtpwtgloAZFxWqi3u2Ct1t3BUBlFEDWWNxPwIoLyNohf03ZQiI9GRgG1DyxGt0qmjCDNx9eo/6Rvw8UY4DLlcUsETXZj+Q01ipiG54O1G9tvy8NomE4QSlmuYU0Nm/kuCWhbpQh5qYwApnk5ylBG0J2nzsUVFoGZ8USu6IzOAWuOKNTLLjZhhijzCggAB2hOxn7Ers7AZgsIKMKIU/OMxvU5S9jxI3wTVtSPptWK2n0ynLpqHk20C9buHm2qzSPY0aaI4sUrhzXPFRPI0ZqUhp/ZoD+5k91MkJMA4oUSCLoOfsEeqDlWwQzCqAiEFVX5hwYN4o+moivRBHkdqgBSjnMjSqeKA1ds/D3hgkPNCW8K0L6XW1fT4MAu+o736vMD/REO3I93C70WtScUP0C1ChJRcjkeUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR01MB7124.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(39850400004)(346002)(136003)(396003)(451199018)(66476007)(316002)(1076003)(6486002)(186003)(4326008)(41300700001)(5660300002)(83380400001)(8676002)(66556008)(8936002)(2616005)(6666004)(6512007)(86362001)(110136005)(52116002)(26005)(107886003)(478600001)(66946007)(6506007)(2906002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wg/vlHplJRld7fr/y2AuAwPhXHjuEnPzRuL15YDtK1mz4UIM3hPtHfk/R+LU?=
 =?us-ascii?Q?g9MEC3qIL4eYr82/ioOd1aLZcfcXwH1u5koMdqDji1xN3kJajcu83RtW6AvU?=
 =?us-ascii?Q?/Oyve9Xt+19nuCJTZLAcH3SeCaKgyq3wUNNyuEODP8kNzqq0tMhYXcDbiiXL?=
 =?us-ascii?Q?c9cokMofA90IfnZkZko8pLKjusTkvEn2tJGVcIFfUaUp/YDZMOH5eunSjsqM?=
 =?us-ascii?Q?Fz+XM/ejtgZflGEfhcgmyoo05q8iv543ANQn0a+0/vYMOucXYfKi1Kof0unm?=
 =?us-ascii?Q?xQ7v2g18vUuzk2IvtYpxLLl+NtJY0c9B8p2Qv9T6wrs/vbPXG0WrIhEwyDxh?=
 =?us-ascii?Q?0Xf1MTDYFbnvDfpSP+H9pEuVDr2iHA9fDnF4AVeEFn+Xbw4j1HJtPN0wQ8sH?=
 =?us-ascii?Q?bIt9SFwCknPdgXh3JVggjDTCcJ/uFpBh6xBv4T+fa7tg+juOz0BvV50H0om1?=
 =?us-ascii?Q?U5YPBWVzDxDHqdjzr8/k4s0c7lrML2pzHAzpvOEVOom9aYT6i8fFFhFjpY8y?=
 =?us-ascii?Q?cHeGcfA7xLfeNaGHMjTy8ga9xXml4DQqqssXf9g3KWt/1jRN7Cpsy4p8R5i3?=
 =?us-ascii?Q?ItwXTeIqgU+xDgyEu0LHsFzUJyWhonjqssccxR1f7qyrmTlQGK5+41lUceXY?=
 =?us-ascii?Q?/EZh3P4PLTB59M/NGXqAOGWn8qQZfxIB4gjfKtsepnEkhPEh3ONeDIAaYDFR?=
 =?us-ascii?Q?lHF09KixMGfyysj38U7eRAQwyqp7P5rUzKAuGSRKLZjBMI/fxOaAvO3N80J6?=
 =?us-ascii?Q?FeVaRxMOKoCY0yLpdaW/dGNl8jxOrcKoUdEG5fsYXk23b1HC/LLEMpa/Ggjj?=
 =?us-ascii?Q?TgBtOXkq2als9RmvuzTdIujvJEPeoY2MfeEnoXYXeo7YrlMoej4ctAgpLljc?=
 =?us-ascii?Q?Fyt743U4fmDeC1KuAKt6Xlx3SER25OopTdcyWdeK485cUJxfLNw8OT8beccU?=
 =?us-ascii?Q?RJifVYY/m9bfl0VO2nunHAv+rfOB/z77uUxYsrMNbaXXphUN3IUR/rjWdxoW?=
 =?us-ascii?Q?CNw5e2zkYYAgG1Dh/YcwbGckhLxIXpLzyPTzA3p9hCbVgzH3vWvQWv9HJxEE?=
 =?us-ascii?Q?N261f/g28JhXn8ifnEbt196uZ40gSKGQ7opnROGySdKg5onBwX9hX68B8gEq?=
 =?us-ascii?Q?YIL7HBtEfViSoLOmH3YHdoq1RSFuCaCyAmh77DGK21c5oDJOFaX9iu1xUwpH?=
 =?us-ascii?Q?8FYsQmGAss83jjWzE8/jJN2zE8WsY5rljq9UB9w+CEaxM7O/eimzbw5CoErk?=
 =?us-ascii?Q?YkWJu+3okghI38c+ehKCsy9xwy4ywpj46PBxxiMa5CwWh0E66PhoMmLn2drB?=
 =?us-ascii?Q?gaZFSXywMBIPYVPc46hFGkg0gH0ceWy6aH3PEtumF7lvCtthgneNiFR0KNkd?=
 =?us-ascii?Q?0AgU5/QYI0CYUQ6gFJ1kk7l/AKKhe2ryQNtY5Lb4ZDdmn9X4nmZ+VOo6kyg7?=
 =?us-ascii?Q?UcvbVCoPhHJsmMuUpm1QxEWjG2dtkIBNknId09912GiBrGooiBMpHAVEOhQ7?=
 =?us-ascii?Q?ZHJ1c2NWtdy1wBmwlUqkeJ9OjshoySAeDrknClV6zTNdSKqV/214SFfvXSmW?=
 =?us-ascii?Q?9lqAxoFeUeuvuma1N9z+8POzK8dA712LAorFkS+uaSgZFoOPF7Ym1z7IvvRL?=
 =?us-ascii?Q?eUlsxw1uDZexeADDpOwbG9o=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac51025-5554-4202-5035-08db2b13ad4e
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB7124.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 20:26:11.6464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iN6KjH4weaQnssMrJwl0mXujdkfCS15YUMPfhSRnzLsl9jOCebgYlrqm0zFPOttGjOI3oe9kupsAp41Fyv3+0Eo55K5XQdJ9ykIIuZzG6YbTdWkQyB15I0fglq4PBQZk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR0102MB3406
Received-SPF: pass client-ip=2a01:111:f400:7e88::714;
 envelope-from=aaron@os.amperecomputing.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001,
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

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/cpu.h     | 1 +
 target/arm/helper.c  | 4 ++--
 target/arm/hvf/hvf.c | 1 +
 target/arm/kvm64.c   | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c097cae988..f0f27f259d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1015,6 +1015,7 @@ struct ArchCPU {
         uint32_t dbgdevid1;
         uint64_t id_aa64isar0;
         uint64_t id_aa64isar1;
+        uint64_t id_aa64isar2;
         uint64_t id_aa64pfr0;
         uint64_t id_aa64pfr1;
         uint64_t id_aa64mmfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2297626bfb..32426495c0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8204,11 +8204,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = cpu->isar.id_aa64isar1 },
-            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = cpu->isar.id_aa64isar2 },
             { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ad65603445..4d7366b761 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -507,6 +507,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
         { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
         { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
+        { HV_SYS_REG_ID_AA64ISAR2_EL1, &host_isar.id_aa64isar2 },
         { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
         { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
         { HV_SYS_REG_ID_AA64MMFR2_EL1, &host_isar.id_aa64mmfr2 },
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 1197253d12..4b71306f92 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -590,6 +590,8 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 6, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
                               ARM64_SYS_REG(3, 0, 0, 6, 1));
+        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar2,
+                              ARM64_SYS_REG(3, 0, 0, 6, 2));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
                               ARM64_SYS_REG(3, 0, 0, 7, 0));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr1,
-- 
2.25.1


