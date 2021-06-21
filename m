Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2583AF949
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 01:28:01 +0200 (CEST)
Received: from localhost ([::1]:56328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvTKi-0003SQ-KH
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 19:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTC2-0000hp-CD
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvTBz-0005x9-Qy
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 19:19:02 -0400
Received: by mail-pj1-x102d.google.com with SMTP id k5so10888233pjj.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 16:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OHRTImoqpKp6fFDt3CyDGrFLOR/qjHMTu9RJ5HP1ryg=;
 b=rw0/jKZ4lnEG0n/qvgusIqqL2O7i31GK7S25om/r7WzoXQXECFXouBQjVSP5ycv6bg
 X2BHFmHzSI0LK5VGvxumVvalvgQtrqGcRdLmrz/JrRnBzCyZFgSMCXj+R1zB8ggC90hz
 taAsqa/EUddd6dfXFB/9k/h+k7UJ/xPFfrSdpqQ7MWz6AmXehkIUeMLpOwgNw96LQqc8
 D+YiBD9gGArAhwWYOcpSA6WqqU84CXpqx2Bj93SS3x1uksEovnefOg7JClS+KeTws9J7
 z3Dqh3dZvT53MlkLM7j036iuc1QoCHuQgy4VSk6snuc4NoeuEx33yG6O421SfXLpG7UB
 8NVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OHRTImoqpKp6fFDt3CyDGrFLOR/qjHMTu9RJ5HP1ryg=;
 b=e++9nEeESVDSSU1fAFrhVGoB2gzWdwMSchB0TmXTGXUh4dUi8YsoDttsZ4ouRWeBUs
 B+CVFjgvfQMNRUtoAgAIelMF+BmMn9tO36KI1X3+a0s7GnKP62RQtbuGLwlK+e/ZuE6L
 KhN4xFiJA41M3fPd7mAUm1ydyrFx0G/3hZhJbIMQ3IfpZcSx8U6x0+NjluwZ6vxfms9v
 tPyx1ZW2N30AGthUqX5XrZj110+C0jk/YvUpvXlDAIJWnnKC+lfkq0tyZMtUONAUySzI
 M5JvuGIf8eSIgu1BI4tN6aVEFQ4vVjNNbyCPxWT0aamHNgHgj+Y0e2fBHnEphqrYBYjh
 hZ3A==
X-Gm-Message-State: AOAM5336E55vCYv+LDLOW7JQFJfqTWznKPwIyaXH/UGHb48rOfTmXFHI
 8XQpCSmf6TJ3UB1cRieXatotgPxHQonieA==
X-Google-Smtp-Source: ABdhPJzk5rPb8M7KibkAhr0lkopAl6ffRgmGSpbfTEUcVKkR6eXvY5zWi4YS6c3axtDwFaCo/nt6Bw==
X-Received: by 2002:a17:90a:c384:: with SMTP id
 h4mr501213pjt.134.1624317538445; 
 Mon, 21 Jun 2021 16:18:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm14429952pgf.20.2021.06.21.16.18.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:18:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/29] tcg/ppc: Support bswap flags
Date: Mon, 21 Jun 2021 16:18:31 -0700
Message-Id: <20210621231849.1871164-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621231849.1871164-1-richard.henderson@linaro.org>
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For INDEX_op_bswap32_i32, pass 0 for flags: input not zero-extended,
output does not need extension within the host 64-bit register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index da6d10722e..33f0139519 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -789,7 +789,7 @@ static inline void tcg_out_sari64(TCGContext *s, TCGReg dst, TCGReg src, int c)
     tcg_out32(s, SRADI | RA(dst) | RS(src) | SH(c & 0x1f) | ((c >> 4) & 2));
 }
 
-static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
@@ -804,10 +804,14 @@ static void tcg_out_bswap16(TCGContext *s, TCGReg dst, TCGReg src)
     /* tmp = dep(tmp, rol32(src, 8), 0x0000ff00)    = 000000dc */
     tcg_out_rlw(s, RLWIMI, tmp, src, 8, 16, 23);
 
-    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    if (flags & TCG_BSWAP_OS) {
+        tcg_out_ext16s(s, dst, tmp);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    }
 }
 
-static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
+static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src, int flags)
 {
     TCGReg tmp = dst == src ? TCG_REG_R0 : dst;
 
@@ -825,7 +829,11 @@ static void tcg_out_bswap32(TCGContext *s, TCGReg dst, TCGReg src)
     /* tmp = dep(tmp, rol32(src, 24), 0x0000ff00)   = 0000dcba */
     tcg_out_rlw(s, RLWIMI, tmp, src, 24, 16, 23);
 
-    tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    if (flags & TCG_BSWAP_OS) {
+        tcg_out_ext32s(s, dst, tmp);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_REG, dst, tmp);
+    }
 }
 
 static void tcg_out_bswap64(TCGContext *s, TCGReg dst, TCGReg src)
@@ -2851,11 +2859,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
     case INDEX_op_bswap16_i32:
     case INDEX_op_bswap16_i64:
-        tcg_out_bswap16(s, args[0], args[1]);
+        tcg_out_bswap16(s, args[0], args[1], args[2]);
         break;
     case INDEX_op_bswap32_i32:
+        tcg_out_bswap32(s, args[0], args[1], 0);
+        break;
     case INDEX_op_bswap32_i64:
-        tcg_out_bswap32(s, args[0], args[1]);
+        tcg_out_bswap32(s, args[0], args[1], args[2]);
         break;
     case INDEX_op_bswap64_i64:
         tcg_out_bswap64(s, args[0], args[1]);
-- 
2.25.1


