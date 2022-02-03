Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D74A8E00
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:35:07 +0100 (CET)
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFior-0005B3-Ra
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:35:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhe4-0002q1-9O
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:52 -0500
Received: from [2607:f8b0:4864:20::42c] (port=44575
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhe1-0002MS-Mp
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:19:51 -0500
Received: by mail-pf1-x42c.google.com with SMTP id n32so3017719pfv.11
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=axRz0bpqXV6JMghxTUBPeiCtqNr2FiS0tX0ZbEy+MqU=;
 b=JQY/qC1jf7YSCBU0LGWhHHk51+qzV4fSLhaoivSEcwRHX5jhxCnuKppUkH8VBJrOPZ
 dPQ0H6lYx2ghmQYKydMdCb9/mzsgCL28rp396tXj2i58hGkGo394i9zHmtjDW9gVdrkz
 ydTKO42fp+zFaDwjwTmAXpNfs6iF2nP5WYeSt0NiKf5HK+gLyvGrvbtKFdv0k3rMX39Z
 gk/nFwlY22QPRZeWFsQw2Bk8tVeSUMgNOR8XPo1Ttza7NwgIHwN5/OC+21FI5KR0RBeO
 a5v/5FaZVxlweQe+5DAEQup4cYd52/qxcZI8T5Mg4K4cX3H0nRu6WnPIt6VvcTnAMhOg
 q4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=axRz0bpqXV6JMghxTUBPeiCtqNr2FiS0tX0ZbEy+MqU=;
 b=NXAY3bZD3dwrHrbBg9XGr5lqAeqzOJnDIJv1lAjxvDCfp0BXZpFs3hoR/90yo2m7ZD
 PhPtaTolmHk5HYGqOyc703szClZyxWVcFsF68Z0L+VsSR5r4VC4zoSc5Hh92SCTSOzwZ
 GV16+C0/RV8TV9DcbK/1P12Yr5Ly6rG+0VQUYM6mW0cLkmxPlpqja5ev5PR6lD+SROet
 dqhTPlZOBFWQL9Noeyh2vtAjpCPqScAATRA+FtG9gnKMiNMLx0cq5zD3u6EgdhrYMbEu
 Y86/WoHGI5isc1QC6n1kh7A0o5jGHpJ5nBwMUd+Y/drAih78EzUd71f7X0PAu+bQjwDg
 nujA==
X-Gm-Message-State: AOAM531OsqLczAJWA9d4KrB9LPLFNinwRrUJ45xHqghsL8DS7LJTnJwS
 N4fQvdxjdU5928sb/C42XQraZKRkMk4=
X-Google-Smtp-Source: ABdhPJw/Qke57A8bUWndcrg++Ts1eyO52MnHbjTlS8MPl1m8emtS6QIDY2Fwkn0fwDhcjU3TV7pZDg==
X-Received: by 2002:a63:f709:: with SMTP id x9mr29335262pgh.428.1643915988161; 
 Thu, 03 Feb 2022 11:19:48 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id c17sm32065905pfv.68.2022.02.03.11.19.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:19:47 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 11/21] accel: Introduce AccelOpsClass::cpus_are_resettable()
Date: Thu,  3 Feb 2022 20:18:04 +0100
Message-Id: <20220203191814.45023-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Add cpus_are_resettable() to AccelOps, and implement it for the
KVM accelerator.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/kvm/kvm-accel-ops.c  | 6 ++++++
 include/sysemu/accel-ops.h | 2 ++
 include/sysemu/hw_accel.h  | 5 -----
 softmmu/cpus.c             | 5 ++++-
 4 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 95b7b08020..cd4d4a06a7 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -79,12 +79,18 @@ static bool kvm_vcpu_thread_is_idle(CPUState *cpu)
     return !kvm_halt_in_kernel();
 }
 
+static bool kvm_cpus_are_resettable(void)
+{
+    return kvm_enabled() ? kvm_cpu_check_are_resettable() : true;
+}
+
 static void kvm_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = kvm_start_vcpu_thread;
     ops->cpu_thread_is_idle = kvm_vcpu_thread_is_idle;
+    ops->cpus_are_resettable = kvm_cpus_are_resettable;
     ops->synchronize_post_reset = kvm_cpu_synchronize_post_reset;
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
diff --git a/include/sysemu/accel-ops.h b/include/sysemu/accel-ops.h
index 50c72540c7..6013c9444c 100644
--- a/include/sysemu/accel-ops.h
+++ b/include/sysemu/accel-ops.h
@@ -28,6 +28,8 @@ struct AccelOpsClass {
     /* initialization function called when accel is chosen */
     void (*ops_init)(AccelOpsClass *ops);
 
+    bool (*cpus_are_resettable)(void);
+
     void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
     void (*kick_vcpu_thread)(CPUState *cpu);
     bool (*cpu_thread_is_idle)(CPUState *cpu);
diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
index 01b5ebf442..22903a55f7 100644
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -23,9 +23,4 @@ void cpu_synchronize_post_reset(CPUState *cpu);
 void cpu_synchronize_post_init(CPUState *cpu);
 void cpu_synchronize_pre_loadvm(CPUState *cpu);
 
-static inline bool cpu_check_are_resettable(void)
-{
-    return kvm_enabled() ? kvm_cpu_check_are_resettable() : true;
-}
-
 #endif /* QEMU_HW_ACCEL_H */
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 5b0bcb8c65..79e7d7a608 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -199,7 +199,10 @@ void cpu_synchronize_pre_loadvm(CPUState *cpu)
 
 bool cpus_are_resettable(void)
 {
-    return cpu_check_are_resettable();
+    if (cpus_accel->cpus_are_resettable) {
+        return cpus_accel->cpus_are_resettable();
+    }
+    return true;
 }
 
 int64_t cpus_get_virtual_clock(void)
-- 
2.34.1


