Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 106AD6BC2C0
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 01:32:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcbWm-000461-F8; Wed, 15 Mar 2023 20:31:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XmMSZAsKCpUz193GA3NIC55DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--ackerleytng.bounces.google.com>)
 id 1pcbWk-00045b-Kr
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:30 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XmMSZAsKCpUz193GA3NIC55DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--ackerleytng.bounces.google.com>)
 id 1pcbWi-0007gd-PO
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:30 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 g12-20020aa7874c000000b0062519d49a5dso172471pfo.12
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678926687;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=JBLPG3XthGG9faiSvk5U/ET6qjyhuWi/SwHOth1Ucac=;
 b=I+hk1kHXyTdyRHWR/E+Fe4D/KjC/hhFWZULnWPbpGXImZDU13NH2r0CvjRWyfCgLxX
 /nkIHP6zbtD+kRkLZz1i9msvu36P2j1F1ed2x92tbTloVbSMlV2L5X7YmVhhKmZ4DqvM
 XpXOnOkjDklzkljzqZGV/y4Nh+8aXvLV39ccn20yIQi1+cuwUBgQwtL3GYk3OKYOFzt5
 fGTKHpxrFE/fRCl2mKHPSZMCdRAxw4bOce1hR/tDvln+tyvmSAorwJz0NO2G3/AQeBf+
 ctLv6vLizdn+6uzwfijXtM/b902mBW+WM3hgf9E7bWyK12V6rTdbKghkmJDtmACEkOkZ
 v8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678926687;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JBLPG3XthGG9faiSvk5U/ET6qjyhuWi/SwHOth1Ucac=;
 b=aG6l/5niJoFBoGjDD7k5dcoBkN7bZjcsPC0z6NtjZ0ktPLdio8FZnaJKwGM6SNg/ci
 /iEl7+eJTz05JwmvXn5WtaUJoSfhLVuYgRq0CzYMLgidLMREZLzLU531CvTrzZK7E1cv
 24ENVV5+sxQrsjvHDTKZWCjxVqI7/o0t3i4VRHU6kO3JR2A/MbAbVA0g4+c27g2DseOy
 Ds5HlGwdiJRCTOZ9tN17K8Ahpnng4Y6JdknzeU52iAseoJ2Mcstw/OQzStpgBWKH4HAY
 HA2QAV3nMN6RNrSiBX3inEK0Tjxn2QOi3VuaOGheQm4dvCcc1oGOOWkWAwa4Z71WpeFJ
 DA4A==
X-Gm-Message-State: AO0yUKXrmM3Xh5CJZPeViG5tgN0K8Gpr6SyfaTnPXavcHnpNW22b6bJh
 AHnmLVsBUTp0+UjbODSQNIcpk17qMlCRuuqXbg==
X-Google-Smtp-Source: AK7set8wyHBYS0yNjAY2Bu6NPZk7sDhPcWzuxoadwL3xHiIjGr+DZnA4k/ntT0jv/7rXx9SUD16F0j0DYIAvrg8IcQ==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:902:e749:b0:1a0:4aa3:3a9a with
 SMTP id p9-20020a170902e74900b001a04aa33a9amr581092plf.2.1678926686991; Wed,
 15 Mar 2023 17:31:26 -0700 (PDT)
Date: Thu, 16 Mar 2023 00:31:00 +0000
In-Reply-To: <cover.1678926164.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1678926164.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <59ff32ad0aa9e3533a96064d1ae07aba11f55924.1678926164.git.ackerleytng@google.com>
Subject: [RFC PATCH 07/10] KVM: selftests: Add
 vm_userspace_mem_region_add_with_restrictedmem
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org
Cc: aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com, 
 david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, jmattson@google.com, joro@8bytes.org, 
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, 
 luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com, 
 michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com, 
 pbonzini@redhat.com, qperret@google.com, rppt@kernel.org, seanjc@google.com, 
 shuah@kernel.org, steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3XmMSZAsKCpUz193GA3NIC55DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--ackerleytng.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Provide new function to allow restrictedmem's fd and offset to be
specified in selftests.

No functional change intended to vm_userspace_mem_region_add.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/include/kvm_util_base.h     |  4 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    | 46 +++++++++++++++++--
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util_base.h b/tools/testing/selftests/kvm/include/kvm_util_base.h
index b6531a4063bb..c1ac82332ca4 100644
--- a/tools/testing/selftests/kvm/include/kvm_util_base.h
+++ b/tools/testing/selftests/kvm/include/kvm_util_base.h
@@ -486,6 +486,10 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	enum vm_mem_backing_src_type src_type,
 	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
 	uint32_t flags);
+void vm_userspace_mem_region_add_with_restrictedmem(struct kvm_vm *vm,
+	enum vm_mem_backing_src_type src_type,
+	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
+	uint32_t flags, int restrictedmem_fd, uint64_t restrictedmem_offset);
 
 void vm_mem_region_set_flags(struct kvm_vm *vm, uint32_t slot, uint32_t flags);
 void vm_mem_region_move(struct kvm_vm *vm, uint32_t slot, uint64_t new_gpa);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index d0e6b10f140f..d6bfcfc5cdea 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -898,6 +898,43 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	enum vm_mem_backing_src_type src_type,
 	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
 	uint32_t flags)
+{
+	int restrictedmem_fd;
+
+	restrictedmem_fd = flags & KVM_MEM_PRIVATE ? memfd_restricted(0) : 0;
+	vm_userspace_mem_region_add_with_restrictedmem(
+		vm, src_type, guest_paddr, slot, npages, flags,
+		restrictedmem_fd, 0);
+}
+
+/*
+ * VM Userspace Memory Region Add With restrictedmem
+ *
+ * Input Args:
+ *   vm - Virtual Machine
+ *   src_type - Storage source for this region.
+ *              NULL to use anonymous memory.
+ *   guest_paddr - Starting guest physical address
+ *   slot - KVM region slot
+ *   npages - Number of physical pages
+ *   flags - KVM memory region flags (e.g. KVM_MEM_LOG_DIRTY_PAGES)
+ *   restrictedmem_fd - restrictedmem_fd for use with restrictedmem
+ *   restrictedmem_offset - offset within restrictedmem_fd to be used
+ *
+ * Output Args: None
+ *
+ * Return: None
+ *
+ * Allocates a memory area of the number of pages specified by npages
+ * and maps it to the VM specified by vm, at a starting physical address
+ * given by guest_paddr.  The region is created with a KVM region slot
+ * given by slot, which must be unique and < KVM_MEM_SLOTS_NUM.  The
+ * region is created with the flags given by flags.
+ */
+void vm_userspace_mem_region_add_with_restrictedmem(struct kvm_vm *vm,
+	enum vm_mem_backing_src_type src_type,
+	uint64_t guest_paddr, uint32_t slot, uint64_t npages,
+	uint32_t flags, int restrictedmem_fd, uint64_t restrictedmem_offset)
 {
 	int ret;
 	struct userspace_mem_region *region;
@@ -1011,8 +1048,8 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	region->backing_src_type = src_type;
 
 	if (flags & KVM_MEM_PRIVATE) {
-		region->region.restrictedmem_fd = memfd_restricted(0);
-		region->region.restrictedmem_offset = 0;
+		region->region.restrictedmem_fd = restrictedmem_fd;
+		region->region.restrictedmem_offset = restrictedmem_offset;
 
 		TEST_ASSERT(region->region.restrictedmem_fd >= 0,
 			    "Failed to create restricted memfd");
@@ -1030,10 +1067,11 @@ void vm_userspace_mem_region_add(struct kvm_vm *vm,
 	TEST_ASSERT(ret == 0, "KVM_SET_USER_MEMORY_REGION2 IOCTL failed,\n"
 		"  rc: %i errno: %i\n"
 		"  slot: %u flags: 0x%x\n"
-		"  guest_phys_addr: 0x%lx size: 0x%lx restricted fd: %d\n",
+		"  guest_phys_addr: 0x%lx size: 0x%lx\n"
+		"  restricted fd: %d restricted_offset: 0x%llx\n",
 		ret, errno, slot, flags,
 		guest_paddr, (uint64_t) region->region.memory_size,
-		region->region.restrictedmem_fd);
+		region->region.restrictedmem_fd, region->region.restrictedmem_offset);
 
 	/* Add to quick lookup data structures */
 	vm_userspace_mem_region_gpa_insert(&vm->regions.gpa_tree, region);
-- 
2.40.0.rc2.332.ga46443480c-goog


