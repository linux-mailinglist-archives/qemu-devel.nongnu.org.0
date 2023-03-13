Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2A6B7C04
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 16:32:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbk8Q-0007MV-0z; Mon, 13 Mar 2023 11:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8O-0007ML-LA
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:30:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbk8M-0003db-W1
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 11:30:48 -0400
Received: by mail-wr1-x435.google.com with SMTP id p4so5522047wre.11
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678721445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=21p1OPqj5Y9xihE9S2k5XwzFVa4uH1rFd/zKa50jrlw=;
 b=lxe3TxWwwtTpm4bE8wBD8UyNy/G+8c9GKwu832JVVqD8tdIDHR8HCWarASYLtnfDgM
 Z558xzGF72KY+sg2XnGTgmFZrUkWGGSPbqDFPsNmDvQUMw4MLjkm1BLWXi5kjxEH3JcY
 pcZUWHGhm1d89JyHJj24A1k/V919M6kC4iY3T49G/io+eZG4J4YlcNLFfPsit+C0QYb2
 dVezb4rc0fJwlMPFG7Xd/Lv5Rg5eMTVn2DOrn6j+WiEh6ujm8ID+uRfmdzNKvV9BUu62
 UfG9A3sW8gsCsABTjEw82uUK+c8Qy3pcE9jeH+HEqwNiiSjTrR38Z1V30LtcozNkIzto
 UVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678721445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=21p1OPqj5Y9xihE9S2k5XwzFVa4uH1rFd/zKa50jrlw=;
 b=nNnoiUGDbO4tekzT4rREpev7dEa3RKsczIhS528vPOKXwHPFlzBGwtSnTgWaxYtKJM
 3JL7A2Aor68glleeoD4ItLheT1uL5rZSLH7p3NO21/cUw7ikGslOAjEJ48uGa269Ag3H
 sp/hSbpTWrVIrlkDqksqtPmnRmSfbYRy77BuyWdbelEBt/L0aJy7UyibkaARdabr3fZq
 7VBivcqqIU0E1bs4jEzs2eaJ1LDCP7RHPBOzsq3CsVLQu+2mqnESE7rh3D0YXzK1qZ+F
 at7xgqcXyI6JUUZif2ug+mD71u5Cl9HUnQE7LTkDiWzjKEyNRnrdI9Dw40WGz9SrKHt5
 2QHA==
X-Gm-Message-State: AO0yUKXc6DQxwyO/Vnl5gXAkQWcFsl16vanVzQlsbUi3ZFpY629MnmMb
 0uvxuUITfTnY4SK7m8X/K8RDOQ==
X-Google-Smtp-Source: AK7set+w9c4LJ7JVhW7ATAm6X7x/LdXnXMwT7ykbWUKb17qZT7JOyD7TnqjYiYbMCZzUj9v+Ln1u5Q==
X-Received: by 2002:a05:6000:1041:b0:2c7:604:52a1 with SMTP id
 c1-20020a056000104100b002c7060452a1mr22764340wrx.29.1678721445647; 
 Mon, 13 Mar 2023 08:30:45 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d4ecb000000b002c70851fdd8sm8155279wrv.75.2023.03.13.08.30.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Mar 2023 08:30:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Wei Huang <wei.huang2@amd.com>,
	qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/6] hw/i386/amd_iommu: Explicit use of AMDVI_BASE_ADDR in
 amdvi_init
Date: Mon, 13 Mar 2023 16:30:27 +0100
Message-Id: <20230313153031.86107-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230313153031.86107-1-philmd@linaro.org>
References: <20230313153031.86107-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

By accessing MemoryRegion internals, amdvi_init() gives the false
idea that the PCI BAR can be modified. However this isn't true
(at least the model isn't ready for that): the device is explicitly
maps at the BAR at the fixed AMDVI_BASE_ADDR address in
amdvi_sysbus_realize(). Since the SysBus API isn't designed to
remap regions, directly use the fixed address in amdvi_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/amd_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index bcd016f5c5..3813b341ec 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1519,9 +1519,9 @@ static void amdvi_init(AMDVIState *s)
     /* reset AMDVI specific capabilities, all r/o */
     pci_set_long(s->pci.dev.config + s->capab_offset, AMDVI_CAPAB_FEATURES);
     pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_BAR_LOW,
-                 s->mmio.addr & ~(0xffff0000));
+                 AMDVI_BASE_ADDR & ~(0xffff0000));
     pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_BAR_HIGH,
-                (s->mmio.addr & ~(0xffff)) >> 16);
+                (AMDVI_BASE_ADDR & ~(0xffff)) >> 16);
     pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_RANGE,
                  0xff000000);
     pci_set_long(s->pci.dev.config + s->capab_offset + AMDVI_CAPAB_MISC, 0);
-- 
2.38.1


