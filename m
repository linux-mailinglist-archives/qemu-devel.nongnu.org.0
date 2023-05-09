Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232DA6FCB5B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 18:34:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwQHQ-0004hE-LX; Tue, 09 May 2023 12:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQHM-0004gK-SE
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:33:32 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwQHL-0007WC-2A
 for qemu-devel@nongnu.org; Tue, 09 May 2023 12:33:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3063208beedso5805546f8f.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683650009; x=1686242009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cpop6LoNqSh03hm8vCAMJ2YCthnibtXTEV61F8HsXUQ=;
 b=Gnbku9bU8tkmG9/1YTCWcWsvrvchaT08/PvOC9S0ptmWnC6a/zhQjFkQoGH0HAyzO7
 qgtXLl+zupYiNBnsGIW5/k972QRVOvDV5njCan85s0PaJo5vDGE6CNZ4GOqm8u7XLPv+
 O83u+0gHzha54lZXoAxdQSyBu7V8xJcI+bnH7SnRNbrmYWgBDs4vnhyVPS4gu6zutULD
 cPlDb4WknMZn5InwQ3Zx+3Fsfz3pOw+M37xCf63V6tbog5XE4B7l3LOV7fstQfWCL+sD
 7xTy9ChPG3+5EQHKfVfr5fsyjszn8upYPCEkjrp0Z3O5KpzTc6OIxqErrlYqSriyfOAT
 huFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683650009; x=1686242009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cpop6LoNqSh03hm8vCAMJ2YCthnibtXTEV61F8HsXUQ=;
 b=H0RMx1VbEgFpl7AAlEgn5qC62XT9RkLZsCqcQNSXBpq7ZMmZ6iANGFAM/MH/b1lxHN
 fuEBRF+Rz+DZBwGOCJOJxho+206EOjmSsIYWH7F4YK8GHemmwOVgzMqCFbkL7RcOH3qe
 p80fSUXFlhpECDX5DTD65HGY1GINOBJTlXeqltBRxtFKSasa7ZAUuq4Mz0GLFMYh5aYs
 GYDTP5QWn8XJj9Ykir2h6adi9sA2BzyrXvGPaTjaOSzNi1BMhcdgrPFaWpkDc1lKQy+b
 urYux4qgRXXIqKvumoM5127zxUbrq1dcFNYDy3SwlnKsAxZcy7/fd/Hxb9TYCWCyaTiu
 eOkA==
X-Gm-Message-State: AC+VfDySeXHzGRswmaiFwBfq5xVrp8K/cqqVqosakqKGF0jC4M+qaEKr
 WHdZOuS+7wvpp8c0nYmEnaj9AdeQVeUL6Ao4KB1f2g==
X-Google-Smtp-Source: ACHHUZ7QTlB12sNI4EsYgmugi92LM2uBhTLDDvQ3QdU8lqbHTffSv8rpUjoqrD+yMW3Ry1PN1fUfww==
X-Received: by 2002:adf:f145:0:b0:2ef:b052:1296 with SMTP id
 y5-20020adff145000000b002efb0521296mr11668763wro.22.1683650009736; 
 Tue, 09 May 2023 09:33:29 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 e1-20020adfdbc1000000b0030795249ffasm7393298wrj.92.2023.05.09.09.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 09:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: anjo@rev.ng,
	philmd@linaro.org,
	thuth@redhat.com
Subject: [PATCH v2 3/5] disas: Remove target-specific headers
Date: Tue,  9 May 2023 17:33:24 +0100
Message-Id: <20230509163326.121090-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509163326.121090-1-richard.henderson@linaro.org>
References: <20230509163326.121090-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230503072331.1747057-83-richard.henderson@linaro.org>
---
 include/disas/disas.h | 6 ------
 disas/disas.c         | 3 ++-
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/disas/disas.h b/include/disas/disas.h
index 6c394e0b09..176775eff7 100644
--- a/include/disas/disas.h
+++ b/include/disas/disas.h
@@ -1,11 +1,6 @@
 #ifndef QEMU_DISAS_H
 #define QEMU_DISAS_H
 
-#include "exec/hwaddr.h"
-
-#ifdef NEED_CPU_H
-#include "cpu.h"
-
 /* Disassemble this for me please... (debugging). */
 void disas(FILE *out, const void *code, size_t size);
 void target_disas(FILE *out, CPUState *cpu, uint64_t code, size_t size);
@@ -17,7 +12,6 @@ char *plugin_disas(CPUState *cpu, uint64_t addr, size_t size);
 
 /* Look up symbol for debugging purpose.  Returns "" if unknown. */
 const char *lookup_symbol(uint64_t orig_addr);
-#endif
 
 struct syminfo;
 struct elf32_sym;
diff --git a/disas/disas.c b/disas/disas.c
index f5e95043cf..a709831e8d 100644
--- a/disas/disas.c
+++ b/disas/disas.c
@@ -3,9 +3,10 @@
 #include "disas/dis-asm.h"
 #include "elf.h"
 #include "qemu/qemu-print.h"
-
 #include "disas/disas.h"
 #include "disas/capstone.h"
+#include "hw/core/cpu.h"
+#include "exec/memory.h"
 
 typedef struct CPUDebug {
     struct disassemble_info info;
-- 
2.34.1


