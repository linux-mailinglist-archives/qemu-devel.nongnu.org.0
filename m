Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF33F5EC7B1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:29:18 +0200 (CEST)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCWL-00078Y-In
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odAs8-0006ae-6S
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odAs4-0000MQ-Lt
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664286216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NJFKIYRYjjNISSajCukU9hvLIF0e+8pTkgRLQUNUm8=;
 b=TVw/6CH2jwyEoaTNPF3crnq9Rp26JIu1WX4GRBtolAnJTiiOCuP+hcSBonkIWs/tz3hHyK
 GYBBdJ8GBGrZ8Wbx1yyxUw3yPUWRxeWMvibcc63fiBcTruul3Of/1sGnv+jSAZRfVs9KiO
 Xaod3O6MgLlRETSNSC1BscgMUOcpszY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-tEa0KokMPlGqo_V4xmDo2Q-1; Tue, 27 Sep 2022 09:43:32 -0400
X-MC-Unique: tEa0KokMPlGqo_V4xmDo2Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 dz21-20020a0564021d5500b0045217702048so7741682edb.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1NJFKIYRYjjNISSajCukU9hvLIF0e+8pTkgRLQUNUm8=;
 b=uq45zMqDux/mxCPU/X6FGIxaPYSHOzceFOSZ+tPHLbQNDUrdtyFD63U2ZtmD9qZYw5
 uVMbbsffwNt2bYXUd69OpC3MhCmknxbayjm62r8VMDvEkBnCVcSm0P7Ostz1exzkmeS1
 hvYac+5pGwm1YpP91QPbXh32ioXnCOfoDvrKc5bonHah5qSIU39Z/Ftc3IXb+RrldEi8
 m5FZTb5wb7YlM28Kg+h3Sw2M9u1jfNty9zFYXgOg3hOPE47+f+lQed8cUo92kBgjIJBk
 kKFmNcITSJR9dHv3hUt/pXTj9HFew42kWnJBqDYORobkhDf6NV0g2zWQqvxn+cqwhD9q
 ht4A==
X-Gm-Message-State: ACrzQf2S4RI+0TjsiHVcZ13vLd/HqJbFabXcraP5g9eLjZw6obmu7lZt
 3+8Y+AAQcLXxPnSvht0MQvpTXsqAQyXYzxxKNnS3HKwOrYO/rgTlYaT7y42m+PM8PXr3MaTLBYI
 iHwjyUP/HUXZ67Ac=
X-Received: by 2002:a17:907:724a:b0:782:3754:ecb3 with SMTP id
 ds10-20020a170907724a00b007823754ecb3mr23242845ejc.282.1664286211731; 
 Tue, 27 Sep 2022 06:43:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7b5jBCDMAynxfFB1N5doRGxZte5plEXWf4LcJJiY3svcMntwbRh3MBsY9LlpgVMZ7EgJwpjw==
X-Received: by 2002:a17:907:724a:b0:782:3754:ecb3 with SMTP id
 ds10-20020a170907724a00b007823754ecb3mr23242829ejc.282.1664286211500; 
 Tue, 27 Sep 2022 06:43:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 e19-20020a170906081300b0073cdeedf56fsm817379ejd.57.2022.09.27.06.43.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 06:43:30 -0700 (PDT)
Message-ID: <dc8d4a33-7246-222b-66b5-6ba784fac56e@redhat.com>
Date: Tue, 27 Sep 2022 15:43:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v7 2/2] i386: Add notify VM exit support
Content-Language: en-US
To: Chenyi Qiang <chenyi.qiang@intel.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220923073333.23381-1-chenyi.qiang@intel.com>
 <20220923073333.23381-3-chenyi.qiang@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220923073333.23381-3-chenyi.qiang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 09:33, Chenyi Qiang wrote:
> Because there are some concerns, e.g. a notify VM exit may happen with
> VM_CONTEXT_INVALID set in exit qualification (no cases are anticipated
> that would set this bit), which means VM context is corrupted. To avoid
> the false positive and a well-behaved guest gets killed, make this
> feature disabled by default. Users can enable the feature by a new
> machine property:
>      qemu -machine notify_vmexit=on,notify_window=0 ...

Some comments on the interface:

- the argument should be one of "run" (i.e. do nothing and continue, the
default), "internal-error" (i.e. raise a KVM internal error), "disable"
(i.e. do not enable the capability).  You can add the enum to
qapi/runstate.json and use object_class_property_add_enum to define
the QOM property.

- properties should have a dash ("-") in the name, not an underscore

- the property should be added to "-accel kvm,..." (on x86 only).  See
after my signature for a preparatory patch that adds a new
kvm_arch_accel_class_init hook.

The default would be either "run" or "disable".  Honestly I think it
should be "run", otherwise there's no point in adding the feature;
if it is not enabled by default, it is very likely that no one would
use it.

> A new KVM exit reason KVM_EXIT_NOTIFY is defined for notify VM exit. If
> it happens with VM_INVALID_CONTEXT, hypervisor exits to user space to
> inform the fatal case. Then user space can inject a SHUTDOWN event to
> the target vcpu. This is implemented by injecting a sythesized triple
> fault event.

I don't think a triple fault is a good match for an event that "should
not happen" and is the fault of the processor rather than the guest.
This should be a KVM internal error.  The workaround is to disable the
notify vmexit.

> +        warn_report_once("KVM: encounter a notify exit with %svalid context in"
> +                         " guest. It means there can be possible misbehaves in"
> +                         " guest, please have a look.",
> +                         ctx_invalid ? "in" : "");

The warning should be unconditional if the context is invalid.

> +    object_class_property_add(oc, X86_MACHINE_NOTIFY_WINDOW, "uint32_t",

uint32 (not uint32_t)

> +                              x86_machine_get_notify_window,
> +                              x86_machine_set_notify_window, NULL, NULL);
> +    object_class_property_set_description(oc, X86_MACHINE_NOTIFY_WINDOW,
> +            "Set the notify window required by notify VM exit");

"Clock cycles without an event window after which a notification VM exit occurs"

Thanks,

Paolo

 From a5cb704991cfcda19a33c622833b69a8f6928530 Mon Sep 17 00:00:00 2001
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 27 Sep 2022 15:20:16 +0200
Subject: [PATCH] kvm: allow target-specific accelerator properties

Several hypervisor capabilities in KVM are target-specific.  When exposed
to QEMU users as accelerator properties (i.e. -accel kvm,prop=value), they
should not be available for all targets.

Add a hook for targets to add their own properties to -accel kvm; for
now no such property is defined.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 5acab1767f..f90c5cb285 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3737,6 +3737,8 @@ static void kvm_accel_class_init(ObjectClass *oc, void *data)
          NULL, NULL);
      object_class_property_set_description(oc, "dirty-ring-size",
          "Size of KVM dirty page ring buffer (default: 0, i.e. use bitmap)");
+
+    kvm_arch_accel_class_init(oc);
  }
  
  static const TypeInfo kvm_accel_type = {
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index efd6dee818..50868ebf60 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -353,6 +353,8 @@ bool kvm_device_supported(int vmfd, uint64_t type);
  
  extern const KVMCapabilityInfo kvm_arch_required_capabilities[];
  
+void kvm_arch_accel_class_init(ObjectClass *oc);
+
  void kvm_arch_pre_run(CPUState *cpu, struct kvm_run *run);
  MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run);
  
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index e5c1bd50d2..d21603cf28 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1056,3 +1056,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
  {
      return true;
  }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 21880836a6..22b3b37193 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5472,3 +5472,7 @@ void kvm_request_xsave_components(X86CPU *cpu, uint64_t mask)
          mask &= ~BIT_ULL(bit);
      }
  }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index caf70decd2..bcb8e06b2c 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -1294,3 +1294,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
  {
      return true;
  }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 466d0d2f4c..7c25348b7b 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2966,3 +2966,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
  {
      return true;
  }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/riscv/kvm.c b/target/riscv/kvm.c
index 70b4cff06f..30f21453d6 100644
--- a/target/riscv/kvm.c
+++ b/target/riscv/kvm.c
@@ -532,3 +532,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
  {
      return true;
  }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 7bd8db0e7b..840af34576 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2574,3 +2574,7 @@ bool kvm_arch_cpu_check_are_resettable(void)
  {
      return true;
  }
+
+void kvm_arch_accel_class_init(ObjectClass *oc)
+{
+}


