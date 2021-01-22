Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7EC30090C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 17:52:53 +0100 (CET)
Received: from localhost ([::1]:46764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2zg4-00009Q-Ow
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 11:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1l2zep-000849-AG
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:51:35 -0500
Received: from mail-dm6nam10on2055.outbound.protection.outlook.com
 ([40.107.93.55]:56769 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1l2zem-00006q-Rn
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 11:51:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSUc7q4z1/Eqz2VWlYXQR8j/C0g6jDrduag9PC3A1hRAohvK5oI0f5Yqgzn+IT3FxBVAiSJ759QMelS1OEedbyu1SSR2qADP8fDyX23JZoBqHExjf7CsZVb9IqXUEB4KvJhtIT8ansZlbJacMIUy1X7KcQJBS8tHR1sObVRORRVG+OwEUKDwrjA0kqXsHDj+dZ8DVDLBHMoFpvxC1B971qU3bAkSOVGtYzAywkYqOBtnyvYv3nK4LgQ6QzLVPdUUA4iYUJAsMhd+vi4DoilSGlvJOMSyVKSOnFKyKoyj2t6XKV2qQ2QWZlnKeDl138myn3eZqtCRk5GZ2VkEpqJfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdC/GcyxAmm9y26RBf6AiNrHPISFZB+7bYeOblkLgP4=;
 b=JLCOdf7ao3pfQ43m6QL1PFSaw0JGZNPDSOOHUwXDjYc44BQYDAPVvA0KuPKg95UlIwEgF+lNrzxIhcD/iE/hkI4xqJpRhgSFDtSVrisrULOPxJXmmxuAsLLqMvRfAV/BYNl5AZRLeuEJk4ilaNxKaHJdlWPocb9C5HvGsBnT5pmHD+sHMgxPPhZ/6sMPTUK0HC9/G39gaFJBgS0FPnbrv4wrbN8vLXEtkkHNj7YN3mPoAjvwH7GS65GM1/biJJkGDxT/4ZENggfCYSUmCWrBeHocRm9TJthFSp2j6T5X61zqKO9+1Ca+w67If3xsQ0d/D5brCFT1WL9F22mYeN+3fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bdC/GcyxAmm9y26RBf6AiNrHPISFZB+7bYeOblkLgP4=;
 b=FghHxnM023N0N5cHS3p0UDMbw3BVEytjz80sZNSVUIGxwEufCf6RuN+BVxIdkZzEZ/tXXpczYxwOPeFzjbm5Cqbs3CBg7kMFcCGEfEEi5kiqPaNwqhZjUZZmYvzw7jHfGhJ5fazl56NfTCEC8xJQxp7Xqvtb8Zezrm+5GAoDspc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SN1PR12MB2589.namprd12.prod.outlook.com (2603:10b6:802:2c::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.13; Fri, 22 Jan
 2021 16:36:28 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3784.012; Fri, 22 Jan 2021
 16:36:28 +0000
Subject: [PATCH] i386: Add the support for AMD EPYC 3rd generation processors
From: Babu Moger <babu.moger@amd.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com
Date: Fri, 22 Jan 2021 10:36:27 -0600
Message-ID: <161133338780.27536.17735339269843944966.stgit@bmoger-ubuntu>
User-Agent: StGit/0.17.1-dirty
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0201CA0054.namprd02.prod.outlook.com
 (2603:10b6:803:20::16) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [127.0.1.1] (165.204.77.1) by
 SN4PR0201CA0054.namprd02.prod.outlook.com (2603:10b6:803:20::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Fri, 22 Jan 2021 16:36:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 518d1cbf-fff7-4f83-7fa4-08d8bef3de26
X-MS-TrafficTypeDiagnostic: SN1PR12MB2589:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB258976FD89823B89CDCB9E1795A00@SN1PR12MB2589.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGTeXX7x62ZPnyEo2vRHYGBRuWltk2jJoTDMNDTvjb8cZ+A+FRQsBYUuaCgVKbcACLvfQMWGt5/e2d3o9kionmOCFHxYO3VEzvUFQFED2fahwS7BCmMTz1oBYijS4FP4pQiqz59vehK8zyrbUfD8OkYF8aGpJsOR6RsAolp+O2c7ur7pqrDdHRGTUFOnSsbE9bS1scoHQ3eTiKcHbStBwoiJSK2SyDNiXZMRrRUS5bE714EjWlD7obgtMdUxGKpGPobrilktO+TkAtxGkSsRn5yPmaUVFHFElpLs30eB77KoGAzdkA71bo7/k8Q9qqln48X2GLnTU/MTYqDCd+q39zStpYxNPyBJBtng0W03KTdA2X5pjPEpJM3hCsmVL2cDgW7kXIpZX9pqadD66p37pA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(66946007)(83380400001)(5660300002)(33716001)(6486002)(2906002)(44832011)(4326008)(956004)(316002)(66476007)(8676002)(9686003)(66556008)(478600001)(8936002)(16526019)(103116003)(16576012)(86362001)(52116002)(26005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NkpZWnBPRU10cHZEWXpJb0RhVk1yaXllTE9xbDI2ZkRiQlpxREtodmZkQ1Zr?=
 =?utf-8?B?WWdFblhqdnFMTStPZVNlaEJObVpwbHp3bTRqcjdkeTc3Ym01Tm9kTXlESzlN?=
 =?utf-8?B?U1N2TU9WbVdLY0FyekRxb0NZbFlQTlh3MnU1TXB5QVM1endIWjVuUTBUanpk?=
 =?utf-8?B?WG1nUFBtSGtlM1NhU2JibzVDeWVZU0FNVWRHam1vcm41Qmh2azlFSmdCUDlF?=
 =?utf-8?B?dk5WakZ6MGcvcGJxM3ZnWFM1RFBwOEF0SE1QWlBMQUZEU1JIcXR1ZHY1dEtK?=
 =?utf-8?B?SWp3N0dFQnZQZlAvM1d0NEhLcVRoK2p2M1V0WlE2VU9RQlYwRmx5ZnQrUFR3?=
 =?utf-8?B?LzZUeFlVeERKd2NVUlNDUTg5TEtaVGlmS2JyTE9KR2p4a2ZZNmpJamEveUVu?=
 =?utf-8?B?RnI0eFlEU2UxUmJZa0JnN1JqcCtnRXpNK05iK2R5RldSQ1B6Slh0b1dsaVhE?=
 =?utf-8?B?ZUtqTG5YVDhmNitsQURWOWErMmRHK0dZQytoY2tmOWxoU0ovcGxGbFpWT3do?=
 =?utf-8?B?bWhtYzZyTEVRT0FBZlk1TXN6Ri9UN0hld1JhSWNreEl0YkhXNURUZUMyUTJw?=
 =?utf-8?B?N3FxYk1WTDlJcFpPSFl1MjhQcFI4N3FRWmNsUkZDQlpnbEJMRHlNNVF6UDBV?=
 =?utf-8?B?TWl0VWJYb0J2OWg2Y0FjR21kbUw2WkRWeHpualMxeFNhTDl3ZURKUTA4Qjhw?=
 =?utf-8?B?NlcxcTdtelBvcGpsbnhxbUFhamN4UmVmYXRtMDljbFMzWi9GSDBpTWNQVU84?=
 =?utf-8?B?VE1yUTVhZktyYjlKekNmeHg2ZmpreTM5TWlpTE5DK0xOSUhYVTZJVHNpSWVw?=
 =?utf-8?B?REVTaVFJSzE1WHl6TlZENnk2ZDg4djNPK0trZm9XcG5RK2hRd05UcEQyUy9k?=
 =?utf-8?B?VVFsUCszSzdtWWh4YjJ4SFpTZ09IcVY0RERhWmRJc3JjZ1E0Rmt6VW5VdWZz?=
 =?utf-8?B?SU01U0UzdkllcnZ1NE5WQ3JIODdtSlFHaWpobTFIZ3FIampMUTM3anNFeXQy?=
 =?utf-8?B?R0FaSTIyMmM1clV3cEF2Yk1MdGk2Y1V5akgwRDJ0dHpxMlN1aFoxSDhzbm5U?=
 =?utf-8?B?RGE1TDBXNHNZZEY4WWFKbThPRHZxL1VveUc1dm5xM09GZ0ZrZzNJYlNjODFV?=
 =?utf-8?B?MDNrVDJVR1BMdWFUUkFtQ0tERUIweUdMY1cxSzhNb1NYOU9UNnhneDdHZERZ?=
 =?utf-8?B?Y2E3ZGw5SGx4ME5TL2pDZS9hU1Bqc0lDQzBwRmpaNHNUK0hQMjlpMEhzM0U2?=
 =?utf-8?B?dUNNeDRVN080OW1NTDR4T0p4NUIxb0FCUHVXaDhwNjc5TFUrMVVlNkZJN29t?=
 =?utf-8?Q?H3vFEHUAJegraHBH87H6i5wivk0tkejkqd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518d1cbf-fff7-4f83-7fa4-08d8bef3de26
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 16:36:28.8249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PAjs7I0xgpSXM91zAwiy8MPuQHKfzomIMnYAw3gmGYO+dEmrJSw1VU8dc9QK6Gz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2589
Received-SPF: softfail client-ip=40.107.93.55; envelope-from=Babu.Moger@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: babu.moger@amd.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds the support for AMD 3rd generation processors. The model
display for the new processor will be EPYC-Milan.

Adds the following new feature bits on top of the feature bits from
the first and second generation EPYC models.

pcid    : Process context identifiers support
ibrs    : Indirect Branch Restricted Speculation
ssbd    : Speculative Store Bypass Disable
erms    : Enhanced REP MOVSB/STOSB support
fsrm    : Fast Short REP MOVSB support
invpcid : Invalidate processor context ID
pku     : Protection keys support

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
 target/i386/cpu.c |  105 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h |    4 ++
 2 files changed, 109 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35459a38bb..666995bb42 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1798,6 +1798,56 @@ static CPUCaches epyc_rome_cache_info = {
     },
 };
 
+static CPUCaches epyc_milan_cache_info = {
+    .l1d_cache = &(CPUCacheInfo) {
+        .type = DATA_CACHE,
+        .level = 1,
+        .size = 32 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 64,
+        .lines_per_tag = 1,
+        .self_init = 1,
+        .no_invd_sharing = true,
+    },
+    .l1i_cache = &(CPUCacheInfo) {
+        .type = INSTRUCTION_CACHE,
+        .level = 1,
+        .size = 32 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 64,
+        .lines_per_tag = 1,
+        .self_init = 1,
+        .no_invd_sharing = true,
+    },
+    .l2_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 2,
+        .size = 512 * KiB,
+        .line_size = 64,
+        .associativity = 8,
+        .partitions = 1,
+        .sets = 1024,
+        .lines_per_tag = 1,
+    },
+    .l3_cache = &(CPUCacheInfo) {
+        .type = UNIFIED_CACHE,
+        .level = 3,
+        .size = 32 * MiB,
+        .line_size = 64,
+        .associativity = 16,
+        .partitions = 1,
+        .sets = 32768,
+        .lines_per_tag = 1,
+        .self_init = true,
+        .inclusive = true,
+        .complex_indexing = true,
+    },
+};
+
 /* The following VMX features are not supported by KVM and are left out in the
  * CPU definitions:
  *
@@ -4130,6 +4180,61 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .model_id = "AMD EPYC-Rome Processor",
         .cache_info = &epyc_rome_cache_info,
     },
+    {
+        .name = "EPYC-Milan",
+        .level = 0xd,
+        .vendor = CPUID_VENDOR_AMD,
+        .family = 25,
+        .model = 1,
+        .stepping = 1,
+        .features[FEAT_1_EDX] =
+            CPUID_SSE2 | CPUID_SSE | CPUID_FXSR | CPUID_MMX | CPUID_CLFLUSH |
+            CPUID_PSE36 | CPUID_PAT | CPUID_CMOV | CPUID_MCA | CPUID_PGE |
+            CPUID_MTRR | CPUID_SEP | CPUID_APIC | CPUID_CX8 | CPUID_MCE |
+            CPUID_PAE | CPUID_MSR | CPUID_TSC | CPUID_PSE | CPUID_DE |
+            CPUID_VME | CPUID_FP87,
+        .features[FEAT_1_ECX] =
+            CPUID_EXT_RDRAND | CPUID_EXT_F16C | CPUID_EXT_AVX |
+            CPUID_EXT_XSAVE | CPUID_EXT_AES |  CPUID_EXT_POPCNT |
+            CPUID_EXT_MOVBE | CPUID_EXT_SSE42 | CPUID_EXT_SSE41 |
+            CPUID_EXT_CX16 | CPUID_EXT_FMA | CPUID_EXT_SSSE3 |
+            CPUID_EXT_MONITOR | CPUID_EXT_PCLMULQDQ | CPUID_EXT_SSE3 |
+            CPUID_EXT_PCID,
+        .features[FEAT_8000_0001_EDX] =
+            CPUID_EXT2_LM | CPUID_EXT2_RDTSCP | CPUID_EXT2_PDPE1GB |
+            CPUID_EXT2_FFXSR | CPUID_EXT2_MMXEXT | CPUID_EXT2_NX |
+            CPUID_EXT2_SYSCALL,
+        .features[FEAT_8000_0001_ECX] =
+            CPUID_EXT3_OSVW | CPUID_EXT3_3DNOWPREFETCH |
+            CPUID_EXT3_MISALIGNSSE | CPUID_EXT3_SSE4A | CPUID_EXT3_ABM |
+            CPUID_EXT3_CR8LEG | CPUID_EXT3_SVM | CPUID_EXT3_LAHF_LM |
+            CPUID_EXT3_TOPOEXT | CPUID_EXT3_PERFCORE,
+        .features[FEAT_8000_0008_EBX] =
+            CPUID_8000_0008_EBX_CLZERO | CPUID_8000_0008_EBX_XSAVEERPTR |
+            CPUID_8000_0008_EBX_WBNOINVD | CPUID_8000_0008_EBX_IBPB |
+            CPUID_8000_0008_EBX_IBRS | CPUID_8000_0008_EBX_STIBP |
+            CPUID_8000_0008_EBX_AMD_SSBD,
+        .features[FEAT_7_0_EBX] =
+            CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
+            CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |
+            CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT |
+            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_ERMS |
+            CPUID_7_0_EBX_INVPCID,
+        .features[FEAT_7_0_ECX] =
+            CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_PKU,
+        .features[FEAT_7_0_EDX] =
+            CPUID_7_0_EDX_FSRM,
+        .features[FEAT_XSAVE] =
+            CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
+            CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES,
+        .features[FEAT_6_EAX] =
+            CPUID_6_EAX_ARAT,
+        .features[FEAT_SVM] =
+            CPUID_SVM_NPT | CPUID_SVM_NRIPSAVE,
+        .xlevel = 0x8000001E,
+        .model_id = "AMD EPYC-Milan Processor",
+        .cache_info = &epyc_milan_cache_info,
+    },
 };
 
 /* KVM-specific features that are automatically added/removed
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d23a5b340a..3bc210863a 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -808,8 +808,12 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
 #define CPUID_8000_0008_EBX_WBNOINVD    (1U << 9)
 /* Indirect Branch Prediction Barrier */
 #define CPUID_8000_0008_EBX_IBPB        (1U << 12)
+/* Indirect Branch Restricted Speculation */
+#define CPUID_8000_0008_EBX_IBRS        (1U << 14)
 /* Single Thread Indirect Branch Predictors */
 #define CPUID_8000_0008_EBX_STIBP       (1U << 15)
+/* Speculative Store Bypass Disable */
+#define CPUID_8000_0008_EBX_AMD_SSBD    (1U << 24)
 
 #define CPUID_XSAVE_XSAVEOPT   (1U << 0)
 #define CPUID_XSAVE_XSAVEC     (1U << 1)


