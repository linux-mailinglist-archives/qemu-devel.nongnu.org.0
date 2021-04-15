Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE1B3601D6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 07:44:46 +0200 (CEST)
Received: from localhost ([::1]:56366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWuo0-0002N8-Kt
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 01:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWumE-0000gE-Io; Thu, 15 Apr 2021 01:42:54 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWumD-0007HX-3a; Thu, 15 Apr 2021 01:42:54 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so13737710pjb.4; 
 Wed, 14 Apr 2021 22:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZY/g1DDp//F/F5LFsGZagO1HYB3lEEm5TGBFu+93DlY=;
 b=a2dK6POTAtK9q1idOMQSvQCmYu/Doat/kKInI64gQgU3+ndR0DZaKIlv74aOa5M0Sz
 Fj8HneL14GuV1T/2ROEswJfNlOBQQSB0dqDYTOoUUnAANRCJVOOjP6U+9bVlNySJTEaL
 458+RaKPMoBA7MrsCFz95cSw58Uf+rbAHyhxWb2Y9ED3FPXfMJqEMy5k0srRbse+rdZV
 3I+8KJIjtBNbWmNOpr2kCEqCJIj0f/nlf7fSwXQwt5k49VhjMEpXDSNRmdFAfdkKW9gU
 Pp53aC0w3P1lXjlg9lAOxvk4llqWPkkhHIngw1fWs620sWwR4IkHOWbKqalIgJBtFN4B
 Mayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZY/g1DDp//F/F5LFsGZagO1HYB3lEEm5TGBFu+93DlY=;
 b=kJx9Px+Jyl0rWemJBwmxjRQGGckQmAOiLGXRnlJnaj0u8H0hqqLnADzu73Df5xXcQL
 9u1J6aot4WNcP4ae2BTtodxdyqouIyQYSH0/duI2nwfc6RJ/o8qXApGy5y6pNqiS3jtl
 hmmGpjD3iXZmiD6jwxKZISxJpQnkzKtf66Lcj8A15BA/VeRVJtS7I1zDGaS3EmtWiRhz
 rFqRYauNAFqsu4moPEgCV6EYDts/POTFElXIVxUtTavg5i3AI/NHYwrjDyKxo3SIWrfJ
 uD3BmKXpyN8yCQayLfqhzofsoaGaVFISJnu/IWs98FNb0lijhEvUyttHHt4K5M8DcOF/
 YhpA==
X-Gm-Message-State: AOAM533f/C3ikrx9Ub8qW6aPFDVUnyvpsx2D+9DMfLtNWqgzZfdSPUrD
 5zxiqsssx/X8sVjKiRemYsqMdzZZgA4=
X-Google-Smtp-Source: ABdhPJzBEb8NZEp1JXyXLkBIi5yab/i2qP8AESQsaijSHQ7/VIQ1dyXl1p0L8s8SXwWePm34TOgUxA==
X-Received: by 2002:a17:90a:a613:: with SMTP id
 c19mr2002673pjq.117.1618465371459; 
 Wed, 14 Apr 2021 22:42:51 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id c5sm946151pfp.183.2021.04.14.22.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 22:42:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 1/4] target/ppc: Fix POWER9 radix guest HV interrupt AIL
 behaviour
Date: Thu, 15 Apr 2021 15:42:24 +1000
Message-Id: <20210415054227.1793812-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210415054227.1793812-1-npiggin@gmail.com>
References: <20210415054227.1793812-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102f.google.com
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ISA v3.0 radix guest execution has a quirk in AIL behaviour such that
the LPCR[AIL] value can apply to hypervisor interrupts.

This affects machines that emulate HV=1 mode (i.e., powernv9).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/excp_helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 85de7e6c90..b8881c0f85 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -791,14 +791,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 #endif
 
     /*
-     * AIL only works if there is no HV transition and we are running
-     * with translations enabled
+     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
      */
-    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1) ||
-        ((new_msr & MSR_HVB) && !(msr & MSR_HVB))) {
+    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
         ail = 0;
     }
 
+    /*
+     * AIL does not work if there is a MSR[HV] 0->1 transition and the
+     * partition is in HPT mode. For radix guests, such interrupts are
+     * allowed to be delivered to the hypervisor in ail mode.
+     */
+    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
+        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
+            ail = 0;
+        }
+    }
+
     vector = env->excp_vectors[excp];
     if (vector == (target_ulong)-1ULL) {
         cpu_abort(cs, "Raised an exception without defined vector %d\n",
-- 
2.23.0


