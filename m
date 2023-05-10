Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03A36FE1EC
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:54:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwm7I-00030R-6Q; Wed, 10 May 2023 11:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwm7F-0002zU-Ud
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:33 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwm7C-0004UV-C9
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:52:31 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f423ac6e2dso28743145e9.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683733949; x=1686325949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cpop6LoNqSh03hm8vCAMJ2YCthnibtXTEV61F8HsXUQ=;
 b=h3bisDW9bIxtAUAucN+PvcNVVKcrQjZ4LyVdRRsuYdJ75a4o0g4aQFOrJj/bOKOOBV
 UamU+ZMS5L15+9TeYmL0PpD2vSPFMU5DCQW0lhxwKRMCW50n13Th9Ytd5iquyCN6CeOQ
 wnrTDHxQ+qrLSAlXedMOu7xkDJtpaO74IsfNgoV1PwUA+Mn6NeC5tr2csLKAfaX4g9Yv
 UAbQcfGNSpvLS7lbHuIAmkTJY3XstUq79iHo5WzhcsrwRup0CZvNmuNDnzGTTEy6Lnd0
 tAYE/A8vvbOzA2/cG1vvjj5BPsyU39wUdEdw2OL7M+KQ5a4bXt1zh4NMxkbTKX7Jw3Hx
 BcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683733949; x=1686325949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cpop6LoNqSh03hm8vCAMJ2YCthnibtXTEV61F8HsXUQ=;
 b=QmJF3C3PH/1ir1xv9tE5cGraILS6cvIQWkyOLVzXR9KnQQ8g3kMcqnRMk9abbyTuBd
 th5k198EExwmXGAFQIPx0tdPfu+rFpSrp3fhNpaj/YD25PiXjixcVqKohQakX3f1m5yY
 sfcenut8Pj9jt+gxWCbRiRFMlPowgGbZc58eguVLz2h3NVicQ9xkfKOIsHbIgwpOh2vP
 0TOhhEuGAdvemqreuPJuf806z79+uh3bKyAF37vAc/CzW8GTmlvt/HeK2CV1uO8u2r2p
 vmrrJEqTAf7yGgSavyQkz+/fq0jfEpJ028IuxlgyPzJmeOlP5IsJAMrdN68d8591K7kh
 WHNg==
X-Gm-Message-State: AC+VfDzICKOdCkT1qKPzzUvFcQ9qCsXaAmSaqtJ+cJAqb0un9HejXQ6G
 BXLRQrXVwmVNou3Sit9+cIzLV5Fu+hltgLiMUKzLlQ==
X-Google-Smtp-Source: ACHHUZ5Lhf9HTaGEu22FIo2Je0p2tAXJxGMhZiVjVMHdjOuLnO8Ovl0255KlP6YXTtZM07uX3SC09w==
X-Received: by 2002:a1c:f402:0:b0:3f3:3a81:32b with SMTP id
 z2-20020a1cf402000000b003f33a81032bmr12547239wma.15.1683733949040; 
 Wed, 10 May 2023 08:52:29 -0700 (PDT)
Received: from stoup.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 n23-20020a7bc5d7000000b003ee74c25f12sm23157946wmk.35.2023.05.10.08.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 08:52:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 3/5] disas: Remove target-specific headers
Date: Wed, 10 May 2023 16:52:24 +0100
Message-Id: <20230510155226.647756-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510155226.647756-1-richard.henderson@linaro.org>
References: <20230510155226.647756-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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


