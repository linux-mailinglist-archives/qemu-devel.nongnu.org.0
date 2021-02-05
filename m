Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319A31165D
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:04:28 +0100 (CET)
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A9J-0001oq-CE
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2V-0002Bb-VA
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:23 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2U-0003ME-6s
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:23 -0500
Received: by mail-pg1-x530.google.com with SMTP id b21so5565786pgk.7
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ivQ6CdRm/OXUCJL48bE6dU1klkzWgC1aTXX7CV1kiyA=;
 b=h78bA6SXlYmOsELiPucHg3RTgg0+WrgcB5+6LnNc9vqEyTibCJAEy+IQmcuPvHChHN
 UQnjoCAvpTopaGiU7b324qrLHHGin9Ki/gHZWQca1vUyztrmlhKYCUX9LKoAvMt2Z4mI
 cdVKQ8R6dGxUuzkv2/4L55rsjaWjsWk3ozPUZnHNvPpONO1BjqVi2ka71Vb/k6sZtMm+
 ihpu4r2c4N+wmOvhQjQ7ZvFvNIB58yQY2i6rmWxXl/IY6dYcpixFsFwhipl2JA6N2Bp7
 co3t6dSJ4OEVHE6nfNvY+ZlZC2NE11EOkCNzLLZtwA/aCeQqFdb4FLmNJWs5sWFR6rbh
 kx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ivQ6CdRm/OXUCJL48bE6dU1klkzWgC1aTXX7CV1kiyA=;
 b=GzugvEiKeBIZ+WGCJsoVh3vdOODjnMRAXEqnlsef+U6SJZLeTKMEdhwTzsfXB4coYs
 jBkTrTXvJaxWmTXIf2pHhcpMw0kpPD4DcGyFS9CgTRdkh20kuhkurbTZIAyONO8abtAW
 twvLs0Bj0eNCJgDlwLocppeDUmSc0BsAJKZ7x0Y/RC1oGoJm42HxU3WRWdjF/ZLzAH+E
 Lpf1TPh2hw+xZd3vlj+f0kWSD48TcUuapHfBsm57f7Nz5/v+WXoTsO4DquCxguzl7YWR
 mhNt3YAKRnt3/ijEOQ0sSC81NPPmoF/LBdhUZ15iK66LhvueOmKEB0NHR9qsaJSXYwYu
 4xxQ==
X-Gm-Message-State: AOAM53239iaB3TWDfe467TK6R5t1FvZCQmQsMmJHvCYFS+Js+XY9QNAH
 ODrQtkDWQmtckePpYWe1hCn5XQzCWKUJxCLk
X-Google-Smtp-Source: ABdhPJwrZFtAGjPrv+rh6pIaTRAeQSEdNQavIQRbg845Vv4QRvDZw1dMNuB3hnxmoGuaTLwlM2R0rQ==
X-Received: by 2002:a63:150b:: with SMTP id v11mr6840229pgl.183.1612565840003; 
 Fri, 05 Feb 2021 14:57:20 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/46] tcg/tci: Merge INDEX_op_ld8s_{i32,i64}
Date: Fri,  5 Feb 2021 12:56:18 -1000
Message-Id: <20210205225650.1330794-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Eliminating a TODO for ld8s_i32.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 7e108bcbb3..c31be1a1f4 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -587,8 +587,11 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
             break;
-        case INDEX_op_ld8s_i32:
-            TODO();
+        CASE_32_64(ld8s)
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
             break;
         case INDEX_op_ld16u_i32:
             TODO();
@@ -855,12 +858,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld8s_i64:
-            t0 = *tb_ptr++;
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
-            break;
         case INDEX_op_ld16u_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


