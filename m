Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2032F5E9248
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:04:16 +0200 (CEST)
Received: from localhost ([::1]:33048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPQl-000706-48
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEb-0002KH-Eq
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:41 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:42513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEZ-0000KP-QD
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:41 -0400
Received: by mail-qk1-x734.google.com with SMTP id d15so2633543qka.9
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Lkvq7PbzWDpGS8XnBB4KuXBeV3aSVBxGMsmyqVBXXr4=;
 b=mMgKC29q3GSI2sczQdNzk2QkowOZHNeuODNNyxx6dm2uB58vjYhFPopNNJXKCLMSmD
 WTEkg6b4V+yIP4m6EX8WXf/0uFvyQvCHJuTvqD09re5Hjjmo/DHhfeAqKLnGCvMrgVZj
 NVwRKCg3+KDepTF9C4zLA0VJ1xd8tbYN/+wiRa57uL3Yd07ieuxuTb1Fj1TiNEUcEeyt
 B+q86n9VatUOzDANZD/TwnjFD95ekzxYtApWJoreiOQa9V/FWl4EAa7s+P4rupVFmqTI
 S9yfuqkhw02I8eDz71vH6BYxuYvW/v6w3SHCiFcKfcODMx0dO2YLyf3vNQbvEDtWafbo
 3T2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Lkvq7PbzWDpGS8XnBB4KuXBeV3aSVBxGMsmyqVBXXr4=;
 b=x4STtUFqog6mtXob9wSNmo6tOfxa0kThtIrJze/QQ1ukxj8uwt8VflhmvwddRV09om
 wLJSK/wUFVJvtEjwOSJ0lt9LyMASl126B5qBkOLrrG54bv186r18pwG5DcrGxvEiBR/W
 aW2+5Pd8c6Wft7U9jK6uE2xCAsMSZeB3i+fRyAu3HCjlEl8PF4WdxiAxhCB3givcKiIC
 H2eD+gpy9YbMePA6krXvchRw0kBNvIF9sGevOyGC/hg6vEZYY/WngXEpsH0ayyCupvvX
 N1g4pzfIF8khWnCvrTtH0HaRlst3O+jU2FHWbWnD4bTeA4SJvVQ4AFEznfidrOny+2MI
 rkaw==
X-Gm-Message-State: ACrzQf2hthXgt78TydSRftZ3D0c0mwJiJ8oRIqSsf0RcQW6VV9Bbm4o+
 Rc26b7SbNml2upxJ27ZU4fIh80WR9wkmyA==
X-Google-Smtp-Source: AMsMyM4nclgAC5jrU5AF/woWmqSsUt+OBsoM4d3aAmCFJ1nKc0Ki1AA9XPlXCRu5YbBuIkgm16BJeA==
X-Received: by 2002:a05:620a:19a5:b0:6cf:4a24:cccb with SMTP id
 bm37-20020a05620a19a500b006cf4a24cccbmr11017035qkb.376.1664103098777; 
 Sun, 25 Sep 2022 03:51:38 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.51.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:51:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 02/17] accel/tcg: Drop addr member from SavedIOTLB
Date: Sun, 25 Sep 2022 10:51:09 +0000
Message-Id: <20220925105124.82033-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925105124.82033-1-richard.henderson@linaro.org>
References: <20220925105124.82033-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


