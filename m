Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72FC5F37AD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 23:27:11 +0200 (CEST)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofSxy-0004WT-L1
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 17:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7j-00022g-AW; Mon, 03 Oct 2022 16:33:18 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ofS7h-00043a-MV; Mon, 03 Oct 2022 16:33:11 -0400
Received: by mail-ej1-x633.google.com with SMTP id a26so24669048ejc.4;
 Mon, 03 Oct 2022 13:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=+tRjUARSPdSHA8sbjVeOPRSawdfdi24BHLf+xgV7fkE=;
 b=aRD5a5oV2RjFRBLDi6syNZvJR44Zmgq+GAZQURHr3ciEc72Lz7tFpW5Ro5KREd6876
 RnHjL+gRvunUzlCFqNWb6nrA2Cn8mnc4GfUOgrtjPzW06m5z2gh2iEB4ffuC7s5OL6vC
 oJBHg+KULmO75E1R6K+t995X8XSM2kcXgjRKxFR6Fk1Zg4DK+I0jWwUJeAdwGNaQ7IFN
 N/IgV7dfZYj1ytDCSrqHTGGrvfs9Cd0ZeVrGlziSj9CJkZVsbgIMspL5cT/OLNoWrmrK
 su2ACddV/1zcMTA8NTiauM8NCJ6iaOPxcEohDzLfgoJmDipu45d7c7cr/+KwY5yncLV5
 +IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+tRjUARSPdSHA8sbjVeOPRSawdfdi24BHLf+xgV7fkE=;
 b=HN/K4gb7QKBpm9iZbMBXGtsDqw2AM/Be3N0iJdqVel8vhT33E/XPqQDQt6nQ25F9kA
 PC+gkeqILFZD+b900wIHZ1VmUnJbXmDPKw07s73WNogsnO9HkubPZAv1udTqD/zIqEcn
 D1IA6RdmJwNq6BAWKXB9tkOAcCMbYyK76B3BCVSfGoVOhssmtpNprxxb5jtGfpGN5mFj
 jWp7524+AeeCZE5LeRpJdoigo6+QyKsa/ZkGKiz5vQ2FYahGxSvUPepe7lNtYkyyB48Q
 1gvRA9DQSZdaQfR5SLDlTHvbJovQ8IbnJ9F4Jl3x2PZlTQ/6qWK7WUsKRQZ+UsU2XBQn
 S3xA==
X-Gm-Message-State: ACrzQf1lEhjXhjUIAMo0dA6iduO5Byx2SeRyD5xcKdoMT+Ttg8gzJCht
 YtHD3ExFCZcVfygOTvkMRN76ROgilaU=
X-Google-Smtp-Source: AMsMyM67pugNcu53lj6yirxtZYBny+clPFgvUGlUOA0k+LlcvBJDLnDzy3Gnt0j78X7/HOeL1LRg6w==
X-Received: by 2002:a17:907:318b:b0:740:33f2:9e8 with SMTP id
 xe11-20020a170907318b00b0074033f209e8mr16359783ejb.138.1664829187551; 
 Mon, 03 Oct 2022 13:33:07 -0700 (PDT)
Received: from localhost.localdomain ([46.183.103.8])
 by smtp.gmail.com with ESMTPSA id
 lb9-20020a170907784900b0073ddd36ba8csm5978087ejc.145.2022.10.03.13.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 13:33:07 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Kevin Wolf <kwolf@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 06/13] hw/ppc/mpc8544ds: Add platform bus
Date: Mon,  3 Oct 2022 22:31:35 +0200
Message-Id: <20221003203142.24355-7-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003203142.24355-1-shentey@gmail.com>
References: <20221003203142.24355-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Models the real device more closely.

Address and size values are taken from mpc8544.dts from the linux-5.17.7
tree. The IRQ range is taken from e500plat.c.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/mpc8544ds.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 8e674ad195..9c81477698 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -14,6 +14,7 @@
 #include "sysemu/device_tree.h"
 #include "hw/ppc/openpic.h"
 #include "qemu/error-report.h"
+#include "qemu/units.h"
 #include "cpu.h"
 
 static void mpc8544ds_fixup_devtree(void *fdt)
@@ -45,6 +46,11 @@ static void mpc8544ds_machine_class_init(ObjectClass *oc, void *data)
     pmc->pci_nr_slots = 2;
     pmc->fixup_devtree = mpc8544ds_fixup_devtree;
     pmc->mpic_version = OPENPIC_MODEL_FSL_MPIC_20;
+    pmc->has_platform_bus = true;
+    pmc->platform_bus_base = 0xFF800000ULL;
+    pmc->platform_bus_size = 8 * MiB;
+    pmc->platform_bus_first_irq = 5;
+    pmc->platform_bus_num_irqs = 10;
     pmc->ccsrbar_base = 0xE0000000ULL;
     pmc->pci_mmio_base = 0xC0000000ULL;
     pmc->pci_mmio_bus_base = 0xC0000000ULL;
-- 
2.37.3


