Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9CF541D87
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:18:12 +0200 (CEST)
Received: from localhost ([::1]:54230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhWd-0006Fi-Gb
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:18:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5Z-000785-Oy
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:09 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5W-0001Jp-NS
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:09 -0400
Received: by mail-pl1-x634.google.com with SMTP id b5so15803839plx.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/8kHpTuA8EYvqEwEVmTpwAp8qVVL2ZJoscaVrRBS+xo=;
 b=yqVFEj56Ji6vQbLKuRMIndv7VNpzqUqPm867XRuvxeGElqSwuxmJ5Qs2fnQabrK4bb
 +bvAwsB03PBKCDEiJuHj5adtdyT8TqTvd3EHYEIVQFUfbzdxR652jYyc+1hCXV0jPSoM
 guvuXY7UUGnDlv2bYYNI9Etb+egO9QvLyA7jvG1HVzCNQrPQGvspaHxJynVuQfvMe2ku
 mya7+eNfv97NfZtWzsupGBMHM/dtUz6JY9xr+gS9FTnLNyRB9QCsTk4a3UdQS/sl4Pbo
 muuYildYxYqZmyDIvgaFhDK//ulxRopjnniji+vqgTuOg0lOxNU13JBRVbpmdGQtav4T
 1cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/8kHpTuA8EYvqEwEVmTpwAp8qVVL2ZJoscaVrRBS+xo=;
 b=QB1QLmh5CfRK0ToVUQG7ADz4YhEIxUUyCowd1/Hp9hALhvUBHVsxeXYAb6rddxAK8s
 EGYagnpLmLq59JY09kAO4znvuKynDI9cIN4xp5FSU5SpMJrK/2KqNd2683UJrn0WVBIC
 N9WKvefpx2iV7nusgrNWFSuuvcxicKWXjCNMLZYrVIXwhSyolCvG9TIA5LygxdYceUnG
 vZjoNayuL6TXHTCLqIWwq6VxjCQg/fJT+jjaDQiO6wPVnK7U5mKBsIES3gLm7kNJcPb8
 8lUhoN2s5YngOpfHjweuRFscp++nn0nH2wua8FlvYVpFWJw/shI/qkCqM8CztNejGTlA
 fJNQ==
X-Gm-Message-State: AOAM532hpZMUfJgYFyQPNZzlr8GEekLAnL80f6Ds8iYEUaYfTN8udsnq
 BTVYFnessor9S9ScBOBbSiV42BSBt36/4Q==
X-Google-Smtp-Source: ABdhPJxfabKX1CvHdcidbpt0CuRw+0TATiUWd3+5nYDCUSaZgfTTh0E4gCWmYA5HSVPQxvYruOzdfw==
X-Received: by 2002:a17:902:cec8:b0:163:e4c1:b302 with SMTP id
 d8-20020a170902cec800b00163e4c1b302mr30892680plg.123.1654634765366; 
 Tue, 07 Jun 2022 13:46:05 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:46:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 07/53] semihosting: Simplify softmmu_lock_user_string
Date: Tue,  7 Jun 2022 13:45:11 -0700
Message-Id: <20220607204557.658541-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
index d6997e3c65..8018828069 100644
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


