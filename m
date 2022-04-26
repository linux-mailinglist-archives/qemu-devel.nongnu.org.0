Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7E510755
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 20:43:49 +0200 (CEST)
Received: from localhost ([::1]:39314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQA8-0005dX-PE
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 14:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmc-0002ck-NX
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:30 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPma-0004QK-P6
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:29 -0400
Received: by mail-pg1-x536.google.com with SMTP id z21so9083025pgj.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WDgeHzUdOULYKlRg869VIeEkdCFXvvv6jSBdC5RVE7o=;
 b=OPPpJ95oBR+hnc38bznC0AoirOBDhlNwfwHvEoh1EqDxLGEi+fntxY1Iazj5lRlfOx
 mDBQfTw8brFMSt9QEi7c+vlazgph2Hfc2MYBT2gBl8CvcHzIwGEQwKzvYnxOveZtmrcQ
 Ll2F2DzuqtEW6O6GDOGNii0N42Wv8gxIcsOSnTqJwiV7kdJEy1ZT3jCoVKmWEAJR0507
 XqW4v0dK16JeNK/p62VvPnoQ0WK7atvB7K1aoDyK/ZzI4+QeO52ktIJVrKDWhlG8rUuG
 ngx2+naM3AczDrOK0s+qz49lJWMYcL4dk3lF7RGKOTzLOgWAJ96vefOSyCWUZdoH8gzA
 Q4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WDgeHzUdOULYKlRg869VIeEkdCFXvvv6jSBdC5RVE7o=;
 b=CGlJZloHN0MWfwohFZ2q4tATdcbqPTg8va5Pnc9ddkgofxuvbKK6Pp03cCx1JuRNbX
 dQA2Oy9vieefAXFYN8PnoAWvapAsU8f0HWfOZwCj4HNd/OgGE8hKdonzvOw3zpN2lOK+
 Zh9vIX0cBDVOjw+QiTE8JPmPFEovu4bj1eUQv5dioDApOghse+48lh5abA6U56HBjzfw
 mcZ+dOi+Ti5hiBw+B37eq5ykxM3pQelbePZGE2rKcw6qvuefYJnjzpv3gcr0xIBHU3aB
 qzuezXIJ9y1aop6OWUDS++YXjgKu/3v4mjA/LXrg3/QIL7MfP47WZYXc1ycsr9xw4KH+
 tSKg==
X-Gm-Message-State: AOAM531tLgZK9EqA/1cJgm5Snjy0tJogG73Db3OkoRZ0LqNA+SZweYG0
 2bBSJ4DTFrPAvh7X0CzdcXNQYtmtur0MpQ==
X-Google-Smtp-Source: ABdhPJyS6bLQvTMM6+RCYubxmZSK39Txa7lDEGZUC5r0w1CSlkxY3ybkcI/KyahCzvY1tINUSPN1wg==
X-Received: by 2002:a05:6a00:b92:b0:50d:440a:b9fd with SMTP id
 g18-20020a056a000b9200b0050d440ab9fdmr10474181pfj.31.1650997167528; 
 Tue, 26 Apr 2022 11:19:27 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/68] target/nios2: Remove cpu_interrupts_enabled
Date: Tue, 26 Apr 2022 11:18:20 -0700
Message-Id: <20220426181907.103691-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Message-Id: <20220421151735.31996-22-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 7c48b3452f..6bd8367eb8 100644
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


