Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F859C6D2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:43:51 +0200 (CEST)
Received: from localhost ([::1]:55114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCOr-00032V-SM
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9PC-0004uj-Bl
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:58 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9P0-0001gs-5R
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:58 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so11705681pjl.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dgGRXfqBRyRwvYaWW/xMoQ57AfJT2+cy/LziIxT5Jyk=;
 b=rEKsOcEbdGRtMJ/BQTJu4uv9iKaJuJxmXD7CJZBG2trWvgMc38DNYnE5p7KWyhyJ4J
 HfcKVlUkIpvUaHAv4L/gnntO6tN0WrUaBUl8Eu87QdT1USNHo5P8WZ5HjV96RMJNLXbJ
 UORpSX1giweIfqByBpJKRC3XpDwrIxvHDFfHes8GQrSxppXs0My4tu++93gZnE+n79LY
 F15F41/5HOzDFKhSOVGzN+pWpuYfjl+8FZume5L1HxIpOk6OAas16LfBV+SHwxxUqDS+
 XGo6lm8Copc5leuRYtIpsvff9uKmkRUb7IHA3iQ5+aiNHislx9QuKXLdhKbGgYcqQFpZ
 EX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dgGRXfqBRyRwvYaWW/xMoQ57AfJT2+cy/LziIxT5Jyk=;
 b=WBptkAoJqqgmcoBrf+F7iFe0gxpEWtR7gRGZZp974WZaKM0Jm0tn7NNErH76jICf3b
 oh4C5/b0SWljs1h6d2Uo9TcXtUu9RKa2TEbOMESPt2vpOlBYi6VuOMQuTajMWdvJ0J0v
 yh/3iYO+FjxAyzr2tq/rttBcvVk4TFBQtN0afYfcnlcqfQEtkuCrUPMVvi441IXCIbME
 reyC2fww4oT/ozzTtWy4ECWAZLNClIyY71yS/vmw20SNOdtm6btHl2U8kkFG8yUvMqP4
 4wd1FIev51s6jgbHWZHZZwqeZ+vejAH3ZZIAdo/bKJ3jMb06Xwo9+ENO2mRRvJXJm3oO
 hYIQ==
X-Gm-Message-State: ACgBeo0UCC+diCVx0COTf2fOF5F7sdMjRj5dYO4auoutKclhh62rC00k
 NR+oqWN5hxpRJFKjbMwvd+H2zJuosHjZWg==
X-Google-Smtp-Source: AA6agR4p8+0XNlDufwW8YhobldYP5cBi/49IFwYrd1NregONi/Y98FWNxHSF4GFZNyAAQV/jx/s7Fg==
X-Received: by 2002:a17:902:c411:b0:170:91ff:884b with SMTP id
 k17-20020a170902c41100b0017091ff884bmr20767560plk.58.1661182294248; 
 Mon, 22 Aug 2022 08:31:34 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 59/66] target/arm: Move be test for regime into
 S1TranslateResult
Date: Mon, 22 Aug 2022 08:27:34 -0700
Message-Id: <20220822152741.1617527-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7c44e7eadd..e898db8765 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -192,6 +192,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 typedef struct {
     bool is_secure;
+    bool be;
     void *hphys;
     hwaddr gphys;
 } S1TranslateResult;
@@ -261,6 +262,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                         : env->cp15.vtcr_el2 & VTCR_NSW));
 
     res->gphys = full->phys_addr;
+    res->be = regime_translation_big_endian(env, mmu_idx);
     return true;
 }
 
@@ -272,7 +274,6 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     CPUState *cs = env_cpu(env);
     S1TranslateResult s1;
     uint32_t data;
-    bool be;
 
     if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
         /* Failure. */
@@ -280,10 +281,9 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         return 0;
     }
 
-    be = regime_translation_big_endian(env, mmu_idx);
     if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (be) {
+        if (s1.be) {
             data = ldl_be_p(s1.hphys);
         } else {
             data = ldl_le_p(s1.hphys);
@@ -294,7 +294,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (be) {
+        if (s1.be) {
             data = address_space_ldl_be(as, s1.gphys, attrs, &result);
         } else {
             data = address_space_ldl_le(as, s1.gphys, attrs, &result);
@@ -315,7 +315,6 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     CPUState *cs = env_cpu(env);
     S1TranslateResult s1;
     uint64_t data;
-    bool be;
 
     if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
         /* Failure. */
@@ -323,10 +322,9 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         return 0;
     }
 
-    be = regime_translation_big_endian(env, mmu_idx);
     if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (be) {
+        if (s1.be) {
             data = ldq_be_p(s1.hphys);
         } else {
             data = ldq_le_p(s1.hphys);
@@ -337,7 +335,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (be) {
+        if (s1.be) {
             data = address_space_ldq_be(as, s1.gphys, attrs, &result);
         } else {
             data = address_space_ldq_le(as, s1.gphys, attrs, &result);
-- 
2.34.1


