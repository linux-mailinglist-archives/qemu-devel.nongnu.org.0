Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07D5F14DD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:30:06 +0200 (CEST)
Received: from localhost ([::1]:41786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNa9-0003O5-8d
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWs-0006Be-Tp
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:42 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:40879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWq-0005O0-9v
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:42 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id h10so1877248qvq.7
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=z6NCzPC6tE1OG0rvY3WzwqtBapUdS48hi6o10eMrDQY=;
 b=JJwWAIkrRfSYCKRDNLqnTzEMKZnElVKNwEUgXGFJaBMF8OqBrHb3bvAoyOhJHRB42J
 3Zs165EPFM59LrPJQF8VmwVMcmEd07SShhvKBw1cHNqdt5dCg1kLVG4CDA5R3QBeiLFU
 ie/G/0YpAG3IZkTHt9y1764WVY4FJuOmw3nI8rQGA3TXfuRImVacgiOmd8Lk5idYzb6F
 wdLuTOqhHJv+s85dgwCMttgQC23SXMKDRfPuueq3FRJ80PUVT1KwNFNAnkoy3tVUMwxm
 sxZX0P9z/s2/h67BqQqkHqkLD6NOvEip2fcJvQ/R3gc7hLcpEURgTy26qfbnr5is1lIe
 QiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=z6NCzPC6tE1OG0rvY3WzwqtBapUdS48hi6o10eMrDQY=;
 b=237ILg8g3JOrFVBJvarnLI1oJf7un5U91VYJLzCRXJZCsac5djZESlna3605BSDO0n
 9ZsCsgG7nyZsYZXs9RADA81gZXNN7AabvDLrZrzzte0SI9IXHrFTyantuUzSkw0aHuFE
 hShsr64eb2Y5676Om///W9EEmqk6FJtN8/zhdxRXCEkS39U59O81iyPCKcXx5fuT1bwS
 5UWQFdU05amZKIU0fUXtbkrheR3sUWcxlsgZILF/P13g6Ob7wT11O/YUz4s5KjOO6nHk
 Mfo+vV2DOA3vx1GPL4JL12I/oXuxzTfCIk9qnGZRRtFJiQy249Ldg6LwOB7BXEbFWa9z
 C0Vw==
X-Gm-Message-State: ACrzQf1zgJOcTIZSNo8U4XeBOjgzaU7VppYDhW/jITLJQHPVH71HG9Iv
 6DlDoaZAg5yQWKI5RbHOWRD3DyKiup8xzA==
X-Google-Smtp-Source: AMsMyM494zyFKXe6qMp2Icv76eDbdgP7eEh+8kML/qndmjtqDZToAAv+i9fBGXl/+tKjBWCf7Zym3g==
X-Received: by 2002:a05:6214:27ee:b0:4af:95d7:c899 with SMTP id
 jt14-20020a05621427ee00b004af95d7c899mr8511873qvb.75.1664573198278; 
 Fri, 30 Sep 2022 14:26:38 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org, alex.bennee@linux.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 05/18] accel/tcg: Drop addr member from SavedIOTLB
Date: Fri, 30 Sep 2022 14:26:09 -0700
Message-Id: <20220930212622.108363-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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

This field is only written, not read; remove it.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 1 -
 accel/tcg/cputlb.c    | 7 +++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1a7e1a9380..009dc0d336 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -225,7 +225,6 @@ struct CPUWatchpoint {
  * the memory regions get moved around  by io_writex.
  */
 typedef struct SavedIOTLB {
-    hwaddr addr;
     MemoryRegionSection *section;
     hwaddr mr_offset;
 } SavedIOTLB;
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index aa22f578cb..d06ff44ce9 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1372,12 +1372,11 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
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
@@ -1406,7 +1405,7 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
      * The memory_region_dispatch may trigger a flush/resize
      * so for plugins we save the iotlb_data just in case.
      */
-    save_iotlb_data(cpu, full->xlat_section, section, mr_offset);
+    save_iotlb_data(cpu, section, mr_offset);
 
     if (!qemu_mutex_iothread_locked()) {
         qemu_mutex_lock_iothread();
-- 
2.34.1


