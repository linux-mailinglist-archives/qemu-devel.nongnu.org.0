Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F75E3ADB4D
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:25:29 +0200 (CEST)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufeq-00049w-LQ
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUy-0000wy-VE
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:19 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:37523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUr-0002MZ-3W
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:16 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so10053437pjs.2
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3LWcBSiEHKmb3rQtnRtGOpef7nDxbsC5JhldyG/Wz8U=;
 b=AaTRtk1BgDds5lbz83+8XWalqB2gzuR3euTJ/bCnA8L6afwaKEsq/+hGwZDtxA7+yj
 AnAiYPMDjSEdnAd4g4klZ6HF3CBuOU5GIwlGNup7Iot6Ew2bctGZ31oZFbQ55F5vx0LS
 OJtOvWukmRudX+ILNSVVHbfkhxEcHhkQ0P7mPFB6pzUXpXdjCWHe4kTaSMn4DPBOz1cM
 M4YyJAaNzAVMAuINitej3/vdZJ2TDvnwHz4T+OpX+qUfxMQ9O+9otBjPGlXYhLnX1yjm
 1XFGjcgS1sVdOpIeTAx8ZZ4gcYk9Ifci30WoOj5KxNSMQpeI5KUySn2YJS7W54mDUd/V
 4x2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3LWcBSiEHKmb3rQtnRtGOpef7nDxbsC5JhldyG/Wz8U=;
 b=XtFCnmo6g0Z0zcj4WO3S/uqhF4rZ3DtXWIhnli/c13zsRzI9IwAfWvMN10Yk3Y4WwR
 eXYMBl/JCgCKdin/AbHQ0l5ab4njBQAWWteROAEx9omPy8AuLeYszW/yfqM6md7hQj/B
 BW1IIM/iy8KdCPllYVe/yhplxfhtj6lj4cSdLbto4R3hrqIP+BExUO+DNsChqBqQzj3t
 BsPhqbzu5Lm7rnQCxU4YrYdAd0kN95BypMoydX3FSW67fxSkJksqEFZehvlrkd5mAYLJ
 miVKXtS3H29RAr+69p3PUu6ckxcQIiOOCDGpJabWdw50GN6i0f4s9hGB1Hwikxyg/ZwQ
 yBUg==
X-Gm-Message-State: AOAM531mLne776WKQK4I/VQfIBTYCintMDKeRa9Ms2EsOOLXFQgmEMg1
 EQd4vRpNTtoEMNAPrTEktJckGDPTStkyJA==
X-Google-Smtp-Source: ABdhPJyOr5cdYzQHRLGYriMw4gx4dguFL/xOUjxpG1CgvP6V0wj/AbKL3I2YbFINM0Yjd2qUTTBrOg==
X-Received: by 2002:a17:90b:3ec3:: with SMTP id
 rm3mr18119459pjb.105.1624126507946; 
 Sat, 19 Jun 2021 11:15:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:15:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/33] tcg/tci: Use {set,clear}_helper_retaddr
Date: Sat, 19 Jun 2021 11:14:45 -0700
Message-Id: <20210619181452.877683-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrap guest memory operations for tci like we do for cpu_ld*_data.

We cannot actually use the cpu_ldst.h interface without duplicating
the memory trace operations performed within, which will already
have been expanded into the tcg opcode stream.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index a5670f2109..71689d4a40 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -292,10 +292,9 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
                             TCGMemOpIdx oi, const void *tb_ptr)
 {
     MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
-
-#ifdef CONFIG_SOFTMMU
     uintptr_t ra = (uintptr_t)tb_ptr;
 
+#ifdef CONFIG_SOFTMMU
     switch (mop) {
     case MO_UB:
         return helper_ret_ldub_mmu(env, taddr, oi, ra);
@@ -328,6 +327,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     void *haddr = g2h(env_cpu(env), taddr);
     uint64_t ret;
 
+    set_helper_retaddr(ra);
     switch (mop) {
     case MO_UB:
         ret = ldub_p(haddr);
@@ -368,6 +368,7 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
     default:
         g_assert_not_reached();
     }
+    clear_helper_retaddr();
     return ret;
 #endif
 }
@@ -376,10 +377,9 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
                         TCGMemOpIdx oi, const void *tb_ptr)
 {
     MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
-
-#ifdef CONFIG_SOFTMMU
     uintptr_t ra = (uintptr_t)tb_ptr;
 
+#ifdef CONFIG_SOFTMMU
     switch (mop) {
     case MO_UB:
         helper_ret_stb_mmu(env, taddr, val, oi, ra);
@@ -408,6 +408,7 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
 #else
     void *haddr = g2h(env_cpu(env), taddr);
 
+    set_helper_retaddr(ra);
     switch (mop) {
     case MO_UB:
         stb_p(haddr, val);
@@ -433,6 +434,7 @@ static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
     default:
         g_assert_not_reached();
     }
+    clear_helper_retaddr();
 #endif
 }
 
-- 
2.25.1


