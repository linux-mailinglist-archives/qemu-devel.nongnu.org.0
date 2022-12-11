Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB96494DA
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:31:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OFt-0006TI-R3; Sun, 11 Dec 2022 10:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFm-0006Pr-PD
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:34 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFf-0007YF-S1
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:34 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 m6-20020a9d7e86000000b0066ec505ae93so5830764otp.9
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eHRilwMZdGux1mMQrrcCyZM7FyweWHMuqYamGhTtaNE=;
 b=YsJyGK2OcvrRZgby+DNpi/NYWNZ5iNb2um2AdTxxz1/CG85MCmRa5+bvkdxyyLiGi1
 Hv6jhNVc2KewIOHf9u3pcZRpIMTbk7ZOyHu06dU2e7ix+2P9iePe1j9FxidQiOmDo9pg
 TYMOEY0AZ7EeVgKYk1RI1kSx0NwQfB9g3algsQpd8gEVYr50+K4B8xYX6gRpL6P5BoVU
 X85Bwc7FWw3sj5+qhoITZU62LWwp5Kcr2ucfCAdOqw4+4QQjWMDzNQ8CTJ6xJtCmrIKv
 GBj1psQE8cZeenNIjQMpBz6PKmp1P6lXTWclJ8ZcheABBtDrfQvlFkWbqKzYkQJ1gM+n
 u+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eHRilwMZdGux1mMQrrcCyZM7FyweWHMuqYamGhTtaNE=;
 b=hJGzwNd3y1B2q5hxrxjZE1YRBuuGTaI3WUn4b6demsETeep4VL9MOV8m7bUvX+XUsv
 2Ono2DQq+/3Gd56fUhTXCcgUoMCo4EScg2Kpnc3GgMy1OYYeCRGVKalNUlgtvZEnVGgp
 mvsgR1cvzB4YY7Y+sKA4EAmF1rYQQknp2YLNGWVdLjSfcyuRjb5A6FFwTmQzNeo0zAse
 qxblpoDwkpeP2XC+INv0Qaxl7QNI4kiaq490lY4zj1oVMqvl0SAJmhKOWsiqg6mOKViI
 sP/FCISXeaghmzLj5VETRjtbuMvoPk4OUAlNceWwz/sguJQntuumcEkdTPbh0MbQmfP6
 r+Ww==
X-Gm-Message-State: ANoB5pm9Rl89pveoidsHfEHR9hCGPF3JDG6fWCvs1u9SliycAZbqSUQJ
 xe+iz8O9RqQ2fZGLcSCO74WB00c68YeQr2QzvC8=
X-Google-Smtp-Source: AA0mqf4hmH7WV7B6TnwTt/KlDMot1k9nSjiOT5tvDGfoOGpuXUdL4/ug0Bs5Sldde12Ni6olbgS1ng==
X-Received: by 2002:a9d:7699:0:b0:661:dfe6:9732 with SMTP id
 j25-20020a9d7699000000b00661dfe69732mr5648803otl.1.1670772499197; 
 Sun, 11 Dec 2022 07:28:19 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 12/27] target/s390x: Use gen_psw_addr_disp in op_sam
Date: Sun, 11 Dec 2022 09:27:47 -0600
Message-Id: <20221211152802.923900-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221211152802.923900-1-richard.henderson@linaro.org>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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

Complicated because we may now require a runtime jump.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 40 +++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index b317767a7d..96bd37426f 100644
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


