Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3328564B579
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:54:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54mC-00009T-8w; Tue, 13 Dec 2022 07:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54lz-00007y-UA
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:52:39 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54ly-00030t-5V
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:52:39 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so7817662wma.1
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=El4Mo4XJqlmSIoO5ETLFqRzBXVBkfAvXj3HufFMLDB0=;
 b=Qpt4z6KOyGfmVHof3B8vjj9lmGlhjItvat/UYcHjdmfNQMhgrsdL+VrzB0l/zmH//7
 /6pcLu9hXSap6cUwQ4XaCougl+9jf3inXcaFwle4eP3ITO+LRPr7ZwwyUcClbOaZe8sb
 egtAnWT9nigfBN1gVL768oAzebQpbIlf3L5nRI6ihZGrO7wWCaxboEBbFGllo9vKFWXA
 Nhvm78YqDpdDSwpc1hRyMmcB71E9QAPs9rKCLDHtdI/qfAWdnMPGHsjmwwPx1bRW55yg
 5DXA4WLqAP+geC1u4WbdH1YB2gQpZtUKu4yGi9QmSNAyCqFOAapU/86gfIGcf9OWKOKV
 kmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=El4Mo4XJqlmSIoO5ETLFqRzBXVBkfAvXj3HufFMLDB0=;
 b=r207RWyRrdyntB8WIaFG5ClTRCOsBZdrCP/fJga+hYsVslP1fBXJqxQpXWh3ORWylh
 CmbGnivigX7mzcK16f6yQumvW/zqS0XQTtNH6gU+U8NXpZz0aoLSI8ofdh7H2UXmNRYO
 T+TpyNuLxlQEvr6A+18OQkdN8Zr+d/Ob6/Du16UUafeu0Uh8Exd5jg5PnZcu8theghnN
 +GoEPRo2N+mXcviY2ZQE2K6r2hlC+3dThfy6ew9Xv45qFX3dXxnIcrETg4UIlY7KKVhT
 8mCp4lvQoHgyvAp0zWDinPvjM8rcVfbCpjDrKW8ziadvFqgebTfEqnxLrO4TA0kDD1HY
 b+gg==
X-Gm-Message-State: ANoB5pkj0JwmRzuokGYadRsWGg8zV0OFvX0aQfifOr2TfeDDNFbbb7yI
 V+HQcMvZmeeGHieKpADMqwOx9lmDCiZMpRE4zHk=
X-Google-Smtp-Source: AA0mqf7ApUqHFBFm7LoMDf1EQaoDfANzrNkuntotfUoPT+dt5bjRmbgXASwlJMLJQi9SIR/eKR55Lg==
X-Received: by 2002:a05:600c:538f:b0:3d1:d396:1ade with SMTP id
 hg15-20020a05600c538f00b003d1d3961ademr15602334wmb.9.1670935956487; 
 Tue, 13 Dec 2022 04:52:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a05600c4c9700b003cf4ec90938sm12081630wmp.21.2022.12.13.04.52.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 04:52:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32() by
 be32_to_cpu()
Date: Tue, 13 Dec 2022 13:52:18 +0100
Message-Id: <20221213125218.39868-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213125218.39868-1-philmd@linaro.org>
References: <20221213125218.39868-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This partly revert commit d48751ed4f ("xilinx-ethlite:
Simplify byteswapping to/from brams") which states the
packet data is stored in big-endian.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 6e09f7e422..efe627d734 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -24,8 +24,8 @@
 
 #include "qemu/osdep.h"
 #include "qemu/module.h"
+#include "qemu/bswap.h"
 #include "qom/object.h"
-#include "cpu.h" /* FIXME should not use tswap* */
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
@@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
             D(qemu_log("%s " TARGET_FMT_plx "=%x\n", __func__, addr * 4, r));
             break;
 
-        default:
-            r = tswap32(s->regs[addr]);
+        default: /* Packet data */
+            r = be32_to_cpu(s->regs[addr]);
             break;
     }
     return r;
@@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
             s->regs[addr] = value;
             break;
 
-        default:
-            s->regs[addr] = tswap32(value);
+        default: /* Packet data */
+            s->regs[addr] = cpu_to_be32(value);
             break;
     }
 }
-- 
2.38.1


