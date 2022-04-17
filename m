Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72402504931
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:09:51 +0200 (CEST)
Received: from localhost ([::1]:44010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAHO-0003OO-JC
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fU-0000TI-KI
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:41 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fR-0001nA-3R
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:40 -0400
Received: by mail-pl1-x632.google.com with SMTP id c23so10837162plo.0
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B2yOmG4jVDYQ3nJ0wsT3v+x6riKueIrGNetVF8RAfhk=;
 b=A0Vv3F2NSIzu3dZe1W8ld4edFr+PLTJ+ZOTq8VwSG7dZR51K8pqM5plky2XqTBEEZ3
 C8vwHl9fXoxzpTPWWH6a4f8rPRkz6CuFJkrVK5HoQv4csX6Xw7+6OHK/hdjxxZBnn5jG
 8KhnUFlcfn9qxnzi/kU5tmLXCeal+Z5bm0J1dJ6NT0GFUQQPXBcyGwGDlKhS5d3HPIGd
 2DcKfZ1OqX+IuTYLDmlYAlHquZYtaiNLd64s6HxWEIuPx/+EnoQXYsRSk4c8Ba4rJ4+W
 q+RhIgCdGSP2AY3n+n/fqk9QYJuMT444/lkriNWDzWpJ4ikeB8S3hNrpcMC34C8+ZM4Y
 Cetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2yOmG4jVDYQ3nJ0wsT3v+x6riKueIrGNetVF8RAfhk=;
 b=3DRkPu2Iub62LREg1tiLYFuvKIBO15THMaGVX/0HkYC2fSY250Ktwmi1MXfAHZeb8S
 yASGzIkQgzUfo9F/pviS+TsHVoAfS7g4sAyebxRetgbtCj0YChBNxI3PJuhyP5VgRQeo
 duJWNMYg1RIFyxjBLWCv1J97SNl7gF7u+T0q7Y1/t0ac6/Cquf1t+toURTQKTjpGg0ot
 e+gTzvzUG+0SKqG+cPJWiQK8HVW2tyUlLz12z+BpHWepypoYLhmaEEPOFrUu3zMlE1t6
 K9eZC2vEbkWMuNycHDEY0vGqxKX6DLicELkix9PjKUERM3oVThhhZzWDRu3Bny1Wr6kr
 bTqA==
X-Gm-Message-State: AOAM530pZoJPjKmeThvLLbmTwrdoGIP9X+w8+/oPtcGOlSGzJyVY37p/
 4b79a+iSuZGWIbVI10zI8TJAegxihI33GQ==
X-Google-Smtp-Source: ABdhPJzfDeGhFNjvxm0Vp5hc9MurH6T+pIVTauOGTpHkN34MwhN5QYuF+hd7F+V9RUTuQ56ls5YnBQ==
X-Received: by 2002:a17:90a:c302:b0:1bd:14ff:15 with SMTP id
 g2-20020a17090ac30200b001bd14ff0015mr14538118pjt.19.1650220235080; 
 Sun, 17 Apr 2022 11:30:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/39] util/log: Drop return value from qemu_log
Date: Sun, 17 Apr 2022 11:29:57 -0700
Message-Id: <20220417183019.755276-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

The only user of this feature, tcg_dump_ops, has been
converted to use fprintf directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log-for-trace.h |  2 +-
 util/log.c                   | 13 ++-----------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/include/qemu/log-for-trace.h b/include/qemu/log-for-trace.h
index 5e41517227..d47c9cd446 100644
--- a/include/qemu/log-for-trace.h
+++ b/include/qemu/log-for-trace.h
@@ -30,6 +30,6 @@ static inline bool qemu_loglevel_mask(int mask)
 }
 
 /* main logging function */
-int G_GNUC_PRINTF(1, 2) qemu_log(const char *fmt, ...);
+void G_GNUC_PRINTF(1, 2) qemu_log(const char *fmt, ...);
 
 #endif
diff --git a/util/log.c b/util/log.c
index 090bc3bc39..2bd4dfba1b 100644
--- a/util/log.c
+++ b/util/log.c
@@ -59,26 +59,17 @@ void qemu_log_unlock(FILE *fd)
     }
 }
 
-/* Return the number of characters emitted.  */
-int qemu_log(const char *fmt, ...)
+void qemu_log(const char *fmt, ...)
 {
     FILE *f = qemu_log_trylock();
-    int ret = 0;
-
     if (f) {
         va_list ap;
 
         va_start(ap, fmt);
-        ret = vfprintf(f, fmt, ap);
+        vfprintf(f, fmt, ap);
         va_end(ap);
         qemu_log_unlock(f);
-
-        /* Don't pass back error results.  */
-        if (ret < 0) {
-            ret = 0;
-        }
     }
-    return ret;
 }
 
 static void __attribute__((__constructor__)) qemu_logfile_init(void)
-- 
2.25.1


