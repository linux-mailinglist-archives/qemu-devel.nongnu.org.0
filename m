Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392596F519F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:32:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rF-0004Qs-AJ; Wed, 03 May 2023 03:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qL-0002wc-Py
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:05 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qI-0001ki-LY
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:05 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3062c1e7df8so2315149f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098642; x=1685690642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMynriKgHY7/a7Zeekt4jsXQMXu8INdJVu2wztuImV0=;
 b=Als4ASNY5Sb69VM6a9i+l45M0rlLow4ok7mKgMkc1PfmuQdCdduK92uW+AyTYRIKyo
 E9s3cmgAaQXvxE2hIZAYr/GBJbY/BQBOfDtwvftvgjf5ePPOKqegtECvjleDnUgHz+i3
 0VbqadMOv+8u79z6sLcTgaNmCff1gd/yShDpoqOYCb+svRyRL/cbDyThkvWlO8+HR6Uy
 ZKtiHRpibZUQqpsldHdbDpIwTXQSQFS6cx9Y8kexKJwmN+JPQy+e4sgs4oLceifXgKVi
 +p2/oW8glgJyseJ7OFA1r2yZo5IJf4sSNMyNKgjrggs8vuSIBfzRKqSP/iGaidJn/iO8
 Cf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098642; x=1685690642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FMynriKgHY7/a7Zeekt4jsXQMXu8INdJVu2wztuImV0=;
 b=fd/bmX+8gZmpk8mr6+eiWatCU5EaTUFXx6IkHn0EmYnoRbzK4yehW55IbG/7dEtccC
 KNV4gc/l4mG2vjFkNVw3GikL/wu4ppiDQbOnrrM5mU4IrLx0FhNmzF2OKX0cdQGiSTb/
 tSvFk5kPNV8oQqf+A/39J67fdNTvzGzqsZ4j69jVXsmAkmaSlku1xJ+0ZeKBWmAsjLAn
 QQKhS8LjeQDlAcjaaJaq1i7Pd1HkQ+4iYdwaoAKwT2tETo1Ar+FOnxxvLA8HqMMtIWBZ
 fzRpZDrYrLYUnJ54bRMCTm4ID7ZecMHnu0TcICj/P6ui3SbpOXFeJMst71GKt55OW5b3
 8m/w==
X-Gm-Message-State: AC+VfDwo0Dpf5AxzkNjrozBkPG5LabyFpHNi6C6We6KjETf39eqOpWEW
 kynXjGhkkePYwAgh7ZN4lBa9xEPKG3gsVb+z4BFcPw==
X-Google-Smtp-Source: ACHHUZ6h+BAWpMczV4l7ZXEba4lzCqAcH6ctrzeBf178JNj9QBBHHePaJkYFM9uG3ogDJ52E5BYRBA==
X-Received: by 2002:a5d:4536:0:b0:2f9:4fe9:74de with SMTP id
 j22-20020a5d4536000000b002f94fe974demr14595525wra.16.1683098641736; 
 Wed, 03 May 2023 00:24:01 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:24:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 38/84] *: Add missing includes of tcg/debug-assert.h
Date: Wed,  3 May 2023 08:22:45 +0100
Message-Id: <20230503072331.1747057-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This had been pulled in from tcg/tcg.h, via exec/cpu_ldst.h,
via exec/exec-all.h, but the include of tcg.h will be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/cpu.c      | 1 +
 target/rx/cpu.c       | 1 +
 target/rx/op_helper.c | 1 +
 target/tricore/cpu.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index a24c23c247..8f741f258c 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "cpu.h"
 #include "disas/dis-asm.h"
+#include "tcg/debug-assert.h"
 
 static void avr_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 67452e310c..157e57da0f 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "hw/loader.h"
 #include "fpu/softfloat.h"
+#include "tcg/debug-assert.h"
 
 static void rx_cpu_set_pc(CPUState *cs, vaddr value)
 {
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
index acce650185..dc0092ca99 100644
--- a/target/rx/op_helper.c
+++ b/target/rx/op_helper.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "fpu/softfloat.h"
+#include "tcg/debug-assert.h"
 
 static inline G_NORETURN
 void raise_exception(CPURXState *env, int index,
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index d0a9272961..7fa113fed2 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "qemu/error-report.h"
+#include "tcg/debug-assert.h"
 
 static inline void set_feature(CPUTriCoreState *env, int feature)
 {
-- 
2.34.1


