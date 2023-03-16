Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC806BC2C7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 01:33:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcbWo-00046W-4R; Wed, 15 Mar 2023 20:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YGMSZAsKCpc13B5IC5PKE77FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--ackerleytng.bounces.google.com>)
 id 1pcbWm-000462-4v
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:32 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YGMSZAsKCpc13B5IC5PKE77FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--ackerleytng.bounces.google.com>)
 id 1pcbWk-0007hx-AK
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:31 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 f1-20020a17090aa78100b00239fd9e3e17so64148pjq.5
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 17:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678926688;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=K90xoVX+0RlzLAw3SfN8qTyLgxMNh2Rq4fRe4RbG85I=;
 b=d8uc3IApbYmz26P2pZurWd/mdMnPn+5Qfc7rz6kuRm/Rdx7nODA9CSqEzNbHzvos3x
 RveM5uzlBa4alqsey/A+ZQ+F9FkBIhKp+vzmydZ7x8yVdpJ1dFg58aZJtFtCTBrdqTeM
 jtglH5cHaz9xRzfcMN6bC6InRMKXNsMGC/lp63mFpBGrilMy6mUNN3C7pjzFUdepgkuU
 +cgfLXerxqml3OAS1MvZtFFYDjNKV6KkSDelOKwW/Ftb9Njw0KqVRUjV1fgWAjc/PHx5
 vlmTiVMmyjWJKxE37zalK36nTXI7Daq2qNoskHBh/u2Z2VdJEZ3uNpydLhqA1aIDw3qB
 CSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678926688;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K90xoVX+0RlzLAw3SfN8qTyLgxMNh2Rq4fRe4RbG85I=;
 b=eIN7qn4d0M7wfKc/D65pTaO3PrZLcZ44EhQxi4lsefwRtLZskJUeU9JhvMoui4u37c
 Qp1yngHvs8kKukzjjHCEiCGsBMC7oWLSzHlMy35LOU9A3c+EJ66fYPqjVwGp2z6VjW2x
 c7eBgP70rDt0TIBcCuvgTfO3tNtiHrJNeqO/Lg9+Ew1uYaGp39uvQyUuLmJcvp4aJDLJ
 ypwfdYbqk8+mt71WpK2eaAyZ8e0UkSiaw/xTBYY5/6qAgT4oBnHWBMfMbglVQRAXoKZy
 senqCocOPgvEcbV585kfcKFj8FwED1JXvzydoeLuyRlVhH2YYdeAQTIJ8AnhrDqh8gYc
 ZUbg==
X-Gm-Message-State: AO0yUKUkBRpLlk+xwCzH0Z4+64qlunZlVPooCezAMy8FhY198pIXfLpb
 lQrCA+J13w8X+XvLgSNM3fjjBtAhklTbLKNoog==
X-Google-Smtp-Source: AK7set81FNM6aZ2KKc0RpczFG5Lx+WgCWICz/KzlEJw1NjziYveSgQLqdoN474MmozxZF5HPAo3b3AmF9lnSjz983g==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a05:6a00:198d:b0:5a9:9713:1dc with
 SMTP id d13-20020a056a00198d00b005a9971301dcmr677531pfl.6.1678926688561; Wed,
 15 Mar 2023 17:31:28 -0700 (PDT)
Date: Thu, 16 Mar 2023 00:31:01 +0000
In-Reply-To: <cover.1678926164.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1678926164.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <287d6e84dc788d84599392ca5d65864201f9a6a4.1678926164.git.ackerleytng@google.com>
Subject: [RFC PATCH 08/10] KVM: selftests: Default private_mem_conversions_test
 to use 1 restrictedmem file for test data
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3YGMSZAsKCpc13B5IC5PKE77FF7C5.3FDH5DL-45M5CEFE7EL.FI7@flex--ackerleytng.bounces.google.com;
 helo=mail-pj1-x104a.google.com
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

Default the private/shared memory conversion tests to use a single
file (when multiple memslots are requested), while executing on
multiple vCPUs in parallel, to stress-test the restrictedmem subsystem.

Also add a flag to allow multiple files to be used.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../kvm/x86_64/private_mem_conversions_test.c | 52 ++++++++++++++-----
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
index afaf8d0e52e6..ca30f0f05c39 100644
--- a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
@@ -324,7 +324,8 @@ void *thread_function(void *input)
 }
 
 static void add_memslot_for_vcpu(
-	struct kvm_vm *vm, enum vm_mem_backing_src_type src_type, uint8_t vcpu_id)
+	struct kvm_vm *vm, enum vm_mem_backing_src_type src_type, uint8_t vcpu_id,
+	int restrictedmem_fd, uint64_t restrictedmem_offset)
 {
 	uint64_t gpa = data_gpa_base_for_vcpu_id(vcpu_id);
 	uint32_t slot = DATA_SLOT_BASE + vcpu_id;
@@ -336,7 +337,8 @@ static void add_memslot_for_vcpu(
 
 static void test_mem_conversions(enum vm_mem_backing_src_type src_type,
 				 uint8_t nr_vcpus, uint32_t iterations,
-				 bool use_multiple_memslots)
+				 bool use_multiple_memslots,
+				 bool use_different_restrictedmem_files)
 {
 	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
 	pthread_t threads[KVM_MAX_VCPUS];
@@ -356,21 +358,28 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type,
 	vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 << KVM_HC_MAP_GPA_RANGE));
 
 	npages_for_all_vcpus = DATA_SIZE / vm->page_size * nr_vcpus;
+	virt_map(vm, DATA_GPA_BASE, DATA_GPA_BASE, npages_for_all_vcpus);
 
 	if (use_multiple_memslots) {
-		for (i = 0; i < nr_vcpus; i++)
-			add_memslot_for_vcpu(vm, src_type, i);
+		int fd = memfd_restricted(0);
+		int offset = 0;
+
+		for (i = 0; i < nr_vcpus; i++) {
+			if (use_different_restrictedmem_files) {
+				if (i > 0)
+					fd = memfd_restricted(0);
+			} else {
+				offset = i * DATA_GPA_SPACING;
+			}
+
+			add_memslot_for_vcpu(vm, src_type, i, fd, offset);
+		}
 	} else {
 		vm_userspace_mem_region_add(
 			vm, src_type, DATA_GPA_BASE, DATA_SLOT_BASE,
 			npages_for_all_vcpus, KVM_MEM_PRIVATE);
 	}
 
-	virt_map(vm, DATA_GPA_BASE, DATA_GPA_BASE, npages_for_all_vcpus);
-
-	for (i = 0; i < nr_vcpus; i++)
-		add_memslot_for_vcpu(vm, src_type, i);
-
 	for (i = 0; i < nr_vcpus; i++) {
 		args[i].vm = vm;
 		args[i].vcpu = vcpus[i];
@@ -382,7 +391,7 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type,
 	for (i = 0; i < nr_vcpus; i++)
 		pthread_join(threads[i], NULL);
 
-	if (!use_multiple_memslots)
+	if (!use_multiple_memslots || !use_different_restrictedmem_files)
 		test_invalidation_code_unbound(vm, 1, DATA_SIZE * nr_vcpus);
 	else
 		test_invalidation_code_unbound(vm, nr_vcpus, DATA_SIZE);
@@ -391,8 +400,9 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type,
 static void usage(const char *command)
 {
 	puts("");
-	printf("usage: %s [-h] [-m] [-s mem-type] [-n number-of-vcpus] [-i number-of-iterations]\n",
-	       command);
+	printf("usage: %s\n", command);
+	printf("       [-h] [-m] [-f] [-s mem-type]\n");
+	printf("       [-n number-of-vcpus] [-i number-of-iterations]\n");
 	puts("");
 	backing_src_help("-s");
 	puts("");
@@ -404,6 +414,9 @@ static void usage(const char *command)
 	puts("");
 	puts(" -m: use multiple memslots (default: use 1 memslot)");
 	puts("");
+	puts(" -f: use different restrictedmem files for each memslot");
+	puts("     (default: use 1 restrictedmem file for all memslots)");
+	puts("");
 }
 
 int main(int argc, char *argv[])
@@ -412,12 +425,13 @@ int main(int argc, char *argv[])
 	uint8_t nr_vcpus = 2;
 	uint32_t iterations = 10;
 	bool use_multiple_memslots = false;
+	bool use_different_restrictedmem_files = false;
 	int opt;
 
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_EXIT_HYPERCALL));
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_PROTECTED_VM));
 
-	while ((opt = getopt(argc, argv, "mhs:n:i:")) != -1) {
+	while ((opt = getopt(argc, argv, "fmhs:n:i:")) != -1) {
 		switch (opt) {
 		case 'n':
 			nr_vcpus = atoi_positive("nr_vcpus", optarg);
@@ -431,6 +445,9 @@ int main(int argc, char *argv[])
 		case 'm':
 			use_multiple_memslots = true;
 			break;
+		case 'f':
+			use_different_restrictedmem_files = true;
+			break;
 		case 'h':
 		default:
 			usage(argv[0]);
@@ -438,6 +455,13 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	test_mem_conversions(src_type, nr_vcpus, iterations, use_multiple_memslots);
+	if (!use_multiple_memslots && use_different_restrictedmem_files) {
+		printf("Overriding -f flag: ");
+		puts("Using just 1 restrictedmem file since only 1 memslot is to be used.");
+		use_different_restrictedmem_files = false;
+	}
+
+	test_mem_conversions(src_type, nr_vcpus, iterations, use_multiple_memslots,
+			     use_different_restrictedmem_files);
 	return 0;
 }
-- 
2.40.0.rc2.332.ga46443480c-goog


