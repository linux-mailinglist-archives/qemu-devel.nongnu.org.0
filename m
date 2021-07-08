Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8258B3BF2EC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 02:43:35 +0200 (CEST)
Received: from localhost ([::1]:56896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1I8c-0003Qu-27
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 20:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m1I6z-000298-Sj
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:41:54 -0400
Received: from mail-mw2nam10hn20306.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::306]:40577
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Michael.Roth@amd.com>)
 id 1m1I6x-0005YD-3s
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:41:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khpE0jG8q1ScqN+6TNUe7aAOdATeQsx9RMlzDtHl6ykh/yqJkhweH4pTfZ24JNvqZ/BzcG0JWHzQ0mIAD1RvU9fV+ziyv49DA3nPZOfK25mhp8P9fOTULegloKVx84PLB4bAHc/ngLC+4RCG3KvTsxhPFNq8Us20opxO+vS+rfmANZCIQvkaRLGJwKdTeQncwNKby9DUCAcI3HxTwZ4zl5Y19NZq6cLa82XSVZ1QiJC/UGjGnmDs0bAKmkWwqOLvuASrlX8HOpIF0Oyvam0RLpCKclkgUi5NET1oP70iDLT7hW7vpbmE4Q1/L1kn5frFTX15bnEk9MBUeAYmJ6q3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIvVNjYl4Wvv5GXBN+ckdZZOHHJeSFIJvLXXFsqLgyQ=;
 b=gpc0bFnfdxsnYMLYzKAHTYXMokqI2LSUrq5dIkSefxi22t6zn8njOSXQerQehGXhRS2wasMiMG6APDvEUH5vPZdbi/Iv5Zfzy1UBmsH17+s2Vh8YEdLX9Jqc24d9wmUf1wi7Wb4ZSBAp3XoEbW10O5lhtvbbPtqjfTosMirMv++7rb6eXObIrqmpiFvW/gorU/cttq6xj6Pny7TfhwUHJFvAekpWyhVTDI1WIOhS0S2f1zUA2I10DdZ5ORsEVihBXtYIQCmBjzvI05GU0a5sWpF4fiSqqFf9Zcb7mSAGdS4jCTm51OX1roBwRFo2eDtEJ+2ZtpdPlfngD2srn6pNKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIvVNjYl4Wvv5GXBN+ckdZZOHHJeSFIJvLXXFsqLgyQ=;
 b=aOjPN/RG9HT7vfVqVDRM0kXM7PiXHzHvQ2yBitj+eqQVAxv5D1CoigA09QQRp5SVtH5HgE/UwTZzsgJDPoP+O5uKI6BhmQOg3YUGPBCohdnB/1JJtv+xiJjzv6LCNkw9ipO7VnFOCmqHu57/iGz/iBwI11Z3Yv1WdRd424RjoO4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 by CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 00:36:41 +0000
Received: from CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0]) by CH2PR12MB4133.namprd12.prod.outlook.com
 ([fe80::d19e:b657:5259:24d0%9]) with mapi id 15.20.4308.021; Thu, 8 Jul 2021
 00:36:41 +0000
From: Michael Roth <michael.roth@amd.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH] target/i386: suppress CPUID leaves not defined by the CPU
 vendor
Date: Wed,  7 Jul 2021 19:36:23 -0500
Message-Id: <20210708003623.18665-1-michael.roth@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0056.namprd16.prod.outlook.com
 (2603:10b6:805:ca::33) To CH2PR12MB4133.namprd12.prod.outlook.com
 (2603:10b6:610:7a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (165.204.77.1) by
 SN6PR16CA0056.namprd16.prod.outlook.com (2603:10b6:805:ca::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Thu, 8 Jul 2021 00:36:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6ecd6ef-c720-49a6-2509-08d941a87499
X-MS-TrafficTypeDiagnostic: CH2PR12MB4053:
X-Microsoft-Antispam-PRVS: <CH2PR12MB4053380F60D525D5E289478695199@CH2PR12MB4053.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/UG073/UyDMWuxJ0twAXLf5uRYTQwtYkLEPSydgPGAhBZnOX9eT0eYkTnrUv?=
 =?us-ascii?Q?VM0bMLp36t4mUBMQvqn3N7SXBUbRRHzc5l/q4K6iWC/+4X2cBTP6m9YeDYib?=
 =?us-ascii?Q?vqclE35C65RrUtY5koSdYB4xisko32Ga5CSbDWLJLKqJIRPqsWGV0n2yLUnQ?=
 =?us-ascii?Q?4D9LTuHkKx59W3cd8/WeOBz2KgPQaGg1k5WGDsIY4zH7O5GDWhrNhKQtuE5t?=
 =?us-ascii?Q?EKfxM3EDM0T+03F+N6ZVcUdsiW5/KgfO5xp8XuT900+ilRfyejvkMaqzkeri?=
 =?us-ascii?Q?Lzv9a65cwkgFgAVHXwRTNKJleFaroPRriPoweNVhS10wwQEhYMTnU0ykKVoj?=
 =?us-ascii?Q?bWLxG/PZ/bjFsdxzOQiJOn+303+FzVTuIcUz8+SMXa+V6Ru7pcrGgrB8cRHu?=
 =?us-ascii?Q?bubthg+wwQy2o7co3I2r7GeudT6stpJyh8AhcZWDOunYYPbqu6u65DRUGnrk?=
 =?us-ascii?Q?0ZlltYbCeZezziiYeBuldg1UrjulNgIdMT3YJmMW1R3xKPZuMsCy1oEeAX7V?=
 =?us-ascii?Q?jofaCKjxcIx/DEWJB9U38zgV1bBHSG5TPdwREBmXzlcJwBFDpDHb0S3ymna5?=
 =?us-ascii?Q?DQ4Y1THsQ0EckFGSNmC3BnIJMwhinV5LtCPjKXIfeqfGb8U1PAie/gqesfws?=
 =?us-ascii?Q?ha5xRXe0aRRVb9l8B4hHZ2uK1CuWfzbuy0LVj1CinONBGA1HG0XH51BoMQvP?=
 =?us-ascii?Q?AFRzU8zftin1WJdcaV9EY2tQHAABwfxYDDhLZJlkYVIAlQm9AXKvNYyhM+T0?=
 =?us-ascii?Q?hzb32sjaas7d9OqNXRrhJhP31TNMr99gRrgxbF/1x5WeKliRKib1qTgYD+GL?=
 =?us-ascii?Q?GMeo1iHzKf6BjMp/fWjzgvWMWsp3QTU8CU1B5m+gi5+HHH2USPTQVqQqdJvi?=
 =?us-ascii?Q?6sK0W5tkUlBpLEujtFHzf4gap4zDF26mL3GlL2fPw3Wjoo+z4go2eMex2jjF?=
 =?us-ascii?Q?pT4fu3Ut61YHSkrVo+YO3HRS0x+K/c9B2lBvoKR86jHLM3mCwxTXaypmfS5u?=
 =?us-ascii?Q?1PPDBi2x81ArvqfBhximB3dZaZgVj3BNw6T2p7wJDFt9V6k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:CH2PR12MB4133.namprd12.prod.outlook.com; PTR:; CAT:OSPM;
 SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(6496006)(26005)(5660300002)(316002)(86362001)(52116002)(2906002)(186003)(66556008)(66946007)(66476007)(6666004)(478600001)(36756003)(4326008)(8676002)(8936002)(2616005)(956004)(6916009)(44832011)(1076003)(54906003)(38100700002)(38350700002)(6486002)(23200700001);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HRlGSnQtd7l0y1H2glmwlkhic2bRUX780sIaS3D1QQ/Q1ttgch+5iSLq1ZVw?=
 =?us-ascii?Q?As4nt1rW78ZambvQeBTqxQ8XoaZ8QzydUfSenjeQZFGLa5MxJrT9oLJBgY37?=
 =?us-ascii?Q?V2cnGyS1LceEv2O0/86eiq4K/DDxlz8SDMTUbBb3c9KEBYbueeowihZJNCJt?=
 =?us-ascii?Q?B3vhWIJ+K03XXimEh+OLAV+1dm4pRvVCzQiaNWM9HTAF490FIoVyJUIcVOn+?=
 =?us-ascii?Q?Chz/oybaH6AJfI+9JL9Id7rcGA2/QGDqn8rwjoBvYQZ8PsD1y4V9dJMjlFGR?=
 =?us-ascii?Q?mVSj8TjNv/6x0bOHTgb6VOP4pKHFtU6vwo5sV+dsqwLhw6rs3eXt7NBhXIbb?=
 =?us-ascii?Q?aXDpQxW/H+9hiEeHv3so9jFSV4v9J6jqHVqJoLuEm0LgfvmEyp4PEADuejIJ?=
 =?us-ascii?Q?wQygI3qanfNqpFeA0JqVoAaYP59Mjrga8+GehYI5a8V0PZgsOljRCBeCM9vs?=
 =?us-ascii?Q?2xmOi91IvnnwDwhF8M0jnqnE3dfAx5pFQPuqelP4jKPv/Z+1V2bQaajL6EQI?=
 =?us-ascii?Q?4d05vtokRHdV3rtpku6dcZ16USpBszX2wPu7J3zJMVU0JC8iZqSKpKfEs1DX?=
 =?us-ascii?Q?hAI3eq9/0nfeMeW300r4Giz7K5vAFMB6jRYMREQQ4xJ9l7f23AP1D5yljFc9?=
 =?us-ascii?Q?vq13sEa9Y3gf739shIx/T9hLJ9pNCKgW8VLdU9uC3ved+6nrYkqnQy2binH2?=
 =?us-ascii?Q?Vew5pzIPKD5BA0Qzg6YLVj3+ULeP1mwAgFzoNZhbXow8XsuGg+/VBc69yk1m?=
 =?us-ascii?Q?P7RNtfEop8Fj2vBXmKwpbYuGDb/4WekW65pX0WDuGAkB+8xThi55nkSCe6HX?=
 =?us-ascii?Q?Zefkyv3piLHojjCKx61wIJpHIwbdAonQUGfrclW0Ft9OVWIz22PjlZ11MN8E?=
 =?us-ascii?Q?k9RxCPZ5Lmx20u6Kny9TkAYc1GaB6y0sebOj685shEaTlloDeSe8qKy54nxM?=
 =?us-ascii?Q?HYPjDXSiIkFDsHIk2Z4rTFcaZ+VtNrSKoI6NmuY/pEzlt4EqSAlJyrHJS4ay?=
 =?us-ascii?Q?cW8A/qpFioigHjfRkY0gx9AD9RitRl026JpHkcW/cxvvQ+kD3zjy1GDzfHaL?=
 =?us-ascii?Q?U6H7YB+kdoG2+DxjfWM7UFF0clg3430RJzF/Y61Le9dKVokrUQ9L7n6zd/If?=
 =?us-ascii?Q?fLh6PXEaodaMTF05eZOVmKQdKmtL79tJOzycsXQHHz7KSJJzj2dZgsRWpqGz?=
 =?us-ascii?Q?GkHtvi5qFVJ0Av8G+qGzmKba9L+GmejM0P4b/taMdyZVXCZoaIOKqzoHgGpw?=
 =?us-ascii?Q?mta9wJzz3KfWNeyStM6nKFF+h1WjX4TQhlzpjSbjb0WFGO2yDDYlYRn9ZbiF?=
 =?us-ascii?Q?T+Tp8yN5BHBX4J+a1rBdeISB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ecd6ef-c720-49a6-2509-08d941a87499
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4133.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 00:36:41.7574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AH+MDn80Zu3IL3hPtE8ntXHh1HzXKzKKH/g3mHs/qsw88Y4+o2oDjOQ2Xyq1GGqZFcbp2+wQC2eZ7i7TP1a5wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
Received-SPF: softfail client-ip=2a01:111:f400:7e89::306;
 envelope-from=Michael.Roth@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently all built-in CPUs report cache information via CPUID leaves 2
and 4, but these have never been defined for AMD. In the case of
SEV-SNP this can cause issues with CPUID enforcement. Address this by
allowing CPU types to suppress these via a new "x-vendor-cpuid-only"
CPU property, which is true by default, but switched off for older
machine types to maintain compatibility.

Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>
Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Michael Roth <michael.roth@amd.com>
---
 hw/i386/pc.c      | 1 +
 target/i386/cpu.c | 6 ++++++
 target/i386/cpu.h | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8e1220db72..aa79c5e0e6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -98,6 +98,7 @@ GlobalProperty pc_compat_6_0[] = {
     { "qemu64" "-" TYPE_X86_CPU, "family", "6" },
     { "qemu64" "-" TYPE_X86_CPU, "model", "6" },
     { "qemu64" "-" TYPE_X86_CPU, "stepping", "3" },
+    { TYPE_X86_CPU, "x-vendor-cpuid-only", "off" },
 };
 const size_t pc_compat_6_0_len = G_N_ELEMENTS(pc_compat_6_0);
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 5f595a0d7e..0b6c921e5a 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5155,6 +5155,9 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         if (cpu->cache_info_passthrough) {
             host_cpuid(index, 0, eax, ebx, ecx, edx);
             break;
+        } else if (cpu->vendor_cpuid_only && IS_AMD_CPU(env)) {
+            *eax = *ebx = *ecx = *edx = 0;
+            break;
         }
         *eax = 1; /* Number of CPUID[EAX=2] calls required */
         *ebx = 0;
@@ -5176,6 +5179,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             if ((*eax & 31) && cs->nr_cores > 1) {
                 *eax |= (cs->nr_cores - 1) << 26;
             }
+        } else if (cpu->vendor_cpuid_only && IS_AMD_CPU(env)) {
+            *eax = *ebx = *ecx = *edx = 0;
         } else {
             *eax = 0;
             switch (count) {
@@ -6647,6 +6652,7 @@ static Property x86_cpu_properties[] = {
     DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_level, true),
     DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
     DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true),
+    DEFINE_PROP_BOOL("x-vendor-cpuid-only", X86CPU, vendor_cpuid_only, true),
     DEFINE_PROP_BOOL("lmce", X86CPU, enable_lmce, false),
     DEFINE_PROP_BOOL("l3-cache", X86CPU, enable_l3_cache, true),
     DEFINE_PROP_BOOL("kvm-no-smi-migration", X86CPU, kvm_no_smi_migration,
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0f7ddbfeae..c4152634e7 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1746,6 +1746,9 @@ struct X86CPU {
     /* Enable auto level-increase for all CPUID leaves */
     bool full_cpuid_auto_level;
 
+    /* Only advertise CPUID leaves defined by the vendor */
+    bool vendor_cpuid_only;
+
     /* Enable auto level-increase for Intel Processor Trace leave */
     bool intel_pt_auto_level;
 
-- 
2.25.1


