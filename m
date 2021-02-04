Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93930E9CC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:01:57 +0100 (CET)
Received: from localhost ([::1]:43196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ty0-0005Vm-6Y
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiO-0004lf-Be
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:49 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiJ-0003ie-2P
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:47 -0500
Received: by mail-pj1-x102f.google.com with SMTP id s24so767280pjp.5
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ivQ6CdRm/OXUCJL48bE6dU1klkzWgC1aTXX7CV1kiyA=;
 b=UfBjul+bPBIcX1icEoskim/EySeIf6QRnYqdF0wZkPkYOsYrd/H5PrhNdAeDC9QwBH
 +/cDEenkgymVPJPn1S31zK/tMJBMALlkMCnEfQPEyMips5daxoNNOKR+lDgU5wNJCXyE
 TnJkWexxAB2xALsASLcDM87TbhGEqsqQXndP9OpEu8JM1RHlV2Ln9BzXZdGoMpzuR12R
 0G5s7P3SIXFjLn8V35gpsOnEypZ5Zvcsl08Ltt/JZuIUB8IoV3yyz1UolqIMbWQl/FPe
 WK9y5UYMrx1L+xk6dAF0A8tRYuVr0OlrzObEVt4uYx2/AZ6DGIQhmHvzt0Pe50UVWsff
 xeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ivQ6CdRm/OXUCJL48bE6dU1klkzWgC1aTXX7CV1kiyA=;
 b=bdrKMm2mMjN3+dPh+Opup97yh4qS0dssEZ3lk+LLHBQF14K/HeLaVCDEHTy0+NXOGI
 agTCRL1fKigltLk+E7Z1DW+w9DdFopUDlY1ffBCVkMytl3KgPw7UO8l7YRo2jYE/VlTn
 oPXG3hwGnHbzBYd/3/S3Ojq39HiFbbSNkxgTtgcsz+GNDQf2uh6zvj0qWqJBBJOtv1uR
 4OttojLYPshAomlCx7ncLSk2RRmYzHZ/IE71Pc9VqPHpesoq+SnCYn2AJcQypw25NIl7
 PZ58zvlS2lUQuk9yWmpknIO/nJCePaOvzxI861w3dvObTsGPEr/W7nWCTPWdDUF0mebk
 hZ2g==
X-Gm-Message-State: AOAM5317nAOXMtH5QdrT3LZC5twYs/Cs336fOPQzKsFTo2mvyLV+BlJ0
 sr4HpUSN/CpS+qyDni0hZrrP9SCC6uzqMAZe
X-Google-Smtp-Source: ABdhPJzB3I9Ft8MWUPdwyh1aPSLhDl5EDPikr0kF/lU+UFtfowQeWfjcd/brGoeJFiG6S/96gQfMJQ==
X-Received: by 2002:a17:902:724c:b029:e1:4aae:c72 with SMTP id
 c12-20020a170902724cb02900e14aae0c72mr5743828pll.81.1612403140657; 
 Wed, 03 Feb 2021 17:45:40 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/93] tcg/tci: Merge INDEX_op_ld8s_{i32,i64}
Date: Wed,  3 Feb 2021 15:43:50 -1000
Message-Id: <20210204014509.882821-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


