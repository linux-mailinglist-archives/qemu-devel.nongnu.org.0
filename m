Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4046D41714E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 13:51:05 +0200 (CEST)
Received: from localhost ([::1]:52188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTjjM-0001tL-BR
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 07:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKc-0007xV-AK
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:30 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTjKa-0000br-FZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 07:25:29 -0400
Received: by mail-ed1-x535.google.com with SMTP id u27so34245815edi.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DX+n3kP2aHkHKaZjc+ogt7pnXtaudF677+IzkUFKWcc=;
 b=PC43oRRckn0Q4NkC+r6pxMQ4/WtMDqmxTq3nmi1yRCcczFvyJ8gnPE0TclWv9hVLbj
 lE3BbEDqT98Swpou7FP6FuDnwINtV7pQPH5xgavdfIboChmK+ipEpj+hQNMYcsxLga7C
 D63hgjYSN222BLRVCF9lh4exx/ij/f5+jUOoFQUpZq+4iLk4Rx/JFK7ObpP9vW3+Wpqo
 Q2G7BFx5R1XBRdVnbiMwpOSrXzjVdmUh1WPDxZBahAZQajoT5ZeourIFNYt3PQQ1yo4K
 MXc/fgbdIlYAhNQzTDGbl6lq9wgD+EGxxWivXYV/ua7Chl/qlKA0RXeylGS36Bv9csnh
 pEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DX+n3kP2aHkHKaZjc+ogt7pnXtaudF677+IzkUFKWcc=;
 b=gK3Q+9R9TMBCzsZA1H0ptpZueNPDBZ8Bq0ZHls/HNR3C7EJp7SZ5/QNJszZCqHMg7+
 B7AnQKrZKYaoYFVm4xg3JzETqlQZS9rVENjycvhmCVohYF/SFpfFLXQQCnEYt4GXwyFD
 JFRm0usx4qvYFyBASC7aegcxNPS7WukUuOLuOcU1H6PyIMWBxNwBSl03nRCrZx9eAnye
 pfPGqMIg4uG+K63uvrhjzTB1E3uv1PamHrMqVpmUkR1aiVvVnovqXFGbYLgZZOAlgqtO
 a8X85KZ64iJAgp8A0orjtb9VhNZ+p5kGmvfeXFqDTVUiijXoIdQ9/DRx5VMRlm3mdxrg
 2wqA==
X-Gm-Message-State: AOAM5335T3eSaliaPZGn3WnzTxHkBErvormku4aRy1Pfq9PV/EvkGe/0
 wqdDeF6Ou+hHaX4A1B6yj9xpHM7AgAo=
X-Google-Smtp-Source: ABdhPJzkV5BWMVctyI4PhQmIU0xEGfDjQtvV6pQl8/Kzuo2P1BXdnKDRAnU3DVpzwNItbogMtJrqzQ==
X-Received: by 2002:a17:906:2505:: with SMTP id
 i5mr10550816ejb.450.1632482727235; 
 Fri, 24 Sep 2021 04:25:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t14sm4886961ejf.24.2021.09.24.04.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 04:25:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/26] i386: acpi: Add SGX EPC entry to ACPI tables
Date: Fri, 24 Sep 2021 13:25:03 +0200
Message-Id: <20210924112509.25061-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924112509.25061-1-pbonzini@redhat.com>
References: <20210924112509.25061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: yang.zhong@intel.com, philmd@redhat.com, eblake@redhat.com,
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



