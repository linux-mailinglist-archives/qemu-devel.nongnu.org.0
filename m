Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FECB5ADA2A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 22:29:08 +0200 (CEST)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVIiR-00005U-HU
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 16:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIci-00079G-JT
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:12 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIcc-0004XN-Gy
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:11 -0400
Received: by mail-wr1-x436.google.com with SMTP id b5so12634517wrr.5
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 13:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eGrlsO0BMtQ4NxQnZcrpPpgvXA47KiMUFyTlQ1QqPPg=;
 b=LRp8+N3XL1ner0hOP84QK19qNd5NWTnug8fA2epM5FIjqPNiqDmJOIJ/Uh39TY1hWJ
 xA2llEheBoDn29HR7Ufg2ckrxaW/X0S1Jp1ugrkMKFdIZAtLBdyV7cXJJnFSmWU/aqHC
 ysgY7wWZocgSs+BqDMQA3l3+6NzmMII00vXVZZEiM+NXfO3cCvMOVxJVuNPng1E6Rg/Z
 haX6yDnXyntzVVd8uNU+CQTNzcDSIJxoJ0HedphCR5pp6jdgyUJAgSYiSZWwQ1Be79Jj
 WV/eSgQH2mPeOw9KKuJMfSCii6URm9FADwVYg2nOmUXPMFECrYe4KzTnXSYo+ycYumtd
 nugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eGrlsO0BMtQ4NxQnZcrpPpgvXA47KiMUFyTlQ1QqPPg=;
 b=dY0fDF+YpaQ3sy8usqIl+8SKrzrgRSRc1srchlIOKrDMP6JRwKBiDovoH24oLcQNqc
 325zeIYv+JWV67oqISX3TRSweo08bcnVMtd0MmbInr7Sud8W4asLLUedAKSLD3q9xNOd
 3p9s9Nul2Qlq1Uk1WQ+SbQlg6hBrhUhX4J33MZl8pkFctZxD7ONdpHRoh/txWo64jWMQ
 Q6qA/vdV1qhHjXQTHPPUMyLZNpCGMQEkQ8sfVhsK/KkSm6O2/9uDEa4Az2zeR3pvXnz7
 hpmcQINx1oC10A4IIwkkgHyCHFoYci/D0oRc89rZzlCcH641SVTGz+/nP8KFrK+o+gfH
 0xxg==
X-Gm-Message-State: ACgBeo233OdeX660B4jMMqhqrRVoxOm63+T40/2AMGdwLB0Ma1yGccOY
 /Q/y07iFnvbkRQiPmI16oTqL0RDVYQ1Dn2PE
X-Google-Smtp-Source: AA6agR4k0lLnGiRVfy4VRUrQCithMQBk0e+SPnPQWLz2GtFjNfNhHczblD0X2NXGk3pauDHedL9kmw==
X-Received: by 2002:adf:f8ca:0:b0:226:e456:1896 with SMTP id
 f10-20020adff8ca000000b00226e4561896mr753191wrq.177.1662409384140; 
 Mon, 05 Sep 2022 13:23:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d56ce000000b00226d238be98sm9472404wrw.82.2022.09.05.13.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:23:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v3 2/6] accel/tcg: Drop addr member from SavedIOTLB
Date: Mon,  5 Sep 2022 21:22:55 +0100
Message-Id: <20220905202259.189852-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905202259.189852-1-richard.henderson@linaro.org>
References: <20220905202259.189852-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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

This field is only written, not read; remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 1 -
 accel/tcg/cputlb.c    | 7 +++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 500503da13..9e47184513 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -218,7 +218,6 @@ struct CPUWatchpoint {
  * the memory regions get moved around  by io_writex.
  */
 typedef struct SavedIOTLB {
-    hwaddr addr;
     MemoryRegionSection *section;
     hwaddr mr_offset;
 } SavedIOTLB;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 4585d7c015..03395e725d 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1374,12 +1374,11 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
  * This is read by tlb_plugin_lookup if the fulltlb entry doesn't match
  * because of the side effect of io_writex changing memory layout.
  */
-static void save_iotlb_data(CPUState *cs, hwaddr addr,
-                            MemoryRegionSection *section, hwaddr mr_offset)
+static void save_iotlb_data(CPUState *cs, MemoryRegionSection *section,
+                            hwaddr mr_offset)
 {
 #ifdef CONFIG_PLUGIN
     SavedIOTLB *saved = &cs->saved_iotlb;
-    saved->addr = addr;
     saved->section = section;
     saved->mr_offset = mr_offset;
 #endif
@@ -1408,7 +1407,7 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
      * The memory_region_dispatch may trigger a flush/resize
      * so for plugins we save the iotlb_data just in case.
      */
-    save_iotlb_data(cpu, full->xlat_section, section, mr_offset);
+    save_iotlb_data(cpu, section, mr_offset);
 
     if (!qemu_mutex_iothread_locked()) {
         qemu_mutex_lock_iothread();
-- 
2.34.1


