Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF25698C62
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX7u-0004Dp-UI; Thu, 16 Feb 2023 00:48:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7q-00049R-UI
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:10 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7p-0005Mc-96
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:10 -0500
Received: by mail-pl1-x62b.google.com with SMTP id r8so1006375pls.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSmbYBWQTF40Rva8qm3+N5zMD+1Xf6L67/b2nj4sg7A=;
 b=ObhLEiYI1mr83aGHLYS1qnkquYAQil6CcMmleJ6NuodZI12HQ+XtNI5UgsUVbZPZZK
 uWeoq1BM5dNZzRXI1gkN7t4UMSEOl2CQu7m56oqOe+iClHI/Od14Zhopo8V0RZ2pnx0O
 dgBuQ3jThqU/6hTTQ1PhrCTt2wY4OeW/TMGNskUe/DpYsqQdIfnvewRZ2tu+Bc2mfNLQ
 HT6fr14WF7+A+Sv73d9voU/qeYDdtclqr/AhEQxINxDZChTNx78tGT69V24sw0qCt9ha
 k7zWYHJTC9hxQ6soHkUxr8JZKFRAWrP1aOpHy3szPKkh/s8QCKMfWP74W90c3hILkIip
 FEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qSmbYBWQTF40Rva8qm3+N5zMD+1Xf6L67/b2nj4sg7A=;
 b=NXBE4hiiFaBndMMCc0DF70JW4W30+lw5BnbLlkhXyet540Tb6bRmdoFraN6KbGHdXk
 AQSr9L914Nj1zdRFsesXCCA7OXnz8GITSWgL7/E9mfYSFKYDumPl4MXR+t3VIO+WxZo1
 EWmoiDOizy6nIjZDvLngRimUmP0G36yfwdwnQMpbq8FVRYtY7FE8+fbsWEo8tGtjw403
 swhBfuGdumPW7B8okcuWOq57JluejberT2Zv6oVRfG+9s+8ADBd8sTUaC3l+6S6aBx33
 Kwmspkl8SQ19eLi2pfozvWM1Z+0tnc9z5mfpyr0H0vM6v1f6qBUCkRZMPKaEfu/CwoPC
 N5WQ==
X-Gm-Message-State: AO0yUKVRVNyWBtZqEKCRWUiZF97Y78uAkjuF5RfQFB4c3Z/xaPfEnElR
 5kUe9YPIrORo2pA5khE+8JB1jlDHJwqWy849KEQ=
X-Google-Smtp-Source: AK7set+4z5thDkoiz6Qb0iojI86HwvRGu5EB+YK6DUx7uLxEdlBIrmjXuGXgatAYwDVWfmr9GBlczw==
X-Received: by 2002:a05:6a20:7291:b0:b9:6932:7d71 with SMTP id
 o17-20020a056a20729100b000b969327d71mr4878058pzk.26.1676526488439; 
 Wed, 15 Feb 2023 21:48:08 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:48:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 09/15] linux-user/sparc: Handle getcc, setcc, getpsr traps
Date: Wed, 15 Feb 2023 19:45:10 -1000
Message-Id: <20230216054516.1267305-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

These are really only meaningful for sparc32, but they're
still present for backward compatibility for sparc64.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 62 +++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 3 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index e04c842867..a3edb353f6 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -149,6 +149,51 @@ static void flush_windows(CPUSPARCState *env)
 #endif
 }
 
+static void next_instruction(CPUSPARCState *env)
+{
+    env->pc = env->npc;
+    env->npc = env->npc + 4;
+}
+
+static uint32_t do_getcc(CPUSPARCState *env)
+{
+#ifdef TARGET_SPARC64
+    return cpu_get_ccr(env) & 0xf;
+#else
+    return extract32(cpu_get_psr(env), 20, 4);
+#endif
+}
+
+static void do_setcc(CPUSPARCState *env, uint32_t icc)
+{
+#ifdef TARGET_SPARC64
+    cpu_put_ccr(env, (cpu_get_ccr(env) & 0xf0) | (icc & 0xf));
+#else
+    cpu_put_psr(env, deposit32(cpu_get_psr(env), 20, 4, icc));
+#endif
+}
+
+static uint32_t do_getpsr(CPUSPARCState *env)
+{
+#ifdef TARGET_SPARC64
+    const uint64_t TSTATE_CWP = 0x1f;
+    const uint64_t TSTATE_ICC = 0xfull << 32;
+    const uint64_t TSTATE_XCC = 0xfull << 36;
+    const uint32_t PSR_S      = 0x00000080u;
+    const uint32_t PSR_V8PLUS = 0xff000000u;
+    uint64_t tstate = sparc64_tstate(env);
+
+    /* See <asm/psrcompat.h>, tstate_to_psr. */
+    return ((tstate & TSTATE_CWP)                   |
+            PSR_S                                   |
+            ((tstate & TSTATE_ICC) >> 12)           |
+            ((tstate & TSTATE_XCC) >> 20)           |
+            PSR_V8PLUS);
+#else
+    return (cpu_get_psr(env) & (PSR_ICC | PSR_CWP)) | PSR_S;
+#endif
+}
+
 /* Avoid ifdefs below for the abi32 and abi64 paths. */
 #ifdef TARGET_ABI32
 #define TARGET_TT_SYSCALL  (TT_TRAP + 0x10) /* t_linux */
@@ -218,9 +263,20 @@ void cpu_loop (CPUSPARCState *env)
 
         case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
-            /* next instruction */
-            env->pc = env->npc;
-            env->npc = env->npc + 4;
+            next_instruction(env);
+            break;
+
+        case TT_TRAP + 0x20: /* getcc */
+            env->gregs[1] = do_getcc(env);
+            next_instruction(env);
+            break;
+        case TT_TRAP + 0x21: /* setcc */
+            do_setcc(env, env->gregs[1]);
+            next_instruction(env);
+            break;
+        case TT_TRAP + 0x22: /* getpsr */
+            env->gregs[1] = do_getpsr(env);
+            next_instruction(env);
             break;
 
 #ifdef TARGET_SPARC64
-- 
2.34.1


