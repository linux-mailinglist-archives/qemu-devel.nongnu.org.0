Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361EC4DBEBE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:51:32 +0100 (CET)
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUj2p-0003rl-Ae
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:51:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKs-0001J0-84
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:07 -0400
Received: from [2607:f8b0:4864:20::102b] (port=41524
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKq-0002H2-Qp
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:06:05 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so675561pjm.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kC6IYNjsGbxQ1O1vqjxYEFxpw4YN+TjfQjKfECaeneY=;
 b=kJ0Y7HEYKbNdPW8liQQ5iRDrIhi9hCabwJN5Egj7VfvJI3apLC8ZnEupX0rJ8kNeiL
 iYIAuQOnptEaSoavex+2GjCuBicw44CtF42SQfvhYeq6Q1FEz5pW5nakZmNEzG7rAYf7
 JIiaF65e+wnpqz3TMothlTDxDn3ZVB+CXWzEfGr4V7k3GfooWRFsJSgdGqPC1Sge8FQc
 HfXAJu2JAgpv12lX6RhDAIsfH2odeOIK0vHdzVocUeUO/sm1PCR5PoJy5h+0xmcEL7vE
 8VBHwAMcROc3k2BCk942J45bRURS0HPKdzquID7zS3JbhgPy6zsKbL0TEtNHysi3oJVB
 uZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kC6IYNjsGbxQ1O1vqjxYEFxpw4YN+TjfQjKfECaeneY=;
 b=1WvmQ9cqLTjmJcMZ1bUw98OpsHg76gJfT3Pl0cYs2lAU0FHH44UaTVr5KkeYBb98OT
 GH1QBFH0Dmtb0HviYrC1/Z4hCX/TZDEUDyffKoBRAwG9iD46Tzt5fi1TFyC7zTI/aLXu
 X60HuZgF58FeOSXHCYGYnLLvsQfWVl8eN+FCr9z1GesouXLTzXBOmVM1iQf7Q8UBPlSs
 4eGOmaXhusWSI2bacpN8UYeL3lbrEajtv6mhxcqBdz3meBpRh5TuGD2oOtkPR5L1x9zr
 DYm+HJWTUeuHFg4j3oFiMwb2CPUAOSPi/F3i11xpT4rlJUiNDhLXs6sZ5X28jhQuEvqd
 jlWQ==
X-Gm-Message-State: AOAM53041Z4ZPaU/UG01BDvRO2orwBC3GqqASHS0Lpd+mRZBG/xhO5oI
 K6e8R/AFcrVD5QSIqSgNrkQ7pqsBalHaVg==
X-Google-Smtp-Source: ABdhPJzWFt9ouedKWm0UolL7cN/glf8QdAOReApphDymAaTuVjeHniXXo4vTQQUSufoiFQEg9Ojj1g==
X-Received: by 2002:a17:90a:6393:b0:1bf:70e7:27d2 with SMTP id
 f19-20020a17090a639300b001bf70e727d2mr13737240pjj.1.1647493563508; 
 Wed, 16 Mar 2022 22:06:03 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:06:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 24/51] target/nios2: Cleanup set of CR_EXCEPTION
 for do_interrupt
Date: Wed, 16 Mar 2022 22:05:11 -0700
Message-Id: <20220317050538.924111-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The register is entirely read-only for software, and we do not
implement ECC, so we need not deposit the cause into an existing
value; just create a new value from scratch.

Furthermore, exception.CAUSE is not written for break exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 0392c0ea84..afbafd1fdc 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -74,9 +74,10 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr, bool is_break)
     new_status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
     env->ctrl[CR_STATUS] = new_status;
-    env->ctrl[CR_EXCEPTION] = FIELD_DP32(env->ctrl[CR_EXCEPTION],
-                                         CR_EXCEPTION, CAUSE,
-                                         cs->exception_index);
+    if (!is_break) {
+        env->ctrl[CR_EXCEPTION] = FIELD_DP32(0, CR_EXCEPTION, CAUSE,
+                                             cs->exception_index);
+    }
     env->pc = exception_addr;
 }
 
-- 
2.25.1


