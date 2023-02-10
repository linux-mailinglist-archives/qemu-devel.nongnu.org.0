Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C03692375
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:39:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWPW-0000Re-4T; Fri, 10 Feb 2023 11:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPR-0000Ow-Sb
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:02 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWPP-0000BB-At
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:38:01 -0500
Received: by mail-wm1-x330.google.com with SMTP id r18so4223142wmq.5
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xNlUpknHvw0osLPPGBJk+hOEoEjuFtxnaLdXgn2w/R4=;
 b=vX/w/p/6O5JBsyxWOZmL3GOzN+zJsYokWdjeQFcq+omHmB+nnO2CwOcPe/lnzLf5JR
 jh4cKYI4EMe0vp0LPii0th6alavptAn/nmxKFOsVJJDNN2/WMMrgkYocsKOrutLv+lS5
 OgxvCVUBm/gLccdHwl/ZGMwePW8+kmXI+GgQ11eK3bTLa7799y4Qc2dP4FP1dnKGfaYN
 lwbFiW8tllrc1Dnz7Z2wBJxLqR02Ag/F7DZKOc2xk/ta7gKdgul5FwutsbLMgGIEg5jr
 Of2E8Mqc8bIGyXJzwaRojEK4kw9fOj1Gc//2gDz8XjV4B20TiOmS6wJgexPnC3SAsrQQ
 3mzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNlUpknHvw0osLPPGBJk+hOEoEjuFtxnaLdXgn2w/R4=;
 b=7R/CBAnT3V1dMe2lJ96aP71zB0JOLB2dB+5kRVJ0P74bTfi+rzRHbiCQwYDd2TVBGh
 nWVS6mZJvw6+MmrkD8a96VyMujh7GKT8EDscMjsH7vJczwiaEqlpTMEA55z7drGHnSdX
 72g+y2IrHfDH8GUm5s7OGmONHxdNatSdi9IdRIXArxRHCbuDQpi7e61MCsdOExujmgyr
 kHKl8mHX77zWacOxzkNZIpMAefIm8I0eyJO+9EUZPWE/W0Snv9WVmL21E4Us7QDtQp/j
 VEMygzTJ1+jm8WJsFRR5gmciNzScZQu09Mwq6rZ/KeZWgzfm22t6fyb+C8h6eO7qcu8D
 4dFQ==
X-Gm-Message-State: AO0yUKV32YhKLkqHqZOEYmK4TW+DlSmYGeJCcfTeUZlrzztgJg4L5Oct
 OE1IxEypR+21ekOtg6sL1gspXclEjBhlHUdr
X-Google-Smtp-Source: AK7set9VqjnlGN54TQsy5YMWW0VR9/8+JTf5DV07UYHZI8TAmvbtAGmOkGLQGGTdS8GGQwCmhn1Hjw==
X-Received: by 2002:a05:600c:81b:b0:3c6:e63e:23e9 with SMTP id
 k27-20020a05600c081b00b003c6e63e23e9mr16782869wmp.24.1676047076763; 
 Fri, 10 Feb 2023 08:37:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a05600c439300b003dd7edcc960sm5239763wmn.45.2023.02.10.08.37.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:37:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH 02/11] hw/isa/i82378: Rename output IRQ as 'cpu_intr'
Date: Fri, 10 Feb 2023 17:37:35 +0100
Message-Id: <20230210163744.32182-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210163744.32182-1-philmd@linaro.org>
References: <20230210163744.32182-1-philmd@linaro.org>
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

Commit a04ff94097 ("prep: Add i82378 PCI-to-ISA bridge
emulation") aimed to model the 2 output IRQs: CPU intr
and NMI. Commit 5039d6e235 ("i8257: remove cpu_request_exit
irq") removed the NMI IRQ.
Since this model only use the CPU interrupt, replace the
'out[2]' array by a single 'cpu_intr'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/i82378.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index e3322e03bf..84ce761f5f 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -32,7 +32,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(I82378State, I82378)
 struct I82378State {
     PCIDevice parent_obj;
 
-    qemu_irq out[2];
+    qemu_irq cpu_intr;
     qemu_irq *i8259;
     MemoryRegion io;
 };
@@ -50,7 +50,7 @@ static const VMStateDescription vmstate_i82378 = {
 static void i82378_request_out0_irq(void *opaque, int irq, int level)
 {
     I82378State *s = opaque;
-    qemu_set_irq(s->out[0], level);
+    qemu_set_irq(s->cpu_intr, level);
 }
 
 static void i82378_request_pic_irq(void *opaque, int irq, int level)
@@ -113,7 +113,7 @@ static void i82378_init(Object *obj)
     DeviceState *dev = DEVICE(obj);
     I82378State *s = I82378(obj);
 
-    qdev_init_gpio_out(dev, s->out, 1);
+    qdev_init_gpio_out(dev, &s->cpu_intr, 1);
     qdev_init_gpio_in(dev, i82378_request_pic_irq, 16);
 }
 
-- 
2.38.1


