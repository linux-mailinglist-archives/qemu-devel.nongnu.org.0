Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A76EC5B7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 07:55:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqozs-0004iI-4u; Mon, 24 Apr 2023 01:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqoy0-00068p-N5
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqox8-0004Ti-Rx
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 01:42:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f20215fa70so5448235e9.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 22:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682314886; x=1684906886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rivgwXGbdDw6Y7e7EyPZeewGUUT+LzpYCC2kVwog6co=;
 b=uOJKiDEvkBKEwih1nhZNMYX82dd8aDiK69SCv/lu7yB1yxDA0RhK3lvgDBElLsZ8/K
 zfclDNYH+117lcoUDbu+U4qvw6eYJ4QJvh5Sv5iHpITCsHewlrX8ziel/e2Am2ME6RhG
 qtwubLutUbOYEcFwZJoQEEfVXCZVkNSF3zMvM6HkwhrmbYaOVSCI3uEd3XQYyQ0SZbB4
 VD6GbOCvXUOIT+1XVGA3djmWkEUGGXWarKI0zeAkX8OvMTg4fAs9N26M0HqzyYk/tpPM
 lcPkFdQsQ95wye+BLBqEW5TtzLAD+9ufTV+oIX/0wcrTPCyBAnwxoJ7CKME2BzhQZzF5
 UNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682314886; x=1684906886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rivgwXGbdDw6Y7e7EyPZeewGUUT+LzpYCC2kVwog6co=;
 b=UqrS6SeFX+wl0mxsw/kj36VihjR5GeUSsdBt2HV0U2MfLlk/NXQoBEH7Zhp5kE3ejK
 V9BxEaZl2CAHGpUuEJRhDy87Bm9E54rIwXbbINC+yNH32IFQ8jRVkPsSR/imxEOqyDJe
 fpNMPia4gkigvfav68TuWaD/9KSDHOHAiyMBgu1m3fNGu4ZIMDgK6b8CGvWV3kECrCKD
 E/boamsPXIv7krBAhMMtIVKt4b5ss9FvQc4bkuknFh5Bucs2cjdQKdiS6m5r8sGKeDaz
 tB0sU3wFl6mGRS7qrPG5dZ+toUZakU0bHkuUw/zBRAN+PfJ6lYmgrjVHmu6a/mdf7jtY
 PsQA==
X-Gm-Message-State: AAQBX9cTsEJeUJfsmoIFahKjjhe3m79vTT0Yp7d0BO9KtwBFz3Y5LnL3
 inmBkRfrqK6yBqZpgMXrIlK45DhDrHKIp1xH3xybNw==
X-Google-Smtp-Source: AKy350YoUkB58jfT7Id2gOJnGmcPblao0NvaphX2b2xxPshVSHE7Z8USpXrvKe9SBVf1t5PzRpDdSA==
X-Received: by 2002:a5d:5004:0:b0:2f8:7cac:101a with SMTP id
 e4-20020a5d5004000000b002f87cac101amr7426268wrt.41.1682314886712; 
 Sun, 23 Apr 2023 22:41:26 -0700 (PDT)
Received: from stoup.c.hoisthospitality.com
 (cust-west-loneq8-46-193-226-34.wb.wifirst.net. [46.193.226.34])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d6e56000000b002fbb285b01fsm9997852wrz.25.2023.04.23.22.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 22:41:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 35/57] tcg: Replace REG_P with arg_loc_reg_p
Date: Mon, 24 Apr 2023 06:40:43 +0100
Message-Id: <20230424054105.1579315-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424054105.1579315-1-richard.henderson@linaro.org>
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

An inline function is safer than a macro, and REG_P
was rather too generic.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  4 ----
 tcg/tcg.c          | 16 +++++++++++++---
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index e542a4e9b7..0f1ba01a9a 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -58,10 +58,6 @@ typedef struct TCGCallArgumentLoc {
     unsigned tmp_subindex       : 2;
 } TCGCallArgumentLoc;
 
-/* Avoid "unsigned < 0 is always false" Werror, when iarg_regs is empty. */
-#define REG_P(L) \
-    ((int)(L)->arg_slot < (int)ARRAY_SIZE(tcg_target_call_iarg_regs))
-
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6f5daaee5f..fa28db0188 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -806,6 +806,16 @@ static void init_ffi_layouts(void)
 }
 #endif /* CONFIG_TCG_INTERPRETER */
 
+static inline bool arg_slot_reg_p(unsigned arg_slot)
+{
+    /*
+     * Split the sizeof away from the comparison to avoid Werror from
+     * "unsigned < 0 is always false", when iarg_regs is empty.
+     */
+    unsigned nreg = ARRAY_SIZE(tcg_target_call_iarg_regs);
+    return arg_slot < nreg;
+}
+
 typedef struct TCGCumulativeArgs {
     int arg_idx;                /* tcg_gen_callN args[] */
     int info_in_idx;            /* TCGHelperInfo in[] */
@@ -3231,7 +3241,7 @@ liveness_pass_1(TCGContext *s)
                         case TCG_CALL_ARG_NORMAL:
                         case TCG_CALL_ARG_EXTEND_U:
                         case TCG_CALL_ARG_EXTEND_S:
-                            if (REG_P(loc)) {
+                            if (arg_slot_reg_p(loc->arg_slot)) {
                                 *la_temp_pref(ts) = 0;
                                 break;
                             }
@@ -3258,7 +3268,7 @@ liveness_pass_1(TCGContext *s)
                     case TCG_CALL_ARG_NORMAL:
                     case TCG_CALL_ARG_EXTEND_U:
                     case TCG_CALL_ARG_EXTEND_S:
-                        if (REG_P(loc)) {
+                        if (arg_slot_reg_p(loc->arg_slot)) {
                             tcg_regset_set_reg(*la_temp_pref(ts),
                                 tcg_target_call_iarg_regs[loc->arg_slot]);
                         }
@@ -4833,7 +4843,7 @@ static void load_arg_stk(TCGContext *s, int stk_slot, TCGTemp *ts,
 static void load_arg_normal(TCGContext *s, const TCGCallArgumentLoc *l,
                             TCGTemp *ts, TCGRegSet *allocated_regs)
 {
-    if (REG_P(l)) {
+    if (arg_slot_reg_p(l->arg_slot)) {
         TCGReg reg = tcg_target_call_iarg_regs[l->arg_slot];
         load_arg_reg(s, reg, ts, *allocated_regs);
         tcg_regset_set_reg(*allocated_regs, reg);
-- 
2.34.1


