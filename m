Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4213376A2
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:14:51 +0100 (CET)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKN1W-00013d-Df
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:14:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVP-00045L-9u
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:39 -0500
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:39443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMVJ-0006tY-9Z
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:41:38 -0500
Received: by mail-qt1-x82c.google.com with SMTP id g24so1271463qts.6
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oqjirx8sUQyYnS7vrLSDlLS9gocI/IN6++5opPveqXM=;
 b=qWU7qEy+AXz3uN+JdV8iSEeyyQ+9oncOT+OyNCDV+YS80L+nl4HP86CwJ2IZLE0wLb
 YQ1np2bdOT3oSg67hllLRD//FRPCGRar7y6lxtsmJsZloUyF7m/hzfMwRMA4om11964h
 tohKLKCC5fRe1hMcPb1NqPlOYQk1D7rJGrjI4Ohm2qEb1F73odyxYPptdYwdB4hs8K7f
 1eoFDnnEisRwYwrRcy4r/Xl0hsSppY/Q4Bj0bBlkIu4u1bPBFIxjOdQCCXXRy8BWLPRy
 coOLMUvYBPJJyGf96zHBSo3N05knz/Ppxz1GFeRekE8JSoROQTN8ZSsbUAlNr2w8ROZK
 QyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oqjirx8sUQyYnS7vrLSDlLS9gocI/IN6++5opPveqXM=;
 b=NR4YFx0FDJQ3fNjgqQTOArah2tVgBC1dsMBfQ+2ebP/BkkCYHF7u8TaEDSNxQetwtS
 JBFp97aHXmZaYNOqQ9QGipa4h1b1Kxa1G+uMua5PxZZTaPhHmsE3QdbqNP8O96OJGhW6
 bXhtto48ov9e/Gh2GUI+qNSIS8tcqQbxzTtAyNUIUj32rVosaO2oy8IjSlSG8yhr01Uk
 BdFx8bh0sqpQpLaDDJGU/FKS8nep4ZNipcNV/x3V+SRxXGeeOtJqqaLYksJ8047X6R7S
 dhukN8d8LihhO72pPGZl4uiZ0F/k2D3VfVzLSSC0Kk77m21lB5zhU0mJM2HgtFQvbkIL
 5u3g==
X-Gm-Message-State: AOAM5339ga6Fb6Ut+OgiwuBSasvoHiOto/2bZ+Hy3UDgWIhjU0UBSwRQ
 5dfo0YiLaxM2ib1fiOiK0EfS+ZBwKyvS+BdE
X-Google-Smtp-Source: ABdhPJwMnsqFC7Ryjnqt4hEMZZ99e+Qg1ft+wFBaRmep8p/4URRSWFuiTdBpy2ZhJG9H9rCApWJ+VA==
X-Received: by 2002:ac8:5c12:: with SMTP id i18mr7525275qti.320.1615473691093; 
 Thu, 11 Mar 2021 06:41:31 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g14sm1962421qkm.98.2021.03.11.06.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:41:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 45/57] tcg/tci: Remove tci_write_reg
Date: Thu, 11 Mar 2021 08:39:46 -0600
Message-Id: <20210311143958.562625-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inline it into its one caller, tci_write_reg64.
Drop the asserts that are redundant with tcg_read_r.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 3f8c6a0291..0b2bc905ea 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -36,20 +36,11 @@
 
 __thread uintptr_t tci_tb_ptr;
 
-static void
-tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
-{
-    tci_assert(index < TCG_TARGET_NB_REGS);
-    tci_assert(index != TCG_AREG0);
-    tci_assert(index != TCG_REG_CALL_STACK);
-    regs[index] = value;
-}
-
 static void tci_write_reg64(tcg_target_ulong *regs, uint32_t high_index,
                             uint32_t low_index, uint64_t value)
 {
-    tci_write_reg(regs, low_index, value);
-    tci_write_reg(regs, high_index, value >> 32);
+    regs[low_index] = value;
+    regs[high_index] = value >> 32;
 }
 
 /* Create a 64 bit value from two 32 bit values. */
-- 
2.25.1


