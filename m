Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99FA5104F6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:11:09 +0200 (CEST)
Received: from localhost ([::1]:47840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOiS-0000xk-Uo
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5z-00039M-N1
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:27 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:39926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-0003ur-L2
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:20 -0400
Received: by mail-pl1-x632.google.com with SMTP id c12so30706765plr.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RL/cU2KUkEBT0HxlomYcXgHotXYUZUNOdsb4bQKVOHY=;
 b=J7CfEZwAfA1qRCxGxFPfcN1NZtL9btEfZ2Lnu1hHgQwVtF0GZ7r3nifDPBTDaghS6E
 6BDAEwpuhkFuHvAYpohxLWirUwlRf9HdEulHacnbhz8LEtm0BuZvwZFJgPjga2d50N3R
 cp1SDJU4NvdqZ/YytvYXW1G7ExqF3e0dsHrH4bQ6c0VSrs9n84V1keajMvCZnSmPvYqv
 I8gD1V8SiFQ7tXqY8K1NaWZOnAfHCwM1XEB81tt8yMOcW/rv1hGDDSqQFXchWrE7BRTw
 0buXLuFTrcqprYtKS5i58N/Z/NxdoPm2kmpkHyILautjCPQ2EQtRJBj3gVPnvlWLedtF
 otaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RL/cU2KUkEBT0HxlomYcXgHotXYUZUNOdsb4bQKVOHY=;
 b=zNb2O1qaCZEpKB0OelVRFCoIn2UUTHZjQqT85GFLYFXw9b6SlPj3Xp2QlvS1XujY1/
 uuOaROW0zvIZS3sY4vOsUWJbHHEHGI/jEZ5zsl1PYxl6gVencyLOogN5ilwaXH+/UiWm
 6pK1TUqupkDxte6BxtbqVLIFgEsrxYHih++H3kYnp0h27PC8tYFHPGNEokvKf7e67gUu
 de0L5Gcv6kP6klXO/C4SEGqA9AmAqZ4Pl8wCVWVxSVMk+3JziLyRazZKF3mW0AqtzdXz
 QqE33/v9vDX/ElbIrGGubTyb8AGl2tB2fkaiM41H0hDPjyUCk+q8hs54W0LP/8bs6KT3
 mWlw==
X-Gm-Message-State: AOAM532UYQO6npJpd3VL/F9LvRxtyFByTLOAh6xxXSDJTCAtjDhHR0iz
 ohZEM/ujUfeMQPSzzIhfsxLjTgMCvaTGwg==
X-Google-Smtp-Source: ABdhPJzOv4Lz2Z//R05CCQ+SAH3U5hz5VBJlDR5YCIPIuMirDLFa0gjrgRZUZLQJIB3WdPPYscMK6A==
X-Received: by 2002:a17:90a:e008:b0:1d9:2f9a:b7f1 with SMTP id
 u8-20020a17090ae00800b001d92f9ab7f1mr20018882pjy.173.1650990675787; 
 Tue, 26 Apr 2022 09:31:15 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/47] target/arm: Use tcg_constant in CLRM, DLS, WLS, LE
Date: Tue, 26 Apr 2022 09:30:29 -0700
Message-Id: <20220426163043.100432-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e0469da0a1..0e9fde2589 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8257,7 +8257,7 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
 
     s->eci_handled = true;
 
-    zero = tcg_const_i32(0);
+    zero = tcg_constant_i32(0);
     for (i = 0; i < 15; i++) {
         if (extract32(a->list, i, 1)) {
             /* Clear R[i] */
@@ -8269,11 +8269,8 @@ static bool trans_CLRM(DisasContext *s, arg_CLRM *a)
          * Clear APSR (by calling the MSR helper with the same argument
          * as for "MSR APSR_nzcvqg, Rn": mask = 0b1100, SYSM=0)
          */
-        TCGv_i32 maskreg = tcg_const_i32(0xc << 8);
-        gen_helper_v7m_msr(cpu_env, maskreg, zero);
-        tcg_temp_free_i32(maskreg);
+        gen_helper_v7m_msr(cpu_env, tcg_constant_i32(0xc00), zero);
     }
-    tcg_temp_free_i32(zero);
     clear_eci_state(s);
     return true;
 }
@@ -8416,8 +8413,7 @@ static bool trans_DLS(DisasContext *s, arg_DLS *a)
     store_reg(s, 14, tmp);
     if (a->size != 4) {
         /* DLSTP: set FPSCR.LTPSIZE */
-        tmp = tcg_const_i32(a->size);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(a->size), v7m.ltpsize);
         s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
     }
     return true;
@@ -8482,8 +8478,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
          */
         bool ok = vfp_access_check(s);
         assert(ok);
-        tmp = tcg_const_i32(a->size);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(a->size), v7m.ltpsize);
         /*
          * LTPSIZE updated, but MVE_NO_PRED will always be the same thing (0)
          * when we take this upcoming exit from this TB, so gen_jmp_tb() is OK.
@@ -8609,8 +8604,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
     gen_set_label(loopend);
     if (a->tp) {
         /* Exits from tail-pred loops must reset LTPSIZE to 4 */
-        tmp = tcg_const_i32(4);
-        store_cpu_field(tmp, v7m.ltpsize);
+        store_cpu_field(tcg_constant_i32(4), v7m.ltpsize);
     }
     /* End TB, continuing to following insn */
     gen_jmp_tb(s, s->base.pc_next, 1);
-- 
2.34.1


