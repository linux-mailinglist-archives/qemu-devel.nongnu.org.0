Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8084E1D26
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:30:08 +0100 (CET)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzNX-0000nC-Mi
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:30:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5v-0008U2-C8
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:55 -0400
Received: from [2607:f8b0:4864:20::630] (port=33610
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5r-0003S5-At
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:53 -0400
Received: by mail-pl1-x630.google.com with SMTP id t22so10919148plo.0
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fCluu6SAceuICVILsHlila9mg06bMaWRED/sDhgyEaA=;
 b=yyfXStKLgRELxO6ob4by7e4wGGY+wkFkuV2GEEVIw5N/v6eSmUlxU84j0EOhzFyA3c
 BKWP56k7iVZgPD3aJodfB9EbXWTSGIbWvHbvce1c24xvrYwZoxU7n9nLsIlQ83eMyj4L
 HMCsfndQgAoMApxSy2x0ZwBmGpDP1Z0pH6N4BV4lxZKlbJptc8L375/KGw8vOBBUQm/7
 LW4/1ZIP+rDzwVQzkYjJE2U04CQgAUzMc2FrG0opkVNhTk899dfZR/FOFWE9Lf+c28Z2
 gY0fxCbtjPbVpdNdgN5qOxG24uVl2BPmlnIqEHkPLJDoBE0EJO3Hoy6kzrowtLZHUb9+
 QQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fCluu6SAceuICVILsHlila9mg06bMaWRED/sDhgyEaA=;
 b=5jCP31eVp1ZSc5JkUrIDi4SphF2zKraWALFjVDzgOilOue6HcrKw/JdliTzrR2WTZ+
 sxz5FKT1DL+NN5Auuqiu1ZADQw63f23zuTe+oqEvlCzu0hUBbA7ZtZ/FpEDd0GufzbLE
 jurdNdgpNYf18i9aSDQrdU5TCUx1G+SCP+J5eOAMKQTQUIEu8Us52oCdXRblx2yrpIRv
 7MSgX2lJPCcB6SkM+lP4SP+04Zl0aW2QVakxB9ykh82qYffD2+7ofZC3IlHvDvNBDDcl
 ZAJZQCSZ5eTPR12qZlkqknxY+XAF+ZzYqKvjLArju+/0/E83Y9wpcHAhKc3kh7E3OMZm
 /sDw==
X-Gm-Message-State: AOAM5301qkcqntEOzNWHeTsvnTYe5JvyDoGIe4EPFSvjJRuTo4MbwluB
 omqLWZNWlOpenR3nXCMVQE9Z01+NPsSPHQ==
X-Google-Smtp-Source: ABdhPJz8HeAhrISEI9Qbcd6saM+xnw62Cdea5R0CyC0F0KuRT/lcIrARihOnn4w8QcrCpZYR0qBuIw==
X-Received: by 2002:a17:902:ce8a:b0:154:361b:48d1 with SMTP id
 f10-20020a170902ce8a00b00154361b48d1mr6401406plg.72.1647796307722; 
 Sun, 20 Mar 2022 10:11:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 12/36] exec/log: Remove log_disas and log_target_disas
Date: Sun, 20 Mar 2022 10:11:11 -0700
Message-Id: <20220320171135.2704502-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/log.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index 6a53199d44..d131a3140d 100644
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


