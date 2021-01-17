Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360532F9409
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 17:52:47 +0100 (CET)
Received: from localhost ([::1]:59120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BIE-0000ES-8w
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 11:52:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BE6-00042V-DE
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:30 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:47057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BE4-0001qu-AM
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:30 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d13so14165748wrc.13
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 08:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K3CQSqrytpiHS5Sve5/wJnq6BGWF/nQ2DFQWKfnG4qE=;
 b=ak+8WZa6ga6z2O6djG4mmWplZS3o+nsf+wJk6RWvPFGsj1RGzEET5tK6mNxXZ/9zXD
 YUoAZOQ5G55p0DidsHSJadJHFWlgqbUUvKpfVrF+ji7RU3YQieaOwKAnrovwK8y2gWZy
 nkVmVXhvRUUdNWTF+oLrX5ZNOKMtXiTDQjEPXL7gvzLY9y23Rvf3LSlyQUsIlO+Eoef/
 qD/FKqEAZgSoF4Z0/2QBMk536wsthb+zYtZ6nLY4wp+FsiKVAX1+n2EyNO+yKcrKr3WJ
 JcmjS1tVvLLxCC45c40JVmbqv0Rf7jB30rf0S6KG5Rmn8W+lsHRLvpokH35r6aos+Qxb
 r9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K3CQSqrytpiHS5Sve5/wJnq6BGWF/nQ2DFQWKfnG4qE=;
 b=pEXbpbcwA1ozswwiHoG8D95Tks840Z711ZhT4ZXQTjAoEKbLNP71X5pFZwSxJwFMui
 xUStr5Xc2RkBB1i0rpWKUeNiNpJMteWdnc15IxfJMzab/YfvA5yD+nRWMDOkIk4FNIzJ
 mu7mRAhbWVeyJhJQoiANq3vgqpKMIbjVAyZkbk3WKmXus2/4n8uLKssZdkKwBASprt3V
 T551Cb9/K34/oaVrdTZzIkL0STcJHhCgMjl1CM/i8fxT4dAsVMmbz668emaOeLh1Fsjh
 ZPBZINiyGVCDe74Z+1sB9fH5c0uaEFu4RnPTOkJdwC1X4OYPAxvBiU4VA0ywpJKs6WnO
 HNuQ==
X-Gm-Message-State: AOAM530/G9OoenPLobP3XTaQC45Ro2mRy9l4AXl/rDA9f8dOGZySSzbI
 sR4+7NLECuBmFeh15FdpCWBKrDBqKKE=
X-Google-Smtp-Source: ABdhPJxJB4TinkeAcxOO1nH8psKfQDrExlvlGEAeQKeFeHBdkKFyUqn8+DyYmDenmEtY2rKtJrMkgw==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr22541873wrv.124.1610902106676; 
 Sun, 17 Jan 2021 08:48:26 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i16sm22755267wrx.89.2021.01.17.08.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 08:48:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] accel/tcg: Restrict tb_flush_jmp_cache() from other
 accelerators
Date: Sun, 17 Jan 2021 17:48:09 +0100
Message-Id: <20210117164813.4101761-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117164813.4101761-1-f4bug@amsat.org>
References: <20210117164813.4101761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tb_flush_jmp_cache() is only called within TCG accelerator,
declare it locally.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
We could also inline it in cputlb.c, the single user.
---
 accel/tcg/internal.h      | 16 ++++++++++++++++
 include/exec/exec-all.h   |  3 ---
 accel/tcg/cputlb.c        |  1 +
 accel/tcg/translate-all.c |  1 +
 4 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 accel/tcg/internal.h

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
new file mode 100644
index 00000000000..4981d98dbfd
--- /dev/null
+++ b/accel/tcg/internal.h
@@ -0,0 +1,16 @@
+/*
+ * internal execution defines for qemu
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+#ifndef ACCEL_TCG_INTERNAL_H
+#define ACCEL_TCG_INTERNAL_H
+
+#include "exec/exec-all.h"
+
+void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
+
+#endif
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 516013e735a..1e3e7cf8e78 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -663,9 +663,6 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 
-/* exec.c */
-void tb_flush_jmp_cache(CPUState *cpu, target_ulong addr);
-
 MemoryRegionSection *
 address_space_translate_for_iotlb(CPUState *cpu, int asidx, hwaddr addr,
                                   hwaddr *xlat, hwaddr *plen,
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index ced3dc077ec..b1f0f404aa5 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -36,6 +36,7 @@
 #include "exec/translate-all.h"
 #include "trace/trace-root.h"
 #include "trace/mem.h"
+#include "internal.h"
 #ifdef CONFIG_PLUGIN
 #include "qemu/plugin-memory.h"
 #endif
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ca7ef6aa177..6427bf87ae0 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -60,6 +60,7 @@
 #include "sysemu/cpu-timers.h"
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
+#include "internal.h"
 
 /* #define DEBUG_TB_INVALIDATE */
 /* #define DEBUG_TB_FLUSH */
-- 
2.26.2


