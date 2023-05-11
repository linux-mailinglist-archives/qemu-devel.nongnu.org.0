Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4DB6FEDC3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:17:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Im-0006Yr-Pt; Thu, 11 May 2023 04:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IZ-0006OI-Sa
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:16 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IK-0000xA-99
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:05:15 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso14720769a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792299; x=1686384299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tU8RR/cxPbafbDJqUPQJIVzs1TdjNS5NeQ3A/dTuICk=;
 b=PquY7GI9KvtfwrQAaZkqZCLIkJabdgmB+W0RQarOew5opojwT2dngfTA82oAZMCY3y
 4VgWuCJUKJe73Hw2WEMthuRQtPorNuh2OcrVO03ekGorSgaLvWw5P4cexJWWBKqE8Vdg
 XOJ2lhudWv8t5YyTVGuSFnNPHeEqmjgrPLiDIH5zpq11mV+HZltAQf01ruyEhPtCLiZp
 3/X6NAwOYJ9m+MZahWdNESnd5dJB9zo6+kg7n2YbsJNQsWomr8gbKHlGJ/svFi3obmm7
 X0j+8eJ4uvcflYseUDIysJGvU+zywYxgdV0Wgf7TpAYwGwv/kQyDqPdlZGvttiapyBYy
 tQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792299; x=1686384299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tU8RR/cxPbafbDJqUPQJIVzs1TdjNS5NeQ3A/dTuICk=;
 b=UWPCpHllzmKVWPEOlb6uv/vToP6CfqGeYs3WxzhvgBjXSrZE0errFqqt7jPq4naMuf
 O7XEiB4C13iuXGuAKPSnBMZkfDc58GH4noygq9A5a8GeUjOmwfsXRs82QOy3F/3stQZU
 LmmNyymoER/Ri5q08o+uZiKt2R+CXpHv+YoYOYU6v+g6JuTUF9+2gj9QhTqEh9mrLoTB
 RM1jpO4krX2Sx0MZwmV2UBnwBmd/l2qM0ZTclSfRbco+N2SIY4U+HJTLQELhSF6Jjxax
 /70Hvqr2JYmCV08kI7gHsDRnA2L8thwNeJQJAKjzQy9ofUXMgCOLubulJz+aFYlTQR55
 Xjcw==
X-Gm-Message-State: AC+VfDzYJbWYRd2zo5L+49l8y+2136WsJbOCEpMs7iYZiss2F06Zbb5g
 3dP5Kcb24ZU/xM3ZiaB4A0nAXaMdl6nQ8617CxsDjQ==
X-Google-Smtp-Source: ACHHUZ7J8sv6pjiMDcnAxVtrllPL99KE/DXGbunnY+uuXIM6xPAYUpP3jniYx+gvxP+achpraW9hrA==
X-Received: by 2002:a17:906:4793:b0:94e:d84e:d4d0 with SMTP id
 cw19-20020a170906479300b0094ed84ed4d0mr19573404ejc.18.1683792298688; 
 Thu, 11 May 2023 01:04:58 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:04:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jamie Iles <quic_jiles@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/53] cpu: expose qemu_cpu_list_lock for lock-guard use
Date: Thu, 11 May 2023 09:04:06 +0100
Message-Id: <20230511080450.860923-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Jamie Iles <quic_jiles@quicinc.com>

Expose qemu_cpu_list_lock globally so that we can use
WITH_QEMU_LOCK_GUARD and QEMU_LOCK_GUARD to simplify a few code paths
now and in future.

Signed-off-by: Jamie Iles <quic_jiles@quicinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230427020925.51003-2-quic_jiles@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-common.h |  1 +
 cpus-common.c             |  2 +-
 linux-user/elfload.c      | 13 +++++++------
 migration/dirtyrate.c     | 26 +++++++++++++-------------
 trace/control-target.c    |  9 ++++-----
 5 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 1be4a3117e..e5a55ede5f 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -32,6 +32,7 @@ extern intptr_t qemu_host_page_mask;
 #define REAL_HOST_PAGE_ALIGN(addr) ROUND_UP((addr), qemu_real_host_page_size())
 
 /* The CPU list lock nests outside page_(un)lock or mmap_(un)lock */
+extern QemuMutex qemu_cpu_list_lock;
 void qemu_init_cpu_list(void);
 void cpu_list_lock(void);
 void cpu_list_unlock(void);
diff --git a/cpus-common.c b/cpus-common.c
index a53716deb4..45c745ecf6 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -25,7 +25,7 @@
 #include "qemu/lockable.h"
 #include "trace/trace-root.h"
 
-static QemuMutex qemu_cpu_list_lock;
+QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
 static QemuCond exclusive_resume;
 static QemuCond qemu_work_cond;
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 80085b8a30..418ad92598 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -17,6 +17,7 @@
 #include "qemu/guest-random.h"
 #include "qemu/units.h"
 #include "qemu/selfmap.h"
+#include "qemu/lockable.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "target_signal.h"
@@ -4238,14 +4239,14 @@ static int fill_note_info(struct elf_note_info *info,
         info->notes_size += note_size(&info->notes[i]);
 
     /* read and fill status of all threads */
-    cpu_list_lock();
-    CPU_FOREACH(cpu) {
-        if (cpu == thread_cpu) {
-            continue;
+    WITH_QEMU_LOCK_GUARD(&qemu_cpu_list_lock) {
+        CPU_FOREACH(cpu) {
+            if (cpu == thread_cpu) {
+                continue;
+            }
+            fill_thread_info(info, cpu->env_ptr);
         }
-        fill_thread_info(info, cpu->env_ptr);
     }
-    cpu_list_unlock();
 
     return (0);
 }
diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
index 180ba38c7a..388337a332 100644
--- a/migration/dirtyrate.c
+++ b/migration/dirtyrate.c
@@ -150,25 +150,25 @@ int64_t vcpu_calculate_dirtyrate(int64_t calc_time_ms,
 retry:
     init_time_ms = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
 
-    cpu_list_lock();
-    gen_id = cpu_list_generation_id_get();
-    records = vcpu_dirty_stat_alloc(stat);
-    vcpu_dirty_stat_collect(stat, records, true);
-    cpu_list_unlock();
+    WITH_QEMU_LOCK_GUARD(&qemu_cpu_list_lock) {
+        gen_id = cpu_list_generation_id_get();
+        records = vcpu_dirty_stat_alloc(stat);
+        vcpu_dirty_stat_collect(stat, records, true);
+    }
 
     duration = dirty_stat_wait(calc_time_ms, init_time_ms);
 
     global_dirty_log_sync(flag, one_shot);
 
-    cpu_list_lock();
-    if (gen_id != cpu_list_generation_id_get()) {
-        g_free(records);
-        g_free(stat->rates);
-        cpu_list_unlock();
-        goto retry;
+    WITH_QEMU_LOCK_GUARD(&qemu_cpu_list_lock) {
+        if (gen_id != cpu_list_generation_id_get()) {
+            g_free(records);
+            g_free(stat->rates);
+            cpu_list_unlock();
+            goto retry;
+        }
+        vcpu_dirty_stat_collect(stat, records, false);
     }
-    vcpu_dirty_stat_collect(stat, records, false);
-    cpu_list_unlock();
 
     for (i = 0; i < stat->nvcpu; i++) {
         dirtyrate = do_calculate_dirtyrate(records[i], duration);
diff --git a/trace/control-target.c b/trace/control-target.c
index 232c97a4a1..c0c1e2310a 100644
--- a/trace/control-target.c
+++ b/trace/control-target.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/lockable.h"
 #include "cpu.h"
 #include "trace/trace-root.h"
 #include "trace/control.h"
@@ -116,11 +117,9 @@ static bool adding_first_cpu1(void)
 
 static bool adding_first_cpu(void)
 {
-    bool res;
-    cpu_list_lock();
-    res = adding_first_cpu1();
-    cpu_list_unlock();
-    return res;
+    QEMU_LOCK_GUARD(&qemu_cpu_list_lock);
+
+    return adding_first_cpu1();
 }
 
 void trace_init_vcpu(CPUState *vcpu)
-- 
2.34.1


