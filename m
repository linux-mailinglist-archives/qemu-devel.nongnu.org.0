Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF9450A509
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:11:00 +0200 (CEST)
Received: from localhost ([::1]:60542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZOV-0005I0-FL
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZV-0007UO-7V
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:17 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:46940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZQ-0006Ik-IT
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:16 -0400
Received: by mail-pg1-x530.google.com with SMTP id q12so4878555pgj.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SgYdfKBOpD63fxeycIxvZRPC0aBEIFbrxFD/qGb/1iw=;
 b=FfCOva5lc9oge9ozkWLb84iGWfz8GYjcId9UX3dAkaKTI2HbivnjgQodWafaRKXTlH
 d+KJH/LDv4NJhmRLQAbKScpE69IfA16byKIFx8zBzcWiiSjeLVYxBT2bVUMdH5wjHMXE
 eSazFGMCC583v8cGABT5pnktlf1GR7fzT/lWeQVvOX3PYMfXT19htsoheIBfRB+Q6vZg
 XOQCxIWVex+U2SrCh+9f4a+KjIGH408zT+baBn1V+e9ykitfY8EfQgmbWUdFxLf4isxV
 NQZ6+AtKU87wZ1xFKIw0DTcbP3TalAqPL5FJZLfaA5h928tL+o4RIKve1xG7eXB/IzVq
 kN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SgYdfKBOpD63fxeycIxvZRPC0aBEIFbrxFD/qGb/1iw=;
 b=NGufuYAawYX0jbrT7obIU5+HaWa7fMxXExfDSjtbVNDEgqGyiVCyoZ+/UUZk75LeGP
 pSGIs/KJzS9utOg4F/o3VooHRsrAC9YP+eUhfplLKis+xdmG7dXuw7BiJCpmhdccizAr
 rdyjP89TFLiHeq+BOvrZywqEGMJsXIsws92alpru/d6XyHQX0BDRPTLaZogL7JkMOosF
 b7KaQBup7CKINRPuE4NgLm6VRQuEpl8MRcnVcgn8+4XSBpRUymMoUwksgUvfBQ3xG9p5
 xnfVKenu71xl+OBRP+rB3LhPTQw7HNuv6nz30N8LBMF42nBGOl/iavimd0Wqy2IDSmOz
 HOWQ==
X-Gm-Message-State: AOAM533dKLz2trvFeutQfEEXqyd3EepmeU7OfUSByqZ/7MQl7gtNJBYY
 YHOblIPLq9Eh0Mxn9RoqQZTt2/YgJP6FOA==
X-Google-Smtp-Source: ABdhPJyZOAPItrMKicRw1oPCAtA9n2QYBDNOCUgs0cPxSV6FHvLVPJvgR3kMVmJVse1c0T9uYW+ldQ==
X-Received: by 2002:a05:6a00:1a11:b0:50a:6c17:11d2 with SMTP id
 g17-20020a056a001a1100b0050a6c1711d2mr121834pfv.69.1650554290251; 
 Thu, 21 Apr 2022 08:18:10 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/64] target/nios2: Remove cpu_interrupts_enabled
Date: Thu, 21 Apr 2022 08:16:52 -0700
Message-Id: <20220421151735.31996-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is unused.  The real computation of this value
is located in nios2_cpu_exec_interrupt.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index dbd9d1b587..413e195187 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -222,11 +222,6 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         bool probe, uintptr_t retaddr);
 #endif
 
-static inline int cpu_interrupts_enabled(CPUNios2State *env)
-{
-    return env->regs[CR_STATUS] & CR_STATUS_PIE;
-}
-
 typedef CPUNios2State CPUArchState;
 typedef Nios2CPU ArchCPU;
 
-- 
2.34.1


