Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17E055BEFD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:13:16 +0200 (CEST)
Received: from localhost ([::1]:49758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65PP-0001eA-LJ
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63F5-0002Lm-If
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:27 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63F3-0008Is-QM
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:27 -0400
Received: by mail-pj1-x102a.google.com with SMTP id g7so6378232pjj.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mnyz4RGMr9davoKlXgtFTdnnm6cHsKuNwuwlINalmn0=;
 b=H6JhjGgUAEzlI0amOJ4rxtH1w1wZeKsl8HQVy4ZB1r63+EJtEheRrzR17UZCPZ4aSe
 Ch5OgmsP6xafoc6d480BpDQuW43U13+dbaaeVWRkRjsMFvJ2knbaDXFmdZP9AmcqsKqu
 HfPagvQHyRpzFRsgIiSFNRWfifWhd+tO87rsn092Vjktj+pzJrQmwV84DfQIaZkJtoOF
 fiwy8VZWApiKe8pBdjHe4sgp/v4qRdk+UBe+yw2Q0/zeuYN0CCwuz7DPXiGSuC5DNJY4
 pCyzfaWr8tnwiJ1Q1VaaiH+z2Ij8632dUTdQmA9e0UVCTA7tk5yQz2iUeAfgFHvfFSPH
 GEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mnyz4RGMr9davoKlXgtFTdnnm6cHsKuNwuwlINalmn0=;
 b=d0AX1WlrcL2SHregalCP5UsSE31zUNW5pL/nGm0QBUEBFtoJsC/2W+ShLe2zTYwNG3
 2HYeLuZedMndBxCEOgpe/ANA1lWR6Lm4M0D1p6dwzzFduWvle6Gr2c109t7ZsrnAbsJf
 vWmXkIDQMuP1PEftFN9NJZpGXUZ6JpXyAHiSqzTTTXIPXmbKAmmZlzuU739PrE1hABNO
 yrXYWReRmnB+H7iNrVX7ypBbR5hvSk1avYWpial650FRVOgHScBsoUb27eo++iS/va5O
 CgBUAhW5mjJQe08D8blEQOhLscfDWiBV2dlFKavHL7njc8mtaJRVr/nZaB/6c7ELLq80
 wBdg==
X-Gm-Message-State: AJIora+Mw2boHeOKtR9p4sv+MjGuoDO1M8L/kyhPt4dKuxCrIIppKCJp
 8Vp+o6oYpd8mv5Lhsi9Hy5Ot4Qq+hb49EA==
X-Google-Smtp-Source: AGRyM1vEgL3lrbjGVzYU/O8+CKT4jSsqVKonkvPSbkMjswHxb6D3htO2E3feRS5goiktnHL6yUMosg==
X-Received: by 2002:a17:902:860b:b0:16b:7927:b62c with SMTP id
 f11-20020a170902860b00b0016b7927b62cmr3071500plo.95.1656392064516; 
 Mon, 27 Jun 2022 21:54:24 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/60] semihosting: Simplify softmmu_lock_user_string
Date: Tue, 28 Jun 2022 10:23:10 +0530
Message-Id: <20220628045403.508716-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
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


