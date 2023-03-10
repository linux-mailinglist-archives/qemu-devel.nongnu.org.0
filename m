Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99726B3C52
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:33:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa2D-0007fC-Ei; Fri, 10 Mar 2023 05:31:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa29-0007aQ-F5
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:33 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa25-0004HP-95
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:33 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso5649460wmq.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BZ6HFIIZGYyqYaj8Vony/3+KKuP79LxepubYtEH6JNY=;
 b=kbeGCVUP7qNEetV5PYIqxJXznSX7ynlMAv7ikxsgxTmiP/tZl7/FjsFMKePy/uVQOt
 ut4h2DfB9VxArsPBObBxjnRL7LhySNAGFn8NZBLPnZ+YefiQqF8bL/zSsNxj432QKo4+
 rmjT8ZG1Oiv3gLkmXvtdcQNFOVGQP7UGNtzaZ+gYfNxMSZ0pTgIGEUls3aUJy/XYo1oL
 o6s0nrCc4gkdNsMSu5z7ylJlm+2npVBHcyZjtxi/UmXCAa0Urscd8tzszDvrpT4zMt17
 TFSu6sUEkqDSCmp9cGPewCyd3zU08hmCwgKI+26TOpYRqLJbzmGmMkcHeC4gULC89Dfu
 FN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BZ6HFIIZGYyqYaj8Vony/3+KKuP79LxepubYtEH6JNY=;
 b=uEEwipw6UX63SZfHX5822mAPqxqS4/DvERjKC5sEAsd5VlyIziHT3hUkTqlz6Z3khp
 FHCEvwVaBkWozQUj89YkN2qg03DRlkmDq+iaXV0/4OR38zIWFYllRFhkdu8NMCRuwqQy
 B9FUeY4ZHeJM+tllT580GR5OnJsvlc3QTe7328nP0KPOX6oqi1s0vBo7lD8nFl3SFdqz
 b/ksQlrZ6euk6psX9bpY0BDVmD9Qwnipf1IEw3zvjAPHdP2AyR8wxdJcPLe4qcMMsdDk
 RXfqmproFaCbe5R0hp7qpD05GRqa8X62BzUuUDtuOGlmpjSEUJe/V8uFwnFVLK/pQcuN
 ao7g==
X-Gm-Message-State: AO0yUKW8wcMUFpjsuJMBnt7Yg/5oe/yJ1upQUgY6Eidh+++ifIRdycyT
 cKtxq+aQuLeR6T6sKt0zS/KmNz0VT0R+4E+Syps=
X-Google-Smtp-Source: AK7set9X0CRFxnvj0w9eGVq9YG8FszgT5Wn86JqwaFoHCer7q1na5PIDKuZTsg4f2043JaS7YyTroA==
X-Received: by 2002:a05:600c:190e:b0:3df:e4b4:de69 with SMTP id
 j14-20020a05600c190e00b003dfe4b4de69mr2190618wmq.27.1678444287666; 
 Fri, 10 Mar 2023 02:31:27 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 ja4-20020a05600c556400b003ebff290a40sm1701125wmb.21.2023.03.10.02.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:25 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3CAE61FFBF;
 Fri, 10 Mar 2023 10:31:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 07/11] tcg: Clear plugin_mem_cbs on TB exit
Date: Fri, 10 Mar 2023 10:31:19 +0000
Message-Id: <20230310103123.2118519-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Do this in cpu_tb_exec (normal exit) and cpu_loop_exit (exception),
adjacent to where we reset can_do_io.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1381
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230301024737.1210851-2-richard.henderson@linaro.org>
[AJB: use plugin_gen_disable_mem_helpers()]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec-common.c | 3 +++
 accel/tcg/cpu-exec.c        | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index c7bc8c6efa..e5847e9731 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -21,6 +21,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "exec/plugin-gen.h"
 
 bool tcg_allowed;
 
@@ -65,6 +66,8 @@ void cpu_loop_exit(CPUState *cpu)
 {
     /* Undo the setting in cpu_tb_exec.  */
     cpu->can_do_io = 1;
+    /* Undo any setting in generated code. */
+    plugin_gen_disable_mem_helpers();
     siglongjmp(cpu->jmp_env, 1);
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 56aaf58b9d..e8a48dbd93 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -39,6 +39,7 @@
 #include "exec/replay-core.h"
 #include "sysemu/tcg.h"
 #include "exec/helper-proto.h"
+#include "exec/plugin-gen.h"
 #include "tb-jmp-cache.h"
 #include "tb-hash.h"
 #include "tb-context.h"
@@ -459,6 +460,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
     cpu->can_do_io = 1;
+    plugin_gen_disable_mem_helpers();
     /*
      * TODO: Delay swapping back to the read-write region of the TB
      * until we actually need to modify the TB.  The read-only copy,
@@ -526,7 +528,6 @@ static void cpu_exec_exit(CPUState *cpu)
     if (cc->tcg_ops->cpu_exec_exit) {
         cc->tcg_ops->cpu_exec_exit(cpu);
     }
-    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
 }
 
 void cpu_exec_step_atomic(CPUState *cpu)
@@ -1004,7 +1005,6 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
 
             cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
 
-            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
             /* Try to align the host and virtual clocks
                if the guest is in advance */
             align_clocks(sc, cpu);
-- 
2.39.2


