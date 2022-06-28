Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198A55BF71
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:29:36 +0200 (CEST)
Received: from localhost ([::1]:59032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66bH-0006a1-3q
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Jk-000247-HG
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:16 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Ji-0000Xh-UM
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:59:16 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 23so11066822pgc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S34t29VeZyFZjhq+3Izzb9WFwxolWUsOd1jqso6L3og=;
 b=uGh6j6f3BuXBXVpVaLU/i3ugslAm00P6tGr4mj2JI33hh+YZXUIcyA0wnSmfWUgbHT
 9xeLjd53PjDNJOAcevnWJpHjozNDsnJ+o/IHYwGqK4SHjr3tlr04FlsitnKdqjuWAFOw
 lI/SfFEp861V3t4nJHSuZyKSwrH0pAExwFZV/mins8brBcxH9ngkvgnKTuRgHKzCtVa6
 vjh0obrrlyUKwfATUodl9J/3ZcdzI72k6thgOOwpVrF0VTpvtfz8r5Sw4LVL/Nb7wHOo
 zcpYtx4tM/m8kVsJTpT8CTGTDwz2Ljc7WOMEP4VBuhP1fVDRMob1brDNZKU6a5WktRE7
 ZYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S34t29VeZyFZjhq+3Izzb9WFwxolWUsOd1jqso6L3og=;
 b=IFmuFK/s7eaqOYU+Wl0mFy8T9W1ulPuNFQXXMMGDZ0S9MrqBUTWZZOZo1xZErr4/10
 NAR8TXJnmGi1q2kVEuaxbYgh1AgKRKvQAmZmw+EExRq/0oBQiVWijRR7pzjt+ioaZi4g
 06AyVqRojw3LsVk74z9OkfDiRsy6/uY464cM24L8Acn0mG/yTO0XW69bUl49eHxmnaUv
 nV84rMuFTHcN1Xisd3cNbW9x0wCefm25y8haYvfervwJbOdzdBupwvUh6XqqYFdYuPIQ
 KKGhWSJ1NoKUjPan4kmRqM6hUCaldjd/nK7sSg6dqXivgA884NY+hUHeVptl/JRHC/Ox
 MWeg==
X-Gm-Message-State: AJIora8DHFilUvJNXOphPx+zf7cUhRaltF+kDyhsHZK/4ibqjtlqxwPR
 YgeKmEAZ0bhO0F5CkQOt7W1ZIG1tFncTtw==
X-Google-Smtp-Source: AGRyM1vqwOkpcqouOR1PZj1TnMeuTjK3WT9XYwMCiVNJKEvnrPphxNpUopxEBOiWXi2AFYtjwnnmlA==
X-Received: by 2002:a63:7a5e:0:b0:40c:f760:2f18 with SMTP id
 j30-20020a637a5e000000b0040cf7602f18mr16094000pgn.456.1656392353530; 
 Mon, 27 Jun 2022 21:59:13 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y7-20020aa78f27000000b00522c0a75c39sm8259686pfr.196.2022.06.27.21.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:59:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <lmichel@kalray.eu>
Subject: [PULL 50/60] semihosting: Remove qemu_semihosting_console_outc
Date: Tue, 28 Jun 2022 10:23:53 +0530
Message-Id: <20220628045403.508716-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function has been replaced by *_write.

Reviewed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/console.h | 13 -------------
 linux-user/semihost.c         | 16 ----------------
 semihosting/console.c         | 18 ------------------
 3 files changed, 47 deletions(-)

diff --git a/include/semihosting/console.h b/include/semihosting/console.h
index 6994f23c82..d6c1cc58ab 100644
--- a/include/semihosting/console.h
+++ b/include/semihosting/console.h
@@ -24,19 +24,6 @@
  */
 int qemu_semihosting_console_outs(CPUArchState *env, target_ulong s);
 
-/**
- * qemu_semihosting_console_outc:
- * @env: CPUArchState
- * @s: host address of null terminated guest string
- *
- * Send single character from guest memory to the debug console. This
- * may be the remote gdb session if a softmmu guest is currently being
- * debugged.
- *
- * Returns: nothing
- */
-void qemu_semihosting_console_outc(CPUArchState *env, target_ulong c);
-
 /**
  * qemu_semihosting_console_read:
  * @cs: CPUState
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index 871edf993a..f8bc8889f3 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -33,22 +33,6 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
     return len;
 }
 
-void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
-{
-    char c;
-
-    if (get_user_u8(c, addr)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: passed inaccessible address " TARGET_FMT_lx,
-                      __func__, addr);
-    } else {
-        if (write(STDERR_FILENO, &c, 1) != 1) {
-            qemu_log_mask(LOG_UNIMP, "%s: unexpected write to stdout failure",
-                          __func__);
-        }
-    }
-}
-
 /*
  * For linux-user we can safely block. However as we want to return as
  * soon as a character is read we need to tweak the termio to disable
diff --git a/semihosting/console.c b/semihosting/console.c
index 955880514e..fe7ee85137 100644
--- a/semihosting/console.c
+++ b/semihosting/console.c
@@ -96,24 +96,6 @@ int qemu_semihosting_console_outs(CPUArchState *env, target_ulong addr)
     return out;
 }
 
-void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
-{
-    CPUState *cpu = env_cpu(env);
-    uint8_t c;
-
-    if (cpu_memory_rw_debug(cpu, addr, &c, 1, 0) == 0) {
-        if (use_gdb_syscalls()) {
-            gdb_do_syscall(semihosting_cb, "write,2,%x,%x", addr, 1);
-        } else {
-            qemu_semihosting_log_out((const char *) &c, 1);
-        }
-    } else {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: passed inaccessible address " TARGET_FMT_lx,
-                      __func__, addr);
-    }
-}
-
 #define FIFO_SIZE   1024
 
 static int console_can_read(void *opaque)
-- 
2.34.1


