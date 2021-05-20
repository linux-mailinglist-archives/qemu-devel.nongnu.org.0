Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197C038A00A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:44:19 +0200 (CEST)
Received: from localhost ([::1]:34870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeHy-0003wm-28
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxj-0005RK-8v
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxf-0001Y5-08
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:22 -0400
Received: by mail-wm1-x332.google.com with SMTP id t206so8638725wmf.0
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+6To3R747Gt8KrZIdybi9XgGpLzBn8XFWqjsTJBScXc=;
 b=naWvRZUwVgLVlkiEDYK/2S4K54bNcNJ0G3DKgqUJpVP4fs7tdUvQQBBdtRzSCEe9HT
 iIs1Hmm9S2+m6E0TC+d9wpHVbw3jkNBqOwSaEIVxdqXwhnYYWQkFeU2MTlH35jy4VZCw
 D/mfqFNbLlqHQ7tPcotn/Byuh+RhYRSrfr2rCfMXIBFY1oXf9bf4VWkFb+NLYlsOTL5E
 bwHiiA8hDPOsoiMzUyHOgEwHcKXCUO3FzsedlR3BkdGieWzjpVl8Wu+iwLPHaK4ys/gx
 X3Q2JPLh1C27XxD1yBlcX2CeQNeuP0YlGzFhm0kuzjSmxLA4pOIoZ78JBbVmy6m8yk/x
 qUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+6To3R747Gt8KrZIdybi9XgGpLzBn8XFWqjsTJBScXc=;
 b=HiUT3e/4wxzq4LadKcX41XLMb6+f1ai2JFozbE00/oSB8RINhmDAlBniGfIyZe/QO/
 R7nDNHSr6vvTArktEMpmotJYYhcQKcCy1rTpqmIE0e1PMo4fuU6+s5wFqJqXBDDhogbc
 F8if2FmP7EcFxGnjg6X84QHrdiQR3PZvw2gMTRT6KyR5/TwAboGxPIn0BY+SE5T3XkVO
 gH79gGct97ZG+uR+LAXTv8BIvgTGx1vh2OZmcqVdDgNJs8i0t1Kx0gB7ewF+aOhZJkdd
 NPW1JhChYqbTb8wEtW4l3Qe3LcWzecPChKznoI1OFeKuuI7RMzUMFPH5Xy/COPPaCJzG
 hlnw==
X-Gm-Message-State: AOAM531oHm+WNTLgjcIoIsxL+HX3vStcIL71/OaPd+OT7SLi5rxypbpZ
 SpPcw/bWeSN8Nyq7BvZGFtdun7ZY5V5FFg==
X-Google-Smtp-Source: ABdhPJzSAenX3C9bCSoZbUP2MXyJQ69B+ZAZRXIjEZpUzG4pr4gNfGpjgF0fhpmh4HSY0SvJ72saTg==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr2399148wml.188.1621498989713; 
 Thu, 20 May 2021 01:23:09 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:09 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/26] KVM: Add dirty-ring-size property
Date: Thu, 20 May 2021 10:22:48 +0200
Message-Id: <20210520082257.187061-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Add a parameter for dirty gfn count for dirty rings.  If zero, dirty ring is
disabled.  Otherwise dirty ring will be enabled with the per-vcpu gfn count as
specified.  If dirty ring cannot be enabled due to unsupported kernel or
illegal parameter, it'll fallback to dirty logging.

By default, dirty ring is not enabled (dirty-gfn-count default to 0).

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-9-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 46 +++++++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx     | 12 ++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index df9fbf59a6..5afe15ae66 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -126,6 +126,8 @@ struct KVMState
         KVMMemoryListener *ml;
         AddressSpace *as;
     } *as;
+    uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
+    uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
 };
 
 KVMState *kvm_state;
@@ -3182,6 +3184,42 @@ bool kvm_kernel_irqchip_split(void)
     return kvm_state->kernel_irqchip_split == ON_OFF_AUTO_ON;
 }
 
+static void kvm_get_dirty_ring_size(Object *obj, Visitor *v,
+                                    const char *name, void *opaque,
+                                    Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint32_t value = s->kvm_dirty_ring_size;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void kvm_set_dirty_ring_size(Object *obj, Visitor *v,
+                                    const char *name, void *opaque,
+                                    Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    Error *error = NULL;
+    uint32_t value;
+
+    if (s->fd != -1) {
+        error_setg(errp, "Cannot set properties after the accelerator has been initialized");
+        return;
+    }
+
+    visit_type_uint32(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+    if (value & (value - 1)) {
+        error_setg(errp, "dirty-ring-size must be a power of two.");
+        return;
+    }
+
+    s->kvm_dirty_ring_size = value;
+}
+
 static void kvm_accel_instance_init(Object *obj)
 {
     KVMState *s = KVM_STATE(obj);
@@ -3191,6 +3229,8 @@ static void kvm_accel_instance_init(Object *obj)
     s->kvm_shadow_mem = -1;
     s->kernel_irqchip_allowed = true;
     s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
+    /* KVM dirty ring is by default off */
+    s->kvm_dirty_ring_size = 0;
 }
 
 static void kvm_accel_class_init(ObjectClass *oc, void *data)
@@ -3212,6 +3252,12 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "kvm-shadow-mem",
         "KVM shadow MMU size");
+
+    object_class_property_add(oc, "dirty-ring-size", "uint32",
+        kvm_get_dirty_ring_size, kvm_set_dirty_ring_size,
+        NULL, NULL);
+    object_class_property_set_description(oc, "dirty-ring-size",
+        "Size of KVM dirty page ring buffer (default: 0, i.e. use bitmap)");
 }
 
 static const TypeInfo kvm_accel_type = {
diff --git a/qemu-options.hx b/qemu-options.hx
index e22fb94d99..ecdb064409 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -141,6 +141,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
     "                split-wx=on|off (enable TCG split w^x mapping)\n"
     "                tb-size=n (TCG translation block cache size)\n"
+    "                dirty-ring-size=n (KVM dirty ring GFN count, default 0)\n"
     "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 SRST
 ``-accel name[,prop=value[,...]]``
@@ -181,6 +182,17 @@ SRST
         where both the back-end and front-ends support it and no
         incompatible TCG features have been enabled (e.g.
         icount/replay).
+
+    ``dirty-ring-size=n``
+        When the KVM accelerator is used, it controls the size of the per-vCPU
+        dirty page ring buffer (number of entries for each vCPU). It should
+        be a value that is power of two, and it should be 1024 or bigger (but
+        still less than the maximum value that the kernel supports).  4096
+        could be a good initial value if you have no idea which is the best.
+        Set this value to 0 to disable the feature.  By default, this feature
+        is disabled (dirty-ring-size=0).  When enabled, KVM will instead
+        record dirty pages in a bitmap.
+
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-- 
2.31.1



