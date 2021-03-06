Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB3932FD99
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:44:20 +0100 (CET)
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeih-0002AB-7Y
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb7-0006wQ-Uv
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:30 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIeb4-0002xR-Dp
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:29 -0500
Received: by mail-pl1-x629.google.com with SMTP id s16so3093365plr.9
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yoPJEjHaD9Y/eQNAtgp4CmM0ipXsKYPy7ttmPn2mZ+I=;
 b=rOlUwhZveo5K78xMo/r7QuADCmv/49FiRyu0Qfun+mEkkkkovN2THMZe32D2ovRvK/
 /5y0HXP8frJv8VXEJLFLBhKRv6pzPq6WQNR5aFTIqqjRYdPjMTx10HDugd3xw8E386f+
 MBabnETGgZJGavT+qZIjb6ms6dvd6k1migMh/DN5JA/Pp7lOFrZFoa97WkN1nVJQPqRi
 y6uJfskWz+m9MfZ/6Edydae106baB5caWYFfo/zWSlceryPhfpGLj2yRRkjcPRhamrA5
 UlE0O/PhavRKyLoypRqO3i0VPo2aEs69FUcnpOEtzC7Z/YYYTaGv/huzx6zm4dyBfrVN
 NWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yoPJEjHaD9Y/eQNAtgp4CmM0ipXsKYPy7ttmPn2mZ+I=;
 b=QK1Nfyt8Nbgkmbx/oxvIZSPR7SUFBFZ11UVfRS4NIKs17cagh3WkRvYLYCr5imN75G
 qpzFZqFHBCKdfwlx7SnqmHrkNvLB9KPUTtDCH8P/UsVkMaeRHLd4vNlpNhIT2PWtpDN0
 X/dkVT43cMvhMYpHVmXkttxoY8eFfLCf5Abmg7Md7M1/hcWAj73ZCa9pHTNufxsk8IOu
 2L6gRuR74HeJ19y4cy0bLOgouzNtBNPHw5pZU0IpQZHBUdGmgVFDsaOQsBNu08/0WQal
 DmoTD7MKjLx2vzonC5biafl3yTJJEx5Ft0m7OEORVQas+DawhewzmeIax7l6gvAA785Y
 IcEA==
X-Gm-Message-State: AOAM531piCTqz80hE5C4fEKKKEu26FaQmtXPna9jWGQ1qG3WK5ux9Lqu
 z7+BL5ZFzrGZXNNkYpEUREMnnLZnM+CN7g==
X-Google-Smtp-Source: ABdhPJyf2dqsz4kXkbjojrw9O2Yj3s/JofybGWYfG8hXpCqbwEpt1WiSNjjeMVnY9aDqMCeZRuIUgg==
X-Received: by 2002:a17:90a:2a46:: with SMTP id
 d6mr16781290pjg.197.1615066585065; 
 Sat, 06 Mar 2021 13:36:25 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/27] tcg/tci: Merge identical cases in generation (deposit
 opcode)
Date: Sat,  6 Mar 2021 13:35:55 -0800
Message-Id: <20210306213613.85168-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use CASE_32_64 and CASE_64 to reduce ifdefs and merge
cases that are identical between 32-bit and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210217202036.1724901-5-richard.henderson@linaro.org>
[PMD: Split patch as 3/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210218232840.1760806-4-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 1896efd100..4a86a3bb46 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -494,7 +494,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
         break;
-    case INDEX_op_deposit_i32:  /* Optional (TCG_TARGET_HAS_deposit_i32). */
+
+    CASE_32_64(deposit)  /* Optional (TCG_TARGET_HAS_deposit_*). */
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
         tcg_out_r(s, args[2]);
@@ -505,15 +506,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
 #if TCG_TARGET_REG_BITS == 64
-    case INDEX_op_deposit_i64:  /* Optional (TCG_TARGET_HAS_deposit_i64). */
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_debug_assert(args[3] <= UINT8_MAX);
-        tcg_out8(s, args[3]);
-        tcg_debug_assert(args[4] <= UINT8_MAX);
-        tcg_out8(s, args[4]);
-        break;
     case INDEX_op_brcond_i64:
         tcg_out_r(s, args[0]);
         tcg_out_r(s, args[1]);
-- 
2.25.1


