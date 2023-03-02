Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E126A8C17
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:43:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrcz-00087U-7u; Thu, 02 Mar 2023 17:42:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcx-00085f-Nw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:19 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcw-00008u-6Q
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:42:19 -0500
Received: by mail-wr1-x432.google.com with SMTP id f11so589859wrv.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uZKWKOH8CoWlg9l+QWicKQtR++JaD+yXwzgRvDSnsXc=;
 b=E2opBkC2OPOkkNFS0K7TUoEqmxa19CAMemYoqOFRucWvymzrZmWHHBj/pwQ9GNniCY
 93vB2w42/Rjoz5neMjSmBgGFeixhfjIsWQ9WBsVJXQTEsqn1Zr8OV9zJOT/ubHW/rE/A
 cYGODGRzESDdXDO426XHvOVNSm6gFXjpHmvP0E6rX1PHofLomAwGMgkkv1PodA0uvIJN
 TOtYoT4PPYp14zYwGgZF1OTaf2qYogmoFT95ZttuKA+a5Bx7/HSU6tA/vkUGeZ57KWeH
 5yhNatwUF1wjya/8DJn3MnL6/L8rdzICrKVRrBSlmShmk3M4aiOijm3Cif8Vi9YpwcF0
 87zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uZKWKOH8CoWlg9l+QWicKQtR++JaD+yXwzgRvDSnsXc=;
 b=YQXDtLgWSLKLUSGn8jvZn7zBxk1YfG4izx6CCghHgucrPskKfT3AjEO3zDNPZQRJib
 BvMwnXxrXOjH/U1fTCWAThuguFWPwD6iJrtOhJLK9awzpuLsAm+C946d6fwu6jdqhwbb
 CbAJdqHxWm/47+8e3eUhQccWHW3RQ/VSRfQyL//3olqjy/xxlKZhUvzERXt03ocOnoaG
 Cv2pCvaiO1XAGlGGpuwzPCWP9xPsOCddbvQUdytfrUOr22pRBvU9TVvpr8hYGVAbBgoY
 WDEKQ5A+XIHRUA/mw9tR6TNh35mAY8k7nnJYBwRUBXDgRGfNGgGE8DfBvn1yoPoxFTuX
 zhCQ==
X-Gm-Message-State: AO0yUKVdHXXSsOOWQsgSWOVNSC4Cy5YAvBBMViNM8D0jFO2B/+fzoobH
 ROYCdQgncH4KRZmF9t2XyC4jeFjPmeK8YK9u
X-Google-Smtp-Source: AK7set911OSldM2bKaKenSRl6GWBG5WDW7kZ2LtTcbOmPK0FR7zm+PPory4yW2Q3Sg4ZkLSSwEalNw==
X-Received: by 2002:a5d:6084:0:b0:2ca:e856:5a4 with SMTP id
 w4-20020a5d6084000000b002cae85605a4mr2581542wrt.26.1677796936316; 
 Thu, 02 Mar 2023 14:42:16 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 j2-20020a5d6042000000b002c70d269b4esm464219wrt.91.2023.03.02.14.42.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:42:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 10/18] hw/isa: Ensure isa_register_portio_list() do not get
 NULL ISA device
Date: Thu,  2 Mar 2023 23:40:50 +0100
Message-Id: <20230302224058.43315-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Previous commit removed the single call to isa_register_portio_list()
with dev=NULL. To be sure we won't reintroduce such weird (ab)use,
assert dev is non-NULL.

We can now calls isa_address_space_io() to get the device I/O region.

Note we can then remove the NULL check in isa_init_ioport() because
it is only called in 2 places (and is static to this file):
- isa_register_ioport() which first calls isa_address_space_io(),
  itself asserting dev is not NULL.
- isa_register_portio_list() which also asserts dev is not NULL
  since the previous commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 081bac18ee..9c8224afa5 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -113,7 +113,7 @@ IsaDma *isa_bus_get_dma(ISABus *bus, int nchan)
 
 static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
 {
-    if (dev && (dev->ioport_id == 0 || ioport < dev->ioport_id)) {
+    if (dev->ioport_id == 0 || ioport < dev->ioport_id) {
         dev->ioport_id = ioport;
     }
 }
@@ -129,6 +129,7 @@ int isa_register_portio_list(ISADevice *dev,
                              const MemoryRegionPortio *pio_start,
                              void *opaque, const char *name)
 {
+    assert(dev);
     assert(piolist && !piolist->owner);
 
     if (!isabus) {
-- 
2.38.1


