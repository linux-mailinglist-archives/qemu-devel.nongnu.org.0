Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65902515DA0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:34:43 +0200 (CEST)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknFC-0004gr-Ev
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAN-0004gO-0p
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:43 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAL-0006DO-4m
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:42 -0400
Received: by mail-pl1-x62f.google.com with SMTP id u9so8681924plf.6
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B0IjewfhPoB21mUL+ukAhhgR2+vOUEMvAP9pcUk/okk=;
 b=kmEhznUx1qC6YTEblmAa94kOTM4FxvPsXHGg9HENz3fIT7+sts9actE21e2Iw3UBCd
 vrvr1DfdmZDGKt6W0hgzce6Cs3UqSaLkGtFogZGQa82EuvCvv9cq8xik1+MPNIoq06fP
 Znb7vUF/fh+HlSmWwD5+uU7D1QEYjfTuMoSZPcgguDvQtR/dsUA2J+mmRfkxA/jRIzsc
 GiOLbS2jNmr+67wIIeB5QhvVpb11wAdvcmb5UftTblJd98tzbGPW1yWqL0OyMAFQ8m/r
 tzbTihoxgAHNCHIQySr0k67lPKpG1RoHchl2n21INvhMrU9VXIESYi8ptn+5hXmMNS7g
 VKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B0IjewfhPoB21mUL+ukAhhgR2+vOUEMvAP9pcUk/okk=;
 b=VoyIRVr4NDe9WVF8+EQa5oiZgsK2qy4rAdGIHv2/UitDXJNqK8Xm5uATOWrl0TBFyb
 inMvhpt1lrQqzUQpERZ9/8L648QV0gInNmgppy1Jv0sr88RlM4/q1WYsmdOB2f+dpqvC
 kqLCUa9ym61JWD5KFm6MJ7BdnCeZw/L2QZCjUTkw8Elnez1bzdGvmwPzhdbsqrNxI6A1
 PtItl8AOFl6a3ffTacaoFl1cIG7t1M0M0ueCh7k+bUyucu164L35qKsUq1d3ttetn3eC
 vV3Wwyu5anQs7VaxqGy+cuqLJ25y/V2xorC74kBBmM/9DxZJN3ObbMjSZpNb8E3m5GXX
 Ws9Q==
X-Gm-Message-State: AOAM533j1u/rZsdcXDqJcU4/zkFiNXC4gmlAQmknhYGGl0tLE0Hu83oK
 PwlNbR+hpNy3TYawK+15WCbk7pm8QcLkmQ==
X-Google-Smtp-Source: ABdhPJyh6NfVG1782gUd4SNz6TGwwthJnVlxhoKxmgF8TykosrYSVqiKtWKVEqOeymR2oJlc84En6A==
X-Received: by 2002:a17:90b:1d0e:b0:1c9:b74e:494 with SMTP id
 on14-20020a17090b1d0e00b001c9b74e0494mr4229293pjb.238.1651325379127; 
 Sat, 30 Apr 2022 06:29:39 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/43] semihosting: Add target_strlen for softmmu-uaccess.h
Date: Sat, 30 Apr 2022 06:28:54 -0700
Message-Id: <20220430132932.324018-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
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


