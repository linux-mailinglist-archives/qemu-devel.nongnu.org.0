Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E5A3F73A0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:49:00 +0200 (CEST)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqSp-00067X-Ip
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGS-0004fE-C1
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:12 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGQ-0005eH-OZ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso4223462wmi.5
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HOJv+mxMWwAU2cVeZjJ47Jn4+NXPcnKdS6AaQhDJDoU=;
 b=Z9MAWHBsa09I0F3KjZmkTFarCBrRsyzIvAxnA9ZAlk2LS/QColahuBpsm8/VLiL5wo
 k+KxU3/WrNWgUQ06f0WxInGJGFxfblScHiA7DRQRoTSk9L+5Uff/BSfnkuUei/Xq3fOU
 /7M2/7g6kYajKINvAgSTB8s7vCr9kzwp7hcOCFTGeHWbT58fwk82D66qyXYfytITKLSM
 gPeemp0L2pNraTRLiwzQtb2a3mbhVGW83UM8Phfg/3Z9APO9l9IOXyJm8QAMUFp4jCEs
 8S9qAzYglBBjTLHXI84irhsucGd6/TicSVIMJGXuxAh/Ew+g8K7kFKIeCCTguax3yiab
 OAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOJv+mxMWwAU2cVeZjJ47Jn4+NXPcnKdS6AaQhDJDoU=;
 b=g8kSm4XUlZfBVxJ1+eDnhgJbmIn1dYRlN4dnwyY4hwbPYW0uoV6L6wKTQaXw9B2pTR
 bhjHxBE2cnRN/TLl2I4SK7GhFzGA1pHl915hW/72cB3e2ELm2kGLoOxleFu3UJxuT6wi
 tl/dQVAvtllKHpubV9jnajtIOzMTUDRW6uduql6uK9rdPSoTPKgqsl+MOqrjwEHvW+QS
 jMl8ArkO3CVrQAwH/pxtHjlGkotKJxb5E4a7YHrsNzMpoDj04NQipNYm1kGff8kP5QIF
 32TMlb0lm+e7oBk3jHHvVB0VT0VweCJkHbj3fDREPMJNaJQTRElDVQKLWllK6U/8hN7n
 qgZA==
X-Gm-Message-State: AOAM5325kb5NrG33MS3sb/djo1V+vkdQuA8Zet5S6k3uAQ+W3lc+6p3R
 fXIODQ82zHprlaJZKKpLmMgMMgGmmR54Aw==
X-Google-Smtp-Source: ABdhPJy/MlO0dJ3FX7AE2HQO1Jl5w4IZ5AXLLW5lSzMYVqPJ7Dd1aiTS3TRgn+hBF85053f3j7USng==
X-Received: by 2002:a1c:a903:: with SMTP id s3mr8414367wme.171.1629887769473; 
 Wed, 25 Aug 2021 03:36:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.36.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:36:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/44] hw/char/pl011: add support for sending break
Date: Wed, 25 Aug 2021 11:35:29 +0100
Message-Id: <20210825103534.6936-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jan Luebbe <jlu@pengutronix.de>

Break events are currently only handled by chardev/char-serial.c, so we
just ignore errors, which results in no behaviour change for other
chardevs.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Message-id: 20210806144700.3751979-1-jlu@pengutronix.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index dc85527a5f9..6e2d7f75095 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -26,6 +26,7 @@
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
 #include "chardev/char-fe.h"
+#include "chardev/char-serial.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -231,6 +232,11 @@ static void pl011_write(void *opaque, hwaddr offset,
             s->read_count = 0;
             s->read_pos = 0;
         }
+        if ((s->lcr ^ value) & 0x1) {
+            int break_enable = value & 0x1;
+            qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_BREAK,
+                              &break_enable);
+        }
         s->lcr = value;
         pl011_set_read_trigger(s);
         break;
-- 
2.20.1


