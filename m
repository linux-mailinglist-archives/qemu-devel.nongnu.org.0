Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA736F3B1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:30:56 +0200 (CEST)
Received: from localhost ([::1]:37002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHzb-0008LX-7i
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlY-0003JY-Ew
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:24 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlB-0007b5-36
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:24 -0400
Received: by mail-pf1-x42b.google.com with SMTP id j6so7986891pfh.5
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+unikDpz5k4psDt6Hvdrjf1plcZuWIxFIQ3ND5/kQ/Y=;
 b=p56Bjonr4wwAw6pV7Y7agSea9tF4k0uf/IX9MC721V3Gsn37IjouC6/lRNTxSReSQq
 xTYab3d0FAFcB0E6tHJNULTPpPKDYWYFz5raDZowdW0v67ltYOt0IFAiWfPKIG3hx9Sr
 QgwYlzXXWzhitGSvFGYT5Q+btdaZLyLuvVPjM9BvTWezthkENMwCDnPFvXpcS0ApNSEV
 /ZuubgcWcNz1RjMNXQFbHqRcTc6xlrP7+q3wbyJ8m7DatI45LQcK4TPHON1JX1yRLWnf
 Iq8hLIZDDZO7H0h75v2iyloS9DZWmU74ogJL5ButGwv5NdFV4IuC+bTj5wCrMaUZvnQH
 Ur8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+unikDpz5k4psDt6Hvdrjf1plcZuWIxFIQ3ND5/kQ/Y=;
 b=UZYvrYNa5U33hLE2ikNqRGUmFeL801L6NBnY+6rJnzMko3MJhcsoKw5/7Ms6WhxZ9o
 /z2ffvdmtYaFkPpl0wx1rGsxuiphA/b4Ba+29wGfFEgsAJo0WokjZbZWKxDYcVeSY8lw
 vyto/dZGf6kQX9KBgDV4MGSplZhtZ4kO30dl9kyR17+z6Rkj6W4yIWnyKr0xktmLmNTz
 JId7O2AvylUWe0bAqxbyNVrvVRiX1bvsI6OrgO1j71MfURQhXSTJAGJFJcvVpEocxVgC
 6Du0WcN++7aT0eofYe6qhypnKvR3RY8UEVxi1okMPgmFhZ2zSFmJ27/BNK22LtnU+0br
 3sUw==
X-Gm-Message-State: AOAM531JvE3kxziBhy8GJagy2n6jjwpjn/Z0EtTc7RwaVjW2cx/4Y+UK
 2HxFWz5n6Lfc6YOslK3bXHg20yiZjGTm4w==
X-Google-Smtp-Source: ABdhPJzAaKunv5ngw0diPMghappqQ4YSfrgxMo9BL1QABUmYGu8y67Jw28sT2GPwNJ4rc0rcVGdYQg==
X-Received: by 2002:a65:4c0c:: with SMTP id u12mr2295182pgq.122.1619745359564; 
 Thu, 29 Apr 2021 18:15:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/30] target/ppc: Introduce macros to check isa extensions
Date: Thu, 29 Apr 2021 18:15:35 -0700
Message-Id: <20210430011543.1017113-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These will be used by the decodetree trans_* functions
to early-exit when the instruction set is not enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 112afd02d5..cde12e9d38 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6876,6 +6876,32 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
     tcg_gen_st_i64(src, cpu_env, avr64_offset(regno, high));
 }
 
+/*
+ * Helpers for trans_* functions to check for specific insns flags.
+ * Use token pasting to ensure that we use the proper flag with the
+ * proper variable.
+ */
+#define REQUIRE_INSNS_FLAGS(CTX, NAME) \
+    do {                                                \
+        if (((CTX)->insns_flags & PPC_##NAME) == 0) {   \
+            return false;                               \
+        }                                               \
+    } while (0)
+
+#define REQUIRE_INSNS_FLAGS2(CTX, NAME) \
+    do {                                                \
+        if (((CTX)->insns_flags2 & PPC2_##NAME) == 0) { \
+            return false;                               \
+        }                                               \
+    } while (0)
+
+/* Then special-case the check for 64-bit so that we elide code for ppc32. */
+#if TARGET_LONG_BITS == 32
+# define REQUIRE_64BIT(CTX)  return false
+#else
+# define REQUIRE_64BIT(CTX)  REQUIRE_INSNS_FLAGS(CTX, 64B)
+#endif
+
 #include "translate/fp-impl.c.inc"
 
 #include "translate/vmx-impl.c.inc"
-- 
2.25.1


