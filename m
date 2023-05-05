Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B99C6F8B0A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:29:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2yQ-0006i0-TL; Fri, 05 May 2023 17:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2yO-0006b9-O7
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:28:16 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2yL-0005SB-3t
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:28:16 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so22986605e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683322091; x=1685914091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rivgwXGbdDw6Y7e7EyPZeewGUUT+LzpYCC2kVwog6co=;
 b=MGcPSU05QSoaIJeE+CcKiV4dDlK+PgptfX5wel1q8uEr8SuYXvgAXyCqGTE52WmMmK
 dc+urEssY27vwZ50bsLihJ2Rz4Bh3SAeH0P1pjKC/0FW5jiJNSGQ+Xedc8iRlNsef3BD
 YB4bRiRJJQ0JboU97YZfSYSCD/U1olf1dFRtjVdwiL9tJOngs1++fVH2k65yadBlXVgE
 tWOy+EfwgCL5X2jUssN0rO9r1ih4V29JYf0GCZvWIoW2VE92T5rujQGRYw5N1SNO36F4
 9haMPMZJ7nC+otA9oTnkzC1YXyCnPMqzi9Hq1zGVFlJfHupRX2Q6mNIHotpnNDiAiA23
 D2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683322091; x=1685914091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rivgwXGbdDw6Y7e7EyPZeewGUUT+LzpYCC2kVwog6co=;
 b=bgeBdluRHR60Dv/NwU+8VRYoTrX6o4vgEfP3kF7TRa/jxi3PyMYOZVUgejPwwFItlS
 7S1iYhUdyRPLe2VufTWKC3jLFfc1m7ZxmZAqV5u0RcUtONTDGDwupKydvPffx0wWpnnl
 9hqf44zrnt4g+4HJCkx5piNq6X3Z5I0BgNtiZ8Tz6AnjX3761v+iG1ltjbdzBzTWA1u/
 kODYrY74GbdpIXaiCBsTb5ZdlQ8FauhPUwxLypBoR1l3GH6VaOo/pzCPYrvHGKypKqe/
 MVpj3YUV/Vhact3X504TXH5yvOP3EDHYAlIVT243soEyKsiEP16t6iYyc3WTZ0VtHgY2
 fqgA==
X-Gm-Message-State: AC+VfDzMPAGz2Xnqy7wCy2FmeDCb/eR6j4hGSWVlzKuR/qkMvibLH00t
 wpcTAwAwMckjVoWBR+scndPP3zNtf4pp0AH45cHWDA==
X-Google-Smtp-Source: ACHHUZ5/MYFhXBsZ2uJdWqP4DmT9btEI4hLXO7+D4GoQ8sn3fXYoiePax9bM3Y6qleVmwD7IjYtnNQ==
X-Received: by 2002:a7b:cc05:0:b0:3f1:7581:eaaf with SMTP id
 f5-20020a7bcc05000000b003f17581eaafmr2066801wmh.4.1683322091644; 
 Fri, 05 May 2023 14:28:11 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c220a00b003f171234a08sm9009001wml.20.2023.05.05.14.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:28:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 40/42] tcg: Replace REG_P with arg_loc_reg_p
Date: Fri,  5 May 2023 22:24:45 +0100
Message-Id: <20230505212447.374546-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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


