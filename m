Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C4E50492A
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:07:09 +0200 (CEST)
Received: from localhost ([::1]:33914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAEm-0004kW-Sy
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fR-0000RY-Be
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:38 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:35761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fP-0001mt-Dr
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:36 -0400
Received: by mail-pg1-x533.google.com with SMTP id k62so9001989pgd.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aDLKHovI8bxO2d9YjJwk21iI6jYdGi7gzankaymnjFw=;
 b=tdGbrDBGKkVU7/v7/KqAwU7hJRGT7StkzROPpIcH8qhgcf+LP+VN7x0D65N5xpJ1Ta
 1BcTqfMGrSAi//B6JrgY9uhvgaCN9hfNsDfmkUndJ4RKH0y6qENJv1C5d7SzbsmzsW4C
 WVDJhDL9yURtbrzBEiNhLCPmnlUsnI7hBs3C5PRS9h3ZqWDwp1DEBvkuOIhBqGfHxFz0
 ShR25ojy76/LU8zR2o/QdleyP/ve4UoZO79rN6u420s9lv8K/7sDdmFIu+bEsNTmVejh
 i5uZLcOu0xGvWPH44EhboGtOqRl3tp59GaYtFix5Cmef2oLszFpbbrTmM+os24TowdpK
 Et+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aDLKHovI8bxO2d9YjJwk21iI6jYdGi7gzankaymnjFw=;
 b=tBXqBxUSxnW2PxjxOBrqeNPB5mNg7blzGEUQecZFQWDMpBO/hhIih1IGMCX6HTL0va
 Rk3DUyZgceSeo9PKmrWEXPiYVxM4tuR1IvrwmB3T4cbn6jB+HZxoBwgFDOqcXxyAmZ6n
 nzieih7saEemGF2YJx0gWgaj9TIRzNZlTXJSxRIuGgJNmD+Z+tOZ24vdI0fYl+MmeKJq
 gEMHfFLFZD4r83R6hnfU1kDbx/ydzyNOkx5xOcR35jxTQEk5C4jJwGWouMyYdv71BWpA
 zpmdJBeAe6XnYnYLeLVhqeCxiXzM69SH8CpegVwbcIC23KljuREtoTXHU9mgo3wn8iNa
 Mgdg==
X-Gm-Message-State: AOAM5309r93BVh7TqRk9+b3aPBTSYs0ZRLJgyIqIfwbgwhMZN3xbtEfb
 fwy88kmCfrTnaPrikLzifC1gyE0PxGZWdw==
X-Google-Smtp-Source: ABdhPJy9aUkFOWZdKS1SvgTfzDRtGCI1VWZBCjhUPQUdA/G8X/mGjL9K1CehV8kU4/uheij77B0o9Q==
X-Received: by 2002:a63:1a0e:0:b0:3a3:d8bd:2812 with SMTP id
 a14-20020a631a0e000000b003a3d8bd2812mr7146576pga.20.1650220234146; 
 Sun, 17 Apr 2022 11:30:34 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/39] util/log: Use qemu_log_trylock/unlock in qemu_log
Date: Sun, 17 Apr 2022 11:29:56 -0700
Message-Id: <20220417183019.755276-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

Avoid using QemuLogFile and RCU directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/util/log.c b/util/log.c
index 6b7b358573..090bc3bc39 100644
--- a/util/log.c
+++ b/util/log.c
@@ -62,23 +62,22 @@ void qemu_log_unlock(FILE *fd)
 /* Return the number of characters emitted.  */
 int qemu_log(const char *fmt, ...)
 {
+    FILE *f = qemu_log_trylock();
     int ret = 0;
-    QemuLogFile *logfile;
 
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
+    if (f) {
         va_list ap;
+
         va_start(ap, fmt);
-        ret = vfprintf(logfile->fd, fmt, ap);
+        ret = vfprintf(f, fmt, ap);
         va_end(ap);
+        qemu_log_unlock(f);
 
         /* Don't pass back error results.  */
         if (ret < 0) {
             ret = 0;
         }
     }
-    rcu_read_unlock();
     return ret;
 }
 
-- 
2.25.1


