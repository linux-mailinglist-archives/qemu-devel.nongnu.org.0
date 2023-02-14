Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0244696463
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:17:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9e-0007Zz-KD; Tue, 14 Feb 2023 08:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9R-0007VD-H4
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:21 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9P-0003uP-D1
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id qb15so37859439ejc.1
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AFrfKDNgDSO+JSI2nSN7vL8PgZQEIxHL9NLlLSyrouU=;
 b=RFXSNLxFlIPXwMZQCPMYiPJvmRkSp1P0okOrCy8lKtFXOyBkDHwNSsbC+FpetsJYPH
 RXXxh8jserYBMr5r3SE15y2wFWPybevuDYsKqfQzV3VBiUwZtIb9DQTsUAFJd+3qnabw
 mP9vXZdpAfs8yma5RXuf+AGiya+qIHHSzkWCfWm2epp07qCygwRzJAw7nRosV3LRwikw
 1Tb+ot1OiBlx9iJSNXbJgePCz4li+smFt+apsdEVL7GUB7uMRXvh0lleAqCW/1lDBrsc
 qUvMsfHO+WRUSaq2AFWjgqi8/t+NhuXggATZ6ertF/Q6Wy9qrMkVSQ64lly/aJaTU/ub
 cCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AFrfKDNgDSO+JSI2nSN7vL8PgZQEIxHL9NLlLSyrouU=;
 b=nrl8gj2iRFG1bVMHtwP3Mz6Okszc5zlfJyPEh0vx6UEv0XrXdVzT4yf7Rk/0ruai9Y
 52lry1RcEL1x3xBxyUtVIfohx1el+CNP8NXDNYo6yHj3V2lIFo/m2FK+fqgoVCOxToEe
 KnSLQOZ5Wu6bYD24qn+b3hiE+adRV8jlaK4vLKwDCCBkUCHqRHZr/n9zZMl5lnfiXxyu
 DD6CoS7x1AFhY309bffFlaMGHHhKVuspyUbjlBfkDECsQsGjYfR7T9dK2DwstkuZKbOP
 rwBKmx7uMR+Brg190+EatWYLaQe++7xVIJJEpjM55A3TFhAML/bIieIwkO0NBwaQnvZM
 6udQ==
X-Gm-Message-State: AO0yUKWGq2z3twJbDSyLYGRtFZYE+GVzT9VIP2aHGG/Q9UzfXAecqLVp
 hQPDWenyXcqJM5WePyHhB9ZOlKgw6VQ=
X-Google-Smtp-Source: AK7set+Pbb/tDqoLDToq3Wg3tKtR8uQf+lC1tccsV5ErP/M3JLqbqDiaCJWC8ZPJ40lA0USMWMGxhw==
X-Received: by 2002:a17:907:6e0f:b0:8ae:6b88:e52d with SMTP id
 sd15-20020a1709076e0f00b008ae6b88e52dmr28475266ejc.7.1676380513819; 
 Tue, 14 Feb 2023 05:15:13 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:13 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 03/12] hw/pci-host/q35: Use memory_region_set_address() also
 for tseg_blackhole
Date: Tue, 14 Feb 2023 14:14:32 +0100
Message-Id: <20230214131441.101760-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Deleting from and adding to the parent memory region seems to be the old
way of changing a memory region's address which is superseeded by
memory_region_set_address(). Moreover, memory_region_set_address() is
already used for tseg_window which is tseg_blackhole's counterpart in
SMM space.

Ammends: bafc90bdc594 'q35: implement TSEG'
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 3124cad60f..0384ce4350 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -404,12 +404,11 @@ static void mch_update_smram(MCHPCIState *mch)
     } else {
         tseg_size = 0;
     }
-    memory_region_del_subregion(mch->system_memory, &mch->tseg_blackhole);
+
     memory_region_set_enabled(&mch->tseg_blackhole, tseg_size);
     memory_region_set_size(&mch->tseg_blackhole, tseg_size);
-    memory_region_add_subregion_overlap(mch->system_memory,
-                                        mch->below_4g_mem_size - tseg_size,
-                                        &mch->tseg_blackhole, 1);
+    memory_region_set_address(&mch->tseg_blackhole,
+                              mch->below_4g_mem_size - tseg_size);
 
     memory_region_set_enabled(&mch->tseg_window, tseg_size);
     memory_region_set_size(&mch->tseg_window, tseg_size);
-- 
2.39.1


