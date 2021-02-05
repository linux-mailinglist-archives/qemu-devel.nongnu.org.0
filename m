Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F333311662
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:07:03 +0100 (CET)
Received: from localhost ([::1]:40724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ABq-000589-Ee
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2M-0001o2-56
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:14 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:45624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2K-0003HW-K2
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:13 -0500
Received: by mail-pf1-x432.google.com with SMTP id j12so5282379pfj.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Md45LaRHqD6ZCRI/YVUcF8sf7nVG5D4Ru9kLS7nSJTY=;
 b=j0zAkgiJqpGgZajxpqlw7xdsRquSXFHkmM5kDRwyEqzNp3HpSXGHOnazqsm6aARaAG
 yVDr30vD1YjM0JKNyuXjeWaAY6dE1eyXtazjUAAXi5i+ZqX6PHX2hXc+HtH0zRjRbJd6
 H+IEMEZjaO/eHdqt/W4D2U7zwHfUpfW6jDnAtRWeOWP+ZVfEuPp6YXbRjJi26ozs6WKi
 udvIKvNtFyVKuzirGhcstQejFPlMSNWiKNfMfbPoaHOQXC4L7z2q5aSDUEiNDH0Denwd
 Nh/cpJFykLwDVojqsO3G7ybtQR17Cm+/JQjAbEHbNzP0v1xSp+bzPv7Kiot7a/BwgDZh
 2Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Md45LaRHqD6ZCRI/YVUcF8sf7nVG5D4Ru9kLS7nSJTY=;
 b=Eu8wY+9SN2IJK68lpHgmONGC2b5FJOu1VF910USrnkxhBxJGMHGYGZ9Ytkt2y+7LRD
 lnlXlNJqUF0JiTPrX2Iq+CoI3ZE9pds++26555SMoq6tRK5p7rFlZPstPrPDvSLILO2n
 jOfwtcYYgNzWRfJIdIyHlhgoUvrLjkKVAJKMrGGzJ7ABzJi4aJejcnt4O++yaPmkGrQG
 Y8XYb/EC/1v9AvjFwlmkuEPhClrup0jMblGJrYpg+cKQnrOCmPSNLt/U9TNli+AfdlrC
 E67EAey55ejxE+wS6amAWRDgbu/o3gZw67wbe9cSTWcz27n0sPmIXnhlw6ZrKfA4S0QE
 ngTQ==
X-Gm-Message-State: AOAM5305Jfe9VrTyJLDfD98W7QwJ9n37brbwBtWc1mOWx0In2YCOAdEH
 iMn47z+/H6Bc5GP4jRE2iRB015CapvAEAyV7
X-Google-Smtp-Source: ABdhPJwjE9rwLFouKScj5Y1SMyzx3eJOcL7dr2ezTpFM0E8KDSipH58KtvGAzW9dDTGPaimDNJVUQA==
X-Received: by 2002:a63:3008:: with SMTP id w8mr6391426pgw.207.1612565831377; 
 Fri, 05 Feb 2021 14:57:11 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/46] tcg/tci: Inline tci_write_reg8 into its callers
Date: Fri,  5 Feb 2021 12:56:13 -1000
Message-Id: <20210205225650.1330794-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
 tcg/tci.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index e8023b5384..740244cc54 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -117,11 +117,6 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
     regs[index] = value;
 }
 
-static void tci_write_reg8(tcg_target_ulong *regs, TCGReg index, uint8_t value)
-{
-    tci_write_reg(regs, index, value);
-}
-
 #if TCG_TARGET_REG_BITS == 64
 static void
 tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
@@ -598,7 +593,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i32:
             TODO();
@@ -872,7 +867,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


