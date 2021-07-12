Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C913C5F85
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:42:47 +0200 (CEST)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2y50-0006oA-JU
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2V-0003zO-7G
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:12 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2S-0000sb-9f
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:10 -0400
Received: by mail-pl1-x629.google.com with SMTP id p17so8874958plf.12
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MxG3oPkWJFIg64tHYkF9MZw/VV9NOtSqfDFOnVqpJsY=;
 b=rZ/78dB6wptn2cCwk6chjyCaNQw4ZM8Co/YU0CkLvyVUU/fY1LyU1YSQCd23Z3d+uD
 k6eKc6Qy82kZzrl1hbMA36a2TivnoBQeuv3e8mDQu8oAe827sdsuHb95D7DApAE8G8NN
 8a04Jh1LabaLupv2ABiUYvls7eSSYfKjvws5Axz5/yN+BltowqbFSWnVx22MB0Lu6iE6
 38LXBPStEtdcuCCukxL5hFtbArI5pT5vwTIMhG//I95Zn9WSoGkZaQcQSw4RV3MKWLUT
 +8VsuGzvCwYnaO7InZ0B0y491yKcdrhb0I8m7+i1L18PlsTzHwC3Of2piSYFtuAUSWdT
 hwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MxG3oPkWJFIg64tHYkF9MZw/VV9NOtSqfDFOnVqpJsY=;
 b=O+XrINwcmtf04d+C9Us16YQ0Ms1bZwWnJDFLIQNNZn1n+unv38lPrhWde8Yjqyx4k+
 vH+HvDATk0Aea9pwdiGP0XU14RnRDPj8eyRuaUnOJHkNX5GH8deGlFK0nVX5Ayv/Lb2u
 FImzlS3pf03PbU+/tNTxLW1zHXbMcc/GK33KSJeG4XEq92fHpTB/wnkj0ksYhwT1ukqT
 Uoh/yRO20JgjzSMo0o6vsZQvq7bMay0a4fyYfnvJKMfs6L1hgFH6II5sd5KhdNr8ucCD
 s1aKC3lGPO/QfzMwCQpFrfdf+/vTXPdzeBg3biz67V62btJ3q4o2C+/2aAa/eDZorzxD
 VOww==
X-Gm-Message-State: AOAM533FyK+O4tXQ4FecN8UWVw+Cj1f+QcsoFnGsPFwTAiYmAoC0LC69
 /DRe+skQf/0aYNB7gKNbp5ycTcIDUXYoVA==
X-Google-Smtp-Source: ABdhPJzHkg8noKKI6HdFo8zpP7lPqV6lM1AlRa2QG2gPh8KllpbWCcmDGwdz+HkcQJRUdMAnF9bUbQ==
X-Received: by 2002:a17:90a:420b:: with SMTP id
 o11mr52733681pjg.201.1626104405723; 
 Mon, 12 Jul 2021 08:40:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b33sm18247635pgb.92.2021.07.12.08.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:40:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/10] accel/tcg: Reduce CF_COUNT_MASK to match
 TCG_MAX_INSNS
Date: Mon, 12 Jul 2021 08:39:55 -0700
Message-Id: <20210712154004.1410832-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The space reserved for CF_COUNT_MASK was overly large.
Reduce to free up cflags bits and eliminate an extra test.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 4 +++-
 accel/tcg/translate-all.c | 5 ++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 754f4130c9..dfe82ed19c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -492,7 +492,9 @@ struct TranslationBlock {
     target_ulong cs_base; /* CS base for this block */
     uint32_t flags; /* flags defining in which context the code was generated */
     uint32_t cflags;    /* compile flags */
-#define CF_COUNT_MASK  0x00007fff
+
+/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
+#define CF_COUNT_MASK  0x000001ff
 #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
 #define CF_MEMI_ONLY   0x00010000 /* Only instrument memory ops */
 #define CF_USE_ICOUNT  0x00020000
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4df26de858..997e44c73b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1430,9 +1430,8 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
     }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
-    }
+    QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);
+
     if (cpu->singlestep_enabled || singlestep) {
         max_insns = 1;
     }
-- 
2.25.1


