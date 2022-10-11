Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26ED5FAB2C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:28:25 +0200 (CEST)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi5wP-0002hu-21
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nt-0002OJ-AO
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:38 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:36489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nm-00031l-TC
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id c24so12036185plo.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJuTd0SPwgfrCTEDatav1bD/h1Bh2C4XRFMrqpA+5GE=;
 b=zpmd92Cvkk6YDZoie7K9QJDeyE8WWXtXCnW+EKJIXtW27KFZVnrgz3T3oL3ytifYU+
 UGe9RFZYBDR7Iv3eGHitfUQy2YGBwoJxU0LdUxduEmMqjdSZ4APc9BWMs3DVC8mzXsAC
 RHdAGEJpIzpcYaQ+4QwFFeTeTuwlaRsAK60IvcKA5GENdo89ZlykR/m+/hlThwurOIP8
 b96CNzfLQ4AhquU8/q2+L86baNci2IHlQcY7rBi5kZ8ZXgi8EfROnsoPo/ZGZ1XoEZOa
 k9495FB5vCrT1yyhG9o9dB3bNOyF8SeSHgdaBJI/4jTA6WRCsiti9KC7OLcAie0TUvdb
 r6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJuTd0SPwgfrCTEDatav1bD/h1Bh2C4XRFMrqpA+5GE=;
 b=IxYu7SlalhvjNqkIT/0BQ2YGTaW+NM4qNBdMzG7MO+bfQnisaxe9a4GyceJjPDDF2v
 UROxo9am5PmgcTEFSJfLF3gauw1jj+ulfa/H7iL0ZdEXFRbuvg+ja92ZlRbtfr54N82V
 4oXwtV6u3aDKThlpZGQJmscm01J0DQBxvaR2sMf8ElsaCVArBpK9spQzwaUVbgVqdkIN
 Gf8WmJ/mek/77xNH5vmMgd29Hk5h3sjUMKvUEi91UU3QwgPKmJSeske+hPMhdhd45l0y
 WpdX6offryNNAfE2OVGsH3eWgzDXtnyOl0WmckQv47xtVIVE4Bf5dEqGv+5PdsFRr4Hp
 l2sA==
X-Gm-Message-State: ACrzQf02wWn19lf8qv0Pa0OfIWYAYmorJiIOP4JcZ+/Ci0pySD+u1WUr
 BUtJ3f2Hp3zFK19eUWc07+mbpFVBVfuQiA==
X-Google-Smtp-Source: AMsMyM4lXq27H8sZzAMp4gWNsiBjyvNztUWCkcDj8xKalALVZdV4Cc+GJAJAwKIRMk3xrGnIEV15XQ==
X-Received: by 2002:a17:903:41ce:b0:182:a32f:4dde with SMTP id
 u14-20020a17090341ce00b00182a32f4ddemr7197864ple.47.1665458368864; 
 Mon, 10 Oct 2022 20:19:28 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 09/24] target/arm: Move be test for regime into
 S1TranslateResult
Date: Mon, 10 Oct 2022 20:18:56 -0700
Message-Id: <20221011031911.2408754-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hoist this test out of arm_ld[lq]_ptw into S1_ptw_translate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8fa0088d98..c58788ac69 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -19,6 +19,7 @@ typedef struct S1Translate {
     bool in_secure;
     bool in_debug;
     bool out_secure;
+    bool out_be;
     hwaddr out_phys;
 } S1Translate;
 
@@ -277,6 +278,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
 
     ptw->out_secure = is_secure;
     ptw->out_phys = addr;
+    ptw->out_be = regime_translation_big_endian(env, ptw->in_mmu_idx);
     return true;
 }
 
@@ -296,7 +298,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
     addr = ptw->out_phys;
     attrs.secure = ptw->out_secure;
     as = arm_addressspace(cs, attrs);
-    if (regime_translation_big_endian(env, ptw->in_mmu_idx)) {
+    if (ptw->out_be) {
         data = address_space_ldl_be(as, addr, attrs, &result);
     } else {
         data = address_space_ldl_le(as, addr, attrs, &result);
@@ -324,7 +326,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
     addr = ptw->out_phys;
     attrs.secure = ptw->out_secure;
     as = arm_addressspace(cs, attrs);
-    if (regime_translation_big_endian(env, ptw->in_mmu_idx)) {
+    if (ptw->out_be) {
         data = address_space_ldq_be(as, addr, attrs, &result);
     } else {
         data = address_space_ldq_le(as, addr, attrs, &result);
-- 
2.34.1


