Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E8C5108B5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 21:10:01 +0200 (CEST)
Received: from localhost ([::1]:48922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njQZT-0000oR-W5
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 15:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmt-00036x-J2
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:47 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njPmr-0004Tr-WB
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 14:19:47 -0400
Received: by mail-pg1-x52c.google.com with SMTP id bg9so16714677pgb.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 11:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZiQ5sI/cjyhT5QWt0cEWlmc3OyTlqSds1eKWRRIBd0=;
 b=oWKXsm6Fvpz4owPvl7ah9WpanGyQFjkx7XSPNHrXpZ6V6nckqLMmciJ6MAcY84tSmE
 bBwXqKYUKX/QAXpXC4+/8lLUxEYT1aufk5qoTMvUAvg+rjFMjfZk4CWzHBy+M4EuABkd
 OjCmDkyF5+hGj0aXTwAXcn6sLK9dBonvr0M3efoLo5KSZeaxSIRXXxvGFSr4OZF0Gkjv
 jpTmI6btkvgaS8MVvtfSxwYExOXV9hiZJTEvnaaGhIybZj+dZ6szRlfYkPZKTPYowjMg
 XFXzqy35vn/epgehLCvb7QwwIdUNg0xtNjULGetwwsdqmqePKvMRHsmIciK5qTspOuG3
 rh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xZiQ5sI/cjyhT5QWt0cEWlmc3OyTlqSds1eKWRRIBd0=;
 b=WITKrBaUGsDGOQ3b8RyopGYUX3WE9h1OTxfKUEjso/othg8b9e9SXmKTu27iFThobk
 AySjPVCNVz8ykk93d/8D00F+n8vDIZ2ORyNc8UyJAFua9m2hehuBxupYp2nKod3tonvF
 KS/BnObxN1V0crReAu3eOr+CB1rh/bU74qcwlKBsCY7QBWGgdc5ihLfZ2mRScfV3e9aM
 NO1p2iDYyWFsTWoXBtPk54mxYJxHdEZV8dOX6NnAfERayX4jXN0l2oTXtzpFdRHMXA1K
 YxduHrnEZl5sLkLHSPt7IEbGhfJYVzgkiSXHukkkuu/UBu6CkA13NxvWA2y0ZHq4xtH4
 Tg+Q==
X-Gm-Message-State: AOAM5310XF4HUMTDTFHMaqfLtaafiLzSAV2XUNDzM3FQrTQ91eWiyda7
 qkP+laGFMRh2JcJVRDov8TTHYeUmkRORfw==
X-Google-Smtp-Source: ABdhPJyUrKh+Aho88Ye8Whu0c6P+acAPu16v8OH9n2mPjXIEoH6SGun7yLve2OxjqcKt65xdnfm5Rw==
X-Received: by 2002:a05:6a00:1d24:b0:50c:ec18:5085 with SMTP id
 a36-20020a056a001d2400b0050cec185085mr24219178pfx.60.1650997184740; 
 Tue, 26 Apr 2022 11:19:44 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a056a00130700b004b9f7cd94a4sm16482827pfu.56.2022.04.26.11.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:19:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/68] target/nios2: Implement CR_STATUS.RSIE
Date: Tue, 26 Apr 2022 11:18:38 -0700
Message-Id: <20220426181907.103691-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426181907.103691-1-richard.henderson@linaro.org>
References: <20220426181907.103691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Without EIC, this bit is RES1.  So set the bit at reset,
and add it to the readonly fields of CR_STATUS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-40-richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index a0c3e97d72..7d734280d1 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -54,9 +54,9 @@ static void nios2_cpu_reset(DeviceState *dev)
 
 #if defined(CONFIG_USER_ONLY)
     /* Start in user mode with interrupts enabled. */
-    env->ctrl[CR_STATUS] = CR_STATUS_U | CR_STATUS_PIE;
+    env->ctrl[CR_STATUS] = CR_STATUS_RSIE | CR_STATUS_U | CR_STATUS_PIE;
 #else
-    env->ctrl[CR_STATUS] = 0;
+    env->ctrl[CR_STATUS] = CR_STATUS_RSIE;
 #endif
 }
 
@@ -127,6 +127,7 @@ static void realize_cr_status(CPUState *cs)
     WR_REG(CR_BADADDR);
 
     /* TODO: These control registers are not present with the EIC. */
+    RO_FIELD(CR_STATUS, RSIE);
     WR_REG(CR_IENABLE);
     RO_REG(CR_IPENDING);
 
-- 
2.34.1


