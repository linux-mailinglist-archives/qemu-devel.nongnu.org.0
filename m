Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E07E30E9A2
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 02:51:45 +0100 (CET)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7To8-00024C-64
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 20:51:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiF-0004fg-RL
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:45 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiB-0003f7-Jh
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:39 -0500
Received: by mail-pl1-x634.google.com with SMTP id s15so877782plr.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVyouWDBw9IpYjnxIdxk6Lk2rEB7Cry5s6L8ndOAdHg=;
 b=NdoYMnjHmyQvM+j4L13WrO6BPZBj853ioYhDZGgZwFbt2clZ1HfMQQJ34JLljDJdJP
 0CVJq83vxIS1kxftApmKxnkpxgobCc6FO1DKygYaELvcNrIy3cKyX42st+AgZGAmHnub
 JsYmBDshCn29rBwvRklehCBP5kSYJMmWaAXOq/1gc6Lxm+t/IB0eX64X0hEkmNL0Y9MJ
 wv531LFWGgZtBAr2fpvCxCLr7/8rvMbtcjj2n3fahcrPd8GvuaUUdM3rg3UMFN1GqSSf
 E8WYapmRc6qduRWQ/ux+f13XeYZXYqBMqdGctMQNn9B+XCcylzP1h+ECOopPzVc101NI
 C9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVyouWDBw9IpYjnxIdxk6Lk2rEB7Cry5s6L8ndOAdHg=;
 b=NWJjHSlDmL4a0heDeMxhq9v+jW5Xbz/6nW1WGn8TOrsoVdWrd0kQ+HLpqp/aI27ul8
 ovfg/gYMUFknXbyk0DrqI/npS5RPSVVtaLG44s/A6tIUgT3RPblIP4IMDKrVVdv5E62/
 B3yGCFIPma8auLcfa9EHnOZRAJS9ufE20/ICjDV0UskIA0vR3Iw98yTibLTygMo6+VdA
 qNNaLbm4+4pVQn7EaKxMlGpH9hiXElaJcVTBoUCe/LuqohB2zG+RPj2+GVcqnPs8OvsH
 0DnP9yknVthiIEf9pWaA9F+A9iUUnoOO7PuJA7NteCUgJn7RF6pTao/yomhrwTZw5sz1
 qsVA==
X-Gm-Message-State: AOAM5337r5lQy4T4VIa7OdaVCSnLvK8tJei46cRG1VDUQ3f4TA6bw7d5
 wYEKfPOKZQoOejGVA2NQV+eAW5/LsXUjzeti
X-Google-Smtp-Source: ABdhPJyD4yERQV2D9pWHh8YGKNXx1fHZ5YST+lwnF8+sEgJutDiitcvsNrBSJ59niHYYr8Tzl/+UEA==
X-Received: by 2002:a17:902:70c3:b029:de:af88:f17e with SMTP id
 l3-20020a17090270c3b02900deaf88f17emr5771636plt.3.1612403133363; 
 Wed, 03 Feb 2021 17:45:33 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/93] tcg/tci: Inline tci_write_reg16 into the only caller
Date: Wed,  3 Feb 2021 15:43:46 -1000
Message-Id: <20210204014509.882821-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
 tcg/tci.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 740244cc54..005d2946c4 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -117,14 +117,6 @@ tci_write_reg(tcg_target_ulong *regs, TCGReg index, tcg_target_ulong value)
     regs[index] = value;
 }
 
-#if TCG_TARGET_REG_BITS == 64
-static void
-tci_write_reg16(tcg_target_ulong *regs, TCGReg index, uint16_t value)
-{
-    tci_write_reg(regs, index, value);
-}
-#endif
-
 static void
 tci_write_reg32(tcg_target_ulong *regs, TCGReg index, uint32_t value)
 {
@@ -879,7 +871,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


