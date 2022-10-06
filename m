Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790495F5FEB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:08:11 +0200 (CEST)
Received: from localhost ([::1]:54234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIB8-0001jC-Af
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoM-0004HI-Rj
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:40 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoK-0003un-0l
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:37 -0400
Received: by mail-pg1-x52f.google.com with SMTP id f193so828573pgc.0
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MQwqk3aIYqNZS+g6VsRklK9PY/N9SMW46xNvH4pbJm0=;
 b=HHdvb2YpbvaCQ+431YyfFNm0vk++cbDnVzT1pIqSS0RpgDE64Sk4cdV0RHGEQ4P8FW
 LkIWsNaQCD2rMqPhX0ilnuV7q57DcK0rSmnrnldW+vgSFQuH1Gq6IBqGsO2aspvUV5EU
 wGA1OxUb0OSTAYSWDv/U838MnVUKRRruo7bnV5g9nVy3BEMaoINCC59ZDCp5AYFUMLFP
 PHaCm0M8biUVxx2fLp2zq2UhKu3euPuOIP9R3PodsScRRwyUf4n7AeoGn38XPh4yc3Wk
 eKDAgu19AMB4LA9izwjEkCvy74z1fLVL30Zn20lOb/OrUAOw6U3LrtR6x5WOqrPuLdiE
 8Y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MQwqk3aIYqNZS+g6VsRklK9PY/N9SMW46xNvH4pbJm0=;
 b=R7L9/Q2Sy7H7bcGvsqEAc+fHckUn6vl0s6aOVz0UQjTkMK9H7hcQ/YA19Wpe5l7c9K
 t/3kb66BSFbvk+UkkdytgHvF+CC6q3SRFtyR5Ji2Ybrrg0VGDwMDJm73lEJeY0Gbv5iT
 XFbK0480rzeoX9/CRZSbCjmGOZ6Hay7fmVImqDI2ahqvJONS5Kg3grU8LCOPP7OzBODE
 kdMGcqJQfjxxcOFjHQES4U+YTV5XAAFDx3/oeXMQ065pcusyKhiwI+5YCLB1YNQ4C4vI
 HW8cPDESqhPNTV3M5td91tn6ypJjTlsiUyuWvhNpvjkKJIuKmEDBjXp9819wZvPRZ6Ba
 5zBg==
X-Gm-Message-State: ACrzQf2gGKMgwA+MhLMFCWW+Y0KSyks9ZcN+P05wODlVro7KsAAeoKO6
 Kz87mSzA3EnspHNUCHi/jQ/OwjOOVVY+/Q==
X-Google-Smtp-Source: AMsMyM57wSziT8XsZ+WvgGMLrtdQkfhSds0IvBKlOIS1U24/qSCoup/toqAihvsY8KEkw1Gw1t3ZBg==
X-Received: by 2002:a63:dc54:0:b0:44c:ce26:fa35 with SMTP id
 f20-20020a63dc54000000b0044cce26fa35mr2785801pgj.374.1665027874465; 
 Wed, 05 Oct 2022 20:44:34 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH 12/26] target/s390x: Move masking of psw.addr to
 cpu_get_tb_cpu_state
Date: Wed,  5 Oct 2022 20:44:07 -0700
Message-Id: <20221006034421.1179141-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Masking after the fact in s390x_tr_init_disas_context
provides incorrect information to tb_lookup.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu.h           | 13 +++++++------
 target/s390x/tcg/translate.c |  6 ------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 7d6d01325b..b5c99bc694 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -379,17 +379,18 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
 }
 
 static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
-                                        target_ulong *cs_base, uint32_t *flags)
+                                        target_ulong *cs_base, uint32_t *pflags)
 {
-    *pc = env->psw.addr;
-    *cs_base = env->ex_value;
-    *flags = (env->psw.mask >> FLAG_MASK_PSW_SHIFT) & FLAG_MASK_PSW;
+    int flags = (env->psw.mask >> FLAG_MASK_PSW_SHIFT) & FLAG_MASK_PSW;
     if (env->cregs[0] & CR0_AFP) {
-        *flags |= FLAG_MASK_AFP;
+        flags |= FLAG_MASK_AFP;
     }
     if (env->cregs[0] & CR0_VECTOR) {
-        *flags |= FLAG_MASK_VECTOR;
+        flags |= FLAG_MASK_VECTOR;
     }
+    *pflags = flags;
+    *cs_base = env->ex_value;
+    *pc = (flags & FLAG_MASK_64 ? env->psw.addr : env->psw.addr & 0x7fffffff);
 }
 
 /* PER bits from control register 9 */
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 67c86996e9..9ee8146b87 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -6485,12 +6485,6 @@ static void s390x_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
-    /* 31-bit mode */
-    if (!(dc->base.tb->flags & FLAG_MASK_64)) {
-        dc->base.pc_first &= 0x7fffffff;
-        dc->base.pc_next = dc->base.pc_first;
-    }
-
     dc->cc_op = CC_OP_DYNAMIC;
     dc->ex_value = dc->base.tb->cs_base;
     dc->exit_to_mainloop = (dc->base.tb->flags & FLAG_MASK_PER) || dc->ex_value;
-- 
2.34.1


