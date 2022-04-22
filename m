Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E9950B61D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 13:24:55 +0200 (CEST)
Received: from localhost ([::1]:50088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhrPC-0007nU-8s
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 07:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAD-0005It-AZ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:21 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqAB-0002tb-LA
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:05:21 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r4-20020a05600c35c400b0039295dc1fc3so5088113wmq.3
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eHw+HjmQRq2oIAbizpb+nwuiBNkSn27k7ONTIxuJM9E=;
 b=icGpDVA7TDqsxOI5X+kKz7V2Fnzqt4YUlpYJ08PebBwJ7Fem/u/gDP4KQNDhHTi9BD
 +DmPO25KMktbctQR+cfCZQ+jBCHtrm8IMKO1DAUYCEZq9zO0RZaPfXiUJuGiKQvbIV/S
 qd8TtAgIaUcYwsE2dpQlGP82hm/Ub++u3mgaw9MQJQlHTfE692UZ+4D91nhrCAezUkFk
 BCaXch2ZkcDF5ILDvyACQN6toxRzHqPxFPLlt0QxwHmXVQn6W8iTPmLM0fWMCqfLG0FU
 FtpC+kq4dsvEcEpmz4S7QcnQZ1ze4ndacw09MmCf5e4B+kO3vASM8CnwTrSV/MxVZLcr
 HcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eHw+HjmQRq2oIAbizpb+nwuiBNkSn27k7ONTIxuJM9E=;
 b=mD6O4V0gMrZif+14J1DdBZK6o7ebRdgCNM0OHyh7u6x0SHykK5lO/uVq0hPar6G1VR
 L4ERSNpLHU4FrgQ/YTcSQmTuMR/oIhU/7+7jaUOB4utDjqGXQcz9G/Wowe7QeTOXeJ2m
 9Eo58P2EFlqdEj5MMhgs3Cs0jan5/7CF/TnTufwSm2Scw/XvUA8tvKAyu3Wa1/EKHQ3i
 Lu44I+fM+5PI+gGC+9zJqPCShfH1ZZHLat9yHvtiq4cHOgZVaeXw/3Uw4G9f7MWRimL9
 qvopo0sAzzo73IdEPj+DCyD/UwdkyiTbzJtXkEunyEoiqss9PIT36FjMtqRkGt5r2PhH
 BUsQ==
X-Gm-Message-State: AOAM533gWYlyhxkjSJ2oFXN+PqwberRpd+3ud71KOQSGHWqvN/M8QanF
 W2JKE8LO+wa61AznD6+ScicLNG7ey91eiQ==
X-Google-Smtp-Source: ABdhPJxvyfYg0ZFLYWqm15tY3x4PPkddhtD65QYpCYULvw7QTwKzlHzh+6kd7n3vdcIb4a7hdL1AOg==
X-Received: by 2002:a05:600c:4313:b0:38e:b150:2f8e with SMTP id
 p19-20020a05600c431300b0038eb1502f8emr12585999wme.198.1650621917031; 
 Fri, 22 Apr 2022 03:05:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.05.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:05:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/61] target/arm: Change DisasContext.aarch64 to bool
Date: Fri, 22 Apr 2022 11:04:16 +0100
Message-Id: <20220422100432.2288247-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Bool is a more appropriate type for this value.
Move the member down in the struct to keep the
bool type members together and remove a hole.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h     | 2 +-
 target/arm/translate-a64.c | 2 +-
 target/arm/translate.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 3a0db801d3b..8b7dd1a4c05 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -59,12 +59,12 @@ typedef struct DisasContext {
      * so that top level loop can generate correct syndrome information.
      */
     uint32_t svc_imm;
-    int aarch64;
     int current_el;
     /* Debug target exception level for single-step exceptions */
     int debug_target_el;
     GHashTable *cp_regs;
     uint64_t features; /* CPU features bits */
+    bool aarch64;
     /* Because unallocated encodings generate different exception syndrome
      * information from traps due to FP being disabled, we can't do a single
      * "is fp access disabled" check at a high level in the decode tree.
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 19c09c3b535..f6303848918 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14664,7 +14664,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->isar = &arm_cpu->isar;
     dc->condjmp = 0;
 
-    dc->aarch64 = 1;
+    dc->aarch64 = true;
     /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
      * there is no secure EL1, so we route exceptions to EL3.
      */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 38e7a38f280..6018fee2ef1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9334,7 +9334,7 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     dc->isar = &cpu->isar;
     dc->condjmp = 0;
 
-    dc->aarch64 = 0;
+    dc->aarch64 = false;
     /* If we are coming from secure EL0 in a system with a 32-bit EL3, then
      * there is no secure EL1, so we route exceptions to EL3.
      */
-- 
2.25.1


