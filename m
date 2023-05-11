Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E26FEDC0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:16:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Ic-0006PN-Jg; Thu, 11 May 2023 04:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IN-0006JK-FP
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:05 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IJ-0000wq-DC
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:02 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-50bc570b4a3so15012100a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792296; x=1686384296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hh23CcAHzAZeDiuALc/R+n3TikDVtA9YTdeEDvFpi4s=;
 b=vTQiQjPa8bAWeHlq/2NR/ODtEJKOse7ozhLthoGsTlMrsiiQ/eq23npixi3X+0LfAh
 PyFlpQ5dlaVk+RkpvpEY4Puc+bwf2NSm0sFiS0U5mRM2oYKfWH9eCgHJOiExkVs1A2ir
 Gfk1yAizLqoHJo66eTbkyblFEcdWp73iTjY6RWvHab/oGz27Rj8EcKDl//xVwe6Fy73T
 CK5dk6ZlxriR05f+FUFlaC4Dx6CBTslgaXCU9j8o2bflJDDY8M5sXgF5zvJBhUp7oRNb
 RWgJ9KuXI0ljKZWiFn7w3s7OchHpq7NruFii9ixxtDMFw/Iq8l2TOTutOCB751wKkCZe
 uNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792296; x=1686384296;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hh23CcAHzAZeDiuALc/R+n3TikDVtA9YTdeEDvFpi4s=;
 b=AMMHRVruhHqAwpUC0JMaE6K1k3pnWVTFgdkPs79F3WvdfgSM+nGBXaCzukzT7Jitt6
 1o6L96IIt36ttTs3an7kl5osjYnszkGA2KJgfZYUdAQj5mxxYGSbF4A5Lhyplbt7dHqP
 vekzmm+KiYz5OzC4lIBhgXUgy1PSwNYEI8QwJYYpyw3l7bx4Lspzpt1BdJN9OPPZWD/H
 18DGTQ/B31HhALZn47y1JJita8VXI9T+5305LY7NR+Ij8dJKXla/BpYLe2OrhTkmv8S6
 2HE0qZIdwuLyfch47zrapwy/ksiit54U6Ek6dKplkT9gZAyjByJMk60BoagQm6XMGzxB
 7CwQ==
X-Gm-Message-State: AC+VfDz/8ASgnvBYfsKfMRC5Fj3d74SrOv0PvRZ5DTZLqbtnUFnC2q2Q
 mS3raKQDqo+3zr5i2ljUlEl6JGwFIieP5iS2bXpuLA==
X-Google-Smtp-Source: ACHHUZ7BT6k9AiQ5FELFUeJaALLPktB876FT1z226U0B9XJgAcRaJdkrocwU2Rfi1pXm10zfqfTejg==
X-Received: by 2002:aa7:d1d0:0:b0:50b:d731:9fa8 with SMTP id
 g16-20020aa7d1d0000000b0050bd7319fa8mr15455132edp.28.1683792296600; 
 Thu, 11 May 2023 01:04:56 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:04:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PULL 06/53] disas: Remove target-specific headers
Date: Thu, 11 May 2023 09:04:03 +0100
Message-Id: <20230511080450.860923-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x529.google.com
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
index aac7cf3b03..a06954254b 100644
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


