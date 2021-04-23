Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5490368CD4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 07:48:10 +0200 (CEST)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZofh-0004AA-Ro
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 01:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1lZoel-0003jU-9Z
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 01:47:11 -0400
Received: from mail-mw2nam12on2053.outbound.protection.outlook.com
 ([40.107.244.53]:25953 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Wei.Huang2@amd.com>)
 id 1lZoei-0008UG-8H
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 01:47:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/41xqqLauS5u8ELAmVVrdiQC5TEEfpPpy6p8DrRIxAoW6QJa8eAIo2iz9mHwqw3iSp5XIgzKAAnsCSJa2qHyeNatpIzDwSeOLLKOzyJyS1W5XfSVcGTFBXBTgj6Hx7Q42UjEPAU1PD73i6yj7Lpfki9s3DhwbJnUogTBvZhkMNiSuonWtyGKKHCCHEMoNhWiyFB//jebxR6jx7u5R4RxtdhwCHLpK7YPmxyPTPXDxNJIrD3C0RF54vJ7uknFQQJy8GjSyT7HnCwRDzVq2FjXAbXFUnQHtXvfwCg/rz6KZRfoVzcGHnsmQ4f/ZtDJgQcSDTscr3mEhx6NvOD1OopHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMTaoLBleNS+yne8lHXwixCuFFCtZ4U8hrD2lGOcHZI=;
 b=hjrM1ueHvcUPMYDeUlg91gJ7vTaZnkq6d6cGm+193XQEcf3xLZIJwBnvvqKS1AxFckLxiRe+Sjnyric9ztLHssDARBGitZvUXh/CsRUInSMGIEVaN1KQi6MZMWNH1X47HQYKbYxOrpviHx2ev5+XZ4m7sKpc5qRkoPLaDw2Iz0t5Y7kQhoB8CMqbu+gefZqAgPeJZjqISDOSy0CpdPjEQHVzP7MmkLExiOQPiG+5rPH3bomc4ipra/aT3ksswotryS0zKgi11xGxp3BzutaCEEKyRyy6LRbQ1JjFFovbq2glVTxEsu1ZgzzLguDhYBf02TuP5+Q/KrXDCFNkD0qK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMTaoLBleNS+yne8lHXwixCuFFCtZ4U8hrD2lGOcHZI=;
 b=ydGJEeiaXD1z5uDKCAaSYkERYD5vILeq8wGlQaK+zoWXJadmGZ9KCoL5aLoGCBdiIOLU2Df4X0Ce9I/VfWs/CiNR0Nis0spczf7IiUQAsYzZlYq9nLic2B9MJA8RK2fLYOEalqU/H3hjTdw0XjV9apiNVwa7dlQEOKx9vC4npGE=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR1201MB0201.namprd12.prod.outlook.com (2603:10b6:4:5b::21)
 by DM6PR12MB4546.namprd12.prod.outlook.com (2603:10b6:5:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 23 Apr
 2021 05:32:03 +0000
Received: from DM5PR1201MB0201.namprd12.prod.outlook.com
 ([fe80::2833:2120:ed9f:c3e4]) by DM5PR1201MB0201.namprd12.prod.outlook.com
 ([fe80::2833:2120:ed9f:c3e4%4]) with mapi id 15.20.4042.024; Fri, 23 Apr 2021
 05:32:03 +0000
To: qemu-devel@nongnu.org
From: Wei Huang <wei.huang2@amd.com>
Subject: constant_tsc support for SVM guest
Message-ID: <a6662944-18ac-5075-1427-f92ae8e20163@amd.com>
Date: Fri, 23 Apr 2021 00:32:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.11]
X-ClientProxiedBy: SA0PR11CA0046.namprd11.prod.outlook.com
 (2603:10b6:806:d0::21) To DM5PR1201MB0201.namprd12.prod.outlook.com
 (2603:10b6:4:5b::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.10.87] (165.204.77.11) by
 SA0PR11CA0046.namprd11.prod.outlook.com (2603:10b6:806:d0::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 05:32:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 934c5a94-4f27-4c54-7413-08d906191ffd
X-MS-TrafficTypeDiagnostic: DM6PR12MB4546:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB454624576121A221790254C4CF459@DM6PR12MB4546.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XbYcXFhnzxLaAV83wb3NqrY7Vhk3JuPogH/p+x/wD2TLC4/ahSFoqW5rXUXbiJvmlRowlwFJ3vzr+HSO33VRoduwWZ3a8ChCTcQXDjYKHSM+8PxK+zgM+WmQSdwJ246sXsx2S79Jks430S7bH5BVTGV0exsh4a8NQMrDbIRoIMceOMLoY6xPHy3L5Qop5acExizPRFaz0cqdV7Pea78Dr6JhM9y5LVwgbYGpkTLLncLtm5YGylWvZN7g/Vk5HUgxvJLy+kaGqbuYmVFc6pCeMeNdCr1FMYPIWCTqKtPmXRNt0n8Rc5FbmycGGL7YIiJpgXPv9El/K+Qcq3ptB0ZuWKhbHiVIdRMVUyO/HKNKfDLuCA4qzkp90FEReGqD8ADv1IGFzMqui2t8R3qMZzJjvRk2P9ZSQ1JzJk5L3sTGvSoGyVSBDEXbApulytOjU2w3lQSH3QKb06tmtYu8boXYjsIDBGcT1K3W6Lc9Iyvt8KJrje6y5tPj00V3u7MX73E1dOaPhJ2hMFfi/kPcEzZDx/JnhvlkaVJ/HIZB/DYiyJmrKPFvueyGB4Vw8UC2NrIrw+M5OLHdcD4DrkvnEB9ou6/95awB88PWG7v8QFeIoJonG/oPCBnOH//PN4QT19ciVPYHxZn9D23T20mU/jKMejr/aJ7XO0xhu44ACAOf35ZEG5HY7JiDGdhlhdj/8Itog6MhwLYW3TtDUN/Ds6I5EbTz8xlVgyDf2qXUT1F5/Io=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0201.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(52116002)(6486002)(54906003)(16576012)(956004)(2616005)(8676002)(186003)(86362001)(26005)(478600001)(6916009)(4326008)(36756003)(316002)(38100700002)(8936002)(66946007)(31686004)(83380400001)(2906002)(38350700002)(5660300002)(16526019)(66556008)(31696002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZHJkbENlNHd6WWNUdE1FNlZmWXpRSFhka0pnbTJUdGM1bncyMWtTRkpvdElZ?=
 =?utf-8?B?ZXdEZnRqZ2VDQXhhS3lUSTVlbHhYaWJNMkNrbnNpV0pKUTkzUXN4MGpuczZ1?=
 =?utf-8?B?SFlSMnJBeVNRcmgyUXVjVk84bWZuSFR5V1htRVRmeUlpTVZRVVYyaFMvQ2V4?=
 =?utf-8?B?aEx5NWw2MXJMNEcvekQreVVNd1k2VG1ueGkvTXNWNE5mSmNwZ2M4L1JUMmw1?=
 =?utf-8?B?K1JtaGk0eTJaL0k2Q29hMmdRQXFpdm92TmNxbld0MUZJN1FIZFhvRzRtNUtn?=
 =?utf-8?B?YjlvTnFMS3FvNHFFLzczcGFzUEk1RWc5VkRjOWpLQmFtaDRjdE5qODYxVmVV?=
 =?utf-8?B?SFVSTGoyRktXbVZDYkZjVlRVaU9jRDdZL0trcGhNMk5xZTFWSXZxbEtLd0tF?=
 =?utf-8?B?L0syOHNPb3p3ZERSNWpTZlo0Wlh1Y3BSdDBKZGVKNVJwM3lMMkhlSHlGNW51?=
 =?utf-8?B?QlVBRE9XZ3Z6cHJpRWxpcnc2bm41dTRMM05SM1NxcEtxQWNMR05rdlY3Qjhk?=
 =?utf-8?B?SFRsZ3ZnSExsc2w4djNGZ29PbWxFbDFpVHJKNFRrMkJFYzRRK3pSY0ZrWjRK?=
 =?utf-8?B?RGkyUkRVUUlteVJSSndzSkFFVzc5R0JFNUNkczhQWjF6RlZYSE5xMkVQazBq?=
 =?utf-8?B?ZHNROWZmVkVhTmdxMjFUVzlRUmRZUEt2N2xTVUhQOU16bnhiVWNXaGlYQ0FL?=
 =?utf-8?B?YlNSa1J1QVpvNGlET1A4eWVkcks2cGFUTzM1MmNDMWsvL0VEZVBGZ3VEclRI?=
 =?utf-8?B?UXVHZUZ6d2ozbWxrZjdyWGQybnhYU2d0RERXMXBWU1cwNnJvSkF4eUtQaHNw?=
 =?utf-8?B?UHNuMy9WdkpTcVFYcEQ0TldZcUtVR0cxOTgxUVhIdFNvYkVVQWVhaDNQdWpu?=
 =?utf-8?B?K0diNFRXUXJWTm15dmo4TGROK3ZUUUZmMWpRSGtPa2hmL01yY2ZoVG5iTlpH?=
 =?utf-8?B?V0VwMFFhODF4aEhIQXNKVzFOOG85T1VvWGxXTVo2eGhkYTllL3E3UVFiUVNu?=
 =?utf-8?B?Z2laZnRTOTd0NGE5ekVLaGdBY0dHTXNHdFFmYVpmVG9sbTBrcVgvRzBTS0RK?=
 =?utf-8?B?VFhrZDhDclN2elFTcTN5bmNaVm9VTU9mNXQ0TjV0cncrN0VCR1Z6ZWczWUhH?=
 =?utf-8?B?YmZ3cGZFVU1wQXp1Z3BJRXhjdXZkNFE2dER5TzZOWDBlUU5wVkZnaG1meStv?=
 =?utf-8?B?TTNtM3pZS2J6VWt3N0Z4aHhWUGswN2dWcHVoVlpWc21qVGJaY2RGVEMvZldT?=
 =?utf-8?B?KzhJTWdqaytZQ0pYbjNZR1hZOVFVV01xRUNOSTkzUkFJQ0RrZlVtL0prdGNq?=
 =?utf-8?B?SzlzMkxqVHk2N05PYmVnU3ZrN2FUQm12UnZSa2NMcE9TOG1XTXJWb1dCRWVw?=
 =?utf-8?B?UFlEQnM5WWIxY3R1V1orYzYyc1I4TE9XSkJEdzFsOGdBeXM3UW1FNHFUTkc1?=
 =?utf-8?B?N09oYmM4TkNUSDJ2V0lNbG9EV0lvVWRhdkVOb3pnZU9tN3lrbnBiV3VKbUgv?=
 =?utf-8?B?YjNJbWRGOWNPOVlySlFOekZxWWdNRFp3OHI5T1ZBNUNHWE9TckxoWVJLVWl4?=
 =?utf-8?B?UkZ6UHFpRmlxV3lZM29kemxTUXZsT0ZIVm1GSldjMUFYTEZ4b1lQcnNRd2tV?=
 =?utf-8?B?aWFGZUF1d3U0T3JMMFkxSkFOTFVGUVdWenRvaWF5WENmSVc5M1I4Ujc4ZmZx?=
 =?utf-8?B?ZXVQVnQvYi9DQUUzdHIxQ3ROZzlxVC80K1RmRldKZjJ5Tm1FaU1RcHVwYTQ5?=
 =?utf-8?Q?1A5PyyhUPT6aQr7xkzwHwMw2+CoknQORHw3izqd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934c5a94-4f27-4c54-7413-08d906191ffd
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0201.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 05:32:03.1608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PwGLWhG5ZKQWNsGZ46uD0epwbf4YRgEGRtsf4RxYUu7L4P+dqsvGOy8IoLSeoSS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4546
Received-SPF: softfail client-ip=40.107.244.53;
 envelope-from=Wei.Huang2@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
Cc: "Moger, Babu" <babu.moger@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 ehabkost@redhat.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was a customer request for const_tsc support on AMD guests. Right 
now this feature is turned off by default for QEMU x86 CPU types (in 
CPUID_Fn80000007_EDX[8]). However we are seeing a discrepancy in guest 
VM behavior between Intel and AMD.

In Linux kernel, Intel x86 code enables X86_FEATURE_CONSTANT_TSC based 
on vCPU's family & model. So it ignores CPUID_Fn80000007_EDX[8] and 
guest VMs have const_tsc enabled. On AMD, however, the kernel checks 
CPUID_Fn80000007_EDX[8]. So const_tsc is disabled on AMD by default.

I am thinking turning on invtsc for EPYC CPU types (see example below). 
Most AMD server CPUs have supported invariant TSC for a long time. So 
this change is compatible with the hardware behavior. The only problem 
is live migration support, which will be blocked because of invtsc. 
However this problem should be considered very minor because most server 
CPUs support TscRateMsr (see CPUID_Fn8000000A_EDX[4]), allowing VMs to 
migrate among CPUs with different TSC rates. This live migration 
restriction can be lifted as long as the destination supports TscRateMsr 
or has the same frequency as the source (QEMU/libvirt do it).

[BTW I believe this migration limitation might be unnecessary because it 
is apparently OK for Intel guests to ignore invtsc while claiming 
const_tsc. Have anyone reported issues?]

Do I miss anything here? Any comments about the proposal?

Thanks,
-Wei

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7..3c48266884 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4077,6 +4076,21 @@ static X86CPUDefinition builtin_x86_defs[] = {
                      { /* end of list */ }
                  }
              },
+            {
+                .version = 4,
+                .alias = "EPYC-IBPB",
+                .props = (PropValue[]) {
+                    { "ibpb", "on" },
+                    { "perfctr-core", "on" },
+                    { "clzero", "on" },
+                    { "xsaveerptr", "on" },
+                    { "xsaves", "on" },
+                    { "invtsc", "on" },
+                    { "model-id",
+                      "AMD EPYC Processor" },
+                    { /* end of list */ }
+                }
+            },
              { /* end of list */ }
          }
      },
@@ -4189,6 +4203,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
                      { /* end of list */ }
                  }
              },
+            {
+                .version = 3,
+                .props = (PropValue[]) {
+                    { "ibrs", "on" },
+                    { "amd-ssbd", "on" },
+                    { "invtsc", "on" },
+                    { /* end of list */ }
+                }
+            },
              { /* end of list */ }
          }
      },
@@ -4246,6 +4269,17 @@ static X86CPUDefinition builtin_x86_defs[] = {
          .xlevel = 0x8000001E,
          .model_id = "AMD EPYC-Milan Processor",
          .cache_info = &epyc_milan_cache_info,
+        .versions = (X86CPUVersionDefinition[]) {
+            { .version = 1 },
+            {
+                .version = 2,
+                .props = (PropValue[]) {
+                    { "invtsc", "on" },
+                    { /* end of list */ }
+                }
+            },
+            { /* end of list */ }
+        }

