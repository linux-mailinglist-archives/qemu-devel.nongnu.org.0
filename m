Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F74859C34B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:45:02 +0200 (CEST)
Received: from localhost ([::1]:33694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9bp-0007or-4o
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LU-0007qr-ML
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:08 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LM-0000gS-Cb
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:08 -0400
Received: by mail-pg1-x52c.google.com with SMTP id v4so9666345pgi.10
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=B0pGM/o1ND0DOJEZi6lFDwkXEDCcB+9OE3p2uVt/JyY=;
 b=qVaXCuNUJDaGdmBImnqoS8x4nhvidi93dvydgR6WduEpycmLSF2L1LSfU90FKlgH2R
 VsHl0UqGzBQVf2sh+gkHbJDyMEwjMKPW+6vBKRJOiowX59Go7OKymc0Lxod91UtGtglN
 wkz+ifjRQzE5BXBFT8z/VYzm3qVo1m1A6aoi5/eYjB4lwXC23/ACgzcOebFYKHN5XaEl
 pSstjjoXZiPDkdmbohcpKXNYSKxf5ac60L7FBtvmWxFABG+/PDHDC/HcbJT9H/HpF6nz
 owzznlYUKs+Mz+w5WDPwE4Zl7CfhDJWuvNQTybsffwlIVPo+StxlqQe8DdFldnbhppRs
 OIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=B0pGM/o1ND0DOJEZi6lFDwkXEDCcB+9OE3p2uVt/JyY=;
 b=z9jPnM2F3Zfp30vYyOr0aT7CwmcMGDOXcfT1axrY6WrROLDuz6FoYFb2jMNra/eoIW
 me2ZssyPAUIkuwbWER+dyi2DAl9J/XqiT0LA5JAXWmMeVSAwtZgzYCtZYA3JLViTcPRI
 iRAYwPG497f7BLGEqKaZPZauanlfYTV1aC5CTewwz3LSlpUkwzhN62JWJU3jfDhAGQe0
 62HjBQflWaV+u2w5h07hBBwGrezqj3KXMfLXnknSVz2Z1+2GFXX5J0kERtucJ1eGKKMb
 cQfvhmH918n/Ja7PP0g5XRZvYL+LXuVU11v9P+Rdc4fQOjz19xevwVgn7R6P1181TRYl
 K3wQ==
X-Gm-Message-State: ACgBeo28W5ZyKRqgFk5j+GH6BDCAefdn+8EWfZMY7Wpz+8afpG6nzckb
 UttXhe4l3ARPzXMo5YF9fX8rQDjb78Qq7A==
X-Google-Smtp-Source: AA6agR7SDWpNt3/fjDTdT+hUuMhwGNqP8gYgcM4Gzby2bubo+fsuGX6WgaBWs1dPmooX3jZmaqs1iw==
X-Received: by 2002:a63:83c6:0:b0:42a:c9db:cb3 with SMTP id
 h189-20020a6383c6000000b0042ac9db0cb3mr2215908pge.500.1661182079574; 
 Mon, 22 Aug 2022 08:27:59 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 21/66] target/arm: Split out get_phys_addr_with_secure
Date: Mon, 22 Aug 2022 08:26:56 -0700
Message-Id: <20220822152741.1617527-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Retain the existing get_phys_addr interface using
the security state derived from mmu_idx.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h |  6 ++++++
 target/arm/ptw.c       | 21 +++++++++++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ee40f41c12..3ccc79f3d9 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1145,6 +1145,12 @@ typedef struct GetPhysAddrResult {
     ARMCacheAttrs cacheattrs;
 } GetPhysAddrResult;
 
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type,
+                               ARMMMUIdx mmu_idx, bool is_secure,
+                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+    __attribute__((nonnull));
+
 bool get_phys_addr(CPUARMState *env, target_ulong address,
                    MMUAccessType access_type, ARMMMUIdx mmu_idx,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c338e2324a..c132d0cada 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2282,12 +2282,12 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
  * @result: set on translation success.
  * @fi: set to fault info if the translation fails
  */
-bool get_phys_addr(CPUARMState *env, target_ulong address,
-                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+bool get_phys_addr_with_secure(CPUARMState *env, target_ulong address,
+                               MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                               bool is_secure, GetPhysAddrResult *result,
+                               ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
-    bool is_secure = regime_is_secure(env, mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2303,8 +2303,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             ARMMMUIdx s2_mmu_idx;
             bool is_el0;
 
-            ret = get_phys_addr(env, address, access_type, s1_mmu_idx,
-                                result, fi);
+            ret = get_phys_addr_with_secure(env, address, access_type,
+                                            s1_mmu_idx, is_secure, result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
             if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
@@ -2514,6 +2514,15 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 }
 
+bool get_phys_addr(CPUARMState *env, target_ulong address,
+                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                   GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+{
+    return get_phys_addr_with_secure(env, address, access_type, mmu_idx,
+                                     regime_is_secure(env, mmu_idx),
+                                     result, fi);
+}
+
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
-- 
2.34.1


