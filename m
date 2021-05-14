Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C75380DCA
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 18:10:25 +0200 (CEST)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhaON-0000eT-HO
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 12:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhZtX-0003I5-EN
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:38:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhZtR-00016X-Do
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621006703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUL0tSzv0vD+pdvwL1XOC/nMpWZDSeyWNYa5M8/+s4E=;
 b=QPLNP+L9D1Kftp/42EQ0aAwjzqeCJCrn5znJNcURBzxrBcAzXzXQU7KJnbytRrmgdBJKQu
 1kjsr0AE7ZRFQd+9WGuVduCwuASz/RsL5SaatyokAi/YCZkJAl89GfvYsmvID50HWRR9XM
 UPsCGvHPe4BllKiD/ckGI/mM6ZRaeUo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-bp2k6wWwNx-JEK_EGFpMUA-1; Fri, 14 May 2021 11:38:21 -0400
X-MC-Unique: bp2k6wWwNx-JEK_EGFpMUA-1
Received: by mail-ej1-f70.google.com with SMTP id
 v10-20020a170906292ab02903d18e1be8f8so2417865ejd.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tUL0tSzv0vD+pdvwL1XOC/nMpWZDSeyWNYa5M8/+s4E=;
 b=CYmtcsVjx4RU4tDYSbAgC+LyJBXca2RR//raY7tsjcZ7IsYRiuTkRVjtbrZ+gJvktb
 PP98RrYUedFdkzZT8tJf/KioHMj8SF7C4bzRILT5R8zT4AeO/rOqvUdjOcU7AD1Rx7+W
 RQTeemdiSV/zA9nsh0R84I8qJdH6SAGslKWx0CtLpEJtp+wAv2XeVu6VVr3G1YHMgtfw
 H5b/T7fiqV6ueBUcLXr8rPyUPmC/6HuL9F6havA5ADW9XMwQRdeTRe0ZXc5PXGt9J5uC
 eoDuas0DBTLLcRGGq50fuWOv0QWJoholXqw84eFHD3prWkmWkFLx4jxv47m0JAR3cjSw
 RqUw==
X-Gm-Message-State: AOAM533EGoqzcn4Ax0SPBpLpdheZNPJDjBF10GKd/cp5uRCPbMVEq12D
 4FdiYXHx/36GssbDDEQuJbOKbV7p9RAN5Wr2v+XHqCSfd6ogScXAmOBwaUBp3G286eHZ6kWrdlw
 ofkrxtR2dyr/MpKg=
X-Received: by 2002:a50:f9cc:: with SMTP id a12mr57654882edq.24.1621006699837; 
 Fri, 14 May 2021 08:38:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSv+PbF8BxGYc1WdapF0yH6K98UV59fdoSR8S4s56GSOwBkzUCMl7eITFDsYbqnTv9K3Hx7A==
X-Received: by 2002:a50:f9cc:: with SMTP id a12mr57654856edq.24.1621006699606; 
 Fri, 14 May 2021 08:38:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h8sm3698531ejb.104.2021.05.14.08.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 08:38:18 -0700 (PDT)
Subject: Re: [PATCH v7 00/10] KVM: Dirty ring support (QEMU part)
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210506160549.130416-1-peterx@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dac5f0c6-1bca-3daf-e5d2-6451dbbaca93@redhat.com>
Date: Fri, 14 May 2021 17:38:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506160549.130416-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Hyman <huangy81@chinatelecom.cn>, Keqian Zhu <zhukeqian1@huawei.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/05/21 18:05, Peter Xu wrote:
> This is v7 of the qemu dirty ring interface support.
> 
> v7:
> - Rebase to latest master commit d45a5270d07

Queued, thanks!

I only made a small change to rename the property from dirty-gfn-count
to dirty-ring-size, since (assuming the user knows what gfn means)
it's not clear that it's related to the ring buffer support.

Thanks,

Paolo

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index fd8ce2e0b2..aa785b7171 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -146,9 +146,8 @@ struct KVMState
          KVMMemoryListener *ml;
          AddressSpace *as;
      } *as;
-    bool kvm_dirty_ring_enabled;    /* Whether KVM dirty ring is enabled */
-    uint64_t kvm_dirty_ring_size;   /* Size of the per-vcpu dirty ring */
-    uint32_t kvm_dirty_gfn_count;   /* Number of dirty GFNs per ring */
+    uint64_t kvm_dirty_ring_bytes;  /* Size of the per-vcpu dirty ring */
+    uint32_t kvm_dirty_ring_size;   /* Number of dirty GFNs per ring */
      struct KVMDirtyRingReaper reaper;
  };
  
@@ -725,14 +724,14 @@ static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
  static uint32_t kvm_dirty_ring_reap_one(KVMState *s, CPUState *cpu)
  {
      struct kvm_dirty_gfn *dirty_gfns = cpu->kvm_dirty_gfns, *cur;
-    uint32_t gfn_count = s->kvm_dirty_gfn_count;
+    uint32_t ring_size = s->kvm_dirty_ring_size;
      uint32_t count = 0, fetch = cpu->kvm_fetch_index;
  
-    assert(dirty_gfns && gfn_count);
+    assert(dirty_gfns && ring_size);
      trace_kvm_dirty_ring_reap_vcpu(cpu->cpu_index);
  
      while (true) {
-        cur = &dirty_gfns[fetch % gfn_count];
+        cur = &dirty_gfns[fetch % ring_size];
          if (!dirty_gfn_is_dirtied(cur)) {
              break;
          }
@@ -1389,7 +1388,7 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
                   *
                   * Not easy.  Let's cross the fingers until it's fixed.
                   */
-                if (kvm_state->kvm_dirty_ring_enabled) {
+                if (kvm_state->kvm_dirty_ring_size) {
                      kvm_dirty_ring_reap_locked(kvm_state);
                  } else {
                      kvm_slot_get_dirty_log(kvm_state, mem);
@@ -2445,24 +2444,24 @@ static int kvm_init(MachineState *ms)
       * Enable KVM dirty ring if supported, otherwise fall back to
       * dirty logging mode
       */
-    if (s->kvm_dirty_gfn_count > 0) {
-        uint64_t ring_size;
+    if (s->kvm_dirty_ring_size > 0) {
+        uint64_t ring_bytes;
  
-        ring_size = s->kvm_dirty_gfn_count * sizeof(struct kvm_dirty_gfn);
+        ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
  
          /* Read the max supported pages */
          ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
          if (ret > 0) {
-            if (ring_size > ret) {
-                error_report("KVM dirty GFN count %" PRIu32 " too big "
+            if (ring_bytes > ret) {
+                error_report("KVM dirty ring size %" PRIu32 " too big "
                               "(maximum is %ld).  Please use a smaller value.",
-                             s->kvm_dirty_gfn_count,
+                             s->kvm_dirty_ring_size,
                               ret / sizeof(struct kvm_dirty_gfn));
                  ret = -EINVAL;
                  goto err;
              }
  
-            ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_size);
+            ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
              if (ret) {
                  error_report("Enabling of KVM dirty ring failed: %d. "
                               "Suggested mininum value is 1024. "
@@ -2470,8 +2469,7 @@ static int kvm_init(MachineState *ms)
                  goto err;
              }
  
-            s->kvm_dirty_ring_size = ring_size;
-            s->kvm_dirty_ring_enabled = true;
+            s->kvm_dirty_ring_bytes = ring_bytes;
          }
      }
  
@@ -3552,17 +3550,17 @@ bool kvm_kernel_irqchip_split(void)
      return kvm_state->kernel_irqchip_split == ON_OFF_AUTO_ON;
  }
  
-static void kvm_get_dirty_gfn_count(Object *obj, Visitor *v,
+static void kvm_get_dirty_ring_size(Object *obj, Visitor *v,
                                      const char *name, void *opaque,
                                      Error **errp)
  {
      KVMState *s = KVM_STATE(obj);
-    uint32_t value = s->kvm_dirty_gfn_count;
+    uint32_t value = s->kvm_dirty_ring_size;
  
      visit_type_uint32(v, name, &value, errp);
  }
  
-static void kvm_set_dirty_gfn_count(Object *obj, Visitor *v,
+static void kvm_set_dirty_ring_size(Object *obj, Visitor *v,
                                      const char *name, void *opaque,
                                      Error **errp)
  {
@@ -3576,7 +3574,7 @@ static void kvm_set_dirty_gfn_count(Object *obj, Visitor *v,
          return;
      }
  
-    s->kvm_dirty_gfn_count = value;
+    s->kvm_dirty_ring_size = value;
  }
  
  static void kvm_accel_instance_init(Object *obj)
@@ -3587,7 +3585,7 @@ static void kvm_accel_instance_init(Object *obj)
      s->kernel_irqchip_allowed = true;
      s->kernel_irqchip_split = ON_OFF_AUTO_AUTO;
      /* KVM dirty ring is by default off */
-    s->kvm_dirty_gfn_count = 0;
+    s->kvm_dirty_ring_size = 0;
  }
  
  static void kvm_accel_class_init(ObjectClass *oc, void *data)
@@ -3610,11 +3608,11 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
      object_class_property_set_description(oc, "kvm-shadow-mem",
          "KVM shadow MMU size");
  
-    object_class_property_add(oc, "dirty-gfn-count", "uint32",
-        kvm_get_dirty_gfn_count, kvm_set_dirty_gfn_count,
+    object_class_property_add(oc, "dirty-ring-size", "uint32",
+        kvm_get_dirty_ring_size, kvm_set_dirty_ring_size,
          NULL, NULL);
-    object_class_property_set_description(oc, "dirty-gfn-count",
-        "KVM dirty GFN count (=0 to disable dirty ring)");
+    object_class_property_set_description(oc, "dirty-ring-size",
+        "Size of KVM dirty page ring buffer (default: 0, i.e. use bitmap)");
  }
  
  static const TypeInfo kvm_accel_type = {
diff --git a/qemu-options.hx b/qemu-options.hx
index acd8b4f6f9..31931f0923 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -141,7 +141,7 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
      "                kvm-shadow-mem=size of KVM shadow MMU in bytes\n"
      "                split-wx=on|off (enable TCG split w^x mapping)\n"
      "                tb-size=n (TCG translation block cache size)\n"
-    "                dirty-gfn-count=n (KVM dirty ring GFN count, default 0)\n"
+    "                dirty-ring-size=n (KVM dirty ring GFN count, default 0)\n"
      "                thread=single|multi (enable multi-threaded TCG)\n", QEMU_ARCH_ALL)
  SRST
  ``-accel name[,prop=value[,...]]``
@@ -183,15 +183,15 @@ SRST
          incompatible TCG features have been enabled (e.g.
          icount/replay).
  
-    ``dirty-gfn-count=n``
-        When KVM accelerator is used, it controls the per-vcpu KVM dirty ring
-        size (number of entries one dirty ring contains, per-vcpu). It should
+    ``dirty-ring-size=n``
+        When the KVM accelerator is used, it controls the size of the per-vCPU
+        dirty page ring buffer (number of entries for each vCPU). It should
          be a value that is power of two, and it should be 1024 or bigger (but
          still less than the maximum value that the kernel supports).  4096
          could be a good initial value if you have no idea which is the best.
          Set this value to 0 to disable the feature.  By default, this feature
-        is disabled (dirty-gfn-count=0).  When enabled, it'll automatically
-        replace the kvm get dirty log feature.
+        is disabled (dirty-ring-size=0).  When enabled, KVM will instead
+        record dirty pages in a bitmap.
  
  ERST
  


