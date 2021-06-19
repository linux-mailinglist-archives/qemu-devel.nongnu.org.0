Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818EF3ADB5C
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:33:39 +0200 (CEST)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufmk-00054x-Hd
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufV3-0000yZ-OC
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:22 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUt-0002O1-5x
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:21 -0400
Received: by mail-pf1-x432.google.com with SMTP id y4so3365584pfi.9
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vj3iM+4KuA8uBWwj0fsPq6mPv+uS3VpYfRQ2Oo4Z10Q=;
 b=U8ljitxM36Cf6eaNYCEB3xGms9dNWoFQy0TgDOw/IuCR3JGd3a6Ruyw6jsUAKkDKf0
 D9swumuWUy+rktRk8Ejb52hfQ7Uz45YUJLqHxGQ1V9LVe3rZgbhu1toY6mcoDb+CVd8Y
 O3fp/EOZFeeqF9S4wbLqRQzc2hGVCWLvgopoH4OIV0Wcko8m3mUy2tcsyhqzGvDlZS6X
 f5055rcm2NdWhDrFpXRDYo7XkZ5as8IrtJ2lHLr08Mp3iWjkZu0FPTo7cLdhIZn3HCxg
 xRECphqiWY6xG3hxc5PM14qAl1JNjj88KjTlfaUjhDrY4CxRb0Qomn5F1KqrotzC26Wz
 ubqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vj3iM+4KuA8uBWwj0fsPq6mPv+uS3VpYfRQ2Oo4Z10Q=;
 b=sGXi93oy9kATe2E1Na7hy1uWQxkBficIDPadt7ZWzBeACkxXRxxZz5ivOzfBpY4Fh5
 dHcuTWrzSQ95DoR0iddhDJhiiUUoP2bCgNAW8wsuRKqOPSHNDDrYAhRVNJqy30kwurGW
 tDCFX4R3hiektcmBuXMsZ2cCnmHSui8iEn/28E6un3VZOEXyTtl/ZTIMv8O/BX5eXn0F
 eJm4bb+FWZnZOpzz/kPsIprPRNvHg/0OBVsyYCRZUbKOydodS+0LBKWOGYD5Z1WO7IaF
 auZ8Zy4BSQmNpdlJenKwovinytttQFf5McTN6ByLHFCOVzMpl4ib/EGKPTufeKtpVGwd
 Gbfg==
X-Gm-Message-State: AOAM533lmB1PSDmGJFceGbB4LM9JkvF7IMYKS0HROKODNDaTi6j7Fz3q
 Iy9G8sY/BcE7SIdnrSMjVEbQ81+tPLByIw==
X-Google-Smtp-Source: ABdhPJyn3Wc/iBcf3lx6665a5pmEanVyuJM1zk7q1HHuppQq1pSnIP6/ptNgcWTHCl87QNE1+fApaw==
X-Received: by 2002:a63:5118:: with SMTP id f24mr15936118pgb.34.1624126509794; 
 Sat, 19 Jun 2021 11:15:09 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/33] tcg/sparc: Fix temp_allocate_frame vs sparc stack bias
Date: Sat, 19 Jun 2021 11:14:48 -0700
Message-Id: <20210619181452.877683-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should not be aligning the offset in temp_allocate_frame,
because the odd offset produces an aligned address in the end.
Instead, pass the logical offset into tcg_set_frame and add
the stack bias last.

Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c                  |  9 +++------
 tcg/sparc/tcg-target.c.inc | 16 ++++++++++------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index dd584f3bba..52e858523c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3015,17 +3015,14 @@ static void check_regs(TCGContext *s)
 
 static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
 {
-#if !(defined(__sparc__) && TCG_TARGET_REG_BITS == 64)
-    /* Sparc64 stack is accessed with offset of 2047 */
-    s->current_frame_offset = (s->current_frame_offset +
-                               (tcg_target_long)sizeof(tcg_target_long) - 1) &
-        ~(sizeof(tcg_target_long) - 1);
-#endif
     if (s->current_frame_offset + (tcg_target_long)sizeof(tcg_target_long) >
         s->frame_end) {
         tcg_abort();
     }
     ts->mem_offset = s->current_frame_offset;
+#if defined(__sparc__)
+    ts->mem_offset += TCG_TARGET_STACK_BIAS;
+#endif
     ts->mem_base = s->frame_temp;
     ts->mem_allocated = 1;
     s->current_frame_offset += sizeof(tcg_target_long);
diff --git a/tcg/sparc/tcg-target.c.inc b/tcg/sparc/tcg-target.c.inc
index ce39ac2d86..a6ec94a094 100644
--- a/tcg/sparc/tcg-target.c.inc
+++ b/tcg/sparc/tcg-target.c.inc
@@ -984,14 +984,18 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 {
     int tmp_buf_size, frame_size;
 
-    /* The TCG temp buffer is at the top of the frame, immediately
-       below the frame pointer.  */
+    /*
+     * The TCG temp buffer is at the top of the frame, immediately
+     * below the frame pointer.  Use the logical (aligned) offset here;
+     * the stack bias is applied in temp_allocate_frame().
+     */
     tmp_buf_size = CPU_TEMP_BUF_NLONGS * (int)sizeof(long);
-    tcg_set_frame(s, TCG_REG_I6, TCG_TARGET_STACK_BIAS - tmp_buf_size,
-                  tmp_buf_size);
+    tcg_set_frame(s, TCG_REG_I6, -tmp_buf_size, tmp_buf_size);
 
-    /* TCG_TARGET_CALL_STACK_OFFSET includes the stack bias, but is
-       otherwise the minimal frame usable by callees.  */
+    /*
+     * TCG_TARGET_CALL_STACK_OFFSET includes the stack bias, but is
+     * otherwise the minimal frame usable by callees.
+     */
     frame_size = TCG_TARGET_CALL_STACK_OFFSET - TCG_TARGET_STACK_BIAS;
     frame_size += TCG_STATIC_CALL_ARGS_SIZE + tmp_buf_size;
     frame_size += TCG_TARGET_STACK_ALIGN - 1;
-- 
2.25.1


