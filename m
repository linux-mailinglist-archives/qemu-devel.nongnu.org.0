Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD5C43FA7F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:09:48 +0200 (CEST)
Received: from localhost ([::1]:37394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOpY-0007CA-02
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmh-0007cc-GZ
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:48 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmf-0006ED-G7
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:47 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so6959842pjb.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FDVelnyvTrVRr2w/aSQUjI8PmccgLdv1IGhjWt6LpFs=;
 b=VvQiEyHR/LIsRCZzZNOZOtKLe7a58IEhw2/Gs9fIBxPfbMNKHdCuXwzCI94wtr4RcM
 Id2KovWj3v+bb92055jJNvyub15vvoacBjfQUZ2Mns5YZY29JQM2ITf4JdgJjqkeVGVL
 vSWEbszmCB3JDHndITwdyFG5usXXQG+AH145aNgMOGSOw72zxh8htuZ2/UdPm6U/z4uQ
 6MzjHuKjsmVpJcAEOF6djpFwi5VvywdYdYYAQI2lQIrjkCPkBXErKl3RQpOl7yoScMz5
 PYsEj2peJZ/uxgclZSsrJQGjavtLii89mpXKnxQ4e0SuxNDVtq/vY3hd5VXgfO9iWIB8
 mKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FDVelnyvTrVRr2w/aSQUjI8PmccgLdv1IGhjWt6LpFs=;
 b=Ef5q1tkTEPpeU2DrrjnXpqWhcum3XoZqvpronlg3weSwGKXBK/JHTja9vrlPvmWVVS
 r6ZhWARB3BewWGgrlx8nM1qvz1A0dCnkq3R+DVocuc0A+nvHe+tMkWWVAvh8HQLa0Jrc
 xDZDBSRSAmERHNCnxfUOVInU+e7QR0FdKQemw9ZLcCUva0c0iiYRpgW6P47moaVRYToJ
 GVInJZhvSq+vnwWR6eyXB1IeO028vpGf67fDNZYHk6+/o66RTHSx5RuWSCM9p9WA8mN0
 /yHgPP6DcD0zqjZl9snJfSjdSo9GmGKC0b1LG1SqIc3YMcnSDU81Lz40w2yA3DPlmOXw
 Nmqw==
X-Gm-Message-State: AOAM531RuSEKI1bKAiOVStvMPFXjNwl46HIvl5dhoihBs8hLEhrMU0YN
 J/pU+J2TLpCJQ48KBEiejBRBNjDnBT8CxPTn
X-Google-Smtp-Source: ABdhPJyt8ezX2Jqxoj+eP6FmiRLhxRbBiU1VwLZxRo+mEmld0IwvGQ8QJTENfFlgjGLRxIOqggY4RQ==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id
 oo15mr18705817pjb.87.1635498164179; 
 Fri, 29 Oct 2021 02:02:44 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:43 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 50/76] target/riscv: rvv-1.0: slide instructions
Date: Fri, 29 Oct 2021 16:58:55 +0800
Message-Id: <20211029085922.255197-51-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f883fdf4749..d79f59e443e 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4430,17 +4430,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    target_ulong offset = s1, i;                                          \
+    target_ulong i_max, i;                                                \
                                                                           \
-    for (i = 0; i < vl; ++i) {                                            \
-        target_ulong j = i + offset;                                      \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
+    i_max = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
+    for (i = 0; i < i_max; ++i) {                                         \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
+        }                                                                 \
+    }                                                                     \
+                                                                          \
+    for (i = i_max; i < vl; ++i) {                                        \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = 0;                                    \
         }                                                                 \
-        *((ETYPE *)vd + H(i)) = j >= vlmax ? 0 : *((ETYPE *)vs2 + H(j));  \
     }                                                                     \
 }
 
-- 
2.25.1


