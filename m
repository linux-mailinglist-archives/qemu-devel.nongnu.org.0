Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ECE669FDE
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:18:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMFa-00015p-H1; Fri, 13 Jan 2023 10:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFY-00013Z-6E
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:45:48 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMFV-0005li-SX
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:45:47 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso13304494wms.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EJlrcJcyFySvYUbJirDufyRxi5kq6OsXQnOZADCMTWg=;
 b=O6ytDBT2TLweLbMOKWFPT8t+SX+OlMjYasFVTPtUyM1racjyJ/d7mjwagxg0eLUaiP
 suEMrhTOg9CcYRFWQ4A5bHFGSCcWqo8H9y6kIwK9DDcAa8EcCn346Q6j1z5FDvCqVOiS
 5/pAfx6868lJgPRRAidqZ+wB0+ufmdERInC2xDL5s45hZpzvCX2lDchSZ2sIFL9clGqd
 NHI4GVx1cMNSHH8p1jnAMUPrLesYM92eIQE6Oygjd2vs5Nqd/saKZSNfn3BHgJGxeq+e
 6tyDknJowU39tzQMt1Y7pMuvmme6eqvEvi8epDuWgGsBStlX70Y6/2yw+wagaltW7NPz
 5urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EJlrcJcyFySvYUbJirDufyRxi5kq6OsXQnOZADCMTWg=;
 b=eQgsfM7HICJ/vgd7UGXqDf1+bvZRE4qh0SH36pb9hddN2ZJ7fihJuU4bOj4Av99uG6
 hpdqCT/bXQI7ZlU+7JBO54dcWI9we8ipQAam9V7wVvhjyKWhZ8TUHdUk+QD4DxYY+sfD
 4EHEfHJ3IAhX4xi4XfWCrBVo/AI20jbukY+HKKg5Fo6hcsXRAFLk6d6nKYNfIx+UKX8G
 i/ZE4f78WJGF4l3EQ++5NI+E0tnme3O4DsfQNZ0kYgiS+uh2jjKHjhgG0Haqa9A6IXwe
 XlBIxmp/uf8Tgn1AD18ErMVs70KH/QkqfOEBJXBNpJVzyYI8hTctgvDlM3HCP7t0fQZf
 naTg==
X-Gm-Message-State: AFqh2krj72XD/RWX42unAPCpYfVWRvBPeZixrlhv8IxsF0ixqxkkp8s1
 ogilY7BUXlD7AIxI7VdBzGiKc+kWLjIm6q6J
X-Google-Smtp-Source: AMrXdXsC9SWqa2siqCCnWzOqFEabENpcVLURyGyZ7pepYjsA+lkFWUwr3xm3dQlVYfhBOpYwId78vg==
X-Received: by 2002:a05:600c:6014:b0:3da:2032:6c0f with SMTP id
 az20-20020a05600c601400b003da20326c0fmr90068wmb.31.1673624743988; 
 Fri, 13 Jan 2023 07:45:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003cfa80443a0sm28765626wms.35.2023.01.13.07.45.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:45:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 02/46] hw/mips/malta: Trace FPGA LEDs/ASCII display updates
Date: Fri, 13 Jan 2023 16:44:48 +0100
Message-Id: <20230113154532.49979-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The FPGA LEDs/ASCII display is mostly used by the bootloader
to show very low-level debug info. QEMU connects its output
to a character device backend, which is not very practical
to correlate with ASM instruction executed, interrupts or
MMIO accesses. Also, the display discard the previous states.

To ease bootloader debugging experience, add a pair of trace
events. Such events can be analyzed over time or diff-ed
between different runs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230104133935.4639-4-philmd@linaro.org>
---
 hw/mips/malta.c      | 3 +++
 hw/mips/trace-events | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index e9424150aa..44d88a24a7 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -58,6 +58,7 @@
 #include "semihosting/semihost.h"
 #include "hw/mips/cps.h"
 #include "hw/qdev-clock.h"
+#include "trace.h"
 
 #define ENVP_PADDR          0x2000
 #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
@@ -120,12 +121,14 @@ static void malta_fpga_update_display_leds(MaltaFPGAState *s)
     }
     leds_text[8] = '\0';
 
+    trace_malta_fpga_leds(leds_text);
     qemu_chr_fe_printf(&s->display, "\e[H\n\n|\e[32m%-8.8s\e[00m|\r\n",
                        leds_text);
 }
 
 static void malta_fpga_update_display_ascii(MaltaFPGAState *s)
 {
+    trace_malta_fpga_display(s->display_text);
     qemu_chr_fe_printf(&s->display, "\n\n\n\n|\e[31m%-8.8s\e[00m|",
                        s->display_text);
 }
diff --git a/hw/mips/trace-events b/hw/mips/trace-events
index 13ee731a48..b5b882c6c2 100644
--- a/hw/mips/trace-events
+++ b/hw/mips/trace-events
@@ -4,3 +4,7 @@ gt64120_write(uint64_t addr, uint64_t value) "gt64120 write 0x%03"PRIx64" value:
 gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
 gt64120_write_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
 gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" PRIx64 "@0x%08" PRIx64
+
+# malta.c
+malta_fpga_leds(const char *text) "LEDs %s"
+malta_fpga_display(const char *text) "ASCII '%s'"
-- 
2.38.1


