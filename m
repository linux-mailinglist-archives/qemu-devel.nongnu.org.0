Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EAF32A901
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:10:33 +0100 (CET)
Received: from localhost ([::1]:38444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9Tc-0004HQ-UW
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Hc-0003Cz-OX
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:08 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:43566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Hb-0007cS-4X
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:08 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q204so13258475pfq.10
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uBa0mYVDt9xRDsum9kHj5ruNUWIAR4QdH8Qq5PqaSbM=;
 b=tfJS/0etcfXZw8W4fw6/1eXkXd1qZZAOkpRDMnDYd7Lz8z2os4EDusvbL9kkzi9xgi
 WP//cdy/nyXI6egHKmO8t02ht1TJZn+XbWyVMTOpPFsEi5oWKdpcN0LSXZdX2sPaTd0o
 jP9D1z1RJTto89KprHq4hXV3KN9blxMLX2HTWjW/OTpmImyxbIhF2N6URtNuE8lKd40N
 JFlASJu5aD4Hi7sYrYHoLIVT1kVRWvOcgc0puyvnQafzvEc9XJLhlw+QA3cD58o7s33S
 o0p4wGYwA+SeX8XduTHE0hoMZxjE2SWCRMBmBwkfvtdefACAdBaQhzraA/K3cS529t1T
 uT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBa0mYVDt9xRDsum9kHj5ruNUWIAR4QdH8Qq5PqaSbM=;
 b=szuICiNCQVaAmstB8x8Gdlgg53CgXzzUa8oG2yN348NnGfUGI8xYUpgzgBKFfTqhQG
 YqiF1HnVV6lydRcdyMCgVQDbAzyO/Ldyacbb6s4UEyATxf9DbLaxDlEz+Xkm3zGmm2GE
 a7YI9VD1f/OH9Esaw8MhXBtpOyyVGkJHGOIRc+UMNNpUzWBahre6165YBbm/h0XaPraO
 4Tp3itX7JmEjdg6GQZN6Ut7ABKXj//ELD+vaQZDvt4DqDwEtuKl9UMsOfTAKF7VgCJJB
 dtLM9v+pY+QhXNSa7QPR+U2+8UX/6HAjp78SkzJgfboGBK57TYA017uPlZ7IqGW1s3HC
 fIkg==
X-Gm-Message-State: AOAM530uqsDjW3f7eqdHu7X2VHiZGu1mp3LOQfDW8OHn5fv048gglmbe
 qbcJvt4SULBaUo7xKosYSeziRaCazn5kWA==
X-Google-Smtp-Source: ABdhPJzijbYz8cEf4fP2BdQ6B0aFKhbiZVG92CWuiNhRmc5j1ymQW/RWHuh2+ufg96kaLTLAhjYzlg==
X-Received: by 2002:a05:6a00:16c7:b029:1b6:68a6:985a with SMTP id
 l7-20020a056a0016c7b02901b668a6985amr4381315pfc.44.1614707885921; 
 Tue, 02 Mar 2021 09:58:05 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:58:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/27] tcg/tci: Merge bswap operations
Date: Tue,  2 Mar 2021 09:57:35 -0800
Message-Id: <20210302175741.1079851-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: alex.bennee@linaro.org,
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


