Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6DE46DEF1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 00:16:41 +0100 (CET)
Received: from localhost ([::1]:43496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv6Ay-00048W-F6
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 18:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66S-00058A-EM
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:00 -0500
Received: from [2607:f8b0:4864:20::42d] (port=42665
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66Q-0004mt-5n
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:00 -0500
Received: by mail-pf1-x42d.google.com with SMTP id u80so3745688pfc.9
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 15:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8Odri40+f/dUoIsb/bgSIF+/bcyc0os3qiW/fNyIHw0=;
 b=aGP/X3W0C6PCiBh8YmcA7oZxwYFBL7hHkZKp+cfNv0qAi7nP4jbDHPXInWXSdUl3Sv
 wbmwJSwk78QrrU9Nn4HHVXOgYGymMI4BxvRkA98qGqh26L7F4ruRVrHNf9Thfy4IlPwm
 RNv8nDAOHwV4G6bWBbaHENyXWqHMnjT2Cft0s4qC6hQQ/b9HbGjwISvKRtwD2QtnS4v+
 e72rKA1JciX5MMYQpjol+k/ju1PDFIpQQOud7zQWOfhZw0ssex88cW3nX9Nd2LoZiFWK
 1/ZefKrRLWN6RZt2RYwhSy8yHlkiFFJuNb+zdqgnO7lHJGeX0dGLByWBESWiU7vMdnDd
 0KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Odri40+f/dUoIsb/bgSIF+/bcyc0os3qiW/fNyIHw0=;
 b=rz/4p9k/2HAUMhSiMJtBWV+ktQMnVmh171+9iXVI+4eA2APIYsiaAe4598SgzkQpZW
 k9fLCjWQrQ48ZDojFbXawkAi2stnLvG72UcTAqwnxYB5Dpa8byT/LYPmbEtBHCUy13Ud
 oroT715r/CFdUoKoTwuSLVhxg3z2aUUJiO4/2tE1uiku7XoW5icYs7gDVZymEuyr/KM2
 u4ZuHpQmkDnWWlytp7NVUq/w2Udeeb3+dPvDYlY5WUbQ13RqkZljIlIPo81vB8pvqUCa
 2ccwWDnOOuBusKW1Y3ukowKt1Tcwea+Wi0OG1DNuKrr6faVv37Cj2c91nLCQEiR7H7V0
 A/rA==
X-Gm-Message-State: AOAM5316dpq5vDvlVl5QDHjqrIfoopW3krXx1BxhNh1j3I5CfJNi3ZSJ
 nU//EcFyjvpeiFcqu8BzD2+HdFGJo9C5NA==
X-Google-Smtp-Source: ABdhPJx95fcuRxyonZ2v2+foHzPKhUPgGrIanlbXlQHS7pLMhd+gJcc5Mw1x4unDnMQ5kfkIFXsaMA==
X-Received: by 2002:a63:6882:: with SMTP id
 d124mr31976744pgc.234.1639005116664; 
 Wed, 08 Dec 2021 15:11:56 -0800 (PST)
Received: from localhost.localdomain
 (45-19-222-18.lightspeed.sntcca.sbcglobal.net. [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id k15sm3301062pgn.91.2021.12.08.15.11.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 15:11:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] target/arm: Fault on invalid TCR_ELx.TxSZ
Date: Wed,  8 Dec 2021 15:11:49 -0800
Message-Id: <20211208231154.392029-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208231154.392029-1-richard.henderson@linaro.org>
References: <20211208231154.392029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Without FEAT_LVA, the behaviour of programming an invalid value
is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
minimum value requires a Translation fault.

It is most self-consistent to choose to generate the fault always.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9b317899a6..575723d62c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11129,7 +11129,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi, max_tsz;
+    int select, tsz, tbi;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11165,15 +11165,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         }
     }
 
-    if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
-        max_tsz = 48 - using64k;
-    } else {
-        max_tsz = 39;
-    }
-
-    tsz = MIN(tsz, max_tsz);
-    tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
-
     /* Present TBI as a composite with TBID.  */
     tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
     if (!data) {
@@ -11309,9 +11300,30 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
+        int min_tsz = 16, max_tsz = 39;  /* TODO: ARMv8.2-LVA  */
+
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
+
+        if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
+            max_tsz = 48 - param.using64k;
+        }
+
+        /*
+         * If TxSZ is programmed to a value larger than the maximum,
+         * or smaller than the effective minimum, it is IMPLEMENTATION
+         * DEFINED whether we behave as if the field were programmed
+         * within bounds, or if a level 0 Translation fault is generated.
+         *
+         * With FEAT_LVA, fault on less than minimum becomes required,
+         * so our choice is to always raise the fault.
+         */
+        if (param.tsz < min_tsz || param.tsz > max_tsz) {
+            fault_type = ARMFault_Translation;
+            goto do_fault;
+        }
+
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
     } else {
-- 
2.25.1


