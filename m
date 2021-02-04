Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E230E9DB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:03:47 +0100 (CET)
Received: from localhost ([::1]:51698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Tzm-0000f9-RV
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiW-0004zh-CI
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:57 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiT-0003pO-HC
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:56 -0500
Received: by mail-pj1-x1029.google.com with SMTP id e9so830340pjj.0
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pMV4BySeK8KuIUlVV1lxW3l1A4MrToushLk684ASlQM=;
 b=qKoRnNM1V0rKUajNMEYrupKr1+Gxq4lBoSBpOzjwIwrWH2fFvl10/2P0IVCTcgnMWD
 /SvdNztn2tBMUiPhoEmgaHkzf3SYIxt9M6y/KvwiAMV+CEnuPzZ8HlAa6ik7g73eIvlJ
 7ynCPjkOdcAp3ILeW9Bk1pzKYycixP1mtKwLQTkVKSDRwioj6KfcS3AhUJyZxfv86xcU
 fkUfSERsSX6W1E6MPBY8s4eU3Tb0SUkjaK8XimlnnAk8QmAtocSDLv1O/i8ZA+XixAz3
 pMJKMpo2H1t9pwGhNhzN2Z0AJ2u6Aa8aYusrH8oDhWdIF6KW5Ir8lXU9TSrWsfkXTIrn
 nC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pMV4BySeK8KuIUlVV1lxW3l1A4MrToushLk684ASlQM=;
 b=htnXhKIQ58OKDw2tKHnJO7NDkyo7Yb1m/v2G98OJdOAtirUE7+3z8yraffxNBxcfgi
 FmvA8WBsX+ZYutGVQsQP7r7GlX+6BrGmA6wVyxH42NSAEH9h5PsvEZfWSFhpMjDn1Too
 UGBWwYXUE0i80V/YeLg66CSPkXFRBe7N9F3NHumfx2uaRj7LRBvyjOsT/PoPNJwKFKXA
 amMLcT4O7vbq5ZPVDjGS6guBOSE33JsIzL1uVaIZCufL653v+WdtCxh82F+l5/4JiTF/
 +sNotcn20Y4Z/mZgKGYKXp/wpC00I00dN8BiOLWzzsju01pYuxJaFCNAnhnhhQjRnUPU
 0MSw==
X-Gm-Message-State: AOAM53141D22GhV71aYK+CXQK/KxWB/0wJlwkMAUCkGGens/LrkOwqtK
 MJA54WhctadjQPGGAq/jNLjZko3w1oe2qpc2
X-Google-Smtp-Source: ABdhPJylIsj99THRzvGTc6Gi810JoHk+e+xJB35z6HyB414HdkftwyU7zYacuk2o76/Fe+p5pFkraw==
X-Received: by 2002:a17:903:181:b029:df:c7e5:8e39 with SMTP id
 z1-20020a1709030181b02900dfc7e58e39mr5921269plg.25.1612403152244; 
 Wed, 03 Feb 2021 17:45:52 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/93] tcg/tci: Merge INDEX_op_{st_i32,st32_i64}
Date: Wed,  3 Feb 2021 15:43:57 -1000
Message-Id: <20210204014509.882821-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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


