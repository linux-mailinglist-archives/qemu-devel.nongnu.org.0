Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C2311671
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:13:29 +0100 (CET)
Received: from localhost ([::1]:33050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AI4-0005jz-5q
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:13:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2Y-0002FG-CX
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:26 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:46297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2W-0003O1-Ra
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:26 -0500
Received: by mail-pg1-x52c.google.com with SMTP id r38so5545771pgk.13
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ILdwR5pcSGw7723xZ1U2bA9/JhsnvGlthCTDNdPrhhQ=;
 b=ZWGQKYb6ajAYjfu9TGU7TQ1HwLDIEjAUCHDpqk4+cCNPli//UTLsfrpNADI/7W86vY
 al4nQyFI1QHZR6ECP3pjEjdsv05CJuFil8/XmobPDB7Ejsq9LeNZPhMpURPjkf0Kotm9
 7mN4JhrpR9tFPCv1eA/iyV1mgpxj8xhecWFCZr3e+Uw6hyLqgmNiEOi2V7AwfLOwcs73
 HbBTRB9nZVxxRW+ZMYUlWa6mUyCNZmaYU3SfPoBKuDyk4u51FqoL1el3k2Vw2DengGCg
 m83Y4s556zF7eCoYTBG3KR17tp4Bu3bfJ5QCSUd2fqycA1iUdJvQwETPYdchNH5f+0IC
 nENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ILdwR5pcSGw7723xZ1U2bA9/JhsnvGlthCTDNdPrhhQ=;
 b=NJB7GHKWSQc58mx8OPrKs/v7M7vmo+PKmiLzGVLC9Ggjr4kWbApL6AfxCTtGI35Qfs
 4D8ymld8yBUkOxxU2f5DhQgNo4DIohmXdru08LLw2KFPwsx0bKWZLFe8OIZoOvnfjbMm
 kjDXnN0jKspbZLb+YLPNNMKMZSkRzGNMEQn/dmseOTZtA2qCCq5Og/wMLHQJDJfwyM8L
 i9c9fzrI6SRoAUU7FOozibAra1Y4+PAiHUYYhJtkqEXvjrJhFFOrVcNiUG0/tR+N+wVt
 wBi2Aw6RL4PfZW0gFzHyZDIKnGEhQ2gMD26g+FEerR9IuZGHOn5chTjfaktQT7gH0aCk
 9G+Q==
X-Gm-Message-State: AOAM532sJhBzW2dcy5CFaTJFuqCYyHqxFgHaEGVJVIo+DGmeOrEDZVQ3
 F80c+KahWyleziH2fGdjW+noPkjn33fzrm6X
X-Google-Smtp-Source: ABdhPJxFfK83wA+MQ1xwnlZsmVVhrwNR6ETgROURFIArrxId9KUH/4eAeFoleEXMB2SncR5NPDygRg==
X-Received: by 2002:a65:68ce:: with SMTP id k14mr6572066pgt.401.1612565843769; 
 Fri, 05 Feb 2021 14:57:23 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/46] tcg/tci: Merge INDEX_op_ld16s_{i32,i64}
Date: Fri,  5 Feb 2021 12:56:20 -1000
Message-Id: <20210205225650.1330794-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Eliminating a TODO for ld16s_i64.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index b64d611ec9..259a8538bf 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -599,7 +599,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
             break;
-        case INDEX_op_ld16s_i32:
+        CASE_32_64(ld16s)
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -861,9 +861,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
 
             /* Load/store operations (64 bit). */
 
-        case INDEX_op_ld16s_i64:
-            TODO();
-            break;
         case INDEX_op_ld32u_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


