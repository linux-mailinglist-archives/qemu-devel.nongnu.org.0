Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701DF38F209
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:09:33 +0200 (CEST)
Received: from localhost ([::1]:35424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llE56-0007a4-6G
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeT-0004yd-08
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:01 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeJ-0004Nz-3v
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:00 -0400
Received: by mail-ed1-x534.google.com with SMTP id y7so15207838eda.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+6To3R747Gt8KrZIdybi9XgGpLzBn8XFWqjsTJBScXc=;
 b=YBXFKqqlNuV3ZOKRzvT7PDADNDlwnFDaU76/9ZlBFVc17HwYdCikposbI5Jsibqpte
 asXWgVjRjaC4l7YCj5d5FRaJBF06m8K94SssEdgg3h1sP88xy+DNlyfQ2KVpfHliapF1
 6vm0PRHKr3cmn2aebbtmmhlvfkBkV9sEgG9i/8VW/CNqcNwX5yKNGyVfq8YsmAkcGV3Z
 MwZgM9P6oBlhyHfC5ThhAXOB65q8Helmq/LHsxXQyIeYeEYUBKjztpZG1TN+Kuq63fqR
 K109XJt2LIQHBSklf4EQCine3Q7SeVdzU3PbQzlCtLz5XwpKmL2RbaF4UiSQPqvRgDyN
 EktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+6To3R747Gt8KrZIdybi9XgGpLzBn8XFWqjsTJBScXc=;
 b=N2Xhee5qui0IipnexcVxSfhfmPr/omvAoaSZQmcgUMyhjpKWeiUJXABrnDuyg29Ijk
 d8zLOlQ9NRxeJdUSfXDoqmnFI8EareVjeXo8MZtVOxj6btC7T72jiwXQLRRNJdYxz/8H
 CegqDmWbgseeGuch5mfOAF6YotFGKzPiLVip3hX6nY28Hf2HubJAwPa7wW6c1xoXYhIy
 2VoUSPAMW6EzDPKRFcYNIoTlXTize6d2cG8JqVVsew0gQRyTSBaBgPqB4nnje1imSZGK
 oPDz1IKQx3m8TVwuhgIHsJmI0t77txG8UiE13XU83OdzK6osfGLchaenkkDQdPpVrVbW
 JwpA==
X-Gm-Message-State: AOAM530pMG9cot+uMu10QrCx4t+Dpo7M04lG+fxobNsMhWYe8k/DGoYa
 L4dY6I4Qe6pPyvF+Kjh7anby+Ig9IL71Mw==
X-Google-Smtp-Source: ABdhPJzFkQViG/Onk1fWeMxNnea4Sc3qh83kNVVvB4FrNMI/5bgPVeSgUmgIczDkv7MhoKyAlLNw6A==
X-Received: by 2002:aa7:cb92:: with SMTP id r18mr26988829edt.246.1621874503634; 
 Mon, 24 May 2021 09:41:43 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/28] KVM: Add dirty-ring-size property
Date: Mon, 24 May 2021 18:41:19 +0200
Message-Id: <20210524164131.383778-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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



