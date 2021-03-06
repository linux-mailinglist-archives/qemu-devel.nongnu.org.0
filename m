Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652E32FDA2
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:50:06 +0100 (CET)
Received: from localhost ([::1]:40066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeoH-0001wA-FJ
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebH-0007Aq-VF
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:39 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:45989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebG-0002zF-7c
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:39 -0500
Received: by mail-pg1-x535.google.com with SMTP id p21so3808097pgl.12
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBa0mYVDt9xRDsum9kHj5ruNUWIAR4QdH8Qq5PqaSbM=;
 b=XgW9PmFSG6KjwkoL61uGSY8Xwq1kYRJ7jNSBCl4vRe56kbecJ5rjcu6QMPWoTmMvpH
 Lx5YL0FYbkBmML/qGmyNIJV/K1XUrhHj76YDgDicAAkrYz9qDRCypbnU5WwT78zVvN9B
 jWFTjjY2kZ0/uwERA2cWKt21TuXWC8zJ0dJ3/2unM6oOLD6pk0NMDfyYJtLRA4zwp1Vk
 /pfKHDfTdhuAqY2tYT4nIL1EVOiq90dKMBJ41vqCIpSaPcgQ5jKQq81/ejDAEzqzfTsk
 hN/EMRLKVa6dmwr7z4yri/Hrs045pZFmtpbiPZOgOwG44z9+3spJK9ouc5wkPSOsQKO4
 6Bbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBa0mYVDt9xRDsum9kHj5ruNUWIAR4QdH8Qq5PqaSbM=;
 b=pj9ydDJwBFT7O80f2hNTGxbGaqFhN0+zJO28ZFDW2gtjg7qH/Airu4jKRMZuAfinbR
 AqEx3NMGNpkBzf1jXL7WioMUW/Xkv+idgdpHRBWPmiUJlbS+qtJa0QrWmf+RZBF5JS+V
 eQ90AoxqzI5oGPT9PbeLdi55MCoeatPHLraHFPVT2AHeb26aj3tAZ4G0/Hms5fosc3of
 ooQkfiirEENgGrWObm76vYn9jYsWnC9bfAnRm5So4uI1JMAOgmHzUAbR5kZDEZypYL2E
 +9Lq6uwlJaNkNMfD33bdcVI1Fm7vuyE23EXH59LyMZj8j8uTKLVAsnr5ZcXPi31J6Yrb
 pt9g==
X-Gm-Message-State: AOAM533+wzeIdgTFLUrqiukQcQbiCvST+gPmmefgo+n+AdoiUctDz5lt
 YCSYfW+JsdDeAkka6RbISIiHk25PargzQg==
X-Google-Smtp-Source: ABdhPJxZxHRYAJr6pa6HaK/WvMoMJ8D4vf6oXo1YGAa4NA3hWcC/ghdoV7Z3tpsRuiiN0ibIGWn1rg==
X-Received: by 2002:a62:8103:0:b029:1ef:26e4:494f with SMTP id
 t3-20020a6281030000b02901ef26e4494fmr12325791pfd.41.1615066596938; 
 Sat, 06 Mar 2021 13:36:36 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/27] tcg/tci: Merge bswap operations
Date: Sat,  6 Mar 2021 13:36:07 -0800
Message-Id: <20210306213613.85168-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes bswap16 and bswap32.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 73f639d23a..66f2962d6e 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -635,15 +635,15 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, (uint16_t)t1);
             break;
 #endif
-#if TCG_TARGET_HAS_bswap16_i32
-        case INDEX_op_bswap16_i32:
+#if TCG_TARGET_HAS_bswap16_i32 || TCG_TARGET_HAS_bswap16_i64
+        CASE_32_64(bswap16)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap16(t1));
             break;
 #endif
-#if TCG_TARGET_HAS_bswap32_i32
-        case INDEX_op_bswap32_i32:
+#if TCG_TARGET_HAS_bswap32_i32 || TCG_TARGET_HAS_bswap32_i64
+        CASE_32_64(bswap32)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, bswap32(t1));
@@ -795,20 +795,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (uint32_t)t1);
             break;
-#if TCG_TARGET_HAS_bswap16_i64
-        case INDEX_op_bswap16_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap16(t1));
-            break;
-#endif
-#if TCG_TARGET_HAS_bswap32_i64
-        case INDEX_op_bswap32_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            tci_write_reg(regs, t0, bswap32(t1));
-            break;
-#endif
 #if TCG_TARGET_HAS_bswap64_i64
         case INDEX_op_bswap64_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


