Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5ED320B42
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:09:03 +0100 (CET)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqM2-00066t-Ae
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDps6-0001A7-Hr
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:38:08 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDps5-0003iI-8A
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:38:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id a132so11247583wmc.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sPGBK2Ez9fB1ht+wPhXTOH6TvXvQPmXNorVWD5i/OwQ=;
 b=f30QLnFJWosTRNZiXmCtIOCKic6mcVqqpJLZ4oSBi4S31H6uzVobn3/tLyyxnXhlHz
 swWZN65hejGsAjhImpHedtREBxhcTxc3MqQdp6IenKE7m5N5fJEnIXNHxF+WDuFQcL+5
 PUOxDRI1F9dlW7+A/ZXxjZeNG6Q2SDvkQIQzfYCx4xX1hitRjqg8po4wJztNQ4z34Z1/
 iftDupnP9BaROeQPq8DUpGiuWdBJrHct1GKFvuvX198UvmwJFdlLon8pJvpW5+T6/Id9
 sTwCOWmvlZBLeG92bjqYsf7UBTxYKkyC+M4sP9sjKOJekJONDZfAvouOLAZxzqrXK8kR
 ZHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sPGBK2Ez9fB1ht+wPhXTOH6TvXvQPmXNorVWD5i/OwQ=;
 b=o2mxpV4aA7mCbxC79k25shmH0zDrTZ3cSNMbnfD2sh6eW0RMwHHvZAJgaTSbFMNh21
 g2g1eo4P2o3a7CYfis8dc6yHwKqXsAsOrVyVUPVMPqFfYzliJn0kg8sES0LhLUSJVLvZ
 K1Nxeg2+fFCUzAYjZFDJdE/sE9padb6mbxN/7xfEdB5GxITOBFZa3i5Tq9fu3S6stauZ
 JRkEhMHjdk5IOU18jCxeO/F0BNcojVXskEYF712OX8J/LWDZP5EQszssr3B8fj1fKHa5
 hpTCLb+HrfQURgjq48iMIa2eALDueacpL4PZkWsuOztvnKs7WbpJbrNrQMSLMrhasFX8
 4r8Q==
X-Gm-Message-State: AOAM532RFBH2MJ/EkhwmWjm0FUQpGGRzUrnQydFz6PObC/gHoXv3daX7
 i+lYz7leYDGX6rimUm/RT9fdaF8Pudo=
X-Google-Smtp-Source: ABdhPJxzawfWYjTFPO+q8UmS53/kZER4aD19JXKzYOPoYp+AAsFLtlnC9nOSXDIYBF9SjZNufwVzFA==
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr5977951wmj.123.1613918283895; 
 Sun, 21 Feb 2021 06:38:03 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c18sm76371238wmk.0.2021.02.21.06.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:38:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/43] vt82c686: Log superio_cfg unimplemented accesses
Date: Sun, 21 Feb 2021 15:34:31 +0100
Message-Id: <20210221143432.2468220-43-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <15b2968fd300a12d06b42368d084f6f80d3c3be5.1610223397.git.balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Split original patch in 5, this is part 4/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2bd10d91013..766584cabd0 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -26,6 +26,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/i2c/pm_smbus.h"
 #include "qapi/error.h"
+#include "qemu/log.h"
 #include "qemu/module.h"
 #include "qemu/range.h"
 #include "qemu/timer.h"
@@ -279,6 +280,8 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
         return;
     /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
     default:
+        qemu_log_mask(LOG_UNIMP,
+                      "via_superio_cfg: unimplemented register 0x%x\n", idx);
         break;
     }
     sc->regs[idx] = data & 0xff;
-- 
2.26.2


