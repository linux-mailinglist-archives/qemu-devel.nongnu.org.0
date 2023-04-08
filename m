Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74006DB874
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 05:05:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkysM-0004An-62; Fri, 07 Apr 2023 23:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys7-00046b-5Q
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pkys4-0004Vv-5s
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 23:04:09 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-62ddb232ddaso1414066b3a.1
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 20:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680923047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWlAtcRNymG4w15Enb26bcQblUABjzhSzKBMFvp6WBM=;
 b=u8ZAe8rGeYptpJksNsa8IKzrvjmNwmAzuJUsJT1/o6YBe+7BPVWgiM2z7aouROdi98
 o5CLeLe9WfLzfnHPaQstCoyvykU76hxWWNL+I/R+85EXOB7p5g8wkJh9Qq67ytW0pxcY
 ZWiw77XCL89dPDOvgr6UqXWeVpZ/GMbCNVJksdw0Wqqp7M3MDr6LchiqIy1U0JbIrTFW
 UY5TrOpBDX6nVjBZuM8UCetEPkpfXCs0MtAPGVbqoDgpElkczaFOH74W8DzN+JsnBmim
 5Di1PLq59kON2PERTBs+ap0/h4tBeOdZqzYtBXmB+PAYy9VSEPa4XIJfE4wRHBC4ZVts
 fCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680923047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWlAtcRNymG4w15Enb26bcQblUABjzhSzKBMFvp6WBM=;
 b=xAvkAzWKRUDJip0VY4vTByu0/Q159PUb+wq/erf+Yyq5i2J42exwpa46pvCI1g34Kz
 SnrgS3yI4FKhqJVOQHsf/txGLtWUZpF7HpMeL71zx89j3ZEEMxuHe4jLSCXLro2SdSnJ
 xhy20zCVhciBKYYuxqD9eBfVkMtNHQcY68ceKoz4kwhVLp7DlbKfSOyLgTOp70Apc+W6
 gKEu0nsdJKMVEaApobo3tSTPCAxdUB7DjBGTuz7b9CLByCbDu1/fOQ89pdR5tEBRCxFr
 MKsrFqhULU7tWa3oWlSmwKUPEB9xcuqdEd5VEfs7rjYSwRoQR2gIJCeHuAipA8CianPR
 K7tQ==
X-Gm-Message-State: AAQBX9dRj8TQ0sn78XOywGpJrK+ExpCSYbQRB+4DLQOYKpR86QUdSwqv
 H3IWR2EoeUZuVfxbiYg7tE/qf6hhT6xsRQZv5uk=
X-Google-Smtp-Source: AKy350agneBDXvBzvZxvHHRspcRFKXTMv52UGa+OYjJtelOjh53UeN43XkWm7gzjv8oYD31J/xOlgQ==
X-Received: by 2002:a05:6a00:2ea1:b0:5a8:c913:b108 with SMTP id
 fd33-20020a056a002ea100b005a8c913b108mr4167085pfb.9.1680923047420; 
 Fri, 07 Apr 2023 20:04:07 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 c12-20020aa78e0c000000b0062b5a55835dsm3687025pfr.213.2023.04.07.20.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 20:04:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org
Subject: [PATCH 08/12] tcg/mips: Aggressively use the constant pool for n64
 calls
Date: Fri,  7 Apr 2023 20:03:55 -0700
Message-Id: <20230408030359.3368868-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230408030359.3368868-1-richard.henderson@linaro.org>
References: <20230408030359.3368868-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Repeated calls to a single helper are common -- especially
the ones for softmmu memory access.  Prefer the constant pool
to longer sequences to increase sharing.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 235295c689..e37aca5986 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1105,9 +1105,19 @@ static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
 
 static void tcg_out_call_int(TCGContext *s, const tcg_insn_unit *arg, bool tail)
 {
-    /* Note that the ABI requires the called function's address to be
-       loaded into T9, even if a direct branch is in range.  */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T9, (uintptr_t)arg);
+    /*
+     * Note that __mips_abicalls requires the called function's address
+     * to be loaded into $25 (t9), even if a direct branch is in range.
+     *
+     * For n64, always drop the pointer into the constant pool.
+     * We can re-use helper addresses often and do not want any
+     * of the longer sequences tcg_out_movi may try.
+     */
+    if (sizeof(uintptr_t) == 8) {
+        tcg_out_movi_pool(s, TCG_REG_T9, (uintptr_t)arg, TCG_REG_TB);
+    } else {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T9, (uintptr_t)arg);
+    }
 
     /* But do try a direct branch, allowing the cpu better insn prefetch.  */
     if (tail) {
-- 
2.34.1


