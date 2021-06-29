Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 037CD3B789F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:29:19 +0200 (CEST)
Received: from localhost ([::1]:47850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJQ5-0007Z5-VF
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItB-00082s-Pb
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:17 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:39680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIt0-0000sN-8f
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:17 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso2259761pjb.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FrwBhDQCYCaJpwhSjdhf5fz+by0Enz353wq4Nv/2fq8=;
 b=xR2fVcSdD4e5r70xErdBfEGnpO63HV70xfraA6+n/GTVW7wdxdigqe3TEo6vCJkUFc
 H8vpcWRgOnFkecA92lUlVRN3G86du/xi31XMi6pexQQZnlDFgu4pQjNkDU2bAemrRNd9
 CXseCEGS4HjAn19/9icakwRV06t1exqp69zZfHaM1oqOUXLPi7sNFRZt/cmNYhNsLX71
 ctoFPygXxwc29tqqAVwjB90MaUiy//tVTyMLPm5xc3LLS1PpK4Iereg6YxwngNW6DtrK
 xRv4qhxlprj+W49Hb5gWa2J6dt6+0RX8kbYdZD2Qsy5ot/iLslOO9crqNqfcMSDh39YV
 6++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FrwBhDQCYCaJpwhSjdhf5fz+by0Enz353wq4Nv/2fq8=;
 b=cLsJJjWyXQ6lMOgZowMXcbxvcgipixkN52hii0Z8OVJI+7Cuio/ZOj9o67dA3HbSLP
 eoBQ7GbKvCR5DYHaNPe66237t7jyoHgx9gHt06lgaifRlzjcMDsz22MqrdFDHegT9HH0
 DEKlGR24ZOu/HA/HWEjAsn5ihESmudRa3enFqxG0+EnIb5XZbPsfp0H1lR2pkvET/NKJ
 q74yXk8MQJ5eFRi14zZo2CcyMOrr7fDRTQKBbDonT5EgMKNKmndyjxBwmPx/XbDP3lmt
 H24OM4l4QuLU6pGZ4uB2P18GIuETJ1FE9FeiavONDLYa/f1ck8LfCXesclqxUhvcTeyN
 xzkA==
X-Gm-Message-State: AOAM530smYrrfcFHbqKRgNEVOAyc6kWUP8nSFxywO8w0rM9G4uS2po5G
 CzrUl8Wucmxmwsi/9mNy+wg1XpFQT66X7w==
X-Google-Smtp-Source: ABdhPJz7YJtNKphk6lW6HDseHngaIiEr0pzSQhZEudMpi2HJxnuGxh5FBO5iVhIGaJsnkNC8rXnArQ==
X-Received: by 2002:a17:90a:5202:: with SMTP id
 v2mr29064848pjh.169.1624992901224; 
 Tue, 29 Jun 2021 11:55:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/63] target/nios2: Use pc_next for pc + 4
Date: Tue, 29 Jun 2021 11:54:01 -0700
Message-Id: <20210629185455.3131172-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have pre-computed the next instruction address into
dc->base.pc_next, so we might as well use it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index abc7e5f96a..930f3d3395 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -211,7 +211,7 @@ static void jmpi(DisasContext *dc, uint32_t code, uint32_t flags)
 
 static void call(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->pc + 4);
+    tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
     jmpi(dc, code, flags);
 }
 
@@ -265,7 +265,7 @@ static void br(DisasContext *dc, uint32_t code, uint32_t flags)
 {
     I_TYPE(instr, code);
 
-    gen_goto_tb(dc, 0, dc->pc + 4 + (instr.imm16.s & -4));
+    gen_goto_tb(dc, 0, dc->base.pc_next + (instr.imm16.s & -4));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -275,9 +275,9 @@ static void gen_bxx(DisasContext *dc, uint32_t code, uint32_t flags)
 
     TCGLabel *l1 = gen_new_label();
     tcg_gen_brcond_tl(flags, cpu_R[instr.a], cpu_R[instr.b], l1);
-    gen_goto_tb(dc, 0, dc->pc + 4);
+    gen_goto_tb(dc, 0, dc->base.pc_next);
     gen_set_label(l1);
-    gen_goto_tb(dc, 1, dc->pc + 4 + (instr.imm16.s & -4));
+    gen_goto_tb(dc, 1, dc->base.pc_next + (instr.imm16.s & -4));
     dc->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -435,7 +435,7 @@ static void nextpc(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     if (likely(instr.c != R_ZERO)) {
-        tcg_gen_movi_tl(cpu_R[instr.c], dc->pc + 4);
+        tcg_gen_movi_tl(cpu_R[instr.c], dc->base.pc_next);
     }
 }
 
@@ -448,7 +448,7 @@ static void callr(DisasContext *dc, uint32_t code, uint32_t flags)
     R_TYPE(instr, code);
 
     tcg_gen_mov_tl(cpu_R[R_PC], load_gpr(dc, instr.a));
-    tcg_gen_movi_tl(cpu_R[R_RA], dc->pc + 4);
+    tcg_gen_movi_tl(cpu_R[R_RA], dc->base.pc_next);
 
     dc->base.is_jmp = DISAS_JUMP;
 }
-- 
2.25.1


