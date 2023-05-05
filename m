Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CD46F8AF1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:27:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vS-0000kK-2K; Fri, 05 May 2023 17:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vI-0000gI-G0
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:05 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vD-0004Rj-Qf
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:04 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3075e802738so1865071f8f.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321898; x=1685913898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kaCkf+tWgS3OG0dqcISJnpxG2CWngLV2cNCMJMkKlk=;
 b=N5mwmqihnMzDQOu0vsvkhdsS4l8oNxUmVigBAtMArDCbfhfSX626a+7Bbjf3GGgGNx
 6D+rdDT+V+7BVJfnfCZRPOrKoew9ew+DqeFkMNyIEJToRoAlrNrB7RgwLKR4KF6/FVX0
 ydwdwwT4so5UzDIRnSM066O+gUkdpbjW+dD2sOg0pPBA1JrJ7CkmiaTNHUVq6x1XHgMV
 lIgRx5+gWOfcvbD2IN0ryH8LZIM2gZ/2OBafasJmpgku7pcMqNSX/Aa9BhJWT0FrAVh7
 FRE6fG4OUrU9H1kpWlaCAPM+o2dRsoxETzXo6RrJ6ra9W6Dpd6d0aa1Kjnnr7U5Oeom9
 3Lig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321898; x=1685913898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kaCkf+tWgS3OG0dqcISJnpxG2CWngLV2cNCMJMkKlk=;
 b=A65WwW0/atVIQ0UFA8K4l0hwwlXliJX4A7wYSd19ICDNOiyx+kswzp4QvO4Q4qCVpg
 mqlRbjnz8Y8e0kl0B3fv5LVictgPTOfisNzU8xJJdTFnEOPVQuvP/7A0voEoqfkRXr51
 b8k4deoG4qkGLBa0vML7p7o9iPAONFbX5OVfsrtH3LI7H04ZPnwOQQDBAiiOsfSfv6h6
 6NqDGHDfLIlUIljyvZDe4CQaN3v7ZrZ9tyKqaK6WFlqrqw3XbArNGql4Durvxa2Dd75J
 Hq2K27GtPwXXbpJptIM04a5PW07Vm1kmz/CXeNHl1oFki0LF+J9tNHcUdmKUPbKKDEve
 EHcQ==
X-Gm-Message-State: AC+VfDxOMzTqceCArrYycSubX9X2r00xETWRiCcjzW3k3+BexERFR28W
 6ID7Fiz3A6JXYwVK99MR+sb8Rh2XI/H/llJ9Qa9ZvA==
X-Google-Smtp-Source: ACHHUZ6ggrtqpiftcYnt4QOu1yW3D7LlxcPT1PdD8WrNcARsQzJvjMuLPB7JXJN++z+cT62y32oJhA==
X-Received: by 2002:adf:de8d:0:b0:306:2e04:5925 with SMTP id
 w13-20020adfde8d000000b003062e045925mr2296422wrl.17.1683321898432; 
 Fri, 05 May 2023 14:24:58 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 17/42] target/sparc: Use cpu_ld*_code_mmu
Date: Fri,  5 May 2023 22:24:22 +0100
Message-Id: <20230505212447.374546-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This passes on the memop as given as argument to
helper_ld_asi to the ultimate load primitive.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index a53580d9e4..7972d56a72 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -593,6 +593,7 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
 #if defined(DEBUG_MXCC) || defined(DEBUG_ASI)
     uint32_t last_addr = addr;
 #endif
+    MemOpIdx oi;
 
     do_check_align(env, addr, size - 1, GETPC());
     switch (asi) {
@@ -692,19 +693,20 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
     case ASI_M_IODIAG:  /* Turbosparc IOTLB Diagnostic */
         break;
     case ASI_KERNELTXT: /* Supervisor code access */
+        oi = make_memop_idx(memop, cpu_mmu_index(env, true));
         switch (size) {
         case 1:
-            ret = cpu_ldub_code(env, addr);
+            ret = cpu_ldb_code_mmu(env, addr, oi, GETPC());
             break;
         case 2:
-            ret = cpu_lduw_code(env, addr);
+            ret = cpu_ldw_code_mmu(env, addr, oi, GETPC());
             break;
         default:
         case 4:
-            ret = cpu_ldl_code(env, addr);
+            ret = cpu_ldl_code_mmu(env, addr, oi, GETPC());
             break;
         case 8:
-            ret = cpu_ldq_code(env, addr);
+            ret = cpu_ldq_code_mmu(env, addr, oi, GETPC());
             break;
         }
         break;
-- 
2.34.1


