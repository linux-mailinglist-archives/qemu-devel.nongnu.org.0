Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F47853B159
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:53:07 +0200 (CEST)
Received: from localhost ([::1]:49566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwa1J-0006D8-UV
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZjJ-0002eX-1t
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:29 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZj8-0005HW-PW
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:20 -0400
Received: by mail-pg1-x529.google.com with SMTP id r71so3490896pgr.0
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qtzekvw6N/DL8al1dZWPmdZqmx+jbmtvWakWbkZg+40=;
 b=TJuyvYC8lWa82QlATLgcUikJlHMvqfvKnjsdGAfeKO7qDUz8QeO52cmwXE4TzpP97W
 uu007n4NrTJ2ChT/SQzS68OpDTDY0hokA8bn1T0sO/7cCnwKz5OrD8gGlfUDMFbLq2Sv
 8A/XAH55C3biXd2rpNxOIlIQqxRBveZks7QKJkM2b0h5OhiEskyKu4ruKqHm8n45uCzQ
 vTZacfiiorkfeAlpxodEiJqBWOLmKWvi+sDZn1K+JQ72gYD9IY9H0lKpnC56TghuZVCo
 WyOxxUvwAfCl2j3u+S4nbaRXk1Su8a1CGkhqRTyKNxqkGUZHZHl5gWuuqFb/Snn8hoxR
 8hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qtzekvw6N/DL8al1dZWPmdZqmx+jbmtvWakWbkZg+40=;
 b=SLYkr/XdhSn65elqzWYZbZ/UlzQIDUH4uR32qmLIWUv4OOCBq7cEVvjMaA4Ly5XRHL
 cgg41AMtk4sdskb7DPX4viGNasZDM9NVRpj0i48yEmBj5JZ5rtv5hsKl9YO8PJ9nXRAd
 npp8Lsu3Rxq/gNMYusv4qv7x40t/0ZmjAQ6HI23TA5AoShp1pG/3/Bd9HvUYZ2SLoajE
 aVRVcofrDELiVy8BKe7YV55gsCC2q9k70mU/VbQ5S1SfRaiuTFI2aYFb9F/ZHhteqKlf
 Qwsl3H+wqFmRWpVY+xbTd0fzlWWfFqR+FG0TERN/t2pRmB3gcFfVZ6tSODeorLGxexbR
 i6nw==
X-Gm-Message-State: AOAM532fdsrJvBs6VbTeMVIqfQ5HZUyX7EvNKdL8jDn6lOTy4IdCHdr4
 Qsl5ZCGVeSu8uLYEpgRtYVdjV43Jfz27lQ==
X-Google-Smtp-Source: ABdhPJx3JlfzujYU6Dm/qAHl/GyMP89VfJLrxlk5OtRLPA1bduYa/OkBBPqYhq1bWnxeu5nkDgp9Lw==
X-Received: by 2002:a63:2209:0:b0:3ab:113b:9a2b with SMTP id
 i9-20020a632209000000b003ab113b9a2bmr2000144pgi.235.1654133657465; 
 Wed, 01 Jun 2022 18:34:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 11/17] target/m68k: Implement TPF in terms of TRAPcc
Date: Wed,  1 Jun 2022 18:33:55 -0700
Message-Id: <20220602013401.303699-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TPF stands for "trap false", and is a long-form nop for ColdFire.
Re-use the immediate consumption code from trapcc; the insn will
already expand to a nop because of the TCG_COND_NEVER test
within do_trapcc.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 61b624b3a1..83c2f73063 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -3075,22 +3075,6 @@ DISAS_INSN(addsubq)
     tcg_temp_free(dest);
 }
 
-DISAS_INSN(tpf)
-{
-    switch (insn & 7) {
-    case 2: /* One extension word.  */
-        s->pc += 2;
-        break;
-    case 3: /* Two extension words.  */
-        s->pc += 4;
-        break;
-    case 4: /* No extension words.  */
-        break;
-    default:
-        disas_undef(env, s, insn);
-    }
-}
-
 DISAS_INSN(branch)
 {
     int32_t offset;
@@ -6099,7 +6083,8 @@ void register_m68k_insns (CPUM68KState *env)
     INSN(dbcc,      50c8, f0f8, M68000);
     INSN(trapcc,    50fa, f0fe, TRAPCC);   /* opmode 010, 011 */
     INSN(trapcc,    50fc, f0ff, TRAPCC);   /* opmode 100 */
-    INSN(tpf,       51f8, fff8, CF_ISA_A);
+    INSN(trapcc,    51fa, fffe, CF_ISA_A); /* TPF (trapf) opmode 010, 011 */
+    INSN(trapcc,    51fc, ffff, CF_ISA_A); /* TPF (trapf) opmode 100 */
 
     /* Branch instructions.  */
     BASE(branch,    6000, f000);
-- 
2.34.1


