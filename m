Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EAD3E00CD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 14:04:58 +0200 (CEST)
Received: from localhost ([::1]:37544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBFdp-0005e1-4h
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 08:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFZZ-0007uY-TH
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 08:00:34 -0400
Received: from mail-dm6nam10on2062.outbound.protection.outlook.com
 ([40.107.93.62]:57078 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1mBFZU-0004GH-Dc
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 08:00:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOKyiyWcHEtkAQbRliO+8tBNR/ZfZMR5sZdQe31QeW5IRmsl+hY+/ZtivBIZ0F/7EQB2IRi6Aq0yWNGk2vAZ6bqlmD5WrpRihsNh3DSIod+Y89unNOXGmlMjdZwlj54Xkhn+Uc2lar50Ak2qFWb9mn6g/5/frf5O1wq83Yq8tInmo7SCRptT86c1QxAueZ48J8Rb+MMcmWl2iLOVYv0MTiL9AabELTrtyWl4rCWTlAw6lqMcep0CU9k/391/6X4sunxuTKJCKatmYTaPakxyoaxzKJvc3ArnqwS1fqJFC/d7pMyFmMyOZ/PIKE85ZGxKY92E5QUQ3b4r2Tbmj7C+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FhzpYyrzegUpjgCW9d4+L7qa6nSmo3kUjXt0GibAbY=;
 b=YEFsW3KGY2nSZlpuEZuCWja9hH4Fniq2YzmhSu08s9kEioHo0/RDGdv4vEAKrb387y+vRx8z1oL0AkfqGS7Pu1v1Q+CRAKKWPxaYY48deW+9ZqqvO34DcOHbUqD8FZtV8B48tkDTXxQs1zWAXtZuyG2n7eE58dWDFLL+dWW+qjwf9ELuCe1wEGrQnU018anUOEnILPQmnkl7Wi/IMUfaLPekAtHQnHy9NLk6M2Rda2Av2PL79PDSU9NQVIih2TYrCjgMVt67t3WNVkP4PbZJ9PQi8hHz9G85fHyqAqParY0dDz38Tz21ZqiTDOTOQeZpBAZh35PAWOzn+mqUkuzSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FhzpYyrzegUpjgCW9d4+L7qa6nSmo3kUjXt0GibAbY=;
 b=vpgha8ucgg5iBzLVGcJjqqTkTUql6VrIocjNYpNMT4d8FzhrMtQ4LFHt8QssWeJPxgLEj3764pBN4oW0P74E4XaohGoK0zKMa7NsibPhbpRUz9Vhb5JWMyEH957zLGsA6rkCHZTa2T2O9tNGbex0b+DBpMu2Zoa3Te4vzre3Ar4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 12:00:24 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::491e:2642:bae2:8b73%7]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 12:00:24 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, Thomas.Lendacky@amd.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, ehabkost@redhat.com, dovmurik@linux.vnet.ibm.com,
 tobin@ibm.com, jejb@linux.ibm.com
Subject: [PATCH v4 14/14] kvm: Add support for userspace MSR filtering and
 handling of MSR_KVM_MIGRATION_CONTROL.
Date: Wed,  4 Aug 2021 12:00:11 +0000
Message-Id: <67935c3fd5f29a2ba9d67a91255276d3b9ccc99b.1628076205.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1628076205.git.ashish.kalra@amd.com>
References: <cover.1628076205.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0027.namprd21.prod.outlook.com
 (2603:10b6:805:106::37) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 SN6PR2101CA0027.namprd21.prod.outlook.com (2603:10b6:805:106::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.1 via Frontend
 Transport; Wed, 4 Aug 2021 12:00:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eb14aec-945d-45a9-973c-08d9573f70ee
X-MS-TrafficTypeDiagnostic: SN1PR12MB2542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB25424ACC5288AC18E30441968EF19@SN1PR12MB2542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7U5qhhBj4A6LamR9U219+qZHMKoQJI7zcui0AVsHMrFiu/8jCh5tmITWy7iSOVgKxJl7AM2h5cNj/jsJwZnLcDtnNSX326utj8stnyOu6UZfGNpO6+9BGcRIZPi1U/taKe4LG3T2BOuAXGHGTT3ibB72s6StXj62rRGzEek6ryo+zehzeVkIdsrfuyI3LUTpHLutcGGAxtDUmp2Ky7Q286U5brgweDsAxhLjlaPmePbf7ndF/yrKXOwzs0n31nu2Mh4p86Svv5A/bdyc765Y9tMPX+mx+v//pz2/LZK5rdkbonRvducJkZmKM0DUCMrO0ZgpLU1aZkGknpz7+HLP/BkhShAKNRv7YrUCZZ/goqOpnA7EdL3DQo/gOvWAIJcgO80MuS0tIIQnRlET/2Loc6qydT98L2s1DmAMltomxtnyywUNbfMEnDbvuKdi0h9xJE7vkD6nJuO7MqT6x4MWt0cdrxwvMbUT+dW2c4WLas0ih1jJP/GDOGeQ+oNF3xZrq/+6iqLaL8Ij/UdOlvbdutl0Edfs8Q1wwbnslGH+yhZSvW/fAwffe8hyIkfW4/vSFLPMscvwvhLdGZnXLeE2F7kvScdOSS4idVYF8JF4PTvSYtZNT1uMg9iPqPjIYcR7kt5LGa1bbitQNwJ1tG+ifwNkLsCbIVS8kuEQig/4IlEU8kksSC0suxTeRVeGnFoBVx1z/alW0a4YqHVRYU9zOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(4326008)(83380400001)(66946007)(316002)(2906002)(2616005)(956004)(36756003)(86362001)(6666004)(8936002)(38350700002)(26005)(6916009)(38100700002)(478600001)(5660300002)(8676002)(6486002)(66476007)(66556008)(186003)(7696005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xT9Eo6OfOO4W0XAwmzYkj1DVKk3SeRl81M7eUcrIogeShgFkQDoEmPmrjkIU?=
 =?us-ascii?Q?m0/KPzBgZFA2bydsEw/PwLswAfZ2ysSJwdiTacZhiP+IfLSTnYgyBxCWT2re?=
 =?us-ascii?Q?8LQKrUw7SbLwdIB9GCepkSpsDZmi5/6+HLho1UVJAsKkQh/mzXSFiDr6AiqI?=
 =?us-ascii?Q?R01KHcYNeKnZvBrPh6I7uzpAxjrALvkbVy5GBsH45u6PtRnRAYHkjMNVSZpi?=
 =?us-ascii?Q?NsXoKSKLd6NTH43ZrUuwg4fQtMNjCvXDU1NkrYbB3zsAbWVCuxdSrDVGNrFu?=
 =?us-ascii?Q?nizJwLwJTNWv3Ug06NHmMGh4PREszZ9D1ZFCrkhXMklzpXpL0KIk5oX5Ei5G?=
 =?us-ascii?Q?8xAwrZq+9TQPeuKEfEP4g2cz+Z1W+MOK8lwo5KsMHjxrfT1CwffzeAOo+cKT?=
 =?us-ascii?Q?r63u9C84y7RpvBprrQNWEswMlxMcS9MDorEz+5qJtAamNsZAINMCLQhrincJ?=
 =?us-ascii?Q?x/EnAnfP/dbTRyISLNn9FSMqpnrvfCek2yqHAkzJXpc+zSDYSTDuWdTDrnRp?=
 =?us-ascii?Q?PMCyZCPgURbZXQXfrZiDIQirLrEeWxDsphyI1uyEB/HuxTvRAzYvz84Jmc3N?=
 =?us-ascii?Q?yNtAr4D67wuhFUdDbFDlZf8gVGDDlX6S8NBVgcUHAui9PnKzQpN7az+dTCbC?=
 =?us-ascii?Q?u4nPM7fH2kRoJ1OCpJGb2U0RhzB9EyqXC/rLOCo+DH5z9pM/OJ2AwJbUT3GP?=
 =?us-ascii?Q?c0Ls49cqKqaVI5vvAi+c7G1bqngn0oAa5f3fg9TskptQ/XBdl+Ffl3qk+JWg?=
 =?us-ascii?Q?gmwcot+XQxHayb5/kRsZxPLbVNKC776cupxgjrWZM68r4AKkXSuB6pij8wpH?=
 =?us-ascii?Q?nAZ8lGz+THQxrCWDljX0ErlFQ0c8oYj8/+gZQPDKHNyPkceW8lUrIwxXbHFJ?=
 =?us-ascii?Q?SMU1ovkAmGfDRKYh1VpoNep/UGfyCezY1b2lGqPY+JTJavTJtIJsBise/wxF?=
 =?us-ascii?Q?E/p1fz5FEC2gDdHMwyqabry7UwHOuBFJegN04036zpQNZ+K3R17rK2J2vZse?=
 =?us-ascii?Q?zxN9Ysdu8msFMrzrcInl6eTotfS/PMCJD/sXlHF43/cDAHRxjwLr8dPDelDt?=
 =?us-ascii?Q?380zgxExiv4zuyTIenIFFM6hurY44EkwbVXPkTJWkkZPdCQZfRLWsSSen9X8?=
 =?us-ascii?Q?fQoKVH8VV2hPzeD6+KTsm3c2MU1ZsUPKeu7kIPFprgCnRxUTgWKhE6GOcOSv?=
 =?us-ascii?Q?eRGsx5QudHoW1hmlXSJmwvWMH4jv31HPMhhaYZ22/BuhBaAC7lZVy9npkAYx?=
 =?us-ascii?Q?l+j2m0CQeQcfBdYvq9LT3vppCJVBLyBRfyCJNFZ0M0KoEWcehITB7JgG5Q1y?=
 =?us-ascii?Q?QPSl7tGEZjVjhgppFxJGucEW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb14aec-945d-45a9-973c-08d9573f70ee
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 12:00:24.0945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axJKYEqIVI+pZPjB051TcpUgv/JBrqNmvWtxASlMG+CJOb3u9qx4SKgXT0yySh0rMUiCKDQCXeUQxSjdz4WnAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2542
Received-SPF: softfail client-ip=40.107.93.62;
 envelope-from=Ashish.Kalra@amd.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ashish Kalra <ashish.kalra@amd.com>

Add support for userspace MSR filtering using KVM_X86_SET_MSR_FILTER
ioctl and handling of MSRs in userspace. Currently this is only used
for SEV guests which use MSR_KVM_MIGRATION_CONTROL to indicate if the
guest is enabled and ready for migration.

KVM arch code calls into SEV guest specific code to delete the
SEV migrate blocker which has been setup at SEV_LAUNCH_FINISH.

Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 include/sysemu/sev.h  |  1 +
 target/i386/kvm/kvm.c | 61 +++++++++++++++++++++++++++++++++++++++++++
 target/i386/sev.c     |  6 +++++
 3 files changed, 68 insertions(+)

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 023e694ac4..d04890113c 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -38,5 +38,6 @@ int sev_add_shared_regions_list(unsigned long gfn_start, unsigned long gfn_end);
 int sev_save_outgoing_shared_regions_list(QEMUFile *f);
 int sev_load_incoming_shared_regions_list(QEMUFile *f);
 bool sev_is_gfn_in_unshared_region(unsigned long gfn);
+void sev_del_migrate_blocker(void);
 
 #endif
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 303722e06f..785b8fae6b 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2240,6 +2240,19 @@ static void register_smram_listener(Notifier *n, void *unused)
                                  &smram_address_space, 1);
 }
 
+static __u64 bitmap;
+struct kvm_msr_filter msr_filter_allow = {
+    .flags = KVM_MSR_FILTER_DEFAULT_ALLOW,
+    .ranges = {
+        {
+            .flags = KVM_MSR_FILTER_READ | KVM_MSR_FILTER_WRITE,
+            .nmsrs = 1,
+            .base = MSR_KVM_MIGRATION_CONTROL,
+            .bitmap = (uint8_t *)&bitmap,
+        }
+    }
+};
+
 int kvm_arch_init(MachineState *ms, KVMState *s)
 {
     uint64_t identity_base = 0xfffbc000;
@@ -2298,6 +2311,21 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         }
     }
 
+    ret = kvm_check_extension(s, KVM_CAP_X86_USER_SPACE_MSR) ?
+          kvm_check_extension(s, KVM_CAP_X86_MSR_FILTER) :
+          -ENOTSUP;
+    if (ret > 0) {
+        ret = kvm_vm_enable_cap(s, KVM_CAP_X86_USER_SPACE_MSR,
+                                0, KVM_MSR_EXIT_REASON_FILTER);
+        if (ret == 0) {
+            ret = kvm_vm_ioctl(s, KVM_X86_SET_MSR_FILTER, &msr_filter_allow);
+            if (ret < 0) {
+                error_report("kvm: KVM_X86_SET_MSR_FILTER failed : %s",
+                             strerror(-ret));
+            }
+        }
+    }
+
     ret = kvm_get_supported_msrs(s);
     if (ret < 0) {
         return ret;
@@ -4472,6 +4500,35 @@ static int kvm_handle_exit_hypercall(X86CPU *cpu, struct kvm_run *run)
     return 0;
 }
 
+/*
+ * Currently this exit is only used by SEV guests for
+ * MSR_KVM_MIGRATION_CONTROL to indicate if the guest
+ * is ready for migration.
+ */
+static int kvm_handle_x86_msr(X86CPU *cpu, struct kvm_run *run)
+{
+    static uint64_t msr_kvm_migration_control;
+
+    if (run->msr.index != MSR_KVM_MIGRATION_CONTROL) {
+        run->msr.error = -EINVAL;
+        return -1;
+    }
+
+    switch (run->exit_reason) {
+    case KVM_EXIT_X86_RDMSR:
+        run->msr.error = 0;
+        run->msr.data = msr_kvm_migration_control;
+        break;
+    case KVM_EXIT_X86_WRMSR:
+        msr_kvm_migration_control = run->msr.data;
+        if (run->msr.data == KVM_MIGRATION_READY) {
+            sev_del_migrate_blocker();
+        }
+        run->msr.error = 0;
+    }
+    return 0;
+}
+
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     static const uint8_t int3 = 0xcc;
@@ -4736,6 +4793,10 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
     case KVM_EXIT_HYPERCALL:
         ret = kvm_handle_exit_hypercall(cpu, run);
         break;
+    case KVM_EXIT_X86_RDMSR:
+    case KVM_EXIT_X86_WRMSR:
+        ret = kvm_handle_x86_msr(cpu, run);
+        break;
     default:
         fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
         ret = -1;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index d22f2ef6dc..58f74db0e3 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -791,6 +791,12 @@ sev_launch_finish(SevGuestState *sev)
     }
 }
 
+void
+sev_del_migrate_blocker(void)
+{
+    migrate_del_blocker(sev_mig_blocker);
+}
+
 static int
 sev_receive_finish(SevGuestState *s)
 {
-- 
2.17.1


