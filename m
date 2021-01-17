Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570E32F9408
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 17:51:51 +0100 (CET)
Received: from localhost ([::1]:55466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BHK-0007CD-DQ
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 11:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BEQ-0004JV-CY
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:50 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BEO-0001wX-Qo
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:48:50 -0500
Received: by mail-wr1-x429.google.com with SMTP id w5so14174322wrm.11
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 08:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qrc7nsDG3FWYyx7ue2FQKi4KA+9IIfDo7x9aiypq15A=;
 b=E32zuVYxWLsH4GDKEMZXzXPX4V9TYli0Xg6FqBdIaROyfGC7vjQb1Z7rpurhRkjGNS
 Ld5y5/DFAFVLFgvbpKOvY2EUSRwe5K++OxLYeXOK3iH3t2Cb1D+pdkNEPdvTreQdB4sT
 55JjxRz69I/CwZWj2RR+3/WfBjqHBnn5O4Esg89SDurOerSxeo0bHGAVA9TlPZaI4qkk
 vu04Tl3qmoloWFeDIgncmOMrytoZwvONmxTYC5X53kAy4ZYUUdXZ8gjqxl2YGq1PX6eX
 XwNVDV87pvT0vurwWNul2aG1ObI5x9JloEkT0xIapZ4v+qsl0BBc5R8PLVHkwBZZeO5J
 4ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qrc7nsDG3FWYyx7ue2FQKi4KA+9IIfDo7x9aiypq15A=;
 b=RmqglRkxIXDznNgMuI5L7NqbG3i8GRJq0V9846Jczb4m66AxRRq19kbnsSBCiCTQDf
 Wnl/Fy6eRLEqwqV+iMvqoUbwUMrJBdPsO3yFYlfNiktvN50jT7iW98sx9kGjdoWM1CNN
 jR7L0i9tqycIYfOjXv5dJIY1OLSkMiZkx4EBLdfU2KqdwjJIxwKOMMeQDysKNElVOFMG
 szzvJf/6Bj3Zy6FK6XKESdR3pMurK1vhSlUBojWKYApsWu6FHVH+4QbKEChF3PSiwyMa
 LKVKd5S70eVP/dO3mEEWWYfFB7m9nNmmlfwD7+ivFfrOlkqgmS+TU2NasOkEBqMO6oDz
 P8kQ==
X-Gm-Message-State: AOAM532tPq/DBUypXH1aYxqEy7icwhd0wlwfbMtjSUApNP5X27wNAXOB
 lRgkJZtMuEaXm1uqPeEnMFcN8V/zrQY=
X-Google-Smtp-Source: ABdhPJx30sU2mlGVYbzDuAhucMNms3y8calEJ/yFf5v0bA21fSR37afAvB7opQRCJGMErmW8O6Nzxw==
X-Received: by 2002:a5d:5105:: with SMTP id s5mr16279432wrt.252.1610902127372; 
 Sun, 17 Jan 2021 08:48:47 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r20sm27374693wrg.66.2021.01.17.08.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 08:48:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/6] softmmu: Restrict watchpoint handlers to TCG
 accelerator
Date: Sun, 17 Jan 2021 17:48:13 +0100
Message-Id: <20210117164813.4101761-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117164813.4101761-1-f4bug@amsat.org>
References: <20210117164813.4101761-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

Watchpoint funtions use cpu_restore_state() which is only
available when TCG accelerator is built. Restrict them
to TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because we could keep that code by adding an empty
    stub for cpu_restore_state(), but it is unclear as
    the function is named generically.
---
 include/hw/core/cpu.h | 4 ++--
 softmmu/physmem.c     | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 140fa32a5e3..1b4af30db04 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1033,7 +1033,7 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
     return false;
 }
 
-#ifdef CONFIG_USER_ONLY
+#if !defined(CONFIG_TCG) || defined(CONFIG_USER_ONLY)
 static inline int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                                         int flags, CPUWatchpoint **watchpoint)
 {
@@ -1098,7 +1098,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
  * If no watchpoint is registered for the range, the result is 0.
  */
 int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
-#endif
+#endif /* !CONFIG_TCG || CONFIG_USER_ONLY */
 
 /**
  * cpu_get_address_space:
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 65602ed548e..5135a6371b5 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -765,6 +765,7 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
     return cpu->cpu_ases[asidx].as;
 }
 
+#ifdef CONFIG_TCG
 /* Add a watchpoint.  */
 int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                           int flags, CPUWatchpoint **watchpoint)
@@ -873,6 +874,7 @@ int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len)
     }
     return ret;
 }
+#endif /* CONFIG_TCG */
 
 /* Called from RCU critical section */
 static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
@@ -2356,6 +2358,7 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
     return block->offset + offset;
 }
 
+#ifdef CONFIG_TCG
 /* Generate a debug exception if a watchpoint has been hit.  */
 void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                           MemTxAttrs attrs, int flags, uintptr_t ra)
@@ -2424,6 +2427,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         }
     }
 }
+#endif /* CONFIG_TCG */
 
 static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
                                  MemTxAttrs attrs, void *buf, hwaddr len);
-- 
2.26.2


