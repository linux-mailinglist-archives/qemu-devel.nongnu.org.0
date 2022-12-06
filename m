Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8408C643C30
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:22:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POg-0003MB-KO; Mon, 05 Dec 2022 23:17:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POb-0003LV-Ek
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:29 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POX-0006w2-LE
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:28 -0500
Received: by mail-oi1-x231.google.com with SMTP id r11so9875394oie.13
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=20ZbmANpsxjH51EZqy28mmD7yN/n0IpPmu7xMiVxfng=;
 b=ZpTUFOg1a5TDtdktbLIGnWzLi7tNkldpbUpitZitmYPh2HvfOaDAosz8ju5g0t3b9u
 gE/6IBosOZ87X0h1b8hYbN3lLi3UKpVaS6BKLBz2m8hh+x09Z36go0GSxM54THMbG8TA
 0Om3MdJz8aD9gD2ME2UGUZOl7uPfMPDDs1iag2VUf7e+1oLLPp2qe/g6oFck/2MBNEVh
 GhmWPU8kkJY17b0m5PYaUuvGGNz6FuYisIGnIo9wabn7Ju4SehPsUVv1xaKm0r+SU3s8
 PZ/oHb0KUsTSM6XqLjbNHY+/oeVdfwGU8xACoYGH9LHLHu02aN8bNbMphv/O2f3M2SXY
 /Tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=20ZbmANpsxjH51EZqy28mmD7yN/n0IpPmu7xMiVxfng=;
 b=KoPb0nEelUZ9pE7KRnqOJR4sYWfLqMvKhPYjUhq/8KfL5/hH7IvxSvaLKMdyB0S+qu
 YiD8QZy4DEIPOOH3gFQ0VFWF7MKtTHY9y5TGkzb00sSygYaGm2Fax1ad6r0vMovb+XVP
 EuXxfSTj5Q97PgmQ0fPPdVnYvQEVlFuAQTJxV04tXAsIkADEpNC+KjDVWTCnuuXy2Yon
 Wg/33+eLvbBE44BTI0fhZwpefIIsN5IX2HsKaEboT+9QnF02g9aiLw3HVaNM6a8rYSRR
 ydEYyCNCaI6LPhTqQhPlZJayIYnMOX8693+obs2dMG64JD6fujgEuQnhZpwRKTXtSoRR
 xsQw==
X-Gm-Message-State: ANoB5pknEeTVEi7DZrjDK1j4HsQjRIfvs/rwwpzIV/VEUEaRM8fNjR+W
 msY98kutFEKO0RPiEIqI3tAVaN8NM4xnu4FI2eo=
X-Google-Smtp-Source: AA0mqf4zi0wAh7tfS8ZWHAxOrMm63Yav0t1AffnupjtkMjMj33U7ph48vLyM09CHzMdj4/QrVMBlVw==
X-Received: by 2002:a05:6808:189d:b0:35a:ec1:8350 with SMTP id
 bi29-20020a056808189d00b0035a0ec18350mr34868426oib.71.1670300242405; 
 Mon, 05 Dec 2022 20:17:22 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 03/22] tcg/ppc: Remove unused goto_tb code for indirect jump
Date: Mon,  5 Dec 2022 22:16:56 -0600
Message-Id: <20221206041715.314209-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
---
 tcg/ppc/tcg-target.c.inc | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 186599dae0..3f9ee4b39a 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2630,27 +2630,21 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     switch (opc) {
     case INDEX_op_goto_tb:
-        if (s->tb_jmp_insn_offset) {
-            /* Direct jump. */
-            if (TCG_TARGET_REG_BITS == 64) {
-                /* Ensure the next insns are 8 or 16-byte aligned. */
-                while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
-                    tcg_out32(s, NOP);
-                }
-                s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
-                tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-                tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
-            } else {
-                s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
-                tcg_out32(s, B);
-                s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
-                break;
+        qemu_build_assert(TCG_TARGET_HAS_direct_jump);
+        /* Direct jump. */
+        if (TCG_TARGET_REG_BITS == 64) {
+            /* Ensure the next insns are 8 or 16-byte aligned. */
+            while ((uintptr_t)s->code_ptr & (have_isa_2_07 ? 15 : 7)) {
+                tcg_out32(s, NOP);
             }
+            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
+            tcg_out32(s, ADDIS | TAI(TCG_REG_TB, TCG_REG_TB, 0));
+            tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, 0));
         } else {
-            /* Indirect jump. */
-            tcg_debug_assert(s->tb_jmp_insn_offset == NULL);
-            tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TB, 0,
-                       (intptr_t)(s->tb_jmp_insn_offset + args[0]));
+            s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
+            tcg_out32(s, B);
+            s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
+            break;
         }
         tcg_out32(s, MTSPR | RS(TCG_REG_TB) | CTR);
         tcg_out32(s, BCCTR | BO_ALWAYS);
-- 
2.34.1


