Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30521599377
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 05:33:18 +0200 (CEST)
Received: from localhost ([::1]:55646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOsl3-0004ef-9p
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 23:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseV-0001my-GW
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:31 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOseS-0002kl-Uj
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 23:26:31 -0400
Received: by mail-pl1-x62d.google.com with SMTP id d16so3082948pll.11
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=BkKYzAS+5uJ73OkqVTsICJsmapNm4Yj8Jkt7Pin6sUU=;
 b=C9rxDRGCvNgjEL+g59RVPET6/6xCk5/MAHGvriq99Tu9MnJ1ik+lTiOlMc2uUXefkq
 ufhhv/pESJjRq5w6OKi8o/mSCWw0eSw0B7xiaTOF62LFiuac4M3Le8QgB5dZlbYyFxwi
 2/P1fMSyeoWU87e3dutUa2rjL2jFMsmOM6mcKVCkQyrXfmwdanqk+y9glGetZWuRkqxG
 0C8jTTnTF4VXCH6tSTBe2IOPiyX1t2j0G+NcEK5ctNZNM5tHXpJXhVC8GDPvJr7OSk37
 97619a9dIDMkltGivlLjdQgVEVdXYIZoWRTH5o8689fQDuBXYXGHbFEDffk/A7Oddz/Y
 BA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=BkKYzAS+5uJ73OkqVTsICJsmapNm4Yj8Jkt7Pin6sUU=;
 b=KkWGYXB2mJIPHdy1uKUA28qIpIUdkXK72Vzw+0HK6tU/3EB+no/7iD6KONo9lwfQ0A
 Y39qoysoX3hOhP2GyyqU8DlxvVEQiMAKsAdW0cVWxrAufOVK5y60T9/8vb0IKa0lUasG
 NsDmuKFRAT7wvWhAkvtGjtZX8/wSrZsCZFQZXGLbVf05wwvPSZ+pm7sJhW339Ksl/ZdS
 yCSKcC2OcFRtbjX6LLpjXIK9Sd6Hat2NT3pCMCsHzrTxeOBKf57/QTFbDv1bZDRZLysI
 PwMdETuDev3pGPORzgpuEhZhq+NFnxpqh6Jx+MqYKau+iSHANl6iDUp/Y9R8S7T6O7Jk
 eI3g==
X-Gm-Message-State: ACgBeo3C9NhIzElysiFDyDCozdwdPGGx1s+VwGjHgTWaUtCaKMwWaIiB
 fvO61RzC72YZOZbkLJet9gDD5PHUi6koQQ==
X-Google-Smtp-Source: AA6agR7/FNcHkHUMOIJgOLxRdS1TTt17aZ8sDGz8SixPdKSPhQIajd2NlFohLgqTYfPLyiP8pkTwyQ==
X-Received: by 2002:a17:90a:9a8a:b0:1fa:b4c1:c94 with SMTP id
 e10-20020a17090a9a8a00b001fab4c10c94mr11108205pjp.210.1660879587484; 
 Thu, 18 Aug 2022 20:26:27 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 g184-20020a6252c1000000b00535d19c46d7sm2199904pfb.203.2022.08.18.20.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 20:26:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu, iii@linux.ibm.com, dramforever@live.com,
 alistair.francis@wdc.com, alex.bennee@linaro.org
Subject: [PATCH v6 09/21] accel/tcg: Unlock mmap_lock after longjmp
Date: Thu, 18 Aug 2022 20:26:03 -0700
Message-Id: <20220819032615.884847-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819032615.884847-1-richard.henderson@linaro.org>
References: <20220819032615.884847-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

The mmap_lock is held around tb_gen_code.  While the comment
is correct that the lock is dropped when tb_gen_code runs out
of memory, the lock is *not* dropped when an exception is
raised reading code for translation.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c  | 12 ++++++------
 accel/tcg/user-exec.c |  3 ---
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index a565a3f8ec..d18081ca6f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -462,13 +462,11 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu_tb_exec(cpu, tb, &tb_exit);
         cpu_exec_exit(cpu);
     } else {
-        /*
-         * The mmap_lock is dropped by tb_gen_code if it runs out of
-         * memory.
-         */
 #ifndef CONFIG_SOFTMMU
         clear_helper_retaddr();
-        tcg_debug_assert(!have_mmap_lock());
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
 #endif
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
@@ -936,7 +934,9 @@ int cpu_exec(CPUState *cpu)
 
 #ifndef CONFIG_SOFTMMU
         clear_helper_retaddr();
-        tcg_debug_assert(!have_mmap_lock());
+        if (have_mmap_lock()) {
+            mmap_unlock();
+        }
 #endif
         if (qemu_mutex_iothread_locked()) {
             qemu_mutex_unlock_iothread();
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a20234fb02..58edd33896 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -80,10 +80,7 @@ MMUAccessType adjust_signal_pc(uintptr_t *pc, bool is_write)
          * (and if the translator doesn't handle page boundaries correctly
          * there's little we can do about that here).  Therefore, do not
          * trigger the unwinder.
-         *
-         * Like tb_gen_code, release the memory lock before cpu_loop_exit.
          */
-        mmap_unlock();
         *pc = 0;
         return MMU_INST_FETCH;
     }
-- 
2.34.1


