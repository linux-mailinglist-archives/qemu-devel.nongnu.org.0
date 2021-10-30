Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE6440B53
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:44:21 +0200 (CEST)
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtL2-0005m9-Dq
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1v-0001Yw-JG
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:32 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:39808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1r-0002Cr-UM
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:30 -0400
Received: by mail-pg1-x52b.google.com with SMTP id g184so12997664pgc.6
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3/CJUXQvBCEoPlihnnAPxMwhS0SfN83B4jFLy6O6YSI=;
 b=x4oHy7QXJG1FCqQUvcaotGySnL91ekJfcTP+asUWAsssuCANDKA+Fveknp0lIxRMp3
 nNSYLzfqTjLaOawH8INsfwtlASoBH8fsd0ZYVn+0B9267108/ONTeoprcG4FDPqxjmDl
 9QdD3oGWg2oB+YeVk9jPw8iMtavoXibxQswO0ELwUourUAjOwTdMGyGPrHWhqJrLzXqm
 uYQi1rtdoh7I4TYUx96S92oxnrMeTfYQKhn+MCToH6JTH0EX7VhnQWZ0zPy99qq259kZ
 NHX/EE3YRErbbPL+ymOk9uQyPHEe/VXSYu8ll3uXJJBS12pNjV1WhMwk9S5lhe6p6BpX
 cr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3/CJUXQvBCEoPlihnnAPxMwhS0SfN83B4jFLy6O6YSI=;
 b=4zCuHdrtSfIZZx4IYkbAKUQsomWl4JikIjO1T2ih9EmxO0WVZ81TPZZ6EwLcKAAVet
 pleBiGvmQa93qVVombPXR66FDB8KCInVHlRfpHmgG4qb+xb5Ox8zjDxT9L2TWYb/eU7c
 s/wc8A/EdfRg+aItzdgQfJu5jzHA7iLrOnIbDS15g6v8ILOe6u2StzaXhLnzonDmnrwM
 PDk7rySyTacc9lSiPDEPPG2RgtAMUg2eH4oRzjbksjJa3H7g8xX2AcxqvNiBXG7quFrD
 sBx7B1umF3yEBUsMMSDN++W9JDfjirLb5BZHTu3PBnltOIOyk0YTFasYJ6DK86fbSyjO
 eXSg==
X-Gm-Message-State: AOAM532YcOnhjeK8XIF8o6Bh+V9OGiTp+TkaS910Zthcx0w81dTc+ZbE
 aH6RIx5rCiUbGEEMaInb19h6Hy43fN4ZgQ==
X-Google-Smtp-Source: ABdhPJzJxEriHKshKgS2pcIKKDDQk2BJUzNMQGMyP3MgZQnSsymDaqZAwvDm7ilnN+he844iwso5LQ==
X-Received: by 2002:a63:2cd8:: with SMTP id
 s207mr13595431pgs.312.1635614425551; 
 Sat, 30 Oct 2021 10:20:25 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 53/66] target/sh4: Set fault address in
 superh_cpu_do_unaligned_access
Date: Sat, 30 Oct 2021 10:16:22 -0700
Message-Id: <20211030171635.1689530-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We ought to have been recording the virtual address for reporting
to the guest trap handler.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/op_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index c996dce7df..752669825f 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -29,6 +29,9 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                     MMUAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr)
 {
+    CPUSH4State *env = cs->env_ptr;
+
+    env->tea = addr;
     switch (access_type) {
     case MMU_INST_FETCH:
     case MMU_DATA_LOAD:
@@ -37,6 +40,8 @@ void superh_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     case MMU_DATA_STORE:
         cs->exception_index = 0x100;
         break;
+    default:
+        g_assert_not_reached();
     }
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1


