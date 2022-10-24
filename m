Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C58609AB3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 08:45:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ompsm-0007NQ-Tf; Mon, 24 Oct 2022 01:20:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprk-0006ZM-0b
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:20 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompri-0002Kr-4Q
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 01:19:11 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 20so7829908pgc.5
 for <qemu-devel@nongnu.org>; Sun, 23 Oct 2022 22:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALv+diZzer09a5GMXMjosNYk9lCWFpNzZXXMnFTG3Zg=;
 b=Z2KHSzBAkg2Xf11Snoc26pJ3BxAl+a9asBngWvnZ4nfKXr85BySTz7+awp+hZUV4H4
 Ps7VmOF0gzlKaovvEpxhxgpfiHnR+YebjygBpgaAvya8dtM+CGQXZV+gWqsVkzi/soem
 7jRYNyZaHPmXYOK+EN001GlKqwDcVzBGuEIgN4dNVbF3p7d1CZWkaz+gUHDdPQJCaugU
 3CL/dmQfwVxNAeWY4xQx0PVbWZ4ruZcQhoIHlRHkA1fcX2xBqxt9zhWpJIAJJ5kTIS/3
 R5adtZg0+UsshaABgNBMkqL0HZOvxjXuMJYTmk6Nx8hoR1sxYyhViGnkdHjN5z6mJ1Om
 I6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ALv+diZzer09a5GMXMjosNYk9lCWFpNzZXXMnFTG3Zg=;
 b=TN98HtCTQiKI956bqsTmr/nz67R6xBas5lZUWQElZqen8RNOnpE5pkkj1i4eGssiPE
 i6C6XIixdz1xDUVZ5NTHDJZtCUU8+OSjruTEnQkWXYkDESqguttJgqK/Ubl/kq72WCbu
 sj/WBxD6sQo9aCdM5XmlK+9dzoeom53r6Ncdk1ne/tIHDwnvdRBFdcxrGcg+C0nnELjc
 V5ktrEJKNHwISbT6UBXe8pZ+yfeldLX52N9KufIw6k2t2fBa+eStd+LuaDTx4R8+u7id
 xK7LjAzm+Cp2QyMnpQvb3PktFrYs9vFgJ7kfkswZp7kpuZ7JNWZxPsChO306rS1YydLe
 BDcA==
X-Gm-Message-State: ACrzQf1lan3wwOqKq4NwKWfsxLJ1PYD81UWiZWrGrcJL9YBt5vrKW5uA
 8GhhrICfoMSSPcV0l1x2qTxAKg5CUENLYcha
X-Google-Smtp-Source: AMsMyM6LXmN6OclQ4zEEErtQhstcoGRZjyi/BT0s6LouQ6w121FzM6DeA18RcFP03R2jhuwmBjjzEg==
X-Received: by 2002:a63:b545:0:b0:43c:2ad9:b00 with SMTP id
 u5-20020a63b545000000b0043c2ad90b00mr26701098pgo.535.1666588748701; 
 Sun, 23 Oct 2022 22:19:08 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 04/14] target/arm: Extract HA and HD in aa64_va_parameters
Date: Mon, 24 Oct 2022 15:18:41 +1000
Message-Id: <20221024051851.3074715-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2b6889073d..16d7989604 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1046,6 +1046,8 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
     ARMGranuleSize gran : 2;
 } ARMVAParameters;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cbfaabbc09..6c7a8beed6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10470,7 +10470,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, tsz_oob, ds;
+    bool epd, hpd, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMGranuleSize gran;
     ARMCPU *cpu = env_archcpu(env);
@@ -10489,6 +10489,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         /*
@@ -10510,6 +10512,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10577,6 +10581,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha && hd,
         .gran = gran,
     };
 }
-- 
2.34.1


