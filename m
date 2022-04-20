Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75708508F4F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:22:28 +0200 (CEST)
Received: from localhost ([::1]:40744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEyB-0005b8-JE
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiq-0005S2-SK
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:36 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEip-0001Cq-Av
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:36 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 md20-20020a17090b23d400b001cb70ef790dso5617876pjb.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YBEnYIn1GV5idkFObB274C97yF/rcyYAk+xYD7a+lYQ=;
 b=q5PprUS2S1xxjv8u1Nt0QMCtBnGwfuq3HSP62uIZnxwFLcZW8kLCgxdWCWqJjiEh0t
 WvA1BwRAnzLeQ/vNg4q8JDF0pAWTgt2G1OCge1DQoPm3sElXQvm3m0+X5AR0DEnysOSe
 1EVOIrPIG2cQZOOZpGHXYWsZuU4VfEBHpoRZSP+aYl0HSxGZbX14pgma1qtTv3x0UEEv
 Ao19qXofWYvCSPta4+P6Im1Qjhhwnazz7HJFHm/POk9TGGv3EfHs06HlXGHxyRcxtemO
 sRhdfI+7b6LXM7RdVH0k5jhrYewpO7kLOeNNx/aJwceLzUEavthNvuz/6rAYfGmqFhwD
 tWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YBEnYIn1GV5idkFObB274C97yF/rcyYAk+xYD7a+lYQ=;
 b=a0Mf84MpXtMEM7ymz45grw9RvmmgOjXK6zFPdttXr+j/3Sm1acM0B07wqAH7FAQwdP
 x3SQgwxcIS/o2dMjnChWCAgq2kLkgMEwmWts4LTuS6MriG/iBphMY9m3T6r2ushH4qru
 tfZKFGQxbwGnovb+IswHIG2KiKMRj6SK/SjqWHPgaX2F6sXpEIaieMuls+vKwcrGYxHd
 2icaJukTsRyFzjgBp6tuCsfIYAgEQIp7m2d/9zOSywipq5NcuzBzaLPvR0uQiPMvXNSd
 NNevULJAJdgaLya41XZYxcB5y3hpcypxIDfMi2yHiyDWQWEa4HpAUgJWrGLXwMZ6rY7U
 s71Q==
X-Gm-Message-State: AOAM530FmW5ncmlGLqGPqFgL/36WHxycq/dtQVedVddm6AehE0oF0rFZ
 kN8UEXTwrh2OKYGWsgYp9AwA+hTqF1zxKg==
X-Google-Smtp-Source: ABdhPJxsa3UTqENrVl+MFMVPGRGxwTYxWCNSdA8u67JzXzhf9lO1n/1lrj/HsMOIdHMc3FfF4dbZ4w==
X-Received: by 2002:a17:902:cacb:b0:158:694f:240e with SMTP id
 y11-20020a170902cacb00b00158694f240emr22177797pld.153.1650477993847; 
 Wed, 20 Apr 2022 11:06:33 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/39] exec/log: Remove log_disas and log_target_disas
Date: Wed, 20 Apr 2022 11:05:52 -0700
Message-Id: <20220420180618.1183855-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These functions are no longer used.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-14-richard.henderson@linaro.org>
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
2.34.1


