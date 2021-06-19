Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B2C3ADA2D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 15:43:59 +0200 (CEST)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lubGP-0006jE-J4
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 09:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lubEt-0004ZM-CB
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 09:42:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lubEp-00081w-I2
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 09:42:23 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o88-20020a17090a0a61b029016eeb2adf66so9627262pjo.4
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=02OPjNpVB9ZnrobKmp1fswJeaS3qOsbtuOp66JMHRwU=;
 b=lZtY8cHHzqlFPyuPZshKiwhREEx+le/CrIWqE1s0FEJDrdPR/FdlIVBGMm7TOr1W1G
 jbjpsa9rKGBfGO/aaf1zp/CtZgBrnmvcKuLQVCbmuGQ16NnQLJ/XBBghQhgphTBYEljQ
 SdggCSNJQ/dQkdZayQrzbFRGBGIa5GkAgL3kzlt6N86bUEyxXAtBWi0tXyGgdny5Udkg
 92tD2H2upiSy3u40H0cMZAcPAhYHNj53f12AP+VDdoEPRNj4nuTKyjJFcYGK0ile4Kne
 MDgS/vEMsObIfB3sCeMwytGo9+M5SNyo1xHIyXWisigt5CzRKik1JlLLJYajhtMahD+p
 WKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=02OPjNpVB9ZnrobKmp1fswJeaS3qOsbtuOp66JMHRwU=;
 b=AZX8AB+RCFUqsy0pFXEtoEtgn63HzWZGUawd5+QtKJIkpzTL/OWjSPECY3WxXvxIbV
 HaE0Hd/G1+wWk/u+1qC/HsgNa08QvAlbpD1cR7cd7Rrpn+FYnQ32dfNsx7TUgWJbc3AK
 U0Ls2NRWNa8cY4z6cywOSK5pTg8DrSTlJMf0orVSNte7iHfO5V5WqRb+Fj0zKmwaljMk
 092SXSgELIf0oc81uWX6TSHeMYNKjgSApaP2ChAVbZyR03UTteZ7yYNf4v+v2uZlWcNi
 DIgMXNj0vjswitTrHLlSRv006xeJzmKiAtqGDvixIYYEtNC+SW5giW4+yP2nvslzi4FR
 4GbA==
X-Gm-Message-State: AOAM531C5HyF8Nx113DmT7T98hjJ/5tJjSmTXYjH+wNOBPiA+57f7qCl
 9Z1qXEerYda7IuiHQr6+U2Yw8Fgy8WFQFQ==
X-Google-Smtp-Source: ABdhPJy0xQJQSzD8ph2L1r0s90YPGu6C1BMc6n4BbFem+OdEXteTcAuwUcxT486IljeeZJVkdJ0WMA==
X-Received: by 2002:a17:90a:d106:: with SMTP id
 l6mr16472369pju.164.1624110138252; 
 Sat, 19 Jun 2021 06:42:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y20sm12331511pfb.207.2021.06.19.06.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 06:42:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] tcg/sparc: Fix temp_allocate_frame vs sparc stack bias
Date: Sat, 19 Jun 2021 06:42:14 -0700
Message-Id: <20210619134216.590423-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619134216.590423-1-richard.henderson@linaro.org>
References: <20210619134216.590423-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should not be aligning the offset in temp_allocate_frame,
because the odd offset produces an aligned address in the end.
Instead, pass the logical offset into tcg_set_frame and add
the stack bias last.

Cc: qemu-stable@nongnu.org
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


