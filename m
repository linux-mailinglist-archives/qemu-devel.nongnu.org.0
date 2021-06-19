Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8703AD7EF
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 06:59:39 +0200 (CEST)
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luT50-000758-GU
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 00:59:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luT2X-0002uM-GZ
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 00:57:05 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:41524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luT2V-0000MR-Kr
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 00:57:05 -0400
Received: by mail-pl1-x62d.google.com with SMTP id e1so5716404plh.8
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 21:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=081mKzQdRF4YARgfGLG8Cn+s1WSek62UMz6C8qKQ5eA=;
 b=KkTRfWFHbYbK9Nh6qnnR/nByASUhzG45TT2Ft/qdTeDlSyVToocTuYC3FLGi1Vrh00
 arrgKBFzfvXKLgZc/ThF5qHnNicoSQmdoROSUxmBvu8Sh9hBALfIwFfb1vBSnoqe6P07
 DEY/SZ/qMHR+q8xW/JOcYjYt0ujdmXKObgzHBD45hYf6Ys2sD//FjK9IpEt3TkXRab3i
 GtJLK6XrcCA97vNJtybJe8W5lZMBs3/3SEbyGl27a1hWkJKRCuO4UVP0s8QFMRi5CUdZ
 kct3+au6D5cCp9jiqL8qH6jzwi3M+6IHtBUvtgf+tE6mA9uDwIyrOle5TSzoKgb6QmVY
 u45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=081mKzQdRF4YARgfGLG8Cn+s1WSek62UMz6C8qKQ5eA=;
 b=DTemQYPjppJYhg8I2K2THUmD4gohv1Riw40+Aujzbx7oPeECCrYbG1CODHSyxZu/kt
 jXgvG3cFoDAPOfZnCx0VxPXcfCCSj7HXX5UfoqFvN2k2t03olZdyPLw+hvfhh/1SUO+q
 2Ohl127q9eCWRNQF4hxsDfGLLJ7NqTjVDUtQ+Vx5l9ag1VWzMOkPLr4G+50CRVn8Zb/I
 sV36VeIgATdLpPek2A1Hzn5kaJcMyOMiC0UPI2WM12I3B+/m1ztQ1KLnv7FUKqvkMI/M
 YvrFxNHO0GXmbvq6MQgzW0AhKtRtjyXL/6qoTGAL3aNjDsZCuOvXeMV2BHVme8nnJBRr
 umgQ==
X-Gm-Message-State: AOAM532IRREAZQJKuHGlNg8eQUEY9kn0uUVChOcekBL5UtgiMyZr4qeA
 0W+nPkvGBrPMRhks8V6o/V3y9s6GattvPg==
X-Google-Smtp-Source: ABdhPJxmHp+L7/X7BktQtYVS04HFGBFf02oYv80mkoPr5v9MK9GUeOKZFc8Pbw4aVfYeswj+7Q9K/A==
X-Received: by 2002:a17:902:e8c2:b029:123:25ba:e443 with SMTP id
 v2-20020a170902e8c2b029012325bae443mr145957plg.29.1624078622136; 
 Fri, 18 Jun 2021 21:57:02 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id i6sm11581378pgg.50.2021.06.18.21.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 21:57:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tcg/sparc: Fix temp_allocate_frame vs sparc stack bias
Date: Fri, 18 Jun 2021 21:56:59 -0700
Message-Id: <20210619045700.46907-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619045700.46907-1-richard.henderson@linaro.org>
References: <20210619045700.46907-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sw@weilnetz.de, mark.cave-ayland@ilande.co.uk, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should not be aligning the offset in temp_allocate_frame,
because the odd offset produces an aligned address in the end.
Instead, pass the logical offset into tcg_set_frame and add
the stack bias last.

Cc: qemu-stable@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk
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


