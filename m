Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E5518D97
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:56:56 +0200 (CEST)
Received: from localhost ([::1]:60776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlydj-0006KE-75
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVx-0000zk-DN
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:53 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVv-0003WZ-Op
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:53 -0400
Received: by mail-pg1-x536.google.com with SMTP id 202so4542546pgc.9
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=B0IjewfhPoB21mUL+ukAhhgR2+vOUEMvAP9pcUk/okk=;
 b=DQQOZkS4g5w1HAIASzVcGpUOvgy81o897RsNehNQ8S2/PsQMU7DRIfglJ/vPwK9SAe
 tDQM0CPLyfXBXnaRdPcAuQri3hZ+e/kiPhYsE/hdhz1NnYMv+K8M6JSGJkPdGPF9oHVR
 /OWs7YhNSyUFTm5neasruoE9RJDlN3Gan6ROcZQMwiHMKw/99ixxxWF/xWDLf/+Expj+
 0GdFSX6N6VahEF1h3NyyLYfpNJdcCeqK2Yndytr7Z8nmtwY4NX1D5cZlX5ybyMzuA3J4
 x3Q8hGgZEi1hNHjOKqKmetkmeMYzYgNWKAi0A3F1RvDCP/8zhqR3SuZf2iRvolWUi16s
 ANLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B0IjewfhPoB21mUL+ukAhhgR2+vOUEMvAP9pcUk/okk=;
 b=6d7LutO5nNzoniDSmUlIiILi9p+xIQ0USDMXBwOFwV3PMJROFyGRGuqPulZMkzEtzS
 pHAlsGi9w5p0Y4RNU74WoE1nEwOCzGsTIg7uaxd//Rkn1moGcZwNp04IzCa+KF6cLo3E
 qSijyJyF4xJ2zpf6ejNH7lhKO+m7wGXquk3EqbEpu1xGTfFD3dk6MSNiRYId++f5a6aK
 LWuJZd0TvXV7XhrHLnwEp1xHKEZV4NnZ100LDsC5UkxCtzc0MyriffDNiE/c84FpsCY4
 Zcx0cGa9NZq6Qin3D0tmR/HTxSs2hPmCLHAIsQG7Riv+muwTfBq8FSXQeT8eGzv4DZSo
 u1+w==
X-Gm-Message-State: AOAM531tf0RmvnwdVVsvqlpqPp0+yA4wj8XQsl66KWy5sSDSaTaWHuF3
 QpZdYOK6QhqAZs9ugbFH4htp1suVEutzkA==
X-Google-Smtp-Source: ABdhPJwmGxO5koaYBbNOBLIZU32B/GH3PgkaKPq6eriwLqEjIlUeKlk2PWVU0crcTN6zO0ntHr/OSQ==
X-Received: by 2002:a05:6a00:1824:b0:50c:e939:118a with SMTP id
 y36-20020a056a00182400b0050ce939118amr17776383pfa.15.1651607330440; 
 Tue, 03 May 2022 12:48:50 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/74] semihosting: Add target_strlen for softmmu-uaccess.h
Date: Tue,  3 May 2022 12:47:34 -0700
Message-Id: <20220503194843.1379101-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mirror the user-only function of the same name.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/semihosting/softmmu-uaccess.h |  3 +++
 semihosting/uaccess.c                 | 29 +++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/semihosting/softmmu-uaccess.h b/include/semihosting/softmmu-uaccess.h
index 03300376d3..4f08dfc098 100644
--- a/include/semihosting/softmmu-uaccess.h
+++ b/include/semihosting/softmmu-uaccess.h
@@ -53,4 +53,7 @@ void softmmu_unlock_user(CPUArchState *env, void *p,
                          target_ulong addr, target_ulong len);
 #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
 
+ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr);
+#define target_strlen(p) softmmu_strlen_user(env, p)
+
 #endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index 0d3b32b75d..3cd809122c 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -23,6 +23,35 @@ void *softmmu_lock_user(CPUArchState *env, target_ulong addr,
     return p;
 }
 
+ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
+{
+    char buf[256];
+    size_t len = 0;
+
+    while (1) {
+        size_t chunk;
+        char *p;
+
+        chunk = -(addr | TARGET_PAGE_MASK);
+        chunk = MIN(chunk, sizeof(buf));
+
+        if (cpu_memory_rw_debug(env_cpu(env), addr, buf, chunk, 0)) {
+            return -1;
+        }
+        p = memchr(buf, 0, chunk);
+        if (p) {
+            len += p - buf;
+            return len <= INT32_MAX ? (ssize_t)len : -1;
+        }
+
+        len += chunk;
+        addr += chunk;
+        if (len > INT32_MAX) {
+            return -1;
+        }
+    }
+}
+
 char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
 {
     /* TODO: Make this something that isn't fixed size.  */
-- 
2.34.1


