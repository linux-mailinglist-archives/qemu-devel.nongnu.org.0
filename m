Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1603350BE79
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:20:44 +0200 (CEST)
Received: from localhost ([::1]:56278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwxX-0007KZ-6a
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXP-00027u-L5
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:43 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:45975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwXO-0007M5-5S
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:43 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h12so8424275plf.12
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3aQg/hoAbUd4FyanyKyY4J09ziZifM+SJiSbzB2iG8g=;
 b=tBN8LNzL6jSk5sv/ETsaZyIrJ+cHtoLOmh/vC3zLWdDWa4viW0JZ0YLeR+VnpjTGW0
 3mHnL5guwAZazuewRrnlBcB4p8+NPSdK6KJgrdVpxWQ8LydCrgQ4reNW2iGpPPZR0IWn
 g9FBk9RYCk/FgpD1wk7bv5fNlY4TM5m13XyZ3L12KKzktcPp6WYsoJCU50LWqP7MdU33
 wWVZFdyF8r5dw8NVo9wHC8lkQAvBxhMEx/bLtwRcNvWaw19/fXJptPQeac8TCB8BuEsb
 BXVT6PH6OmiHZYZcdDKeNwIhZ21bUepTeptWt88AzqHVdiA480SF+6xNiO4YTstCIAmu
 +YkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3aQg/hoAbUd4FyanyKyY4J09ziZifM+SJiSbzB2iG8g=;
 b=VGGLtFoH2U1Et4WMwJ9RkzJiCURa4zmuOXYHPfhsiYmjTwhAdLtH5xnxZacz6apnLz
 tfo/duc9n79ZFjRqgGGpTsC5Dp9lJQozgT29iiOc97m96SPuMuc1nuqqEvGbfd/NEBFB
 xQQ2AGJ7aOJtkmWu+j6OVdnxU8mqNXKwONWxUVUe2O/ouLsXLUBP1cNWHn7GuO+u7Cg8
 Q0F77YRrHuX3KTT72dgoM/kBHGgBmX3nQL6SIdi00Z19fXZiciAlyPLkwhsXo9PP9z4z
 NfLMS5SxXA+dLMHdjcYNXEP8No5VoK2ZFxx4v07ig5InxzolN7lT14oSXcNgF6PzKZoo
 opjw==
X-Gm-Message-State: AOAM530fo6qY43VcQDGDsCz9PGWOyIN3mbj3M7jiB99Yd5TmY4/Q1dpd
 Mtjx87kzPV+L3S4cCSI0m9G0KDe4zjpuUYL/
X-Google-Smtp-Source: ABdhPJzQ9bB00tmM1vQ4sxz3PwFbD4rh2Hb3YBRfiaeJSpd+sF6PISe7FwfDFewva5C3bsDjV7yR5A==
X-Received: by 2002:a17:902:aa8e:b0:158:e94b:7c92 with SMTP id
 d14-20020a170902aa8e00b00158e94b7c92mr5543498plr.126.1650646420773; 
 Fri, 22 Apr 2022 09:53:40 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 34/68] target/nios2: Handle EXCP_UNALIGN and EXCP_UNALIGND
Date: Fri, 22 Apr 2022 09:52:04 -0700
Message-Id: <20220422165238.1971496-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

While some of the plumbing for misaligned data is present, in the form
of nios2_cpu_do_unaligned_access, the hook will not be called because
TARGET_ALIGNED_ONLY is not set in configs/targets/nios2-softmmu.mak.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220421151735.31996-35-richard.henderson@linaro.org>
---
 target/nios2/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index c57ffd64e0..25a89724d0 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -99,6 +99,12 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         case EXCP_ILLEGAL:
             name = "ILLEGAL insn";
             break;
+        case EXCP_UNALIGN:
+            name = "Misaligned (data)";
+            break;
+        case EXCP_UNALIGND:
+            name = "Misaligned (destination)";
+            break;
         case EXCP_TRAP:
             name = "TRAP insn";
             break;
@@ -147,6 +153,8 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     case EXCP_SUPERD:
     case EXCP_ILLEGAL:
     case EXCP_TRAP:
+    case EXCP_UNALIGN:
+    case EXCP_UNALIGND:
         do_exception(cpu, cpu->exception_addr, false);
         break;
 
-- 
2.34.1


