Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13948392384
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:00:00 +0200 (CEST)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3RO-00040u-Nm
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FM-0005fe-RK
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:32 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:38815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FH-0004Vf-DX
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:32 -0400
Received: by mail-pg1-x530.google.com with SMTP id 6so2296486pgk.5
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GkrUlbYQvGIINdckDDsYyRJMGvt/rK6bUqzfCARWGa8=;
 b=iCsNwRvcCioueGeYWNuJsqJSOwa3ScHuIZ4CeFf50nirxzCq/jX7J+G1NnLy1/yY+a
 8QVz++voVTDqyOTzar9YNnBkcMAmQJCjyveSGx+4GEQmuj7voXPsIH3iekLD1pPkR+D7
 FU6TFAuJOie+NoV1d095RGYkW7hLbUehynDHIyAnwdKymYtVSnSwJdlRTsUYO5gl+51H
 v5SA1tDQ6nY7LBQHGy6Z4kbi/XhydLUtqZPLqayU4Mv55IYeL0sqGhhCnN/XLofVOnOv
 Um0bNyMH22GQ0JLRqJK+NvAiMap86GoihFBxzvNXmmgPtAXtDm0/tCJvdD1oW2EKN3Zx
 c3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GkrUlbYQvGIINdckDDsYyRJMGvt/rK6bUqzfCARWGa8=;
 b=cfhoD0eWTfD2wfR+yfMNGThdIggonKbmPCZZOtwvZvetjO8Dihn9fgGMT8XKzrTboW
 RjrzT8Ap0fBP+teTD/BUpPn3TQXvslxXDp6hcGyS8rJgyDi8S28Vc1MMjxyuO2wDEJbd
 4+Y7wmRxSXifO5cnUeyEyMkWAneVvIoSdt1ev2A8viMqBBA3eEOWmyDunCEEb3X3CdW7
 uVb81il60nG5aXl3fp/lI9C4ObQ4rOa9q4K8WqNb7fSLQWTXkkPEn5rHI9X4WIEnpwFA
 mmNxWkEi0DyZ92Oj+KXIZTDpoRgDElHlwEWEJniE8BiMMVeNhSJt1TommzKho3zUG8NG
 /SNA==
X-Gm-Message-State: AOAM532D2UiAAZnvTv6yKP7qPgPMZhzOfyre17nH+k5YFoZqhb651mua
 /9jksKUaz7spHEdT+U4ri890N52z7KZ82Q==
X-Google-Smtp-Source: ABdhPJzSQgxrhOM2Lx1mNGx/8ohfvqpJzshAAPCJulD9CSXT5TNZaCQHk5NAPB3IJB0vcQW5oQtr/w==
X-Received: by 2002:a63:f749:: with SMTP id f9mr960181pgk.369.1622072845823;
 Wed, 26 May 2021 16:47:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/31] cpu: Directly use get_paging_enabled() fallback handlers
 in place
Date: Wed, 26 May 2021 16:46:55 -0700
Message-Id: <20210526234710.125396-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

No code uses CPUClass::get_paging_enabled() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_paging_enabled'
  hw/core/cpu.c:74:    return cc->get_paging_enabled(cpu);
  hw/core/cpu.c:438:    k->get_paging_enabled = cpu_common_get_paging_enabled;
  target/i386/cpu.c:7418:    cc->get_paging_enabled = x86_cpu_get_paging_enabled;

Check the handler presence in place and remove the common fallback code.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-10-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-common.c | 13 -------------
 hw/core/cpu-sysemu.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 5913ffe22b..2aa6b8cffc 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -66,18 +66,6 @@ CPUState *cpu_create(const char *typename)
     return cpu;
 }
 
-bool cpu_paging_enabled(const CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return cc->get_paging_enabled(cpu);
-}
-
-static bool cpu_common_get_paging_enabled(const CPUState *cpu)
-{
-    return false;
-}
-
 void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
                             Error **errp)
 {
@@ -316,7 +304,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 7f3a357494..931ba46354 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -22,6 +22,17 @@
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 
+bool cpu_paging_enabled(const CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_paging_enabled) {
+        return cc->get_paging_enabled(cpu);
+    }
+
+    return false;
+}
+
 hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
                                      MemTxAttrs *attrs)
 {
-- 
2.25.1


