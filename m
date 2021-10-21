Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94FE4366D6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:53:52 +0200 (CEST)
Received: from localhost ([::1]:41866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaO7-0000cF-Rm
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx9-0000XD-V9
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:59 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:35500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx7-0002pr-4w
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:59 -0400
Received: by mail-pl1-x631.google.com with SMTP id u6so678597ple.2
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ze+2H8eMmj+0SZIe7XjqhHKoxk2ZMkViz4Iz0m/Opao=;
 b=M0GVtYWHYuykXdWtPdDm+m6SS3G8e5dKY5wIJOlRIVyAVG3aFXWPfTmX4I1HT52J1a
 P+MdbLCFDYv2c7zmxt0P/1aTawMez9Jszn3wlJgMlZ2fPrcbG5GQKKQh76VyzwD4od0k
 Aeh2GPQnfFFrpl6q9ZLQsNfLpJ2dM1hSDEIDoH4vZ8gAgkbvz8uEgyOn5iN5jDsVaC3q
 /BjlCSDsH5yb/QhiyguTIAHu11IwuKkLlemlo3lomA1qyobOfijv5G8vSj/o5XiG0TqC
 c4Fku21u51wucB3LrLnijh9IcP8BP2gNS9K1PFjs0xnRTqTTiNjADfTIWNjJaDF18KQP
 7rzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ze+2H8eMmj+0SZIe7XjqhHKoxk2ZMkViz4Iz0m/Opao=;
 b=oWSUPxIL6dliiQcjPh0ZLVWXOl1VGxg4cCKfZ4JyQkFVRHYHJ95UbL0tMcdd6OVEgu
 zrZbR/PDWt4HdLxvwhoNZWP73aV6WZ4APelTBYltxKfK6wyMtwZdeG1v4ueIWLvo+r5v
 9ZTiZKtup7zXUkJAWdzbfFRW4dbILHw2e8ZvqUv+sOTIQKZkpGRQhB6PRFeULZc1iW2B
 0s59siCItiuSvdhkqJP4XRoIysozUtkM2FnNiHyLtkH6taCtDhLgcAJeHnaGQzUjF9Qp
 3XRSeHJv6umzRo3GKPGG3+VvVkqbBb0eodJjhAxBWhBrGJ6L/jdi2MOoTnGYiJH6y4U/
 bBLQ==
X-Gm-Message-State: AOAM5330O9PnS5OasZNauzHxANbJLgGyoPwmCPWNEq+aGeNrKF6SJe9I
 moNMgOaLZidZeXlaJGMEvQfcR8XFULo=
X-Google-Smtp-Source: ABdhPJxqEvcZrJSmBJDHJxai6Nl9xLNZhdT1jyLs0M2TWtkCI92yWIfxhGJRfTszX3SZTPY6FT9EmQ==
X-Received: by 2002:a17:90a:b296:: with SMTP id
 c22mr7301469pjr.13.1634829955792; 
 Thu, 21 Oct 2021 08:25:55 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/19] hw/arm/virt-acpi-build: Generate PPTT table
Date: Thu, 21 Oct 2021 08:25:40 -0700
Message-Id: <20211021152541.781175-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yanan Wang <wangyanan55@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 Andrew Jones <drjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Generate the Processor Properties Topology Table (PPTT) for ARM
virt machines supporting it (>= 6.2).

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20211020142125.7516-8-wangyanan55@huawei.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/virt-acpi-build.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d3bb4cba3e..674f902652 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -943,13 +943,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, vms);
 
-    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
+    /* FADT MADT PPTT GTDT MCFG SPCR DBG2 pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
+    if (!vmc->no_cpu_topology) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_pptt(tables_blob, tables->linker, ms,
+                   vms->oem_id, vms->oem_table_id);
+    }
+
     acpi_add_table(table_offsets, tables_blob);
     build_gtdt(tables_blob, tables->linker, vms);
 
-- 
2.25.1


