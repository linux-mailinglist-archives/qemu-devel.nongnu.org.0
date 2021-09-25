Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC852418306
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:04:02 +0200 (CEST)
Received: from localhost ([::1]:34730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9Dd-0001pd-Oi
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91r-0007ps-HA
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91p-0005AN-QQ
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w29so36383800wra.8
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D1NIBiKsJLet/LtgtEl9N8uYnLoHyxQP991kqXpIcyw=;
 b=YOw2pv9ebkj+SD6dyN66r1sz5ImWnhuE1/NU5zJ+fIQcn+D4ncRESVjKU58DS+dE9G
 UJAdGB+y1u1H7jg+2+BcMVUMovD1pwb/9xNI8oHPh4cnl1fJPGMoluC63jOLulGNIHzx
 Vgl/Ok6wivXRNjSWDIrJfQV+/UUS1WrTz0NVni3AYqZj8Qkxd1729D6ihq+OO/SP5Xrn
 k1ekZ8Kh4vaKb2IGL4F9TduJeD6bHWCC6atssDqBIDbJZ3sfA3YaWSO+Glb5LGVUNRDg
 dt2Nb6l4U0v1o4A4lFERu7AV0sYz9AYrtJ1vf3YskPLWVcMAJ0q+I1akov2isqhIxo+5
 pZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D1NIBiKsJLet/LtgtEl9N8uYnLoHyxQP991kqXpIcyw=;
 b=WX6TO388M8yCpz20uhds8h7+/dlN/yefg8F8q0wtYOUhEG9SnNCNDbcwdyjyjPALrv
 UnxAA/VmxEpz/PxQOWIAQf7ulIAMeUqqNZLLRWXyudubHXiWcwsQJ1ztuwiN7OWtJ/rX
 JIR/2r9hDYF/r5nc1IGBqJeUrSYN1jjz7WT3JrcHkJ/5tFYlJkfp6Sk91ZIHJjjHHHqT
 eKdRBTDnVqc377xs2QuRKWM33x9RQXuOgIxd+sx8k/wGB8rvSigDZOkfO3eH8s5goTxL
 r9cGTF2yLwz2p9rKYoSGeUwEZm4ajFe4OP/C4h2986U1rTXui2fEq5fpn8XIP5rkYjeW
 rLng==
X-Gm-Message-State: AOAM531wq/tW8mrQ6TEuJcNYfF9WGyTHnzohRIYxn5x0HRMWNJtgvV1x
 PUy+KbRfPhqATCuIlDe0yDQbM1ZmMg8=
X-Google-Smtp-Source: ABdhPJwPXRuJQaR6gpTRqV/YE5q1tGhHLUEN8yWUd/qyt7m3JhVHHlWnvVf5F5l/T3Ktxkn3CgFDrA==
X-Received: by 2002:a05:600c:2e46:: with SMTP id
 q6mr7286713wmf.182.1632581508227; 
 Sat, 25 Sep 2021 07:51:48 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 m4sm13326459wrx.81.2021.09.25.07.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:51:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/40] accel/kvm: Implement AccelOpsClass::has_work()
Date: Sat, 25 Sep 2021 16:50:44 +0200
Message-Id: <20210925145118.1361230-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement KVM has_work() handler in AccelOpsClass and
remove it from cpu_thread_is_idle() since cpu_has_work()
is already called.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/kvm/kvm-accel-ops.c | 6 ++++++
 softmmu/cpus.c            | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 7516c67a3f5..6f4d5df3a0d 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -74,6 +74,11 @@ static void kvm_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static bool kvm_cpu_has_work(CPUState *cpu)
+{
+    return kvm_halt_in_kernel();
+}
+
 static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -83,6 +88,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm;
+    ops->has_work = kvm_cpu_has_work;
 }
 
 static const TypeInfo kvm_accel_ops_type = {
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 85b06d3e685..c9f54a09989 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -90,7 +90,7 @@ bool cpu_thread_is_idle(CPUState *cpu)
         return true;
     }
     if (!cpu->halted || cpu_has_work(cpu) ||
-        kvm_halt_in_kernel() || whpx_apic_in_platform()) {
+        whpx_apic_in_platform()) {
         return false;
     }
     return true;
-- 
2.31.1


