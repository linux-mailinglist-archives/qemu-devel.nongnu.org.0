Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A2A31166F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:12:09 +0100 (CET)
Received: from localhost ([::1]:57902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AGk-0004I7-W2
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2j-0002Mj-1r
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:38 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:36587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2g-0003RG-0b
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:36 -0500
Received: by mail-pj1-x102a.google.com with SMTP id gx20so4656185pjb.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pMV4BySeK8KuIUlVV1lxW3l1A4MrToushLk684ASlQM=;
 b=NG7/wbWo3MmxonFxm5mCWykFM4bZtgaQjybyFuC+q/dRifINx1BoKTBn/9ivLLcxKu
 wpD2S2OxOwFpzIGB8nBegB/ApDgfo5BKwwFiuSUge/HJorkcdDxlkb3Z4poIIpk2LMpz
 eLGHyOb7pbJiDhCzCy43TicGFTIYLv8AtaD92m456ClVFLs4EHth+3Z2JIwBeHxNshUh
 +RO97q4as6/s6rHpb/vRTnFjrHcJ2/Nq4HR2uxgx7B93f9D+yOujs2TeqayMmpgNQWkQ
 BSlxPcLMGRBjiG8ae8bm3XblZx8U/dVI+yAYYc0g688ASsVwQL5yPuxEvgy/7nN/G3FQ
 ewTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pMV4BySeK8KuIUlVV1lxW3l1A4MrToushLk684ASlQM=;
 b=fY6zQWMHZLsf8sZzXAx6/lB5n1XjI3sgA7yzFgj1Y8rkhWlvDNOKLmXx8wFnzPkq3Y
 6UF6ByS8svOayovQO+uCB6xzmf9tfUV0Je8LYFZZv8gxMyx2tzFszWqU1l/Of8ZlQmhP
 +h/vW5WDGlGx7YadJM69+HOuDTCSwAXOftWuZVtePnZ5zt5FSA5r4LKa+yjAotuL6PEw
 mdfM+NjPHjWShWQKiimf8sT7bd5U2IjB0Dq3/TSLyd+tcY7GQ4w8eAHmUQOW1RiKV0FQ
 Da2r4/ACA0ND+iLl8abGyuRD36NBRfvvsP04+eZoe+wpNAbhiLVblOsePWw2KMCQO1xP
 8CZg==
X-Gm-Message-State: AOAM533fIt9hVJnG2FN2DvgT55/Bpr2LLzyeSNnoY7dgN+ehJM9qC2dh
 xkaUK9Mfz0pzFV+wzIljlbmdWQYcX/NdVjj5
X-Google-Smtp-Source: ABdhPJxKSXUejZxFgmau9szTm0hN28vgOAHwiADFdK1P1fPt+lIp3hzPFAW9cffoXg8bkIeP6/5K+g==
X-Received: by 2002:a17:90a:6985:: with SMTP id
 s5mr2678030pjj.121.1612565852784; 
 Fri, 05 Feb 2021 14:57:32 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/46] tcg/tci: Merge INDEX_op_{st_i32,st32_i64}
Date: Fri,  5 Feb 2021 12:56:25 -1000
Message-Id: <20210205225650.1330794-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
 tcg/tci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index ee2cd7dfa2..eb70672efb 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -625,6 +625,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             *(uint16_t *)(t1 + t2) = t0;
             break;
         case INDEX_op_st_i32:
+        CASE_64(st32)
             t0 = tci_read_r32(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -873,12 +874,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
-        case INDEX_op_st32_i64:
-            t0 = tci_read_r32(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint32_t *)(t1 + t2) = t0;
-            break;
         case INDEX_op_st_i64:
             t0 = tci_read_r64(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


