Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F034C6DB83A
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 04:47:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkyY1-0006yX-2C; Fri, 07 Apr 2023 22:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXz-0006xJ-Ju
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:23 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkyXu-0005XD-Gb
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 22:43:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e13so56721plc.12
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 19:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680921797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FA0INw69Tj2Q65SKKyaFBNoXHTALseJjSoW6NBoZT2Q=;
 b=H4Od7XZt8gHq5kCBnNG9cM4A0TfAe8kIBibt439zggO1qJXNdVNY3Fh5dH3SivF0CJ
 JenqhU6hsbZUbs6Tx8TTRLHhBQMkfim1VVgAWS0Zy6S1BG/BPrp+DJN3UYKTd+/DsiPw
 TqM98AvoKNjYGgjZbCZcUJ7w4plimJMzx9aCq4cdcxwVe6H5lyZKkWvTtbyUlJEyPQpR
 IKEpSosiUU+h1/+p8Z4ea/BXWqg3VP7+zebHtM7I98Zdg5cOMChfKkODgnFahrcGSI2N
 /QAWkwuSFD5yAOT/J7Up8q7wjfxGiCrX7wimyZc1oKBCECPxev0AK0IbOpRC6vSYFKI8
 C14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680921797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FA0INw69Tj2Q65SKKyaFBNoXHTALseJjSoW6NBoZT2Q=;
 b=aiSGPct9LuwXBhDvZAsv0dqeUooniL3ihffvjVuSgujxLKil+j7Dn+p5j/0CFtcNr8
 FCeIOsJoaXPohhTAleFHWiz/gHUwv237cMUisrq3sp8880W+v9We04MRSeWkzjbyiTVy
 +WFTEckpJuqrPWbe29ShmEpfosH6+1/aWQTCezMvEBAbF0YY1Af+Mue+68wtc46zVb1N
 Gcg/0mYNMJ8YjIJtERFeC+LZddBdwbqZAJWEujdEEoRHGhEBcicE+gnDUw30kNzm687c
 0LcTa1brxFMDyIHzlOYXVEfbZuVgoTYwohso5hl9EtOFFxZFbS2WhCex/irP4YjDEFJE
 m57g==
X-Gm-Message-State: AAQBX9dpi+tu/GgMsSVh2pzx0EgI1/+9UY2MH+47di1LZAE+9y3VQROh
 C1z3hDVAQQUakXcvfrhugNNbneDkaqMeZ2jSJ8A=
X-Google-Smtp-Source: AKy350YGUSNATevcWbArMeU6NiZjUu/zYlVzyqt7Jb2QqmZAas1aHfjdnOkRDXJB+oje0J9EZLdaMg==
X-Received: by 2002:a17:902:f684:b0:1a5:1109:f58e with SMTP id
 l4-20020a170902f68400b001a51109f58emr3569684plg.29.1680921797021; 
 Fri, 07 Apr 2023 19:43:17 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a170902c18900b0019d397b0f18sm3530780pld.214.2023.04.07.19.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 19:43:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 01/42] tcg: Replace if + tcg_abort with tcg_debug_assert
Date: Fri,  7 Apr 2023 19:42:33 -0700
Message-Id: <20230408024314.3357414-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408024314.3357414-1-richard.henderson@linaro.org>
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
 tcg/tcg.c                 | 4 +---
 tcg/i386/tcg-target.c.inc | 8 +++-----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bb52bc060b..100f81edb2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1174,9 +1174,7 @@ static TCGTemp *tcg_global_reg_new_internal(TCGContext *s, TCGType type,
 {
     TCGTemp *ts;
 
-    if (TCG_TARGET_REG_BITS == 32 && type != TCG_TYPE_I32) {
-        tcg_abort();
-    }
+    tcg_debug_assert(TCG_TARGET_REG_BITS == 64 || type == TCG_TYPE_I32);
 
     ts = tcg_global_alloc(s);
     ts->base_type = type;
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4444eb9234..aa7ee16b25 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1369,8 +1369,8 @@ static void tcg_out_addi(TCGContext *s, int reg, tcg_target_long val)
     }
 }
 
-/* Use SMALL != 0 to force a short forward branch.  */
-static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, int small)
+/* Set SMALL to force a short forward branch.  */
+static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, bool small)
 {
     int32_t val, val1;
 
@@ -1385,9 +1385,7 @@ static void tcg_out_jxx(TCGContext *s, int opc, TCGLabel *l, int small)
             }
             tcg_out8(s, val1);
         } else {
-            if (small) {
-                tcg_abort();
-            }
+            tcg_debug_assert(!small);
             if (opc == -1) {
                 tcg_out8(s, OPC_JMP_long);
                 tcg_out32(s, val - 5);
-- 
2.34.1


