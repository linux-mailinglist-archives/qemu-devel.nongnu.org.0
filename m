Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC7C68E4BC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 01:09:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPY0I-0005SK-2e; Tue, 07 Feb 2023 19:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0F-0005Ry-US
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:08:00 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0E-0008Rr-55
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:07:59 -0500
Received: by mail-wm1-x32e.google.com with SMTP id u10so9145291wmj.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 16:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uG/V5STTly/AiDD51pW5nIRJQwYRV7tuuua0OnmiC/A=;
 b=KISIPCHMW8jjyuruF5tKYxLoSQIBoNoTotZpaR8UnCTk+RnckiU8Q9jP1idhMpPREI
 RR3cf0Ee2JdU+A8RxBXK26Nxda18Hq1AWpcGORkJBhIBr5v6797HDbzsOStBtojYoJjo
 jjp0gZTIRI1GI0DEXnQ5wOd6f8VlqXy0Q5Sbfcze88qmdN9Nr5cKaiJ7309wnjN6PWbZ
 +xnA/nAoNhg8UH60TnfCvhtBBoLizBovAnIMSY2Cum17vJI+UWIKv2vIc92br7D1KxZ6
 zL+aHJiII/ZS7Ei5k62fwFj0uMiarAX4zql71FCQCxstbnKBxE7K9DXmBAGOCmaOM5Q1
 dzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uG/V5STTly/AiDD51pW5nIRJQwYRV7tuuua0OnmiC/A=;
 b=K/sw8UJ30uCFSYWoVqD/mBJBFXlU1jUZFt+4GGvkExWg2kUpBaNgLzlf7HsoEJerVm
 Lxt124HC6RUYkJulrLyrXSB6EFPaGL9Om59o4gOOHVWSd9IQ8m1BcmHniBGug965AD/5
 JoOeL3b9Ew9Z82UIFl3eqvMsPb2ouqQA4T+blUhaXzCI25IsneC+9GKnF2n6CYRXQQw3
 0kG1JSVltkHRzh5TYN4ji30XexCvpkxELt+UTzE9koeiIYQRz3ABjLPsir/hylBbPht4
 T30hP8GL9J8qMClbIaSWqMQuPYWOFGr/cZvGA6/s2kJE9eQEqmBmXKsBKKLXzSQPnY7q
 nKPg==
X-Gm-Message-State: AO0yUKWrEFAYaXUUEk9oqM5CSqG3lEeBthVXgh7PrCNoxzI5IbbQA1cp
 fcx+yeSwxb/9JtfATKWZlkZGpqSBLScdaldT
X-Google-Smtp-Source: AK7set+AgZImcgFgdA33Me5d9EtLSt4UWVeGvPbeJWrRyQ9xWYVdOokqwaERzFNgovWTP2NMk4Ybnw==
X-Received: by 2002:a05:600c:4d8a:b0:3de:d52:2cd2 with SMTP id
 v10-20020a05600c4d8a00b003de0d522cd2mr4633589wmp.4.1675814876873; 
 Tue, 07 Feb 2023 16:07:56 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05600c314700b003dc59d6f2f8sm283729wmo.17.2023.02.07.16.07.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 16:07:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/7] hw/isa: Use isa_address_space_io() to reduce access on
 global 'isabus'
Date: Wed,  8 Feb 2023 01:07:38 +0100
Message-Id: <20230208000743.79415-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230208000743.79415-1-philmd@linaro.org>
References: <20230208000743.79415-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 5bd99379e9..95fc1ba5f7 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -114,7 +114,7 @@ static inline void isa_init_ioport(ISADevice *dev, uint16_t ioport)
 
 void isa_register_ioport(ISADevice *dev, MemoryRegion *io, uint16_t start)
 {
-    memory_region_add_subregion(isabus->address_space_io, start, io);
+    memory_region_add_subregion(isa_address_space_io(dev), start, io);
     isa_init_ioport(dev, start);
 }
 
@@ -133,7 +133,7 @@ int isa_register_portio_list(ISADevice *dev,
     isa_init_ioport(dev, start);
 
     portio_list_register(piolist, OBJECT(dev), pio_start, opaque, name,
-                         isabus->address_space_io, start);
+                         isa_address_space_io(dev), start);
 
     return 0;
 }
-- 
2.38.1


