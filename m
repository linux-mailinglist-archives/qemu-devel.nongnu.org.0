Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4CB2D99B7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:22:12 +0100 (CET)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koojr-0007CT-B0
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:22:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS6-0001i5-Pr
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:50 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS0-0003wj-Nc
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:50 -0500
Received: by mail-ot1-x342.google.com with SMTP id j20so11291430otq.5
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=wpyFYYIqvE4n/WbNDVjRAK3hdmdxC+OlWEmANDViNo4=;
 b=VkU03tSWItRpfgvhXANOuGjh4Q6ZTyR5M12Iymcf5H6wAhZ/jgN//5LW8UKC07+T/i
 HdCNm3ULtW8MfdxjhDeV6zlGs4kS+LyZ/oSMmm4uVkZCYCbmn+j22XpYoGWtzqdIdkOr
 RUzkExWYX5BYjgXFW17F0ldGwPSkKM+KkczAd2mpYNEVLpeetZJjG4A8i4N9wnq5B/Ai
 qWB8sylb4KTes6LVAMvWQG6lBn7PLy3acQE+H9kHCoYvUajpUULdQ1QQDZWmndjZGfUJ
 WM++BpVSItbEQv37BKeFchtpNB3V0tdjjDQ+YlIewiv90MELmDdMxaTWRUsCyzlPSyFH
 hqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wpyFYYIqvE4n/WbNDVjRAK3hdmdxC+OlWEmANDViNo4=;
 b=VVAWvR+R8rm0gRqk7d+FT9oQ1O2MFUZ0nTm6O1ADNmqo5BivaZnr8clKoQWAquoPJz
 H3l5fi7wTdl67lk2xBM5e5ZlEmYmeQ5d3gk0AJcvr5fCRGopKobRLwbVJ9ZvgemSHTNK
 8cXM9UIQ/OWxeK8dUqRAYXSBK5ojZ9fendBNcF+SsaXgFCcwAWyMmCQfrTTsLAVg76TP
 w/hMQXGhb+5sfg+S+50Me3ejHfE8FeQgT6Yt6bLJ2N4v4lWWsrpLKJhmY7lnf6wWsZoD
 fwHoAUnIPJOuekRy4UWQ0l/VUloQW36KXQBWy4TO4fT6/sab44iNhJfwrCed/rCbW4xN
 q9iw==
X-Gm-Message-State: AOAM533eWoRye4XOCVF8WkNN8fGw8jFynFhuM31IvmnrmLRjIG6YEE09
 42W7IRvpQ2S/Udv+YMgKMWwIjqRhFOLMUj9d
X-Google-Smtp-Source: ABdhPJwZ8I+PgcVa3xG6A8gYc1TAHbqM9eximVN9yfC57SshVW0Cl5MbbpgMWRcAUWiwViDuLngw/w==
X-Received: by 2002:a9d:6208:: with SMTP id g8mr20178728otj.165.1607954621672; 
 Mon, 14 Dec 2020 06:03:41 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/43] tcg: Make DisasContextBase.tb const
Date: Mon, 14 Dec 2020 08:02:45 -0600
Message-Id: <20201214140314.18544-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing within the translators that ought to be
changing the TranslationBlock data, so make it const.

This does not actually use the read-only copy of the
data structure that exists within the rx region.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/gen-icount.h  | 4 ++--
 include/exec/translator.h  | 2 +-
 include/tcg/tcg-op.h       | 2 +-
 accel/tcg/translator.c     | 4 ++--
 target/arm/translate-a64.c | 2 +-
 tcg/tcg-op.c               | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 822c43cfd3..aa4b44354a 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -32,7 +32,7 @@ static inline void gen_io_end(void)
     tcg_temp_free_i32(tmp);
 }
 
-static inline void gen_tb_start(TranslationBlock *tb)
+static inline void gen_tb_start(const TranslationBlock *tb)
 {
     TCGv_i32 count, imm;
 
@@ -71,7 +71,7 @@ static inline void gen_tb_start(TranslationBlock *tb)
     tcg_temp_free_i32(count);
 }
 
-static inline void gen_tb_end(TranslationBlock *tb, int num_insns)
+static inline void gen_tb_end(const TranslationBlock *tb, int num_insns)
 {
     if (tb_cflags(tb) & CF_USE_ICOUNT) {
         /* Update the num_insn immediate parameter now that we know
diff --git a/include/exec/translator.h b/include/exec/translator.h
index 638e1529c5..24232ead41 100644
--- a/include/exec/translator.h
+++ b/include/exec/translator.h
@@ -67,7 +67,7 @@ typedef enum DisasJumpType {
  * Architecture-agnostic disassembly context.
  */
 typedef struct DisasContextBase {
-    TranslationBlock *tb;
+    const TranslationBlock *tb;
     target_ulong pc_first;
     target_ulong pc_next;
     DisasJumpType is_jmp;
diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 5abf17fecc..cbe39a3b95 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -805,7 +805,7 @@ static inline void tcg_gen_insn_start(target_ulong pc, target_ulong a1,
  * be NULL and @idx should be 0.  Otherwise, @tb should be valid and
  * @idx should be one of the TB_EXIT_ values.
  */
-void tcg_gen_exit_tb(TranslationBlock *tb, unsigned idx);
+void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx);
 
 /**
  * tcg_gen_goto_tb() - output goto_tb TCG operation
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index fb1e19c585..a49a794065 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -133,8 +133,8 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     }
 
     /* The disas_log hook may use these values rather than recompute.  */
-    db->tb->size = db->pc_next - db->pc_first;
-    db->tb->icount = db->num_insns;
+    tb->size = db->pc_next - db->pc_first;
+    tb->icount = db->num_insns;
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2e3fdfdf6b..ef63edfc68 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -410,7 +410,7 @@ static inline bool use_goto_tb(DisasContext *s, int n, uint64_t dest)
 
 static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
 {
-    TranslationBlock *tb;
+    const TranslationBlock *tb;
 
     tb = s->base.tb;
     if (use_goto_tb(s, n, dest)) {
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 4b8a473fad..e3dc0cb4cb 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2664,7 +2664,7 @@ void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg)
 
 /* QEMU specific operations.  */
 
-void tcg_gen_exit_tb(TranslationBlock *tb, unsigned idx)
+void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
 {
     uintptr_t val = (uintptr_t)tb + idx;
 
-- 
2.25.1


