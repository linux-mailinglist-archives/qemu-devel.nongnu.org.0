Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C094B442D4D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:57:31 +0100 (CET)
Received: from localhost ([::1]:33042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsPy-0007zA-TH
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhL-0001ud-Pi
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:23 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:37866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhI-00021d-Ba
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:23 -0400
Received: by mail-qt1-x82b.google.com with SMTP id o12so7706651qtv.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7mVMLvhvHhRE4SNYEq8lTvIaJ67DT2EyP7H4YHihO6k=;
 b=EXCMgBL6JncL+Ht+0m6fVjNh3/ZUBQ/484zt/rmGgjE0SHh1ps1eFlUTIvhp0Kvq6v
 ju7flJy/ekZoO75GuO1xg0QK1jSy6Xu2imlz0R/lLcYOJRfC4bOafENaABZg+hPqci9p
 YF6NKDp0V/FR/GM0En/KeRCf7wW7IR+FqB4WABV3Z3bMYRKWCsdGbWsIqMqqbYc2V7Ou
 hISYPeZIQvbPczOwVePTPrHosDM51Bx4jajTyTZ8Y6HozLxSbbcKlSMXiYEMncVl71Mq
 c6T8cWxp3QF9G07XK9Z7OxOGIhNp4RyxfYRALPqExztO65hDLHaWNPYcL2y4FkMs53ql
 1jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mVMLvhvHhRE4SNYEq8lTvIaJ67DT2EyP7H4YHihO6k=;
 b=seDqJpNHmIkteiALw1mfVAtBUij5rJ+oKN7nYtlG/PxjPHi+bgu+eRgn/Hi8EpgLY1
 iuecoBmf1kmjkEcRCb1jr7bzeuoyqetwU5SJGEKa8bFqcEHnOrgIMEf2W2C48G7gMf0b
 ViogZreqbaw5/O3BKQ960SpK6po0oGwKkhE2Y48x9wVYhdVghOV3Fy5J56X6DFg315B/
 vg/fLBBUuyydV/ri2r4zzM3mV9vDcilep9PSGYJZiQgBfTj8IhOmDSFYN5qXJJapreTe
 m1pO7gG7q1oi6k12DhXOl4Yj7LxaluCNCYaEEpj/wJKCsvQPa75TF4WsfB4Gzh2ct6ot
 JSjA==
X-Gm-Message-State: AOAM533Z7bzVUGNZXAh+YPwCJqhzwTzvTMVRnTWGK63ewzct8U+UxwQD
 NUinzg9KbYJRkb8TlskpH/pI5Tldyf+2PA==
X-Google-Smtp-Source: ABdhPJyiOGNaUHTOGdov4J9GPUtNwsZKcoYtu/AMhiNZV0KBoMiP0IYZdr87kKlRboVXhlCIIUueVg==
X-Received: by 2002:ac8:6158:: with SMTP id d24mr36642804qtm.115.1635851476932; 
 Tue, 02 Nov 2021 04:11:16 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 59/60] tcg: Add helper_unaligned_{ld,st} for user-only sigbus
Date: Tue,  2 Nov 2021 07:07:39 -0400
Message-Id: <20211102110740.215699-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be called from tcg generated code on hosts that support
unaligned accesses natively, in response to an access that
is supposed to be aligned.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  5 +++++
 accel/tcg/user-exec.c  | 11 +++++++++++
 2 files changed, 16 insertions(+)

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
index aaf47d89d2..1528a21fad 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
+#include "tcg/tcg-ldst.h"
 #include "internal.h"
 
 __thread uintptr_t helper_retaddr;
@@ -215,6 +216,16 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
 #endif
 }
 
+void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
+{
+    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
+}
+
+void helper_unaligned_st(CPUArchState *env, target_ulong addr)
+{
+    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
+}
+
 static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
                             MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
-- 
2.25.1


