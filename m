Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A8307199
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:37:03 +0100 (CET)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52nW-0001Qm-1G
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52am-0005kQ-GP
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:52 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52aj-0005gO-N9
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:23:52 -0500
Received: by mail-pj1-x1033.google.com with SMTP id l18so3842614pji.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cOgrGYJ9ocKkQI1BJmncTz7ux/wby7mu15LsccKn+9k=;
 b=HTvH6tltENJGruTIznKyOu701bZoPaRbJFyljVg9BUtRmrgzNGEe7EgCOwb5ZsmNiP
 TThOHrOGh6KyoUsPYru7jJuUU+PEZbKBkbFR7Nb6bDxKonXi04/oLHeT+KFSSDQqYTw2
 vW8J9nRzD4033SEh9wRF1aovRvyGu39sE/bk6Sdvy7T2zTA9Y9O0CEHKqXESD4ODUCvn
 GlKpbWBRfU9y2Ft+X1CgtngSBFvV2GsFT4L4usN36C7mgFZA0GxgTQN21OOS03WGv7/K
 CxAmxSAX+dzWKgY+YVegDXAEM1K1L0y+RSHbjTne3SVAKB0ieiF7wRpbVXp/CC2JQDXs
 27/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cOgrGYJ9ocKkQI1BJmncTz7ux/wby7mu15LsccKn+9k=;
 b=PHHwIJIgMI9MrnMGQfV5Bc6OOwhSGyEniSjJG/vo5N8VDSqG53scliizmU4pevij4i
 sovr68JaXFe/g/6CNk/zcPDhy2Mg18jdwdpriROTJQC0R6vHNgBmhmPZcUSPq4XIx6cm
 MlszkRJas1LB/Dq5a8QzVpZwfcY9X7fxI12WSzJtx7PWhCj9PJlIpHkk0W0n0u6nP47X
 OMQ8LNfrj6JWRj0JrFfSgYZYgeE8txDIw85+wkX52ftaKgU1lMZSjSGvDE8LbkzfxQkW
 cxI9EAg/n4/zov+cgMQUzgfE7DcAtuyy//Fal6re/JjZJL53kyv266n3bQi0Ali9wH3F
 KntA==
X-Gm-Message-State: AOAM532rWLmRNPY0zdOGRBtNTjhtw42Dy8QGGFUV6T8PeB7o8Cl3Bucm
 6qSUdr8CO7ETk5lU9qRuzPlLLuz6cqoqyGDU
X-Google-Smtp-Source: ABdhPJzotY95/T+836ekQQ1XWJWGQG/Q3pVP9tM1frev/I9MszzvLBkhNIdtfwBTvscgMWQkPAW7RQ==
X-Received: by 2002:a17:90a:c404:: with SMTP id
 i4mr10109369pjt.57.1611822228536; 
 Thu, 28 Jan 2021 00:23:48 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:23:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/23] tcg/tci: Inline tci_write_reg16 into the only caller
Date: Wed, 27 Jan 2021 22:23:16 -1000
Message-Id: <20210128082331.196801-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 7797558b2a..0b27f26cfb 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -115,12 +115,6 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
     regs[index] = value;
 }
 
-static void
-tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
-{
-    tci_write_reg(regs, index, value);
-}
-
 static void
 tci_write_reg32(tcg_target_ulong *regs, TCGReg index, uint32_t value)
 {
@@ -878,7 +872,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
-            tci_write_reg16(regs, t0, *(uint16_t *)(t1 + t2));
+            tci_write_reg(regs, t0, *(uint16_t *)(t1 + t2));
             break;
         case INDEX_op_ld16s_i64:
             TODO();
-- 
2.25.1


