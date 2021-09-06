Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68021401C59
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:35:31 +0200 (CEST)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNEmY-0007i0-Db
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPf-0001Ta-3e
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:51 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEPd-0007sr-Ds
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 v20-20020a1cf714000000b002e71f4d2026so3822263wmh.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wr62uh1pUUD9Xc+B5QaiXqgvoGmnHqbKYHFdH9894qA=;
 b=djPMhpjbu+03XzygjMsibcYd5UXMGZgOH2xqgJO7xdgKusYU6UI+wJyauhEqBerBnQ
 fc7hMkXHy2SDL14g7eUcWBKPTG6KlbT7KZIFmnsP0HA/8m3b+yPOoJK/CqmXl9pZfXrM
 q6WVCEdBWl1dOOu4/kruLMUs30u4xBA8CpsVjFc/c9GUf4lmH2Pp9wflCg6tEKRuR8kB
 IlBnEhZTXDXLMKxBT7KNQ48O7LuVMLI63mzp6zV70RBRu/23j8ws+//HQI/vVxFing76
 ZGIkQ+B53Ux5YPWlKzFQgdFs45uymnLm9vNd7y1c02R1eV65Z+63eq7TaZTzMERzy9V+
 Gv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Wr62uh1pUUD9Xc+B5QaiXqgvoGmnHqbKYHFdH9894qA=;
 b=kP/mLny/Z/4tu1LYFSDsNw/nfNWhz5q6SEYCtGhLylsRP3jWQQ4ApUntM/jTVVtW7Z
 LNFySaJ4T9CTkEW6lJORmWeI9+IfHs9hz/Cw0py9uoG5ybfgcVtq6BBBMFRjplgC4RG6
 3N+deKQg1nQbsKcvJBke1tzi7Oswex2e9FEdnSJ6VUvRuSepZambBrJS6JEYuTtgSQjm
 AmQT/1COcW9OINL99EH5iFfzD8zQZPUb0zpObIV8iqL3ZV+QEXPCqdIVUiXcsIkxDlwa
 Yktz1pnxYaPmeka9jqQov4UXtRBt8XD4QS6fK8cuN9zCPse9i0HvVNQtvm/KdbiNnnEL
 TGtw==
X-Gm-Message-State: AOAM531c44QSmZ0XJEC8gSv/56EkXS/IVFfp4iHAxVn9why8KB2zpnge
 EtuzQImVW77GUNTlG9lo9eB80GEHu70=
X-Google-Smtp-Source: ABdhPJzlBK5zHaFdFV+3PXXyvyG+d5jBDreKSVBTYa7AWa2nn5YM/RfS24hGA8er3hQmr0i5Tp8p7g==
X-Received: by 2002:a1c:f019:: with SMTP id a25mr11440275wmb.96.1630933908178; 
 Mon, 06 Sep 2021 06:11:48 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/36] i386: acpi: Add SGX EPC entry to ACPI tables
Date: Mon,  6 Sep 2021 15:10:50 +0200
Message-Id: <20210906131059.55234-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
index a33ac8b91e..9b382aebf2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1845,6 +1845,28 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
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



