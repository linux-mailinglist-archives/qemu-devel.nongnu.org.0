Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC00E69FF7A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:29:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWm-0000o5-Sd; Wed, 22 Feb 2023 18:28:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWg-0000WO-NM
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:55 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWe-0005NL-SY
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:54 -0500
Received: by mail-pl1-x630.google.com with SMTP id u14so6869118ple.7
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKCOLyI/wsJHJKYRWjsEmHI6WWtv0JONwA4WRgdn8Pc=;
 b=tbglN6qL39a3ROzjXO7aju97Yzb585ukPql28mI5X+Byjy0KWNkg+qeXN9U34eEj03
 vlf26q+EgywpOaUyyeU5vYfpOTFViUpFt2GFvVcJ1wXgUyIOpDpv7pjd78hAUFM5G+2f
 lFdRJ7dhxo+CyMWIdJz/mvyOhPhj57TrJmlqUEIqaPLy0yYtltG0vQeNdD2m9Oof1U+z
 OE/yW7k18tb29Yd494Pm2CqZoFZnDjcxOQYe4TM5+295f5LA6A9veDxlUwLWf/g5hIj9
 gW3lgp9wyMumIHnv/60ZzVUmWIziRIJFBnEtFEufSaBgZ3dQ4bhOGW8SXCiQFIrrs9py
 5qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKCOLyI/wsJHJKYRWjsEmHI6WWtv0JONwA4WRgdn8Pc=;
 b=JFc5LfPd6vcGRUxQXtXwiovOom+BRvxO3Vz28tVo+ECFLSUu0RBDUAXbpuXKR1jPjd
 omxhdpCvknkkWW+SUvPTAo3J8vMCldYgqDw4E9qoKt6NZNzwrUMKG/8oMr0kxubAdZHs
 qJJ62XMMrRWIbMP2gv61nAxxq8vf02Mido0fIne1STkKf3+ryTfFs8Eo1Mz3jdricKGw
 ko+U7uKdiD613q8/VulimosuK9rdfk/q7cjYqjmNDHZhHBKAHkK0XCXcexTkjDgazltK
 GNVq5LMHF1uDRtb55WAgJM4EahGeGLEk/LVr6p/klHJz3tIQnYaUKk8ldIhjqLIupmLh
 KVqw==
X-Gm-Message-State: AO0yUKXCfuvPKpxKGpWpv3egYC7Snl9BTpibvxYg6K84T5V//DzIMWJ4
 OgsDM/+4csNdRUT+l7VokAm3lThnZVZsTWWmg84=
X-Google-Smtp-Source: AK7set/wuDcLmn0dECAO/UOLf2KVOT4DuD6h1g4s/ytgiwIdLsKFX3gzyFyHP1YC4SHWtqW4bRTIAg==
X-Received: by 2002:a17:90b:4a4d:b0:234:148:4b27 with SMTP id
 lb13-20020a17090b4a4d00b0023401484b27mr12637339pjb.17.1677108472137; 
 Wed, 22 Feb 2023 15:27:52 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 24/28] target/xtensa: Don't use tcg_temp_local_new_*
Date: Wed, 22 Feb 2023 13:27:11 -1000
Message-Id: <20230222232715.15034-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


