Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3453560AF13
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:30:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxTH-0003cb-3W; Mon, 24 Oct 2022 09:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxT1-0003S8-Qz
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:13 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxSy-0004AB-Gf
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:26:10 -0400
Received: by mail-pg1-x532.google.com with SMTP id q1so8658561pgl.11
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rhfzvh3ALCSlz+RCzVx7zEuLhN6oXhUWc6NZ2cWIDjQ=;
 b=FGvGCQ4G2pK3PSHC+2XMSiXQ8XHaWbM/wUjf/g1zG55FhU7cGx3xpH/zkVWZWJ8j4U
 MKgKJaCzv6Hy54JzSQvZD2C03Pmim2AGXIKi7v/jPEAd+uYrXcvEi+C1fpSfqg8F9BIF
 D1faWHghyUt71lLIvQPEHCgEZmz+ZZTogO0Ezjkh3UkCkODx43CsUzkBmaa0mJ4eFicZ
 z2bCwB6cQnIqtSmH/muEnDFLUlXrdDtoCvQcaoL+vC2TLIQh5bw7rnW48bVsgyY+yt+G
 c1X8IS79bZSGSouPllmJ+Hu1jIOWKgyaKluSoLlU3EgMj2+sPEfsn3bx4kff9JvHh5cI
 WogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhfzvh3ALCSlz+RCzVx7zEuLhN6oXhUWc6NZ2cWIDjQ=;
 b=jdYk6PVwLW9nr0APjlbRO/uzP+ZchRts8RFS7iQM/2KGvbjdptjgnOXnrWFPxEHvxR
 XxcfQzLvm3ByO5sD6+vz+zN4LJglebf2Js01b33/8niXwSs7GUCwqzcG6t1tSMitT1pv
 8urHe0+a9PMG/VI5/DOFKDeF84fedgOMlsgZiXgnranLr26JgTQu/IkeinlHn2cIcpBG
 SqIBukuIDPV9psD6fmR+iqi1Si5I8a+laLPYNNMArmwBenzfjhyoxUsf+6M+xpnbIce2
 B1VXWoMKA7J3U/qzXI0D3z/ZyHWe5TeeMCHZrvWXODlSxM82RwrW1E+PYUZTinQgvPee
 h4iQ==
X-Gm-Message-State: ACrzQf2gjo+EM3cYhUCvyyK/Fm9urQaq2aKFoyfU26+mIecIVKl0+kvi
 BSmUIkZ6CwvWwrwx4vjU4xOuRhqGV+8Gcg==
X-Google-Smtp-Source: AMsMyM7c1UZ5tK0wWk+KIGj6HBIsihGFq9ZOf8LfjCiZB0vbmn+a5uLC1ENCBTksJXuy9dqXYIKmlQ==
X-Received: by 2002:a05:6a00:88f:b0:52c:6962:274f with SMTP id
 q15-20020a056a00088f00b0052c6962274fmr34568565pfj.12.1666617967247; 
 Mon, 24 Oct 2022 06:26:07 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.26.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:26:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/29] accel/tcg: Remove restore_state_to_opc function
Date: Mon, 24 Oct 2022 23:24:53 +1000
Message-Id: <20221024132459.3229709-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024132459.3229709-1-richard.henderson@linaro.org>
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

All targets have been updated.  Use the tcg_ops target hook
exclusively, which allows the compat code to be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   |  3 ---
 accel/tcg/translate-all.c | 16 ++--------------
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index a772e8cbdc..300832bd0b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -39,9 +39,6 @@ typedef ram_addr_t tb_page_addr_t;
 #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
 #endif
 
-void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
-                          target_ulong *data) __attribute__((weak));
-
 /**
  * cpu_restore_state:
  * @cpu: the vCPU state is to be restore to
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 19cd23e9a0..e4386b3198 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -327,7 +327,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                      uintptr_t searched_pc, bool reset_icount)
 {
-    target_ulong data[TARGET_INSN_START_WORDS];
+    uint64_t data[TARGET_INSN_START_WORDS];
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
     int i, j, num_insns = tb->icount;
@@ -368,19 +368,7 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
         cpu_neg(cpu)->icount_decr.u16.low += num_insns - i;
     }
 
-    {
-        const struct TCGCPUOps *ops = cpu->cc->tcg_ops;
-        __typeof(ops->restore_state_to_opc) restore = ops->restore_state_to_opc;
-        if (restore) {
-            uint64_t d64[TARGET_INSN_START_WORDS];
-            for (i = 0; i < TARGET_INSN_START_WORDS; ++i) {
-                d64[i] = data[i];
-            }
-            restore(cpu, tb, d64);
-        } else {
-            restore_state_to_opc(cpu->env_ptr, tb, data);
-        }
-    }
+    cpu->cc->tcg_ops->restore_state_to_opc(cpu, tb, data);
 
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->restore_time,
-- 
2.34.1


