Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47034425821
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:39:53 +0200 (CEST)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYWQy-0000wD-Cp
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6M-0005AW-FQ
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW6J-0005Mq-QT
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:18:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGxIOiDkjtO7lLXCNUhDroR/93vYB4x6AaMAet+1gIs=;
 b=UC0orvLe8RgcZ1RUB/nCtphFqKEfmTTkx8i8SuleeOTjPqxYYs39eVk0+Jyn5L9lfompp9
 z8a6KpZZpTFf/ID3YdHoxAF8sX27pznPNJSauyW5vc4d19tqNW4XNPp9SObqoMej+45qoQ
 0EBnygYU93r+w80P1y+3menJ4B9/+Vk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-jfyhUZXBNIKVfkvHS2QXlQ-1; Thu, 07 Oct 2021 12:18:30 -0400
X-MC-Unique: jfyhUZXBNIKVfkvHS2QXlQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so2033648wrd.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGxIOiDkjtO7lLXCNUhDroR/93vYB4x6AaMAet+1gIs=;
 b=wTC79br7HuDIG3bF/HusH3CEeNkGoX3ni7DdINjDIPHEppgawIaW8GqKI6muCACHaI
 RjcWuWJThJfvyNSildQE3GCSyV1GPNOEhLYEd0/ZUZc+rcFzlo6UFiRffqJ2Pdq4L/g0
 +N6DHLuGVpd4RUqX3/OFC8CK/1Z5chdIVZlPdGgBYuH+iS+iT58XjDdQ2NPuX5TeU/1Q
 Wa0TA4IlO4NC2wexjDZ/NUMSXEIqlNzaKQjXWnHrxR8qMDEP/deZKAAzIN4EKl7rMaJj
 Bl2/cKeid0HiD7XWaMuSVpIubo1P4CCqDPxX89kcV9G+h8dkKjR3iR7p8J0n6Jl7dk8/
 GOAw==
X-Gm-Message-State: AOAM532T7JwXERL8ghFb47tIJ+NOkPnXlqHNFJ/MBKbJareJy/4VPCd+
 hAuPnVklC7DIoP96+YZbEIyT1bA9OcJz8rFTY60hKWZUakgrYr2wIszYpgGNXQk5xv3dy+uJOfW
 4wV07tLdZUUChzBp4NzJgQfnjo6M0rCR8IOB96WhtGmOU78wuelu8zXJ7jVLq44Zb
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr6651405wri.178.1633623507286; 
 Thu, 07 Oct 2021 09:18:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGxFUSQBIuymUcqyNofEv5FzSKPyuPr7MuNzby3hK9l903zkFHngcL71AixMMoIYrkPVrZ9w==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr6651373wri.178.1633623507093; 
 Thu, 07 Oct 2021 09:18:27 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v185sm4584081wme.35.2021.10.07.09.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:18:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/23] target/i386/sev: Declare system-specific functions
 in 'sev.h'
Date: Thu,  7 Oct 2021 18:17:08 +0200
Message-Id: <20211007161716.453984-16-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"sysemu/sev.h" is only used from x86-specific files. Let's move it
to include/hw/i386, and merge it with target/i386/sev.h.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/sev.h       | 28 ----------------------------
 target/i386/sev.h          | 12 +++++++++++-
 hw/i386/pc_sysfw.c         |  2 +-
 target/i386/kvm/kvm.c      |  1 -
 target/i386/kvm/sev-stub.c |  2 +-
 target/i386/monitor.c      |  1 -
 6 files changed, 13 insertions(+), 33 deletions(-)
 delete mode 100644 include/sysemu/sev.h

diff --git a/include/sysemu/sev.h b/include/sysemu/sev.h
deleted file mode 100644
index 94d821d737c..00000000000
--- a/include/sysemu/sev.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/*
- * QEMU Secure Encrypted Virutualization (SEV) support
- *
- * Copyright: Advanced Micro Devices, 2016-2018
- *
- * Authors:
- *  Brijesh Singh <brijesh.singh@amd.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-
-#ifndef QEMU_SEV_H
-#define QEMU_SEV_H
-
-#include "sysemu/kvm.h"
-
-bool sev_enabled(void);
-int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
-int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
-int sev_inject_launch_secret(const char *hdr, const char *secret,
-                             uint64_t gpa, Error **errp);
-
-int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
-void sev_es_set_reset_vector(CPUState *cpu);
-
-#endif
diff --git a/target/i386/sev.h b/target/i386/sev.h
index d83428fa265..c96072bf78d 100644
--- a/target/i386/sev.h
+++ b/target/i386/sev.h
@@ -14,7 +14,7 @@
 #ifndef QEMU_SEV_I386_H
 #define QEMU_SEV_I386_H
 
-#include "sysemu/sev.h"
+#include "exec/confidential-guest-support.h"
 #include "qapi/qapi-types-misc-target.h"
 
 #define SEV_POLICY_NODBG        0x1
@@ -35,6 +35,7 @@ typedef struct SevKernelLoaderContext {
     size_t cmdline_size;
 } SevKernelLoaderContext;
 
+bool sev_enabled(void);
 extern bool sev_es_enabled(void);
 extern SevInfo *sev_get_info(void);
 extern uint32_t sev_get_cbit_position(void);
@@ -45,4 +46,13 @@ extern SevAttestationReport *
 sev_get_attestation_report(const char *mnonce, Error **errp);
 extern bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp);
 
+int sev_encrypt_flash(uint8_t *ptr, uint64_t len, Error **errp);
+int sev_inject_launch_secret(const char *hdr, const char *secret,
+                             uint64_t gpa, Error **errp);
+
+int sev_es_save_reset_vector(void *flash_ptr, uint64_t flash_size);
+void sev_es_set_reset_vector(CPUState *cpu);
+
+int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp);
+
 #endif
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 68d6b1f783e..c8b17af9535 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -37,7 +37,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
-#include "sysemu/sev.h"
+#include "sev.h"
 
 #define FLASH_SECTOR_SIZE 4096
 
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a5f6ff63c81..0eb7a0340cf 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -44,7 +44,6 @@
 #include "hw/i386/intel_iommu.h"
 #include "hw/i386/x86-iommu.h"
 #include "hw/i386/e820_memory_layout.h"
-#include "sysemu/sev.h"
 
 #include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
diff --git a/target/i386/kvm/sev-stub.c b/target/i386/kvm/sev-stub.c
index 9587d1b2a31..6080c007a2e 100644
--- a/target/i386/kvm/sev-stub.c
+++ b/target/i386/kvm/sev-stub.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
-#include "sysemu/sev.h"
+#include "sev.h"
 
 int sev_kvm_init(ConfidentialGuestSupport *cgs, Error **errp)
 {
diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 109e4e61c0a..935a8ee8ca4 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -30,7 +30,6 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/kvm.h"
-#include "sysemu/sev.h"
 #include "qapi/error.h"
 #include "sev.h"
 #include "qapi/qapi-commands-misc-target.h"
-- 
2.31.1


