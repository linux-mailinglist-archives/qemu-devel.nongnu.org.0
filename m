Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1336576AF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 13:53:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAVsP-0001EP-Ka; Wed, 28 Dec 2022 07:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVs9-0000tl-EN
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:49:31 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAVs7-0002gi-Fy
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 07:49:29 -0500
Received: by mail-wm1-x334.google.com with SMTP id m3so2280102wmq.0
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 04:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5cIuqQ4skUeVHmlxcVqLU0zfv7mr6e0LURiFdaTPHd8=;
 b=oOpQVIJqPSNsWCXIZ2OCQDluc7ruiC0zIb+mrIHIEsNGH1PkBMpFwtHGPct62zFCHS
 Jd9BByGOVQAE4blBtE8ED48PnQtbxo6IuMGkysAHdgcYcLDDgtQxTBcqJbLE1MshIDIs
 TTjUhgjKQjSt+x+q9xp/XJoquJw/EkwGd0NHnM+4l1u4smzHmrWDrPG3foY0Om03demt
 jVRs6Goh6cqQtnaMHpgkRkYggucIOOkD0mZsFg0YOBDKjzMQyP/epNMqPKzTNIoZvPDM
 5Le0DXPtOAqxQBoSHibmhx0KAKRJyXYzTfMuPBR48bLzDkUEQbi3yGxFrC4NxD7SUBJc
 4Xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5cIuqQ4skUeVHmlxcVqLU0zfv7mr6e0LURiFdaTPHd8=;
 b=29F7znPIVUVqjwQUiryM0yr9Qkvjj2SNmt5ZwJIy8Mzv5BMuWPzDUdB74CjfJ9FDHd
 0fLambie0LgjSwdqHvpD/yZzMMoFFs7jb5KkRPbOk0cqdrnrkafpnErLnXpqxNNe10Tz
 wRpKGSTAT8+zHThj6iJA2eUvrDYLz4OVHDCntCP0WSJPh1nuZiMhnELJ4d/G78mhn+0b
 BsDgoP9QL04Tpb6Cmenoqm2gHxnhXo4acsKQb/YSxRdp9FFI1SqoCF8JvLrdjRCKRlmL
 28JlFVjMoBlUqXQ/iFCHXY+nQNa+ryQYdx08tAcE4k/gaSkYvS0hqd8XBxN2LIIPktJ8
 6O7g==
X-Gm-Message-State: AFqh2kouUSmgwcGrKcf5wYR6AEFr7OU2SlF2wKtptISfeNt0riaCkSGA
 PF2AHxhdpM4aPAY5aOAyZCV5gGXi1x2Oa1Qb
X-Google-Smtp-Source: AMrXdXv7PCrBPXrNpGiLlgHoDWFSHp1CJ8CjL2sDrxHUgZmL7WDA8qdzXiLb6eZt4yyutw4j1KTIDw==
X-Received: by 2002:a05:600c:18a1:b0:3d2:3ec4:7eed with SMTP id
 x33-20020a05600c18a100b003d23ec47eedmr20549816wmp.10.1672231765814; 
 Wed, 28 Dec 2022 04:49:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c314e00b003d237d60318sm22600520wmo.2.2022.12.28.04.49.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Dec 2022 04:49:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1b/4] accel/tcg: Unindent tb_invalidate_phys_page_unwind
Date: Wed, 28 Dec 2022 13:49:18 +0100
Message-Id: <20221228124918.80011-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228124918.80011-1-philmd@linaro.org>
References: <20221224151821.464455-2-richard.henderson@linaro.org>
 <20221228124918.80011-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
[PMD: Split patch in 2]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/tb-maint.c | 53 ++++++++++++++++++++++----------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index c9b8d3c6c3..b3d6529ae2 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -1024,6 +1024,11 @@ void tb_invalidate_phys_page(tb_page_addr_t addr)
  */
 bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
 {
+    TranslationBlock *current_tb;
+    bool current_tb_modified;
+    TranslationBlock *tb;
+    PageForEachNext n;
+
     /*
      * Without precise smc semantics, or when outside of a TB,
      * we can skip to invalidate.
@@ -1037,36 +1042,32 @@ bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc)
     }
 
     assert_memory_lock();
-    {
-        TranslationBlock *current_tb = tcg_tb_lookup(pc);
-        bool current_tb_modified = false;
-        TranslationBlock *tb;
-        PageForEachNext n;
+    current_tb = tcg_tb_lookup(pc);
 
-        addr &= TARGET_PAGE_MASK;
+    addr &= TARGET_PAGE_MASK;
+    current_tb_modified = false;
 
-        PAGE_FOR_EACH_TB(addr, addr + TARGET_PAGE_SIZE, unused, tb, n) {
-            if (current_tb == tb &&
-                (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
-                /*
-                 * If we are modifying the current TB, we must stop its
-                 * execution. We could be more precise by checking that
-                 * the modification is after the current PC, but it would
-                 * require a specialized function to partially restore
-                 * the CPU state.
-                 */
-                current_tb_modified = true;
-                cpu_restore_state_from_tb(current_cpu, current_tb, pc);
-            }
-            tb_phys_invalidate__locked(tb);
+    PAGE_FOR_EACH_TB(addr, addr + TARGET_PAGE_SIZE, unused, tb, n) {
+        if (current_tb == tb &&
+            (tb_cflags(current_tb) & CF_COUNT_MASK) != 1) {
+            /*
+             * If we are modifying the current TB, we must stop its
+             * execution. We could be more precise by checking that
+             * the modification is after the current PC, but it would
+             * require a specialized function to partially restore
+             * the CPU state.
+             */
+            current_tb_modified = true;
+            cpu_restore_state_from_tb(current_cpu, current_tb, pc);
         }
+        tb_phys_invalidate__locked(tb);
+    }
 
-        if (current_tb_modified) {
-            /* Force execution of one insn next time.  */
-            CPUState *cpu = current_cpu;
-            cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(current_cpu);
-            return true;
-        }
+    if (current_tb_modified) {
+        /* Force execution of one insn next time.  */
+        CPUState *cpu = current_cpu;
+        cpu->cflags_next_tb = 1 | CF_NOIRQ | curr_cflags(current_cpu);
+        return true;
     }
     return false;
 }
-- 
2.38.1


