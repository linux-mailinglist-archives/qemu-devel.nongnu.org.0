Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD87E6F51D4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:37:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6tq-0005R4-5K; Wed, 03 May 2023 03:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tU-0004XW-Sp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:21 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6tS-0005fn-W3
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:27:20 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f19a80a330so29642715e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098837; x=1685690837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eu9NQtb2FUQWFu9rVl+RtTj4i7Vm9wmVlC22z1EyvKw=;
 b=dnh8VDXEnHNKsKCMXOX7sfGENALEx/dKU+Rlimq83NX/Dozi7XQlVeC9lcp6vBuKrd
 qnXB07fWkYVoECUzopBjVjCVfB+rv5Y7WlM9vmArTFpPPBqRp2QRz67WLtHEi5gqULBD
 kkGlzPy1Wzlz4gIhaizr31FMqHyU2qVxL6ZbBXqM6jPWoGmXFpiw8RCNsPX1xk6ckX31
 I2EHuav46OK/C//HvrSjQV6JDDU69NXhrBqfXXY4YItwIbkaqwrOXk3BScuGNeEDfyYg
 sVe2j28c8VULpvTtoPieFNeffJ44vj+KZM4Qro+DLHRkkdbdYm7d48/NlbJPeicjBhSw
 q3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098837; x=1685690837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eu9NQtb2FUQWFu9rVl+RtTj4i7Vm9wmVlC22z1EyvKw=;
 b=O5ExviQM1po5Jjb/V3e4A90vltzNbkmgdaQ/55BhgZ+Iq6h9aJaXNdh+olvYg2shvb
 J5wYwk2PzDZv7KLT+3am24c2DD0tZnmKxdEPvWPDcYQhszPCWc42WYW7iQaFGRlv2Yy3
 18kokBFNlie+Zy8HV2PYI/sT+IEh4/HL8cieOfbwy0CPu4GCAKu910FYhF8lyTvhWZ3N
 BbPMvwm7pDz+W6dk6akv1Nggf8KbWB1iZXULlcXyqb1qqtmR7m4vT+6X3aeSFwANyhlS
 myx2vONKuCkRUibthN0Ief7kAHzMxfTJ5pGxVrw49vCWqv3+cYjlVLGz4zSIsmCbH4dA
 Pf1Q==
X-Gm-Message-State: AC+VfDx44YpO/TZUexgMK0+SEH1eNQKM73gh+vW3tLoFMnxofWzGAfJU
 JrI/pGYHlWZLq1MlwCIQ3zBTF6arsCyH8J5bmgeWxQ==
X-Google-Smtp-Source: ACHHUZ7iEMELXRQUhnK7GVsW8IX0acgT1iOlAgbQYZayoBKtZUG37rNrbf7LW/2uYfrz0S/8MbWyJw==
X-Received: by 2002:a7b:c446:0:b0:3ee:6d55:8b73 with SMTP id
 l6-20020a7bc446000000b003ee6d558b73mr13371736wmi.29.1683098837623; 
 Wed, 03 May 2023 00:27:17 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm974315wmj.23.2023.05.03.00.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:27:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 60/84] exec-all: Widen TranslationBlock pc and cs_base to
 64-bits
Date: Wed,  3 May 2023 08:23:07 +0100
Message-Id: <20230503072331.1747057-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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

This makes TranslationBlock agnostic to the address size of the guest.
Use vaddr for pc, since that's always a virtual address.
Use uint64_t for cs_base, since usage varies between guests.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 4 ++--
 accel/tcg/cpu-exec.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 8c8526d9f8..58ac1a91c2 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -519,7 +519,7 @@ struct TranslationBlock {
      * Unwind information is taken as offsets from the page, to be
      * deposited into the "current" PC.
      */
-    target_ulong pc;
+    vaddr pc;
 
     /*
      * Target-specific data associated with the TranslationBlock, e.g.:
@@ -528,7 +528,7 @@ struct TranslationBlock {
      * s390x: instruction data for EXECUTE,
      * sparc: the next pc of the instruction queue (for delay slots).
      */
-    target_ulong cs_base;
+    uint64_t cs_base;
 
     uint32_t flags; /* flags defining in which context the code was generated */
     uint32_t cflags;    /* compile flags */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index bc0e1c3299..9fe07c31fb 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -302,7 +302,7 @@ static void log_cpu_exec(target_ulong pc, CPUState *cpu,
 {
     if (qemu_log_in_addr_range(pc)) {
         qemu_log_mask(CPU_LOG_EXEC,
-                      "Trace %d: %p [" TARGET_FMT_lx
+                      "Trace %d: %p [%08" PRIx64
                       "/" TARGET_FMT_lx "/%08x/%08x] %s\n",
                       cpu->cpu_index, tb->tc.ptr, tb->cs_base, pc,
                       tb->flags, tb->cflags, lookup_symbol(pc));
-- 
2.34.1


