Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D596A1815
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:38:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTZs-0006ll-CI; Fri, 24 Feb 2023 03:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTZq-0006lG-2W
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:14 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTZo-00019R-8x
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:13 -0500
Received: by mail-pl1-x62d.google.com with SMTP id c1so16211162plg.4
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kml9ChNSjrRmqy79qKAvciG3lySsDYcWySLbofKRIXE=;
 b=RaFGhsSFzQtcmZ2eHU6QQHFoqij6ma1jTcvb1rUTIFPx5ffUXzUacnQ73lAhwkxpwP
 L0IwC71xDqmTuULVDAKRSWYLNh8msWed6eiXfnigQIMC8KE2wzICItoD49oKeUHIZebD
 A2zMl9PTGfGwFAgBoViQxRskG61kWomHBr13vvCvv7NivNYhCNr6kbW56GirZhaZQmSx
 C9wiY2SmqUjoZ8lmiy5cKlropmhE65sXu7HmclHepqjRB2F3DLL7b+durdioLq9S9pzN
 Z6abKkyPGQPOh0avg0qW1Jpag0FZFYidFQM879/GIcnJ0s2qr+g2eOxkzJ5Qc7YqsB5O
 3P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kml9ChNSjrRmqy79qKAvciG3lySsDYcWySLbofKRIXE=;
 b=n0wLBGN3INc1ra9uy7W8l3FtIQPbmHkO0PYavt1syseM8Fcc+Vvx5NJfa2iQ1gWKL4
 n6mXp1nwsPpcf3xHx3h7+GWIzdaejlIUmv+HnoWNHpq2ZKjOgvrZtMgykxHk6FlcY3IE
 msQaBno4t/V9XFxLMS04YODIGhtTZmRraUkfSDChwifNc2gQ5YQ87UAQHs8M96N9V+4s
 +8dNKFz69939B6Z/B5oY5P1aOQcXafhkIgYa1ekxuM1rXH18jRT7KV+Zi6Vmatxn2apR
 2wjv07EBoqpk24WcA/pLeXkNDdPvjc6So7tmSwQxg7AAW8KfHxY5wokBsu6JS7xihXW3
 Vfkg==
X-Gm-Message-State: AO0yUKVUp1oWSirntJ+ozkjm7Dd4Hj4N2eKPOGMppHI8AS9i5e5wgG6W
 Lm741brggGvPIE+DEgaOuQYpQg==
X-Google-Smtp-Source: AK7set8FyV6LaN1Hh2/iCTCEcO2mAh6sVuSAsEYg4EofZWD4kbosQeiOcD2z5zb/b3qqan+WonpVGg==
X-Received: by 2002:a05:6a20:548e:b0:bc:a257:5b2a with SMTP id
 i14-20020a056a20548e00b000bca2575b2amr17669948pzk.31.1677227830782; 
 Fri, 24 Feb 2023 00:37:10 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e3-20020aa78243000000b005dd98927cc5sm2507945pfn.76.2023.02.24.00.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:37:10 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V4 1/8] hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
Date: Fri, 24 Feb 2023 14:06:54 +0530
Message-Id: <20230224083701.2657063-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62d.google.com
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

ACPI needs OEM_ID and OEM_TABLE_ID for the machine. Add these fields
in the RISCVVirtState structure and initialize with default values.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c         | 5 +++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b81081c70b..4118d28468 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -49,6 +49,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
+#include "hw/acpi/aml-build.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1521,6 +1522,10 @@ static void virt_machine_init(MachineState *machine)
 
 static void virt_machine_instance_init(Object *obj)
 {
+    RISCVVirtState *s = RISCV_VIRT_MACHINE(obj);
+
+    s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
+    s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
 }
 
 static char *virt_get_aia_guests(Object *obj, Error **errp)
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index b3d26135c0..6c7885bf89 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -56,6 +56,8 @@ struct RISCVVirtState {
     bool have_aclint;
     RISCVVirtAIAType aia_type;
     int aia_guests;
+    char *oem_id;
+    char *oem_table_id;
 };
 
 enum {
-- 
2.34.1


