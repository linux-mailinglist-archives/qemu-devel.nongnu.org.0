Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7307681C30
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:03:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGS-0000Si-Mv; Mon, 30 Jan 2023 16:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGH-0000Ag-Sh
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:21 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGG-0005FZ-1H
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:21 -0500
Received: by mail-pg1-x52f.google.com with SMTP id e10so8575304pgc.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k+RB2lzG1WSTf4vy/OZmWeI3pkurVycFuFuWqjGN6Hk=;
 b=mipyR8MAE2rwJMt3/pbkOxkTejWJkDZCF2KuY0yhVsc2sLCXIeYLc/m6yhhQDPDfBP
 0LDqNB+5JS+WUtJshPdyeO8fTuSuVKTbbdG6XA9Khk4aoqudaUuM53so/vbIB98NBdPW
 OG2AaVzX1HfLZExXN2gKsAevXY3F7cXoH4L3Ud6mZ4f5C/leWlpPxXORc2+0Y2bIjHeV
 X8c8wumMNvXjEtk31+FjTdwMsfBwdz6CovC/IQzZLDG8Gal34QkjBDN71HWSuq6rHWIy
 xC3fnSnVjeFcSfFAZi8fsRkcOV6DgrTGXel4XQI9Q1fl0PYb6sIIxlPAgeMulqaSCsp+
 ZxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k+RB2lzG1WSTf4vy/OZmWeI3pkurVycFuFuWqjGN6Hk=;
 b=CAg/rHid/W6cl8mgXBwvfE4wYXDz4qhu8wSbLFFJyWC2LyWg/tFiCun5I4qwIpRz8m
 trVf9vqQ4laIlRRygiwvVQ3xlSsjx892e9LK/l5OsQ5Cpq5KVILyNUWH2Xk1mbyEpJTK
 mw3PJ8m7D4DyWN9vd9KZhILpdMTyM6OeSDeHNUQ3KPpiFN4gxeVwEGQynxeqPYUeD0/J
 FA69lwKuDIe4A/apccWTMHRpkbDSfgwf6jGjIM++SUWDGscG7e8nbTcGccaY4n6raBO3
 f82F5KFTslfXu3E56D2ddEQDyYfxRpUfmEk+yIdLv6dK3OCLT9QuBWFrdE48YRBTtIcy
 rbtg==
X-Gm-Message-State: AO0yUKW2hCJAxq7UdlLZ7wQq6Z/Sm8ZCJbJrtsfNlSRT0HpqOig39KqQ
 uUsR1bkWNS3/U+uKUjLDaZK+t4Z45dv12YO0
X-Google-Smtp-Source: AK7set9w1Nh1Ykrxz0rgzw0OsrWtz//amQSZaKaH+eycX744PXaLh6CUWe6LJ/AbbgLhhz9woeQ8Sw==
X-Received: by 2002:a62:84d8:0:b0:592:613d:ef17 with SMTP id
 k207-20020a6284d8000000b00592613def17mr10479907pfd.30.1675112419240; 
 Mon, 30 Jan 2023 13:00:19 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 24/27] target/xtensa: Don't use tcg_temp_local_new_*
Date: Mon, 30 Jan 2023 10:59:32 -1000
Message-Id: <20230130205935.1157347-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Since tcg_temp_new_* is now identical, use those.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 8d7bf566de..4af0650deb 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -307,7 +307,7 @@ static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
 static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 {
     if (!dc->sar_m32_allocated) {
-        dc->sar_m32 = tcg_temp_local_new_i32();
+        dc->sar_m32 = tcg_temp_new_i32();
         dc->sar_m32_allocated = true;
     }
     tcg_gen_andi_i32(dc->sar_m32, sa, 0x1f);
@@ -1074,10 +1074,10 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
             if (i == 0 || arg_copy[i].resource != resource) {
                 resource = arg_copy[i].resource;
                 if (arg_copy[i].arg->num_bits <= 32) {
-                    temp = tcg_temp_local_new_i32();
+                    temp = tcg_temp_new_i32();
                     tcg_gen_mov_i32(temp, arg_copy[i].arg->in);
                 } else if (arg_copy[i].arg->num_bits <= 64) {
-                    temp = tcg_temp_local_new_i64();
+                    temp = tcg_temp_new_i64();
                     tcg_gen_mov_i64(temp, arg_copy[i].arg->in);
                 } else {
                     g_assert_not_reached();
@@ -1187,7 +1187,7 @@ static void xtensa_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     if (dc->icount) {
-        dc->next_icount = tcg_temp_local_new_i32();
+        dc->next_icount = tcg_temp_new_i32();
     }
 }
 
@@ -2273,8 +2273,8 @@ static void gen_check_atomctl(DisasContext *dc, TCGv_i32 addr)
 static void translate_s32c1i(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_temp_local_new_i32();
-    TCGv_i32 addr = tcg_temp_local_new_i32();
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    TCGv_i32 addr = tcg_temp_new_i32();
     MemOp mop;
 
     tcg_gen_mov_i32(tmp, arg[0].in);
@@ -2303,8 +2303,8 @@ static void translate_s32ex(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
     TCGv_i32 prev = tcg_temp_new_i32();
-    TCGv_i32 addr = tcg_temp_local_new_i32();
-    TCGv_i32 res = tcg_temp_local_new_i32();
+    TCGv_i32 addr = tcg_temp_new_i32();
+    TCGv_i32 res = tcg_temp_new_i32();
     TCGLabel *label = gen_new_label();
     MemOp mop;
 
-- 
2.34.1


