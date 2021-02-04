Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962A730E9C0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:57:43 +0100 (CET)
Received: from localhost ([::1]:59942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Ttu-0000kr-Mf
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiD-0004eG-RZ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:41 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:37449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ti9-0003cr-5y
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:37 -0500
Received: by mail-pj1-x102f.google.com with SMTP id g15so826703pjd.2
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Md45LaRHqD6ZCRI/YVUcF8sf7nVG5D4Ru9kLS7nSJTY=;
 b=aXD9l4pgMwIO/k7i+7Ytk+UunDqxo/ZQ8zY9fAtkgD8DJamUS3gp6xMsY0fwL2ePI1
 ZMOJUmYzQ3pzn/JPAvpNpIaIAzZ54zRisoss6tgQ7BL+lktGhLpZRQ8vpC+2Pc2/JjqK
 dC/S/ai0VI3UV8iOWMCzDMcwFv7DcLPQKXljpWB6fQqtUQWo/aDh42jPbWDlSrJtqqvq
 ZmHtwE2srZ/TDkLvT/nw8ok1mHl5uUGQPd9/G46bAHeDytJfy9u1yLiJVwDt83nSpnRv
 duMM9Odckdi8ATYFARV9bmzKS2+S4Mi4I53cd+vcaqOfw2RN4nDf4/2k8tlWpB8/JjyC
 kznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Md45LaRHqD6ZCRI/YVUcF8sf7nVG5D4Ru9kLS7nSJTY=;
 b=DmsfCEoZXVv7fNWdT8VQJg3IF2xBsLavONLjIO56SaIw2YKBEoDgDFcbT3f/AbcKHX
 KRR66YtgytD7HShBJQAjwN6tUiipkMKCE99EHT6LQGSEgltxQ/7btM/BzW796TEmp0yq
 xXdPHw1qNG6wlfujm+peWuTUjBY9K6HKbvgKa2LfPZQ2QXm9ICg7aZFIfo8yC2qIsv0L
 3EEmC7hNlWNMQRgnx1wXz9DYjB26fN8xyfypq+gZAQZYt0R6smW1GKWN70Oz8oEp2Dj7
 89OxHhanhY+it0rUq5N+JkM8iOeQJ97oVWbxNF2+Z4xQJXxnm/vn6dIb+fasbAJLLA/m
 0f7Q==
X-Gm-Message-State: AOAM530bcFNSIJqVpOsgakGkdCGkkkfORslW2v9FunnHTPSj+H+847SW
 /eGedQmdvguLuoCZFoRVuZe2Mh0iPh30dN2R
X-Google-Smtp-Source: ABdhPJws9yTw0KJ9SL2XfmEU1jsF2MHVYtUKeIMa6HeoyheqdKVuI/w51B4gAx8X/EWxwIAPitnWWg==
X-Received: by 2002:a17:903:31d1:b029:de:8361:739b with SMTP id
 v17-20020a17090331d1b02900de8361739bmr5733316ple.85.1612403131584; 
 Wed, 03 Feb 2021 17:45:31 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/93] tcg/tci: Inline tci_write_reg8 into its callers
Date: Wed,  3 Feb 2021 15:43:45 -1000
Message-Id: <20210204014509.882821-10-richard.henderson@linaro.org>
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


