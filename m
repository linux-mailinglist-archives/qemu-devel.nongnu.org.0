Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109DF3480F6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:52:50 +0100 (CET)
Received: from localhost ([::1]:36806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8ca-0000wt-U9
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QS-0007T3-Eb
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP8QQ-0006eI-AT
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:40:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616611213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DCZwd7psCu0ukoI7qN0T500L4gKfi6+wkLXbVcD12lQ=;
 b=RkFFELpvZh8lMWHU64STMOY/4UF5q9BT+kzJhF75X7e8Es7aNvJa59gIVvVW9P1i9XihRZ
 EKDnbFvzEGkqnyaqXM1r6WMUPlZh8A/W+83+5ceJxZ287NnbAj3OQjijuuYV2MY1dtrzjL
 Djsc4lFHxtgLLv+d+Mf8PCdQTXN/yxA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-UNn3ns_MN2erCEBjRnqdKQ-1; Wed, 24 Mar 2021 14:40:12 -0400
X-MC-Unique: UNn3ns_MN2erCEBjRnqdKQ-1
Received: by mail-qk1-f199.google.com with SMTP id v136so2280600qkb.9
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DCZwd7psCu0ukoI7qN0T500L4gKfi6+wkLXbVcD12lQ=;
 b=rX4orVoFsIXM/o0C+4bF9MqlfBANOie0mKlZo3twoi1FGkvSKB9vN9IKZ/Mxu+8gl0
 Mc6kqj1ku8Im6IqruQ0K+QC+IRMeAd8X8xHHP66Aew3EyVMJTsQyqIvHTji/2xo+oa3c
 lCi6Qn0T/wg0QBo99JpCkGmo1kIU4OVYa8TzY3EBe6tgNPkBNnKaw3uss4N6RJVs25Mg
 w/Pj7zngcMBBk2HDgjYWY7wyM6u9jlJsacJWbRXq8eyLHOz5oBIpoPjX7ott1zaNBJyD
 tBPZWP72uzS4pgqiG+fa33y100U1GfHL9qltJ3RcgPqpKhoQdPnCAasjq1tfn69NuroK
 e1ew==
X-Gm-Message-State: AOAM532tGtUDuwhAv2Q67NHr5FgSnLq/7q4QYUlEtCLhpYRySEKjCkE/
 pUFpF1gpL5Xsdtj4Xt8lyu3FR2f0AABeX2N/q9UinjTYY3BcRDn4BYNw+eHFsDhkmycfwv3/RnL
 uOSTPJTsV5LqgsWt2AqR7oDZXiKdgjASGL4hVRy+XbaDpr3jiB3TtIkirZcs39Bl4
X-Received: by 2002:a05:620a:553:: with SMTP id
 o19mr4502743qko.491.1616611210247; 
 Wed, 24 Mar 2021 11:40:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKxrPnHGijjQT8TQ3ZiPV/2nBer89df0nL3Cf0wJvbF755smBqb7CvAT1Ryin6TBlLnWKW6A==
X-Received: by 2002:a05:620a:553:: with SMTP id
 o19mr4502713qko.491.1616611209887; 
 Wed, 24 Mar 2021 11:40:09 -0700 (PDT)
Received: from xz-x1.redhat.com
 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca. [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id t24sm2001083qto.23.2021.03.24.11.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 11:40:09 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/10] KVM: Add dirty-gfn-count property
Date: Wed, 24 Mar 2021 14:39:52 -0400
Message-Id: <20210324183954.345629-9-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210324183954.345629-1-peterx@redhat.com>
References: <20210324183954.345629-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Keqian Zhu <zhukeqian1@huawei.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a parameter for dirty gfn count for dirty rings.  If zero, dirty ring is
disabled.  Otherwise dirty ring will be enabled with the per-vcpu gfn count as
specified.  If dirty ring cannot be enabled due to unsupported kernel or
illegal parameter, it'll fallback to dirty logging.

By default, dirty ring is not enabled (dirty-gfn-count default to 0).

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 72 +++++++++++++++++++++++++++++++++++++++++++++
 qemu-options.hx     | 12 ++++++++
 2 files changed, 84 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4d7ec955b39..8baa002c009 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -128,6 +128,9 @@ struct KVMState
         KVMMemoryListener *ml;
         AddressSpace *as;
     } *as;
+    bool kvm_dirty_ring_enabled;    /* Whether KVM dirty ring is enabled */
+    uint64_t kvm_dirty_ring_size;   /* Size of the per-vcpu dirty ring */
+    uint32_t kvm_dirty_gfn_count;   /* Number of dirty GFNs per ring */
 };
 
 KVMState *kvm_state;
@@ -2132,6 +2135,40 @@ static int kvm_init(MachineState *ms)
     s->coalesced_pio = s->coalesced_mmio &&
                        kvm_check_extension(s, KVM_CAP_COALESCED_PIO);
 
+    /*
+     * Enable KVM dirty ring if supported, otherwise fall back to
+     * dirty logging mode
+     */
+    if (s->kvm_dirty_gfn_count > 0) {
+        uint64_t ring_size;
+
+        ring_size = s->kvm_dirty_gfn_count * sizeof(struct kvm_dirty_gfn);
+
+        /* Read the max supported pages */
+        ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
+        if (ret > 0) {
+            if (ring_size > ret) {
+                error_report("KVM dirty GFN count %" PRIu32 " too big "
+                             "(maximum is %ld).  Please use a smaller value.",
+                             s->kvm_dirty_gfn_count,
+                             ret / sizeof(struct kvm_dirty_gfn));
+                ret = -EINVAL;
+                goto err;
+            }
+
+            ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_size);
+            if (ret) {
+                error_report("Enabling of KVM dirty ring failed: %d. "
+                             "Suggested mininum value is 1024. "
+                             "Please also make sure it's a power of two.", ret);
+                goto err;
+            }
+
+            s->kvm_dirty_ring_size = ring_size;
+            s->kvm_dirty_ring_enabled = true;
+        }
+    }
+
     dirty_log_manual_caps =
         kvm_check_extension(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
     dirty_log_manual_caps &= (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE |
@@ -3175,6 +3212,33 @@ bool kvm_kernel_irqchip_split(void)
     return kvm_state->kernel_irqchip_split == ON_OFF_AUTO_ON;
 }
 
+static void kvm_get_dirty_gfn_count(Object *obj, Visitor *v,
+                                    const char *name, void *opaque,
+                                    Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    uint32_t value = s->kvm_dirty_gfn_count;
+
+    visit_type_uint32(v, name, &value, errp);
+}
+
+static void kvm_set_dirty_gfn_count(Object *obj, Visitor *v,
+                                    const char *name, void *opaque,
+                                    Error **errp)
+{
+    KVMState *s = KVM_STATE(obj);
+    Error *error = NULL;
+    uint32_t value;
+
+    visit_type_uint32(v, name, &value, &error);
+    if (error) {
+        error_propagate(errp, error);
+        return;
+    }
+
+    s->kvm_dirty_gfn_count = value;
+}
+
 static void kvm_accel_instance_init(Object *obj)
 {
     KVMState *s = KVM_STATE(obj);
@@ -3182,6 +3246,8 @@ static void kvm_accel_instance_init(Object *obj)
     s->kvm_shadow_mem = -1;
     s->kernel_irqchip_allowed = true;
     s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
+    /* KVM dirty ring is by default off */
+    s->kvm_dirty_gfn_count = 0;
 }
 
 static void kvm_accel_class_init(ObjectClass *oc, void *data)
@@ -3203,6 +3269,12 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
         NULL, NULL);
     object_class_property_set_description(oc, "kvm-shadow-mem",
         "KVM shadow MMU size");
+
+    object_class_property_add(oc, "dirty-gfn-count", "uint32",
+        kvm_get_dirty_gfn_count, kvm_set_dirty_gfn_count,
+        NULL, NULL);
+    object_class_property_set_description(oc, "dirty-gfn-count",
+        "KVM dirty GFN count (=0 to disable dirty ring)");
 }
 
 static const TypeInfo kvm_accel_type = {
diff --git a/qemu-options.hx b/qemu-options.hx
index d60a03d3a97..c7877009408 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -141,6 +141,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
     "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
     "                split-wx=on|off (enable TCG split w^x mapping)\n"
     "                tb-size=n (TCG translation block cache size)\n"
+    "                dirty-gfn-count=n (KVM dirty ring GFN count, default 0)\n"
     "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
 SRST
 ``-accel name[,prop=value[,...]]``
@@ -181,6 +182,17 @@ SRST
         where both the back-end and front-ends support it and no
         incompatible TCG features have been enabled (e.g.
         icount/replay).
+
+    ``dirty-gfn-count=n``
+        When KVM accelerator is used, it controls the per-vcpu KVM dirty ring
+        size (number of entries one dirty ring contains, per-vcpu). It should
+        be a value that is power of two, and it should be 1024 or bigger (but
+        still less than the maximum value that the kernel supports).  4096
+        could be a good initial value if you have no idea which is the best.
+        Set this value to 0 to disable the feature.  By default, this feature
+        is disabled (dirty-gfn-count=0).  When enabled, it'll automatically
+        replace the kvm get dirty log feature.
+
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-- 
2.26.2


