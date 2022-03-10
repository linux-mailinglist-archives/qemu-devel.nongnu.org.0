Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B8A4D46A0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:16:49 +0100 (CET)
Received: from localhost ([::1]:49584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHiq-0002NP-6g
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:16:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxY-0005sT-Tu
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:56 -0500
Received: from [2607:f8b0:4864:20::62d] (port=35569
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxX-0007ze-8v
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:56 -0500
Received: by mail-pl1-x62d.google.com with SMTP id n15so4609254plh.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kC6IYNjsGbxQ1O1vqjxYEFxpw4YN+TjfQjKfECaeneY=;
 b=E+FqzeMLYkMsGZA46EH5rxCmD2SIxJ64cuBJoFwAqf5xmz6H73ANYIFCxyKAJ7SgH0
 DDYkf6nzX/ODRTrt2MbcnmWSoMTtgKi9zcjIxqvH4zbblq9mhdG3ew7f9e8jk+QpQzqN
 H7bW7ls/UK3ZSUmH/lwEUkNawNe6G9rig9yc8xgx9Lb2M7sKxwg4xgv+hhA3IR1p1S6o
 GiF/YFqrBtJGqJZPUQl5N8pNBy+9ZZAkecj7TtSA597c19Q/anPdRTq96RZvk48D4/+u
 aUe5iu2lFzs8OyPW7QIuHurt/TEYeyRJxA3a13k8MmouQnSYFLJOjYV15d/nREFN0SW5
 M6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kC6IYNjsGbxQ1O1vqjxYEFxpw4YN+TjfQjKfECaeneY=;
 b=JGK3t2DPuqXNyGGdI7d1CKVMs+MCZalaq+Qdg+wbMI5BWI8Nl/WMCGvJb/u2+kT9Er
 vrVrfm1q0P3RdBBmkrfSnFHPQp82Dg/6sucULgDo5Fxg2vIQSIfRq/AIoii4qJS/tmnD
 8XbdesU4KCUnzFR7rO/zxBoR8z6CQBfMB1/BshBw1H178RKs/1ggo9+7BhuMbVb6SVy+
 kCURpOjfSA2bB9anc3hPYv7qFNArc9uFU3uhvxcBrWh6MNOhqUV2RerM4HOYaIovRSm1
 9NLL/C2h7LhY5294CjNTbPELnZ4zzaGsX4xC5yBg9deffxLOtly+jTdU923I+eJcq8wu
 a62A==
X-Gm-Message-State: AOAM532UlDsFq+fsyA5SCH6nOdgfNDs7axFngbOMe8guX69WEatMLDLe
 qYsLrygxOoP4vScobSO2kqlD4k6dZBXkQA==
X-Google-Smtp-Source: ABdhPJxfjs54To/dsxqoPwUcez210IR7RKzYrtvdry31OcnQ9zY4h/Zzg3hD/pniFVqXOknDODrF4g==
X-Received: by 2002:a17:902:720a:b0:151:d7d7:6ac0 with SMTP id
 ba10-20020a170902720a00b00151d7d76ac0mr4410040plb.128.1646911673955; 
 Thu, 10 Mar 2022 03:27:53 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 24/48] target/nios2: Cleanup set of CR_EXCEPTION for
 do_interrupt
Date: Thu, 10 Mar 2022 03:27:01 -0800
Message-Id: <20220310112725.570053-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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


