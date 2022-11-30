Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E30D63D759
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:58:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NaE-0001uf-9j; Wed, 30 Nov 2022 08:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NaC-0001u3-CM
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:57:04 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Na6-0004S2-EO
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:57:02 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 h4-20020a1c2104000000b003d0760654d3so47623wmh.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k4Dma3IuLzhJAgv9Db5pItElfrffkxrejAOnuwFruKw=;
 b=r0gV8yMBWmSokUsyf1zL/4TCnTIOruhYS25aOx+DaGu5NwODAVIdHCGPhn5iiVPNe4
 fu6Hhh0oHITfGxnure6D01AGIzaWcyvL4hgJ5JqvffcfYhJPfUhQCNsHqMhS4yTC7eCY
 idJnHkZeNxS2uCNAk0+vTLrowDceXmue2kYbuMBH/KkPTAf3sHm2NATvWCeD5rMPicH8
 9MuxUzKS3iiEiZ1sA3yNVur4/MyUV5myxWzb9C5eRlZi53Y/D0EwtbrKC4wbdA191yra
 15CoxLD+aMg8saptHnXSBcJFaIb/ODxKFkMZPxrnx9LUbfwnLsC30XpxgdApwWB/6mnj
 Oywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k4Dma3IuLzhJAgv9Db5pItElfrffkxrejAOnuwFruKw=;
 b=oicZkmHL+2JNPP6mEioAzjRiN9u07QrIIID9TPoPmBzWismOpKC5Pus/NdAvBP7Oh+
 T88CV1sN94B643q3WC8kYgWVLUqB8VFxTQqEF0kGOd6KQzVS4pO/pqxaCDSWhylbzleg
 KYlRpxercwXF6RizOjHn4aVqZmMl1Trz/nLmuyEgSNnjcSR0EWSgMsS3gNeHJrGN3gIk
 dXowKqixwiWSe1UunRa1i7UvVmKwhbd4nrePZJ8RowNjXYO6I0xTtQIJTVDdYmIhYhGP
 14XlQxqeTK5NBGXScG1nQwoqoK5uihdIlF7AhAtIQ/JGCGLUBE6HtXYZY9LsVzvLX1SH
 WWhQ==
X-Gm-Message-State: ANoB5pm5IVsaDJ3Of/qKy99EJ3oJIgF8tU092lBdFy5b27hp1XUAJmyd
 smeacwQdG3aVEtVmLvoTJAUMVbKTiRj1r5Q/
X-Google-Smtp-Source: AA0mqf6sMp2zdu8x9t4wN/54a5U+joxvTTU71xdrimmSVp00XRo7tRY/wnJTJDfqJMjZusHXfhqYxg==
X-Received: by 2002:a05:600c:a56:b0:3cf:77a6:2c2e with SMTP id
 c22-20020a05600c0a5600b003cf77a62c2emr30471502wmq.179.1669816615816; 
 Wed, 30 Nov 2022 05:56:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 iv16-20020a05600c549000b003cf87623c16sm6396204wmb.4.2022.11.30.05.56.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:56:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-8.0 2/2] hw: Reduce "qemu/accel.h" inclusion
Date: Wed, 30 Nov 2022 14:56:41 +0100
Message-Id: <20221130135641.85328-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130135641.85328-1-philmd@linaro.org>
References: <20221130135641.85328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Move "qemu/accel.h" include from the heavily included
"hw/boards.h" to hw/core/machine.c, the single file using
the AccelState definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine.c   | 1 +
 include/hw/boards.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8d34caa31d..42fc6f1e84 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -12,6 +12,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/option.h"
+#include "qemu/accel.h"
 #include "qapi/qmp/qerror.h"
 #include "sysemu/replay.h"
 #include "qemu/units.h"
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 90f1dd3aeb..f00f74c5f4 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -6,7 +6,6 @@
 #include "exec/memory.h"
 #include "sysemu/hostmem.h"
 #include "sysemu/blockdev.h"
-#include "qemu/accel.h"
 #include "qapi/qapi-types-machine.h"
 #include "qemu/module.h"
 #include "qom/object.h"
-- 
2.38.1


