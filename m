Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE914D0DD0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 03:04:51 +0100 (CET)
Received: from localhost ([::1]:36298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRPDW-0007gX-4u
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 21:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3M-0006s0-5d
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:20 -0500
Received: from [2607:f8b0:4864:20::102e] (port=56190
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRP3K-0007zM-AK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:54:19 -0500
Received: by mail-pj1-x102e.google.com with SMTP id k92so6649794pjh.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 17:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pGFeTXonQy0rWrVtOsYjIVO+LsR7JRQAF9mj6S5D/+U=;
 b=q+qhzH3a4WZrLlJxxBsELFVMnfCK8i3qw1FHUhgXJKfk8Hez6AAnrS54mzWBZDGO3k
 DCDiAk/A/e+MI4GAV/tXqBWMaAXzE2y8zIBcVxwiqFiR6xkUrlz/U7JPxO0pRlSPigmB
 opxjY0KzftyNpO1bMycRemPC0WFs4hEob4PxCJEaCCzg3ptoIQ+KqGuuePQOCHVbo30X
 NgxIP+IbMibbIhQF+DtobcrXzkLlaMpYqShuCrJ9g/Ao1l5KfgG92P3vblJNGvsSewZx
 wnwQbtpRNY+bo0OA50zcH2nz/x4/p9i+aG+FV8ElMFOJyq9KhUEm5W2fsieNGI8mVjQ3
 Y3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pGFeTXonQy0rWrVtOsYjIVO+LsR7JRQAF9mj6S5D/+U=;
 b=a2H2iVzoqvkZMenrBCDL4wm3DLkaYyiW6cX5Hwlkqlt62r4y9/J/HUPfE5zQmugUXZ
 ssjwyAShIKgqaiXxU8ieGr10Bp0BJZpuQ4QSvzIn1vzFm8N3lM9cCJ7MxlDurHSgHif3
 YRFErA/DDgnxbRTaVfq3+xml3/W/t5Z1yyTLm1K4fOWID3LfrxN+LWzQOh1coNMR8UEw
 8gHYZYztZhSrtBx5o6PLm6XgRo/N03DB0qrah4gHk5Sq1I5URbfX3O3Md2CiX8Dkqf9D
 B6lOat2KPahABNysmnAs/IFPZe4cHaW4RPCJNCyh7YydQVJGZtCdYMn52gbqngQRKR59
 G6cA==
X-Gm-Message-State: AOAM531AEfqLg+iIzi2vHlmmAfQlz3xrgbEltays5ojMk1JGZh8v1FAR
 k2fMdTxW4Q4Z7u+PrQO26Z1fN3SbE7JKnw==
X-Google-Smtp-Source: ABdhPJz3V6pWfudMGMqbatuvjyZsaIZSsfFmHAk+bNvs93d/pz3OG1ySptIacX0upOcPxl8mj0WPvg==
X-Received: by 2002:a17:90a:ab17:b0:1b9:b61a:aadb with SMTP id
 m23-20020a17090aab1700b001b9b61aaadbmr2070713pjq.77.1646704457002; 
 Mon, 07 Mar 2022 17:54:17 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm12775221pgb.73.2022.03.07.17.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 17:54:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/11] target/s390x: Fix writeback to v1 in helper_vstl
Date: Mon,  7 Mar 2022 15:53:58 -1000
Message-Id: <20220308015358.188499-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308015358.188499-1-richard.henderson@linaro.org>
References: <20220308015358.188499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy-paste error from vector load length -- do not write
zeros back to v1 after storing from v1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/vec_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/s390x/tcg/vec_helper.c b/target/s390x/tcg/vec_helper.c
index ededf13cf0..48d86722b2 100644
--- a/target/s390x/tcg/vec_helper.c
+++ b/target/s390x/tcg/vec_helper.c
@@ -200,7 +200,6 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
         addr = wrap_address(env, addr + 8);
         cpu_stq_data_ra(env, addr, s390_vec_read_element64(v1, 1), GETPC());
     } else {
-        S390Vector tmp = {};
         int i;
 
         for (i = 0; i < bytes; i++) {
@@ -209,6 +208,5 @@ void HELPER(vstl)(CPUS390XState *env, const void *v1, uint64_t addr,
             cpu_stb_data_ra(env, addr, byte, GETPC());
             addr = wrap_address(env, addr + 1);
         }
-        *(S390Vector *)v1 = tmp;
     }
 }
-- 
2.25.1


