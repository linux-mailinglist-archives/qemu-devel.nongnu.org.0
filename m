Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C243C5FAA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:46:24 +0200 (CEST)
Received: from localhost ([::1]:50260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2y8V-0007n9-3R
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2h-0003zj-Mh
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:24 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2V-0000vB-0c
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:19 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so2450189pjb.3
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aZodwPrqQjUt8vQ3rujRtm0PKCZdI4rcPhp5DEtvTCc=;
 b=LfdovceokOsOtRtP4Q0rw0GoW5OJXAhkoOS/0RHQj1yIuTX0RidxI0NirnLryYNtL2
 hPvVbXbQI77hBiZW9FyDMgytDwVQIo3C/E6o4QkrgOYbgQcpxp17zIVnYref4h07jJxv
 /bDXO3yox1j1UxSQ/FBuVI8VM3dwPW6xJ8DDndiulttjEAb93mmJxJsR5/lGcAIMgEqi
 uORkw1HiAXy/8lcRIk1FNzo1Uhikx8aVJ0xwBKREhoHwkkL4sxlZGwjNX0K68stWqQOq
 6QwedpLgTSpMSIIpz/RAY35nCGDt53PKJeGF5+PT6yRVU1t+i+LQ7ScZZKKeH81STMZD
 hEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aZodwPrqQjUt8vQ3rujRtm0PKCZdI4rcPhp5DEtvTCc=;
 b=U5HFzaBfDC8UylRsREBMyE/ZzSYgiZVxKWCx6sAXWsNpr6xB5Xo6y/Kaetp6+UBG/+
 6lD4WdMN+L3uP728gteRr8HwuVnAf8fyS4gxie7s914VLzrIwocQTNCryQuh7kl10b0Z
 Fu1aukTJC46axrJenM8ulMlHHUPiy1xWL+ZSC5srGkNrDdiqev1zKGJdZhuJy0fCWQ5w
 XRETaXv9IVXs6YZRlICKofKO6YQapskziWQsBiQuDoihimMJQOrtAr4HduAHa7k8fm/9
 BRsvllQkf3eOOv21NiLZi3W1HFPy21sSnL7Ipw3IMSfFs0D4PY6xkjNflWm0F2c21s7W
 kNfg==
X-Gm-Message-State: AOAM5311hQWyk0CjXxQdbT3+ZAOAizCK0SxuPhu8vYVv1TXIft/DfN6N
 OxCFAKFBSknrnu1vJHN7Dq9RrMZsHjft9g==
X-Google-Smtp-Source: ABdhPJyLKQB3nWRFqQ7hvqIvAqKtTqFRQiBw+EMe0rppJ+7Q13F5K5sp2N96wXpC0jYI36o0kcvu6g==
X-Received: by 2002:a17:90a:a60f:: with SMTP id
 c15mr52640766pjq.187.1626104408642; 
 Mon, 12 Jul 2021 08:40:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b33sm18247635pgb.92.2021.07.12.08.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:40:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/10] accel/tcg: Use CF_NO_GOTO_{TB,
 PTR} in cpu_exec_step_atomic
Date: Mon, 12 Jul 2021 08:40:00 -0700
Message-Id: <20210712154004.1410832-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Request that the one TB returns immediately, so that
we release the exclusive lock as soon as possible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 2206c463f5..5bb099174f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -330,8 +330,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
-    uint32_t flags;
-    uint32_t cflags = (curr_cflags(cpu) & ~CF_PARALLEL) | 1;
+    uint32_t flags, cflags;
     int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
@@ -341,8 +340,14 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu->running = true;
 
         cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
-        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
 
+        cflags = curr_cflags(cpu);
+        /* Execute in a serial context. */
+        cflags &= ~CF_PARALLEL;
+        /* After 1 insn, return and release the exclusive lock. */
+        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
+
+        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
         if (tb == NULL) {
             mmap_lock();
             tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
-- 
2.25.1


