Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6677496D50
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 19:32:18 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBLBR-0000z8-Oc
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 13:32:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4V-0005ht-Ph
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:16 -0500
Received: from [2a00:1450:4864:20::433] (port=41670
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBL4N-0007gA-Hy
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 13:25:02 -0500
Received: by mail-wr1-x433.google.com with SMTP id v6so5901226wra.8
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 10:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zh5iADESENSAPofEn1J+i6o1QEpzQBPyUBojzWQHFvY=;
 b=BNFyUlsdZtICX3qNu/OFMR4H3TWGMjxBYjymkrm+M01/5kL5XdbSRJWn3k0mnmKZNP
 oswBqIBc7l7kyjoZEtBq+hIuoYhC5rjSCMWcZ1nMKLpFpnL5cbKz32NW8sxoWjg8DGZI
 zwiuENM5JRzp2h1xmQAIf4il7n6wmeiGEWQj5KLdeAy5AUpFcz/nCpbtp2M6mPRqoBdO
 qPvhtx0QakcWYrI8DLtjq0U0v6DLhSytfJ+rZFGMpaPlPNc6XuAMYloppDOK39pw5K39
 geswZUZmypqiUOW+Twn8zJ1+KgK72ishXAeolOAvgyK30YY3764fLw2GCg7s8UG5xmp1
 4Lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zh5iADESENSAPofEn1J+i6o1QEpzQBPyUBojzWQHFvY=;
 b=GsUf/UQWqn4NGtbr+ZKuhAREyfs3Cka5RbJyvbxrc0ed9a/20+Rp/nVL82kAUQfeD9
 3oUOMyUkqNXt13NOZn9mjjPHqZtTth4ucI6dhmHjcAR5UDpPGxfmxvikgPOzBsCh2o3y
 auaMyZujmL9HcJnGHDnVZnBlOX7ZrXCn5vqPEbRprmEQoyriCxEIQNurO98jQEjJQagw
 /oaiBFU7KkFGzufNsiziKCCNRMHFeXZ3xW6WQnWdN4eam8AftsUMivrBrJziOK9U0Y8l
 nzhFyj9fJPcTXCH7z7OzniDjQo08T0I6/+i7HJAjbEFgJa/jRIM2bTpr2nOXIj6geR5C
 le6w==
X-Gm-Message-State: AOAM531fFUE9+7U47rcuXazQ9vhfSxd8rbBwuqv0M89TPxvzenzg4YHU
 ZXpV+igy+ubhk7frl4ie6Z0YHQ==
X-Google-Smtp-Source: ABdhPJw5Wa4eX6hnmBccyiVU+CbnB1Nx/DnUEijXJaMwQDewdt0cuymOeYburhnV1+/AMINqyd9ftQ==
X-Received: by 2002:adf:fa8d:: with SMTP id h13mr8309558wrr.154.1642875887701; 
 Sat, 22 Jan 2022 10:24:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 10:24:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/14] hw/intc/arm_gicv3_its: Add tracepoints
Date: Sat, 22 Jan 2022 18:24:32 +0000
Message-Id: <20220122182444.724087-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ITS currently has no tracepoints; add a minimal set
that allows basic monitoring of guest register accesses and
reading of commands from the command queue.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 11 +++++++++++
 hw/intc/trace-events    |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b2f6a8c7f00..6d2549e64b1 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "trace.h"
 #include "hw/qdev-properties.h"
 #include "hw/intc/arm_gicv3_its_common.h"
 #include "gicv3_internal.h"
@@ -634,6 +635,8 @@ static void process_cmdq(GICv3ITSState *s)
 
         cmd = (data & CMD_MASK);
 
+        trace_gicv3_its_process_command(rd_offset, cmd);
+
         switch (cmd) {
         case GITS_CMD_INT:
             result = process_its_cmd(s, data, cq_offset, INTERRUPT);
@@ -818,6 +821,8 @@ static MemTxResult gicv3_its_translation_write(void *opaque, hwaddr offset,
     bool result = true;
     uint32_t devid = 0;
 
+    trace_gicv3_its_translation_write(offset, data, size, attrs.requester_id);
+
     switch (offset) {
     case GITS_TRANSLATER:
         if (s->ctlr & R_GITS_CTLR_ENABLED_MASK) {
@@ -1107,6 +1112,7 @@ static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
                       "size %u\n", __func__, offset, size);
+        trace_gicv3_its_badread(offset, size);
         /*
          * The spec requires that reserved registers are RAZ/WI;
          * so use false returns from leaf functions as a way to
@@ -1114,6 +1120,8 @@ static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
          * the caller, or we'll cause a spurious guest data abort.
          */
         *data = 0;
+    } else {
+        trace_gicv3_its_read(offset, *data, size);
     }
     return MEMTX_OK;
 }
@@ -1140,12 +1148,15 @@ static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
                       "size %u\n", __func__, offset, size);
+        trace_gicv3_its_badwrite(offset, data, size);
         /*
          * The spec requires that reserved registers are RAZ/WI;
          * so use false returns from leaf functions as a way to
          * trigger the guest-error logging but don't return it to
          * the caller, or we'll cause a spurious guest data abort.
          */
+    } else {
+        trace_gicv3_its_write(offset, data, size);
     }
     return MEMTX_OK;
 }
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 9aba7e3a7a4..b28cda4e08e 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -169,6 +169,14 @@ gicv3_redist_badwrite(uint32_t cpu, uint64_t offset, uint64_t data, unsigned siz
 gicv3_redist_set_irq(uint32_t cpu, int irq, int level) "GICv3 redistributor 0x%x interrupt %d level changed to %d"
 gicv3_redist_send_sgi(uint32_t cpu, int irq) "GICv3 redistributor 0x%x pending SGI %d"
 
+# arm_gicv3_its.c
+gicv3_its_read(uint64_t offset, uint64_t data, unsigned size) "GICv3 ITS read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+gicv3_its_badread(uint64_t offset, unsigned size) "GICv3 ITS read: offset 0x%" PRIx64 " size %u: error"
+gicv3_its_write(uint64_t offset, uint64_t data, unsigned size) "GICv3 ITS write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
+gicv3_its_badwrite(uint64_t offset, uint64_t data, unsigned size) "GICv3 ITS write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u: error"
+gicv3_its_translation_write(uint64_t offset, uint64_t data, unsigned size, uint32_t requester_id) "GICv3 ITS TRANSLATER write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u requester_id 0x%x"
+gicv3_its_process_command(uint32_t rd_offset, uint8_t cmd) "GICv3 ITS: processing command at offset 0x%x: 0x%x"
+
 # armv7m_nvic.c
 nvic_recompute_state(int vectpending, int vectpending_prio, int exception_prio) "NVIC state recomputed: vectpending %d vectpending_prio %d exception_prio %d"
 nvic_recompute_state_secure(int vectpending, bool vectpending_is_s_banked, int vectpending_prio, int exception_prio) "NVIC state recomputed: vectpending %d is_s_banked %d vectpending_prio %d exception_prio %d"
-- 
2.25.1


