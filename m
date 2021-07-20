Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE13CF146
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:24:14 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5eUY-0003Kv-0z
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOm-0006dI-Ga
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:16 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOk-0003Q0-Ss
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:16 -0400
Received: by mail-pf1-x42d.google.com with SMTP id j199so18226921pfd.7
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UqlmS05MkTOxmP5dwcL3fhQ/lw1WJjbK9e+xb00mPGM=;
 b=WUYLnFs7YwhGC8JpEA0t8lM+sAD0t3fWym8kdexgJm4KwhD1+kVMq+YkQEK9znQz2l
 /qhAoOOkiKdi7HJI/AYReryvkCbxL0yTAD6UdTwADzd8xmPq3v1Z9ocvlDJMBGHL1DDb
 dPU1mzwR7dsgg+36nPgavzUgTpRXQ42OODs3O7uzqznwnu3WoXzy0QA6Y7gDlUvMth91
 KBUivPlxdctzA5XfBv7VJkL37IhM6Sv962cMdbWp5C1ksoZIc6gS31dJNxPbsVf8IBYH
 ynmuDJ5BQWUPAjHN17iYjfqfoUijtCaCOk9nv5LX69fnhwbUqZpsRT/Vx8NyLYqFFgQI
 oIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UqlmS05MkTOxmP5dwcL3fhQ/lw1WJjbK9e+xb00mPGM=;
 b=lATFuGVws/crEZs3iauwNk4+7J5P5Y9JmmC0ZrR4g3L313yd6OCeG1rFhMAO2F3BjX
 3TaccVHkD5SMT2hySiq4GbTfINwrHbPxQahlZrKU7UFNcIUrGf2zE6Q4jtD7WYaiZoX0
 o3ZdSfItEv6mek3BuOLKI79E6r6gzzHH2X7w17LTZqmgraalqVqV5RWQ21YiG5VPAEO+
 76iH54m5zoci+CrnNj0oh7apKQ1FoxPZGiJZPRM+YwxFL4OFOyXLqMW/JmH974iu51Zb
 bmS+HsoZD7eQ1SrPAAxGwQfm/3mg6wGbf7nX2kmzUiywrsiir5V83SVzulgzuSK624ii
 EzQA==
X-Gm-Message-State: AOAM533Kh/dXAcre7sY/lm0etjHRhYSW7o4SkGA5QM+BcDknOSMd1B65
 5Jop7tcVPRGSU/U1380Tec6kqDFWz1CRDA==
X-Google-Smtp-Source: ABdhPJx129NORmENz5PmOVSLJAZY70oXGdCTFRo6outWrXprXhi1azKTtymwwC7isNeCvQzFnN6MnA==
X-Received: by 2002:aa7:87cd:0:b029:32e:7954:2872 with SMTP id
 i13-20020aa787cd0000b029032e79542872mr29176705pfo.0.1626743893671; 
 Mon, 19 Jul 2021 18:18:13 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 07/15] accel/tcg: Use CF_NO_GOTO_{TB,
 PTR} in cpu_exec_step_atomic
Date: Mon, 19 Jul 2021 15:17:52 -1000
Message-Id: <20210720011800.483966-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Request that the one TB returns immediately, so that
we release the exclusive lock as soon as possible.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210717221851.2124573-7-richard.henderson@linaro.org>
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


