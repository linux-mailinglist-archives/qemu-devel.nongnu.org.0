Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC5C3895F6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:59:20 +0200 (CEST)
Received: from localhost ([::1]:40806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRPb-00071x-Nk
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyw-0004f6-Ih
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:46 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:42738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljQyh-0005qb-4k
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:31:46 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 g7-20020a9d12870000b0290328b1342b73so4776826otg.9
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPj+icuYk1Db82ELWhN0FuTsJx+Xd+A4Cv7yhnX7+A8=;
 b=X2b32TWZOWujfKRu9u11k3kJKGad/2wEHUu30Y8D5LkyLX4DnD9yefPsnbJyMq2jyz
 Ipz9yBM5v+39pQeXWF53Sf+XMLMSDkPajJMPB1gxmD+HqbwXKGVLSy70CvsYzUfrk1vb
 ckv1M+V0uJK7R3B77Ii9p1HrUBWSQmixlVAJEU/MtUX6kue1GpHTNZVMjSeIWzlTfM58
 ip1Pczf4w1gKiuigjQJqG33o2aZ/adbHChtaZyW4gq01YHkxwhZvUYWCzzxXjFs2xv/L
 YU6E6DvRbb3qvo3FIct2QZToUwkJGQYEYTHDssiXkd0lMecTX7ypGTphqyns9zE7wvml
 l0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPj+icuYk1Db82ELWhN0FuTsJx+Xd+A4Cv7yhnX7+A8=;
 b=oC4Wnoczn8dDFOcRfHapWJmXyvrEolZa+ky6SjhKkFvD/zN2or/AuqywhAoDmDMtwE
 r6Uq+S0CIa2vgsA0+gY1c7kSazsZ/hit4IDBy1vX7s6lQNsJbFIwFJ7+aY2FjkD57ePt
 av8y5N9xOpRAPIRj8hcF0xU/tuWa2ienNzAXOqSKztlT4al8Ir6GIcNYyGegfPI9Yh7x
 31Dk6YAQmbi6HhPZWVbcJ8LzCb0xuzChoQMlPX+JS5J5wmovmTNDbxBY8IaCx+uYWVh2
 YG+HuCEklgeNg6c8XE6YuYQb65vZujuVpEMCrJ27dxTovXt+AkPrTdAkTISjeSXNT9wY
 uKMA==
X-Gm-Message-State: AOAM53097wpkcK9tyj4VWl53ooiBnd6PBEJg/5ZS+M7qxRC039zaCh/h
 8RPmjl6S9a+vh8PY0f+QsWtuCXoB5l5To5Nl
X-Google-Smtp-Source: ABdhPJxKY+tUGs3g6/iHlEfeSRWC80L7rycX3Lc8hGpFx5+dX3l7sJH4m+cLW3yXIrzG9wdjf2bXfw==
X-Received: by 2002:a9d:5a12:: with SMTP id v18mr636651oth.306.1621449089699; 
 Wed, 19 May 2021 11:31:29 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id l9sm28428oou.43.2021.05.19.11.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:31:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/50] target/i386: Remove user stub for cpu_vmexit
Date: Wed, 19 May 2021 13:30:38 -0500
Message-Id: <20210519183050.875453-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
Cc: peter.maydell@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is only called from tcg/sysemu/.
There is no need for a stub in tcg/user/.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-39-richard.henderson@linaro.org>
---
 target/i386/tcg/helper-tcg.h     | 4 +++-
 target/i386/tcg/user/svm_stubs.c | 6 ------
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
index 97fb7a226a..85a8b0ebd6 100644
--- a/target/i386/tcg/helper-tcg.h
+++ b/target/i386/tcg/helper-tcg.h
@@ -77,10 +77,12 @@ extern const uint8_t parity_table[256];
 /* misc_helper.c */
 void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);
 
-/* svm_helper.c */
+/* sysemu/svm_helper.c */
+#ifndef CONFIG_USER_ONLY
 void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
                               uint64_t exit_info_1, uintptr_t retaddr);
 void do_vmexit(CPUX86State *env);
+#endif
 
 /* seg_helper.c */
 void do_interrupt_x86_hardirq(CPUX86State *env, int intno, int is_hw);
diff --git a/target/i386/tcg/user/svm_stubs.c b/target/i386/tcg/user/svm_stubs.c
index 48a43bdcea..db818f89a8 100644
--- a/target/i386/tcg/user/svm_stubs.c
+++ b/target/i386/tcg/user/svm_stubs.c
@@ -22,12 +22,6 @@
 #include "exec/helper-proto.h"
 #include "tcg/helper-tcg.h"
 
-void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code, uint64_t exit_info_1,
-                uintptr_t retaddr)
-{
-    assert(0);
-}
-
 void cpu_svm_check_intercept_param(CPUX86State *env, uint32_t type,
                                    uint64_t param, uintptr_t retaddr)
 {
-- 
2.25.1


