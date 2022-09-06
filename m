Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A070D5AE637
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:11:08 +0200 (CEST)
Received: from localhost ([::1]:42684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWTz-00087p-9j
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVee-0003MM-N6
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:05 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVea-0005E7-5Q
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:18:01 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t14so7410168wrx.8
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=cdk+wqhXrtt2egBbh65dqBvCP5p2fyN7igj25PdmOsY=;
 b=YQ2FnWmYERBm5Kjv0FE5rJVHwZXKunJUCGswsaGc3otUpHaKGz1Ex7AYTDp9h+cIZZ
 FcSAd0RThB/5NlZqnilv/Hyh315LJyKjGRrF0rwBm0Kt2VfYhHtcH6houkUNriSWBbJi
 SpJEaqtZPN8OrZxH8TEBkWSRYH4bUsXnpQyP/pTqefhO8CJcKI+mOQaNm5H/x6657iwS
 tOGdk1IsTLBo3YipNm+Zh2E/Nl/UkOVFVuw+ieouMK9WEt/viUJSAsB3CGFel2K5cfdT
 lvP7Cf3lPoFVs/6KE0jn9hNT0yO4Y/5xasajUpcK/nOZdB8Ho+hvHjxMiLYSMw8SrRyI
 DPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=cdk+wqhXrtt2egBbh65dqBvCP5p2fyN7igj25PdmOsY=;
 b=F18A5b/8LoO1i3a+/quLde1E/TMHdIcALRTQSB8bR8ktjsVqAYChKyqSRgl8ct/LcI
 spVxPReIcJhHAtH7/qg4qr6Ak7iHVvCpfKrJdiHu3Fymk9iW5T7gIdUK5tzHjv5yjqL3
 CSSSfnWt2Lt3I6VoasvLl0E6K7o6l4guX24YedjhxAfQwqAyJJwfyiEzq66vuU5ADq4n
 WnxO78vPQy7crcpSz2YL+gJxis1uvFj+mmYcFEMQKWhB6PL99hQf24GZlKmK6DCi1aM6
 HbO1pgfkZwVL9vM4VO0PjrfmnZbi/SpNo9KZlcSS9ve9ZLvOmfCqyyPw3hhPcr8H48DU
 jfww==
X-Gm-Message-State: ACgBeo3VXjbQtGkn7xEkd8okAKib7rZ7vo/udOhXKtsNV9oGxFvG39EW
 AhrGpN5IvvOwBee2s/JdJ01tKKOELhw9qhyf
X-Google-Smtp-Source: AA6agR4JprAQ2YDLeHl92biuAq9wAczmXA+0sqyjn+4jzbJWR+mLZaeEJXT18qIoGlS1S9eew3lEDw==
X-Received: by 2002:a05:6000:2c1:b0:226:e816:b6a4 with SMTP id
 o1-20020a05600002c100b00226e816b6a4mr18700680wry.330.1662459478742; 
 Tue, 06 Sep 2022 03:17:58 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c365000b003a62bc1735asm14094361wmq.9.2022.09.06.03.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:17:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v1 10/26] target/s390x: Use gen_psw_addr_disp in op_sam
Date: Tue,  6 Sep 2022 11:17:31 +0100
Message-Id: <20220906101747.344559-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906101747.344559-1-richard.henderson@linaro.org>
References: <20220906101747.344559-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Complicated because we may now require a runtime jump.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 40 +++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index ad73a64b05..2ea3feb803 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -3922,7 +3922,7 @@ static DisasJumpType op_sacf(DisasContext *s, DisasOps *o)
 static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
 {
     int sam = s->insn->data;
-    TCGv_i64 tsam;
+    TCGLabel *fault = NULL;
     uint64_t mask;
 
     switch (sam) {
@@ -3937,20 +3937,36 @@ static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
         break;
     }
 
-    /* Bizarre but true, we check the address of the current insn for the
-       specification exception, not the next to be executed.  Thus the PoO
-       documents that Bad Things Happen two bytes before the end.  */
-    if (s->base.pc_next & ~mask) {
-        gen_program_exception(s, PGM_SPECIFICATION);
-        return DISAS_NORETURN;
-    }
-    s->pc_tmp &= mask;
+    /*
+     * Bizarre but true, we check the address of the current insn for the
+     * specification exception, not the next to be executed.  Thus the PoO
+     * documents that Bad Things Happen two bytes before the end.
+     */
+    if (mask != -1) {
+        TCGv_i64 t = tcg_temp_new_i64();
+        fault = gen_new_label();
 
-    tsam = tcg_constant_i64(sam);
-    tcg_gen_deposit_i64(psw_mask, psw_mask, tsam, 31, 2);
+        gen_psw_addr_disp(s, t, 0);
+        tcg_gen_andi_i64(t, t, ~mask);
+        tcg_gen_brcondi_i64(TCG_COND_NE, t, 0, fault);
+        tcg_temp_free_i64(t);
+    }
+
+    update_cc_op(s);
+
+    tcg_gen_deposit_i64(psw_mask, psw_mask, tcg_constant_i64(sam), 31, 2);
+
+    gen_psw_addr_disp(s, psw_addr, s->ilen);
+    tcg_gen_andi_i64(psw_addr, psw_addr, mask);
 
     /* Always exit the TB, since we (may have) changed execution mode.  */
-    return DISAS_TOO_MANY;
+    tcg_gen_lookup_and_goto_ptr();
+
+    if (mask != -1) {
+        gen_set_label(fault);
+        gen_program_exception(s, PGM_SPECIFICATION);
+    }
+    return DISAS_NORETURN;
 }
 
 static DisasJumpType op_sar(DisasContext *s, DisasOps *o)
-- 
2.34.1


