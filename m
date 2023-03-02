Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C88A6A823D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5W-0007l5-Ng; Thu, 02 Mar 2023 07:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5V-0007iH-6h
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5T-0002wH-D0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XlnEbvCsN6pkO9Eg8RoXy0V0GFO9MzDFE4QeR7LRAi0=;
 b=HzBGxyH/9yOvVOXHCnKNEsVky3shQt3lMnZz6Dl8sZUZCAhZvSb9o/rn2Fojz8ul/bFT/1
 hG904TzKlsL22tlFqPLADiKQx0kekX9pk6y19DhRMBDV+nLcwI67YbDP1w2FCYxPgSswDh
 27HUI4jevX5+M2j0y2jc+TO2j7HNnao=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-Ffkazk6nNpOUa3y1iAmd-g-1; Thu, 02 Mar 2023 07:31:05 -0500
X-MC-Unique: Ffkazk6nNpOUa3y1iAmd-g-1
Received: by mail-wm1-f72.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso1203984wmc.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XlnEbvCsN6pkO9Eg8RoXy0V0GFO9MzDFE4QeR7LRAi0=;
 b=ckO+G/V/+fqApQYyQSNb+tQai0frXrF1T4spVhIgIhsryL7wmdH9NdrYI4Mao4dBQt
 3n5LXJ4ZI9vILexLwBmmme5mGEvguRmt3sCZiqAgUN4CQBpbQJ4gGgOVMr4eGwrg/daG
 21a7aoMk48e9DjHFKTs9N0l/ogEVLBb0lf2N+3RlLga+VpT2tMNU5bVk6mmp8n+0r48I
 9bZoXaT65eaJpiEgYPTNPfS8y1p3TANa5T2kzy6LqQ+anGdkmEVJDyiWC8mXE8gPwECH
 XGYxjd3mKAh82fcKso4NGGdUzPtn2EDFvOQy2b20rrbVSOvRVxk10QxjWnLQr4UYDjyf
 H5UA==
X-Gm-Message-State: AO0yUKUe2k8snk6AQQKnB0KMbfU27lAFucEZOGc3N7xmbu1doAgt1COd
 dNrl0psp39LZcD07FhBuR7z4nHGw1lOAxiP9ujT5YUfhk7OY1QghAarW5OTpfG5BHlM/j4P4Ssy
 CWR/XDq5D5b/wYOojqwwB3oVV/fyXMpY8s/BMYR5x9JKy9Af3gGNWyStY9KIsD/C7jpm/5MHtwr
 o=
X-Received: by 2002:a05:600c:715:b0:3e8:f27b:a92c with SMTP id
 i21-20020a05600c071500b003e8f27ba92cmr7461300wmn.32.1677760264371; 
 Thu, 02 Mar 2023 04:31:04 -0800 (PST)
X-Google-Smtp-Source: AK7set89EXuSAlMReqK97CInpKFC9bBYjfqHlAtdcDMRFtqYpksGFgCmPR99kHxMTcNaWu1LbuYWXw==
X-Received: by 2002:a05:600c:715:b0:3e8:f27b:a92c with SMTP id
 i21-20020a05600c071500b003e8f27ba92cmr7461286wmn.32.1677760264094; 
 Thu, 02 Mar 2023 04:31:04 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c4fcb00b003e8f0334db8sm3196694wmq.5.2023.03.02.04.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 10/62] i386/xen: implement HYPERVISOR_xen_version
Date: Thu,  2 Mar 2023 13:29:37 +0100
Message-Id: <20230302123029.153265-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Joao Martins <joao.m.martins@oracle.com>

This is just meant to serve as an example on how we can implement
hypercalls. xen_version specifically since Qemu does all kind of
feature controllability. So handling that here seems appropriate.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Implement kvm_gva_rw() safely]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 86 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 476f464ee2f5..56b80a788049 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -14,9 +14,55 @@
 #include "sysemu/kvm_int.h"
 #include "sysemu/kvm_xen.h"
 #include "kvm/kvm_i386.h"
+#include "exec/address-spaces.h"
 #include "xen-emu.h"
 #include "trace.h"
 
+#include "hw/xen/interface/version.h"
+
+static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
+                      bool is_write)
+{
+    uint8_t *buf = (uint8_t *)_buf;
+    int ret;
+
+    while (sz) {
+        struct kvm_translation tr = {
+            .linear_address = gva,
+        };
+
+        size_t len = TARGET_PAGE_SIZE - (tr.linear_address & ~TARGET_PAGE_MASK);
+        if (len > sz) {
+            len = sz;
+        }
+
+        ret = kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &tr);
+        if (ret || !tr.valid || (is_write && !tr.writeable)) {
+            return -EFAULT;
+        }
+
+        cpu_physical_memory_rw(tr.physical_address, buf, len, is_write);
+
+        buf += len;
+        sz -= len;
+        gva += len;
+    }
+
+    return 0;
+}
+
+static inline int kvm_copy_from_gva(CPUState *cs, uint64_t gva, void *buf,
+                                    size_t sz)
+{
+    return kvm_gva_rw(cs, gva, buf, sz, false);
+}
+
+static inline int kvm_copy_to_gva(CPUState *cs, uint64_t gva, void *buf,
+                                  size_t sz)
+{
+    return kvm_gva_rw(cs, gva, buf, sz, true);
+}
+
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
 {
     const int required_caps = KVM_XEN_HVM_CONFIG_HYPERCALL_MSR |
@@ -87,6 +133,43 @@ uint32_t kvm_xen_get_caps(void)
     return kvm_state->xen_caps;
 }
 
+static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                     int cmd, uint64_t arg)
+{
+    int err = 0;
+
+    switch (cmd) {
+    case XENVER_get_features: {
+        struct xen_feature_info fi;
+
+        /* No need for 32/64 compat handling */
+        qemu_build_assert(sizeof(fi) == 8);
+
+        err = kvm_copy_from_gva(CPU(cpu), arg, &fi, sizeof(fi));
+        if (err) {
+            break;
+        }
+
+        fi.submap = 0;
+        if (fi.submap_idx == 0) {
+            fi.submap |= 1 << XENFEAT_writable_page_tables |
+                         1 << XENFEAT_writable_descriptor_tables |
+                         1 << XENFEAT_auto_translated_physmap |
+                         1 << XENFEAT_supervisor_mode_kernel;
+        }
+
+        err = kvm_copy_to_gva(CPU(cpu), arg, &fi, sizeof(fi));
+        break;
+    }
+
+    default:
+        return false;
+    }
+
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -97,6 +180,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_xen_version:
+        return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
+                                         exit->u.hcall.params[1]);
     default:
         return false;
     }
-- 
2.39.1


