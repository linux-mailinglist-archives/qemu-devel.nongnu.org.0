Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12B03F0C5F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:03:40 +0200 (CEST)
Received: from localhost ([::1]:54736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRml-00069W-Nc
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9k-0006ny-6N
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:20 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9i-0002fh-KW
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:19 -0400
Received: by mail-pj1-x102d.google.com with SMTP id bo18so3382363pjb.0
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jWZckpkxE9uIH7Kemi/cAWTlru/8DfEcWtH0nqhtr9E=;
 b=QXAF9Us20mae24KwME5FPRzgh9yIgjcXe8I8rGdZDrV4A37RkTpTAbCz7keOQHHmJN
 m/EWyhV/3RTOBiuEehuCPkrwLf8BnK28nQi59R3mmfTfkFT6gS1XQtw25mv45Cy0ImeQ
 D8xE0DLmPVVoywYqwdZQiB8CzAmxgPxBLP50TjwmY/ba6SUztopNoQRm0bZxZmUVrhvQ
 7gzI2MPAZErVBmSa2GhJu4d7gkHvxFlJfn113AdRg48Wu6fRL7g9M4owWbKF3h3jT1dX
 WChW/WtOfxzmtoKxXBtOlAnS6i3wUuN2lCF1+4lg9hctcIgYpdD3LBNA2RCp6KLS8R8H
 jjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jWZckpkxE9uIH7Kemi/cAWTlru/8DfEcWtH0nqhtr9E=;
 b=K9TtBAWr/nifUwbIxnstEOWxJtmlUC+yCys2AwRKkGAdcG/Bdnqk+fe3QH/lbnjOgq
 YzSAPCXAPW2SP055CIEfTmELBqKuzygu3EhzzkhCgBbLliGy9Evi2Sf5ZsO+QkQzI4R7
 AntjGyS8jVxav3UENeQsRthOMdX6P/S4/1//RpOoSoOkxwG+DC4zZzkwlkfB2AaX0noG
 Uiq3RTRHOkVV+SvphwR0DUOb3/qZHYXx49X0i4fMOv934r9T7DQAeajz8vwofyDKpfbK
 jt9S1im4hvq7xeBhR3cVduUx7kTEsRY14PaqDGR+wPOkbNgoV6eJD7aM8aOBUVnEySFf
 W6wg==
X-Gm-Message-State: AOAM5329ZFAUzKSrXTSnvvWMwkm4UrECyEYBJBq0K3c+2sny7flLylpU
 q1efpdnViFfLETgaex+7knWeUcy0hjM+9w==
X-Google-Smtp-Source: ABdhPJx7r3t1DHu5mkGcjI6X64SBV1SYpodecBqWF871UY06HgdMoxO5kVmhYhVjnh763blmI0E/BA==
X-Received: by 2002:a17:90a:8b12:: with SMTP id
 y18mr10867405pjn.72.1629314597385; 
 Wed, 18 Aug 2021 12:23:17 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 43/66] tcg: Add helper_unaligned_{ld,
 st} for user-only sigbus
Date: Wed, 18 Aug 2021 09:18:57 -1000
Message-Id: <20210818191920.390759-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be called from tcg generated code on hosts that support
unaligned accesses natively, in response to an access that
is supposed to be aligned.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  5 +++++
 accel/tcg/user-exec.c  | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 8c86365611..bf40942de4 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -70,5 +70,10 @@ void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 
+#else
+
+void QEMU_NORETURN helper_unaligned_ld(CPUArchState *env, target_ulong addr);
+void QEMU_NORETURN helper_unaligned_st(CPUArchState *env, target_ulong addr);
+
 #endif /* CONFIG_SOFTMMU */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 46b74b5f70..6a3fec3002 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
+#include "tcg/tcg-ldst.h"
 #include "internal.h"
 
 #undef EAX
@@ -867,6 +868,18 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
 #endif
 }
 
+void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
+{
+    cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_LOAD,
+                         MMU_USER_IDX, GETPC());
+}
+
+void helper_unaligned_st(CPUArchState *env, target_ulong addr)
+{
+    cpu_unaligned_access(env_cpu(env), addr, MMU_DATA_STORE,
+                         MMU_USER_IDX, GETPC());
+}
+
 static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
                             MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
-- 
2.25.1


