Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65325F4A1C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:10:02 +0200 (CEST)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoEr-00048Z-It
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyE-0001hx-Mu
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:51 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:43943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyD-0000Fv-4N
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:50 -0400
Received: by mail-pl1-x629.google.com with SMTP id z20so7029124plb.10
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=z6NCzPC6tE1OG0rvY3WzwqtBapUdS48hi6o10eMrDQY=;
 b=sB2O+93JRgNMyj3Q75ejeAZhVarfc/per4TQUzgVCnuPhBUa8RbVmNPDDGeRyqdce5
 /FozoEVDJ7CGhApviHqWXmoIyxFOqPacGWHR86qJXYmuMkko7QlMFtap7rXlQlYOaWkv
 zyjRpInB+YbcJRenK3hTnAZ3jkZHqDrcUJA5cUk90ZF6nfsJaECPIZFnRg8LjIC1Ey6R
 oLNnY8UI2BxUKK4hcxLaVtTsiuBUVGEkl94MOOyOGkXYbQQAdUNtWZI7Gqw+rTUVzIL4
 nJ9pePrnzrS63MucUK8JAi6SbN+2x1H9SSpoQPHXlSJRuH5TMJtA7plAC8EJwO1jv1md
 Y2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=z6NCzPC6tE1OG0rvY3WzwqtBapUdS48hi6o10eMrDQY=;
 b=Zi4uQFSLiqlnhMetJ3KQnm9nDOkLSiJI7J4swX8Et8t5fBoYvBtddBqLfELeBn10gJ
 4kPf/JcVtLQrPo8kDqNaP8C9rW9n95kqiRv6EzCrvrN7M17OUqhiFQvMak98ttmazdTD
 SfOkQVIkIz88rXWeLLDIw/Ioaj755f8SwII3o60Tn0gRM68/y/SSHXdqWREoB46pikWf
 tgXE34rR0xymAR8QM6GdxijFr4mbutOVa3i/E/yCUR81PYcvtSOWu/Ltu5BZReyGKQr1
 nNGZwC/kVY22xmbCXe7uppHbJYRm0VftfABzw3fd7iLHkHnfcOyvQ2CfAKj2wzjq1NRZ
 JPYQ==
X-Gm-Message-State: ACrzQf3qxNC3l2+jWHqRDsV3iAFGW0bwdWXWFsf+2vKyRz5BfEy1DO75
 urk6RSbCzhsRvZCdEjbjZbBatzDbWzZfSQ==
X-Google-Smtp-Source: AMsMyM6WRbGLszXRdIFfrrWaDvSDYPyGx5tgrZaUTJJMDIzts6w4YPgW+P/7Z7ek/TUiNQ/iPzmbFg==
X-Received: by 2002:a17:902:8548:b0:179:e4db:42e0 with SMTP id
 d8-20020a170902854800b00179e4db42e0mr28561649plo.0.1664913167660; 
 Tue, 04 Oct 2022 12:52:47 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 05/20] accel/tcg: Drop addr member from SavedIOTLB
Date: Tue,  4 Oct 2022 12:52:26 -0700
Message-Id: <20221004195241.46491-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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


