Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479003F0BC9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:29:44 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRFv-00046G-AS
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6D-0000Nw-QN
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:41 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6C-0008UH-7j
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:41 -0400
Received: by mail-pg1-x532.google.com with SMTP id o2so3308413pgr.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9LRYcsa0xVQPirZK44p+3i/UGY3pZV0A4hST50affbs=;
 b=Isz9UrhgsSy6RuJNdAWaLk8Fx5UoDEuJ+qYsk5j0KBS8rqhQ6kb/HrnVP7upv7P0k1
 7soUykoIqP+GL0j92kvuBZwWImdehUtwOqrv2+G1sl3RNsCKoPNtNugb2Vpf1RQuwsyz
 hCJwjFMUKRJnOSW5wBKOlrtbZ7TTzKQG0hlfSofdqV/Eo0PAeqWj9BveacaE+GX8NUPm
 A1uGGIlcBvF3MaKiI7KW3NKtQZgOFBv1S1ZiqzytfPER0NZbIBPmvz9rgl+3JKi8s6cN
 l8Koz++5ruO4QIT+1lrp83ZLJSLrUksF/nwhV9LHkcFqb/w602hyQLfuo7zrkuj6+Gek
 SvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9LRYcsa0xVQPirZK44p+3i/UGY3pZV0A4hST50affbs=;
 b=kbN4wtBn1LP/t/EW0h7RHJ1qim24KoOLWXxFwI6DFc/3/qfBAl6GPUcNA9Mf+Zp+uG
 r+3NfGc99OJuZmwCjKwu4kW3ETyNgVmXGNKlPkp2dQ/KT2PgqnG1oz/C0u114y+glIs+
 tGP3EhnxSn6D6bDi/qlhlJUOQVIZVtoZJNwpMHrvsII6+8hQAYqJs25m7nWeXXz+bJlX
 C/22Haae/XABAh/uB33/k082vQGlXxcPd7IMwxLaGz8m+VwdRJdZ5L9dhFcG7aO0F8X4
 lcG2953JOGrmjA+64uz/gXhBN3M6a43Iw5oXxv2HnRjNNwjIil0md6VNzCdHkKVf4PjI
 GYzQ==
X-Gm-Message-State: AOAM533whaJs0rRs2NBc0CHhIDdkWCbVVPfrwWG01TIUXmWdvNlv2VMJ
 ACibJn+FBlGn5bZcnY1hJ1rCrA10J9vZGg==
X-Google-Smtp-Source: ABdhPJz6Xf/3Bdv7vpoe/P4yeZbnuRPBDsFQwWEj5xfiCm55ajfh3zr6Q+asL8DTumoq6Jn6rSbF8w==
X-Received: by 2002:a62:7ed0:0:b0:3e1:99bb:d824 with SMTP id
 z199-20020a627ed0000000b003e199bbd824mr10824013pfc.34.1629314378907; 
 Wed, 18 Aug 2021 12:19:38 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/66] target/s390x: Implement do_unaligned_access for
 user-only
Date: Wed, 18 Aug 2021 09:18:27 -1000
Message-Id: <20210818191920.390759-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu.c             |  2 +-
 target/s390x/tcg/excp_helper.c | 28 +++++++++++++++-------------
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7b7b05f1d3..9d8cfb37cd 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -267,12 +267,12 @@ static void s390_cpu_reset_full(DeviceState *dev)
 static const struct TCGCPUOps s390_tcg_ops = {
     .initialize = s390x_translate_init,
     .tlb_fill = s390_cpu_tlb_fill,
+    .do_unaligned_access = s390x_cpu_do_unaligned_access,
 
 #if !defined(CONFIG_USER_ONLY)
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
     .do_interrupt = s390_cpu_do_interrupt,
     .debug_excp_handler = s390x_cpu_debug_excp_handler,
-    .do_unaligned_access = s390x_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index a61917d04f..9cbe160f66 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -82,6 +82,21 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
     tcg_s390_data_exception(env, dxc, GETPC());
 }
 
+/*
+ * Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
+ * this is only for the atomic operations, for which we want to raise a
+ * specification exception.
+ */
+void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                   MMUAccessType access_type,
+                                   int mmu_idx, uintptr_t retaddr)
+{
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
+    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
+}
+
 #if defined(CONFIG_USER_ONLY)
 
 void s390_cpu_do_interrupt(CPUState *cs)
@@ -602,19 +617,6 @@ void s390x_cpu_debug_excp_handler(CPUState *cs)
     }
 }
 
-/* Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
-   this is only for the atomic operations, for which we want to raise a
-   specification exception.  */
-void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, uintptr_t retaddr)
-{
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
-
-    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
-}
-
 static void QEMU_NORETURN monitor_event(CPUS390XState *env,
                                         uint64_t monitor_code,
                                         uint8_t monitor_class, uintptr_t ra)
-- 
2.25.1


