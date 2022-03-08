Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A8B4D10DD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:24:06 +0100 (CET)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUCT-00084h-4o
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:24:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8u-000543-NG
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:25 -0500
Received: from [2607:f8b0:4864:20::432] (port=40552
 helo=mail-pf1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8t-0006HX-7p
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:24 -0500
Received: by mail-pf1-x432.google.com with SMTP id z15so16591677pfe.7
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3XWYwJGO3vo3kGqcNerNP/pWqNfUjJJeLFVpgy1IoI=;
 b=znPXSUpEsY1RUK6/908Q+Z+XBj4mQKT35Szu0tsWLiDznRtox+iByActGl4QztoLGW
 s9bkyGaA1n8FM8C2eAvqQwWkyDuQ3Nq4tLXqhoJzTj7VviIRm0d2kcu+9xcq/WkqC+91
 auPUBZmGku0qzHW+arwybot6N+K0VKOCygRxaSSfx7kqizN9f311G6fhFP8IKna+nRV8
 eVVVtis6GfLpePvmGCYxEQdrqrIlJJpSI4/FCuz9xx7HgUQfd4kjnncV3iRti6PZpmKF
 /sOtzAWAxokWTgGyX9AqU17ZXr9TmSRO98AEykh50E03gKoVlCQjlcf9y0HHeGZdEBvA
 vB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3XWYwJGO3vo3kGqcNerNP/pWqNfUjJJeLFVpgy1IoI=;
 b=52fi9E3FwLPpm1ydkcV2Pxu6o+lG9BSuOH9NkG5efHTSVj2dRL8/p/phIWAlc5KKbR
 AAE8I90AUKWTjtPhw0EeYJi3U3T9HjmKlzkT1cdvLQEWu4eyNtx6Kh13Zv4Cfft84DEZ
 L1RI8YIXlOp3zm4vovQ5suhu3hwLwvBTA8byUJksYuqrJ7zMzdzwCWEqTQVrYWJX3Hlt
 jsfUPD8EohKr3yvQ4qC6V4JsEbkw2NHwR3WNeegqeDz3lHQ4YVUc4s2s3FyJWQyxy0ps
 d7oRJtDt8rdDqX7zEqSxijgV4o1OCi6Gv8GyvD+ivruqKHK3GHjET8TYpEcKH2inAhLR
 /8Zw==
X-Gm-Message-State: AOAM530s4NcCpTLGhCiPTlg0HgoAj29tqK49uzWzC0kRqZLtD94Si7CI
 JiuqyihcOvtbYijQt6v/Gueo7XF+qBqqVw==
X-Google-Smtp-Source: ABdhPJzQ2UHVrnTq+rjgTD5Pd4eCdFMGw99CO6mo7TUNQSpaEVem4ri8bNAHneZtY1XCT6sgDEZmXQ==
X-Received: by 2002:a05:6a00:1747:b0:4f3:e449:4416 with SMTP id
 j7-20020a056a00174700b004f3e4494416mr17159733pfc.5.1646724021921; 
 Mon, 07 Mar 2022 23:20:21 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/33] target/nios2: Remove cpu_interrupts_enabled
Date: Mon,  7 Mar 2022 21:19:40 -1000
Message-Id: <20220308072005.307955-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::432
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is unused.  The real computation of this value
is located in nios2_cpu_exec_interrupt.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 727d31c427..14ed46959e 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -227,11 +227,6 @@ bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
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


