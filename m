Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267F6311666
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:08:25 +0100 (CET)
Received: from localhost ([::1]:45892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ADA-0007NT-4v
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2W-0002Br-PU
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:24 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2U-0003Nm-W1
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:24 -0500
Received: by mail-pg1-x52d.google.com with SMTP id z21so5584906pgj.4
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SP+dSNoCSW/u6ABPE/2oquCEK8adb2mItiXQWA/oP48=;
 b=asEdl3Ea8gFvH/teEUjR4VD4Txq4ZC87JJWCFbyvhMXq/zcf+iCU0YuJxfiBjrX1Pk
 LlMrqeNTmz56+AfIS3ML6vedCaYTczsw3YIcMPI/RXrAcQ6ULItpS8Da47gm+f1zRz+a
 aJJE5lrFKCWZekhaxl13SV9rxruz1LlCO6iBetLqyopyrX24H2sEiiSjTDFqbC9BIoi4
 Zhe+0tpUUSwjeoGzTgWKIvth0V12avKIdZuGTwtkVYsOE68FN2COBOHEpuSzSqDYNseZ
 bmVBqXB60Gqz/ryJptnqSAQhDlI7npd7g9ochbJX4JSZDvYoeGG9v+MQay0GNbRxVCh1
 tjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SP+dSNoCSW/u6ABPE/2oquCEK8adb2mItiXQWA/oP48=;
 b=Q7gtzN5eb0EweSnv9udylHwEOWg2hdzgOzx6NRNx2vSX+IqTg8kxNtRsadISWjyhdP
 9YC3b3p6vbEp91P9kq+amHkXkpydy/lkWwUIYIPHSNiiUQMTTvkgULPQbSadWfCb6t0i
 4dH7nzgx7cpo/ehCdcLGfTsPlfbfWEXrJ11NGrYWUtAv7MtOGsl493jFWsVJ/hpLGrQ3
 vck91LJi6C5tFDhefF+I5MhhMZdtoHVAfzf704htp9nx7m+bG3RZ6nihPSOTlDSa4zeP
 WTtoG344rIqOkxKJeWBZ4o9G/0k6yxlawNW7bmU0VYTYOrYHwTXOXJr0Ph783ud9Iwua
 zu9g==
X-Gm-Message-State: AOAM532YqCF8PkrObFwUB7L+/BgCguQRp2qonBD7jYAcZp7w2Jtg64dx
 uB6bqGBLd9NH4FQjhRkP2ywAAeEjzEpTXcL2
X-Google-Smtp-Source: ABdhPJykMah76OJcUQCA2BJesBGKiKpJZvyQ4LNmnhMDW1638ZFDiteYfnj3TLkVL7MtZgFKdlF/5Q==
X-Received: by 2002:a63:e50:: with SMTP id 16mr6436423pgo.74.1612565841847;
 Fri, 05 Feb 2021 14:57:21 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/46] tcg/tci: Merge INDEX_op_ld16u_{i32,i64}
Date: Fri,  5 Feb 2021 12:56:19 -1000
Message-Id: <20210205225650.1330794-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eliminating a TODO for ld16u_i32.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index c31be1a1f4..b64d611ec9 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -593,8 +593,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
             break;
-        case INDEX_op_ld16u_i32:
-            TODO();
+        CASE_32_64(ld16u)
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
             break;
         case INDEX_op_ld16s_i32:
             t0 = *tb_ptr++;
@@ -858,12 +861,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld16u_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
-            break;
         case INDEX_op_ld16s_i64:
             TODO();
             break;
-- 
2.25.1


