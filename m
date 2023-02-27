Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC56A43FE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:15:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe91-0005kf-BQ; Mon, 27 Feb 2023 09:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8z-0005fN-8n
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:21 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8x-00006d-Mq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:21 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v16so3549925wrn.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LhfXfTTiOAw8Tas+LE/Xmhs92F8Sdpjj0w+PGmwionY=;
 b=IqWigxu1kIdvtmMEWcZ9cfn/O2o2sfFJWBMQ8vtjXdUW3ssXADR/rq1Na4opfju1hA
 5nBk42uvmmdbnv/5AizkqXmrVJiqIVTLwqDTwox37ZZUzI1iTYDl+hnky1KNkekaE2sB
 gv/U5U0p4/+umeRNmoKk3AJhJwrSbERxBAK8e0CpqsT3oFkWiHpnLPLQRK3vHU/XQp/f
 IKfRWe6ikn4MF+Ioek1M4vpNV2BevJHchPpWfLxb0sQtTGXFV9I3fP1p2oLOoYECoyPz
 GD2zhRleXu7+gwDK7TQZQiqb4pxjrtUF0pzxTO05pZGrg9fDI0rrlMLnwmYQPGY3rjH3
 DeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LhfXfTTiOAw8Tas+LE/Xmhs92F8Sdpjj0w+PGmwionY=;
 b=zZBn2BZcK+Bs+s0+ETL7e6hWV0ap4utQNTEnyUcUK7LbTHWIwVcskIMcTIPlLNKQ+u
 eUuaBGOLFo1aXvX9srGPH/8zf8KXUPyBrc1ZyWnBTc+DiPkzW26ngqUo5tADzF20OHXl
 hFF28o9oZw9m3QoI8yoQbetTnYTrGv5RqmH9x2iG96NrDQTjfE0iEE4EtntkCOs1dxgZ
 k17VCRPgbhkJCHZ7pM3YkX+cWIrDqfjg8ldEy/0We7k4gv0bNlgBf2+W2NP2L3Ce9VUD
 NpcddwFOr66n2xQl2+NhmA9vlNp+k0zeD0Pi9kP2X05FaPWneQAHWD7hJbXf87t0GCjN
 ad+w==
X-Gm-Message-State: AO0yUKWcTJYtah6iYFMp8vrV1EqutsRtlsqPRM82fdcOlCODcXfBdKkZ
 okItVCya+l1LL40pzHXyP359xClH11uS0amE
X-Google-Smtp-Source: AK7set9qMTpwU8MRE6xCohaNtbQ8fGvaOaAsBT9Vdb0GmpkO5fqsxAXehI6/PSYhMI2ThfVMIg1T4Q==
X-Received: by 2002:adf:f80c:0:b0:2c8:f78:2772 with SMTP id
 s12-20020adff80c000000b002c80f782772mr10067972wrp.19.1677506778202; 
 Mon, 27 Feb 2023 06:06:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a5d4f0a000000b002c54911f50bsm7210770wru.84.2023.02.27.06.06.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 054/126] hw/isa/i82378: Rename output IRQ as 'cpu_intr'
Date: Mon, 27 Feb 2023 15:01:01 +0100
Message-Id: <20230227140213.35084-45-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
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

Commit a04ff94097 ("prep: Add i82378 PCI-to-ISA bridge
emulation") aimed to model the 2 output IRQs: CPU intr
and NMI. Commit 5039d6e235 ("i8257: remove cpu_request_exit
irq") removed the NMI IRQ.
Since this model only use the CPU interrupt, replace the
'out[2]' array by a single 'cpu_intr'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230210163744.32182-3-philmd@linaro.org>
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


