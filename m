Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7894037E8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:32:51 +0200 (CEST)
Received: from localhost ([::1]:34750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuss-0005Dh-GT
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRv-0006lU-8X
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRt-00037H-La
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q11so2384659wrr.9
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NgWD+4DZm29WOsZx4zHR/ZUlTNniLiRiAhwjufQ97XI=;
 b=X92kry98NTwgnMsIYB+7/0iC3Np6VGnK9YQCsGJtBHLuIt2Rq+ggmKBW2y7zDpnETH
 7lwUAxcZ0eSezAAmuZiIA1oXs2dsuiW5zhLXsvk8Tr60V7UQhw5coFUBwb4lP8zEuTPz
 P0kY96jp6cjJVqf5Dd5/76hMl1Z4Z8MJCNChnQgVjP4GAeEbURCnc0Ims8CeNazHOtQt
 GUkNJE/Pgvom8f65xd78gmeKchY7ErNaGeqHVL/5XCO3orS7uzUunBA9K6yCHw1FF+vL
 2Dgrwam9dJABaqaVzQOvVQZ6g5aod6W2DTLNvyAeW7igkoH7DjXwBQJPn+GJFRjgMu3n
 S0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NgWD+4DZm29WOsZx4zHR/ZUlTNniLiRiAhwjufQ97XI=;
 b=gTCsjWvSnsWQ7zqk6OAT2hU0C8QtA1QZ4fhjNWz4jA0gfI+g8Dr5KpkpGVXn36juMM
 f2lQ/QWMM/C275CbUn3jYJ/LrE7zNznipgipeq6KQkRJxwGdKhYu3q7IA8PUI+Rf8dXX
 82Q93uzVLeGZikhkWBm8lC8zN0SZ7CeSv/3xcVj/oTQG5dB62Vl5Lb8TBXrUTShAFc6u
 0+HIdbADkFmPCzIdNXKfyuDKhdguW5ceZ0v8YB57xNEy/DUDvMYudfkDHY3d6IbxA0DA
 53OJJTbPcJQIW+ErKCrUKciW+pQLeIJv2iGJxiIbMkOukZwIZt4h0RzXrDKF4mFockkR
 sS9Q==
X-Gm-Message-State: AOAM533J0mYnYIrRO8KjvvBdprV5OjsdwneNhLHAyjSb4GmDM1UnfclT
 CICLsg3MJvIKq3DAkqr5nRVEruh5+OQ=
X-Google-Smtp-Source: ABdhPJwei5XJXx0eTSpepfblGf0VNaSF8EEWIOI1q3cSpsZTtY4V92SbdCOxVtGdMCZMjAsn+xgUpw==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr3091227wrd.286.1631095496257; 
 Wed, 08 Sep 2021 03:04:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:55 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 28/43] i386: acpi: Add SGX EPC entry to ACPI tables
Date: Wed,  8 Sep 2021 12:04:11 +0200
Message-Id: <20210908100426.264356-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
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
index d1f5fa3b5a..10f52c0c7c 100644
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



