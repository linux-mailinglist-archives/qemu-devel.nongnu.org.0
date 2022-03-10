Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DF94D4638
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:46:49 +0100 (CET)
Received: from localhost ([::1]:38548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHFo-0005R4-Uk
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:46:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxB-0004so-K3
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:33 -0500
Received: from [2607:f8b0:4864:20::629] (port=38560
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGxA-0007ug-1C
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:33 -0500
Received: by mail-pl1-x629.google.com with SMTP id n18so1911358plg.5
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tamfos1uvfrgy6OTL/hYTKA67kxVDj5ysduH3BCBsBo=;
 b=fzlO5ezHc+T+qu7VGgr9u06EGqUV5gVCp/LwBqeG8sXDfp3Er+vnfBg9wvxduT45P2
 R/fUdwAGiW5csZDxdijov0r/Ec8jXJI1PZbqaEuxOILfCVitEd5L1Ye/Cl/SsJ+EQ0gi
 o8YW12wT27lTlUCWiKgSSS/zn9mBZEsfqwdm+8i2FKuNsijhKiLiAOCJRv2+XiI3aZKJ
 PVEjtQaH0rCL4ZcV/TXNEi1z24YB6YpYm3vxyb+Rp5EnQomD0oeQMkn59UT0KuGGSXIz
 gGczvDe37J1uAA44C+ApEKZUMhpC7WY+AKLRztNNk4MDNTuP+skvLcexpStZY1sVOKCY
 5tOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tamfos1uvfrgy6OTL/hYTKA67kxVDj5ysduH3BCBsBo=;
 b=WOWzvn+HwMB8eIHT4IY2+BDRb2RQTHmT6hm/DU7Zpj/5Navk8qHG4DOH/pyOkP3OsC
 Rw87mo5wsaGP4cr03HO5eQpjgGLBaD5ZzXpOH6AWdB8FQAp86YO9X9sR4+Lr17EvKjYl
 4Cmo6m3ozV0une65KY0IK22+KrHGzkw992n5Oxzo5Zafc1bobca9umX4PQ/T01ixA0U3
 9c6+XTZfIPMr4Mf1mcM9a4094CcrOxtbRqcfAzuqPEAwMYKd3Uzgntd1u1n3zZJIyQX9
 R8p2RHCZ2H67GTYz9Z6WveF7a7tCW7WU6i39mhuXgjvx5y2r0Spr70j0M0vCS8uFtWB+
 wg7Q==
X-Gm-Message-State: AOAM532oxIyJzjFGLouJdwo3vC2SvYUOabGADGYDx2x0+4L26bOLgsLu
 msRZUXy1u8pgUCg8ubeX0M+X4d5PBnJKzg==
X-Google-Smtp-Source: ABdhPJxkgnUqEEbPF3pIH/tNAuvp84zAlx/kbUotyapPVNtzFzkT5KHbmswpXPX2XmdUo0B9DF8C6A==
X-Received: by 2002:a17:90a:da02:b0:1bf:3919:f2a with SMTP id
 e2-20020a17090ada0200b001bf39190f2amr15435804pjv.208.1646911650188; 
 Thu, 10 Mar 2022 03:27:30 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/48] target/nios2: Add NUM_GP_REGS and NUM_CP_REGS
Date: Thu, 10 Mar 2022 03:26:40 -0800
Message-Id: <20220310112725.570053-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

Split NUM_CORE_REGS into components that can be used elsewhere.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
[rth: Split out of a larger patch for shadow register sets.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index ca0f3420cd..adeb16377d 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -56,9 +56,11 @@ struct Nios2CPUClass {
 #define EXCEPTION_ADDRESS     0x00000004
 #define FAST_TLB_MISS_ADDRESS 0x00000008
 
+#define NUM_GP_REGS 32
+#define NUM_CR_REGS 32
 
 /* GP regs + CR regs + PC */
-#define NUM_CORE_REGS (32 + 32 + 1)
+#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS + 1)
 
 /* General purpose register aliases */
 #define R_ZERO   0
@@ -79,7 +81,7 @@ struct Nios2CPUClass {
 #define R_RA     31
 
 /* Control register aliases */
-#define CR_BASE  32
+#define CR_BASE  NUM_GP_REGS
 #define CR_STATUS    (CR_BASE + 0)
 #define   CR_STATUS_PIE  (1 << 0)
 #define   CR_STATUS_U    (1 << 1)
-- 
2.25.1


