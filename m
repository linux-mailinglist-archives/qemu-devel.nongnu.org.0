Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564235F462B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:08:13 +0200 (CEST)
Received: from localhost ([::1]:50858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjWm-0001vR-BX
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidY-0002Rx-FF
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:08 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidU-0004Ja-RB
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:08 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 78so12791667pgb.13
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=z6NCzPC6tE1OG0rvY3WzwqtBapUdS48hi6o10eMrDQY=;
 b=lDgENiAPZJx9sphpKIsnpaUbOBdrAZ8odWPfopkKMrqMjrGXvu9F6LwUlqnul5PL0R
 yoHboGIzpbQfwADTdBID5ab9nikcpA2Nwemw4xhC1rQFeWkRkH6lnTQ0ADWahPaEqbTJ
 hm+Mvv/85rT2PfdpVN3btDzaLaDj4CIxrPXsQB42Y2PqpXssvs0xYihhp/VBrjT3qb9d
 v9zrDFZo7xvdU4vDSqAgPYLOt+kB6eEKyF5FhQE+zUSvTaeQgkqJYHQjnzPCWGGazC/L
 b+Vi9s/HNIAUYe4LJ/wMKkvAvLX4T+zLt3gEpE6eM2Ddjk1tN4SWCd04JtnF9sZqCbEg
 AIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=z6NCzPC6tE1OG0rvY3WzwqtBapUdS48hi6o10eMrDQY=;
 b=5BfTb2I6Zj60ZGbrFeZn+zMnCU3mVszcPp34aG99tP4Px+qnANxNM27gK857ZCGl24
 jrOt4HjoA/V884bpn4XbjLsUHJkn0CIHgG3fI2BjKlSukYSzNryDPnPTLtKKtTJN+p1C
 EA1u4IwCC2UrKtlIhoD5FSWSnTlNpO160elwSTquNozCDKwnijoFLy8fCCqugkKQGx6N
 ajMvElj5sghprdQ13CSiLq87q2nDTKBEK5d5h//RG2ensS6SEQiCfXZqCa3bwtruMgjK
 mnsgGrQkGqqFvUwv/PmiLhouh+gBMbqwTp6T3NKM3zVurtAmRJvkgXGP7GssCuuxmQ4l
 FFOw==
X-Gm-Message-State: ACrzQf1mDgMHdJcQMbJ+7EHnTxfQW/obIVpkFZGw7B3tGjWXdAtI/OJ1
 Q6IJeBsQQ0mJVBkA2w+2ff052QbSXu9glQ==
X-Google-Smtp-Source: AMsMyM7gET+gAx4rMehW6xFOl92oxlmrb32gjWbf4/xIZMt/vdbqKRG4y4S8UJtvB134HXXT+O+PVA==
X-Received: by 2002:a63:e04e:0:b0:44b:97e8:101f with SMTP id
 n14-20020a63e04e000000b0044b97e8101fmr11782935pgj.330.1664892663463; 
 Tue, 04 Oct 2022 07:11:03 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:11:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 05/18] accel/tcg: Drop addr member from SavedIOTLB
Date: Tue,  4 Oct 2022 07:10:38 -0700
Message-Id: <20221004141051.110653-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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


