Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305EE46DEF0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 00:16:38 +0100 (CET)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv6Av-00046q-AN
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 18:16:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66U-0005Bb-D1
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:02 -0500
Received: from [2607:f8b0:4864:20::1031] (port=35808
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mv66S-0004nY-IE
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 18:12:02 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso5537243pji.0
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 15:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nEPvlsXoO0/jwpDg/CNkKw+cUVDhy5CThal9Lsb0r4k=;
 b=iptOSutfk+n404WPvENJMtfjI8rRKktJrMyiL5xGVm02IgDbP/wSv+hDnPNUdB7qEk
 XOe9YGxQV+Ji5zzyQclZEjRvdfKyP5Ej7jDM4/OWp4WS8He7rTNV3d2h/es1zdE1VAaV
 VTkCOmxZkaES1oRMPm0SVKf9A8AZEBX+uif0ke/LCdiw6egiUKuZlKrk+K0okLd8yq//
 eaymqfMM7EPkYbaqTwZoIy70bNTGOoVZiLhhb2hIK8wvkxC3yZT13WvtTIT4AmZUE0Ux
 QWray3NnBjm1lkkCRPVhzYBtObanN5awpMwzdpyJMepelk2aoiZ692GOWcNugtRuVNKQ
 qBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nEPvlsXoO0/jwpDg/CNkKw+cUVDhy5CThal9Lsb0r4k=;
 b=A/af67xkbF1rpxl+6Dcqtojd1SXUapbMswiEylcKqEMCrQZpv4z5MZ7ktlq0H35JAr
 DM4d+2WUL3tS3X8mZICLgoTyct53GHAr7vVElHv5+AlUFWeCybHRjTAlODnYbTTpi66O
 HmB/ntB2p1GjxfSsLd5H/FnxhcXSqTYNEb7eeMwUjfBfSJlkvvrNPm6NIM4yp0dC3PxO
 OlpO9apLUBki+SdqDStapjpY0q9+fAS/3KfEyiexyOVj/lyfhBhEq6shqEUzHOZnNlON
 tH9OTJAL2vJCKdgHyApwUx+9SUoBxtJYgwR07VpcCE/Yd72O/jBZbcGZRnDcFbYJB284
 kmkg==
X-Gm-Message-State: AOAM531wMa1GD5fDenvU90/T1L0B8Hjeu62YOKszC+bqUSCD+3xjiQsn
 MGTeWVNxKxVlrQHrvPjT/sP+bER+X0iAig==
X-Google-Smtp-Source: ABdhPJx5ppSLsmv1TlAYSJaRUC8tZHKoQ4KZnAo09+MnvAZfOILkOiTsFytnjDR+gh7Ory/vfLKKdQ==
X-Received: by 2002:a17:903:283:b0:142:1243:d879 with SMTP id
 j3-20020a170903028300b001421243d879mr63922603plr.61.1639005119325; 
 Wed, 08 Dec 2021 15:11:59 -0800 (PST)
Received: from localhost.localdomain
 (45-19-222-18.lightspeed.sntcca.sbcglobal.net. [45.19.222.18])
 by smtp.gmail.com with ESMTPSA id k15sm3301062pgn.91.2021.12.08.15.11.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 15:11:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] target/arm: Implement FEAT_LVA
Date: Wed,  8 Dec 2021 15:11:52 -0800
Message-Id: <20211208231154.392029-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208231154.392029-1-richard.henderson@linaro.org>
References: <20211208231154.392029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

This feature is relatively small, as it applies only to
64k pages and thus requires no additional changes to the
table descriptor walking algorithm, only a change to the
minimum TSZ (which is the inverse of the maximum virtual
address space size).

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-param.h | 2 +-
 target/arm/cpu.h       | 5 +++++
 target/arm/cpu64.c     | 1 +
 target/arm/helper.c    | 8 +++++++-
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 7f38d33b8e..5f9c288b1a 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -11,7 +11,7 @@
 #ifdef TARGET_AARCH64
 # define TARGET_LONG_BITS             64
 # define TARGET_PHYS_ADDR_SPACE_BITS  48
-# define TARGET_VIRT_ADDR_SPACE_BITS  48
+# define TARGET_VIRT_ADDR_SPACE_BITS  52
 #else
 # define TARGET_LONG_BITS             32
 # define TARGET_PHYS_ADDR_SPACE_BITS  40
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e33f37b70a..3149000004 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4288,6 +4288,11 @@ static inline bool isar_feature_aa64_ccidx(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, CCIDX) != 0;
 }
 
+static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 15245a60a8..f44ee643ef 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -755,6 +755,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
         t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
         t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
+        t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LPA */
         cpu->isar.id_aa64mmfr2 = t;
 
         t = cpu->isar.id_aa64zfr0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 568914bd42..6a59975028 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11324,7 +11324,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
     /* TODO: This code does not support shareability levels. */
     if (aarch64) {
-        int min_tsz = 16, max_tsz = 39;  /* TODO: ARMv8.2-LVA  */
+        int min_tsz = 16, max_tsz = 39;
         int parange;
 
         param = aa64_va_parameters(env, address, mmu_idx,
@@ -11334,6 +11334,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         if (cpu_isar_feature(aa64_st, env_archcpu(env))) {
             max_tsz = 48 - param.using64k;
         }
+        if (param.using64k) {
+            if (cpu_isar_feature(aa64_lva, env_archcpu(env))) {
+                min_tsz = 12;
+            }
+        }
+        /* TODO: FEAT_LPA2 */
 
         /*
          * If TxSZ is programmed to a value larger than the maximum,
-- 
2.25.1


