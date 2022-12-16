Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D964F426
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:31:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IV2-0006gO-74; Fri, 16 Dec 2022 16:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUE-00065d-0i
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:24 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6IUC-0000fE-Ed
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:43:21 -0500
Received: by mail-wm1-x32f.google.com with SMTP id v7so2786795wmn.0
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wVHkl0SJwne+XihoGUblfNQhtc6oZLY6VgJtTl+eHTg=;
 b=FCmpYAw630CIzGTFQnm5e10seeZg27awC1jHuFTZSivU22SE2uA7V5DZ/BlZJ3rXtm
 oaeNvA+hGsg4vl/tLEMZ83+h7Jg+C72nKgG6nRcAb2KlZf4vgXExRBmfH+k+TMC5NUVB
 TjmwrxDSDucGzUo8gNUc95jDzKjWjjwCjo3ihJrtDJFuC87eWwv/G9lvAB9rxuf42NKp
 aJjIRGSEInjBKIWfo/uaLRGWtTcbeX1Cpwy5iJ2OQQjzAAh/wz4wpVpmskY54jXFmr4N
 Z9i7jUfsSmO7icpIIHIkW/SD5FztKAu8VqhFJuTuNVKW5Lr+FasFupR7oARcoooWuye8
 n6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wVHkl0SJwne+XihoGUblfNQhtc6oZLY6VgJtTl+eHTg=;
 b=BxwRZYjvofDG2LMMD2KMUFWmO1b+rau2HLDqeDb7d5oXrX0ZxbUrefz9WM3PoSWYVV
 fZm4RoMdA6jQwu9brW5n+JPwa20LHL6iUMAZbZja3JhjHHevnZ8a0snpkpm1/OJ+gx7s
 5DzbT0hXjiSD5zE0yG4GPOu4KzOG4cmSxee90959kIHUXTLYJ7Mfu3tssq1F3jCtEw4t
 AYD1jiruKzfT5YBJK1kyQUnO7y2bz8Hd12Qix5T8b2uUDgUKOWbbGb6f6Jf40eTLY7LQ
 +S2shOPw/1D6Ib8NoqvCw4bFP+/DmbpIMcjVMOFhQncbvlqHt3E1jYw9oN9pgknUzWXu
 tlHg==
X-Gm-Message-State: ANoB5pmVp8zoi898CEoADYNa7+YGHAzoG1nauDuQJQJ9gfx9GSjC9ZZL
 zH28H5IwIbwtDIqkh9bjUtO8FC4uI/H6ldHI
X-Google-Smtp-Source: AA0mqf5fC7t27/OeKblrJmDmSs6J2MwF4dTCYYY7Rw9D1TuFiXgiyznNXwtQeEazVo4xgeHRGqXRrw==
X-Received: by 2002:a05:600c:1e8f:b0:3cf:728e:c224 with SMTP id
 be15-20020a05600c1e8f00b003cf728ec224mr26222895wmb.6.1671226996409; 
 Fri, 16 Dec 2022 13:43:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05600c364700b003d33ab317dasm4135263wmq.14.2022.12.16.13.43.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 13:43:15 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/36] pci: Convert TYPE_PCIE_ROOT_PORT to 3-phase reset
Date: Fri, 16 Dec 2022 21:42:40 +0000
Message-Id: <20221216214244.1391647-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221216214244.1391647-1-peter.maydell@linaro.org>
References: <20221216214244.1391647-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Convert the TYPE_PCIE_ROOT_PORT device to 3-phase reset; this is a
necessary precursor to converting any of its child classes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221125115240.3005559-4-peter.maydell@linaro.org
---
 hw/pci-bridge/pcie_root_port.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/pci-bridge/pcie_root_port.c b/hw/pci-bridge/pcie_root_port.c
index 460e48269d4..36bc0bafa7e 100644
--- a/hw/pci-bridge/pcie_root_port.c
+++ b/hw/pci-bridge/pcie_root_port.c
@@ -43,9 +43,10 @@ static void rp_write_config(PCIDevice *d, uint32_t address,
     pcie_aer_root_write_config(d, address, val, len, root_cmd);
 }
 
-static void rp_reset(DeviceState *qdev)
+static void rp_reset_hold(Object *obj)
 {
-    PCIDevice *d = PCI_DEVICE(qdev);
+    PCIDevice *d = PCI_DEVICE(obj);
+    DeviceState *qdev = DEVICE(obj);
 
     rp_aer_vector_update(d);
     pcie_cap_root_reset(d);
@@ -171,13 +172,14 @@ static void rp_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     k->is_bridge = true;
     k->config_write = rp_write_config;
     k->realize = rp_realize;
     k->exit = rp_exit;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
-    dc->reset = rp_reset;
+    rc->phases.hold = rp_reset_hold;
     device_class_set_props(dc, rp_props);
 }
 
-- 
2.25.1


