Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DC062610C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYir-000857-RH; Fri, 11 Nov 2022 13:25:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYip-000836-D9
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:47 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYij-0005Fg-TM
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v1so7472066wrt.11
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1oPa43v+0HZaP362mwFJPM6SRKSInCeIyiDIAZ7nyM=;
 b=WHNtgfOdYhQpEYsQOqOiIJKCoXwzR3/zov19NHWqckp/nqV5tUym2BL0NMMbyULpdP
 eN6V09HJk+UsTaB+NMZ45YQp5Ppq4Gv+7ZgMCc9LEHBKVeQbZ/N9Q07+Yhx2qzlJN7RH
 OMzklb3H9g/f2uk8QJmwJwKYR78rv4OsMaH0Pzfb4KQ+8P+RRdsYCmZ1AZCTHj0p1xvR
 N5Rexfhp4mtxfx4KDXUFMcpl6PmkmlHZDZE8G0ERRScmI/KORr8txUyAJkGCoHy5/dqd
 qsSdRcAcZN2wFIHA6APqirzF2Ozr6Jqs7reULFzL/i+5tWsdiZ1NqBdYnAG6D23NUoW/
 eeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y1oPa43v+0HZaP362mwFJPM6SRKSInCeIyiDIAZ7nyM=;
 b=qRxyBEH4gbv7YOE2yFLXseJgl5XdA6x/7F5do6T7OJGtDZHUJLDExtuOpZ8g1wK3LM
 c5co5zPckA1CA8yknPZcWkVN3sk+Q1QX+KVRKqWGgzOwMG6zg7pVWrjepghTGI9+4Lu8
 IchRUJtTW9O2KGDbMGe6IHtPoJ0+lWYZghxe31HikDPaiVQuZCjAK7TxJtY6ZTmcMNsJ
 UuzDtjUlJty6gkY/Xkf76OZDzfu2VN4n1lgB7dUzj1VaEVvRv2FfkxsFhNvOJ9q2BL+q
 3sdd2uCvscblGjBcMNcS42Ed7JMvhVtJhEkfWcGK9eKuT2PQpcdiWOnAI46xP3MMEnWb
 YF2A==
X-Gm-Message-State: ANoB5pk8BYSV7AjOv5ps2JhJPhPQr49Xj4HcMWpY9cJu9jimEd1MAceN
 Ab5OpItmx5iPXvraEEj++hZhVQT+0XjVQw==
X-Google-Smtp-Source: AA0mqf7pCr0Eni15DXSAUjrRNBhcGQQJ4hlDBLFvsEd61PIKNJbKObaYGlZTeZGdGAtWReXtFAEddA==
X-Received: by 2002:a05:6000:98b:b0:236:6a53:3a19 with SMTP id
 by11-20020a056000098b00b002366a533a19mr1938110wrb.409.1668191140571; 
 Fri, 11 Nov 2022 10:25:40 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a05600c215500b003c6c3fb3cf6sm3518162wml.18.2022.11.11.10.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 716EE1FFB7;
 Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM cores)
Subject: [PATCH v5 08/20] hw/timer: convert mptimer access to attrs to derive
 cpu index
Date: Fri, 11 Nov 2022 18:25:23 +0000
Message-Id: <20221111182535.64844-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

This removes the hacks to deal with empty current_cpu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - update for new fields
  - bool asserts
v3
  - properly fail memory transactions from non-CPU sources
---
 hw/timer/arm_mptimer.c | 49 +++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index cdfca3000b..4618779ade 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -28,6 +28,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
+#include "qemu/log.h"
 #include "hw/core/cpu.h"
 
 #define PTIMER_POLICY                       \
@@ -41,15 +42,23 @@
  * which is used in both the ARM11MPCore and Cortex-A9MP.
  */
 
-static inline int get_current_cpu(ARMMPTimerState *s)
+static bool is_from_cpu(MemTxAttrs attrs)
 {
-    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
+    if (attrs.requester_type != MTRT_CPU) {
+        qemu_log_mask(LOG_UNIMP | LOG_GUEST_ERROR,
+                      "%s: saw non-CPU transaction", __func__);
+        return false;
+    }
+    return true;
+}
 
+static int get_current_cpu(ARMMPTimerState *s, MemTxAttrs attrs)
+{
+    int cpu_id = attrs.requester_id;
     if (cpu_id >= s->num_cpu) {
         hw_error("arm_mptimer: num-cpu %d but this cpu is %d!\n",
                  s->num_cpu, cpu_id);
     }
-
     return cpu_id;
 }
 
@@ -178,25 +187,35 @@ static void timerblock_write(void *opaque, hwaddr addr,
 /* Wrapper functions to implement the "read timer/watchdog for
  * the current CPU" memory regions.
  */
-static uint64_t arm_thistimer_read(void *opaque, hwaddr addr,
-                                   unsigned size)
+static MemTxResult arm_thistimer_read(void *opaque, hwaddr addr, uint64_t *data,
+                                      unsigned size, MemTxAttrs attrs)
 {
-    ARMMPTimerState *s = (ARMMPTimerState *)opaque;
-    int id = get_current_cpu(s);
-    return timerblock_read(&s->timerblock[id], addr, size);
+    if (is_from_cpu(attrs)) {
+        ARMMPTimerState *s = (ARMMPTimerState *)opaque;
+        int id = get_current_cpu(s, attrs);
+        *data = timerblock_read(&s->timerblock[id], addr, size);
+        return MEMTX_OK;
+    } else {
+        return MEMTX_ACCESS_ERROR;
+    }
 }
 
-static void arm_thistimer_write(void *opaque, hwaddr addr,
-                                uint64_t value, unsigned size)
+static MemTxResult arm_thistimer_write(void *opaque, hwaddr addr,
+                                uint64_t value, unsigned size, MemTxAttrs attrs)
 {
-    ARMMPTimerState *s = (ARMMPTimerState *)opaque;
-    int id = get_current_cpu(s);
-    timerblock_write(&s->timerblock[id], addr, value, size);
+    if (is_from_cpu(attrs)) {
+        ARMMPTimerState *s = (ARMMPTimerState *)opaque;
+        int id = get_current_cpu(s, attrs);
+        timerblock_write(&s->timerblock[id], addr, value, size);
+        return MEMTX_OK;
+    } else {
+        return MEMTX_ACCESS_ERROR;
+    }
 }
 
 static const MemoryRegionOps arm_thistimer_ops = {
-    .read = arm_thistimer_read,
-    .write = arm_thistimer_write,
+    .read_with_attrs = arm_thistimer_read,
+    .write_with_attrs = arm_thistimer_write,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.34.1


