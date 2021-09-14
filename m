Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE57B40A1CE
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:18:31 +0200 (CEST)
Received: from localhost ([::1]:51210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPw9e-0004gV-Pf
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6S-0001kB-P3
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:12 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6Q-0007ge-2g
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id x7so10429264pfa.8
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+Cu38KkW/P4DawV4m76NJ3ExR7AdjcVZeZmlLwca4o=;
 b=TkvD64bBG29Q8yZvSvi27/n6MGi4HH7hUOjVn2851GxGS759NnUqF64Vjz1lw9xj6V
 QKfv1of7jVVCNdENcyWEGm+rIiZsErZUwlNV1C6PVoxWP/uE1wlz0rgg9u3H6IeftXmC
 s8UsFlGkPiJhhVrJ8XZ0Fy2QUIu1SX7CZA+5Q930FNz1IvEjRrmecqjvQqgj01Z1q7GH
 VxcWDx3/t/yZDhK45qJ81rn1/S6AP/IV5x6OKc9Ym6XEGhEcPL5ydZWVRAFBdOQw9FOI
 WiOwR7z3FDPvxiDMsi4sNw+l4g603DdWmxXBgGKwHAZh7MVTZMqJhssNptJROzvX5YRV
 s3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7+Cu38KkW/P4DawV4m76NJ3ExR7AdjcVZeZmlLwca4o=;
 b=1HGhB6hSXB0jSJ+PbGwqXFfCRKuOPu/tQWGEr2+vZbi/dH2XyH8l9yI9lvOvosGOhc
 sdETUvjPf/jYjpxndjsil+Y186JBg5c29g2dkmZhofISBKhMZkpU6AR6d3d9h1XAG+Bl
 Z23KQsV6WxD5A1m5BBLMUG+RUEd0CENYeAcxbR9W2naPIdTAxVUtnCCuzXGvFdladyLP
 xcDpOsMo4G1sH/E3tGPnyV/oqjFxzn/EDgeh3Chp7ulNr7xM0WM8yWn/B4kNN1hgopNm
 v71o2Pvp9ql0ZNKWYz/wfaOgpep9lyEVvaW2YO7FIFCeSYatSDWFtzHNck+eCVERglJF
 6ILg==
X-Gm-Message-State: AOAM530Q2ZUukFB8wKJhYXtIQfyAtDYX3XHLNyGp/ejOrbBl2nm+Z8g4
 Pt3ro3ZNPZW8oUPZ2s+uTUWxwFfNlEBf7g==
X-Google-Smtp-Source: ABdhPJyp/w2E0oUMNZRBiYK9hSKKVRbnb+hP/1Ns4JVfkaifXFy8R9vwJ/603Js/YKQLPPAazNuGBQ==
X-Received: by 2002:a65:62d1:: with SMTP id m17mr13156393pgv.370.1631578508608; 
 Mon, 13 Sep 2021 17:15:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/44] target/alpha: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:26 -0700
Message-Id: <20210914001456.793490-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-7-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu.h    | 2 +-
 target/alpha/cpu.c    | 2 +-
 target/alpha/helper.c | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967..4e993bd15b 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -274,10 +274,10 @@ struct AlphaCPU {
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_alpha_cpu;
-#endif
 
 void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
 hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 4871ad0c0a..93e16a2ffb 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -218,10 +218,10 @@ static const struct SysemuCPUOps alpha_sysemu_ops = {
 
 static const struct TCGCPUOps alpha_tcg_ops = {
     .initialize = alpha_translate_init,
-    .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
     .do_unaligned_access = alpha_cpu_do_unaligned_access,
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 4f56fe4d23..81550d9e2f 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -293,7 +293,6 @@ bool alpha_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
                  prot, mmu_idx, TARGET_PAGE_SIZE);
     return true;
 }
-#endif /* USER_ONLY */
 
 void alpha_cpu_do_interrupt(CPUState *cs)
 {
@@ -348,7 +347,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     cs->exception_index = -1;
 
-#if !defined(CONFIG_USER_ONLY)
     switch (i) {
     case EXCP_RESET:
         i = 0x0000;
@@ -404,7 +402,6 @@ void alpha_cpu_do_interrupt(CPUState *cs)
 
     /* Switch to PALmode.  */
     env->flags |= ENV_FLAG_PAL_MODE;
-#endif /* !USER_ONLY */
 }
 
 bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
@@ -451,6 +448,8 @@ bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
     static const char linux_reg_names[31][4] = {
-- 
2.25.1


