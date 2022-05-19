Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED42E52DBA7
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:47:46 +0200 (CEST)
Received: from localhost ([::1]:51054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkFW-0000Iw-1Y
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk58-00063s-D7
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:02 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk56-0000qV-4J
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:02 -0400
Received: by mail-wm1-x330.google.com with SMTP id k26so3287566wms.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eYdhmsAICvTZ9KCLNFtpG5BAhQNiiaRW87dMYr+EMt4=;
 b=ixrbzNGXiRMxEkvqcc4Cv/vp5FFBwVgvukdRZZgUcLVu+XGC09vm0k08kSnryWNPlX
 Kv30si1bAV0qD0byri2gfwUqVB7LVzEPJkmDtPSI1g3un22QUoAbF/IlldFoYJvgdi+m
 hFxwS5YOh5/GOTKpFk7fTKdsdW2gOwz7Fzxb1bTK48zXgQtg7s9CB5tFZPylN3AOs9DZ
 hrI8I8O+drlaP4ydrdbiax0bxPZvupYBc61V5AoWRHlf7lV7heWCyalk8wADT96Vm6Ci
 SEx/gzyTO7DUGy2XUsYuKpZH1DDiqhCjEXfOg+fPwMKZ+7W2tXapEbLMdizioA6fQxcK
 Gfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYdhmsAICvTZ9KCLNFtpG5BAhQNiiaRW87dMYr+EMt4=;
 b=bHRTLa/Z4PRl2W69XibEWXIuhzhdlJtnsg174Pbb8Kbgyc7zDPjTk++kbKDc7mePh7
 qs4JfvuS95RGK/39MqTBX9MPoNIhnTZIswIzkmdIHCoCYZV/su3n5ESk0REwUD0ddGbq
 buNVF6oipWeqIxXMFd+USHO8SpXAe6/ITg5zFY1GV7sDpR2zkg7EPRl0Y0rcxm4Zbbz4
 6B4zogdlZGv6v/cKMWMiW04Me4cZWzn5bFOthDzoaOzfobS4sm2aeyVZJh9R42I2Ea+M
 D9OzplUJVJkcgAvBm4DIscgLByDaFD5Z4GWmpiuhp4CK9yVztW9fDqgWB0BOl655d57A
 egjQ==
X-Gm-Message-State: AOAM53302EtfkQpjM1LSWxxTaFT1lN4nx7dTQJwWzFANu9w2UbXMin2L
 reQAJWV0ONTc2FBCF8OkX3mmF3lE2Sju+A==
X-Google-Smtp-Source: ABdhPJzBCzpdsoEQRJIJTo4RjlhvOHNXmDHebGk8bb1bkEKmSI1BxKdjsjywlG9zyicxRiastlm4Tg==
X-Received: by 2002:a05:600c:2055:b0:397:2b06:57c7 with SMTP id
 p21-20020a05600c205500b003972b0657c7mr5376411wmg.97.1652981818832; 
 Thu, 19 May 2022 10:36:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.36.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:36:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/22] target/arm: Drop unsupported_encoding() macro
Date: Thu, 19 May 2022 18:36:35 +0100
Message-Id: <20220519173651.399295-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220509160443.3561604-1-peter.maydell@linaro.org
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
index 176a3c83ba2..f5025453078 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2127,13 +2127,13 @@ static void disas_exc(DisasContext *s, uint32_t insn)
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
@@ -2142,7 +2142,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
             break;
         }
         /* DCPS1, DCPS2, DCPS3 */
-        unsupported_encoding(s, insn);
+        unallocated_encoding(s);
         break;
     default:
         unallocated_encoding(s);
@@ -2307,7 +2307,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         if (op3 != 0 || op4 != 0 || rn != 0x1f) {
             goto do_unallocated;
         } else {
-            unsupported_encoding(s, insn);
+            unallocated_encoding(s);
         }
         return;
 
-- 
2.25.1


