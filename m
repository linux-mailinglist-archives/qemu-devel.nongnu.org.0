Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CFE541F8F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 01:47:05 +0200 (CEST)
Received: from localhost ([::1]:42180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyiue-00019l-0C
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 19:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHt-0007s0-1v
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nyiHr-0005GU-HD
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 19:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654643218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cTuHYQvixT43pjNuKBwV9c99vHGFjiIKeNvL7DBRfeQ=;
 b=KibfOBbKZU4FOHEoD5l4ycmVetFrkO4IWs4Ie4+9S486VlB6fohrpsxFCNI20fcthTlTir
 SuNpfMbKbQ5Jzxl6boISsP73m7NpDdvjGmNnQCZbFuOYJbddX3wyASixx+035lFY3RWtDo
 9uVrmBHa6u9hufDRuQe8SE/ArdbqP84=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-gWIDJOcfOMu7A9DbSvSrJw-1; Tue, 07 Jun 2022 19:06:58 -0400
X-MC-Unique: gWIDJOcfOMu7A9DbSvSrJw-1
Received: by mail-il1-f199.google.com with SMTP id
 3-20020a056e0220c300b002d3d7ebdfdeso14292829ilq.16
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 16:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cTuHYQvixT43pjNuKBwV9c99vHGFjiIKeNvL7DBRfeQ=;
 b=iLFlxsv4J9HkJmnouo9HAK+BmDnWbLkfmWgj85g1ay9IKDZ1ZFkwMFcv7BWw6AwyRy
 AqKjqKnPHoGFXQDavvRo7zSXphyov7mmp2PbstZH+NmQyOOq3ehA+/wDly9ZazbINkZI
 X/U5SKMAq3wstitCSpdhLB1sGGIXtLUV6DsGLtNMk9b6mOz/j80d7CdGl0YJaRO6/Lma
 I7w/K4EJCnniLeTz4K8iaIiNw1D3wNV6+9ujZVGyektzshalPi1wPznEO3GQ1hMM+CRr
 yiby2wQDgB59oFu2+E9zhbNQRZGUBf7PtZ60JRP7uIY50qMW+JXIRgfLb8ReXLncCRvO
 I5uA==
X-Gm-Message-State: AOAM531niGZfcU9Y4aebOuEChUBl4gDVznMrOpjiZEn/ZW4VUF/ApUmt
 jdnWt3LA/vydJHZZY2+Z7FUf9X7/Rp4iBGzcx9KfVonAUMLnBwE7x1lwaYxWqX/4/f7l51Inb5V
 tRcaWXHaxwullvA9uaUtrHstZTrRN+Udm74sGfmErE65G0j9zgW+58nCMngcye/X5
X-Received: by 2002:a05:6e02:20e7:b0:2d3:ca08:64b0 with SMTP id
 q7-20020a056e0220e700b002d3ca0864b0mr18608204ilv.195.1654643217029; 
 Tue, 07 Jun 2022 16:06:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk6i621ieFSncDDt2m1ayH8NSPDIM3ZhFMbN893fDIcHztb3/XS58QxCnjawNRJeWi+nj9Yw==
X-Received: by 2002:a05:6e02:20e7:b0:2d3:ca08:64b0 with SMTP id
 q7-20020a056e0220e700b002d3ca0864b0mr18608182ilv.195.1654643216776; 
 Tue, 07 Jun 2022 16:06:56 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a056602038600b00665862d12bbsm7035375iov.46.2022.06.07.16.06.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Jun 2022 16:06:56 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Sean Christopherson <seanjc@google.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Igor Mammedov <imammedo@redhat.com>, peterx@redhat.com
Subject: [PATCH RFC 5/5] KVM: Hook kvm_arch_put_registers() errors to the
 caller
Date: Tue,  7 Jun 2022 19:06:45 -0400
Message-Id: <20220607230645.53950-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220607230645.53950-1-peterx@redhat.com>
References: <20220607230645.53950-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Leverage the new mechanism to pass over errors to upper stack for
kvm_arch_put_registers() when called for the post_init() accel hook.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c  | 13 ++++++++++---
 accel/kvm/kvm-cpus.h |  2 +-
 softmmu/cpus.c       |  5 ++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 1caed1a295..71be723d24 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2761,15 +2761,22 @@ void kvm_cpu_synchronize_post_reset(CPUState *cpu)
     run_on_cpu(cpu, do_kvm_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
 }
 
-static void do_kvm_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg)
+static void do_kvm_cpu_synchronize_post_init(CPUState *cpu, run_on_cpu_data arg,
+                                             Error **errp)
 {
-    kvm_arch_put_registers(cpu, KVM_PUT_FULL_STATE);
+    int ret = kvm_arch_put_registers(cpu, KVM_PUT_FULL_STATE);
+
+    if (ret) {
+        error_setg(errp, "kvm_arch_put_registers() failed with retval=%d", ret);
+        return;
+    }
+
     cpu->vcpu_dirty = false;
 }
 
 void kvm_cpu_synchronize_post_init(CPUState *cpu, Error **errp)
 {
-    run_on_cpu(cpu, do_kvm_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
+    run_on_cpu2(cpu, do_kvm_cpu_synchronize_post_init, RUN_ON_CPU_NULL, errp);
 }
 
 static void do_kvm_cpu_synchronize_pre_loadvm(CPUState *cpu, run_on_cpu_data arg)
diff --git a/accel/kvm/kvm-cpus.h b/accel/kvm/kvm-cpus.h
index bf0bd1bee4..c9b8262704 100644
--- a/accel/kvm/kvm-cpus.h
+++ b/accel/kvm/kvm-cpus.h
@@ -16,7 +16,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp);
 int kvm_cpu_exec(CPUState *cpu);
 void kvm_destroy_vcpu(CPUState *cpu);
 void kvm_cpu_synchronize_post_reset(CPUState *cpu);
-void kvm_cpu_synchronize_post_init(CPUState *cpu);
+void kvm_cpu_synchronize_post_init(CPUState *cpu, Error **errp);
 void kvm_cpu_synchronize_pre_loadvm(CPUState *cpu);
 
 #endif /* KVM_CPUS_H */
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 59c70fd496..6c0b5b87f0 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -151,7 +151,10 @@ void cpu_synchronize_all_post_init(Error **errp)
     CPUState *cpu;
 
     CPU_FOREACH(cpu) {
-        cpu_synchronize_post_init(cpu);
+        cpu_synchronize_post_init_full(cpu, errp);
+        if (errp && *errp) {
+            break;
+        }
     }
 }
 
-- 
2.32.0


