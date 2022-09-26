Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A354B5EB092
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:56:21 +0200 (CEST)
Received: from localhost ([::1]:58728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1octHA-000262-PM
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4b-0008Bp-P2
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:19 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:41607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4a-00026u-2F
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:17 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 e24-20020a05683013d800b0065be336b8feso4903845otq.8
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=K9uaPJUsmwLieYaVUDJt066hUKn1XieJwGJCGkDP1Bg=;
 b=cwjOLVljwPWnw6d1AEWl33lqbugoGPl1HWQ7WgLVLruWrJzLBXL2f3r2c42lKpWcUe
 SHJ0hNsc8kQ+tIBl++k2RixQXuEVO+hWua90k2UGrkhjA1dl/3EWo7WjLYGxRJptHynu
 6EQSbeotFEB3L/Y47kJeDtxUJX596sBQoQbnHVpr4hbgoJxhZD83wjx2xzd5+8L8CchT
 xTgu1+/76JqTBHN+SvxJkzhVMQ2siGA6d7MxJ0T1ocwAbBrbmPhFlcRnnKB7UznPcCn/
 lVFdds+hGaSfT4jJQc7ypd2pvAZEE+uqkllw0YEjnueR2cVr4Xi97D9J1rl8Bn8FawMM
 ZHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=K9uaPJUsmwLieYaVUDJt066hUKn1XieJwGJCGkDP1Bg=;
 b=B7gj0FmFo8eh9AMh3Z/8WRfVoUq22yHmqiwBpMLmOumEx34UqeDig3jcmoJIrrPb6N
 YDQfKp6Iq/khMS02FzUU7lMtq9DG4T0t+/9ENAkBp6+KtdhaJYvlZvOEpZ/GU2Y0x4WN
 YeDA0tu06iXMBNEDVcGD5YkG+1WtD09MvFSnF3qOQCXTJQX5g6V/yWVk2c7Dzov88QCF
 vju0+sBEV8XJV+2LL5JjPgcMiC4xRtKQ3HSyt/CbU42hFTjr9dXplHMl5v5F9FNLrWwk
 kVrcai7qZCs9w1ynrO+d4PGe9ruZUfJbgfJZArPLzUbAUUwDpYe5ZArP65OyqUlftroW
 oFZg==
X-Gm-Message-State: ACrzQf2jNzfPgAXbm5Lf3JUPhdFhANSid3ld9tmxSaoKInDpUaWp6yqt
 MGUd+9eEBe93zShjJEbmyd4QHRb3Szk=
X-Google-Smtp-Source: AMsMyM5Ska+D0PYoUE4s4kU+bkfNJsybzEcoZtzrDy1g2PIkOgAZFoH/53eSmK3NvkYzD5+5THLfmQ==
X-Received: by 2002:a9d:7d16:0:b0:656:578:24ae with SMTP id
 v22-20020a9d7d16000000b00656057824aemr10431181otn.152.1664213954444; 
 Mon, 26 Sep 2022 10:39:14 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v8 06/16] hw/nios2: set machine->fdt in nios2_load_dtb()
Date: Mon, 26 Sep 2022 14:38:45 -0300
Message-Id: <20220926173855.1159396-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926173855.1159396-1-danielhb413@gmail.com>
References: <20220926173855.1159396-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

This will enable support for 'dumpdtb' QMP/HMP command for all nios2
machines that uses nios2_load_dtb().

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/nios2/boot.c      | 8 +++++++-
 hw/nios2/meson.build | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 21cbffff47..b30a7b1efb 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -43,6 +43,8 @@
 
 #include "boot.h"
 
+#include <libfdt.h>
+
 #define NIOS2_MAGIC    0x534f494e
 
 static struct nios2_boot_info {
@@ -81,6 +83,7 @@ static uint64_t translate_kernel_address(void *opaque, uint64_t addr)
 static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
                           const char *kernel_cmdline, const char *dtb_filename)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     int fdt_size;
     void *fdt = NULL;
     int r;
@@ -113,7 +116,10 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     }
 
     cpu_physical_memory_write(bi.fdt, fdt, fdt_size);
-    g_free(fdt);
+
+    /* Set machine->fdt for 'dumpdtb' QMP/HMP command */
+    machine->fdt = fdt;
+
     return fdt_size;
 }
 
diff --git a/hw/nios2/meson.build b/hw/nios2/meson.build
index 6c58e8082b..22277bd6c5 100644
--- a/hw/nios2/meson.build
+++ b/hw/nios2/meson.build
@@ -1,5 +1,5 @@
 nios2_ss = ss.source_set()
-nios2_ss.add(files('boot.c'))
+nios2_ss.add(files('boot.c'), fdt)
 nios2_ss.add(when: 'CONFIG_NIOS2_10M50', if_true: files('10m50_devboard.c'))
 nios2_ss.add(when: 'CONFIG_NIOS2_GENERIC_NOMMU', if_true: files('generic_nommu.c'))
 
-- 
2.37.3


