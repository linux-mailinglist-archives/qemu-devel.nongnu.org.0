Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D276BC2AF
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 01:32:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcbWo-00046v-TT; Wed, 15 Mar 2023 20:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3YmMSZAsKCpk35D7KE7RMG99HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--ackerleytng.bounces.google.com>)
 id 1pcbWn-00046V-LJ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:33 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3YmMSZAsKCpk35D7KE7RMG99HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--ackerleytng.bounces.google.com>)
 id 1pcbWm-0007ih-3H
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:33 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 l12-20020a170903120c00b001a1241a9bb1so21020plh.11
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 17:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678926690;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xKXEz6/mGmWtcTzhu61L6SyW9ch3P6ySrkhZdBbEs24=;
 b=bOjlcixbSYLhJ8wlZFJqykn9M5Vc0cFpb5g7LhT4djxRWIFNy4JccJg4iGmlnPSQyG
 lJkRIlzLGQZ3CT8tV3X05ZRlfpMlsWsYm10BZk0r/Rv+yvfQdYk0fGtvbClQaHHaYv5l
 Oj+/kJI0SJy2+jeH1DiW21OupNOPFM9Wh7wNdPPay5eUxl09yuqaKdEkkyKrOhWCrZJX
 e3EV/eGevF9LE/ooEptOTOPMZBAmj7BKZBkDjiPROvuVe+4bwZbAe4m1RyZsPF9uX6pM
 WIBv4RjDLE054xRE18NVAkWPZAWP+NMIosMPzwAwGqSXU4pxgbXQRbLdQ2u4zKCbVIO2
 DV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678926690;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xKXEz6/mGmWtcTzhu61L6SyW9ch3P6ySrkhZdBbEs24=;
 b=RgpjGIt9r6hFmgVQ+c4ZGaYLwgmXxCPcY5lfWe+LsPld5mI+Fej9pB4Zml98DNMzGJ
 RrB5wbvYqCZjaGLUKa2xjFrV9OG2YQry6/O7s1GIhmjWRwCKT4nqFreH3gX2UfMGvXnK
 QjpjCVoW/bZqh8XxYW/5DPGR9LVWzuut1lnGbpBVo/D/rs4y699GWezvijlXFwQBt76V
 w/WWelEgLJS3rbguD3Kj41jSqz+foXXNFVm4hn9fAQD4zOsGqb9u5jU+jbJEAW5Tg0YY
 zQ3Yjlj8KTqySZgYHRXumx0td18tOLWZAofpXuK7naqup/lof2VLdQdhJBu0rNa3gRgK
 O6mQ==
X-Gm-Message-State: AO0yUKVIjoqWWBFlUpnwqN3WXj24Ndv1z8tzmhqj3RPOO0/ChR7dd8eV
 CUs/1+Qimj5ybnWofVbKHAdp9+9ewmUWNTBqDw==
X-Google-Smtp-Source: AK7set8gW1ruUe+jZfx4vo3AOKGV2qgKk/o0c2WgfJNyT6l/gKi5/qNPPNY0SZ250Rg6tfQ0OBKmkU3mHKKgzrPR/w==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a65:6392:0:b0:50b:cc91:5534 with SMTP
 id h18-20020a656392000000b0050bcc915534mr320262pgv.2.1678926690322; Wed, 15
 Mar 2023 17:31:30 -0700 (PDT)
Date: Thu, 16 Mar 2023 00:31:02 +0000
In-Reply-To: <cover.1678926164.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1678926164.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <bdc28afc6bfba32441d6b6d17ec17318a64123ab.1678926164.git.ackerleytng@google.com>
Subject: [RFC PATCH 09/10] KVM: selftests: Add tests around sharing a
 restrictedmem fd
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3YmMSZAsKCpk35D7KE7RMG99HH9E7.5HFJ7FN-67O7EGHG9GN.HK9@flex--ackerleytng.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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

Tests that

+ Different memslots in the same VM should be able to share a
  restrictedmem_fd
+ A second VM cannot share the same offsets in a restrictedmem_fd
+ Different VMs should be able to share the same restrictedmem_fd, as
  long as the offsets in the restrictedmem_fd are different

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../selftests/kvm/set_memory_region_test.c    | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index cc727d11569e..789c413e2a67 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -401,7 +401,7 @@ static bool set_private_region_failed(struct kvm_vm *vm, void *hva,
 static void test_private_regions(void)
 {
 	int ret;
-	struct kvm_vm *vm;
+	struct kvm_vm *vm, *vm2;
 	void *mem;
 	int fd;
 
@@ -416,7 +416,7 @@ static void test_private_regions(void)
 
 	vm = __vm_create(shape, 1, 0);
 
-	mem = mmap(NULL, MEM_REGION_SIZE * 2, PROT_READ | PROT_WRITE,
+	mem = mmap(NULL, MEM_REGION_SIZE * 3, PROT_READ | PROT_WRITE,
 		   MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE, -1, 0);
 	TEST_ASSERT(mem != MAP_FAILED, "Failed to mmap() host");
 
@@ -448,8 +448,31 @@ static void test_private_regions(void)
 	TEST_ASSERT(ret == -1 && errno == EINVAL,
 		    "Set overlapping restrictedmem_offset should fail");
 
-	munmap(mem, MEM_REGION_SIZE * 2);
+	ret = __vm_set_user_memory_region2(vm, MEM_REGION_SLOT + 1,
+					   KVM_MEM_PRIVATE,
+					   MEM_REGION_GPA + MEM_REGION_SIZE,
+					   MEM_REGION_SIZE,
+					   mem + MEM_REGION_SIZE,
+					   fd, MEM_REGION_SIZE);
+	TEST_ASSERT(!ret,
+		    "Different memslots should be able to share a restrictedmem_fd");
+
+	vm2 = __vm_create(shape, 1, 0);
+	TEST_ASSERT(set_private_region_failed(vm2, mem + 2 * MEM_REGION_SIZE, fd, 0),
+		    "Pages (offsets) of a restrictedmem_fd should be exclusive to a VM");
+
+	ret = __vm_set_user_memory_region2(vm2, MEM_REGION_SLOT,
+					   KVM_MEM_PRIVATE,
+					   MEM_REGION_GPA + 2 * MEM_REGION_SIZE,
+					   MEM_REGION_SIZE,
+					   mem + 2 * MEM_REGION_SIZE,
+					   fd, 2 * MEM_REGION_SIZE);
+	TEST_ASSERT(!ret,
+		    "Different VMs should be able to share a restrictedmem_fd");
+
+	munmap(mem, MEM_REGION_SIZE * 3);
 	kvm_vm_free(vm);
+	kvm_vm_free(vm2);
 }
 
 int main(int argc, char *argv[])
-- 
2.40.0.rc2.332.ga46443480c-goog


