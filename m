Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5444DBDFD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:09:25 +0100 (CET)
Received: from localhost ([::1]:47586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiO4-0003ej-8R
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:09:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKe-0000c7-LW
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:52 -0400
Received: from [2607:f8b0:4864:20::42f] (port=33388
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKd-0002Dq-3K
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:52 -0400
Received: by mail-pf1-x42f.google.com with SMTP id s42so5987214pfg.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cj1Mv1TK+d1R4GNVLpYWtLlcIcx/OqQSWvfjy4IfC40=;
 b=Irf3JKD0HDQ7INP+tvbPf3Obiwy9viqWZf6YNRvDBego1xRVgux4RU2D7lToxg+lU2
 QPxP+xRPNd1+ygUEPKoqHiqSIqRBtYuQKr35IW4fFcAPnLLJKUAXIvhWi1z3ElQFa99W
 MO9T/YBpkdFWO3vRftZvaF1aL/H4aVNQVi3NP4QEbEIIbCU487foH56midMc1UmKwlsO
 DXZEI0s/KPCblRLTqXjW/p2wA3BcPkGLn+zVynKxalihqNaepWDaWHdUcJaKHsH/gIsd
 ybIu5E5rZH0S9Sa+4zl/MxeMF3MQ9tPqkZMM1GiNyPX+adosZWYtfU28d1ewiT2q4IVl
 E9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cj1Mv1TK+d1R4GNVLpYWtLlcIcx/OqQSWvfjy4IfC40=;
 b=4gQ4TG23yDtW07YchM+7VSu3U7qXkbs+LlapGHkKMHI2wTbC5seew0aZ60XdOG/y8D
 XPoGcIzbGChHEbwtKm+OOBaH2UVrqj+TYg+yIfYw26d9DHLqJViXHNk0JDTE8vruV8bl
 6zK/azMMeV95TvlDoMhCUQ5+aQQ0VErkwK+Dhg2hWIDMPHHfq7WbCxyUk2KXz9jViLHz
 XnZoB16/vc2auuzPwxeg1/03MMtM2ZA9grSE0RXFlUWQGug6rRW3ri5uPWOFwtHFoT8+
 VFZDfK81HVw+5VBuunUX3DaXYn0G186Ljqvx961G1cQ4I3/JIpPRUQ+hqMo5kRck4910
 lQcw==
X-Gm-Message-State: AOAM5317rS05DE581t+DfP0U/EH3jdXzA6thIqNgOgV5vqapEY8TWwF/
 9YGD3ez0GPwEDHmFzqUdekT5ozaCk+1JQQ==
X-Google-Smtp-Source: ABdhPJzo4tRK6Sb5drfbnSbbhcsYMn80AzjbMxSTVYMYEKld/dVAB5g9/d+auWUS1EREIn1f81LSUA==
X-Received: by 2002:a63:fc5a:0:b0:381:744c:9781 with SMTP id
 r26-20020a63fc5a000000b00381744c9781mr2320067pgk.158.1647493549807; 
 Wed, 16 Mar 2022 22:05:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 10/51] target/nios2: Remove cpu_interrupts_enabled
Date: Wed, 16 Mar 2022 22:04:57 -0700
Message-Id: <20220317050538.924111-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
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
index 9be128d63a..59e950dae6 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -226,11 +226,6 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
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
2.25.1


