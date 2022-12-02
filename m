Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6E9640EBB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 20:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1C0a-0002Yb-OG; Fri, 02 Dec 2022 14:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1p1C0Y-0002YB-PA
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 14:47:39 -0500
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::601]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1p1C0W-0004es-LY
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 14:47:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jscMb5rO1W7ahPAHT7aYa2DV9/DJtZEKOVs2pC7WIwkS+fPhrFeekHaQhGoL4Qk/wtcA3qyVY1WEA/kTR0o7GCpkLdf9WFLrlkYpU8RZiV1E9BjX6bvcOQ2pSRuLOVW0lR7r03y2lOl7SdUneh8ksOG7xBAd1pYEFurqniXKig93Sytb6uc90VPvuPEbca9u8GIJap1xYC+P/+X9h0oBlr9ehMfpOSMd7JX9k/Pk3NxfyoIeVjabA0ouJJMEKfGLnq2FXuy7RBnXSyzNUxiDEx77HCSP85pf3GWxHdhs1WSQ7zo4tg8YPl4oq/CRycynPMwcDajGFmw16cAUncHPPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izQP7RpEY2jlnsZxrSHBScMOlI3t37DXftEVEl4B5Lg=;
 b=hhom824d2PlPWs7dIpOww59u5+fr/sAGTnfQ9IETbvHdo3AnYIkZZh+yZJLaxVvd/EfjV26GbINOACT7wuPNFkWBkKahpNxicVPhj5B+6Ph0VMfSFQzgYUtLSOyR8lLCPcP2vZf1cfQG0J6QFALoDih31emdCdUfEGC0Ui/FQOWgOkGXxdJjo1/of5OjTIX6CaMpt4G4ADftiLwTKe0WMilJ57EJHlHwt1bfYCvDy3YSt0J8WbopLBSMmHFOmuV7i+yuWmhQWXJcn18RAkKXWpceuISHwWNmOwDMyESjB60JulqdlapekY2cw6dWJccb5r0u0je/k32EtAAfkPqqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izQP7RpEY2jlnsZxrSHBScMOlI3t37DXftEVEl4B5Lg=;
 b=n3NLj257kTzCzpiRHntIEQ4QI7WfxttRJLXvmkdBG6t67JmK71aIxvftfCZ+iRifBxY+8BW+QXJs88IIFtUQbqz6mlg/+Jdjl0cLTsGfKnuW4MNyxBJu19VbjJUhLC7qjmBpH9GdzHTtPoErlp6S5U8AP5D9oDy4hWD4Odk92XI=
Received: from DM6PR02CA0120.namprd02.prod.outlook.com (2603:10b6:5:1b4::22)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 19:47:33 +0000
Received: from CY4PEPF0000B8EE.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::b7) by DM6PR02CA0120.outlook.office365.com
 (2603:10b6:5:1b4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Fri, 2 Dec 2022 19:47:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EE.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Fri, 2 Dec 2022 19:47:33 +0000
Received: from [127.0.1.1] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 13:47:31 -0600
Subject: [PATCH 4/5] target/i386: Add feature bits for CPUID_Fn80000021_EAX
From: Babu Moger <babu.moger@amd.com>
To: <pbonzini@redhat.com>
CC: <mtosatti@redhat.com>, <kvm@vger.kernel.org>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <imammedo@redhat.com>,
 <richard.henderson@linaro.org>, <yang.zhong@intel.com>,
 <jing2.liu@intel.com>, <vkuznets@redhat.com>, <qemu-devel@nongnu.org>,
 <michael.roth@amd.com>
Date: Fri, 2 Dec 2022 13:47:31 -0600
Message-ID: <167001045109.62456.7605531797911345380.stgit@bmoger-ubuntu>
In-Reply-To: <167001034454.62456.7111414518087569436.stgit@bmoger-ubuntu>
References: <167001034454.62456.7111414518087569436.stgit@bmoger-ubuntu>
User-Agent: StGit/1.1.dev103+g5369f4c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EE:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ee7505-029e-4e1a-3b95-08dad49e0e07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CAe3WhljyNM6odjwjYxbeLfFYUPzZ/N6SG1/oeYnPqJWkg1AzoM8JmxsY24h7CLKONFaPtsaDN/5z4hc2v9M/ojZ1eH5X9Scb8h3UUoNUhScTuRH0IBeLl2zKzcMSWpNxxXE6SP3kXruRLC33+AQfQOiWUBSvV6eb2KCvJF1DllWgTOnEEtg9y/v1xEwOKUymXYAYejHiRg7Tm9iD3UxXJ9INN43rJAMj1PhKbtdYS3xRwj2Rf+j+GR3P32AWG0sRYxMPtVidvtAe0qfWly3INwTHdvCL77qAxcj3QsP7HInekpJ3tOb0DnLzhEvcQg8mABj2HsI9iBKBSjTLGH1IYVzm1k3uYXHiP0JuXsIno795gwQMDdRUi8NwZ9B93p7WQMtHhR//iW9Gy4EXqHAMVqdso8RNLHwdxlLZjbt5JguYDgsbXuDozSv5LmmROjJBLV3Bd3tVRNaae3A6fihAKc7sUt5IXbbVYOia1HYjf63vh+aN2Xq5KYRqw+qwNe1ri6ZH9F/4pZHZpmm0c5ekR3iEknAUP/hganRQ22tP2F+ipQ/k78I+v/qiyxzBWa9z+UCPtY5lwfQzMNc33eZhvT4AIBshMKATGDOF/W9jvrfY1aXGaHWmG+ajmPUVhsxSe/cl6ACrmhFMDZrpRGyksPnY4YeTCNLEi8RC34BUvVqMl6Z84lAxHoytZI/uoPkqi9L7FqqYlmMwUdB+cKCrFFpf8UlP7KRSoLIaTxIqHJuUQsSoxSh/jCVsshkSjK4GanCBhbVdpZxfCFGsYvvFgCfDGD8rqVmJSwgIAHItWnxK8LsqWlhg1FXGiqvh5vn4thKLi3QO1uWp6tptkbP6Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(7916004)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(86362001)(40460700003)(82740400003)(8936002)(336012)(70586007)(40480700001)(103116003)(70206006)(16526019)(41300700001)(186003)(426003)(5660300002)(81166007)(54906003)(8676002)(44832011)(16576012)(7416002)(966005)(4326008)(478600001)(9686003)(316002)(356005)(47076005)(6916009)(33716001)(36860700001)(26005)(2906002)(71626007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 19:47:33.0060 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ee7505-029e-4e1a-3b95-08dad49e0e07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000B8EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726
Received-SPF: softfail client-ip=2a01:111:f400:7eae::601;
 envelope-from=Babu.Moger@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Add the following feature bits.=0A=
no-nested-data-bp         : Processor ignores nested data breakpoints.=0A=
lfence-always-serializing : LFENCE instruction is always serializing.=0A=
null-select-clears-base   : Null Selector Clears Base. When this bit is=0A=
                            set, a null segment load clears the segment bas=
e.=0A=
=0A=
The documentation for the features are available in the links below.=0A=
a. Processor Programming Reference (PPR) for AMD Family 19h Model 01h,=0A=
   Revision B1 Processors=0A=
b. AMD64 Architecture Programmer=E2=80=99s Manual Volumes 1=E2=80=935 Publi=
cation No. Revision=0A=
    40332 4.05 Date October 2022=0A=
=0A=
Link: https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip=0A=
Link: https://www.amd.com/system/files/TechDocs/40332_4.05.pdf=0A=
=0A=
Signed-off-by: Babu Moger <babu.moger@amd.com>=0A=
---=0A=
 target/i386/cpu.c |   24 ++++++++++++++++++++++++=0A=
 target/i386/cpu.h |    8 ++++++++=0A=
 2 files changed, 32 insertions(+)=0A=
=0A=
diff --git a/target/i386/cpu.c b/target/i386/cpu.c=0A=
index b20e422b2e..e9175da92f 100644=0A=
--- a/target/i386/cpu.c=0A=
+++ b/target/i386/cpu.c=0A=
@@ -918,6 +918,22 @@ FeatureWordInfo feature_word_info[FEATURE_WORDS] =3D {=
=0A=
         .tcg_features =3D 0,=0A=
         .unmigratable_flags =3D 0,=0A=
     },=0A=
+    [FEAT_8000_0021_EAX] =3D {=0A=
+        .type =3D CPUID_FEATURE_WORD,=0A=
+        .feat_names =3D {=0A=
+            "no-nested-data-bp", NULL, "lfence-always-serializing", NULL,=
=0A=
+            NULL, NULL, "null-select-clears-base", NULL,=0A=
+            NULL, NULL, NULL, NULL,=0A=
+            NULL, NULL, NULL, NULL,=0A=
+            NULL, NULL, NULL, NULL,=0A=
+            NULL, NULL, NULL, NULL,=0A=
+            NULL, NULL, NULL, NULL,=0A=
+            NULL, NULL, NULL, NULL,=0A=
+        },=0A=
+        .cpuid =3D { .eax =3D 0x80000021, .reg =3D R_EAX, },=0A=
+        .tcg_features =3D 0,=0A=
+        .unmigratable_flags =3D 0,=0A=
+    },=0A=
     [FEAT_XSAVE] =3D {=0A=
         .type =3D CPUID_FEATURE_WORD,=0A=
         .feat_names =3D {=0A=
@@ -6002,6 +6018,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index,=
 uint32_t count,=0A=
             *ebx |=3D sev_get_reduced_phys_bits() << 6;=0A=
         }=0A=
         break;=0A=
+    case 0x80000021:=0A=
+        *eax =3D env->features[FEAT_8000_0021_EAX];=0A=
+        *ebx =3D *ecx =3D *edx =3D 0;=0A=
+        break;=0A=
     default:=0A=
         /* reserved values: zero */=0A=
         *eax =3D 0;=0A=
@@ -6429,6 +6449,10 @@ void x86_cpu_expand_features(X86CPU *cpu, Error **er=
rp)=0A=
             x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x8000001F);=
=0A=
         }=0A=
 =0A=
+        if (env->features[FEAT_8000_0021_EAX]) {=0A=
+            x86_cpu_adjust_level(cpu, &env->cpuid_min_xlevel, 0x80000021);=
=0A=
+        }=0A=
+=0A=
         /* SGX requires CPUID[0x12] for EPC enumeration */=0A=
         if (env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SGX) {=0A=
             x86_cpu_adjust_level(cpu, &env->cpuid_min_level, 0x12);=0A=
diff --git a/target/i386/cpu.h b/target/i386/cpu.h=0A=
index 8c65c92131..42b347051a 100644=0A=
--- a/target/i386/cpu.h=0A=
+++ b/target/i386/cpu.h=0A=
@@ -597,6 +597,7 @@ typedef enum FeatureWord {=0A=
     FEAT_8000_0001_ECX, /* CPUID[8000_0001].ECX */=0A=
     FEAT_8000_0007_EDX, /* CPUID[8000_0007].EDX */=0A=
     FEAT_8000_0008_EBX, /* CPUID[8000_0008].EBX */=0A=
+    FEAT_8000_0021_EAX, /* CPUID[8000_0021].EAX */=0A=
     FEAT_C000_0001_EDX, /* CPUID[C000_0001].EDX */=0A=
     FEAT_KVM,           /* CPUID[4000_0001].EAX (KVM_CPUID_FEATURES) */=0A=
     FEAT_KVM_HINTS,     /* CPUID[4000_0001].EDX */=0A=
@@ -925,6 +926,13 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWor=
d w,=0A=
 /* Predictive Store Forwarding Disable */=0A=
 #define CPUID_8000_0008_EBX_AMD_PSFD    (1U << 28)=0A=
 =0A=
+/* Processor ignores nested data breakpoints */=0A=
+#define CPUID_8000_0021_EAX_No_NESTED_DATA_BP    (1U << 0)=0A=
+/* LFENCE is always serializing */=0A=
+#define CPUID_8000_0021_EAX_LFENCE_ALWAYS_SERIALIZING    (1U << 2)=0A=
+/* Null Selector Clears Base */=0A=
+#define CPUID_8000_0021_EAX_NULL_SELECT_CLEARS_BASE    (1U << 6)=0A=
+=0A=
 #define CPUID_XSAVE_XSAVEOPT   (1U << 0)=0A=
 #define CPUID_XSAVE_XSAVEC     (1U << 1)=0A=
 #define CPUID_XSAVE_XGETBV1    (1U << 2)=0A=
=0A=


