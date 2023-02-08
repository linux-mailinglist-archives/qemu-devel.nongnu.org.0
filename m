Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478BC68E4BE
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 01:09:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPY0D-0005RP-9U; Tue, 07 Feb 2023 19:07:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY0B-0005R1-RV
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:07:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPY09-0008Rr-Ss
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 19:07:55 -0500
Received: by mail-wm1-x32e.google.com with SMTP id u10so9145174wmj.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 16:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=23vodWxpK/bd5tZKFyrhR5Mgkn9GGF8RhXeyzoQkzds=;
 b=uGbotc5R0AwV6G3Tuo91yBye5uHQHsD6ZQQcLJtHpCge8AvqPd2o9Z+dI2i1PGFVyy
 sLKGLzqnliN1YRuKsgWwRTxG70jWozsXA4RiCJrVQixhW376sGLKaw4o80rsKZ7fhzU4
 6NGfwMXkXex0KWc/IDQ9e95kzzzoHM/WwVm8HgcH0hXMY+wNW9qodh6nSepT96ZfntdY
 rS/CN+fgZT0b0cBDKemEFbb6IUO1HwOQrmmYzZgxa55XwodBBoQ6nidtmgH/64wprFy1
 hCMmI1j5WEXeBbu/5RysYUUFgay5A7WyNhHrPbL3i1U+PeIxjrkGa6w5xM7Q06+bRyYt
 UlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=23vodWxpK/bd5tZKFyrhR5Mgkn9GGF8RhXeyzoQkzds=;
 b=pNsV6yuxnWEJAgeK0rEEsQs51GsHV9A8xGbBBjjUeotZ9hsTYhCqM8DYlRwHLKIzzp
 u/oNwY3plCWg+eAyFeN7NpkI2we6y6czYU5WakCTAZaH8aW7jUmQ4n3MwKTez5Fx7AGB
 2mbt8KPryf8fTxJNxlWGypFJX6FK4xy7uX07QZElG4314tRivtBlKY50Us3m/1kvyTt6
 eXlM0tEc4VMtCexfk2oJYauxB3+pv+gxMliEyjnVPLNXo0pbAM+shQWBiW4YI8Uxn0zI
 d8JWkSn0LysNyLWKkBUu0TkWHtBaRnxbKuuRAIuADgVgPSOLrCsNsGghe4OLZIteG7KU
 cjmQ==
X-Gm-Message-State: AO0yUKV3F0zBksu9Z9OlnuMubD17H+s+2FPHg1oLc7OsS2NoPsTt1LTk
 y1UbcV3jsK5dcw9HcjIWAHALJmuBU3AJrpc+
X-Google-Smtp-Source: AK7set8bsJHkPmkPKD30g9+D/bX1DSbK1lXdAyF0//i3ewxOWAgWnJJ9ZNzhKgZpr66mfXoKzDuKlg==
X-Received: by 2002:a05:600c:3416:b0:3df:50eb:7ca6 with SMTP id
 y22-20020a05600c341600b003df50eb7ca6mr4840800wmp.15.1675814871595; 
 Tue, 07 Feb 2023 16:07:51 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b003dc434b39c7sm4063772wmq.0.2023.02.07.16.07.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Feb 2023 16:07:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/7] hw/isa: Un-inline isa_bus_from_device()
Date: Wed,  8 Feb 2023 01:07:37 +0100
Message-Id: <20230208000743.79415-2-philmd@linaro.org>
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

No point in inlining isa_bus_from_device() which is only
used at device realization time.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/isa-bus.c     | 5 +++++
 include/hw/isa/isa.h | 5 +----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 4fe61d6dfe..5bd99379e9 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -162,6 +162,11 @@ bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp)
     return qdev_realize_and_unref(&dev->parent_obj, &bus->parent_obj, errp);
 }
 
+ISABus *isa_bus_from_device(ISADevice *dev)
+{
+    return ISA_BUS(qdev_get_parent_bus(DEVICE(dev)));
+}
+
 ISADevice *isa_vga_init(ISABus *bus)
 {
     vga_interface_created = true;
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 25acd5c34c..ad8bdd941f 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -123,9 +123,6 @@ int isa_register_portio_list(ISADevice *dev,
                              const MemoryRegionPortio *portio,
                              void *opaque, const char *name);
 
-static inline ISABus *isa_bus_from_device(ISADevice *d)
-{
-    return ISA_BUS(qdev_get_parent_bus(DEVICE(d)));
-}
+ISABus *isa_bus_from_device(ISADevice *dev);
 
 #endif
-- 
2.38.1


