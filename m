Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7422032B9DC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:29:39 +0100 (CET)
Received: from localhost ([::1]:45644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWFe-0006wL-FJ
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAD-0007Xf-HS
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:24:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWAA-0000ua-Rl
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614795838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jSFJR2T0y61cEAykVjSlmIgXEHeIk/fhpqbk5zPRC7k=;
 b=JrPfoBckIL0HqYn5z/7XDur1p/O0oMhgAt4iaZcsweIxIARbIVKT9ex7nMupkbCwlnNiOc
 kwUSl0BNIXA4FrRCfB+32v+NX6xiTV9POI8QN4/uUxXrBEmGwTZRqMDaRx6zj31ad+r+on
 1uRNiGJq1avAlBCwKNu/0O2Rkmqv5Ck=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-Mvh7QXiEOnuMQj6M9X8WHg-1; Wed, 03 Mar 2021 13:23:56 -0500
X-MC-Unique: Mvh7QXiEOnuMQj6M9X8WHg-1
Received: by mail-wm1-f69.google.com with SMTP id c7so1675948wml.8
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jSFJR2T0y61cEAykVjSlmIgXEHeIk/fhpqbk5zPRC7k=;
 b=X2LJ4JXLuTTY3lEs995RfnTsQ4Ushqy8loCc+jwdvXF0AVhT26OaMrR7iWd2bdDX5p
 wZPPzPjPwzp4af7CYZdFJEgCZYSy9KaH8URF0FPLullmjwspoywfGp3U+GgM46TWgl+l
 PU7hUXD0TrBG33Gp6eKWcCWKt+j5i3YEiGDXEVk3TNf/8jNzPNTTYkYTpvtIO/pIiytJ
 lbFX8KMVGkBdtI5eo70q0IODKOCIwcO5NJLAGf1Slefv3g65ekMGyBpPFKQpyv752izv
 rN8sXMYTUm+HaqJ17BFGMrnp3No2wr3o3SMrTEcd282aAzy0/w123bsqfaayCKg+sEql
 AWVw==
X-Gm-Message-State: AOAM531vzAVHS1doQZUPf84BkG+6fikBhWUHwPky3UVP9Gz3XRwiq+vQ
 lhgu69y1Iit/kyLD3Dkd5LJbxvhfMD1GhH87B4JyeArWUTv591NDN/TQZFd5may82Jd+7ZYx26T
 ToZzBLBvzmQE83k9c939jpJH5DNchtd6TwwZRPjNPcpaARJvUBIIyxpqDj7pPGgj2
X-Received: by 2002:adf:f941:: with SMTP id q1mr29310638wrr.189.1614795835312; 
 Wed, 03 Mar 2021 10:23:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+U5MnteFFnH0DvjeZoCaADZkKnu3iy+W7Ik0whDtmDP3G8okupBtGMb7OSZvJC7sHUOE4eg==
X-Received: by 2002:adf:f941:: with SMTP id q1mr29310594wrr.189.1614795835090; 
 Wed, 03 Mar 2021 10:23:55 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l15sm6604958wme.43.2021.03.03.10.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:23:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 14/19] accel/kvm: Move the 'kvm_fd' field to AccelvCPUState
Date: Wed,  3 Mar 2021 19:22:14 +0100
Message-Id: <20210303182219.1631042-15-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
References: <20210303182219.1631042-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/core/cpu.h    | 2 --
 include/sysemu/kvm_int.h | 4 ++++
 accel/kvm/kvm-all.c      | 8 ++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 65ff8d86dbc..ca2526e6a23 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -314,7 +314,6 @@ struct AccelvCPUState;
  * @opaque: User data.
  * @mem_io_pc: Host Program Counter at which the memory was accessed.
  * @accel_vcpu: Pointer to accelerator-specific AccelvCPUState field.
- * @kvm_fd: vCPU file descriptor for KVM.
  * @work_mutex: Lock to prevent multiple access to @work_list.
  * @work_list: List of pending asynchronous work.
  * @trace_dstate_delayed: Delayed changes to trace_dstate (includes all changes
@@ -416,7 +415,6 @@ struct CPUState {
 
     /* Accelerator-specific fields. */
     struct AccelvCPUState *accel_vcpu;
-    int kvm_fd;
     struct KVMState *kvm_state;
     struct kvm_run *kvm_run;
     int hvf_fd;
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index f57be10adde..3bf75e62293 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -14,6 +14,10 @@
 #include "sysemu/kvm.h"
 
 struct AccelvCPUState {
+    /**
+     * @kvm_fd: vCPU file descriptor for KVM
+     */
+    int kvm_fd;
 };
 
 typedef struct KVMSlot
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 4ccd12ea56a..1c08ff3fbe0 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -387,7 +387,7 @@ static int do_kvm_destroy_vcpu(CPUState *cpu)
 
     vcpu = g_malloc0(sizeof(*vcpu));
     vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
-    vcpu->kvm_fd = cpu->kvm_fd;
+    vcpu->kvm_fd = cpu->accel_vcpu->kvm_fd;
     QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
 err:
     return ret;
@@ -436,7 +436,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
     }
 
     cpu->accel_vcpu = g_new(struct AccelvCPUState, 1);
-    cpu->kvm_fd = ret;
+    cpu->accel_vcpu->kvm_fd = ret;
     cpu->kvm_state = s;
     cpu->vcpu_dirty = true;
 
@@ -449,7 +449,7 @@ int kvm_init_vcpu(CPUState *cpu, Error **errp)
     }
 
     cpu->kvm_run = mmap(NULL, mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED,
-                        cpu->kvm_fd, 0);
+                        cpu->accel_vcpu->kvm_fd, 0);
     if (cpu->kvm_run == MAP_FAILED) {
         ret = -errno;
         error_setg_errno(errp, ret,
@@ -2631,7 +2631,7 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type, ...)
     va_end(ap);
 
     trace_kvm_vcpu_ioctl(cpu->cpu_index, type, arg);
-    ret = ioctl(cpu->kvm_fd, type, arg);
+    ret = ioctl(cpu->accel_vcpu->kvm_fd, type, arg);
     if (ret == -1) {
         ret = -errno;
     }
-- 
2.26.2


