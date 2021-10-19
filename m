Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B22A4334AA
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:27:56 +0200 (CEST)
Received: from localhost ([::1]:55836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnHc-0002RQ-A2
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9w-0008Lk-Q5
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9v-0001mk-9q
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l+JdS6odhHQCqe4i6vULlhCYcRkCV8MNyhPFF2gnM/c=;
 b=ChlIrmSUCHmkv7eDcotYKpujxwbpLqwaKUh+MCiCds4tJAis7BknXHSiD9M4IeoAriENJV
 YrgoQzw+A1qS2bDeDJRLZ/gCZLPfEdcjPev3yKnSiqWK1R96kIlObPXZ0bPW3kMKvcM3mH
 ZLU4WuMwiKQhz/9QzfM0v9064oC9D2w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-fPKnHwXKMuyC2tTj2TAUvA-1; Tue, 19 Oct 2021 07:19:53 -0400
X-MC-Unique: fPKnHwXKMuyC2tTj2TAUvA-1
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so17224290edl.17
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l+JdS6odhHQCqe4i6vULlhCYcRkCV8MNyhPFF2gnM/c=;
 b=fAVKtEmmdQ6fXVjrZdZVPUbl0N9CMZJx7QVe3vuZnhYclxNlVFaKgolAiCAcLrBn0g
 N8soY3ULQfN4o2X9BL7BSYsqyKzagrasAGOtPFJdqBhU76v1XNSyE3yMpc6a7FrNHsyG
 viqMbX2nLnE9IgGY0Pkpu/whKLUh8/uyWZJoPMXW4YqyfvjJWQLfoC9F4Esc0E7UyS4v
 PA5ecwzg1aYlQXTsnahsgtIhxVQSRuIuAJy9H8llH6KziCDEIlW4dQhgOyieq1Q5WBXu
 FrngdXhiU2H26mLtxjBCEKDH8XPp4RDumQ5iRvABvxiL3Ys1kio42oLm2V7mdMAvSCf0
 WbcQ==
X-Gm-Message-State: AOAM530NWdiwpGCMU0ExsifKYi5loBcW+dogbSZnwKbl0ZaPDeHmFfL8
 nub66dLvlaLg6iez/DuUFMNxmyZsT3fepr7nXgpzhRt6w3EET4jaf6E/7DZZQ9/nCviDBWegHCF
 rOXe0xZhgKthiPGSVIeoagTdm9S/ZlvzdTHAkIxC/Ldf/0lZ4vi5nSWpY1Zmp
X-Received: by 2002:a05:6402:34d1:: with SMTP id
 w17mr54409033edc.383.1634642391949; 
 Tue, 19 Oct 2021 04:19:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXPeBkZphU8vQkCleq9z69yG8zwmlaPR4v8wXIUFSJQomtiNOZtJbzKEcNJsd2+B3JQKKF+Q==
X-Received: by 2002:a05:6402:34d1:: with SMTP id
 w17mr54409006edc.383.1634642391774; 
 Tue, 19 Oct 2021 04:19:51 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id nd36sm10354403ejc.17.2021.10.19.04.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:19:51 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:19:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/29] tests: acpi: q35: test for x2APIC entries in SRAT
Message-ID: <20211019111923.679826-5-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Set -smp 1,maxcpus=288 to test for ACPI code that
deal with CPUs with large APIC ID (>255).

PS:
Test requires KVM and in-kernel irqchip support,
so skip test if KVM is not available.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 4f11d03055..87a94a59fa 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1033,6 +1033,19 @@ static void test_acpi_q35_tcg_numamem(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_kvm_xapic(void)
+{
+    test_data data;
+
+    memset(&data, 0, sizeof(data));
+    data.machine = MACHINE_Q35;
+    data.variant = ".xapic";
+    test_acpi_one(" -object memory-backend-ram,id=ram0,size=128M"
+                  " -numa node -numa node,memdev=ram0"
+                  " -machine kernel-irqchip=on -smp 1,maxcpus=288", &data);
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_nosmm(void)
 {
     test_data data;
@@ -1509,6 +1522,7 @@ static void test_acpi_oem_fields_virt(void)
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
+    const bool has_kvm = qtest_has_accel("kvm");
     int ret;
 
     g_test_init(&argc, &argv, NULL);
@@ -1567,6 +1581,9 @@ int main(int argc, char *argv[])
         if (strcmp(arch, "x86_64") == 0) {
             qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
         }
+        if (has_kvm) {
+            qtest_add_func("acpi/q35/kvm/xapic", test_acpi_q35_kvm_xapic);
+        }
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
         qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-- 
MST


