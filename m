Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232496874B4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 05:54:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNRaX-0004Qt-OZ; Wed, 01 Feb 2023 23:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaO-0004OH-Dp
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:37 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaM-0001CL-19
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:35 -0500
Received: by mail-pj1-x1035.google.com with SMTP id m11so861498pji.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 20:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vkbdYSdTPAunD7cPLxq7KYAERY/Wq71c7F7Rn6sHgkM=;
 b=fg6kq5z/gbMFstiS9vd+MpqA6TXfLy3ZCY0SKqkT8T6sBVxXeyJWIPCk5v3uUC6qwA
 d0MISL7T+NtzNEA0Jd5Xin3UyB33To7OPXHCuBYc21jAiEcQVBNbD8aRwDzMnnlpaAOe
 2l/YPq8TZF7DO+dsNrJGeXq226EfHVxbQlA9cEecmHZNE87k4I6nVVavgRRy/ClaWlHu
 42lgfz5FOSylu/WMsufb7V64ntVkbSOvvOFhSsT5uIUSONB5EIOyMmgLXUvuR37nfLEW
 Aqj1e1FKepzne/CRbMHU/UTq/vGkfXDYeNhX7feBT6cNUNOZnQyv6V8wX1CXgeNuCNC2
 xkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vkbdYSdTPAunD7cPLxq7KYAERY/Wq71c7F7Rn6sHgkM=;
 b=hcqg8pa8Zz1NTOEFzXsRA7TjkkEYOxzUEhitU+LjGqqLQPYrgJz2qLSX0Cix0ZvHzj
 zg03YI3YOBWISdqPwk6frFLX5M4TIT1KzM7XZhQ2KCO+FNDhjHFcXVmAhqwzBhkwqshq
 3owi7GF4o7UYBRAzNkUv7O0syJwrrwTapNRjfTPekULr8FkA1gpXyznLobx15jvM0w5Z
 WBZE7L3bkRG3QkoqNb47KxMxwQwGNO1IQf3KrX86UuvmR+5IScljXK+4w8rjjdfMfVH3
 TdO6roTiVpaQNit8b2hGn28Ke0ylRiYcBCTZPOX38CaEqu4qbDEJ9KCATXWJyndQQ1VI
 sDkg==
X-Gm-Message-State: AO0yUKXl5SoQKAF4sdq+bbob5ZLQKs2SOM+rvGgRMu0rDPadFuelz/HF
 qiRTkF2cbqHs1QZ47DSpMvpvDw==
X-Google-Smtp-Source: AK7set8/vfPsKeFuytlbV/xCbo1GyWt9cj1LAVaYxFz9rA1U9zKvyjd1+zOzOr3a4kZ51Cqg/JKtRQ==
X-Received: by 2002:a17:902:e742:b0:196:7103:259f with SMTP id
 p2-20020a170902e74200b001967103259fmr6567627plf.7.1675313552705; 
 Wed, 01 Feb 2023 20:52:32 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:32 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 01/10] hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
Date: Thu,  2 Feb 2023 10:22:14 +0530
Message-Id: <20230202045223.2594627-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1035.google.com
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

ACPI needs OEM_ID and OEM_TABLE_ID for the machine. Add these fields
in the RISCVVirtState structure and initialize with default values.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 4 ++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a061151a6f..7ad9fda20c 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -49,6 +49,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
+#include "hw/acpi/aml-build.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1512,6 +1513,9 @@ static void virt_machine_init(MachineState *machine)
     }
     virt_flash_map(s, system_memory);
 
+    s->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
+    s->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+
     /* create device tree */
     create_fdt(s, memmap);
 
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
2.38.0


