Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6375B523647
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:54:57 +0200 (CEST)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nonjr-0007cN-Jd
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1noncI-0002lN-UJ
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:47:06 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1noncG-0001Iq-UZ
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:47:06 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso2323698pjg.0
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 07:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZptIjeV5waNPqbOFw/xyPgubEKgJpD3XmAraBqSym9Q=;
 b=b9jEC1YAOrmvah5uCMh9Z8tq1mIcUoyZEfWmfzqYRIojx0OPVMAIEV+PFky/wBtxFz
 u0/nKHrjj532Ar9HWKFjZvfZ5ZbZHID14Ew6icO6DAamDQTe1WORHo/ZX2Ej7ggGwN8e
 jLyEDO8ywsUoV+vxsmjG+7ECN98LxYgh2TJmzomYX1W0f1Q2zYm+8WkyXCOrfvvouKy6
 y3AxyLQxA6IYG/6xdHISxUa/b8Lu3jmULSGXM8fDD6sqen25rD1LwRivzVr5aimLGvs2
 QYjf8HSwI6TRWH388z5+Qeg7T6rzPtXOywfe3ZQCm50CgMZ2u+gYaubQ+pHz9nHwD5Zf
 GBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZptIjeV5waNPqbOFw/xyPgubEKgJpD3XmAraBqSym9Q=;
 b=G+uOwYtjjWQ+O2iCZKjCd0ar2k+YKNCvHmaOzEx34RxhabzdtY4Q7Qe97OOI+tdURQ
 ehoZ6p2x8drSGjgHf0d4n/xIX6P78KkFZPQuiJ7fZJ07N0aUv3I1RZdejaOkx8a5WeBb
 xyrgG8dvObrNneIhGYDI0SCOGfEz1XsGzUteYG75Rtjg2xPRgTIFcY0A5juGnuswQdQ+
 9cPF7tZJzsIrusEhMuOtyB8cXAqlRaMGkoV8Lc2BuU/n4LeuGY6JXOucC7nQs7q5OwQR
 H1ZspoujODfXYvJn7ByUovus5KiuXE02B7otFhJOjMu0Ax3lHeOXiSGB9UYiVsl+8S3u
 4BYw==
X-Gm-Message-State: AOAM531DQztDpvJlvQbXhzv2IgU5fougEfslA+2APtn5SWP2ALneFwHV
 xayz2/BC671xRXbB7biYcH9OzA==
X-Google-Smtp-Source: ABdhPJyNMjymG2FSszqKzFZaxOGJov8rUL6gXLsv97IKSEK9UKk3zQ5B9EIooDp1SBBETqA190IExw==
X-Received: by 2002:a17:903:22c1:b0:15e:c3b2:d632 with SMTP id
 y1-20020a17090322c100b0015ec3b2d632mr26362510plg.0.1652280420592; 
 Wed, 11 May 2022 07:47:00 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 8/8] hw/riscv: virt: Fix interrupt parent for dynamic
 platform devices
Date: Wed, 11 May 2022 20:15:28 +0530
Message-Id: <20220511144528.393530-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220511144528.393530-1-apatel@ventanamicro.com>
References: <20220511144528.393530-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

When both APLIC and IMSIC are present in virt machine, the APLIC should
be used as parent interrupt controller for dynamic platform devices.

In case of  multiple sockets, we should prefer interrupt controller of
socket0 for dynamic platform devices.

Fixes: 3029fab64309 ("hw/riscv: virt: Add support for generating
platform FDT entries")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 hw/riscv/virt.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 3326f4db96..c576173815 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -478,10 +478,12 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
 
-    platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
-                                   memmap[VIRT_PLATFORM_BUS].base,
-                                   memmap[VIRT_PLATFORM_BUS].size,
-                                   VIRT_PLATFORM_BUS_IRQ);
+    if (!socket) {
+        platform_bus_add_all_fdt_nodes(mc->fdt, plic_name,
+                                       memmap[VIRT_PLATFORM_BUS].base,
+                                       memmap[VIRT_PLATFORM_BUS].size,
+                                       VIRT_PLATFORM_BUS_IRQ);
+    }
 
     g_free(plic_name);
 
@@ -561,11 +563,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     }
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "phandle", *msi_m_phandle);
 
-    platform_bus_add_all_fdt_nodes(mc->fdt, imsic_name,
-                                   memmap[VIRT_PLATFORM_BUS].base,
-                                   memmap[VIRT_PLATFORM_BUS].size,
-                                   VIRT_PLATFORM_BUS_IRQ);
-
     g_free(imsic_name);
 
     /* S-level IMSIC node */
@@ -704,10 +701,12 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
     riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandle);
 
-    platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
-                                   memmap[VIRT_PLATFORM_BUS].base,
-                                   memmap[VIRT_PLATFORM_BUS].size,
-                                   VIRT_PLATFORM_BUS_IRQ);
+    if (!socket) {
+        platform_bus_add_all_fdt_nodes(mc->fdt, aplic_name,
+                                       memmap[VIRT_PLATFORM_BUS].base,
+                                       memmap[VIRT_PLATFORM_BUS].size,
+                                       VIRT_PLATFORM_BUS_IRQ);
+    }
 
     g_free(aplic_name);
 
-- 
2.34.1


