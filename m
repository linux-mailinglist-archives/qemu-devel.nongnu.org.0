Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F6F2B5135
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 20:32:57 +0100 (CET)
Received: from localhost ([::1]:53206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekFE-0007Ce-15
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 14:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1kejcc-0001gd-LS
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:53:02 -0500
Received: from mail-dm6nam12on2078.outbound.protection.outlook.com
 ([40.107.243.78]:20225 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Ashish.Kalra@amd.com>)
 id 1kejcZ-0004oB-Ut
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:53:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaCN9QcRfnUSMpS/nD8vQavZowWUy8e52CduWWFxosH5Xb6qfyrkxvqTZCZo2FkNRJjIy7ZGCp5MaHhpVILMQoMH8ht2DLtPeJfUuk1Ydub7jcZGeoZHhYYWy5ERSAV7+YTuq9/7UIZ6fs3xQbr09ezQJbV2PDD/IY6zFccS3x10ld+68yGV905SyBBp8grcqQKhGgXs5MvlsllEAnRZ73YWInBmlCqQTshWH4d9r8Fin3rr240o/uZ5uTFjxUyXlq1dTJu0M7s0Uzu5zvVPq2SowFEbkzgPhhxESBDO0xptnvE3TifdCs9eMXyT8B/er3Sq9wiHCqnSrAm293LixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK36Zg/1QYy9Yne1JbuCJ0smnKXs7y6N61xip+7YPN0=;
 b=WUrqLms3TG9sCYNk0l6Mr/GW3LsJV6DeZz5N73t7SLEeZdnQaCHR5sijhp7616HYvpjeVG32bFlNizQvI7ZZY0XlzGH1Wy7rhab8TyqGOMLzJKHovDqUOwak2uFfNgylRj4860fJ4JARTshOPl3nFz4KOLFU4FjYsNYUK16Nctb7MVKvA7S54NJc1UAaposlGd6roVTwkIV1ARogMtLzqOR9Ppv77w4qLhbJ1kTBeeRPesvyeuJ6l5SeGnmJ6/vU6xaCCZ/R5u5voapLQ322+uvwBZEYtB9Xl65za0TdbHYokrJuvHk4Rvxr/iPNlBrGNrfAXg1SbpbXOFJ1gPtzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vK36Zg/1QYy9Yne1JbuCJ0smnKXs7y6N61xip+7YPN0=;
 b=UjoSyWbSHKlEg8Qh/F/WXjLCPGLqlyOxxZqRZypljqvFUHgJsG2ENboUD134JJjpiNFVx8SD6dyBtv/EAXla0MapI7aJelpk0ScKdCPqgTrBSidoG9l25iU+etmPPsH/xsBzn8Pi7H55K+Uii3Tql0xbZvQLZG7exQ9bhoS1zOc=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 18:52:57 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec%3]) with mapi id 15.20.3541.025; Mon, 16 Nov 2020
 18:52:57 +0000
From: Ashish Kalra <Ashish.Kalra@amd.com>
To: pbonzini@redhat.com
Subject: [PATCH 10/11] sev/i386: add SEV specific MemoryDebugOps.
Date: Mon, 16 Nov 2020 18:52:45 +0000
Message-Id: <fad5f676176aa01eff3eac4d2c0ecbbc8c975681.1605316268.git.ashish.kalra@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605316268.git.ashish.kalra@amd.com>
References: <cover.1605316268.git.ashish.kalra@amd.com>
Content-Type: text/plain
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: DM6PR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:5:337::31) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server.amd.com (165.204.77.1) by
 DM6PR07CA0098.namprd07.prod.outlook.com (2603:10b6:5:337::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.21 via Frontend Transport; Mon, 16 Nov 2020 18:52:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e819050-fb0c-4261-1b71-08d88a60d4f8
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45578FC31795DDF9854FBD8C8EE30@SA0PR12MB4557.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FnJzGL790xU81cF0ssuD8T87S9h5+63zZ23NSLfkCBGiwv0tKfUYk7+PbrtyOeqI9uxFnEGDqGTNeQxd2dzjV990nWFHB/cz64GMEa+c3iOA+e/CAH6+PeG1QIHkMqfGZ/6z3Z8+bmilac5a3rO5Ya7I8YjDK1pOLVuD9Q2eMblEPVg+3dC2mGTj0TMA7aOoEMQBc4S2jH/C+aq0NT/zgB61cyCS+t5YoXvBZu8gHj7WXJDOVxdci4r9avO3vyBEZyLb3zcnUaPyCf4idB5QPXASOuzxV74hWKTqg8ojI3xiu8eepsdS0YOfTL/0PlLf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2767.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(66946007)(36756003)(86362001)(2616005)(956004)(8936002)(83380400001)(66476007)(66556008)(5660300002)(6666004)(2906002)(6486002)(478600001)(7696005)(8676002)(6916009)(16526019)(186003)(26005)(52116002)(316002)(7416002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: sV5RY2O7bmNrluNDFwrE+3Qth+mHlUrDTl+QQ6ZdC6iTTOv7ZrgEBhaMBgZWDF+eKWqAvSKdc2EfSVw0VusaLmAcvy0uW4hhtIbCyARLwxBucPV9fGPijifqkzXnxe4urSUsyuI7Xk9LX6XOmblNtP54g6gZSH0nSOd4RSPQDQeLdG26wBXjxcM7DwxjiqML7lY6N4Uo0Eu0qlWtb++CesBEMSdEZEI5LjbtW3A30+f4pq7Xk9y3EJhkzXMuQq/O7J9nxdBp6/gLIOiGm6GTSxlg9idyAwMIurw5jkRaZ1GnMFDYHbHkiGDe0jKEULdEH67plT3wjpUeoaY4SmEhzf1/EWoWRpS1AEaWUg33SerusURgga7T87Ymdf9QYCAaPGG3tbeovTFZBhehFeMnoHQfcwNOkydszYxi5KVTDotioVVL7lmyzSQniYlzFTr8NzGPhsA7isWaadfi2S1dY5J2eiszK0gFHQvTcgV9+PPFBtp1iYiTTOXUFgJ5U2AVu59fB709zjdsYZOp3kAsm2FZaKcspI9H+R7Do8ca0TQ1jUipyYX5VAvXuFaSVsJbwukEWiVba7L4iS8zE//zX5XDiFVWGO4m/lIMqcRXthbENyu5uEgDp08z9XQuNXFfLY3hytWlAcnpeMXR6WN9X7oPRddwhca/MR5xCQSRPc72d60GfM/J2iqioWhDHCvF9cDyPs19aw8Tt5VJslbPmD9bHS4BezE/5DXojyTKaWbjjaHwQgplWNo4zVNuKBwtB+n0pYAyPDvQpyeisqncwgity2bIVJOjqkLgqYkfCYQP5Ws3ETd6dQhF2M2zLTANbG1koJMA+hm4T8iFOJyVRMsdLX4bz7hobFmOaRl8fAp7xsKgD8HF3ckSg2+aAC8ZYJY+zDu+qjENdQY5dAJeFA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e819050-fb0c-4261-1b71-08d88a60d4f8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 18:52:57.0866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2R61lQ/L/LFp0ICw+WLr9vxW0SJPgksqeQ2Q8iGzx7wJnYKloZ+paPPD0ujJ1vDvsU/AUwzOVvD9Lv79JGsdwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4557
Received-SPF: none client-ip=40.107.243.78; envelope-from=Ashish.Kalra@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:52:58
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FORGED_SPF_HELO=1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Thomas.Lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, mtosatti@redhat.com,
 ssg.sos.patches@amd.com, armbru@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ashish Kalra <ashish.kalra@amd.com>

Add SEV specific MemoryDebugOps which override the default MemoryDebugOps
when SEV memory encryption is enabled. The SEV specific MemoryDebugOps
invoke the generic address_space_rw_debug helpers which will then invoke
the memory region specific callbacks to handle and access encrypted memory
when guest RAM is accessed.

Also invoke the memory encryption API to override any CPU class specific
callbacks to handle memory encryption.

Specifically for SEV we override CPU class specific guest MMU/page-table walker
to invoke a SEV specific handler which can handle guest encrypted memory and
also clear C-bit when walking SEV guest page table.

Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>
---
 accel/kvm/kvm-all.c  |   1 +
 accel/kvm/sev-stub.c |   4 +
 include/sysemu/sev.h |  11 +++
 target/i386/kvm.c    |   4 +
 target/i386/sev.c    | 185 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 205 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 042205e3e1..6d812d5b09 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2234,6 +2234,7 @@ static int kvm_init(MachineState *ms)
         kvm_state->memcrypt_encrypt_data = sev_encrypt_data;
         kvm_state->memcrypt_debug_ops_memory_region =
             sev_set_debug_ops_memory_region;
+        kvm_state->memcrypt_debug_ops_cpu_state = sev_set_debug_ops_cpu_state;
     }
 
     ret = kvm_arch_init(ms, s);
diff --git a/accel/kvm/sev-stub.c b/accel/kvm/sev-stub.c
index 3f1f0ef217..ad27226058 100644
--- a/accel/kvm/sev-stub.c
+++ b/accel/kvm/sev-stub.c
@@ -19,6 +19,10 @@ void sev_set_debug_ops_memory_region(void *handle, MemoryRegion *mr)
 {
 }
 
+void sev_set_debug_ops_cpu_state(void *handle, CPUState *cpu)
+{
+}
+
 int sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len)
 {
     abort();
diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
index 6c37247915..e6f176b85b 100644
--- a/include/sysemu/sev.h
+++ b/include/sysemu/sev.h
@@ -19,4 +19,15 @@
 void *sev_guest_init(const char *id);
 int sev_encrypt_data(void *handle, uint8_t *ptr, uint64_t len);
 void sev_set_debug_ops_memory_region(void *handle, MemoryRegion *mr);
+void sev_set_debug_ops_cpu_state(void *handle, CPUState *cpu);
+hwaddr sev_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                         MemTxAttrs *attrs);
+MemTxResult sev_address_space_read_debug(AddressSpace *as, hwaddr addr,
+                                         MemTxAttrs attrs, void *ptr,
+                                         hwaddr len);
+MemTxResult sev_address_space_write_rom_debug(AddressSpace *as,
+                                              hwaddr addr,
+                                              MemTxAttrs attrs,
+                                              const void *ptr,
+                                              hwaddr len);
 #endif
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index cf46259534..7a2d10b745 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -1838,6 +1838,10 @@ int kvm_arch_init_vcpu(CPUState *cs)
 
     kvm_init_msrs(cpu);
 
+    if (kvm_memcrypt_enabled()) {
+        kvm_memcrypt_set_debug_ops_cpu_state(cs);
+    }
+
     r = hyperv_init_vcpu(cpu);
     if (r) {
         goto fail;
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 3036fb3e43..b942593bc8 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -843,6 +843,191 @@ sev_set_debug_ops_memory_region(void *handle, MemoryRegion *mr)
     memory_region_set_ram_debug_ops(mr, &sev_ops);
 }
 
+hwaddr sev_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                         MemTxAttrs *attrs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    target_ulong pde_addr, pte_addr;
+    uint64_t pte;
+    int32_t a20_mask;
+    uint32_t page_offset;
+    int page_size;
+    uint64_t me_mask;
+
+    me_mask = sev_get_me_mask();
+
+    *attrs = cpu_get_mem_attrs(env);
+
+    a20_mask = x86_get_a20_mask(env);
+    if (!(env->cr[0] & CR0_PG_MASK)) {
+        pte = addr & a20_mask;
+        page_size = 4096;
+    } else if (env->cr[4] & CR4_PAE_MASK) {
+        target_ulong pdpe_addr;
+        uint64_t pde, pdpe;
+
+#ifdef TARGET_X86_64
+        if (env->hflags & HF_LMA_MASK) {
+            bool la57 = env->cr[4] & CR4_LA57_MASK;
+            uint64_t pml5e_addr, pml5e;
+            uint64_t pml4e_addr, pml4e;
+            int32_t sext;
+
+            /* test virtual address sign extension */
+            sext = la57 ? (int64_t)addr >> 56 : (int64_t)addr >> 47;
+            if (sext != 0 && sext != -1) {
+                return -1;
+            }
+
+            if (la57) {
+                pml5e_addr = ((env->cr[3] & ~0xfff & me_mask) +
+                        (((addr >> 48) & 0x1ff) << 3)) & a20_mask;
+                pml5e = ldq_phys_debug(cs, pml5e_addr) & me_mask;
+                if (!(pml5e & PG_PRESENT_MASK)) {
+                    return -1;
+                }
+            } else {
+                pml5e = env->cr[3] & me_mask;
+            }
+
+            pml4e_addr = ((pml5e & PG_ADDRESS_MASK) +
+                    (((addr >> 39) & 0x1ff) << 3)) & a20_mask;
+            pml4e = ldq_phys_debug(cs, pml4e_addr) & me_mask;
+            if (!(pml4e & PG_PRESENT_MASK)) {
+                return -1;
+            }
+            pdpe_addr = ((pml4e & PG_ADDRESS_MASK) +
+                         (((addr >> 30) & 0x1ff) << 3)) & a20_mask;
+            pdpe = ldq_phys_debug(cs, pdpe_addr) & me_mask;
+            if (!(pdpe & PG_PRESENT_MASK)) {
+                return -1;
+            }
+            if (pdpe & PG_PSE_MASK) {
+                page_size = 1024 * 1024 * 1024;
+                pte = pdpe;
+                goto out;
+            }
+
+        } else
+#endif
+        {
+            pdpe_addr = ((env->cr[3] & ~0x1f & me_mask) +
+                         ((addr >> 27) & 0x18)) & a20_mask;
+            pdpe = ldq_phys_debug(cs, pdpe_addr) & me_mask;
+            if (!(pdpe & PG_PRESENT_MASK)) {
+                return -1;
+            }
+        }
+
+        pde_addr = ((pdpe & PG_ADDRESS_MASK) +
+                    (((addr >> 21) & 0x1ff) << 3)) & a20_mask;
+        pde = ldq_phys_debug(cs, pde_addr) & me_mask;
+        if (!(pde & PG_PRESENT_MASK)) {
+            return -1;
+        }
+        if (pde & PG_PSE_MASK) {
+            /* 2 MB page */
+            page_size = 2048 * 1024;
+            pte = pde;
+        } else {
+            /* 4 KB page */
+            pte_addr = ((pde & PG_ADDRESS_MASK) +
+                        (((addr >> 12) & 0x1ff) << 3)) & a20_mask;
+            page_size = 4096;
+            pte = ldq_phys_debug(cs, pte_addr) & me_mask;
+        }
+        if (!(pte & PG_PRESENT_MASK)) {
+            return -1;
+        }
+    } else {
+        uint32_t pde;
+
+        /* page directory entry */
+        pde_addr = ((env->cr[3] & ~0xfff & me_mask) +
+                    ((addr >> 20) & 0xffc)) & a20_mask;
+        pde = x86_ldl_phys(cs, pde_addr) & me_mask;
+        if (!(pde & PG_PRESENT_MASK)) {
+            return -1;
+        }
+        if ((pde & PG_PSE_MASK) && (env->cr[4] & CR4_PSE_MASK)) {
+            pte = pde | ((pde & 0x1fe000LL) << (32 - 13));
+            page_size = 4096 * 1024;
+        } else {
+            /* page directory entry */
+            pte_addr = ((pde & ~0xfff) + ((addr >> 10) & 0xffc)) & a20_mask;
+            pte = ldl_phys_debug(cs, pte_addr) & me_mask;
+            if (!(pte & PG_PRESENT_MASK)) {
+                return -1;
+            }
+            page_size = 4096;
+        }
+        pte = pte & a20_mask;
+    }
+
+#ifdef TARGET_X86_64
+out:
+#endif
+    pte &= PG_ADDRESS_MASK & ~(page_size - 1);
+    page_offset = (addr & TARGET_PAGE_MASK) & (page_size - 1);
+    return pte | page_offset;
+}
+
+MemTxResult sev_address_space_write_rom_debug(AddressSpace *as,
+                                              hwaddr addr,
+                                              MemTxAttrs attrs,
+                                              const void *ptr,
+                                              hwaddr len)
+{
+    /* set debug attrs to indicate memory access is from the debugger */
+    attrs.debug = 1;
+
+    /*
+     * Invoke address_space_rw debug helper
+     */
+    return address_space_write_rom_debug(as, addr, attrs, ptr, len);
+}
+
+MemTxResult sev_address_space_read_debug(AddressSpace *as, hwaddr addr,
+                                         MemTxAttrs attrs, void *ptr,
+                                         hwaddr len)
+{
+    /* set debug attrs to indicate memory access is from the debugger */
+    attrs.debug = 1;
+
+    /*
+     * Invoke address_space_rw debug helper
+     */
+    return address_space_read_debug(as, addr, attrs, ptr, len);
+}
+
+static const MemoryDebugOps sev_debug_ops = {
+    .read = sev_address_space_read_debug,
+    .write = sev_address_space_write_rom_debug
+};
+
+void
+sev_set_debug_ops_cpu_state(void *handle, CPUState *cs)
+{
+    SevGuestState *s = handle;
+    CPUClass *cc;
+
+    /* If policy does not allow debug then no need to register ops */
+    if (s->policy & SEV_POLICY_NODBG) {
+        return;
+    }
+
+    cc = CPU_GET_CLASS(cs);
+
+    /*
+     * Override guest MMU lookup/page-table-walker with SEV specific
+     * callback to handle encrypted memory.
+     */
+    cc->get_phys_page_attrs_debug = sev_cpu_get_phys_page_attrs_debug;
+
+    address_space_set_debug_ops(&sev_debug_ops);
+}
+
 static void
 sev_register_types(void)
 {
-- 
2.17.1


