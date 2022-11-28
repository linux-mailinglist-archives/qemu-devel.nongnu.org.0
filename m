Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC6F63AA0B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:51:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeVP-00050j-OO; Mon, 28 Nov 2022 08:49:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeVK-0004zm-Mz
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:49:04 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeVJ-0000KL-6d
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:49:02 -0500
Received: by mail-wr1-x42a.google.com with SMTP id b12so16933107wrn.2
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 05:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/R4Inekw/oUXtvtZ44ZwPbcG/FwqT8jbw12rj3DWxAg=;
 b=u7kjgjDTgjTvxi4mknc59fI7NJa892rSTq3VdryfY7+y62JcQYQ/kDQe562HyViDgK
 I0BR+pPTd8iIpxTohjrOpdqMkQFoXdP7/gFWLDLlD+yoHDXWgHLcU0xOsO3HaTXlVAGd
 LbSTtrX1T0RNFXLugfvfZHtGevxGh4ja+BWrFGIqdewyFnnEXrC+MrPolyHrl3O2v3LT
 AUDbSiqis6tmxJyrfNqxUJqOd+Uo9nkWRrdAIjHAtCoE7Kfz6QmTPL2U7dPOnKfxUB+F
 1qD/NB4UmsLtpNb9MqLWgz+WQF0k/zlkUpJ8mHH7GpwRDNsPU0PJw9VUSBiClCRsGLow
 zzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/R4Inekw/oUXtvtZ44ZwPbcG/FwqT8jbw12rj3DWxAg=;
 b=tww5s3+NFMXNLUe1fxp5pHsJsdxPakgtKccZ8Z3TjscKBIUdjGweNic+kbCXohSrb2
 Y2CTpCY5gXqxBCy1mVjOGp4C6BQ/5lIdF5UT+gPx+I5ZY11HKa5GdpWghQ8FJ/HPGLej
 Vow5Z1ixkr/UvOSBa0p/ZzX4XXETSQT2RJAKV3ags4lCsdbChB8voQUGOrIle4qVysCD
 5TsKzYl9GjABv9rx3KxJZTNZHb5xvJ6YbiBTdFisbctWE6mghKxApR+fui4NDL6cQPph
 9P7Olx42n8V9njAH55XUoGQ4+9P7Kl6WkG+4sogfaP67zEyLRM2DN4TvPC4IKSi0btGi
 MUww==
X-Gm-Message-State: ANoB5pmYoes3gnEPkG/oonkwpUWvK/D6RS8aqnG6M9hsV/4ivkuFNnmf
 H8WakraRYAR7DMXDokwmwUkGdw==
X-Google-Smtp-Source: AA0mqf43lFca6m0O+Eo3HPA1DXEIa++geamLZRELxHu4Svn8C4EVNQ9cQUOSplBKEKb76fSuV9glJg==
X-Received: by 2002:adf:f0d1:0:b0:242:285:6b21 with SMTP id
 x17-20020adff0d1000000b0024202856b21mr11735439wro.35.1669643339906; 
 Mon, 28 Nov 2022 05:48:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v8-20020adfebc8000000b00236545edc91sm10979357wrn.76.2022.11.28.05.48.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Nov 2022 05:48:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 5/5] hw/display/qxl: Assert memory slot fits in
 preallocated MemoryRegion
Date: Mon, 28 Nov 2022 14:48:32 +0100
Message-Id: <20221128134832.84867-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128134832.84867-1-philmd@linaro.org>
References: <20221128134832.84867-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
 hw/display/qxl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index afa157d327..8468513f41 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1384,6 +1384,7 @@ static int qxl_add_memslot(PCIQXLDevice *d, uint32_t slot_id, uint64_t delta,
         qxl_set_guest_bug(d, "%s: pci_region = %d", __func__, pci_region);
         return 1;
     }
+    assert(guest_end - pci_start <= memory_region_size(mr));
 
     virt_start = (intptr_t)memory_region_get_ram_ptr(mr);
     memslot.slot_id = slot_id;
-- 
2.38.1


