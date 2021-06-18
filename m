Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5483AD2F1
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:35:36 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKH9-0002wI-IR
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBm-0001Va-9z
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBh-0001Re-50
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:01 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso6480166pjp.2
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jv0AKUAYCfq8gx2BZJi7SVG0aTCPQkqBNcO1pY7PIho=;
 b=DMSP6sPk2LlhG7ZPOxmaRMZ8QYXDW4fuDe9mT5oDb3nNFC71lkvdhnXGwgoTMZAVy/
 7VgDBU1mEO07RXb/XmtO+0bFlda2rdVgErZFFrFy3EP773mjyeX7fNh5YYdEQsoULa4I
 r/pNv5jMNeof16H8V4OTRd4YpheGjV3CoMUhWhZGlwsqgqWzaIjQj9QWSlKez2tgipCi
 UywmUgE3KTgIz3dAuX4iW3TVppfwWKM6r410kmJraOoFRRnBPM6MsG1XEG7j0dbLWS3Z
 iOYJ9aAQiGZmKhu3PZe8OegHICj7mKnTZ6YSe0oOXBMZH/uB9r6LD1LS2/wzTVo/dhKp
 CGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jv0AKUAYCfq8gx2BZJi7SVG0aTCPQkqBNcO1pY7PIho=;
 b=ovPrmJIxG7gDcfwWrZkivmDeHh1fgfT9x7stfz0+kUFWvs0yySvfqmDJ7tExC1bBK1
 MXEs+yStGn7jbE1ArB0UWLOerePDeGlX97nTDrnID5K9tJGu7dXaYNJ216//1cJ157j6
 jy1h/hA/fOyzvdo93iXEtzcXVeXHNfsRvGE8k3u2iCEY26bNqg0HTql+YtIVShwpjpGW
 Ml5SOkNRH8Kn+2TrvlrBON01CCYY0VJQCNQX9imOeJ9Tp69VYIJzL6uvKwuNHeBPrA81
 +n/Z7FcJbvrqSSQPhRIVs/e48TkrwEpCDzPZp7xgJFuSvzlqzhfakTW6mXfEgqbK2s9Q
 6WWw==
X-Gm-Message-State: AOAM532BTNCPyfBYMQ6Jkg9RV47Q2vlHTALyQ1J98XadyEcN13me5GND
 b6XTS7rALzXJJ1qSHygawK9pK38/xYrj7g==
X-Google-Smtp-Source: ABdhPJyrThsp3uSW9cTg2rRq1AcVJLV7Sv8fkFOQ3orcGuwaGaTKA8rs4SOOWRRxQnqjDN9LA3yTJg==
X-Received: by 2002:a17:902:da84:b029:10e:fafc:b29b with SMTP id
 j4-20020a170902da84b029010efafcb29bmr6169516plx.35.1624044595845; 
 Fri, 18 Jun 2021 12:29:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:29:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/23] linux-user/alpha: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:34 -0700
Message-Id: <20210618192951.125651-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use ka_restorer.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/target_signal.h |  1 +
 linux-user/alpha/signal.c        | 34 +++++++++++++++++++-------------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
index 250642913e..0b6a39de65 100644
--- a/linux-user/alpha/target_signal.h
+++ b/linux-user/alpha/target_signal.h
@@ -93,6 +93,7 @@ typedef struct target_sigaltstack {
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #define TARGET_ARCH_HAS_KA_RESTORER
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
index 1129ffeea1..e15f5438c3 100644
--- a/linux-user/alpha/signal.c
+++ b/linux-user/alpha/signal.c
@@ -54,13 +54,11 @@ struct target_ucontext {
 
 struct target_sigframe {
     struct target_sigcontext sc;
-    unsigned int retcode[3];
 };
 
 struct target_rt_sigframe {
     target_siginfo_t info;
     struct target_ucontext uc;
-    unsigned int retcode[3];
 };
 
 #define INSN_MOV_R30_R16        0x47fe0410
@@ -141,12 +139,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         r26 = ka->ka_restorer;
     } else {
-        __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
-        __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn,
-                   &frame->retcode[1]);
-        __put_user(INSN_CALLSYS, &frame->retcode[2]);
-        /* imb() */
-        r26 = frame_addr + offsetof(struct target_sigframe, retcode);
+        r26 = default_sigreturn;
     }
 
     unlock_user_struct(frame, frame_addr, 1);
@@ -195,12 +188,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         r26 = ka->ka_restorer;
     } else {
-        __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
-        __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn,
-                   &frame->retcode[1]);
-        __put_user(INSN_CALLSYS, &frame->retcode[2]);
-        /* imb(); */
-        r26 = frame_addr + offsetof(struct target_rt_sigframe, retcode);
+        r26 = default_rt_sigreturn;
     }
 
     if (err) {
@@ -268,3 +256,21 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6 * 4, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(INSN_MOV_R30_R16, &tramp[0]);
+    __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn, &tramp[1]);
+    __put_user(INSN_CALLSYS, &tramp[2]);
+
+    default_rt_sigreturn = sigtramp_page + 3 * 4;
+    __put_user(INSN_MOV_R30_R16, &tramp[3]);
+    __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn, &tramp[4]);
+    __put_user(INSN_CALLSYS, &tramp[5]);
+
+    unlock_user(tramp, sigtramp_page, 6 * 4);
+}
-- 
2.25.1


