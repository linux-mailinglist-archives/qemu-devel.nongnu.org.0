Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECD9669D76
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:19:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGV-0001oo-Td; Fri, 13 Jan 2023 10:46:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMG5-0001aH-Ba
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:25 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMG3-00064c-Mb
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:21 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so19074191wmb.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GKmMPSZpu0s5Io751sC2xrOw1/RiRYL5xp96bZDv0UU=;
 b=GxbnCbztQtwYQgRVOWksMajIiZ7n8foHN3l8FPA+cqSteXMTf6VWdaVSjzbVepDRb1
 fudaRFXHDMT+Qx1yqkgCG7rEnR1CGQPrwL3z02GwA5Kj11VPwJVtSqghL1nWLG9gRuLi
 9LHqEtt+gVeYi/b7xdasoZWIcH8syxf48bJgqOcqb1DKe34jPfX7laX9NcyEgVk4tedU
 JFG1AZuG/otfljNxorDURmh3Sq0fSwDPFOpwQDkpQ1cqUDempaTI858rUy89yJp4ENh/
 BenBJI3hoEg6uyz/58FY1+IveKCANOGHmu1W7zBL1zTZ53BeFq5kG7+abuHJopcTdi1j
 5svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GKmMPSZpu0s5Io751sC2xrOw1/RiRYL5xp96bZDv0UU=;
 b=El49/5RW5PbLm35aVautEkJ8LTqRU9lvsfXCGQEsE54T8BhLb5cOjE3VR2fXLKA9Mu
 Xc0sjaVyDZltWjqev2LqGThkVI+bUoBC04RYy/D1kGG3vMYWNP8/ikvcFDLoXcXi57Oq
 OaNqJ1J/IcPiWaKsxTIXX1X0lWDkzhVwh+K6aUPoKYdE4bjyr7UIVcssGTGf7dzBltXk
 z9QaJxKf6HBbqDWWTZnYFl8XKyw/i2OzVVp/LTXVbEnEBGa0ojRBrCCxM2BwRAjy8DVr
 Zb32fxHH1pxvvHVHYE0IhcXi5ND43dHTkATfnPuyXZC47kucgwtHPbjc1zYH7Vu3LTqg
 g2ag==
X-Gm-Message-State: AFqh2koeo9URpXHxOWi96XPWBf5CPnaD13zVPUvELdXcIT1EKE6LrM2P
 rVf63mzmn9My8qf2lkaZiCfQMIJDhWkhc+fk
X-Google-Smtp-Source: AMrXdXvgkg64dbNPADQhZyGapBtoTzUxCsTSuzpRcxho7jJwSppLMBr4m9YgPY7nno/Dg4GrSKEBzA==
X-Received: by 2002:a05:600c:3d0e:b0:3d3:4aa6:4fd0 with SMTP id
 bh14-20020a05600c3d0e00b003d34aa64fd0mr59180465wmb.6.1673624777378; 
 Fri, 13 Jan 2023 07:46:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cfa622a18asm29156461wmb.3.2023.01.13.07.46.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 09/46] hw/mips/malta: Explicit GT64120 endianness upon device
 creation
Date: Fri, 13 Jan 2023 16:44:55 +0100
Message-Id: <20230113154532.49979-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Propagate the controller endianess from the machine, setting
the "cpu-little-endian" property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221209151533.69516-6-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index c8fc420e4f..f959bce673 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1396,7 +1396,9 @@ void mips_malta_init(MachineState *machine)
     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
 
     /* Northbridge */
-    dev = sysbus_create_simple("gt64120", -1, NULL);
+    dev = qdev_new("gt64120");
+    qdev_prop_set_bit(dev, "cpu-little-endian", !be);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
 
     /* Southbridge */
-- 
2.38.1


