Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB00A59C31B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:42:43 +0200 (CEST)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ9ZZ-0004qa-93
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LF-000792-U4
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:53 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9LB-0000fu-B2
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:27:51 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso11650566pjj.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1xsNVagwq/JRyQRrKMlVUwGiTiG4LqFpoVejKkD/DQM=;
 b=cBiL7RZ6W0AdJ1+QrAC8419OEtCrIvLz7ByWoQEKnKOHIXpiyDpYy4+YwMaWLJK5AQ
 eWaLJEELs5C00B12Ul240GRvljXz2mPcGTCbYxlbMkRqKrFGpW1uUrLmzxPGy9tYDkPn
 LCuhuYU5Fc2qJc01OMOQfmE/lOQNBAy8hlgjA/xeNlY25iELeeuExi52VbC/aV1fRDta
 1J4auQ1jJoXeQD3zlwfCw0TexhQryVPUhAG/iVlJ+h+9hLFvq8Rcbt+VVMF/48l9fM2b
 YpAX6xqX+zCNhcoXZNdGTt4+8wAcBHNCfqkPfaLePXqzWRA7Wn93nfI0COIbw5MG0Gz3
 lo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1xsNVagwq/JRyQRrKMlVUwGiTiG4LqFpoVejKkD/DQM=;
 b=GvqLPgUnoVT4WfOBgut/+1ld6qLJ9uN+erS7acIp8sWbubky89qTwL8csqfcVdOka9
 k+PjGn9N18mCFXA4/k47GSkf0XxcYXOns8H5c0NeAhPSRX+cBBIGXFXcYbg/orniVrrt
 9xB01Yp1PV6nrd/fXdirS+MT27Hv+vb6o25kTmqWmRNxgdn6ZeVFZQ+1U2QBm1ZyQY90
 QS3htqGBj4FsrRH3uXrUgT8E8VS4j1FfZxuDu1+rg/Mld1xKxrRtTr0IPSQ74E/Gwvmw
 fa6jRM46xcmlBfWqY51/YgiGSMYNpWvyKt+uZbgeKuw8v4DtmRmkV2WRV1EKsUxCg2MG
 QQSw==
X-Gm-Message-State: ACgBeo1vBRxaWylgd4A4Kk3GXuOwVnzcQuC04B6C1rqapoklPAhlKU5K
 MsjTYEmCZ0r+9wBXqQ/+RBYQYecgp87Pdw==
X-Google-Smtp-Source: AA6agR7tSn6a2uF8aXMjk2j94nABcLoB5oYFROm8cMKK2Gz/b3eVvU9qpyFuVRrlGVCEfB+SjgByBw==
X-Received: by 2002:a17:90b:4c4a:b0:1fb:3c1b:b7f8 with SMTP id
 np10-20020a17090b4c4a00b001fb3c1bb7f8mr3948182pjb.98.1661182067709; 
 Mon, 22 Aug 2022 08:27:47 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 06/66] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav5
Date: Mon, 22 Aug 2022 08:26:41 -0700
Message-Id: <20220822152741.1617527-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b006e87a63..15d152432f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1351,7 +1351,7 @@ do_fault:
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, int *prot,
+                                 GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     int n;
@@ -1361,12 +1361,12 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
 
     if (regime_translation_disabled(env, mmu_idx)) {
         /* MPU disabled.  */
-        *phys_ptr = address;
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        result->phys = address;
+        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         return false;
     }
 
-    *phys_ptr = address;
+    result->phys = address;
     for (n = 7; n >= 0; n--) {
         base = env->cp15.c6_region[n];
         if ((base & 1) == 0) {
@@ -1402,16 +1402,16 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
             fi->level = 1;
             return true;
         }
-        *prot = PAGE_READ | PAGE_WRITE;
+        result->prot = PAGE_READ | PAGE_WRITE;
         break;
     case 2:
-        *prot = PAGE_READ;
+        result->prot = PAGE_READ;
         if (!is_user) {
-            *prot |= PAGE_WRITE;
+            result->prot |= PAGE_WRITE;
         }
         break;
     case 3:
-        *prot = PAGE_READ | PAGE_WRITE;
+        result->prot = PAGE_READ | PAGE_WRITE;
         break;
     case 5:
         if (is_user) {
@@ -1419,10 +1419,10 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
             fi->level = 1;
             return true;
         }
-        *prot = PAGE_READ;
+        result->prot = PAGE_READ;
         break;
     case 6:
-        *prot = PAGE_READ;
+        result->prot = PAGE_READ;
         break;
     default:
         /* Bad permission.  */
@@ -1430,7 +1430,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
         fi->level = 1;
         return true;
     }
-    *prot |= PAGE_EXEC;
+    result->prot |= PAGE_EXEC;
     return false;
 }
 
@@ -2425,7 +2425,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       &result->phys, &result->prot, fi);
+                                       result, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
-- 
2.34.1


