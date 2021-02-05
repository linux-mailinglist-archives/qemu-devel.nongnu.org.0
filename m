Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97A31165A
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:02:58 +0100 (CET)
Received: from localhost ([::1]:55084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A7t-0007xw-MF
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:02:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2K-0001iY-8I
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:12 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2I-0003GG-RK
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:12 -0500
Received: by mail-pf1-x42b.google.com with SMTP id x23so3795812pfn.6
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tquh43lruzGWRcmOiBMYX1Wiqh+FHEpp7zn+YOCAYms=;
 b=GsECdYiYnf3/hnoqh4DaqMeFNXAtKiuM8/yypajc2URy6/NRTAT5tAaoA2FCvBYe9w
 Zvh3Mfvn/DPOBts/6OBNFS4T9gEiouKoLp8YRjMBFDW+kX30FjihuuFUlYvocF+cZlit
 +g9C16d5c0lGom2CQiF9swpzLlFe9rW0lUnHA0QP31nI+9nHTo4LcehUI3Gl6Q284eav
 Kpmz5YLRaPkq31LCcXTJOpj73x58HAbUZz0upVDbuqBYen/q47gjBYyJoHoMUPBuBfeb
 QRU4xETeWq0OCQkEVFbdS7LI3VTRYLFsHovJfSJzvxq3AEV53gI4koyENmI1mqRZZ8F7
 IvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tquh43lruzGWRcmOiBMYX1Wiqh+FHEpp7zn+YOCAYms=;
 b=lu9KrFd/UY2e5J7EbJyE0nY1gDdcJqPI8NEUbkvlWbGL3BRLfGwwTfu+Y/nRaQwRsF
 AlZ5jlZcCShXGtfPHAdOgPuhJc0O891wlqyT/nXELsqYf/H7fhHLZA+bIioPd/huW7Cy
 0ond9tOepm32AG7CfR65H6km7kCaXPD/+u9MTTIO8WypKdyWpUAQUs3vgwMi7HqLPkHo
 PCpWc/ZgKPvBqQj+msh9TRkbLVDq4XelAGhE2Lg7tyWaEhHCr747CwlCS83zmfN0nPdb
 xjzTK4N0xx0XnmmLnTgNcLhjPvGviIeBQEV4KaH3YV1KE3lg7XBsLUl2LaPJZ8Ww5NDo
 tyQw==
X-Gm-Message-State: AOAM5323gkZqJyOwjFNlBUVr/GrcHMlDPY6cJpV0N952hodRGrkYw0qB
 Qgks0FdI+vJWduw8BUKrQCavGfqr7bcL6ug+
X-Google-Smtp-Source: ABdhPJyx4J+frmuTX6ILYcIDDLp+OMpyCwNy7SqNshtlhE2BfnHBe0JX3/ftR4fHbUHl2aRmwHilpA==
X-Received: by 2002:a62:ea14:0:b029:1bf:f580:3375 with SMTP id
 t20-20020a62ea140000b02901bff5803375mr6748933pfh.53.1612565829641; 
 Fri, 05 Feb 2021 14:57:09 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/46] tcg/tci: Inline tci_write_reg32s into the only caller
Date: Fri,  5 Feb 2021 12:56:12 -1000
Message-Id: <20210205225650.1330794-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index c3a8511dfe..e8023b5384 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -117,14 +117,6 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
     regs[index] = value;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static void
-tci_write_reg32s(tcg_target_ulong *regs, TCGReg index, int32_t value)
-{
-    tci_write_reg(regs, index, value);
-}
-#endif
-
 static void tci_write_reg8(tcg_target_ulong *regs, TCGReg index, uint8_t value)
 {
     tci_write_reg(regs, index, value);
@@ -907,7 +899,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg32s(regs, t0, *(int32_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(int32_t *)(t1 + t2));
             break;
         case INDEX_op_ld_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


