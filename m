Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EBF6A65E9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCen-0000jr-44; Tue, 28 Feb 2023 21:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCed-0008VW-0F
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:19 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeZ-00038m-VY
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:18 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so11263918pjg.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QSj4VJsjFHaRvQs4eWwMwZJtQE/UiuIsIRLvGg9jXBw=;
 b=sgLNgVyFesr+/dj8Suw1oH59GtsURNGvcOkDk5pCAtGvtfPCzB+5c4+q+QONuv+4ip
 iar4Ha8ZJudKR0bZkQt4cPTEt9f3US8sc5TrUR5se2V5hlT5y93mpBHAC8BsBkW5nPeu
 QhL5Vk2KmMQXUnkAPAcXr0DArLNjih9UxSNvZYeq98Vm2CFSqM7Rum5kbuaJFt7dfVI7
 wjEy6AL3/PwKgFcYpbq/x2zApsM9Np+T6n5a9Dt38XazB+pQyF3kmnKqNLdz/BGa4Jx2
 ErBuxBZMQup2TV+1CwSe3HslpuB89+eRLah0pk+1/ASJjfz6PK2e+dJWRT+k3rJqw61z
 4Q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QSj4VJsjFHaRvQs4eWwMwZJtQE/UiuIsIRLvGg9jXBw=;
 b=uR7zQKid8lyq1u/Xdqe1k/zNpp1HN2mnLlmdw54Y0SI35yIFGgFVxisV10XCYTbzuO
 8G/7J1NfWtOsSVvJCCZz19sbAoX+BmDEEC6F8HCH5Q7AKufdL3yEWLUjSU83IlX497eC
 9nNJbZfc8xuQugSt+huQeC2bcdqBaQePsuNmFKrysgRmak1fWSJZhIf4NIMHOqTFz89Q
 9At6KEA1IfuVdnQt5mTlznGt4Re8xZ4aSuNcZlExkrzJDB5AZp72p4XxtioVb0ZgtcSh
 w3Zlc5M+g+adjt8nHG4KtOApCKbAbV49JVq7pPxRMU0FLXlOkM61GP7j6K+n5an73kn4
 Mzmw==
X-Gm-Message-State: AO0yUKV2jNJ12yjuKRxvlLQOfbv+p+Z8YWrpzbbLdPyZiddiV8PuvsyN
 E/LiLvvlRh3MrTJiVvWqBpxdSw9QHV9h/omnfP0=
X-Google-Smtp-Source: AK7set8MydbJm7nNvLjYutuhCNPa7o/QgJcqALe6MvHu4irZ5WW5wkcYb5O5bBYrhP9+IAmHM/DMjA==
X-Received: by 2002:a17:902:d4c3:b0:19c:f84b:58be with SMTP id
 o3-20020a170902d4c300b0019cf84b58bemr6582532plg.3.1677639431985; 
 Tue, 28 Feb 2023 18:57:11 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 15/62] accel/tcg: Move jmp-cache `CF_PCREL` checks to caller
Date: Tue, 28 Feb 2023 16:55:56 -1000
Message-Id: <20230301025643.1227244-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson via <qemu-devel@nongnu.org>

tb-jmp-cache.h contains a few small functions that only exist to hide a
CF_PCREL check, however the caller often already performs such a check.

This patch moves CF_PCREL checks from the callee to the caller, and also
removes these functions which now only hide an access of the jmp-cache.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-12-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-jmp-cache.h | 36 ---------------------------
 accel/tcg/cpu-exec.c     | 54 +++++++++++++++++++++++++++++-----------
 2 files changed, 40 insertions(+), 50 deletions(-)

diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
index 083939b302..bee87eb840 100644
--- a/accel/tcg/tb-jmp-cache.h
+++ b/accel/tcg/tb-jmp-cache.h
@@ -25,40 +25,4 @@ struct CPUJumpCache {
     } array[TB_JMP_CACHE_SIZE];
 };
 
-static inline TranslationBlock *
-tb_jmp_cache_get_tb(CPUJumpCache *jc, uint32_t cflags, uint32_t hash)
-{
-    if (cflags & CF_PCREL) {
-        /* Use acquire to ensure current load of pc from jc. */
-        return qatomic_load_acquire(&jc->array[hash].tb);
-    } else {
-        /* Use rcu_read to ensure current load of pc from *tb. */
-        return qatomic_rcu_read(&jc->array[hash].tb);
-    }
-}
-
-static inline target_ulong
-tb_jmp_cache_get_pc(CPUJumpCache *jc, uint32_t hash, TranslationBlock *tb)
-{
-    if (tb_cflags(tb) & CF_PCREL) {
-        return jc->array[hash].pc;
-    } else {
-        return tb_pc(tb);
-    }
-}
-
-static inline void
-tb_jmp_cache_set(CPUJumpCache *jc, uint32_t hash,
-                 TranslationBlock *tb, target_ulong pc)
-{
-    if (tb_cflags(tb) & CF_PCREL) {
-        jc->array[hash].pc = pc;
-        /* Use store_release on tb to ensure pc is written first. */
-        qatomic_store_release(&jc->array[hash].tb, tb);
-    } else{
-        /* Use the pc value already stored in tb->pc. */
-        qatomic_set(&jc->array[hash].tb, tb);
-    }
-}
-
 #endif /* ACCEL_TCG_TB_JMP_CACHE_H */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 013856f103..aa14e97958 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -254,21 +254,46 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
 
     hash = tb_jmp_cache_hash_func(pc);
     jc = cpu->tb_jmp_cache;
-    tb = tb_jmp_cache_get_tb(jc, cflags, hash);
 
-    if (likely(tb &&
-               tb_jmp_cache_get_pc(jc, hash, tb) == pc &&
-               tb->cs_base == cs_base &&
-               tb->flags == flags &&
-               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
-               tb_cflags(tb) == cflags)) {
-        return tb;
+    if (cflags & CF_PCREL) {
+        /* Use acquire to ensure current load of pc from jc. */
+        tb =  qatomic_load_acquire(&jc->array[hash].tb);
+
+        if (likely(tb &&
+                   jc->array[hash].pc == pc &&
+                   tb->cs_base == cs_base &&
+                   tb->flags == flags &&
+                   tb->trace_vcpu_dstate == *cpu->trace_dstate &&
+                   tb_cflags(tb) == cflags)) {
+            return tb;
+        }
+        tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
+        if (tb == NULL) {
+            return NULL;
+        }
+        jc->array[hash].pc = pc;
+        /* Use store_release on tb to ensure pc is written first. */
+        qatomic_store_release(&jc->array[hash].tb, tb);
+    } else {
+        /* Use rcu_read to ensure current load of pc from *tb. */
+        tb = qatomic_rcu_read(&jc->array[hash].tb);
+
+        if (likely(tb &&
+                   tb_pc(tb) == pc &&
+                   tb->cs_base == cs_base &&
+                   tb->flags == flags &&
+                   tb->trace_vcpu_dstate == *cpu->trace_dstate &&
+                   tb_cflags(tb) == cflags)) {
+            return tb;
+        }
+        tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
+        if (tb == NULL) {
+            return NULL;
+        }
+        /* Use the pc value already stored in tb->pc. */
+        qatomic_set(&jc->array[hash].tb, tb);
     }
-    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
-    if (tb == NULL) {
-        return NULL;
-    }
-    tb_jmp_cache_set(jc, hash, tb, pc);
+
     return tb;
 }
 
@@ -957,7 +982,8 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
                  * for the fast lookup
                  */
                 h = tb_jmp_cache_hash_func(pc);
-                tb_jmp_cache_set(cpu->tb_jmp_cache, h, tb, pc);
+                /* Use the pc value already stored in tb->pc. */
+                qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
             }
 
 #ifndef CONFIG_USER_ONLY
-- 
2.34.1


