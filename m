Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9727F6F835A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:58:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuzm-0006Q9-7z; Fri, 05 May 2023 08:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1puuzj-0006Pr-Tx; Fri, 05 May 2023 08:57:07 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1puuzi-0005yK-BQ; Fri, 05 May 2023 08:57:07 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1aad55244b7so12590375ad.2; 
 Fri, 05 May 2023 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683291424; x=1685883424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rRVZ32a4BFDGV2rCJ0jznt02oYS4Ug7qaMGKee0TExs=;
 b=dx30o8gwVArd7Pfv6PkzLzQmjklmZKgIR/5bohgAPhsCqotlXTFTRSuQTjpcOGgBtg
 7CIM3GQPQuBSt+P6pkpBUOZZuWh43elnUFoFGFBuotTt6OlSTnpa6BPEqlI5RoNkt6e0
 Nz13LlfmO2Rl6GffXZDz0kX1D9Kg0RnlU9aQ6U44r/zHFREwrCQfjl/Z/EvqUVVK97ME
 x64KAbvoOMpIn/6MXMoANbU3EGUd5awz4trK5J3UH5a1IJjGj0Xb75P3W+aDqSwJXH4U
 VTXdk7Auxl2PoibBdNgn8RZwQOPggKyjQr7xHh1C8hGCTXmvWbHPGSHpxO0S+P+xyw8l
 NpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683291424; x=1685883424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rRVZ32a4BFDGV2rCJ0jznt02oYS4Ug7qaMGKee0TExs=;
 b=aNKOWeWY2H2XNGC44K+c8uu1GJUncTleLbZwvm+BLND9ksm5gl1akYapivHzvR2/Mu
 XpnO8CZA8mHmY/5ZyrpChJn3yfchKd4/2aX7xcIoxVJRYhZZ0hjSjg4WmP79/muGG9P4
 uEqKdt6xXcCHZ6YgbqSaWd3vxmk5q5lyRDj+GtGozU7p3tYggjQqd+82sd6MhGPMcfw/
 RBnfNGE4wrPMFCJb1MWO5LC6kY7byZXcve//M5FFSALDZROqp9A+SvTxANIOS0W4+eQ6
 xgjxWExj/RJzhmVRs6kvVZhwHvTi0JwczdwXx5TYQh4tYUyCpA4hNyH0gwixXrniPtbi
 qKsQ==
X-Gm-Message-State: AC+VfDzsDxFK/Li8NVwCVvkyzUsw0Zmmad3KQPys/NYxMqL9tsvUGaBZ
 QDnxzQ+x7wlTasFmlwOeBRA7tESp/v4=
X-Google-Smtp-Source: ACHHUZ5SmHdjFiNg0YUnfMXmyf5pJZ7HasvKgpnYurbqzQ/cOGN/XTNXdnjvuUmA1PpMNHKTESznww==
X-Received: by 2002:a17:902:c102:b0:1ab:eee:c5d7 with SMTP id
 2-20020a170902c10200b001ab0eeec5d7mr1063111pli.48.1683291423695; 
 Fri, 05 May 2023 05:57:03 -0700 (PDT)
Received: from wheely.local0.net ([203.59.190.92])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a170902ab8c00b001a060007fcbsm1711013plr.213.2023.05.05.05.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 05:57:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Fix nested-hv HEAI delivery
Date: Fri,  5 May 2023 22:56:55 +1000
Message-Id: <20230505125655.329422-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

ppc hypervisors turn HEAI interrupts into program interrupts injected
into the guest that executed the illegal instruction, if the hypervisor
doesn't handle it some other way.

The nexted-hv implementation failed to account for this HEAI->program
conversion. The virtual hypervisor wants to see the HEAI when running
a nested guest, so that interrupt type can be returned to its KVM
caller.

Fixes: 7cebc5db2eba6 ("target/ppc: Introduce a vhyp framework for nested HV support")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/excp_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 199328f4b6..a833efa8f9 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1358,10 +1358,13 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 
     /*
      * We don't want to generate a Hypervisor Emulation Assistance
-     * Interrupt if we don't have HVB in msr_mask (PAPR mode).
+     * Interrupt if we don't have HVB in msr_mask (PAPR mode),
+     * unless running a nested-hv guest, in which case the L1
+     * kernel wants the interrupt.
      */
     if (excp == POWERPC_EXCP_HV_EMU && !(env->msr_mask & MSR_HVB)) {
-        excp = POWERPC_EXCP_PROGRAM;
+        if (!books_vhyp_handles_hv_excp(cpu))
+            excp = POWERPC_EXCP_PROGRAM;
     }
 
     vector = env->excp_vectors[excp];
-- 
2.40.1


