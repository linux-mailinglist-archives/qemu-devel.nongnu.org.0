Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3196744D28E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:39:33 +0100 (CET)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4gG-0006MI-2D
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:39:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d6-0003f7-40
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:16 -0500
Received: from [2a00:1450:4864:20::530] (port=33522
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ml4d4-00079O-CQ
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 02:36:15 -0500
Received: by mail-ed1-x530.google.com with SMTP id m14so20938079edd.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 23:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=736eFu8WL4rj1c9Mylb9tpssBbzithUw4sVbHR+zcx0=;
 b=UnOxO0f1FyaHZsOS1wRbLqX6lZYZmTjxCgHMmwjOQ3PI2KoRJJLqH13BjEtThXTQI2
 vypS7SRiXTMuW7bLt9WChClAGhgHM2xQcx5ATmxlQkS1kVirBWkcgbAvzVXvPRchxsSP
 eQrt1oTsCgpLEqR+5zZ2/YycX2/sHC1Xbg5c+wi7YcG5+oHAFUGjxodd3BNBEaEOSEbW
 X1qV411kvBCz0d1Y+V26TYRI4sHhLpy2lUTn7OK8wwigEbaDtwnG2M/VZPtgVDLHh4Wt
 6znUWzRsveJ+pNmcC7dq3DFTKikqrMGtsCXBmFHtvlo6/WH731qW8nWDlHaul/e7aXAh
 Uftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=736eFu8WL4rj1c9Mylb9tpssBbzithUw4sVbHR+zcx0=;
 b=V9pjjLDmJ5Vt8TOfoEZqelbD90WCP2nB93HjD7Bhssu2GfT+PWDBbFHwB4sh0/fZyz
 rTfhqzS0c2di75WQLBrSKPHhV3saDE6HeQQD+2i8wvb3KkKQcijE7wMG1UijaE7GlqxD
 FopGghiEYa8zJ8GOsynt3+/wclHWCR9ZCUUKieXRM8u9eMybC5PE4mh3BMWv2/0X6sIP
 rLp1rfAD9Nr16NP32cvMiedmEbm98W+kLS7s/RqKiQd2yPLGNEw3gJWuPOeIHkefayGZ
 TOQAFfd+i9vtrCO7CSrNdZzExkVyrk9wZKRVoid8aERoBtcwr7pZNqeCWbj7t/2SO7aR
 EP6w==
X-Gm-Message-State: AOAM530B3BtYc2H9ejDnFYzdw0Ha3qvxhFNzN58Eo8asfkbqsdUhPU/0
 WpaQ7H2hMsFoceDZ4OaEsWr7NnkpSjY=
X-Google-Smtp-Source: ABdhPJz74xIt/zrhhrb00lqrpzqG1zaQ1gI8La69BC3eLideGN6gfbrQiTzQzKV6rUK4gnP17ZcJaA==
X-Received: by 2002:a17:907:980e:: with SMTP id
 ji14mr6749544ejc.346.1636616172473; 
 Wed, 10 Nov 2021 23:36:12 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id w1sm1062098edd.49.2021.11.10.23.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 23:36:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] sgx: Reset the vEPC regions during VM reboot
Date: Thu, 11 Nov 2021 08:36:07 +0100
Message-Id: <20211111073607.195697-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111073607.195697-1-pbonzini@redhat.com>
References: <20211111073607.195697-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

For bare-metal SGX on real hardware, the hardware provides guarantees
SGX state at reboot.  For instance, all pages start out uninitialized.
The vepc driver provides a similar guarantee today for freshly-opened
vepc instances, but guests such as Windows expect all pages to be in
uninitialized state on startup, including after every guest reboot.

Qemu can invoke the ioctl to bring its vEPC pages back to uninitialized
state. There is a possibility that some pages fail to be removed if they
are SECS pages, and the child and SECS pages could be in separate vEPC
regions.  Therefore, the ioctl returns the number of EREMOVE failures,
telling Qemu to try the ioctl again after it's done with all vEPC regions.

The related kernel patches:
Link: https://lkml.kernel.org/r/20211021201155.1523989-3-pbonzini@redhat.com

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20211101162009.62161-6-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 11607568b6..8fef3dd8fa 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -21,6 +21,8 @@
 #include "qapi/qapi-commands-misc-target.h"
 #include "exec/address-spaces.h"
 #include "sysemu/hw_accel.h"
+#include "sysemu/reset.h"
+#include <sys/ioctl.h>
 
 #define SGX_MAX_EPC_SECTIONS            8
 #define SGX_CPUID_EPC_INVALID           0x0
@@ -29,6 +31,11 @@
 #define SGX_CPUID_EPC_SECTION           0x1
 #define SGX_CPUID_EPC_MASK              0xF
 
+#define SGX_MAGIC 0xA4
+#define SGX_IOC_VEPC_REMOVE_ALL       _IO(SGX_MAGIC, 0x04)
+
+#define RETRY_NUM                       2
+
 static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
 {
     return (low & MAKE_64BIT_MASK(12, 20)) +
@@ -59,6 +66,46 @@ static uint64_t sgx_calc_host_epc_section_size(void)
     return size;
 }
 
+static void sgx_epc_reset(void *opaque)
+{
+    PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
+    HostMemoryBackend *hostmem;
+    SGXEPCDevice *epc;
+    int failures;
+    int fd, i, j, r;
+    static bool warned = false;
+
+    /*
+     * The second pass is needed to remove SECS pages that could not
+     * be removed during the first.
+     */
+    for (i = 0; i < RETRY_NUM; i++) {
+        failures = 0;
+        for (j = 0; j < pcms->sgx_epc.nr_sections; j++) {
+            epc = pcms->sgx_epc.sections[j];
+            hostmem = MEMORY_BACKEND(epc->hostmem);
+            fd = memory_region_get_fd(host_memory_backend_get_memory(hostmem));
+
+            r = ioctl(fd, SGX_IOC_VEPC_REMOVE_ALL);
+            if (r == -ENOTTY && !warned) {
+                warned = true;
+                warn_report("kernel does not support SGX_IOC_VEPC_REMOVE_ALL");
+                warn_report("SGX might operate incorrectly in the guest after reset");
+                break;
+            } else if (r > 0) {
+                /* SECS pages remain */
+                failures++;
+                if (i == 1) {
+                    error_report("cannot reset vEPC section %d", j);
+                }
+            }
+        }
+        if (!failures) {
+            break;
+        }
+     }
+}
+
 SGXInfo *qmp_query_sgx_capabilities(Error **errp)
 {
     SGXInfo *info = NULL;
@@ -190,4 +237,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     }
 
     memory_region_set_size(&sgx_epc->mr, sgx_epc->size);
+
+    /* register the reset callback for sgx epc */
+    qemu_register_reset(sgx_epc_reset, NULL);
 }
-- 
2.33.1


