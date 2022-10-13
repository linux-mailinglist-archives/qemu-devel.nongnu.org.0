Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302FC5FDF43
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 19:47:39 +0200 (CEST)
Received: from localhost ([::1]:53864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2Iz-00010E-Dq
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 13:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj2CP-0005Dl-Br
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:40:49 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj2CM-0000u4-V8
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 13:40:49 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1980864wmb.0
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 10:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8FM5XpZ8DTUHfnBF91yhMamKEwGHnIFRRp55KtGJXy0=;
 b=hkmDy0nluB2ty51U98GJcr4Owod3yzVZHGy/sP0x4yiDZ/caccH1ZEkZP9KVT9POaG
 TjwMW7oZbfyRgiDFgmIJ0S6wQhNjoG2cQj86yTmBfT3kaZ46D/WiH8vhrRYmNVrWFNaL
 iiuZ4KNywDJSDlDRM6iVMnhfWm+q91xvFS7E9/v0BQalXN7lY/76LEZF5lbrTYwojDGU
 17xj8xwJR9Pkyj2Hx4aCm0xZrTL1jnq7Fkzs7EmLlCm555KJsWAJUPYWvwmnIuBzNXXb
 gwnNNI2Qd7kX7jZyL2ZZJrryDmGf/yLDeeoybknCEYxu56vit7ItVLeTAVpxUjqwxRtG
 k1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8FM5XpZ8DTUHfnBF91yhMamKEwGHnIFRRp55KtGJXy0=;
 b=QaRHr737inqll65oCfKiObz6+ChITQ17CcstmCFsnKpiH5QRVgNxrVMlRSS+9WAn38
 OnJR5qxqKMmSRKN8t6Ys7m5xYKztDOIIT8w3qSTKtCkHZgeMDWkWeoDvZSpi1v0GpgYR
 ZbmoMNDKUrBm964gEmBbCKNMZYohlDLIyu33TzXy1+fTTbmbrrUQgW4xUuuAom0S9rXh
 H0nJjVMv9QdTonae1j4/7bOFtW6+963amIwvQdTYUhznK8heGz6EEMJ/lFgU7piLA3QQ
 8KT2KlGDkIa7yEld1ZSlRi4wkZF8cyINBtUXXLcsGH/7e09aLiohSTvpwGuASrgLkZqs
 wgCQ==
X-Gm-Message-State: ACrzQf0Z9Tzy4FTu4NPrbP3bdUe9CoYFNTRD3NPp+oPcVukehJ7FYKFv
 l/yOEp4gswa1HJm99AwJkr6mig==
X-Google-Smtp-Source: AMsMyM7vit7B3i9xLzS3X4FehG1ZrlG5X7GrRXellVDQIptCqyMHNq+C806QBrHn85GjP1RZPJr4PA==
X-Received: by 2002:a05:600c:a09:b0:3b5:2f6b:c7c5 with SMTP id
 z9-20020a05600c0a0900b003b52f6bc7c5mr665125wmp.141.1665682845096; 
 Thu, 13 Oct 2022 10:40:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw6-20020a05600c54c600b003c6c3fb3cf6sm118482wmb.18.2022.10.13.10.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 10:40:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org
Subject: [PATCH] hw/ide/microdrive: Use device_cold_reset() for self-resets
Date: Thu, 13 Oct 2022 18:40:42 +0100
Message-Id: <20221013174042.1602926-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the microdrive code uses device_legacy_reset() to reset
itself, and has its reset method call reset on the IDE bus as the
last thing it does.  Switch to using device_cold_reset().

The only concrete microdrive device is the TYPE_DSCM1XXXX; it is not
command-line pluggable, so it is used only by the old pxa2xx Arm
boards 'akita', 'borzoi', 'spitz', 'terrier' and 'tosa'.

You might think that this would result in the IDE bus being
reset automatically, but it does not, because the IDEBus type
does not set the BusClass::reset method. Instead the controller
must explicitly call ide_bus_reset(). We therefore leave that
call in md_reset().

Note also that because the PCMCIA card device is a direct subclass of
TYPE_DEVICE and we don't model the PCMCIA controller-to-card
interface as a qbus, PCMCIA cards are not on any qbus and so they
don't get reset when the system is reset.  The reset only happens via
the dscm1xxxx_attach() and dscm1xxxx_detach() functions during
machine creation.

Because our aim here is merely to try to get rid of calls to the
device_legacy_reset() function, we leave these other dubious
reset-related issues alone.  (They all stem from this code being
absolutely ancient.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ide/microdrive.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 6df9b4cbbe1..56c5be36551 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -175,7 +175,7 @@ static void md_attr_write(PCMCIACardState *card, uint32_t at, uint8_t value)
     case 0x00:	/* Configuration Option Register */
         s->opt = value & 0xcf;
         if (value & OPT_SRESET) {
-            device_legacy_reset(DEVICE(s));
+            device_cold_reset(DEVICE(s));
         }
         md_interrupt_update(s);
         break;
@@ -318,7 +318,7 @@ static void md_common_write(PCMCIACardState *card, uint32_t at, uint16_t value)
     case 0xe:	/* Device Control */
         s->ctrl = value;
         if (value & CTRL_SRST) {
-            device_legacy_reset(DEVICE(s));
+            device_cold_reset(DEVICE(s));
         }
         md_interrupt_update(s);
         break;
@@ -543,7 +543,7 @@ static int dscm1xxxx_attach(PCMCIACardState *card)
     md->attr_base = pcc->cis[0x74] | (pcc->cis[0x76] << 8);
     md->io_base = 0x0;
 
-    device_legacy_reset(DEVICE(md));
+    device_cold_reset(DEVICE(md));
     md_interrupt_update(md);
 
     return 0;
@@ -553,7 +553,7 @@ static int dscm1xxxx_detach(PCMCIACardState *card)
 {
     MicroDriveState *md = MICRODRIVE(card);
 
-    device_legacy_reset(DEVICE(md));
+    device_cold_reset(DEVICE(md));
     return 0;
 }
 
-- 
2.25.1


