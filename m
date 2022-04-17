Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17248504933
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:10:52 +0200 (CEST)
Received: from localhost ([::1]:46384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAIM-00050g-Uy
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fX-0000U0-3n
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:49 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fU-0001oF-DA
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so15586894pjb.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YJfLUqPA3GuDJEz/F2NsfpzWnMr/7r3q3HR1eYDW2rE=;
 b=oCtJxFWpu4oqrxJGRokpZhvK+4N7NZa8RewCsLXroh5/aL3eVY+JXTOC9uaCG54qRM
 OiYXeN0Kin4TNKUDnOUBk2i2uFE0besj5lH2uQRM7BAqiLza/QoCGGKo5cFBd3jKaspU
 ZBLt749H/IxLLKFfwdFv4DY2SJ7uVTySm7BRl4yLCppH3lKR0/XgmPft7nhHjIizuiCX
 ogGFF3WZ5rntKDsU+uygEhPASxs7aFBnbsi5+0GcFqD/R2EPMayx96/xbhpjH6c2f0KC
 erUczAv6KRyhppT4hU50EOddtuXMImdvqGKb7uwBi51DwWSspkgsuKwyHCn2SEvm1DN8
 vRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YJfLUqPA3GuDJEz/F2NsfpzWnMr/7r3q3HR1eYDW2rE=;
 b=34T8RH7ML0ndQw/A49uXzjudrU7xpLg+abiPbRVR04+35Sa4jg47gLggwBThWd6eWt
 sAN0do4SF49qRZ8/GFjGVq7uty8zoeJfdD5tkhL3kqCvJx0VOxLTJBBA8oSB4Ini7p5B
 SbTVvvhyaRJU6LZMLLM5uHZaDeq8VxYoLURbw//EI8XsBZn/Y9CCWBDxHkzvOUGgjIfH
 Wg4M8dp3Xx6y/RPy1ItDaPBL5hXtCxPKjoaQCn/tp+u8HDrzzdies2FtsabWARUPm4xT
 OCnYztWpmwP2srACqD0qzHD4acj1OI1Og7wCY+fS5oY9PzH8qwlG61qviqI1gKCKeXC+
 3v0Q==
X-Gm-Message-State: AOAM530hF+5YEL2SLneSGXCVgYYSvZ0j6ry3gmRXgjx8tMSsQApyVOoV
 ocdUW+oiHHgrEbaCo9DbuPnfKB8jgl1DrA==
X-Google-Smtp-Source: ABdhPJxvfd0IT6mGqfkJv0Vio2S3cjk4iaGIaa/hL219Lx9VwoGi4v/1ivxMjWig8TfyiH91hi/h9g==
X-Received: by 2002:a17:902:70c1:b0:154:667f:e361 with SMTP id
 l1-20020a17090270c100b00154667fe361mr7976394plt.148.1650220238968; 
 Sun, 17 Apr 2022 11:30:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 21/39] bsd-user: Expand log_page_dump inline
Date: Sun, 17 Apr 2022 11:30:01 -0700
Message-Id: <20220417183019.755276-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

We have extra stuff to log at the same time.
Hoist the qemu_log_trylock/unlock to the caller and use fprintf.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0c8aa1ae90..ed26fc5acb 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -503,20 +503,29 @@ int main(int argc, char **argv)
     g_free(target_environ);
 
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-        qemu_log("guest_base  %p\n", (void *)guest_base);
-        log_page_dump("binary load");
+        FILE *f = qemu_log_trylock();
+        if (f) {
+            fprintf(f, "guest_base  %p\n", (void *)guest_base);
+            fprintf(f, "page layout changed following binary load\n");
+            page_dump(f);
 
-        qemu_log("start_brk   0x" TARGET_ABI_FMT_lx "\n", info->start_brk);
-        qemu_log("end_code    0x" TARGET_ABI_FMT_lx "\n", info->end_code);
-        qemu_log("start_code  0x" TARGET_ABI_FMT_lx "\n",
-                 info->start_code);
-        qemu_log("start_data  0x" TARGET_ABI_FMT_lx "\n",
-                 info->start_data);
-        qemu_log("end_data    0x" TARGET_ABI_FMT_lx "\n", info->end_data);
-        qemu_log("start_stack 0x" TARGET_ABI_FMT_lx "\n",
-                 info->start_stack);
-        qemu_log("brk         0x" TARGET_ABI_FMT_lx "\n", info->brk);
-        qemu_log("entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
+            fprintf(f, "start_brk   0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_brk);
+            fprintf(f, "end_code    0x" TARGET_ABI_FMT_lx "\n",
+                    info->end_code);
+            fprintf(f, "start_code  0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_code);
+            fprintf(f, "start_data  0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_data);
+            fprintf(f, "end_data    0x" TARGET_ABI_FMT_lx "\n",
+                    info->end_data);
+            fprintf(f, "start_stack 0x" TARGET_ABI_FMT_lx "\n",
+                    info->start_stack);
+            fprintf(f, "brk         0x" TARGET_ABI_FMT_lx "\n", info->brk);
+            fprintf(f, "entry       0x" TARGET_ABI_FMT_lx "\n", info->entry);
+
+            qemu_log_unlock(f);
+        }
     }
 
     /* build Task State */
-- 
2.25.1


