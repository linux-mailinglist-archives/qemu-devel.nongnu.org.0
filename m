Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13D504920
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:00:53 +0200 (CEST)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA8h-0001TT-Vi
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fP-0000Qx-Fy
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:37 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fN-0001l4-GL
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:34 -0400
Received: by mail-pg1-x536.google.com with SMTP id t4so15089629pgc.1
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wO5Wh5HP0i+tOOgGVozoS4MuFqoPcN+y0r0Oy8V8BSg=;
 b=z4wchRE2+sWcDoIN6C6OentLofVvomkZcz6gmF+qdTBD/kBtpcQ0+ScnsKtpIStnzN
 Xys09fqszFO83pIIB0J2hX384/fvytdbEfMpgo0bZbmT7vl8Vdsp2sei4rx/KW3OgAAy
 IlUAFnKwgRUmr3L1IBMhaF2kOwSgZ6U85MPQ0PePS8taYpZs61vqJnetCoEdcfgl8Jll
 el+FMtLAR7CcQ9E33XF8zvvcZfkLl27vweBKEYoR9aaJwf4EEUUDHwWirkWXvWOVQYYI
 KOpCuT4ia5Ie/iWeAZzGQVAVhPXoOjhgR9GFrCbUG3CXY8bWChlzGUEn9/IjRvxhzrbL
 JRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wO5Wh5HP0i+tOOgGVozoS4MuFqoPcN+y0r0Oy8V8BSg=;
 b=gLV6Bvn9nLLbNngcSso6lIGOMWlB9Auuanw78UWYi/W0ArvpUz6tWSQ/Zef77OXSxM
 ozQLWzIzMwY+QjBP2BmD8YficKcbEtuBTkrLRz5L5fSWZSq4A2AIWQqxiCr9JFunPW/L
 ECNbQACNE6QswoS/Q/g4TQo/fCdNlffV5oRXCnWApRM4ejaB6kBlCeOwT7UGNi2Q+Axz
 ei1hT26rC4SArGXipA26IxQz9oiemNCEVtaB9GZl8XAaS8hKpAuMKDfOdRJHlYLb9w3f
 TMmYbUAIn0hjYl1JCjblb7CcLG7KPVDs24Bafc3lxWdqFkRaFc0gilz2Z/qh1tpyzUWO
 NNnA==
X-Gm-Message-State: AOAM530FnT1r0PjMzpiIwQEce8Igcfdz28lyVKqMQWURRHHYV5H83Zkl
 5sFjmXKvtOMRgSTu+EF5JryhS3RecfK0TA==
X-Google-Smtp-Source: ABdhPJwNtlLndh/RzuU4y8SVb86yCiy7YqxwLfN7T3yRzxEsIcdAQJM/lE1wCEgfwLxoUob0SlbAaw==
X-Received: by 2002:a63:5fc9:0:b0:3a2:e4b3:a222 with SMTP id
 t192-20020a635fc9000000b003a2e4b3a222mr7047489pgb.24.1650220231474; 
 Sun, 17 Apr 2022 11:30:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/39] exec/log: Remove log_disas and log_target_disas
Date: Sun, 17 Apr 2022 11:29:53 -0700
Message-Id: <20220417183019.755276-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These functions are no longer used.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/log.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index 648f4d2263..06ab9841ee 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -43,30 +43,6 @@ static inline void log_cpu_state_mask(int mask, CPUState *cpu, int flags)
 }
 
 #ifdef NEED_CPU_H
-/* disas() and target_disas() to qemu_logfile: */
-static inline void log_target_disas(CPUState *cpu, target_ulong start,
-                                    target_ulong len)
-{
-    QemuLogFile *logfile;
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
-        target_disas(logfile->fd, cpu, start, len);
-    }
-    rcu_read_unlock();
-}
-
-static inline void log_disas(const void *code, unsigned long size)
-{
-    QemuLogFile *logfile;
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
-        disas(logfile->fd, code, size);
-    }
-    rcu_read_unlock();
-}
-
 #if defined(CONFIG_USER_ONLY)
 /* page_dump() output to the log file: */
 static inline void log_page_dump(const char *operation)
-- 
2.25.1


