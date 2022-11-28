Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BF963B32F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozkje-0002oK-N5; Mon, 28 Nov 2022 15:28:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozkjc-0002o0-V2
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:28:12 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozkjb-00029o-FI
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:28:12 -0500
Received: by mail-wr1-x429.google.com with SMTP id o5so9844910wrm.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 12:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C+Rx9RTkWkiWZS0xp8Eh57HAo/NYcsk9u6PhwzmEdp4=;
 b=dMuA+SrOwN77OKI3dKOXW5y/5s0XfUry+lCT+/hnGRHSjV/Fa3IGQ+tF7FEdZUX5lw
 I3UjUALNmeFLtH9QoaSFaV2cyZriddRil8H19gCKrlgDlPDeAlKJB0PqYx3z3AjlCgfR
 dYqsAVHWS7PnTsgVMPrVDeoFc9hLRjrCHR0yry5ybPUKGiVIFkrqAsYVv0UH8CNt5++z
 n0lpd4dbQTHEq7Z37Q6ufSL07Bu3bW2m+BPuj3UkOh6/Mx4LYXN1D9hr5eu3fC8k43I2
 K9yuekvFxeFOlZKGVQNF/5Up44oC3BlHrUpeNaf/kPxLrmnbQZihinXXXsX9EHqpLyVb
 Ko/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C+Rx9RTkWkiWZS0xp8Eh57HAo/NYcsk9u6PhwzmEdp4=;
 b=FTmMKGKMsMo20k/9CypDNwxidAYNCT0JnPq8G2pGegWassGpOTvNCBfKtjvL/vzyXs
 UgurQhO6CfVxcLXu49g2W2HUOtA1rmQyn4TdnpGjGgjTjxJwAnCR4xDBm+iKnEbea5W9
 897Z2w7QlamKeEpr1hjTALb8YjD6GXuoTp085lS2H+ngFD/9lGfZyLeWPxzCRqtSxVfS
 r309tnhfHpffxJBrFEDyNJ55VeULZhAByVRul4bDfpa4/j9GEe9Tih9x3DwB3dZhpIwr
 U+GnJwX1Iwr2HbsmFgkYcciJxccsRSsSViwWJhuf9AuMtdbgXrilCbQe/B1E6vmqyxCx
 z3Zg==
X-Gm-Message-State: ANoB5pmTt0JlxGLXAJ843C2nLMlfcIHjyDLfj1hEok02MLnL7GR+G4bC
 8flmwYGgcvOMLm1j4CUdgdpGsZgN3/ScXA==
X-Google-Smtp-Source: AA0mqf4bUZawHPOu1KNRoAPjzaaXBhx/fReLX0m8HjLW415by9f1j9KDO0qGQ5SWA3M7vLCGLes2YQ==
X-Received: by 2002:adf:fc48:0:b0:236:e0d:9ad with SMTP id
 e8-20020adffc48000000b002360e0d09admr22492175wrs.692.1669667289041; 
 Mon, 28 Nov 2022 12:28:09 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a05600c2ca300b003cff309807esm20335003wmc.23.2022.11.28.12.28.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Nov 2022 12:28:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v3 5/5] hw/display/qxl: Assert memory slot fits in
 preallocated MemoryRegion
Date: Mon, 28 Nov 2022 21:27:41 +0100
Message-Id: <20221128202741.4945-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128202741.4945-1-philmd@linaro.org>
References: <20221128202741.4945-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
index 0b21626aad..6772849dec 100644
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


