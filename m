Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCE23C8A72
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:08:00 +0200 (CEST)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jIc-0004rM-Ag
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3jHM-0002uK-JE
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:06:40 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:42882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3jHL-0000qK-1y
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:06:40 -0400
Received: by mail-pf1-x432.google.com with SMTP id y4so2735659pfi.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fx1IYlUB1apyvNip9CdKVB8bhhKr7Iu1pMhRVbOHLjQ=;
 b=vpXfsZxAj9HyJcTED1cx6W27B1XFidizESj0ocXKQ9v3bvkNbx6nFLchz2WMmaIUg1
 DT3/kxCMQ4AG6f6Em02bjqwT3DiSal/dj2CcRHXIq9OUmyKYypnkbEaeRqAc3KNwUeVc
 14elr+Da9hyI6QpePz71aJPZc+SdSALn5Wmlk1ui90CfSphu4WkE977OWKU644rKa23Q
 z4fDanpp95ra1YvCRGp4t1EHrpQDVSyoqKG/b9xD2yxxdtoxj+wniaKR5bg76KVvpCku
 bjgTR54uD0Do4zWg31yEurxOQRZfHyLJGo1aqYDXdUDAl/hKNo/YYWMywQpBlpRj1OW+
 Km5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fx1IYlUB1apyvNip9CdKVB8bhhKr7Iu1pMhRVbOHLjQ=;
 b=T99eUGj1szBuXQQeBjrdOguyeVs1BWPqUZGPjr+CTv4bJ0YlElhodDkw9nyKc1UIA+
 12jhqQYeQIAk3HKLIV3ltEnF6i0xyF0g9njrOQ14dLKJSC0aQciVxiU850YyMh2ti4ts
 v6WVFw37XT9n52JKWE1MBrvDnFNB2ZzgVUuwIFhnIaRbQcYXeipPhGPN1PS5VZIFlbiE
 yU8gt/ouJp8Ih11OdNH7wPCqwXzikWqZ4LlfLV5jzcVF6FoWkCQgD8e6g56iWLdg6yND
 qb7BYosJmZAIXUUV183O/yRaxyn/ZemNyNZdDUX21sIIqKB4LT/LIVkYP8nJpH1d9FgX
 BRgw==
X-Gm-Message-State: AOAM531oeg2vxd+UsPQg7Tq0jozqegZBmWmx3FHt3i9fgxmXSSc4k/ut
 DyDKBgsgbjhPHYKrxVH4Ing/YAi7djt+8A==
X-Google-Smtp-Source: ABdhPJzG3zdRim/mOUFm6Plpa02ZmIhjlbj9cuDmckSR5Dd/lNgDYLc1mLjOvp0ggyBSoD6+eDuQXQ==
X-Received: by 2002:a63:ff25:: with SMTP id k37mr10718246pgi.353.1626285997644; 
 Wed, 14 Jul 2021 11:06:37 -0700 (PDT)
Received: from localhost.localdomain ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id d1sm2853521pju.16.2021.07.14.11.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:06:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Export aarch64_sve_zcr_get_valid_len
Date: Wed, 14 Jul 2021 11:06:34 -0700
Message-Id: <20210714180635.1648966-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714180635.1648966-1-richard.henderson@linaro.org>
References: <20210714180635.1648966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename from sve_zcr_get_valid_len and make accessible
from outside of helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 2 ++
 target/arm/helper.c | 8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index be9a4dceae..52e99344c5 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1060,6 +1060,8 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque);
 
+uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len);
+
 #ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 910ace4274..a49067c115 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6454,11 +6454,13 @@ int sve_exception_el(CPUARMState *env, int el)
     return 0;
 }
 
-static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
+uint32_t aarch64_sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
 {
     uint32_t end_len;
 
-    end_len = start_len &= 0xf;
+    start_len = MIN(start_len, ARM_MAX_VQ - 1);
+    end_len = start_len;
+
     if (!test_bit(start_len, cpu->sve_vq_map)) {
         end_len = find_last_bit(cpu->sve_vq_map, start_len);
         assert(end_len < start_len);
@@ -6484,7 +6486,7 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
         zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
     }
 
-    return sve_zcr_get_valid_len(cpu, zcr_len);
+    return aarch64_sve_zcr_get_valid_len(cpu, zcr_len);
 }
 
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.25.1


