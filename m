Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD4307185
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:33:44 +0100 (CET)
Received: from localhost ([::1]:51982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52kJ-0006oP-N9
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:33:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b1-0006LQ-TY
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:11 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:39381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52b0-0005md-Cs
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:07 -0500
Received: by mail-pj1-x102b.google.com with SMTP id u4so3839398pjn.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bbk4RsHUJRWlg1yK2n4vH59KVtgZMjLMkLkrn0UF89s=;
 b=c+KLjKXrWnproh5l7JJkNdXwlxBnzjY5dqTKfj5I4A3Hk/gkrtgEGnGjrI75j1cm6V
 oToK33s53JmC4HnVCPl51DyUD6L94J3XAjvjJFWCBHDQQvyxDIKCuHPzSD6CL7pcCajO
 pLJWrKZb1R28PqPLiC5Q/krG/oNtDKHpW8UpOkagwoJp4ea3LJT2AKM09paltMGMOIF3
 KYZKnRF5N1SCResaPjQUeBw3nnGSVN31DUGky8qs/dGf1o+a/Ny2jsjbkBg+/Ih/U0Ee
 /bAbaCcxF5QQuCJHcN/3p8eUcN2ikXzEuU92h6Z9F7obUIYgXhaG4bK0dcSEkQ/6yJVs
 ObIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bbk4RsHUJRWlg1yK2n4vH59KVtgZMjLMkLkrn0UF89s=;
 b=b41MxtZr1QNGkyPPmqDpDG3/PpE2ENRSqWCIwlrYBlTdJgL5wGdMowg1D14ljhfx3w
 9TyWLqmyZVKWk8K9bgsC/+dmULCMSdWJUoEZuG5trybQvXlVbjbTGjcKolk/hiQq/cRg
 bfM754QDAZU4xYcN5QcNQufS+pfTCvqdIV5zjkkue4vxxTCKW/YIsLgHoRLjOA/Dgi1g
 4G+1xOiqebxXKsavlCpKZNSmgBJCf5ZAH4YVVD1LvKXiZFPfPwDW4xXfiuq3p6REDluB
 fxYpMl/blK25onoV29FEWcz1QNx9xFmamDyiLO0nloi3IN3RnbgzMOVeXD0DouJn/W4m
 TV3w==
X-Gm-Message-State: AOAM532uu4tRWZcFRmv/1C345hgtq1kOsVnrC2YC4eYnT6z5owPK43d4
 lAUuF0Imx1d0oN5UURCpymdO6PRIQYy3HKLB
X-Google-Smtp-Source: ABdhPJwxSc6EhvgORShOe4KRgSLtwoJGlvAwezMyUPJGSfgw5tzUOmFRZI/M4XbCNzU2f8W3+7D82g==
X-Received: by 2002:a17:902:ce89:b029:df:c98f:430d with SMTP id
 f9-20020a170902ce89b02900dfc98f430dmr15696043plg.18.1611822245159; 
 Thu, 28 Jan 2021 00:24:05 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:24:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/23] tcg/tci: Merge INDEX_op_{st_i32,st32_i64}
Date: Wed, 27 Jan 2021 22:23:27 -1000
Message-Id: <20210128082331.196801-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
 tcg/tci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index c4c303f874..66b90f8489 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -620,6 +620,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             *(uint16_t *)(t1 + t2) = t0;
             break;
         case INDEX_op_st_i32:
+        case INDEX_op_st32_i64:
             t0 = tci_read_r32(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -868,12 +869,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


