Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E67430429
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Oct 2021 20:23:09 +0200 (CEST)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mboKq-0001n3-MF
	for lists+qemu-devel@lfdr.de; Sat, 16 Oct 2021 14:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDW-0008LX-3s
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:35 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mboDR-0001yb-0N
 for qemu-devel@nongnu.org; Sat, 16 Oct 2021 14:15:31 -0400
Received: by mail-pj1-x102f.google.com with SMTP id kk10so9497995pjb.1
 for <qemu-devel@nongnu.org>; Sat, 16 Oct 2021 11:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RDO2b1TAF4ztgLUbPUMoAMU1yhwWU0vJ3YMD4i8Z5ck=;
 b=doB1pcZ0Q73Zg6NG0M8ks0CKrVw3bXNX10FWNGjPB+aEQaan10OrjHcvSrqlu8musq
 zzOUUv0P/zXTzOdtHO9L9VVmaaGMSxMtFnd1Eae8g9gv15DBMN8vXCHg/BNrCGUBVRQ1
 Omk3WLBoiskGu1OsVDeX37geuLmiqk733T1b7/pvIZii+wkuAj9+KsiZiIqJk/tDfopB
 y5r5iMTGCFkmtUkZmrZXr57J0UhP9tYLdUwVZWM67VjywonLNa1q1mH4w8nRWYP8aHyc
 /N4C0AkVPenaZi0gRabTq6PLbjPGCU8VJdntCUfTKvZAPmkDzpwq7n1TEJvhj4G7A4j1
 hY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RDO2b1TAF4ztgLUbPUMoAMU1yhwWU0vJ3YMD4i8Z5ck=;
 b=IIJOjNdpsKMI3G6nhUiUnFtOoPfMmRwwQ+qH1sKt+rUlIVSd15XnTtrRNozYIomtnl
 0VQuhkf7JK2ENiOtFMDXAiFBkBqxYIaHPO1t/EphXuwtCNtoMlfRpDyEOlZWFV6g/ej6
 XpUbLsYJejRI6QgkoJpBwcw1eqdzh49UTwMuBPKbeir7ZD39kH7pMePfcFnsQ6Fu6ftS
 jxg25CPMw7PhDseHQwRfQTJV+VOdZjml4EyjiqYeeoP7wstDuM7NCXdeD7Imm3ykXq72
 krn9ZyIr5zDXX6vGprDoENuXDEbAGUAoBgyvyo+olv34fLkRlTMLW4aojG+so0UQ0xRU
 AEKg==
X-Gm-Message-State: AOAM533HqJi9aZbKY2/JsT7XaDkcea7DBqn1I3ymWl5kK69i3aMGsym2
 eZUODTWugaqsLMY/yx98vTmlxPvoCMhDxQ==
X-Google-Smtp-Source: ABdhPJwnrr+egkWl1COic2AtkYUHUTZf0eyAqTqQDJagfiYNGtax/5griFEGujGjeQyZ/RVQdPH5nA==
X-Received: by 2002:a17:90b:1d8e:: with SMTP id
 pf14mr21696301pjb.125.1634408127429; 
 Sat, 16 Oct 2021 11:15:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm5075097pjb.2.2021.10.16.11.15.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 11:15:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/24] target/microblaze: Drop checks for singlestep_enabled
Date: Sat, 16 Oct 2021 11:15:02 -0700
Message-Id: <20211016181514.3165661-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016181514.3165661-1-richard.henderson@linaro.org>
References: <20211016181514.3165661-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7e465b629a..437bbed6d6 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -126,12 +126,7 @@ static void gen_raise_hw_excp(DisasContext *dc, uint32_t esr_ec)
 
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
-    if (dc->base.singlestep_enabled) {
-        TCGv_i32 tmp = tcg_const_i32(EXCP_DEBUG);
-        tcg_gen_movi_i32(cpu_pc, dest);
-        gen_helper_raise_exception(cpu_env, tmp);
-        tcg_temp_free_i32(tmp);
-    } else if (translator_use_goto_tb(&dc->base, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(dc->base.tb, n);
@@ -1807,12 +1802,7 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
         /* Indirect jump (or direct jump w/ goto_tb disabled) */
         tcg_gen_mov_i32(cpu_pc, cpu_btarget);
         tcg_gen_discard_i32(cpu_btarget);
-
-        if (unlikely(cs->singlestep_enabled)) {
-            gen_raise_exception(dc, EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
         return;
 
     default:
-- 
2.25.1


