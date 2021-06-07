Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622039E4B1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:03:00 +0200 (CEST)
Received: from localhost ([::1]:41560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIeR-0001sI-K3
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa4-0006vK-0R
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:28 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa2-0007ps-8Q
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:58:27 -0400
Received: by mail-wr1-x42c.google.com with SMTP id c5so18396571wrq.9
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3o+F7dXXTuRNIJT1bjRgyFBMN63vTycsmuk+MLAR1w=;
 b=jWoYWYco0+YDUugtGfd3I7WLDBKPJYUQP/13p6ddmHaadMMb0C5N3g2fXdNIECbbgv
 s8KdTqo1CojnOPYIhtkiPPiHblZUALVWkRZGfrP7lux5e7hkssj8P6OS65pEB1Lfq96F
 k4FpC3/PgGIIbSysrZcIxVRZjXsBksorq3KXI4YAtvBv3eEta1xhLKy0hPVlecDIf7kb
 CFUz2xkP+6Ro6nm7Aktw8GFOEfx4TztvbJ3WMjYm4WQPA4Wzg+ENof3YiIv+cfP8wdjU
 QR3SHQjk8fRmcChdl1hZHz349JX7MHpmrTssqCrKsNuky0TDGco+4Y0y+OWIvo3ykfsK
 5wiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3o+F7dXXTuRNIJT1bjRgyFBMN63vTycsmuk+MLAR1w=;
 b=aC9PHghQ3VmS9FKe/zzsIENazcf2J3fwwX+N4P7sDzQ+TXvFmvDb45DhEXw5xe1/7R
 EmiU15bFN+HuZro4JABTnD55eU9WFHVvnr28tAiMAKXQ0xtU9DbILYYsfrHoAuyPD+EH
 J1+ju/M8o0B3kT+V1zpGJqkslqWzKdYwwPuC0joDBFmujVrnW3nX3+1Vc6EIFCocQxpm
 gImCHTiZaJIjCArf3ZGwnXNGhg0g/CPivcnkHn2lKx+dlb3bPNohU5bz/jl2oPyUDQzz
 xAP8OIqsGEHcFQQVIiWJbZQZfYfBUw0lnbWje5cavzH3QV9V46OukuUGhmzYTgv7AXyV
 wiaQ==
X-Gm-Message-State: AOAM531IWgzLDPZwN0pPsaIW8yzdO7IxPwfT9cgBX/66osqJrngo25Pw
 IK0IFJD5P6Nmd0SyxbcSKVflQRPrEpl3JFgZ
X-Google-Smtp-Source: ABdhPJy6B4ikOAphFhFSunKGgC+kVp9sv+ESBT4KynQdQDV2ngGPBV+DLhX5AYSI4o5Gktl5fYMfXQ==
X-Received: by 2002:adf:e943:: with SMTP id m3mr18064269wrn.384.1623085104944; 
 Mon, 07 Jun 2021 09:58:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/55] tcg: Introduce tcg_remove_ops_after
Date: Mon,  7 Jun 2021 17:57:27 +0100
Message-Id: <20210607165821.9892-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Introduce a function to remove everything emitted
since a given point.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210604212747.959028-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/tcg/tcg.h |  1 +
 tcg/tcg.c         | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 74cb3453083..6895246fab5 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1081,6 +1081,7 @@ TCGOp *tcg_emit_op(TCGOpcode opc);
 void tcg_op_remove(TCGContext *s, TCGOp *op);
 TCGOp *tcg_op_insert_before(TCGContext *s, TCGOp *op, TCGOpcode opc);
 TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *op, TCGOpcode opc);
+void tcg_remove_ops_after(TCGOp *op);
 
 void tcg_optimize(TCGContext *s);
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0dc271aac9f..262dbba1fde 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2649,6 +2649,19 @@ void tcg_op_remove(TCGContext *s, TCGOp *op)
 #endif
 }
 
+void tcg_remove_ops_after(TCGOp *op)
+{
+    TCGContext *s = tcg_ctx;
+
+    while (true) {
+        TCGOp *last = tcg_last_op();
+        if (last == op) {
+            return;
+        }
+        tcg_op_remove(s, last);
+    }
+}
+
 static TCGOp *tcg_op_alloc(TCGOpcode opc)
 {
     TCGContext *s = tcg_ctx;
-- 
2.20.1


