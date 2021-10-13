Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D5742C8F5
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 20:44:53 +0200 (CEST)
Received: from localhost ([::1]:56014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1majFC-0006KR-Qt
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 14:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu6-0004FX-1q
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:23:02 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:42730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiu4-00039C-Ch
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 14:23:01 -0400
Received: by mail-pl1-x62e.google.com with SMTP id l6so2396312plh.9
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bz2REULCzHKajB4ycqBwv38V9RL9tjgGVW5Wur1hkTg=;
 b=wcTxMbgkpmTvsOGlBpJsfZRbMFqy1HF9MT0Fa37X3uxs9ae2vgORV6XYWKcZ6zwGYF
 WSYL42vrB/ndpXFw5WSFns/QkEr8CW3MPY96CIBnNFciVsZDl7ozeR2ndAQknJYsuGPG
 Pu1JF/xzsuAYUEYujk8bpO8JsYYIv7r27qMGwPDxF7m70XNftirFCJy4nFk3+0Cm2giu
 5yobQLLjKuSC88Sm2S/VtOatpuMVrTgpvLJlYueXo034JOmd8ijq3gkMdyLhb/eZLaoZ
 OLQPq8u0k7q3N1a9tgYrDNm7Jh+mlH/ZFJoFjZe58/I//en1kFUFx1lByoPWTG9Nk3fd
 J/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bz2REULCzHKajB4ycqBwv38V9RL9tjgGVW5Wur1hkTg=;
 b=PKkda110Sy6LvtrGHAwzNLM+s9U6RoZ+dKpIMnsZVuDTxsqeWES9SVYe8brXkKyFaH
 dJY0bgZjha/qC7/YRqqK6O5Hll3xhE7VCVZh6yMjvArR3Ra7GLSZt/IDPg2mD9RdARMm
 jJMLU/7AOlsUphl07NaDK+RsfNZwY96Zqg0St7shiHP4LSiJooJQGCp6l8o/Ja4fdCBI
 uxXeowfDV2LISol0cgXffKhZOLCQjLG3SNOUxfhlD95hBdsbnbc5j0hzGTwCrmHROfxe
 uLe7gTjmB/FSXB+e8JSNdaqiJRUtCOMr4bNaYBdKMZpFehjXgumfERMJ5nRtm/GswmgC
 ts2w==
X-Gm-Message-State: AOAM533MdPzLfsdUR3Mam/weWMvW3hf7tj1LA4Fp/JJupT1APb5VxQIf
 Ag9f0ovP6v0u+cInc4H0orb7Lhb+QsHCwA==
X-Google-Smtp-Source: ABdhPJxhqwKhG4zHCpgqCfzOhtGdjiBIYH6R6hdW4avSS8mYRmgF6YFBJ+o8dkgoyKqW0kaHBDCDew==
X-Received: by 2002:a17:90b:3148:: with SMTP id
 ip8mr952658pjb.62.1634149378942; 
 Wed, 13 Oct 2021 11:22:58 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm177140pfe.210.2021.10.13.11.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 11:22:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] tcg: Canonicalize alignment flags in MemOp
Date: Wed, 13 Oct 2021 11:22:39 -0700
Message-Id: <20211013182239.991127-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013182239.991127-1-richard.henderson@linaro.org>
References: <20211013182239.991127-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Having observed e.g. al8+leq in dumps, canonicalize to al+leq.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index b1cfd36f29..61b492d89f 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2765,7 +2765,12 @@ void tcg_gen_lookup_and_goto_ptr(void)
 static inline MemOp tcg_canonicalize_memop(MemOp op, bool is64, bool st)
 {
     /* Trigger the asserts within as early as possible.  */
-    (void)get_alignment_bits(op);
+    unsigned a_bits = get_alignment_bits(op);
+
+    /* Prefer MO_ALIGN+MO_XX over MO_ALIGN_XX+MO_XX */
+    if (a_bits == (op & MO_SIZE)) {
+        op = (op & ~MO_AMASK) | MO_ALIGN;
+    }
 
     switch (op & MO_SIZE) {
     case MO_8:
-- 
2.25.1


