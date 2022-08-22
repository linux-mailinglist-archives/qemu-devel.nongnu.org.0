Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F4359CCAB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:00:51 +0200 (CEST)
Received: from localhost ([::1]:33400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHLe-0001NA-EQ
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:00:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ4-0003zP-2c
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:10 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:37844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQHJ2-0002hl-Ff
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:58:09 -0400
Received: by mail-pg1-x52a.google.com with SMTP id bh13so10814033pgb.4
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8ckYZp2ZvZbbjSC1kLgVsysS87kN66e9geBqNJpjIqo=;
 b=OdBvlSaMvaYb9jCr0pBPIOL0J1G+mg+BN7ff7ZtUEhRmci9JwMz89HswSDATy864eV
 GyfySUy8+ODazJlKRDejY7HPeD7zJgmjchkVWI3En9Zkp5GqKtspSm126uRlpdAh0n4j
 jxbWfEwDtxsKunp2Nx7rGDclgEhgkh6XbJq7UViZIfPmVw2lydPZlSuWsnm9yNTnGOtd
 sKuf/gkSfNukugPO5qHQYvUjlCucTXUVo3Rdp0VfhRpVPkxADFKXCZpSaK1xJLlhWxa5
 Rl4DYXfSfBG/WoIYGMvi8n1YZDMw+gKNNN3tDv83puhMW8GoXPnfVeDLClNRtJwyNk3H
 2KTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8ckYZp2ZvZbbjSC1kLgVsysS87kN66e9geBqNJpjIqo=;
 b=DgeRC5osoxinRbqCZjc9OWJtJfSnv2jrjJaKqas7bpcEgsUbusr607Nf6aTpedaSZk
 8AUD76guaZH9EyhjNk4BL4pZbj17oFJyUAzxYw25Eo2vPfUdlY6UlUW5+K/6xlbbx1wq
 ZTpEuPA/pxMfxcN+0ke2BfIr58r+3nd0vUP2IeYyg5lueHg9hfAiAb/66g7cA+dX1rm4
 yae59UhmVOqERtQMM1BADGrh9I6ZxZSQYo3s6rpxRGo1xrlKDWPjElG2eVK6ql9Ki9AS
 bje6Xiqb0thNUTmdJXxyGeOV8NVMkr4ufRhTwVw2E3Kxj8iznOx8NKPn+fleb8XsT9Wj
 Wbaw==
X-Gm-Message-State: ACgBeo1KUw3FOuqje9WdGeZrC7piaHgczKMV2ghW/lN1AoPzsVcjXeR+
 XGmEJbQAg2jO8DTrpHB0yiRuljrvDn4LXg==
X-Google-Smtp-Source: AA6agR7RY+qRKg7VqTwDltjDQIdaS4Y5DEMrCfZ0qrYu4Y/TM4BAIKzd20Z2r3S1nW23Aj+XzCuG+g==
X-Received: by 2002:a63:4183:0:b0:41b:f6d3:8825 with SMTP id
 o125-20020a634183000000b0041bf6d38825mr18767232pga.193.1661212686590; 
 Mon, 22 Aug 2022 16:58:06 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 w190-20020a6230c7000000b0052d52de6726sm9173159pfw.124.2022.08.22.16.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:58:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	eduardo@habkost.net
Subject: [PATCH 02/14] accel/tcg: Drop addr member from SavedIOTLB
Date: Mon, 22 Aug 2022 16:57:51 -0700
Message-Id: <20220822235803.1729290-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822235803.1729290-1-richard.henderson@linaro.org>
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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


