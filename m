Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766926484D6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:17:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3f72-00050v-Kr; Fri, 09 Dec 2022 10:16:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6a-00050H-FH
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:16:04 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3f6Y-0008Cu-Uo
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:16:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id v7so91103wmn.0
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLnlg0af127g44EFIKtJ/oSICYhWK5zaYVn5ekJtC5E=;
 b=i1qeGqXB9DZDIhw5ua7m4WaGp1ghRQnGu1Ricsq5tUaCVdwv3w5QTKlMloMukEy2AS
 O5OJkU2cqK029N153Nm0ceJ81gaJvbdkCpKpZ+Ivef2iLsGl9Lvpo4BTsCQuYEnl0nh7
 BECqj4OTrSWBTtMAAFqk81OcWZ87j2YjuC2lp3gtDLmJyAZUvGPEb3i+Qib15Xw2jJDG
 WySeldXg0wfCTHwRRp48aXXwU2fDlUCVwb52wOSAi7KQHWZGMacdhipASX2rdhVctAI/
 XRSX987CqOtmtmZ/JjmHcaqFy9bggSvdDyZV+fYrqubG57szaIUm4e3POfdBW4pzvqNN
 fvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLnlg0af127g44EFIKtJ/oSICYhWK5zaYVn5ekJtC5E=;
 b=nK/Yai5FND0WBgtrwrRf8mHnjPMsE6uEtXlwqaD9d7LWjKB0m8VMfcSviHC8HfPTwZ
 +UQP4b88TSu8UYOljHe3KLvOIobO3B1l0RZuVQJf85NScolhgZDEBoMXFSS4UXK0MO1X
 VbriU9GHlNh/NYH0NceuPmVlf7IZzuYzBHmkS5ex+sLHDg8nkW1oKVUQX+jRqeqbTWXA
 gadzCobgYoHRZWkTSVQiB6L2sc/EynKqeUE4JBE/4PRNCn06ZtKu3UWpp1Y3f4JjqztR
 drlJuy7Zd6Hycb+jXyCR2i5pcuNCGpvWTcoFPKc/oX8g+/goFNas00rnxPUBenxonbis
 lzkg==
X-Gm-Message-State: ANoB5pn3tfwFFkYRtPa9KsImU9GJ2LW8BxdbODvomVDLUfvosrD82nS1
 HYgcZufhI63AEMvycEOoitNsKuiSt323KsQTcH0=
X-Google-Smtp-Source: AA0mqf4o2qjr2sBvDSzCfWkbRL49m17jGh8xLd2sjCuSsa6ZARkArX5HwJPoeI3krtMYfy2RluB0+A==
X-Received: by 2002:a05:600c:34ca:b0:3cf:88c1:3a89 with SMTP id
 d10-20020a05600c34ca00b003cf88c13a89mr5321822wmq.26.1670598960277; 
 Fri, 09 Dec 2022 07:16:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h67-20020a1c2146000000b003d1de805de5sm42811wmh.16.2022.12.09.07.15.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 07:15:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH-for-8.0 5/7] hw/mips/malta: Explicit GT64120 endianness upon
 device creation
Date: Fri,  9 Dec 2022 16:15:31 +0100
Message-Id: <20221209151533.69516-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209151533.69516-1-philmd@linaro.org>
References: <20221209151533.69516-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ba92022f87..1f4e0c7acc 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1390,7 +1390,9 @@ void mips_malta_init(MachineState *machine)
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


