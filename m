Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B35827B31B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Sep 2020 19:25:54 +0200 (CEST)
Received: from localhost ([::1]:48958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMwuP-0007L9-Fu
	for lists+qemu-devel@lfdr.de; Mon, 28 Sep 2020 13:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMwkq-0004Di-EN
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 13:16:02 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kMwko-0006ND-N0
 for qemu-devel@nongnu.org; Mon, 28 Sep 2020 13:15:59 -0400
Received: by mail-wm1-x344.google.com with SMTP id e2so1947453wme.1
 for <qemu-devel@nongnu.org>; Mon, 28 Sep 2020 10:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r+U9x/gecjwhaxSv786ubx8yYIvjY9xUzlQ4g9WyIPM=;
 b=kCeHcv5brC+Qe+whSEartTnY8z08yYclKkNSBAFBXvtFa+9SSJUeElsYYi3PxH6fy8
 z+2GE2QjlRMRew7rGf7kSwxefXT3rieVBJZ+xivkMYgRJ+8GGBh70s4qIKzuO7aF66or
 QG/fLzBh34YjgT0ne2vutiU8pvIAt0WflXDNOyiI1yyUAKeSnbiuWbUsR/5nnIF0lcNp
 5ycdCm6gomyD4yNJJy74qB2VcNGRcr38VV5GZUM5tQmh8gbAUm/1cLvVZFOZ2JwbZbTH
 H6IVSjACTRx8/FeageAa+GG3EdLKFJUjk1EQB9+ATOvmzTl6RU9pC/E3sxog7J8JHP1B
 tXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=r+U9x/gecjwhaxSv786ubx8yYIvjY9xUzlQ4g9WyIPM=;
 b=E0ONubhzEdYT/LzNPXh9xKI7ML5Uzlo3fFw/XzBr5lf6BF98MxGjDFfTGiLBAmx5Be
 Z34s69Y3UwuGosWTFkBmQPFnkllFIYS2iy3scW93KpdGpgf8Ao+V4o4hCNHhQVPoMGh4
 XZe809mHe9RP6lDxBmjydG9kEIVdx11xkeMB/l4zG4Nt7zHVzyb1lrZOpvGkYqB7t97f
 EyZkrrC5tlts2PCrV/MKIjB00g1OBpWJd/jc9a5Bu/u/jThlRVOZ6oQ3JrZzD17hPxKR
 jn3BD8r69A4Fr0EpExz2LA69nShlVAX/VAM7zAjUvzKZYaoV8Qo3jTjbisbu3ql627Hq
 3rQQ==
X-Gm-Message-State: AOAM533J0YW8F8pjMiqc7eCDHqJaqCNUuxL1G01+BZzQLWXjhhdh7LkL
 HDfmAaVmLk6hzj8X+0WpqtQWPEaClWs=
X-Google-Smtp-Source: ABdhPJyg65BRW+oZ4tEB50bqugGwYDFWgP5f8A+z27+EORiRJerLRcxX9SwbpEpKvaoh7vUBQmVGaA==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr178411wmb.155.1601313357147;
 Mon, 28 Sep 2020 10:15:57 -0700 (PDT)
Received: from localhost.localdomain (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id z67sm464787wme.41.2020.09.28.10.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 10:15:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/16] hw/mips/mipssim: Correct CPU frequency
Date: Mon, 28 Sep 2020 19:15:32 +0200
Message-Id: <20200928171539.788309-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200928171539.788309-1-f4bug@amsat.org>
References: <20200928171539.788309-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.199,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Burton <paulburton@kernel.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Cleber Rosa <crosa@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIPSsim machine CPU frequency is too fast running at 200 MHz,
while it should be 12 MHz for the 24K and 6 MHz for the 5K core.

Ref: Linux commit c78cbf49c4ed
("Support for MIPSsim, the cycle accurate MIPS simulator.")

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/mipssim.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 1b3b7622035..6660af19c18 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -40,6 +40,7 @@
 #include "hw/loader.h"
 #include "elf.h"
 #include "hw/sysbus.h"
+#include "hw/qdev-clock.h"
 #include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
@@ -152,11 +153,20 @@ mips_mipssim_init(MachineState *machine)
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     MIPSCPU *cpu;
     CPUMIPSState *env;
+    Clock *cpuclk;
     ResetData *reset_info;
     int bios_size;
 
     /* Init CPUs. */
-    cpu = MIPS_CPU(cpu_create(machine->cpu_type));
+    cpu = MIPS_CPU(object_new(machine->cpu_type));
+    cpuclk = qdev_init_clock_out(DEVICE(cpu), "cpuclk");
+#ifdef TARGET_MIPS64
+    clock_set_hz(cpuclk, 6000000); /* 6 MHz */
+#else
+    clock_set_hz(cpuclk, 12000000); /* 12 MHz */
+#endif
+    qdev_connect_clock_in(DEVICE(cpu), "clk", cpuclk);
+    qdev_realize(DEVICE(cpu), NULL, &error_abort);
     env = &cpu->env;
 
     reset_info = g_malloc0(sizeof(ResetData));
-- 
2.26.2


