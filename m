Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178A130E9CB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:01:17 +0100 (CET)
Received: from localhost ([::1]:40690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7TxJ-0004Qk-3f
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiN-0004l2-Me
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:49 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:42495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiL-0003k8-Ct
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:47 -0500
Received: by mail-pl1-x633.google.com with SMTP id s15so878014plr.9
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ILdwR5pcSGw7723xZ1U2bA9/JhsnvGlthCTDNdPrhhQ=;
 b=oozajDP2aARzt/Jp5h4z5+b4IwyfwMOpvRz0yvq61ZmHFhVhMydHUYUghXwINtwm6k
 8Fc+zwIie81G7+2UoiXV8EX0oex++Z0ZsL2yB1CxOjHKNa3ePrYYzVdLHgQ1ShoOKaaP
 DyQXELBkLSIl9jXj36mVDiDxAwMI9epeiEUzROcEabSWX+bee2zyAIzBEee9oyWvlDnC
 z+1Dj4/FzC56DXDnksW4WebP6tGQgxxh9atPT8r3XPJkWU2BocOd3/A58wMdsApmvcPR
 17rwR6a36fUAMLKp0YL2ioBOAx7fiSwYE3C2n6MAPFJjesTpoa9bwiFNVioTKDBbzXlD
 n2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ILdwR5pcSGw7723xZ1U2bA9/JhsnvGlthCTDNdPrhhQ=;
 b=n6Ibav+Jnxn5/zFkU1yLFT1T1jzIW8xJzxwJE7gV8jSXqOReP/kKfCHqT5Q9G7Upv7
 wg7mt1bvagSzq1F0Oyr1CpEMA27k/t+ch9hjNMxrWi6PrSQHR67hHEXmojPmk6zOkHWC
 DyvbalFR/A+Os1OM1uD3fvBSz5p+HdIjuA2LQ9rsnK0MsoHt1QaBkT2omX0OpGWIgAKx
 sx8AVdCX9fVZ/5HF7i2xqiD/ktv0Fnc0zN+ZYt161PPrk8xAEb4fyxULj7eEjphMttK8
 VLtB8YXIMbXga4ThC7Q/nDSlaoOKLyoBiyOXNnydKreI8c6/8TEVxMdA/cZ85LtYp5q/
 VKGg==
X-Gm-Message-State: AOAM533sMRVCCh+tgrPuhW3kKT31MUmMmgZPI9LdMpSgZA8PfC4mMRGY
 iD9kiSyIPwlOo0eAYMgdL0J+kin0m0AfBDtO
X-Google-Smtp-Source: ABdhPJz32IvJS924JiN2Oc4GzLGkCZ2GT1RRPX6SgjwHaK2ZvPUwRNl6XDOdNXqaEXlXIYCSlx5pQg==
X-Received: by 2002:a17:90b:23c2:: with SMTP id
 md2mr5842366pjb.222.1612403143889; 
 Wed, 03 Feb 2021 17:45:43 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/93] tcg/tci: Merge INDEX_op_ld16s_{i32,i64}
Date: Wed,  3 Feb 2021 15:43:52 -1000
Message-Id: <20210204014509.882821-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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


