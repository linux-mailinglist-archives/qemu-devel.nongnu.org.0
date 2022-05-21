Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D152F69E
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:14:04 +0200 (CEST)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCkt-0006Bo-7A
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbN-00080Y-Nn
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:14 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbL-0003ym-RE
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:13 -0400
Received: by mail-pl1-x629.google.com with SMTP id q18so8553221pln.12
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2UWwm+1enZhNATgFL33PYQ1DN6Mmw/PBhL6/pzVSSaU=;
 b=Fgu3qTbk2lWuWYI4rssD4eziEK2qZP5OTJdBnQUacie1mPi8z38I0R1i9IyaLtMOMR
 F3r89ZKIOS1U4+4w1KO5oHRQZY8kqucoOrsyc1bQwIKq+BuLpD2qUsHO4bYUUb+ZgOH/
 3r2Rv9PuBKE+xUuK8ab7zShR3mp95Wtbc6TuVxxYw4/cXBvg9O4QwPlZ7WG253F8fLrr
 71zxZbCzc2ISiq64fz1Ns5KDlgNBrTN/7dhNZ4AD6jLRIS1L+TiAQbeLaekisoHiTjYJ
 Hyd2SI6EfJYwwAknBGEFxC12ZzVzZMevbbTI7yUCYfb5BRbhNI8xRKzV8UX0sCGfoOuL
 g3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2UWwm+1enZhNATgFL33PYQ1DN6Mmw/PBhL6/pzVSSaU=;
 b=qY2D2pGiVrM09PGUyHotHg7axNPwWYe/rV+IS/JNBBWWYz0FCYnWNJ5z677bIOolpK
 /IhsZGnTC0yUkVwWl65F5lzYy3UfD1LpBPSmA6dSUgonOc985uoWAWO2FFsjJ1YohI39
 caWP3gxHej6jrsAR+uPgsdk/kLN6gCZuj2xjKoBmArHtXssKe9WHH82hPCL589PeFZkf
 5en9OEHvV1IN42pQ3yD7x+gzBBZKU7xZqV/0LcvjG9S90rDGJbal7JEkolafq++Pvizv
 TJzhvqtpPqtuATvqjuM6ptmBvPayHnEDa0L1x7fyCtYlrv9XHHuRw9/ERGacyOJeS/uJ
 chWg==
X-Gm-Message-State: AOAM533hLiZGf8/BytP8w2UO0HWo7zTmfdNYr6myXjHwWkUpEPRALVW6
 7PfkX5qdjZOwdkGvj9p3d8W/9kgUKQrPiw==
X-Google-Smtp-Source: ABdhPJxu44nZvWi22IGrNblmW7qaAO6O0n41xZwOCjxFejBZkJDIK2uC/FjIRwRX13XLqdv/+WIBnQ==
X-Received: by 2002:a17:902:700b:b0:15f:a51a:cdeb with SMTP id
 y11-20020a170902700b00b0015fa51acdebmr11680558plk.137.1653091450309; 
 Fri, 20 May 2022 17:04:10 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 06/49] semihosting: Simplify softmmu_lock_user_string
Date: Fri, 20 May 2022 17:03:17 -0700
Message-Id: <20220521000400.454525-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

We are not currently bounding the search to the 1024 bytes
that we allocated, possibly overrunning the buffer.
Use softmmu_strlen_user to find the length and allocate the
correct size from the beginning.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/uaccess.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/semihosting/uaccess.c b/semihosting/uaccess.c
index 51019b79ff..9894f40feb 100644
--- a/semihosting/uaccess.c
+++ b/semihosting/uaccess.c
@@ -74,20 +74,11 @@ ssize_t softmmu_strlen_user(CPUArchState *env, target_ulong addr)
 
 char *softmmu_lock_user_string(CPUArchState *env, target_ulong addr)
 {
-    /* TODO: Make this something that isn't fixed size.  */
-    char *s = malloc(1024);
-    size_t len = 0;
-
-    if (!s) {
+    ssize_t len = softmmu_strlen_user(env, addr);
+    if (len < 0) {
         return NULL;
     }
-    do {
-        if (cpu_memory_rw_debug(env_cpu(env), addr++, s + len, 1, 0)) {
-            free(s);
-            return NULL;
-        }
-    } while (s[len++]);
-    return s;
+    return softmmu_lock_user(env, addr, len + 1, true);
 }
 
 void softmmu_unlock_user(CPUArchState *env, void *p,
-- 
2.34.1


