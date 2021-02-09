Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D9D315878
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 22:21:37 +0100 (CET)
Received: from localhost ([::1]:42600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9aS0-0002SY-5K
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 16:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1l9aPk-0001dJ-1D
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:19:16 -0500
Received: from mail-bn7nam10on2078.outbound.protection.outlook.com
 ([40.107.92.78]:4145 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1l9aPg-0005Xk-20
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:19:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVy+84NZhT2NdlMdGPIQicGKiEvAEP/RRIajbJ2mcvW3flzLR+LtMX2S0bWS+sw+9foTWF57kfFVwQvwAt5NRtUA2fCGdKOakUtY4GKxDGaVBCub45Pr/s7+tlAwvcGaOxbSp05ABvfesVuAcDsM8EM2XQjyQ7sDYy4+o4SdYliKgrKmdrfkLTw/3PYgrN8zQ6fRmlwCqyiglW76h7wjfU2ghDEpRtzUk9YDvrUdmeZDS29/AvvO+n5NFPCB046ST2ylsgbWS+9Li8oOwsDI3JYseSmt4WM7GKvh7vaZctksLvsQl22Z6f4nZvil8eQsHaSPpkNadd4t+KXcl43/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA86tFUjLG1w8wSA+0aA/mJ9oKSbd6ivsNcpV2Q9TuA=;
 b=TS7ZAE3C3VfBHm6Fxx+OCguXVQF8Hnn1B4ESVwpVohPKdTBAKLx5gZA5kPDE2b3w++Oh4Qn6h2X0omLxxCgOBdL7CXCtVVzvjR58po/c8h2rrNbJn+NTp6ocSN7JPNMJGLr/PsxFcgF4FwLYO0YFitqYNSUq7Y6WZCZA7MfldizSY90Ub90a1Bs4bV8g8M1zya3xMr1XmScTZJtPY9q76ksfsABDAPT68EGLL7cUVV5pKRoGFzHebbKCfbax1aBlXNyq64zBkIBcjhnGJ+Dz6LdnbtJXiYSE5p+n8zlZD7ZSXQvOkxHabWN2VvjoCdtzBEPX9PgnqoY556PzAvNWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA86tFUjLG1w8wSA+0aA/mJ9oKSbd6ivsNcpV2Q9TuA=;
 b=ICrdYPcehKJG7tpGU8A4+btwkb5R71rkT1cla3x1lnfaXQjX0dtyBqMhs5KEmy0+7aq6Z91dRQk3QJjHri4vUnk0i2dPzCmCVHl/cczEBJOe/sTe0tIPTYGlELh2/aX6Yfbyvuz/EkUrzl8R37rRP9o+ULjZkpgHmDICQhXWfK4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SN1PR12MB2525.namprd12.prod.outlook.com (2603:10b6:802:29::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Tue, 9 Feb
 2021 21:04:07 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 21:04:07 +0000
Subject: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
From: Babu Moger <babu.moger@amd.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com
Date: Tue, 09 Feb 2021 15:04:05 -0600
Message-ID: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
User-Agent: StGit/0.17.1-dirty
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SA9PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:806:a7::30) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [127.0.1.1] (165.204.77.1) by
 SA9PR10CA0025.namprd10.prod.outlook.com (2603:10b6:806:a7::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.27 via Frontend Transport; Tue, 9 Feb 2021 21:04:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d85d4600-3a31-468c-a571-08d8cd3e3ce6
X-MS-TrafficTypeDiagnostic: SN1PR12MB2525:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB25259AFDBDFF61C6C4AE6551958E9@SN1PR12MB2525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UbLRusRI9gctatQynrKGpEXilEwjIMiWUIW6tc+EzxQ3TNDexmGqdNI19hEJfcJizCyFwbXm//pFc6Ac7hko4nz0G3YVAgnqb4w0xLkj9Hs87ECGksyquv4ipxRzFGo2BMhp+pyFdv7HI2iOTQ6qcL7XvOO7q8lkQd/LOPEWGkab4gw5s4APwHOAJ1OXjsYmb6Dgpa4ZtKl6jwJtvJadKGVBMbY5jec7JvpmQQsRo/pzt8ODLeqKCreO2N7JQYoWoMt89XgDvmCDP8TrTwARER/dNqetNY1muaseMS5Grhc+uDLAtUlu/aDYxkK75Ew/EY7Gjs6rpL96dfeAi4xohNFVMqbzhwWcXJkULmb3yZxPtwWHJ/xeyocQdOc0FPHtCqQ+d1rCG8yUwRLT6udxV0g4yNAgfX3RUw2DYPrh8zmfFpiTFcC76zeQVY6dOjmoZPqNYrlHB3wruArWXwNud6zKEMUMBpQbK0YGrwyxWjW0LxyXO7hTHamShrX4hkxHLDQvjph6WOGwJHyVnyRpYGQrbxr70xorbT3W6lnX+e+MfZPq1u1LFWuIfaLQzEyyAYKiW3ZX2KaCMOM6X6g7cpP2wYjskUgpgoJ+Zpc9GHw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(8676002)(8936002)(86362001)(4326008)(66556008)(66946007)(66476007)(966005)(186003)(16526019)(9686003)(52116002)(478600001)(103116003)(2906002)(44832011)(33716001)(16576012)(316002)(6486002)(26005)(83380400001)(956004)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UGRjMnljYUZLRkcrcG9LTEkxcFJZbmN6NVpBY05xTEVYOUNDbUZsZU5PU1Iy?=
 =?utf-8?B?Uno1WlB1UnJkejRzbzRXQ1lTdDRIRmxvbmVDaUFPOUJkckFLV1pla3BCUDFD?=
 =?utf-8?B?VDE0UFpZWHNmYzBvN2pXMHIxeHFDU0pHbHFHOURUTnVrT0tjNWQ1TEt2b1dK?=
 =?utf-8?B?L2Vrdm1MamR6K0FMWHU4SHNTSTdFazNzWVZsZ0FUQnBBV2VoYkxwanJBYkQ4?=
 =?utf-8?B?TlZsWnpob3F6L0wraU1IWTlGNWRpZ0t6S3VTWi9STWZWYU9BRHoxVGFsQm1H?=
 =?utf-8?B?RHc4ejJKRzBQRTRBMVlmL0V5L3ZROTZkOW8yMjJuMmFsNkFHOUllajF6a1J2?=
 =?utf-8?B?aHVkc1VGUElCUzN5SFhyNmJpdEhiYnBjMituRHZra3Zob2dvcFMvRmJnWEFj?=
 =?utf-8?B?QWlPMDBydE9IaGNjakhabDYrTmkvbGFhY1oyOG5QZ3l6Wm96TUM3SWZYdU9r?=
 =?utf-8?B?YUJDNHVRQzF0OVNnREl5dXc5Q3VjWHZwdkoreG5EQU1vdEdEQzZTbW9yN09v?=
 =?utf-8?B?NjZLT3k2b3BmQXM0M3RmUlRjWXZpRmFTOVhoS28rdnV2V2c2OWxxK1BRUVpH?=
 =?utf-8?B?Z0RNWEtTbFQ4MGMwcXpSMEs5SmxVR0xZU1hSTVpKZlZFa1ovM0RNcm02RnpZ?=
 =?utf-8?B?aFFtUmlVOEdmWHMrMHlnVERacVdZaDlTSm1iS1NMRW9lbjk5dTUwUmNDZ1pm?=
 =?utf-8?B?Y1gyamlsdUxHTVJGazRabGhkN3ZvRGxKa0I5WW1wYUkyNkdRMVhsc200MFow?=
 =?utf-8?B?aE1MaXplRGFQcTh1NThhTUVFV2RsUFNISm9vUHR1RStxeitDd1N4bzF5NkZN?=
 =?utf-8?B?WDFjYUlMNkJDcndqNVZhaVlYUUJGdFdhQm81emwrYlY0OW9aTmwvRGs4akpw?=
 =?utf-8?B?MDAyRjl0dWZpS1l5Y0o1bHJYdGJsMHJCR1BvYVhxN1p5QzRkS2lNMW45R1Nu?=
 =?utf-8?B?Ty9qOFV0eTQxdWRHTDRPSWRnbUw4QXlTbmlKYTlFSHRCNXBhaUlXTEdySUtQ?=
 =?utf-8?B?UzJCU0hsdUhQQUVCV054eVpuVjBnTmU1cDg0bGptRjlUMXBGdkt6QjFiK2xq?=
 =?utf-8?B?dGJBZHdJbDlsNWdBV21BWUR2UXJLczlWU0JwbWw1Q2JSUEJiSzNTWmJ6dFlJ?=
 =?utf-8?B?WXlURklyTmMvVVUxWXFPODU0WUM2K3NydGtLMXNhaUJsMjhPZ1A1TVNZZXly?=
 =?utf-8?B?NlhBZjlpeVBMeGkyWUpLRUpydVY0aExqbHB4MGNhSnJ1bld0MHY1SG9DMjUw?=
 =?utf-8?B?eitKL29rd3F6NjV5Nm1La2ZwSkJSTkpoU0d4OExYWDFmTzQ0V1JDU0hBcmJr?=
 =?utf-8?B?MjZRbWU4Wjk2cStLT3RyUFd3NVROV1dpR2JhN0ZYWlprQzFZWnhFcmdwNm1X?=
 =?utf-8?B?ZktySWROZWdYOXh1N3psdkJmRGI3aDBaMFBkVXBsenhBN3NiQ2FLM2NiSXdq?=
 =?utf-8?B?bkE5MWhiTi94eGY1NEgyWTYrTzZQZUN3R09kU3hNTTg3SUhEWnErdnBBcXo2?=
 =?utf-8?B?bGlJUXFnMFVqY2xRdDNhY1lxQlBWMGx5ZlV5NGtiSWhxTWNrV1lmU29ISFp0?=
 =?utf-8?B?NUI4ZXREQVM3R0JlQUt5L0ptbm4zU3lwTTZRb2NUYUxlM043WGt1eXhKay9N?=
 =?utf-8?B?c09XWUVaeEpVOFQxZFNpUkZ3SGdyQk8xcTBTU2srYkZwb2JJQU5PYmJqTUlp?=
 =?utf-8?B?V2V2ei92Mno3ZWg4SEdHZ3NqRnV1ZTN5VUEvUXJaMWdXbmVRRmwzZWZZcXNi?=
 =?utf-8?Q?0ejycnFQi/yFz7IvXCLEf4Iok3OdeacPBxDM0jq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85d4600-3a31-468c-a571-08d8cd3e3ce6
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 21:04:06.9468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65aBBtcc/Aq4JTzG0HHWIHTHdnjIMdnLH6oOouMlr4HzN/qdfARf2j32flY5JIpy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2525
Received-SPF: softfail client-ip=40.107.92.78; envelope-from=Babu.Moger@amd.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

pcid          : Process context identifiers support
ibrs          : Indirect Branch Restricted Speculation
ssbd          : Speculative Store Bypass Disable
erms          : Enhanced REP MOVSB/STOSB support
fsrm          : Fast Short REP MOVSB support
invpcid       : Invalidate processor context ID
pku           : Protection keys support
svme-addr-chk : SVM instructions address check for #GP handling

Depends on the following kernel commits:
14c2bf81fcd2 ("KVM: SVM: Fix #GP handling for doubly-nested virtualization")
3b9c723ed7cf ("KVM: SVM: Add support for SVM instruction address check change")
4aa2691dcbd3 ("8ce1c461188799d863398dd2865d KVM: x86: Factor out x86 instruction emulation with decoding")
4407a797e941 ("KVM: SVM: Enable INVPCID feature on AMD")
9715092f8d7e ("KVM: X86: Move handling of INVPCID types to x86")
3f3393b3ce38 ("KVM: X86: Rename and move the function vmx_handle_memory_failure to x86.c")
830bd71f2c06 ("KVM: SVM: Remove set_cr_intercept, clr_cr_intercept and is_cr_intercept")
4c44e8d6c193 ("KVM: SVM: Add new intercept word in vmcb_control_area")
c62e2e94b9d4 ("KVM: SVM: Modify 64 bit intercept field to two 32 bit vectors")
9780d51dc2af ("KVM: SVM: Modify intercept_exceptions to generic intercepts")
30abaa88382c ("KVM: SVM: Change intercept_dr to generic intercepts")
03bfeeb988a9 ("KVM: SVM: Change intercept_cr to generic intercepts")
c45ad7229d13 ("KVM: SVM: Introduce vmcb_(set_intercept/clr_intercept/_is_intercept)")
a90c1ed9f11d ("(pcid) KVM: nSVM: Remove unused field")
fa44b82eb831 ("KVM: x86: Move MPK feature detection to common code")
38f3e775e9c2 ("x86/Kconfig: Update config and kernel doc for MPK feature on AMD")
37486135d3a7 ("KVM: x86: Fix pkru save/restore when guest CR4.PKE=0, move it to x86.c")

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Added svme-addr-chk. Also added all the dependent kernel commits in the log.

v1: https://lore.kernel.org/qemu-devel/161133338780.27536.17735339269843944966.stgit@bmoger-ubuntu/

 target/i386/cpu.c |  107 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.h |    4 ++
 2 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 9c3d2d60b7..24db7ed892 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1033,7 +1033,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "clzero", NULL, "xsaveerptr", NULL,
             NULL, NULL, NULL, NULL,
             NULL, "wbnoinvd", NULL, NULL,
-            "ibpb", NULL, NULL, "amd-stibp",
+            "ibpb", NULL, "ibrs", "amd-stibp",
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             "amd-ssbd", "virt-ssbd", "amd-no-ssb", NULL,
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
+            CPUID_SVM_NPT | CPUID_SVM_NRIPSAVE | CPUID_SVM_SVME_ADDR_CHK,
+        .xlevel = 0x8000001E,
+        .model_id = "AMD EPYC-Milan Processor",
+        .cache_info = &epyc_milan_cache_info,
+    },
 };
 
 /* KVM-specific features that are automatically added/removed
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 8d599bb5b8..888c3a59e2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -816,8 +816,12 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
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


