Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED6759C480
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:00:29 +0200 (CEST)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQAmq-0003N7-8q
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:00:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Lz-0000mz-4F
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:39 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ld-0000ja-Rc
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:28:38 -0400
Received: by mail-pl1-x629.google.com with SMTP id d10so10236980plr.6
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8ckYZp2ZvZbbjSC1kLgVsysS87kN66e9geBqNJpjIqo=;
 b=rNkciHAZFqKS7O33KhCFPzLUzUp+7gcxaq2LffmReh9wVXWXJVSJhwt6k29lxjVg6j
 inSKnsPuhcMretBF7rcT9mn7KiCt9imGW5Nzjjws2AeIcKjG0/sjO7wk5A45WriVDSM3
 OmrnVWDTd9tsAL4mEOwT/Ng4SOA8Xw6vfJtl+P2kgpCrf1q7CQfTQoqBc3rAzAg3ELt+
 gPUtcqUFUhgpxM0JrVQp8GqZX5+JdU8gAdrVTdCl1gCELP3no74NivpEFqlECHcQuini
 ol5K6k6gWbjRFvHF25r6hM0jjNJJ2COBqK1YbR6MtohxjA35NagXn+zhTGe2g5eDRIib
 mhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8ckYZp2ZvZbbjSC1kLgVsysS87kN66e9geBqNJpjIqo=;
 b=2rzIqkweFLIXppuG4QDkXaPwSw3omYeSE0rfpvD5Z/YubRZ9CAm4PGLC+ajrkeiSHA
 3mdJul02gqmDTg0ASGjxKCeUk1sd1ezTkmsN3byg+jPL/wUTD+ksNYL1RXEFhgHw9o5h
 wKWnMokXgeRL2iDndWiYo92WY3r4/3DTmdztwj2BgkGpLUN3QS8W03f9D7JyUM7lsipx
 kLS0FMLHdwzO3Fe2eryc25yxtO+8wo8oWTTiSs23N4t22e2HxnCJMC0zMaF94PQHk7no
 8YV3TpJgTN0a6I41I2jFWnAk6YVon7tc3/WX2j4tYaG+VqxhJuU9NSURsdaBm/qGPpKS
 l9+Q==
X-Gm-Message-State: ACgBeo0t2HI3ul5g3JeWUiud4QV62n2MG9LfSQ/6hbm2BNtXNRhE4esM
 B+OzPE8H+/tseRy/aoBCxrE6XX8MbecNmQ==
X-Google-Smtp-Source: AA6agR6Q8jENdGoV8lbxUsrL6k52yz2FDCHUSBuOHozheF1YMErvCK8g8vS/N8KY5Q9+sDF5fWpXHA==
X-Received: by 2002:a17:90a:1d0e:b0:1fa:bf2e:a56e with SMTP id
 c14-20020a17090a1d0e00b001fabf2ea56emr25998470pjd.23.1661182097106; 
 Mon, 22 Aug 2022 08:28:17 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:28:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 38/66] accel/tcg: Drop addr member from SavedIOTLB
Date: Mon, 22 Aug 2022 08:27:13 -0700
Message-Id: <20220822152741.1617527-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
index a37275bf8e..1509df96b4 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1386,12 +1386,11 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBEntryFull *full,
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
@@ -1420,7 +1419,7 @@ static void io_writex(CPUArchState *env, CPUTLBEntryFull *full,
      * The memory_region_dispatch may trigger a flush/resize
      * so for plugins we save the iotlb_data just in case.
      */
-    save_iotlb_data(cpu, full->xlat_section, section, mr_offset);
+    save_iotlb_data(cpu, section, mr_offset);
 
     if (!qemu_mutex_iothread_locked()) {
         qemu_mutex_lock_iothread();
-- 
2.34.1


