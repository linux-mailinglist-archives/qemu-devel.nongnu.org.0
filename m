Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6172C663173
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:25:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEybt-00059s-1C; Mon, 09 Jan 2023 15:19:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybq-00055S-Nj
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:06 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEybp-00054Z-0J
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:19:06 -0500
Received: by mail-pg1-x532.google.com with SMTP id 7so6704976pga.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8X0Lb47wJgNa3+w7lfIg0QENGe9Mb2V6lxaP2jwNHKI=;
 b=twr0gZmUV6fN+Du5d91yAjQ9SBJfYyWIm83jMP8+H/BeeqVEcWQKuh95m21ouP3fJQ
 eCljOTwCRh9/anUBrMNRRuo/MqpodU7bTaKIkUiXsgLaNp++8dxCgec+3pHHsD73F2oV
 unXdYO/U+9oK81QvLP6z5O/Xp8UCpd1Xz/wKaj7/kKpicp9VN/75h14o0K+J3C+ywqIt
 kBdnnBKPMTDx8bRNiJgUW8YrKDXStwZ354ax2m1lyddNAQw4i4mh16xwPu1D6Mq91U+j
 W4a1t2GQPkQ6YsljwCCZKwfaxq2FgsQWDojrIGRAXbuIyQtw1hEant1SoBjPrwa75xeS
 Tz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8X0Lb47wJgNa3+w7lfIg0QENGe9Mb2V6lxaP2jwNHKI=;
 b=EE8f2jPtkhGtACOrKER74LOCM94FE7GVOe7A2dQIydWpTovUxWraSoKSkJPOmoCUbL
 8q9eUd1SdOs2nD7nGjcJE1o94YXL5MPGsIChyTlfJPtdGM0Vp4wiKOrV6y4Pl91DLM+w
 D+RzBL3nO0PrNKBsIs8fVqwCaLD8WdslzJvMhXNE0dzBiMXngDVIR4IP8ASD2ewO5hyG
 fVdFxz38uCxJBRnYg4StWdy6ag6PsSVq9rrYSGsWZo+W/spOr0LlcXaaY5A0PKogkE/1
 cJWyhfcJwuWSn2YLPqqXTw2J+kg4YziDecazNltXgs7Su2x4flawbvWH+gXGr5OX4HFB
 1zBg==
X-Gm-Message-State: AFqh2kpkiONagJW/cPlwRbO6g+TPdNPAiYyR+3ns0ib3kBZ3paoRgGfV
 JukV2Coa0EaJ8mmo20Dm34E8FyP5EuJJyUhs
X-Google-Smtp-Source: AMrXdXscusBLx1DBr77U3Pt0yGFlgsX1i1J1e5pt88pphB4CMG3hfelNTUmwO8Yviu5gh9heit0FyA==
X-Received: by 2002:aa7:8286:0:b0:57e:c106:d50c with SMTP id
 s6-20020aa78286000000b0057ec106d50cmr71768699pfm.17.1673295542129; 
 Mon, 09 Jan 2023 12:19:02 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 c132-20020a621c8a000000b00589a7824703sm1470972pfc.194.2023.01.09.12.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:19:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: david@redhat.com
Subject: [PATCH 4/7] target/s390x: Tidy access_prepare_nf
Date: Mon,  9 Jan 2023 12:18:53 -0800
Message-Id: <20230109201856.3916639-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109201856.3916639-1-richard.henderson@linaro.org>
References: <20230109201856.3916639-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Assign to access struct immediately, rather than waiting
until the end of the function.  This means we can pass
address of haddr struct members instead of allocating
extra space on the local stack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 0f2830f87c..59237fe7de 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -176,39 +176,35 @@ static int access_prepare_nf(S390Access *access, CPUS390XState *env,
                              MMUAccessType access_type,
                              int mmu_idx, uintptr_t ra)
 {
-    void *haddr1, *haddr2 = NULL;
     int size1, size2, exc;
-    vaddr vaddr2 = 0;
 
     assert(size > 0 && size <= 4096);
 
     size1 = MIN(size, -(vaddr1 | TARGET_PAGE_MASK)),
     size2 = size - size1;
 
+    memset(access, 0, sizeof(*access));
+    access->vaddr1 = vaddr1;
+    access->size1 = size1;
+    access->size2 = size2;
+    access->mmu_idx = mmu_idx;
+
     exc = s390_probe_access(env, vaddr1, size1, access_type, mmu_idx, nonfault,
-                            &haddr1, ra);
-    if (exc) {
+                            &access->haddr1, ra);
+    if (unlikely(exc)) {
         return exc;
     }
     if (unlikely(size2)) {
         /* The access crosses page boundaries. */
-        vaddr2 = wrap_address(env, vaddr1 + size1);
+        vaddr vaddr2 = wrap_address(env, vaddr1 + size1);
+
+        access->vaddr2 = vaddr2;
         exc = s390_probe_access(env, vaddr2, size2, access_type, mmu_idx,
-                                nonfault, &haddr2, ra);
-        if (exc) {
+                                nonfault, &access->haddr2, ra);
+        if (unlikely(exc)) {
             return exc;
         }
     }
-
-    *access = (S390Access) {
-        .vaddr1 = vaddr1,
-        .vaddr2 = vaddr2,
-        .haddr1 = haddr1,
-        .haddr2 = haddr2,
-        .size1 = size1,
-        .size2 = size2,
-        .mmu_idx = mmu_idx
-    };
     return 0;
 }
 
-- 
2.34.1


