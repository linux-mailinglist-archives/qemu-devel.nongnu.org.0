Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89705201F3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 18:07:11 +0200 (CEST)
Received: from localhost ([::1]:35776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no5ug-0003Cq-CL
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 12:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no5sO-00024q-NP
 for qemu-devel@nongnu.org; Mon, 09 May 2022 12:04:49 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no5sN-0003jW-1v
 for qemu-devel@nongnu.org; Mon, 09 May 2022 12:04:48 -0400
Received: by mail-wr1-x429.google.com with SMTP id e2so20121499wrh.7
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zU5rFGkB281ja2vWi3yVV9+Cb4HIS2VI2BddL4/fCzI=;
 b=HPpNTaEq6Rj3dVlatTP2gUm2Qzox784qn64vpnJWdFy9Soi0G1R/7W0/avtnNcNFpR
 sA+2OjDA971MgMvCtn0V/CXKB+bfufyVydMu5qzdd9r5tJIJdMoKvFX70IerAdxMk8f2
 w20fFOl9Lie65PiRcHK2oQAonofDwqnaQoHGPV8JzMbBDJi4LQms6xA/KrcUcvhMFazc
 3MQGMZpfrz0CzUnW3MJsXjrLOKeNYOz3EABBF5Equ9vt6ox5YkBdK4vi3zb2Zer1fxXZ
 AUSHK2cntNQVUJIfzAZC6GASEOkGPMjdE+uuVC3stms44ZSnq9Nnmi6eA72kGnLIi/Ug
 crOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zU5rFGkB281ja2vWi3yVV9+Cb4HIS2VI2BddL4/fCzI=;
 b=2W9b0TCnz9NZciMUA2CnTzaWad0TKRaw4d1FVzSf/RpTEgXmE3Yw6zNQZvSZ3o66o2
 9nkTH9tpq2mDqJa/CAAeVmdRE0PUsbg4PR+8nWc/qgUGwu5Goa4CUhykwP8BDmkPsWvz
 VfNhkxrD6mdmFqivpiyOgxcllZkanDx0Unu+KnBPgO9mZv/dTvXl1hmlKA1noxoaLtSK
 dgGoQUDXAA4nEzS3zF8sUCeSnk/cCp6vhWIqynRJ6u9LDBLiUbUDCvmMMurlK6I7Rxoy
 V1lXPEeGsOYF7jqJX5cuLPGo6spGgNc2EgCOk+TgPOhUHSyBRauZkjpOZVOdGFrUwnJi
 5bow==
X-Gm-Message-State: AOAM531lqvmq/qZqxMoNizxSaJLJ97qbEoMncMjBOfbA0ErMZ/hjEUEe
 3Rc3Wthbxp5xudtl+x0iiz49Sg==
X-Google-Smtp-Source: ABdhPJxbWl/EMK0zxvfh3e2C9nERHlLm5uyE/NHxMwvltj18ZXhqVWUsnpNx6R9kgQS6n+70S3Gjnw==
X-Received: by 2002:adf:e0cc:0:b0:207:b690:acb8 with SMTP id
 m12-20020adfe0cc000000b00207b690acb8mr14229965wri.412.1652112285141; 
 Mon, 09 May 2022 09:04:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a05600c348700b003942a244ed7sm12431408wmq.28.2022.05.09.09.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 09:04:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Drop unsupported_encoding() macro
Date: Mon,  9 May 2022 17:04:43 +0100
Message-Id: <20220509160443.3561604-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

The unsupported_encoding() macro logs a LOG_UNIMP message and then
generates code to raise the usual exception for an unallocated
encoding.  Back when we were still implementing the A64 decoder this
was helpful for flagging up when guest code was using something we
hadn't yet implemented.  Now we completely cover the A64 instruction
set it is barely used.  The only remaining uses are for five
instructions whose semantics are "UNDEF, unless being run under
external halting debug":
 * HLT (when not being used for semihosting)
 * DCPSR1, DCPS2, DCPS3
 * DRPS

QEMU doesn't implement external halting debug, so for us the UNDEF is
the architecturally correct behaviour (because it's not possible to
execute these instructions with halting debug enabled).  The
LOG_UNIMP doesn't serve a useful purpose; replace these uses of
unsupported_encoding() with unallocated_encoding(), and delete the
macro.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.h | 9 ---------
 target/arm/translate-a64.c | 8 ++++----
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 38884158aab..f2e8ee0ee1f 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -18,15 +18,6 @@
 #ifndef TARGET_ARM_TRANSLATE_A64_H
 #define TARGET_ARM_TRANSLATE_A64_H
 
-#define unsupported_encoding(s, insn)                                    \
-    do {                                                                 \
-        qemu_log_mask(LOG_UNIMP,                                         \
-                      "%s:%d: unsupported instruction encoding 0x%08x "  \
-                      "at pc=%016" PRIx64 "\n",                          \
-                      __FILE__, __LINE__, insn, s->pc_curr);             \
-        unallocated_encoding(s);                                         \
-    } while (0)
-
 TCGv_i64 new_tmp_a64(DisasContext *s);
 TCGv_i64 new_tmp_a64_local(DisasContext *s);
 TCGv_i64 new_tmp_a64_zero(DisasContext *s);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b80313670f9..290ad6cbb27 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2085,13 +2085,13 @@ static void disas_exc(DisasContext *s, uint32_t insn)
              * with our 32-bit semihosting).
              */
             if (s->current_el == 0) {
-                unsupported_encoding(s, insn);
+                unallocated_encoding(s);
                 break;
             }
 #endif
             gen_exception_internal_insn(s, s->pc_curr, EXCP_SEMIHOST);
         } else {
-            unsupported_encoding(s, insn);
+            unallocated_encoding(s);
         }
         break;
     case 5:
@@ -2100,7 +2100,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             break;
         }
         /* DCPS1, DCPS2, DCPS3 */
-        unsupported_encoding(s, insn);
+        unallocated_encoding(s);
         break;
     default:
         unallocated_encoding(s);
@@ -2265,7 +2265,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         if (op3 != 0 || op4 != 0 || rn != 0x1f) {
             goto do_unallocated;
         } else {
-            unsupported_encoding(s, insn);
+            unallocated_encoding(s);
         }
         return;
 
-- 
2.25.1


