Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FBE6CC76E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:05:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBmE-0008ON-1O; Tue, 28 Mar 2023 12:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phBmC-0008L4-1C
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:02:24 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phBmA-0004FN-2w
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 12:02:23 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j18-20020a05600c1c1200b003ee5157346cso9782956wms.1
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 09:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680019340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OyRcr9DasCtgvInsYY6GlB+tbhS02lFwPYhN+M0bqAw=;
 b=M/V1i9iWetntCRWzrdkWeGidDB588xHxXoR+BeABnw3ooUjzybpg9e3+r+Q0Zmkd70
 5/EG66HBTqiYyxNjit8pVI20J/nY57KRVTImmW4VZBbiy2Mt2waNfp70Ig2F2w7ut11a
 JobQqrP2ocleeTiv5b6UCHOEedXqK5pZIQwPGEciAV2ECerpZV/tDlyCQMjFn2xYy8MJ
 ydi1oyXJkFMW3im5pHwawf995v2kV5hq3TF7mtas0/yt8U9QHyp6cQZ2h9Uky7LdPUZo
 lzeeJKxX4uC6TYUYdREct6y9MssE9rjbVyt+B1Rz+HoPMbEANrrY5jxR23Mmme4zuG1q
 vJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680019340;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OyRcr9DasCtgvInsYY6GlB+tbhS02lFwPYhN+M0bqAw=;
 b=VPG/3NlXDWg2S+Hk0KHzugqkWM4iuLbdANaLb6RgDKoQndXacuBehWs3/sxVFxYq3m
 aj6j/3JhIuRpjaacJ7KS2TY+ArPm8k0wuKLtEgku6eT2zJlNYnZXEImdXOYydzBH2KSE
 iQ1A+RAZzWE089dpYMP9EkCMZ6sNHLtwBWw05+434/nBiMnRTtBkhtKD4A8qgcDgrSDi
 bJnTdoPYps40CNJYsIDosKjh5fQBqURQ7GkvKAFErqPYK6YFSTnmW4W15qbnxlEhbS66
 a5lJUgCpXuqKI7XYMVdLbEzFtKfZdWmnD3IrWgFpIJ3goHZkmMkCXDwPyIOu1bJhl74E
 ZpuA==
X-Gm-Message-State: AO0yUKUCCCSn14mTqE/3z2V2Q0VNOakZ8XnQDNKt9dqEQjY+1gm/Tq3O
 Zn8W03kKg+Xt7pa187MXQPpl3sDsyHFwY8JfHwQ=
X-Google-Smtp-Source: AK7set/ZtqVx903RDtVSYGptsz18zUVgqjMNZ/IkszSkzAZarRI2FxJklBhqfOllK+78VU2eGn5OQQ==
X-Received: by 2002:a05:600c:2114:b0:3dc:1687:9ba2 with SMTP id
 u20-20020a05600c211400b003dc16879ba2mr11868573wml.35.1680019340251; 
 Tue, 28 Mar 2023 09:02:20 -0700 (PDT)
Received: from localhost.localdomain ([176.187.210.212])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a7bc5d4000000b003ee10fb56ebsm17690163wmk.9.2023.03.28.09.02.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Mar 2023 09:02:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-s390x@nongnu.org, Fabiano Rosas <farosas@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 2/3] softmmu: Restrict cpu_check_watchpoint /
 address_matches to TCG accel
Date: Tue, 28 Mar 2023 18:02:02 +0200
Message-Id: <20230328160203.13510-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328160203.13510-1-philmd@linaro.org>
References: <20230328160203.13510-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Both cpu_check_watchpoint() and cpu_watchpoint_address_matches()
are specific to TCG system emulation. Declare them in "tcg-cpu-ops.h"
to be sure accessing them from non-TCG code is a compilation error.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h         | 37 ------------------------------
 include/hw/core/tcg-cpu-ops.h | 43 +++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 37 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 821e937020..ce312745d5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -970,17 +970,6 @@ static inline void cpu_watchpoint_remove_by_ref(CPUState *cpu,
 static inline void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
 {
 }
-
-static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                                        MemTxAttrs atr, int fl, uintptr_t ra)
-{
-}
-
-static inline int cpu_watchpoint_address_matches(CPUState *cpu,
-                                                 vaddr addr, vaddr len)
-{
-    return 0;
-}
 #else
 int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                           int flags, CPUWatchpoint **watchpoint);
@@ -988,32 +977,6 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
                           vaddr len, int flags);
 void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
 void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
-
-/**
- * cpu_check_watchpoint:
- * @cpu: cpu context
- * @addr: guest virtual address
- * @len: access length
- * @attrs: memory access attributes
- * @flags: watchpoint access type
- * @ra: unwind return address
- *
- * Check for a watchpoint hit in [addr, addr+len) of the type
- * specified by @flags.  Exit via exception with a hit.
- */
-void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                          MemTxAttrs attrs, int flags, uintptr_t ra);
-
-/**
- * cpu_watchpoint_address_matches:
- * @cpu: cpu context
- * @addr: guest virtual address
- * @len: access length
- *
- * Return the watchpoint flags that apply to [addr, addr+len).
- * If no watchpoint is registered for the range, the result is 0.
- */
-int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
 #endif
 
 /**
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 20e3c0ffbb..0ae08df47e 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -175,4 +175,47 @@ struct TCGCPUOps {
 
 };
 
+#if defined(CONFIG_USER_ONLY)
+
+static inline void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                                        MemTxAttrs atr, int fl, uintptr_t ra)
+{
+}
+
+static inline int cpu_watchpoint_address_matches(CPUState *cpu,
+                                                 vaddr addr, vaddr len)
+{
+    return 0;
+}
+
+#else
+
+/**
+ * cpu_check_watchpoint:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ * @attrs: memory access attributes
+ * @flags: watchpoint access type
+ * @ra: unwind return address
+ *
+ * Check for a watchpoint hit in [addr, addr+len) of the type
+ * specified by @flags.  Exit via exception with a hit.
+ */
+void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                          MemTxAttrs attrs, int flags, uintptr_t ra);
+
+/**
+ * cpu_watchpoint_address_matches:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ *
+ * Return the watchpoint flags that apply to [addr, addr+len).
+ * If no watchpoint is registered for the range, the result is 0.
+ */
+int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
+
+#endif
+
 #endif /* TCG_CPU_OPS_H */
-- 
2.38.1


