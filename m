Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5B56BC2AA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 01:32:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcbWl-00045Z-1E; Wed, 15 Mar 2023 20:31:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3XWMSZAsKCpQy082F92MHB44CC492.0CAE2AI-12J29BCB4BI.CF4@flex--ackerleytng.bounces.google.com>)
 id 1pcbWj-00045B-92
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:29 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3XWMSZAsKCpQy082F92MHB44CC492.0CAE2AI-12J29BCB4BI.CF4@flex--ackerleytng.bounces.google.com>)
 id 1pcbWh-0007g3-FM
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:29 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 ie21-20020a17090b401500b0023b4ba1e433so81282pjb.0
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 17:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678926685;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=36lklAKITNKcvpGi9bBaV0pg92rnpur43Kuea+YFpfM=;
 b=swpVj1SmNmgvWlTTZKcMha4lkIplKfRmILDkyWfcGRLXWLuIlK2d6RzDWw2bYkkCHP
 soiW4nXc7/hBbAleU8BqoI0AbG96N9laDULGWA+oYmBxb9+GZWi0B0T26gJnbwIFOCwo
 5kpRG9JizdS1Y6EbQlta+wo8Fhd+ryKKJGTqSzbsLYaWB10pCI4jhMlJ9DGRJ4DSAtGk
 3aahsJCHmb9Uk47t1vgWw/SYjxk2SvIyeXgaVgaNp1TPH4oC+vl3KgGYbWyD1TlOcBi1
 gvD1hR4NtBHZOvW4SAlG3B1IpFX0JT8Zq0hcF2742mhE+c1PzdSmxBYs2Pwk5wn4zjuL
 RaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678926685;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=36lklAKITNKcvpGi9bBaV0pg92rnpur43Kuea+YFpfM=;
 b=tQW9GRhY5GZkdloxIIT02zMhgro4xqkn38AJ2bNhnglxSXGyWZUovo7sGHiW+IAWoO
 fshjvYEfVd/0JE374Dbz1lsbARvzDAi7YY7Xw9HMq65+TAbQlWH4Y2Y+sGB/MxCeEwTD
 sBgRAnThCUKfFSGGIgNrBFwQc/kM+sQD1A1rRKFwXfzOfINxtRFgZpHBjUQEu1/Qna4j
 Y+iUY0tDMT0U4nIcMi8iKpiZG0Ptp4kvsJEhtEP4JZOvkKyzGiOUbXHbpYtJxWHUhUQ+
 1Lt9vsiz9jI7QfBHzzy5xMWgGroY9BipqxpZQuRP6dDsTh3R1Vz9LG38fVrmg9bONK0X
 cPqg==
X-Gm-Message-State: AO0yUKXfg5JT9afxaIeUIJTm3ZvBhG3OeGOfMWTN7pWUmVEh17oY377M
 nLBeqP1buMS/EfdGb86ejBKOPdQLaCeSpNPsjw==
X-Google-Smtp-Source: AK7set9HhZ92PQ2OitTC4KZtYEJK0EXqsjjwLnoPjbnEyW7GD+pO7NNEnen5rh0nKaexCpnSy3z8RFk0Cysc1DaScg==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:902:d50d:b0:1a0:5402:b17f with
 SMTP id b13-20020a170902d50d00b001a05402b17fmr634600plg.6.1678926685342; Wed,
 15 Mar 2023 17:31:25 -0700 (PDT)
Date: Thu, 16 Mar 2023 00:30:59 +0000
In-Reply-To: <cover.1678926164.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1678926164.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <c554a93f38f5a79627a341309ffa974531d35697.1678926164.git.ackerleytng@google.com>
Subject: [RFC PATCH 06/10] KVM: selftests: Default private_mem_conversions_test
 to use 1 memslot for test data
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
 envelope-from=3XWMSZAsKCpQy082F92MHB44CC492.0CAE2AI-12J29BCB4BI.CF4@flex--ackerleytng.bounces.google.com;
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
memslot, while executing on multiple vCPUs in parallel, to stress-test
the restrictedmem subsystem.

Also add a flag to allow multiple memslots to be used.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../kvm/x86_64/private_mem_conversions_test.c | 30 +++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
index 14aa90e9a89b..afaf8d0e52e6 100644
--- a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
@@ -335,7 +335,8 @@ static void add_memslot_for_vcpu(
 }
 
 static void test_mem_conversions(enum vm_mem_backing_src_type src_type,
-				 uint8_t nr_vcpus, uint32_t iterations)
+				 uint8_t nr_vcpus, uint32_t iterations,
+				 bool use_multiple_memslots)
 {
 	struct kvm_vcpu *vcpus[KVM_MAX_VCPUS];
 	pthread_t threads[KVM_MAX_VCPUS];
@@ -355,6 +356,16 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type,
 	vm_enable_cap(vm, KVM_CAP_EXIT_HYPERCALL, (1 << KVM_HC_MAP_GPA_RANGE));
 
 	npages_for_all_vcpus = DATA_SIZE / vm->page_size * nr_vcpus;
+
+	if (use_multiple_memslots) {
+		for (i = 0; i < nr_vcpus; i++)
+			add_memslot_for_vcpu(vm, src_type, i);
+	} else {
+		vm_userspace_mem_region_add(
+			vm, src_type, DATA_GPA_BASE, DATA_SLOT_BASE,
+			npages_for_all_vcpus, KVM_MEM_PRIVATE);
+	}
+
 	virt_map(vm, DATA_GPA_BASE, DATA_GPA_BASE, npages_for_all_vcpus);
 
 	for (i = 0; i < nr_vcpus; i++)
@@ -371,13 +382,16 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type,
 	for (i = 0; i < nr_vcpus; i++)
 		pthread_join(threads[i], NULL);
 
-	test_invalidation_code_unbound(vm, nr_vcpus, DATA_SIZE);
+	if (!use_multiple_memslots)
+		test_invalidation_code_unbound(vm, 1, DATA_SIZE * nr_vcpus);
+	else
+		test_invalidation_code_unbound(vm, nr_vcpus, DATA_SIZE);
 }
 
 static void usage(const char *command)
 {
 	puts("");
-	printf("usage: %s [-h] [-s mem-type] [-n number-of-vcpus] [-i number-of-iterations]\n",
+	printf("usage: %s [-h] [-m] [-s mem-type] [-n number-of-vcpus] [-i number-of-iterations]\n",
 	       command);
 	puts("");
 	backing_src_help("-s");
@@ -388,6 +402,8 @@ static void usage(const char *command)
 	puts(" -i: specify the number iterations of memory conversion");
 	puts("     tests to run. (default: 10)");
 	puts("");
+	puts(" -m: use multiple memslots (default: use 1 memslot)");
+	puts("");
 }
 
 int main(int argc, char *argv[])
@@ -395,12 +411,13 @@ int main(int argc, char *argv[])
 	enum vm_mem_backing_src_type src_type = DEFAULT_VM_MEM_SRC;
 	uint8_t nr_vcpus = 2;
 	uint32_t iterations = 10;
+	bool use_multiple_memslots = false;
 	int opt;
 
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_EXIT_HYPERCALL));
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_PROTECTED_VM));
 
-	while ((opt = getopt(argc, argv, "hs:n:i:")) != -1) {
+	while ((opt = getopt(argc, argv, "mhs:n:i:")) != -1) {
 		switch (opt) {
 		case 'n':
 			nr_vcpus = atoi_positive("nr_vcpus", optarg);
@@ -411,6 +428,9 @@ int main(int argc, char *argv[])
 		case 's':
 			src_type = parse_backing_src_type(optarg);
 			break;
+		case 'm':
+			use_multiple_memslots = true;
+			break;
 		case 'h':
 		default:
 			usage(argv[0]);
@@ -418,6 +438,6 @@ int main(int argc, char *argv[])
 		}
 	}
 
-	test_mem_conversions(src_type, nr_vcpus, iterations);
+	test_mem_conversions(src_type, nr_vcpus, iterations, use_multiple_memslots);
 	return 0;
 }
-- 
2.40.0.rc2.332.ga46443480c-goog


