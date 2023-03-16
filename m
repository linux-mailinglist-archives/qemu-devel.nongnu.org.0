Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726806BC2C3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 01:32:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcbWf-00040X-D2; Wed, 15 Mar 2023 20:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3WGMSZAsKCo8tv3xA4xHC6zz77z4x.v759x5D-wxEx4676z6D.7Az@flex--ackerleytng.bounces.google.com>)
 id 1pcbWe-00040A-7U
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:24 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3WGMSZAsKCo8tv3xA4xHC6zz77z4x.v759x5D-wxEx4676z6D.7Az@flex--ackerleytng.bounces.google.com>)
 id 1pcbWc-0007eM-C8
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 20:31:23 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 q68-20020a632a47000000b004f74bc0c71fso5877pgq.18
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 17:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1678926680;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=JjmIOJvjUEG2+4aovgmSBlRBGRP0JRLKbOkhR3o7e/I=;
 b=XWGmJ9JAs9QizM49LznB/3WeGWT9Pc+PU89wCd8j/FUtVE5mMn/ax/bL088f1qtOz1
 RFmCWBaiH29nU9Rm1KEJYwwbJN+AkVaHOxnJG89ZrDJuTFkTNXO5WvuZG2ISNDllw0uo
 fSjaUkPVuesviWcTzk98UxYatwmpd417x6c+02nHUCPhFRDc3jObfLW3h3zTrxlqgUMt
 LSd6LeHzPnNB0IV8pPZgCTjW0bYxKCuKc0IBsjiwto4vhAFiBAjpHsDO9Qt092Ms2tAr
 DgVpYe+MAJleDmnTkKW5CLiYIwwbNbMGX4Gf9ND5AcxA8F5WN4Z2xDh5NS+5PrMXSWp9
 XSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678926680;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JjmIOJvjUEG2+4aovgmSBlRBGRP0JRLKbOkhR3o7e/I=;
 b=Cmh+Jt9KihEfSLRqUm+/xVswgzprw16zGRtKS0X+hKWlA25pIICOI7kop8OTpEIzqM
 DDGzntSyEYcIl+S2BUU5ewpYxaIIErDe4MGylJuiMhfXI84LMeH/0E/DozlypQwk0Vpg
 BCSfhFyImBBH4Z6cesjKQL8t9ct6ifDr2NOF+T1W86Nzfkrhp8atJyN1JvlDCYDj7i3e
 K/Nypgt7g3X/qbV+qcpbz/k2xH1hd7P/a2ySuYOWg7SF0K79aBrDEll0zRkh/bZZqCjC
 D4bPPGxdodak5Ox8XeSZ2G5/Pq5zZ93zvRan8TP/p+NEo1zdzCyWmuPP3e3zyqjSah27
 UmIg==
X-Gm-Message-State: AO0yUKUY6SRaqg54LgPUKDgZs7p2eARm+umyZ82W0ZbkYkV2w6dZQf4W
 RPD5hhvw2dSoyuQrCjw8LOz/lfCu/XawexgD+g==
X-Google-Smtp-Source: AK7set+j36PrTQ1uWKwZ/ZTMviUfrC3nfQJHH3bSUBCARqM/YyB/PYWAqeXRAUTM8xOy7rllnybTZtBO0uvKhOtP8A==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:902:e5cb:b0:1a0:4346:d43e with
 SMTP id u11-20020a170902e5cb00b001a04346d43emr595748plf.11.1678926680301;
 Wed, 15 Mar 2023 17:31:20 -0700 (PDT)
Date: Thu, 16 Mar 2023 00:30:56 +0000
In-Reply-To: <cover.1678926164.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1678926164.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <48490641ce981c31ea58c11ad478ff85cd0dd156.1678926164.git.ackerleytng@google.com>
Subject: [RFC PATCH 03/10] KVM: selftests: Test that VM private memory should
 not be readable from host
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3WGMSZAsKCo8tv3xA4xHC6zz77z4x.v759x5D-wxEx4676z6D.7Az@flex--ackerleytng.bounces.google.com;
 helo=mail-pg1-x54a.google.com
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

After VM memory is remapped as private memory and guest has written to
private memory, request the host to read the corresponding hva for
that private memory.

The host should not be able to read the value in private memory.

This selftest shows that private memory contents of the guest are not
accessible to host userspace via the HVA.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../kvm/x86_64/private_mem_conversions_test.c | 54 ++++++++++++++++---
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
index ef9894340a2b..f2c1e4450b0e 100644
--- a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
@@ -47,6 +47,16 @@ static void memcmp_h(uint8_t *mem, uint8_t pattern, size_t size)
 			    pattern, i, mem[i]);
 }
 
+static void memcmp_ne_h(uint8_t *mem, uint8_t pattern, size_t size)
+{
+	size_t i;
+
+	for (i = 0; i < size; i++)
+		TEST_ASSERT(mem[i] != pattern,
+			    "Expected not to find 0x%x at offset %lu but got 0x%x",
+			    pattern, i, mem[i]);
+}
+
 /*
  * Run memory conversion tests with explicit conversion:
  * Execute KVM hypercall to map/unmap gpa range which will cause userspace exit
@@ -64,8 +74,14 @@ static void memcmp_h(uint8_t *mem, uint8_t pattern, size_t size)
 
 #define GUEST_STAGE(o, s) { .offset = o, .size = s }
 
-#define GUEST_SYNC4(gpa, size, current_pattern, new_pattern) \
-	ucall(UCALL_SYNC, 4, gpa, size, current_pattern, new_pattern)
+#define UCALL_RW_SHARED (0xca11 - 0)
+#define UCALL_R_PRIVATE (0xca11 - 1)
+
+#define REQUEST_HOST_RW_SHARED(gpa, size, current_pattern, new_pattern) \
+	ucall(UCALL_RW_SHARED, 4, gpa, size, current_pattern, new_pattern)
+
+#define REQUEST_HOST_R_PRIVATE(gpa, size, expected_pattern) \
+	ucall(UCALL_R_PRIVATE, 3, gpa, size, expected_pattern)
 
 static void guest_code(void)
 {
@@ -86,7 +102,7 @@ static void guest_code(void)
 
 	/* Memory should be shared by default. */
 	memset((void *)DATA_GPA, ~init_p, DATA_SIZE);
-	GUEST_SYNC4(DATA_GPA, DATA_SIZE, ~init_p, init_p);
+	REQUEST_HOST_RW_SHARED(DATA_GPA, DATA_SIZE, ~init_p, init_p);
 	memcmp_g(DATA_GPA, init_p, DATA_SIZE);
 
 	for (i = 0; i < ARRAY_SIZE(stages); i++) {
@@ -113,6 +129,12 @@ static void guest_code(void)
 		kvm_hypercall_map_private(gpa, size);
 		memset((void *)gpa, p2, size);
 
+		/*
+		 * Host should not be able to read the values written to private
+		 * memory
+		 */
+		REQUEST_HOST_R_PRIVATE(gpa, size, p2);
+
 		/*
 		 * Verify that the private memory was set to pattern two, and
 		 * that shared memory still holds the initial pattern.
@@ -133,11 +155,20 @@ static void guest_code(void)
 				continue;
 
 			kvm_hypercall_map_shared(gpa + j, PAGE_SIZE);
-			GUEST_SYNC4(gpa + j, PAGE_SIZE, p1, p3);
+			REQUEST_HOST_RW_SHARED(gpa + j, PAGE_SIZE, p1, p3);
 
 			memcmp_g(gpa + j, p3, PAGE_SIZE);
 		}
 
+		/*
+		 * Even-number pages are still mapped as private, host should
+		 * not be able to read those values.
+		 */
+		for (j = 0; j < size; j += PAGE_SIZE) {
+			if (!((j >> PAGE_SHIFT) & 1))
+				REQUEST_HOST_R_PRIVATE(gpa + j, PAGE_SIZE, p2);
+		}
+
 		/*
 		 * Convert the entire region back to shared, explicitly write
 		 * pattern three to fill in the even-number frames before
@@ -145,7 +176,7 @@ static void guest_code(void)
 		 */
 		kvm_hypercall_map_shared(gpa, size);
 		memset((void *)gpa, p3, size);
-		GUEST_SYNC4(gpa, size, p3, p4);
+		REQUEST_HOST_RW_SHARED(gpa, size, p3, p4);
 		memcmp_g(gpa, p4, size);
 
 		/* Reset the shared memory back to the initial pattern. */
@@ -209,7 +240,18 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type)
 		switch (get_ucall(vcpu, &uc)) {
 		case UCALL_ABORT:
 			REPORT_GUEST_ASSERT_4(uc, "%lx %lx %lx %lx");
-		case UCALL_SYNC: {
+		case UCALL_R_PRIVATE: {
+			uint8_t *hva = addr_gpa2hva(vm, uc.args[0]);
+			uint64_t size = uc.args[1];
+
+			/*
+			 * Try to read hva for private gpa from host, should not
+			 * be able to read private data
+			 */
+			memcmp_ne_h(hva, uc.args[2], size);
+			break;
+		}
+		case UCALL_RW_SHARED: {
 			uint8_t *hva = addr_gpa2hva(vm, uc.args[0]);
 			uint64_t size = uc.args[1];
 
-- 
2.40.0.rc2.332.ga46443480c-goog


