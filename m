Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66D43E00CB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 14:04:26 +0200 (CEST)
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFdJ-0004yp-NE
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 08:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFWv-0001rV-OA
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:57:49 -0400
Received: from mail-bn1nam07on2081.outbound.protection.outlook.com
 ([40.107.212.81]:10990 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFWt-00036X-8V
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 07:57:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQYxUPlb6jqGs4zQxiOK1LB6btNHsqoTwH3bjmJCAUOnJaQDhPVDpAmUlsuwo7DjAFocjKE1rc4AjnYkvPVoCqjTx52aPmfrOh8wOY+BEthqgHgaZy1q2XCfjbWinFtAUQQWc2TB2TzUugTuXxx/bLQO7I4RiP3AJMvuVv9ejeaItxL2AB6Z9hzGK+xWyfHRES8Bcip4CHkICzbAulund+jeufwmbnFCQdsjJn9hx2oLuZQrqe9Ok0oLlPEX9dOybhmQs4ngj72LL8AyzpY1bWT7QiOAe2J/LeeFNX4JKbkZw1OYqq6Rgqr2dy1vFkWqwOByAF7Os7SG8OCO/Kb8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBLqTZkt7c/MBZ5ZZHPHBil2PPFjkRkDTTwbAfQFEVU=;
 b=JT1ZStGAJ6GDCHVKIxPsLTuxcsON1vSdYi8v3FIbxofgt/MSUh1hSjD6kVCg5GPWe+PcYhvaWPXXJZe4gbggVM2G26ZnCPPE4SE9Ihb4vdtMLrFVxXvge9d59N/XkAnEkgkidUT6aqOFGwM24pTfzESR/yTTc0sn8uEBlnrojmYaLJsD0ds2dqz8TakFzMNCxR5cwpk/gDyGFxom1h1JZrQbTfjPM4jIpkIBkqoU2jPUz+Vq63p85htOAgFl6SZULX8qPMpEg4cjb3cGcL9idSkkiiHro/fh0fRgFon44mkpcYi33wXVEyPgvf379b/3RXnFElHOcitFZI8FxJ7CVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBLqTZkt7c/MBZ5ZZHPHBil2PPFjkRkDTTwbAfQFEVU=;
 b=O1m3QSbDqXvGvd5YVUZT+XZnaKoIAeRXsZWG/hdypWdRhtTaE9LDOv99CTO600VqcRXKuaAytj6dVjSgszZ811kAYne8bqIAOyrxcNmLpI3GROYIhLNC5EzDWxjtMSY+UVpH83FHkAUgRRTtia6JKQIrNlwS2cp4bCoQ8SShhR8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 11:57:44 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 11:57:44 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 09/14] kvm: Add support for SEV shared regions list and
 KVM_EXIT_HYPERCALL.
Date: Wed,  4 Aug 2021 11:57:33 +0000
Message-Id: <fcbbd9b19ac7951f0cef8357dcbbf4f21c3c5695.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0163.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::18) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SA0PR11CA0163.namprd11.prod.outlook.com (2603:10b6:806:1bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Wed, 4 Aug 2021 11:57:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f06b766e-959e-445e-6aeb-08d9573f11c5
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2542A07124855C26BAA325108EF19@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZAmBnr3rdTSNxE4OqT9ozQ2o0xm4zp4RD+ubN9t8giAmUYPEkucOS6P9OwzfQbynMRwrQ9gGROdjrGxBrBqO35Xl9Db6n4Kb27GF5cS++LbSuMiIgs9AsJZO111mc4Es3CzgtMYTPvv9auCdlw2DeFSvYogA6YZ6kqsPBrnSYoeMFogsXXYFs7O+AB0uVrBxQOHB6SRjOwbvvh+Nacv5RKvND1eaRZfhX3PCRGYYyCsYWHlT4tzTtD5gaeCYc8KuWjlaauuLspVdPsdBHeUb0511XO8lMMTAVLXFfucVLmgY3PUysIHhOxylb5B8cHmQMb28j361QlY9456oQ2UknLvh376GKZnAKGKc0NnuJKi676Oh5q+KOuiHcIl6U8mpzdZWXSJaWEER0ulMfH3kVRDY534b9jtTLgZiIb6pgZdFvXnqOAW+7sDvY9LaXEDXdCo2eGv0zGgs3l1P+jWkAiqqvaoKT4XdXSVK1B8tYQSaimgMmlVV4gyCrCoNoqSXX7n/446uzaKxItIfaZVcMXrIDq3sHCuOMGTKaHVOCtHlc8BcFnLIsSCQAAMqndE4KRxBuiI13d8PM/QAVOS0NMInr/isaF41VIiKrueZf2Bv5I0e3SEAYjoYvnjkYe57yFrojtST75UwOYfF0Lo2fAsFSYGiGlQyUMD6fwt8+aCcIqc90yPUu/qBWyo7Orylr56hfkEqXGIA1ufC+1fIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(4326008)(83380400001)(66946007)(316002)(2906002)(2616005)(956004)(36756003)(86362001)(6666004)(8936002)(38350700002)(26005)(6916009)(38100700002)(478600001)(5660300002)(8676002)(6486002)(66476007)(66556008)(186003)(7696005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TxbB6qoohgjAb6vnlGMjn8CE7k5HPGdEYdhfUi23NM36jlyTZdkN5bdPgwme?=
 =?us-ascii?Q?/gACK1CBRyF6qjPbiBvIoCfMTyfNgsMu0RarmhqiE0Dx73vhjDCD7D82tPj7?=
 =?us-ascii?Q?4Ixo3VwJtiwFtMIpDNPqAgaxwiJ5AbvQQRy1sWveJqa1TCqFioSwCVznE++B?=
 =?us-ascii?Q?XlL13+t4o2oqs1f6J+w02b+ZDwCkijmts6VV2h5OA1Sb3/5XdEPDU/0jsyYB?=
 =?us-ascii?Q?4j7oJivCuhk/JuF0hYYhoTc08I1x1LKaRjcaJjJRXz5fIiAUIx9YmYCOG850?=
 =?us-ascii?Q?vBYNGdZuiOCJULSEaiQcG9sBzH+zS9RLCM1poaJlLheAdv5s82wKN07WBC42?=
 =?us-ascii?Q?xlfGL4lpgO2Rkf4IwOBWxflmc1hkMroaDG4IZrZyzphv+Goz/uYxzU9ayvTZ?=
 =?us-ascii?Q?5dJIkqekuxHA43DtVLHqt0LV/cM5eLUfIcZgnYEV0xuECnO+9o52UBJAfzk+?=
 =?us-ascii?Q?SQuZm/oaA08D3dTOFaxg9w/Qx+7WzloEGYImZMhuwpuM70oDMzQVLXYu/8kJ?=
 =?us-ascii?Q?zVtnwC9xwLlxYctBls2LSrVwvhKRlL8txpLEIpzQLuCIEO8aYahocmTIZruf?=
 =?us-ascii?Q?xIZmW5bZ/WAbIkr38jVPkDap9DPZwXASxpSdXM/MiXd4x/6U2PY4ycWecSiN?=
 =?us-ascii?Q?rRQo1ep4rWNpgXtpoPprvnAG8lf4ZLaYZZpxbHYcaY0lQow8OPC4adLln9+X?=
 =?us-ascii?Q?gnY8SIUJt1Bj8WnozmdmKUfaGsbwXsYfCjT/8Exj7j1C4PvlewAKCMPyMzPl?=
 =?us-ascii?Q?O01I+PrSItD6v7SDrTRWgZiyiZEfOJGzHFqaS/vLB7jHz3StyVTwKsOJq0vB?=
 =?us-ascii?Q?bjFrOXHiRUodyvT7jl1AcDR+VD21bldjP7e0lU2vTYvKCnv8aeGBheeclObm?=
 =?us-ascii?Q?nmzBwROFtkq3LsMt84BZMmf9aQ8I7mz7DnkRuzZnuK33NKs0n68uECRg7iku?=
 =?us-ascii?Q?R8/Wxp49yahZECgeJQGqcShFqws5YdJtSq51j1uDVQTzCFvm41xbyPgU3ImA?=
 =?us-ascii?Q?flaHLsB/z9d+Metu2J/bCS3BuYutvRUPuBGCFMspR8tUYCoZY2PhiRaOPvDI?=
 =?us-ascii?Q?OmwtVLj+k3C6V8f99wpHyhfARpqx2RVpz0lK+ykE0SXfNBzPctnSDs7rIB89?=
 =?us-ascii?Q?BZglUNZisSqZeFEMsBUC7p4vJQhC6trCxn1A4hGWCqf1dFicA3hBskglpAgO?=
 =?us-ascii?Q?F/C04a1M/h/u+smpCzzkVHkEoqFS/CTD43rE5wuaYOXm2aEF6ISd6EFi+AiL?=
 =?us-ascii?Q?0QwF02VPNnyVptxH8Ek7+bKYoqDQXA/ImLPBby6NjMjlPQTeDo0pZOjaOwGV?=
 =?us-ascii?Q?OO5VhPpzhSz+pk4xEDAkXBfk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06b766e-959e-445e-6aeb-08d9573f11c5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 11:57:44.3661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELTrp7KBriLSqq7fH3m/e1buUMZdz4ENJZ0EPl1sv+RebE0CYiqIg1A9j6Ccz1ZHaWRj8drUrNwWRlZDfGkiYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
Received-SPF: softfail client-ip=40.107.212.81;
 envelope-from=Ashish.Kalra@amd.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ashish Kalra <ashish.kalra@amd.com>

KVM_HC_MAP_GPA_RANGE hypercall is used by the SEV guest to notify a
change in the page encryption status to the hypervisor. The hypercall
should be invoked only when the encryption attribute is changed from
encrypted -> decrypted and vice versa. By default all guest pages are
considered encrypted.

The hypercall exits to userspace with KVM_EXIT_HYPERCALL exit code,
currently this is used only by SEV guests for guest page encryptiion
status tracking. Add support to handle this exit and invoke SEV
shared regions list handlers.

Add support for SEV guest shared regions and implementation of the
SEV shared regions list.

Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 include/sysemu/sev.h      |   3 ++
 linux-headers/linux/kvm.h |   3 ++
 target/i386/kvm/kvm.c     |  46 +++++++++++++++++
 target/i386/sev.c         | 105 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 157 insertions(+)

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index faa02bdd3d..3b913518c0 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -29,5 +29,8 @@ int sev_inject_launch_secret(const char *hdr, const char *secret,
 
 int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
 void sev_es_set_reset_vector(CPUState *cpu);
+int sev_remove_shared_regions_list(unsigned long gfn_start,
+                                   unsigned long gfn_end);
+int sev_add_shared_regions_list(unsigned long gfn_start, unsigned long gfn_end);
 
 #endif
diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index bcaf66cc4d..78874f4d43 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -343,6 +343,7 @@ struct kvm_run {
 		} mmio;
 		/* KVM_EXIT_HYPERCALL */
 		struct {
+#define KVM_HC_MAP_GPA_RANGE 12
 			__u64 nr;
 			__u64 args[6];
 			__u64 ret;
@@ -1113,6 +1114,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
 #define KVM_CAP_ARM_MTE 205
 
+#define KVM_EXIT_HYPERCALL_VALID_MASK (1 << KVM_HC_MAP_GPA_RANGE)
+
 #ifdef KVM_CAP_IRQ_ROUTING
 
 struct kvm_irq_routing_irqchip {
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index e69abe48e3..303722e06f 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -125,6 +125,7 @@ static int has_xsave;
 static int has_xcrs;
 static int has_pit_state2;
 static int has_exception_payload;
+static int has_map_gpa_range;
 
 static bool has_msr_mcg_ext_ctl;
 
@@ -1916,6 +1917,15 @@ int kvm_arch_init_vcpu(CPUState *cs)
         c->eax = MAX(c->eax, KVM_CPUID_SIGNATURE | 0x10);
     }
 
+    if (sev_enabled()) {
+        c = cpuid_find_entry(&cpuid_data.cpuid,
+                             KVM_CPUID_FEATURES | kvm_base, 0);
+        c->eax |= (1 << KVM_FEATURE_MIGRATION_CONTROL);
+        if (has_map_gpa_range) {
+            c->eax |= (1 << KVM_FEATURE_HC_MAP_GPA_RANGE);
+        }
+    }
+
     cpuid_data.cpuid.nent = cpuid_i;
 
     cpuid_data.cpuid.padding = 0;
@@ -2277,6 +2287,17 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    has_map_gpa_range = kvm_check_extension(s, KVM_CAP_EXIT_HYPERCALL);
+    if (has_map_gpa_range) {
+        ret = kvm_vm_enable_cap(s, KVM_CAP_EXIT_HYPERCALL, 0,
+                                KVM_EXIT_HYPERCALL_VALID_MASK);
+        if (ret < 0) {
+            error_report("kvm: Failed to enable MAP_GPA_RANGE cap: %s",
+                         strerror(-ret));
+            return ret;
+        }
+    }
+
     ret = kvm_get_supported_msrs(s);
     if (ret < 0) {
         return ret;
@@ -4429,6 +4450,28 @@ static int kvm_handle_tpr_access(X86CPU *cpu)
     return 1;
 }
 
+static int kvm_handle_exit_hypercall(X86CPU *cpu, struct kvm_run *run)
+{
+    /*
+     * Currently this exit is only used by SEV guests for
+     * guest page encryption status tracking.
+     */
+    if (run->hypercall.nr == KVM_HC_MAP_GPA_RANGE) {
+        unsigned long enc = run->hypercall.args[2];
+        unsigned long gpa = run->hypercall.args[0];
+        unsigned long npages = run->hypercall.args[1];
+        unsigned long gfn_start = gpa >> TARGET_PAGE_BITS;
+        unsigned long gfn_end = gfn_start + npages;
+
+        if (enc) {
+            sev_remove_shared_regions_list(gfn_start, gfn_end);
+         } else {
+            sev_add_shared_regions_list(gfn_start, gfn_end);
+         }
+    }
+    return 0;
+}
+
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     static const uint8_t int3 = 0xcc;
@@ -4690,6 +4733,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
         /* already handled in kvm_arch_post_run */
         ret = 0;
         break;
+    case KVM_EXIT_HYPERCALL:
+        ret = kvm_handle_exit_hypercall(cpu, run);
+        break;
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 1901c9ade4..6d44b7ad21 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -40,6 +40,10 @@
 #define TYPE_SEV_GUEST "sev-guest"
 OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
 
+struct shared_region {
+    unsigned long gfn_start, gfn_end;
+    QTAILQ_ENTRY(shared_region) list;
+};
 
 /**
  * SevGuestState:
@@ -83,6 +87,8 @@ struct SevGuestState {
     uint32_t reset_cs;
     uint32_t reset_ip;
     bool reset_data_valid;
+
+    QTAILQ_HEAD(, shared_region) shared_regions_list;
 };
 
 #define DEFAULT_GUEST_POLICY    0x1 /* disable debug */
@@ -996,6 +1002,7 @@ int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
     add_migration_state_change_notifier(&sev_migration_state_notify);
 
     cgs_class->memory_encryption_ops = &sev_memory_encryption_ops;
+    QTAILQ_INIT(&sev->shared_regions_list);
 
     cgs->ready = true;
 
@@ -1499,6 +1506,104 @@ int sev_load_incoming_page(QEMUFile *f, uint8_t *ptr)
     return sev_receive_update_data(f, ptr);
 }
 
+int sev_remove_shared_regions_list(unsigned long start, unsigned long end)
+{
+    SevGuestState *s = sev_guest;
+    struct shared_region *pos;
+
+    QTAILQ_FOREACH(pos, &s->shared_regions_list, list) {
+        unsigned long l, r;
+        unsigned long curr_gfn_end = pos->gfn_end;
+
+        /*
+         * Find if any intersection exists ?
+         * left bound for intersecting segment
+         */
+        l = MAX(start, pos->gfn_start);
+        /* right bound for intersecting segment */
+        r = MIN(end, pos->gfn_end);
+        if (l <= r) {
+            if (pos->gfn_start == l && pos->gfn_end == r) {
+                QTAILQ_REMOVE(&s->shared_regions_list, pos, list);
+            } else if (l == pos->gfn_start) {
+                pos->gfn_start = r;
+            } else if (r == pos->gfn_end) {
+                pos->gfn_end = l;
+            } else {
+                /* Do a de-merge -- split linked list nodes */
+                struct shared_region *shrd_region;
+
+                pos->gfn_end = l;
+                shrd_region = g_malloc0(sizeof(*shrd_region));
+                if (!shrd_region) {
+                    return 0;
+                }
+                shrd_region->gfn_start = r;
+                shrd_region->gfn_end = curr_gfn_end;
+                QTAILQ_INSERT_AFTER(&s->shared_regions_list, pos,
+                                    shrd_region, list);
+            }
+        }
+        if (end <= curr_gfn_end) {
+            break;
+        }
+    }
+    return 0;
+}
+
+int sev_add_shared_regions_list(unsigned long start, unsigned long end)
+{
+    struct shared_region *shrd_region;
+    struct shared_region *pos;
+    SevGuestState *s = sev_guest;
+
+    if (QTAILQ_EMPTY(&s->shared_regions_list)) {
+        shrd_region = g_malloc0(sizeof(*shrd_region));
+        if (!shrd_region) {
+            return -1;
+        }
+        shrd_region->gfn_start = start;
+        shrd_region->gfn_end = end;
+        QTAILQ_INSERT_TAIL(&s->shared_regions_list, shrd_region, list);
+        return 0;
+    }
+
+    /*
+     * shared regions list is a sorted list in ascending order
+     * of guest PA's and also merges consecutive range of guest PA's
+     */
+    QTAILQ_FOREACH(pos, &s->shared_regions_list, list) {
+        /* handle duplicate overlapping regions */
+        if (start >= pos->gfn_start && end <= pos->gfn_end) {
+            return 0;
+        }
+        if (pos->gfn_end < start) {
+            continue;
+        }
+        /* merge consecutive guest PA(s) -- forward merge */
+        if (pos->gfn_start <= start && pos->gfn_end >= start) {
+            pos->gfn_end = end;
+            return 0;
+        }
+        break;
+    }
+    /*
+     * Add a new node
+     */
+    shrd_region = g_malloc0(sizeof(*shrd_region));
+    if (!shrd_region) {
+        return -1;
+    }
+    shrd_region->gfn_start = start;
+    shrd_region->gfn_end = end;
+    if (pos) {
+        QTAILQ_INSERT_BEFORE(pos, shrd_region, list);
+    } else {
+        QTAILQ_INSERT_TAIL(&s->shared_regions_list, shrd_region, list);
+    }
+    return 1;
+}
+
 static void
 sev_register_types(void)
 {
-- 
2.17.1


