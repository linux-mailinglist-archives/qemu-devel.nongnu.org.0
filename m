Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F5A311677
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:16:56 +0100 (CET)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ALP-00012L-Vf
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2j-0002MZ-1e
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:38 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2c-0003QJ-8s
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:36 -0500
Received: by mail-pg1-x52b.google.com with SMTP id z21so5585086pgj.4
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=acbBM9pC8e1A/bvx5nB4UsPCm3LAoSp/wHIVXG+hEzA=;
 b=Ho2RXL3wttU4qf3EWy18fqovU+Z2TFG4Kj9IH9nc4ze0uA7inzIiig2wrC6cNN+2Eg
 OkFBDtdrOWX8wkXqlrnlpgQhe743pVaf3E8+YKSdYE0w22/mWVechQls8d+TsaUgrFB/
 kJq32+DzXCzMaBeqig83wATIyNOUl/c38ESm2T84iWuQMoZdh3FaQyo6nDl9hmoigKTF
 1xf4oajjtko2yTcKFkabYvWQ0vu9HOhKgkJsanNFovHls7ipfkd4w+q6uW2il5x81wKj
 899sy7vlD6DvmjJRI4s/XmD8Dqg3z2nTtkH2FKcDEymAOFKzFKoNuO/UOOZCnKz6h8Y4
 W/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=acbBM9pC8e1A/bvx5nB4UsPCm3LAoSp/wHIVXG+hEzA=;
 b=UjuIjkKenOwV2MLq0qd351qMtIfpvrF6wSemOqz5N86mVx1SV7mpmt94iLWXgr3r1y
 tA80rGbVNbhz2DOIAUzVtDrED5NfLmgr1bmV0OVyOW3I+E2c/R9natwc6KPLXjm4NKPH
 L3acxaucdEcxwJBRvdXC1AzYUywKQhY7Q7QYturX5jje2uyesM0hMeE9x0cWvup4KEJM
 zK/WFf8izh5v9P9wyvtCOmZawwSmC96ZGhq7sKm0/O4P19kdTW7IaJhbZi5cDPeE0ZYK
 97sTjinJSkRSYAH9Ctu7m8CBxOJSlzOx5xbv+TJ/YjyTruDW7OFcsjxxbLiPUy2yntcb
 OOMw==
X-Gm-Message-State: AOAM531LGDL4YoqP2L1GMxqwbQUZLsIZ65F8kke3+cDdAIqpq+kYz2ww
 ZY+tqWEAPkMp+HW6Qb5CLW0+PhlOl+BD930n
X-Google-Smtp-Source: ABdhPJyYhAAEkT11f86R3T59VIwrw6yaHf/audB7fq/NjCh1lfcNXz2gGjTBgr/Dk9BIWKDiAIkGgQ==
X-Received: by 2002:aa7:8bce:0:b029:1b8:f395:87a with SMTP id
 s14-20020aa78bce0000b02901b8f395087amr6498574pfd.36.1612565848984; 
 Fri, 05 Feb 2021 14:57:28 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/46] tcg/tci: Merge INDEX_op_st16_{i32,i64}
Date: Fri,  5 Feb 2021 12:56:23 -1000
Message-Id: <20210205225650.1330794-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
 tcg/tci.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 6819c97792..fe935e71a3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -618,7 +618,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             *(uint8_t *)(t1 + t2) = t0;
             break;
-        case INDEX_op_st16_i32:
+        CASE_32_64(st16)
             t0 = tci_read_r16(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -874,12 +874,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
-        case INDEX_op_st16_i64:
-            t0 = tci_read_r16(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint16_t *)(t1 + t2) = t0;
-            break;
         case INDEX_op_st32_i64:
             t0 = tci_read_r32(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


