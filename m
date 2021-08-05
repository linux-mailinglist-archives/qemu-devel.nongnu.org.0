Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4553E1D5E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 22:34:02 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBk41-00038m-Dx
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 16:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mBjGp-0000KE-4n; Thu, 05 Aug 2021 15:43:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:51786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mBjGn-0007Sk-Ft; Thu, 05 Aug 2021 15:43:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id u15so4071876wmj.1;
 Thu, 05 Aug 2021 12:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZOApfbQ03KsgoK0wZ7x2pZx8wYHu2jq5lfkc8WbXtAs=;
 b=UOR6wzj2VyF1b9iVY7ghWP35wzSQ96rb04zx7YtN2ImFSM8F2IJlGA32AiSwXGt5Lh
 Iajqq6YRY7ia/vku4Zzt2s0YXgxCVq0ttIHaRPHJ1LSGhEY+FEp42qRa2qoLR4B3FAVb
 MnrhPEwg65x7M+0cYq8OpnOlW5KhaTonsEybypwEDkWgtlovcNfeZSBdKd8OSV5cQq5w
 9AA65caJjMdnwNM7Vf/lkjP5IVFEDcpkzJwvRe5yAn0+aZJNuJUWKgjaa9Hrqq6yBJp2
 hycYVNF+OET12usKvlHuK8V8NqdrF80vLeSayBLXuZh4QxvcP/Xi+BN9TjMTbI6Bb2Ik
 AnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZOApfbQ03KsgoK0wZ7x2pZx8wYHu2jq5lfkc8WbXtAs=;
 b=lNxtsuePHp79A1+PAHtz2sb9zFJWmcpFn2a7Vyb9V6Q2QxnoQ/G+015IlCWeF5KUm3
 o8Ut77s1Lb7m2DITcnio8xg7QLDrcR5KMp8MBB4WCz2aamZnjLcLBX55osjApFmkFsao
 K89ncp59wqyK9TIxuE/RhIFeFVpWcFEuzHgebBY59heOXkAHJ9Kb7V/zJUAjhz/Z8ZDL
 2dFoQa5WCrBO531YsGQoiI/CpznE6Pdx31fp8xOgVzg+QWLemTro7jVxfjbfwyeX3HvE
 J41fCkwrlIBnjf+csvtWyBS4hYyyFouiiTaO9L4aZOIO8DK5Ku+LT/j7B5H8Ilu1XLR6
 dlfw==
X-Gm-Message-State: AOAM531Z7ufDaUD+oOYD7sIEgcLzoKyl4b9wlvaWjbIMZAOx+6Q55zfK
 rGsq9f0jLazu3n4aPSRwhaHG4cktSYNTng==
X-Google-Smtp-Source: ABdhPJwywWZFiPfLmYwuNexoJMrWrEFakMqvw83azNjgkYk1ccfOqHrVtLnqmNzHolvlMLBgwjLyZg==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr6620725wmj.91.1628192587186; 
 Thu, 05 Aug 2021 12:43:07 -0700 (PDT)
Received: from endor.speedport.ip
 (p200300c217088fca515abd37fd86c56e.dip0.t-ipconnect.de.
 [2003:c2:1708:8fca:515a:bd37:fd86:c56e])
 by smtp.gmail.com with ESMTPSA id g16sm8352405wro.63.2021.08.05.12.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 12:43:06 -0700 (PDT)
From: johannst <johannes.stoelp@googlemail.com>
X-Google-Original-From: johannst <johannes.stoelp@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	johannst <johannes.stoelp@gmail.com>
Subject: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
Date: Thu,  5 Aug 2021 21:39:50 +0200
Message-Id: <20210805193950.514357-1-johannes.stoelp@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=johannes.stoelp@googlemail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 05 Aug 2021 16:33:07 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear all,

in my opinion the `type` argument in the kvm ioctl wrappers should be of
type unsigned. Please correct me if I am wrong.

-

Due to the same reason as explained in the comment on the
`irq_set_ioctl` field in `struct KVMState` (accel/kvm/kvm-all.c),
the kvm ioctl wrapper should take `type` as an unsigned.

Signed-off-by: johannst <johannes.stoelp@gmail.com>
---
 accel/kvm/kvm-all.c    | 8 ++++----
 accel/kvm/trace-events | 8 ++++----
 include/sysemu/kvm.h   | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17edb..45cd6edce3 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2967,7 +2967,7 @@ int kvm_cpu_exec(CPUState *cpu)
     return ret;
 }
 
-int kvm_ioctl(KVMState *s, int type, ...)
+int kvm_ioctl(KVMState *s, unsigned type, ...)
 {
     int ret;
     void *arg;
@@ -2985,7 +2985,7 @@ int kvm_ioctl(KVMState *s, int type, ...)
     return ret;
 }
 
-int kvm_vm_ioctl(KVMState *s, int type, ...)
+int kvm_vm_ioctl(KVMState *s, unsigned type, ...)
 {
     int ret;
     void *arg;
@@ -3003,7 +3003,7 @@ int kvm_vm_ioctl(KVMState *s, int type, ...)
     return ret;
 }
 
-int kvm_vcpu_ioctl(CPUState *cpu, int type, ...)
+int kvm_vcpu_ioctl(CPUState *cpu, unsigned type, ...)
 {
     int ret;
     void *arg;
@@ -3021,7 +3021,7 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type, ...)
     return ret;
 }
 
-int kvm_device_ioctl(int fd, int type, ...)
+int kvm_device_ioctl(int fd, unsigned type, ...)
 {
     int ret;
     void *arg;
diff --git a/accel/kvm/trace-events b/accel/kvm/trace-events
index 399aaeb0ec..d78c2eff31 100644
--- a/accel/kvm/trace-events
+++ b/accel/kvm/trace-events
@@ -1,11 +1,11 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
 # kvm-all.c
-kvm_ioctl(int type, void *arg) "type 0x%x, arg %p"
-kvm_vm_ioctl(int type, void *arg) "type 0x%x, arg %p"
-kvm_vcpu_ioctl(int cpu_index, int type, void *arg) "cpu_index %d, type 0x%x, arg %p"
+kvm_ioctl(unsigned type, void *arg) "type 0x%x, arg %p"
+kvm_vm_ioctl(unsigned type, void *arg) "type 0x%x, arg %p"
+kvm_vcpu_ioctl(int cpu_index, unsigned type, void *arg) "cpu_index %d, type 0x%x, arg %p"
 kvm_run_exit(int cpu_index, uint32_t reason) "cpu_index %d, reason %d"
-kvm_device_ioctl(int fd, int type, void *arg) "dev fd %d, type 0x%x, arg %p"
+kvm_device_ioctl(int fd, unsigned type, void *arg) "dev fd %d, type 0x%x, arg %p"
 kvm_failed_reg_get(uint64_t id, const char *msg) "Warning: Unable to retrieve ONEREG %" PRIu64 " from KVM: %s"
 kvm_failed_reg_set(uint64_t id, const char *msg) "Warning: Unable to set ONEREG %" PRIu64 " to KVM: %s"
 kvm_init_vcpu(int cpu_index, unsigned long arch_cpu_id) "index: %d id: %lu"
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d..6d6ed4acf9 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -251,11 +251,11 @@ int kvm_on_sigbus(int code, void *addr);
 
 /* internal API */
 
-int kvm_ioctl(KVMState *s, int type, ...);
+int kvm_ioctl(KVMState *s, unsigned type, ...);
 
-int kvm_vm_ioctl(KVMState *s, int type, ...);
+int kvm_vm_ioctl(KVMState *s, unsigned type, ...);
 
-int kvm_vcpu_ioctl(CPUState *cpu, int type, ...);
+int kvm_vcpu_ioctl(CPUState *cpu, unsigned type, ...);
 
 /**
  * kvm_device_ioctl - call an ioctl on a kvm device
@@ -264,7 +264,7 @@ int kvm_vcpu_ioctl(CPUState *cpu, int type, ...);
  *
  * Returns: -errno on error, nonnegative on success
  */
-int kvm_device_ioctl(int fd, int type, ...);
+int kvm_device_ioctl(int fd, unsigned type, ...);
 
 /**
  * kvm_vm_check_attr - check for existence of a specific vm attribute
-- 
2.32.0


