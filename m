Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DBB5F1DF9
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 18:59:03 +0200 (CEST)
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefpP-0000jD-27
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 12:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIG-0000Ep-2K
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:48 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:43535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefIE-0006Of-DZ
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:47 -0400
Received: by mail-qk1-x72c.google.com with SMTP id o7so4536128qkj.10
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=n1zqtffVj+e5QIYH+tiRjV15qJp6GZoBT6L+6JANVjQ=;
 b=img0YxndVMlnokJrp2TD2W0moTjnkTziKwcI9ri2GGyVoCVFocuLT1FGvnWzL7gbHT
 YH2YIK4Ohtb4xCNVUNJyBsUkGmkpEzD5xUJFdyn9rDBldFTiwc2Tt/uAx0lcJWmrcE+o
 EKxwHn+vQUlVIB4vDJe16AdzwjtejLM92piX6JNU12dzbBbe1tzGG4BSoDaieBOoYsWF
 67bv3iNoun+AwL9GcWEZoGda52lxs9Z5qMgC0D/WAX5o0KxiL01r7mW0YuR+R9eLpEAu
 h7cUn9rEH8u+2YdvEmI6WNDVL1KJvFZn6vnqk03/E1IwJrtZYQRodIUxl8+a0GTKKinr
 mduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=n1zqtffVj+e5QIYH+tiRjV15qJp6GZoBT6L+6JANVjQ=;
 b=vluzG0CAqw0At+11ON8K6Lpk/Q6+a3ALBdlJWJqsu4WPtpya8A9haT2txDVp/CxixE
 nmS6oq9lN6EWnqqRXlkVqxmQI5zKQRdn7Ubqq6s9nilblj/ui+BbP7BtIpnFBp2Iw1UE
 JZZ6uX5IVtRya6MW6QxdkQ3PcnUUSIOjjlB144IQNXXNVv+XtTpR+BBVl5nTNjlZlaga
 cat0y0WyXZY9tBBkj6jbX4WhSyIXxANjcBcaZ9XY7mANJcQnMpLNE5xSw1m4qCJxtoXN
 ujW8JEl/u2T/sQ7//wINLC6FlA8ioHRxbHAJ7/zrE5C6ZRCl4f+KfsyeyuRq5Tu2IdY4
 CT6g==
X-Gm-Message-State: ACrzQf3Zt9K2WqXJGAORDRRPS0gz2pa+x/b/ukZhZN5Vhd1Rs4yQ+RSV
 lbPVmuTYXZcri9n+5dtAQBErMDNg8XJ+zA==
X-Google-Smtp-Source: AMsMyM5/547YBgBC/PeS6lEbsG0U2Sb8Bnz4MUDCSe1o1GkKscBZI5fGCB+EkVUCHqjH/WMQqr/cQQ==
X-Received: by 2002:a05:620a:25c8:b0:6ae:2408:6e9a with SMTP id
 y8-20020a05620a25c800b006ae24086e9amr9874309qko.222.1664641485728; 
 Sat, 01 Oct 2022 09:24:45 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 34/42] target/arm: Move be test for regime into
 S1TranslateResult
Date: Sat,  1 Oct 2022 09:23:10 -0700
Message-Id: <20221001162318.153420-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 99ad894180..d356b0b22d 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -222,6 +222,7 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 
 typedef struct {
     bool is_secure;
+    bool be;
     void *hphys;
     hwaddr gphys;
 } S1TranslateResult;
@@ -301,6 +302,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                       !(pte_secure
                         ? env->cp15.vstcr_el2 & VSTCR_SW
                         : env->cp15.vtcr_el2 & VTCR_NSW));
+    res->be = regime_translation_big_endian(env, mmu_idx);
     return true;
 
  fail:
@@ -320,7 +322,6 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     CPUState *cs = env_cpu(env);
     S1TranslateResult s1;
     uint32_t data;
-    bool be;
 
     if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure,
                           debug, &s1, fi)) {
@@ -329,10 +330,9 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
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
@@ -343,7 +343,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (be) {
+        if (s1.be) {
             data = address_space_ldl_be(as, s1.gphys, attrs, &result);
         } else {
             data = address_space_ldl_le(as, s1.gphys, attrs, &result);
@@ -364,7 +364,6 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     CPUState *cs = env_cpu(env);
     S1TranslateResult s1;
     uint64_t data;
-    bool be;
 
     if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure,
                           debug, &s1, fi)) {
@@ -373,10 +372,9 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
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
@@ -387,7 +385,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (be) {
+        if (s1.be) {
             data = address_space_ldq_be(as, s1.gphys, attrs, &result);
         } else {
             data = address_space_ldq_le(as, s1.gphys, attrs, &result);
-- 
2.34.1


