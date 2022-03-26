Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B72E4E815A
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:11:04 +0100 (CET)
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY78B-0004VQ-76
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:11:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R4-0007bE-Gj
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:30 -0400
Received: from [2001:4860:4864:20::2b] (port=46989
 helo=mail-oa1-x2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R2-0005XD-9k
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:30 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d39f741ba0so10714425fac.13
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8o87i5bNiHOl6x8JfiL+JMb4mpGfXlTZfUHEJQ6T1J8=;
 b=GMUfV9LIn5X04ckDRGKfffTTG6MFcPgZyf+hGkNjiO0WxgRNxFKRW4DZk5nlB6kPT+
 IIuuoX6G4qK3IWr3fjdC5sq7juDqtqMeA/IXQmGx3A2mK1cC/PenWADP9PHkkp7zGPYu
 8YvADF64DuSAIvJ7GErcXH08uzPtvsM31k17EPwhhB5WSX6Yl0ydFkG3cFb5twsTBW54
 h9dQWERhrzfb4AYlSkjxjb+eq3N4oHf5VrqbL3BYX3eqlAyqvh9GQ+AgUje1I5rKNidk
 ENhTgLtdMdPsBScubniO35xW8hBJ/T+1O34tZHfvh113x/d1F8kya2A3dBOJrpG6fcxi
 Kpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8o87i5bNiHOl6x8JfiL+JMb4mpGfXlTZfUHEJQ6T1J8=;
 b=2FHoNAZgW+tRk93Z5opZfRGiGlYkI8ApGY6QRjDkUsFYlODsBEBH/1s3kTmriLyzTP
 rVFA0d9wR0Y15CMC94NSra4Yr0cRWD5L0MZE9CmGYvQxKNpqPj8wE29dN9tV0yDs+2ZO
 TI0wCxsCCnVgcMfC2HchRR9fzN1FHTlPK/S7yPUAnJoAwcwzkxIlh9x8ruWEqXBkdWhB
 oI80ux0V6a0//Kd19vMW79gn+tbKyBZ8lKiKSdEb4hWojowF6O4RO3U4M3Y3bjLedrlc
 XlO9uPRhkUu+hb+e7wB9/xbkBLjs6SRS5O0iBL5hLRXb2gDa9EnL7JxiabQsbo8/ZW1w
 7GEg==
X-Gm-Message-State: AOAM5301DrSFcVNz4DTpDk9kU2HgIp+lUJ7l+saD3/yLC9i23IO9v4ML
 5TipLQ+p+g8VaYT7znwQzb4wVs+w4dhWYk6h
X-Google-Smtp-Source: ABdhPJwP3U7hpUS0FrZVGrEDxZrXX02R8/CWo8lx/6HaKBejYAAcZX/n92L/go7mw/z3MDUhePCV9Q==
X-Received: by 2002:a05:6870:582:b0:d7:5fed:b7b1 with SMTP id
 m2-20020a056870058200b000d75fedb7b1mr7326769oap.78.1648301187346; 
 Sat, 26 Mar 2022 06:26:27 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/39] include/exec/log: Do not reference QemuLogFile
 directly
Date: Sat, 26 Mar 2022 07:25:19 -0600
Message-Id: <20220326132534.543738-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2b
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Use qemu_log_trylock/unlock instead of the raw rcu_read.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/log.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index ad0a40cfeb..4a7375a45f 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -15,15 +15,10 @@
  */
 static inline void log_cpu_state(CPUState *cpu, int flags)
 {
-    QemuLogFile *logfile;
-
-    if (qemu_log_enabled()) {
-        rcu_read_lock();
-        logfile = qatomic_rcu_read(&qemu_logfile);
-        if (logfile) {
-            cpu_dump_state(cpu, logfile->fd, flags);
-        }
-        rcu_read_unlock();
+    FILE *f = qemu_log_trylock();
+    if (f) {
+        cpu_dump_state(cpu, f, flags);
+        qemu_log_unlock(f);
     }
 }
 
-- 
2.25.1


