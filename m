Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52365D484
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 14:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD3zz-0003hk-1M; Wed, 04 Jan 2023 08:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3zx-0003hZ-10
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:40:05 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3zo-0001WY-Jo
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:39:58 -0500
Received: by mail-wr1-x42b.google.com with SMTP id w1so20861447wrt.8
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 05:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZygYmfrmD7qdRbVxXkYivEOl/lZqKFZseEhzh+vRLa0=;
 b=mwg1MbN1JHjrQ+XT7jHjgHRqIp4sIK2cx14a/2WpLDJV6IgSym7k3wmoV8GPx/Eq8w
 AUZztOWb1ylTNmYB8Ci+4ilCExn4PyrUyD4/tvzn+nkDMFgllfvEFXFWyg2NC2RY9fLO
 74druzXhOI0Cp0tHoG4SDu5TIixROqFrdJKZFme+VCOhBUy5vijjspeAbqYRvpUfMQPj
 JWZYqP++pGEZaHG0oRKOTvpprxfow3lpc+KI8OiWFt/wRuOuJpvQV+4I2mB5fKbIz6yX
 BCi2MxJcm+GNl9Y9FLYQrAI3QetayVoDEIE6nfB0DX+qPNyB1jgltMB2tAFHLysfIEit
 k/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZygYmfrmD7qdRbVxXkYivEOl/lZqKFZseEhzh+vRLa0=;
 b=51RoDPubyFNW26+N6lZgUVBR6BHLoVyAaa1J8fiPMdeYOYtLDFoAH3HstZgMjrWvuY
 wS5JwNDDkD3jxe5dB8Cwh418zREHJy2vRWIkWN/U0kwkFeouw626qkSLJvUwQ2KWrGDe
 sR8Yn8DEOzE8Z1ZT34WveqdMZ3N2udH6gf/izx13Kf/X1hmgjgFKtxoQyuwXQNvhXHQn
 sxSMWbtvNI9IQLUHocnZahyy9fytlX5Un60Sjsc0xp/51TvGuytoqj/3gQEq4IVO55Pe
 IJLiqoiJ2HWAX8x8yQ/b3JGfG/1OZNsKvUwzlqQ2mu4rJxVqsXDjeo3a12ipGuIgsKEt
 ttVg==
X-Gm-Message-State: AFqh2krylcFzStVt/fV/doMpbpo/MRBnlDjDTUa6qPHnjV0po6GpCj6K
 eoKGwR8XsYMLRQ9RPAhKO7kJXjR9LTX8YDlG
X-Google-Smtp-Source: AMrXdXutsNLl7xKeKNAB4V4zeOQf8FV+tmitsA/+O2mFreLptfGhnFxk5CZgfTiytUto9Mt4Ft8LzQ==
X-Received: by 2002:adf:ce0a:0:b0:242:4dd8:a7ee with SMTP id
 p10-20020adfce0a000000b002424dd8a7eemr30468889wrn.12.1672839593909; 
 Wed, 04 Jan 2023 05:39:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a5d410f000000b002683695bf97sm34175987wrp.58.2023.01.04.05.39.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 05:39:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/6] hw/mips/malta: Trace FPGA LEDs/ASCII display updates
Date: Wed,  4 Jan 2023 14:39:32 +0100
Message-Id: <20230104133935.4639-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104133935.4639-1-philmd@linaro.org>
References: <20230104133935.4639-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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


