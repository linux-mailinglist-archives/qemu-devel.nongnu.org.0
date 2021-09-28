Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9841AF9D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:04:20 +0200 (CEST)
Received: from localhost ([::1]:54872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCmR-0003sC-RM
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaG-0006Yf-PU
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:44 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaB-0001Ru-No
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:41 -0400
Received: by mail-ed1-x535.google.com with SMTP id v10so78451976edj.10
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DX+n3kP2aHkHKaZjc+ogt7pnXtaudF677+IzkUFKWcc=;
 b=FZpabySlet68K3J11vL+SlnpqrcVvVuq9DdVMVraNjiLit6zVhJ0lXrVax5Re/fFe6
 5mURSBJWYiSMk8VB+CZZaL+Rc+JNLk+L6iew3hm8hP8BeaFyXN9CjiRz8ENLfcDGWRIH
 G3x6PwbcGaw1WRc3qjUswuW4ywsyjjr1gGRfWHyipZPvTldKWviTA3l1yqKQ1Aqxspgx
 Rp2AhXl+ZcdgaQOPBeL194EYHLbWvkJlRP29Ylf7isQfaWL/Ghztzi7AehwXg7Z4TfNY
 hckRy+6Ir/MyunPq2qa/RvFrKCXIjBAbT5K40+mYderlrP5HOx35cApNqngZRhwwMr56
 g4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DX+n3kP2aHkHKaZjc+ogt7pnXtaudF677+IzkUFKWcc=;
 b=MbvsdnIgm9hC7DDNKuJYzw9QgPFE9qKSkyb2RuxAzrwQbIeiifZSVojkdszWj5j9Ew
 k9Ct8cVNJ7u6mzTWotZDvKImfZbzzJpvfAHClYlXOzFq75Cm9cNqjPAgI9qUNZ/RALMb
 /2kXqT1oBsCGssM9mkKZ/5Vw86o6+4KHcDep6zbRJTD7J4ig/1+xg8aBya69G31mRQMk
 hwzNQRd6d/MSUePIKIVqVYmJcLJ4Q17+CBAQzi/mRTn7HttX0emNa1/0Oq3ccC+hYct0
 MyKRfIru2qLm6K0eq6CHGXphYd1ijGkes4oSz4ANGhye3uJ3IpgwfR6mXiZinwvJZcNv
 v6Dw==
X-Gm-Message-State: AOAM530WkIP0ztlLGlqDkiS7sU1x2AvgrnMrtwS0XM/aQ4Hxt0mrTKJg
 DMnHdcvuhT6PWSUPP0Z9DJaG4mnfUb4=
X-Google-Smtp-Source: ABdhPJxuGanlG0Yto/MDvveAcJpwr6gpadf20J8HmQr8YQ4vRw3ofvKhkRVBh8xbSgwPNo5jgJwzMA==
X-Received: by 2002:a05:6402:21d2:: with SMTP id
 bi18mr7183805edb.21.1632833494784; 
 Tue, 28 Sep 2021 05:51:34 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/33] i386: acpi: Add SGX EPC entry to ACPI tables
Date: Tue, 28 Sep 2021 14:51:03 +0200
Message-Id: <20210928125116.183620-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Christopherson <sean.j.christopherson@intel.com>

The ACPI Device entry for SGX EPC is essentially a hack whose primary
purpose is to provide software with a way to autoprobe SGX support,
e.g. to allow software to implement SGX support as a driver.  Details
on the individual EPC sections are not enumerated through ACPI tables,
i.e. software must enumerate the EPC sections via CPUID.  Furthermore,
software expects to see only a single EPC Device in the ACPI tables
regardless of the number of EPC sections in the system.

However, several versions of Windows do rely on the ACPI tables to
enumerate the address and size of the EPC.  So, regardless of the number
of EPC sections exposed to the guest, create exactly *one* EPC device
with a _CRS entry that spans the entirety of all EPC sections (which are
guaranteed to be contiguous in Qemu).

Note, NUMA support for EPC memory is intentionally not considered as
enumerating EPC NUMA information is not yet defined for bare metal.

Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20210719112136.57018-20-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/acpi-build.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index dfaa47cdc2..f4d6ae3d02 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1841,6 +1841,28 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     }
 #endif
 
+    if (pcms->sgx_epc.size != 0) {
+        uint64_t epc_base = pcms->sgx_epc.base;
+        uint64_t epc_size = pcms->sgx_epc.size;
+
+        dev = aml_device("EPC");
+        aml_append(dev, aml_name_decl("_HID", aml_eisaid("INT0E0C")));
+        aml_append(dev, aml_name_decl("_STR",
+                                      aml_unicode("Enclave Page Cache 1.0")));
+        crs = aml_resource_template();
+        aml_append(crs,
+                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
+                                    AML_MAX_FIXED, AML_NON_CACHEABLE,
+                                    AML_READ_WRITE, 0, epc_base,
+                                    epc_base + epc_size - 1, 0, epc_size));
+        aml_append(dev, aml_name_decl("_CRS", crs));
+
+        method = aml_method("_STA", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_return(aml_int(0x0f)));
+        aml_append(dev, method);
+
+        aml_append(sb_scope, dev);
+    }
     aml_append(dsdt, sb_scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
-- 
2.31.1



