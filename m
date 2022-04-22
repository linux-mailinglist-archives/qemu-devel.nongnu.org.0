Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0C450BE98
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:28:13 +0200 (CEST)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhx4m-0003g2-8s
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwaW-0007vd-Ve
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:56:57 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:35724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwaV-0007xq-9A
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:56:56 -0400
Received: by mail-io1-xd30.google.com with SMTP id q22so9240980iod.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxB1TVMzBFwMcUq22tF+jwRMYyOH+mG1cEPhaGtvWVM=;
 b=g0EnqH8qMITcnRxxneK3/w7Yvpj7456rWm6d083QWgVlOKPfvGQVcqq2UMUudIPISU
 p0ClDMzKVCG+B/nTQfvrLFOnI6cqML6db/DocU5LBlFqvl/abHc58HfFPMfJ+ECd+a3h
 ao+yK0UNxlxSQ6GfKG1GqbewWXZKIY7rMJIS/HKyG1h10iT4XFUeXxOJdP2uiyZkVhLR
 AZ/A/0bvXNTAA+QS0kBikRlup23SlzyosP73+iPjuDuAjO3pO4h9UkSidXsCS04iAp21
 4Ep8odNTSjVik5JDSuqEKa/550Esk+zEnhsG/Loot7XJQcjMaDvxVXrDuZiMn0QCtwN4
 lNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxB1TVMzBFwMcUq22tF+jwRMYyOH+mG1cEPhaGtvWVM=;
 b=pkFlIp2CQ3+4TCBCUVa9v4RhhLb/j8qi29kEtTSurxnxdxE+m+e8nqY/oRM/jSPGji
 d6P3le1rRtZhxLCjuFUhrzQ+Dv5ajnZ1Jw8PVMmi89HrIJqk57pL3Q4AieaTUrP7kv6D
 2YHNXLpz09pZIQZzrHTlMES7JfsIZXOTZIFEv8PICwEDiavfF8LKEOGpESbaetp/zA2P
 AoDbz0nONcxB5iXA0ErKVPebZ4fxE40N92qpfyvnunymeuiKZOZBpbuuZ9zCdsdc3n7C
 Lt/5faZevIST+5iHgXwK1KXYgQcY6MKdhYvHiGOfrT7Wl8LT0ZStDdh4wsZ9OYDIlyPf
 vF8g==
X-Gm-Message-State: AOAM533w1nUjfs2WfDHzZgCn0MzCxroSHnG9QrjweHD2TDDYRDiqDG1C
 NrM6R12DMpGdc8BdC/NixmTnuIEKj8+Z1lym
X-Google-Smtp-Source: ABdhPJxXFcitiklqSTXr59QIfnkjJ010Gy62y13o9HL8kIBKBSQJReXTGNltHNsShO+fsOvA6Wy7GA==
X-Received: by 2002:a02:a30f:0:b0:327:277b:c380 with SMTP id
 q15-20020a02a30f000000b00327277bc380mr2497157jai.241.1650646613647; 
 Fri, 22 Apr 2022 09:56:53 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:56:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 40/68] target/nios2: Remove CPU_INTERRUPT_NMI
Date: Fri, 22 Apr 2022 09:52:10 -0700
Message-Id: <20220422165238.1971496-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd30.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This interrupt bit is never set, so testing it in
nios2_cpu_has_work is pointless.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-41-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 2 --
 target/nios2/cpu.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index da85d82faa..08284d7927 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -177,8 +177,6 @@ FIELD(CR_TLBMISC, EE, 24, 1)
 #define EXCP_MPUI     16
 #define EXCP_MPUD     17
 
-#define CPU_INTERRUPT_NMI       CPU_INTERRUPT_TGT_EXT_3
-
 struct CPUArchState {
     uint32_t regs[NUM_GP_REGS];
     uint32_t ctrl[NUM_CR_REGS];
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 7d734280d1..58e6ad0462 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -36,7 +36,7 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
 
 static bool nios2_cpu_has_work(CPUState *cs)
 {
-    return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
+    return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
 
 static void nios2_cpu_reset(DeviceState *dev)
-- 
2.34.1


