Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E1C442031
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:40:39 +0100 (CET)
Received: from localhost ([::1]:41818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcEY-0001YO-4c
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9I-0008F6-SK
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:08 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:43652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9G-0001GH-Mp
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:08 -0400
Received: by mail-qt1-x836.google.com with SMTP id v29so15207723qtc.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7mVMLvhvHhRE4SNYEq8lTvIaJ67DT2EyP7H4YHihO6k=;
 b=Hbii+yw9ke5otV1LPIoAoxV8MB/+v2oJwLAG8mbAJBIXVwSx9iOQos7PtKUmOVCqU7
 Z/4ThAPzxYU8Vuzv//CYBXfJHHqiwxmfUtWz3JQWpz9chsuHpSllOX2xyHKRyGXwQ8fo
 SY29iYFKXa/QxucwGXU7MPsi+EVSYo2iWDDNHs51TbNR/ewFBHE2ptebzc/K+9pOQWdm
 q8dRFV3EN1C3WFGiqLMqCPXyHE/aeIN32q1MaSYcgq6svVDIMKHmTX6hnoYAPBtqIuWh
 PXoPZMCpOYXcaUJAh+889Qf6psEWS3UXWDTzwI6UGrj5shdrMWQCMqUIBGIdBS4Oa+m1
 bBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7mVMLvhvHhRE4SNYEq8lTvIaJ67DT2EyP7H4YHihO6k=;
 b=55f74LOSL0ZCitcqt6aTtj6AH5539e2KqHI3oB39P1P0/szTsF5sJMaskZ8ofXh9AV
 i7e0ib+r26DGY0U4zfmlU63PFz0hiAABKNyWis79YCuYGOcoJrNP4lsufy48CxA/93HT
 n5n+7veg6vjfatH8KSiDIsSyG9r93obVcNdGsAvw4F9egD1R+XxS63V4z9SK22YsVkAE
 s/4iYj3xABS33sG4R5AO3Md0wrGp1BR5BmbyJslzC3UgS+0LZMBvCWKlhBwLFDsogMs4
 H920SvhJ58iOBvJE2ZAezOLto+zBJ60VKGfz95Dx7IizFUzx8bYHdy1ojkJn4w6jr97V
 gVqg==
X-Gm-Message-State: AOAM5324h7166fZQzXIRmq9GPgOd/ZhKbCZokCiyaxZjBowhYBrGcTwK
 Oc3tGfAKofOXupjpWDL3mxAXfLSTka7cJg==
X-Google-Smtp-Source: ABdhPJwE3mhUy5gvETzL4aLDAcPDYoSme9HbnP8NvafaobGw9UY0EkkFVNo/Q2lGdZRuyjuuFom5hw==
X-Received: by 2002:ac8:5d8c:: with SMTP id d12mr8610580qtx.191.1635787865747; 
 Mon, 01 Nov 2021 10:31:05 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 59/60] tcg: Add helper_unaligned_{ld,
 st} for user-only sigbus
Date: Mon,  1 Nov 2021 13:27:28 -0400
Message-Id: <20211101172729.23149-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be called from tcg generated code on hosts that support
unaligned accesses natively, in response to an access that
is supposed to be aligned.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-ldst.h |  5 +++++
 accel/tcg/user-exec.c  | 11 +++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
index 8c86365611..bf40942de4 100644
--- a/include/tcg/tcg-ldst.h
+++ b/include/tcg/tcg-ldst.h
@@ -70,5 +70,10 @@ void helper_be_stl_mmu(CPUArchState *env, target_ulong addr, uint32_t val,
 void helper_be_stq_mmu(CPUArchState *env, target_ulong addr, uint64_t val,
                        MemOpIdx oi, uintptr_t retaddr);
 
+#else
+
+void QEMU_NORETURN helper_unaligned_ld(CPUArchState *env, target_ulong addr);
+void QEMU_NORETURN helper_unaligned_st(CPUArchState *env, target_ulong addr);
+
 #endif /* CONFIG_SOFTMMU */
 #endif /* TCG_LDST_H */
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index aaf47d89d2..1528a21fad 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "qemu/atomic128.h"
 #include "trace/trace-root.h"
+#include "tcg/tcg-ldst.h"
 #include "internal.h"
 
 __thread uintptr_t helper_retaddr;
@@ -215,6 +216,16 @@ static void validate_memop(MemOpIdx oi, MemOp expected)
 #endif
 }
 
+void helper_unaligned_ld(CPUArchState *env, target_ulong addr)
+{
+    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_LOAD, GETPC());
+}
+
+void helper_unaligned_st(CPUArchState *env, target_ulong addr)
+{
+    cpu_loop_exit_sigbus(env_cpu(env), addr, MMU_DATA_STORE, GETPC());
+}
+
 static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
                             MemOpIdx oi, uintptr_t ra, MMUAccessType type)
 {
-- 
2.25.1


