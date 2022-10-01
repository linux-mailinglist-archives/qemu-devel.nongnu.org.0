Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B5B5F1E35
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 19:11:05 +0200 (CEST)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeg12-00028B-7n
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 13:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIB-0008SK-PV
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:43 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:40818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIA-0006Pz-AA
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:43 -0400
Received: by mail-qv1-xf34.google.com with SMTP id h10so2940438qvq.7
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jXnTwa6UKQ364zxEijW2Djrh5kilE9wYQnYihj42TBk=;
 b=R9TBDEyIw/OhkqaRe38OjF+Trcs6rUGsG5b2Y2mo+STfUllsnAnG5KOow3CzVktoXh
 0/KKjtKKNmHXYNPFHokSv/x4Mz0/Ljk2uV0RTD3c1SUA5xaNDv80C+zDftoLgsKcvch4
 LmVnw18kr4baldr5rwpNG1gTahWIIHrDfZ7mbsirVaatmBHFyhDnbznxXF33v/9wRApl
 TVv2Bn8NKJ2Po7MANgOXN5uyELC802oqkTzegnAyq/FRqtxLBjZ6A0XTVLQNGro+fS8I
 iyy7KHRsERb5DjEb9EuA+xYHf9Xy77RlbQn6yvMUqNzk3PIAlxROuVbnGEj0N8AoO/nV
 k0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jXnTwa6UKQ364zxEijW2Djrh5kilE9wYQnYihj42TBk=;
 b=yr25tA0NsWxsWaM8m1dZN972VmBHnU11LtaFXgVHhjV7MSA9igsd/5DFhmu0mdSj9f
 JvMSh53Q/frVrcMyKJy8yX5qMcmB0GwTmIPB46S76H+5O9Nc1tazCK4LTXGdSeJHHYcY
 11E4C8Ym5TCp/ba8iGAULFDDRnizoEBOmUNCcCUGf4FsiW8BRgHPdkPfuGxlEXAhLHO+
 WxEasWfekRLx85MpcLNlV3t0IQNgeX0CyfFaRMc2OPXPgNkv4Q+Etcm8Qwpv0BAUt3Ta
 xyMAKI8pV+UOmVhhfIu1ul82SUxRsSLp8RKHnwsW4Rfk10EsV1B76TIbCGeV1K7BBwdG
 TdwA==
X-Gm-Message-State: ACrzQf0HuWX6HaraT55aotdEj2+dDegUkbfbeu271wrS860CUaXUZtkd
 is7pE2UsDm1HhLI/M4110fW7VAG5AZEtaA==
X-Google-Smtp-Source: AMsMyM5SblLY4qZRYt+/Xf83vqUnyQTt7HEq+QiJcUCpAnNK3GYExWBb/kqiJPQE2ydBeHrjUdRVcQ==
X-Received: by 2002:a05:6214:4110:b0:4af:b016:5ff8 with SMTP id
 kc16-20020a056214411000b004afb0165ff8mr10169281qvb.118.1664641481366; 
 Sat, 01 Oct 2022 09:24:41 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 32/42] target/arm: Extract HA and HD in aa64_va_parameters
Date: Sat,  1 Oct 2022 09:23:08 -0700
Message-Id: <20221001162318.153420-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 2 ++
 target/arm/helper.c    | 8 +++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a50189e2e4..e95b6b1b8f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1014,6 +1014,8 @@ typedef struct ARMVAParameters {
     bool using64k   : 1;
     bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
     bool ds         : 1;
+    bool ha         : 1;
+    bool hd         : 1;
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 19a03eb200..70ae3816b9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10280,7 +10280,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx);
-    bool epd, hpd, using16k, using64k, tsz_oob, ds;
+    bool epd, hpd, using16k, using64k, tsz_oob, ds, ha, hd;
     int select, tsz, tbi, max_tsz, min_tsz, ps, sh;
     ARMCPU *cpu = env_archcpu(env);
 
@@ -10298,6 +10298,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         epd = false;
         sh = extract32(tcr, 12, 2);
         ps = extract32(tcr, 16, 3);
+        ha = extract32(tcr, 21, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract32(tcr, 22, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 32, 1);
     } else {
         /*
@@ -10322,6 +10324,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
             hpd = extract64(tcr, 42, 1);
         }
         ps = extract64(tcr, 32, 3);
+        ha = extract64(tcr, 39, 1) && cpu_isar_feature(aa64_hafs, cpu);
+        hd = extract64(tcr, 40, 1) && cpu_isar_feature(aa64_hdbs, cpu);
         ds = extract64(tcr, 59, 1);
     }
 
@@ -10393,6 +10397,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .using64k = using64k,
         .tsz_oob = tsz_oob,
         .ds = ds,
+        .ha = ha,
+        .hd = ha & hd,
     };
 }
 
-- 
2.34.1


