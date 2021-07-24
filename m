Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F31E3D4AA6
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 01:28:21 +0200 (CEST)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7R47-0007tX-Oe
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 19:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7R3N-0007De-Ur
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 19:27:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:33355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7R3L-0001c7-L9
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 19:27:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso9540985pjb.0
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 16:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QF3ut61RzFRGp2rmeww3gz2Yg7nMCKmS91f908ePqrU=;
 b=AraDkAVr9ioO3HVzJPBbGL60djOLxErmX6i5an8k6YBYDMTD76KrIN2qM4dXRs7Vss
 qg12XTq5SY504pz5YajBNIQNlxPr+Gw/WLYtKoxLWAWB7FFVJuMAV1sgesrY/VgNH7Al
 J4TvADD9df8kl0Sdr8bTaqzxbiAqvp180iGg+DJWm3viKgk0KHX15FAmXbWAr5FrEwM9
 XzlVR+KHjPwWuD8tqp1AjpiWRYO0cvESWYfs3JJ2BqqW3ubgG9XDV5OfMdr4LoaX7pEZ
 6oOiqoQ6omYeO06BpPSU8HNaSex/EsFcFX8QwGDGct+UrCxmiMd7qFoIBFypOjSZC/eU
 sydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QF3ut61RzFRGp2rmeww3gz2Yg7nMCKmS91f908ePqrU=;
 b=nQ/gquSjsVGDOowoVSHqAsIeyqKJn3XaL+qywRZ+3QHYcpwH5ITzSgjHIJ4vkEPTV+
 QlhW9VM+wTzGIof0hPku86FYFp+OQgxK2iASZbQmVd28wMqpp1BhbObyuDI1cdPhMI3u
 SsoMM3rzNeC6/5b1ZJIdmqOjKbvS3mdkW/W9+PvhWqS1K+/cY8OVo/fwTd/1jQqDyEbU
 7qMxxWYTT5RPHw7CNVy4/W8OZLRK/HFT5wwZc0ANJuM8TcQyFJXaXn8bIOJscxoq/hU8
 FQjvhG3RswhyMWsIdSZJ7shcWD9iJgj6ZlXxtR6SCMmNDrYIRTyxs0J/h1iUtlyl59Ca
 0gJw==
X-Gm-Message-State: AOAM533Hg7Ya8jTcLEmNl8UBQYCfPrnURqIl7KwbGYmfZZQhmrQQmuVL
 TBliVoqxA1VF4yAdB4fKEYr7qsIrDtLv4w==
X-Google-Smtp-Source: ABdhPJz9CAEKzaA8lhz4x8UP1+zRTVD4jGKDsDHUO7TtJRtOFFEiWgFR/lt+0d5dHbu6glkD1PpHKw==
X-Received: by 2002:aa7:804f:0:b029:334:4951:da88 with SMTP id
 y15-20020aa7804f0000b02903344951da88mr10910287pfm.29.1627169249878; 
 Sat, 24 Jul 2021 16:27:29 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id ml9sm5409358pjb.53.2021.07.24.16.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 16:27:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] Revert "accel/tcg: Reduce CF_COUNT_MASK to match
 TCG_MAX_INSNS"
Date: Sat, 24 Jul 2021 13:27:26 -1000
Message-Id: <20210724232726.1223693-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 78ff82bb1b67c0d79113688e4b3427fc99cab9d4.

This produces transient errors in the 2018 advent calendar day 11
image for sparc when using -icount auto.

It is not clear what the problem is with the narrower CF_COUNT_MASK
value, since we bound the insns_left value in cpu_loop_exec_tb and
we bound the insns translated in tb_gen_code.  But it is late in the
release cycle and reverting the change does fix the problem.

In the meantime, CF_NO_GOTO_TB, CF_NO_GOTO_PTR and CF_SINGLE_STEP
were added and so need to be moved to different bits.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 9 ++++-----
 accel/tcg/translate-all.c | 4 +++-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 5d1b6d80fb..bccd7724dc 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -493,16 +493,15 @@ struct TranslationBlock {
     uint32_t flags; /* flags defining in which context the code was generated */
     uint32_t cflags;    /* compile flags */
 
-/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
-#define CF_COUNT_MASK    0x000001ff
-#define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
-#define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
-#define CF_SINGLE_STEP   0x00000800 /* gdbstub single-step in effect */
+#define CF_COUNT_MASK    0x00007fff
 #define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.  */
 #define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
 #define CF_USE_ICOUNT    0x00020000
 #define CF_INVALID       0x00040000 /* TB is stale. Set with @jmp_lock held */
 #define CF_PARALLEL      0x00080000 /* Generate code for a parallel context */
+#define CF_NO_GOTO_TB    0x00100000 /* Do not chain with goto_tb */
+#define CF_NO_GOTO_PTR   0x00200000 /* Do not chain with goto_ptr */
+#define CF_SINGLE_STEP   0x00400000 /* gdbstub single-step in effect */
 #define CF_CLUSTER_MASK  0xff000000 /* Top 8 bits are cluster ID */
 #define CF_CLUSTER_SHIFT 24
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index bbfcfb698c..0226123981 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1428,9 +1428,11 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     max_insns = cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
+        max_insns = CF_COUNT_MASK;
+    }
+    if (max_insns > TCG_MAX_INSNS) {
         max_insns = TCG_MAX_INSNS;
     }
-    QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);
 
  buffer_overflow:
     tb = tcg_tb_alloc(tcg_ctx);
-- 
2.25.1


