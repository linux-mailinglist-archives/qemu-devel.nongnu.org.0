Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2785E3D1264
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 17:28:46 +0200 (CEST)
Received: from localhost ([::1]:48540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6E9N-0000uh-6l
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 11:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m6E7p-0007Lx-4X
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:27:09 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:39905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1m6E7j-00041k-ML
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 11:27:07 -0400
Received: by mail-ej1-x636.google.com with SMTP id ga14so3843505ejc.6
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 08:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmcY+yD1tmUyd/kQyLuAdWH8+M5gVJSdYfJj4zAiRI0=;
 b=DHWDUJLYicC+LWKK3dk/ja80BP9cMlUuYrVsM4946i1YMKijOjsrRPeWddVX4yvB3k
 3fwHIgh4hf3qK0L2jPR0PF5huckDlkD13WLplIdFCa8S4BvEY1euR2mXg4UdaYHPCs4p
 XkPxaif/lemqh1TP8OsYeYp/NpNHt6bTxE2eWkKx4+1EgFQiqP4SDqLiNV1AaEvOXV8S
 cSMWUrFv8QZHiDwpT2QqQIomtIRQAQLJkqM5NdKD+5t08lK0WQ6AXrXOZs+8I541Yv9H
 dJ48pwva7inYqtFM4tAm/vODbgwVpDrOLFF8vB9Bly5JOsRDjAskUtgasR8Pk2n8ulI0
 HPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jmcY+yD1tmUyd/kQyLuAdWH8+M5gVJSdYfJj4zAiRI0=;
 b=BTYM75IqVGzfXSqgp9sz6RkXfJs/t4kiu7zC3+B3XKcnQdnbs88jG3AhTYkLsSkGEe
 HZZIv23NecrsnZLxO9fNw7FQP4k89EAwfqFxoPGo8hjHqZzG83HjFENAlsYffaglg3mH
 ek2QaqgU2f/GAP3Pv0SxB3TXK1VSqcd0H8id/lDAw9oF7n4xVcs5Bvj88SghwCMtRHOq
 iIE2sqXxoDGDlNEnZnpKRKrVWu/XPiHI4ZQJzvfLFJoQpfyM+OmHpYZYcHIwE8SrdfeJ
 czEUZDi5T9gfkF4xaclP5P2Bwr74aTaH54Ngj94QcoPC+K3gNNKN728zZ+NaMgFpqgrv
 3Abg==
X-Gm-Message-State: AOAM530oCBRn6qYy5c/bolNsZbMUwzqBU2ku2pBePn2prxDP3faX86BB
 tCEAXnUIhVPL45r0SAu6xd2TxJR6VCB9YbLY
X-Google-Smtp-Source: ABdhPJwtf+aPuiGd1VxiWoP+ny09QLLmiF5vH5Hu0jIj98r+UpmIP+nYDL2WP93d+SfBnLtFeSDqtQ==
X-Received: by 2002:a17:906:e099:: with SMTP id
 gh25mr38816428ejb.346.1626881221082; 
 Wed, 21 Jul 2021 08:27:01 -0700 (PDT)
Received: from localhost.localdomain ([151.68.51.173])
 by smtp.gmail.com with ESMTPSA id r27sm10253217edb.66.2021.07.21.08.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:27:00 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: Added V_INTR_PRIO check to virtual interrupts
Date: Wed, 21 Jul 2021 17:26:49 +0200
Message-Id: <20210721152651.14683-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=laramglazier@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The APM2 states that The processor takes a virtual INTR interrupt
if V_IRQ and V_INTR_PRIO indicate that there is a virtual interrupt pending
whose priority is greater than the value in V_TPR.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 2e66b05729..7ce85d1515 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -118,6 +118,16 @@ static inline void svm_vmrun_canonicalization(CPUX86State *env)
     env->tr.base = (long) ((uint32_t) env->tr.base);
 }
 
+static inline bool ctl_has_irq(uint32_t int_ctl)
+{
+    uint32_t int_prio;
+    uint32_t tpr;
+
+    int_prio = (int_ctl & V_INTR_PRIO_MASK) >> V_INTR_MASKING_SHIFT;
+    tpr = int_ctl & V_TPR_MASK;
+    return (int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
+}
+
 static inline bool virtual_gif_enabled(CPUX86State *env, uint32_t int_ctl)
 {
     return (int_ctl & V_GIF_ENABLED_MASK) && (env->features[FEAT_SVM] & CPUID_SVM_VGIF);
@@ -363,7 +373,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
     } else {
         env->hflags2 |= HF2_GIF_MASK;
     }
-    if (int_ctl & V_IRQ_MASK) {
+    if (ctl_has_irq(int_ctl)) {
         CPUState *cs = env_cpu(env);
 
         cs->interrupt_request |= CPU_INTERRUPT_VIRQ;
-- 
2.25.1


