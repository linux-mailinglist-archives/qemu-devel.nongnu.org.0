Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128146923D0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:59:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWis-0003W4-Ix; Fri, 10 Feb 2023 11:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWiq-0003Vv-KD
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:58:04 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWip-0003yI-4I
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:58:04 -0500
Received: by mail-wm1-x332.google.com with SMTP id bg26so4318635wmb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bd1OtqBygG3Ey4k52ycKQXbZ8TYrh9zI9oYB+ByJfKQ=;
 b=zX0s7yVXy10HcQUrNe/k9W7VkqMtqYZew3qumYeXx0WEJMTKp1b2jEJwRu1jao3JNb
 rRYHgyc5hY6pkLiJvbLqA9YAA4Y6A3K73d28yUUHbXQV75/shjb5NbeT+Kq/pYvx3eFS
 AwbRhdXHRU/IZF4wokvfQzr6cscVKnDadRBNSGeyHWVbHOtMo7HDkxyQ/OpbsemEZjZi
 FiEOoX1zqgDTJsfnn56GJGnKpVLr+99MpNuVksAYSMUbDhSDv5/bNiZQf4tveejrnLe1
 fs44Y36oFONjmdKQB1+/2sJkUKg/L4g5CtjysDGend+aocDS8/AgBIktxxAwjJwGkfK7
 /efQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bd1OtqBygG3Ey4k52ycKQXbZ8TYrh9zI9oYB+ByJfKQ=;
 b=OhTuZ3Cz8GRNMR+SxGl3KCe6NAw3ggO8ZVgE9Q7dFM69neP9Pg+r07Qib+Ou3MPwQx
 PXsT83eaD8bQXR8xMFVir0Q+utmC7tRi4NqcfdqFHT7h0S01hiEkhI34fSYRnOS19kXE
 RzkziDCE7QKSoa4KG64HWfvaeeVMtQ5XeeOzrSFI+ayYUX5ukM5xgEkAtYplxZ2+cqnT
 P0fbmaHIBw6Ir7qGM9KQQCD2o365Tp1sUjf4UiujseROi4JeVnNSL5HEh1afkHKWmZfb
 zLLMXU7tVtaYSyO0fiP7G6SRnbLSaAqkCWYjlSnO+wBkz5TRo5g1kpGtjWBMc9XNOj96
 H+lQ==
X-Gm-Message-State: AO0yUKWIHt717fcJAsB7S1OFTQ1kjWQ3M8vKJSdC5GTHVf0cTGjK2VM9
 cloCSaIMoYHnFwkvVY2/4WtSwUwMu2OM+pGA
X-Google-Smtp-Source: AK7set90s/1ko81wls/zmJsh/DUXoiHzy7gIChPEsU57wbgb0JTN9PRvYXvXV1FbzMtzUlC10lakdA==
X-Received: by 2002:a05:600c:1713:b0:3da:fb3c:c1ab with SMTP id
 c19-20020a05600c171300b003dafb3cc1abmr13446668wmn.0.1676048281038; 
 Fri, 10 Feb 2023 08:58:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 hg8-20020a05600c538800b003e1202744f2sm2456046wmb.31.2023.02.10.08.58.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Feb 2023 08:58:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/4] hw/southbridge/piix: Use OBJECT_DECLARE_SIMPLE_TYPE()
 macro
Date: Fri, 10 Feb 2023 17:57:51 +0100
Message-Id: <20230210165754.34342-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230210165754.34342-1-philmd@linaro.org>
References: <20230210165754.34342-1-philmd@linaro.org>
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

Manually convert to OBJECT_DECLARE_SIMPLE_TYPE() macro,
similarly to automatic conversion from commit 8063396bf3
("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/southbridge/piix.h | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 0bf48e936d..a58bf13a41 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -29,7 +29,7 @@
 #define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
 #define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
 
-struct PIIXState {
+struct PIIX3State {
     PCIDevice dev;
 
     /*
@@ -57,14 +57,12 @@ struct PIIXState {
     /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
     MemoryRegion rcr_mem;
 };
-typedef struct PIIXState PIIX3State;
 
 #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
-DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
-                         TYPE_PIIX3_PCI_DEVICE)
-
 #define TYPE_PIIX3_DEVICE "PIIX3"
 #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
+OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_PCI_DEVICE)
+
 #endif
-- 
2.38.1


