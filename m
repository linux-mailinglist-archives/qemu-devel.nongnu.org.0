Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B33370FFE
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:07:38 +0200 (CEST)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldM7d-0002Zw-KD
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxz-0007cx-3r
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:39 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:54932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxx-0000aW-CU
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:38 -0400
Received: by mail-pj1-x102e.google.com with SMTP id g24so1297961pji.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8Q+L/ANN/2V3zSy9+qKxW8Y25JlTAe4jIjlKvAbT7ZQ=;
 b=gLlM6aoVziIfReuGBsfZb/JvloWiLSEpzvhYHBfZbjwaLUpw6mk1aj7WAZVZbmrblk
 82GQ9v4nRXI+tFfmYpOn97hSeqzECrwq7ijieMyCFPyekRET8pIRWdfDwdNNAxC0aOqb
 5hKf9Xz551E+3Lh4I5M42R5CyuF5XXhhIEmDTEkZzhKwHcL0Tz43jOk80AVWDOwtHhy0
 bL0uYscq6Uk/0KTPPMC7vlMSWbkbXLNglrghWKS2XSEtOxNS/kous6LdkpRzFa8/LDfD
 ehie8gGxW6WDUcsQoBiaa0fPxpxCR8y3ktZNBFHA1wNgjrGioUlEV21cR4/ORMhoCUAJ
 dnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Q+L/ANN/2V3zSy9+qKxW8Y25JlTAe4jIjlKvAbT7ZQ=;
 b=Eho2u3pSYQsG4MYt1jFkKMDU6lYBZcYDI4kOiBAVONNNR7TK+6Kx3MIEt6zordX2lI
 z0qUneT3YqhCjvUFZQrwwd+0N41diRGN3CNPRGAiktC2Mv+cs5IctRpQDXNIiQvTD1pm
 2IT2HJm6x8uTerbupz2W47wm/Qno9Bqabm/QRQs+xEPoUgqfTqorA4aQ07Kz6yEN4//y
 Nm2bAIM6Tm01tEDZaIx4eiZmE/YWFrtUj0VbW4pE/guhvhBjAiBEZOLfkUSaSEY8AGAh
 LDdSJi5fA5MpBHYJWaxZ7RqdhV2jbp8tGdoZS3YKh/5SPtnYZUga45mUj8EkEkCO5FFt
 o9lA==
X-Gm-Message-State: AOAM530inKojTbCKpDm9iW+ucs+3NeTc6O4ebko0a0S9ThUVRf8YBvPN
 htqeFxJJn5mIvaCMm69zfKlpjuJDk4o/OQ==
X-Google-Smtp-Source: ABdhPJzQe/cRDCwBV3sEmd7h0PAiqlBxxQ2503KnXI9IWv5kfNAfw5UsXW5juRNaT7qodjqX/siUoQ==
X-Received: by 2002:a17:90a:a384:: with SMTP id
 x4mr10933916pjp.201.1619999856115; 
 Sun, 02 May 2021 16:57:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/26] tcg/tci: Move call-return regs to end of
 tcg_target_reg_alloc_order
Date: Sun,  2 May 2021 16:57:11 -0700
Message-Id: <20210502235727.1979457-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the only call-clobbered regs for TCI, these should
receive the least priority.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index fb7c927fdf..288e945465 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -170,8 +170,6 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 }
 
 static const int tcg_target_reg_alloc_order[] = {
-    TCG_REG_R0,
-    TCG_REG_R1,
     TCG_REG_R2,
     TCG_REG_R3,
     TCG_REG_R4,
@@ -186,6 +184,8 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_R13,
     TCG_REG_R14,
     TCG_REG_R15,
+    TCG_REG_R1,
+    TCG_REG_R0,
 };
 
 #if MAX_OPC_PARAM_IARGS != 6
-- 
2.25.1


