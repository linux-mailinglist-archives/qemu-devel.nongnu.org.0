Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514046AD11B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIwr-0006xG-BX; Mon, 06 Mar 2023 17:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwo-0006w2-HI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:46 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwk-0006rT-Ra
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:46 -0500
Received: by mail-pj1-x1033.google.com with SMTP id oj5so11277431pjb.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140281;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YemHXp4yitN2wSol7YVy8zJZd9cScsdwZhzDdjeY07I=;
 b=jKSdoV3plVihkMrhsB9QCbXTVXtUNiHEmFXMBmA4M4NwXE3Fu6oG3UX1BcTfEEslkR
 FSV+FaqmHdOnBxtmsz99TFZg6uHnTPV5zggCqUA1bEkcbnaac3rNeWS4Vdfa6oZBezso
 7KidFOIWBgeYDniINYLGsIOjazEQR8IWUsmUXCPOq7ZAdXpDhOSkg2Y6OBQ2Ybi3JByE
 dB7mKjZaETKA8QjLxGR9GRuIzwMHk3KNZQ91MW9i545RujwrOglTSGrxUabuxs72K+Ys
 yl0wAKgu2XDa9AdtQ/tZVeYg8zkyzst4QSGNcXLsvvaCpPyhxWpfrdVgNr7rfmC9CYwN
 vpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140281;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YemHXp4yitN2wSol7YVy8zJZd9cScsdwZhzDdjeY07I=;
 b=nE0QcYF0HKTB/Oj7Cpmp+DBhQGy/X6mxqMyM2Z0XvcilN+Ea3oHPkeoreXsYFWVs59
 VE6c2F/nSWqrdbv35ZFHY7+5tbrLlcGWCH95TidMCXVyqEpvJrt7SCNEZVQvP399dbrR
 FNqPsuDqlEN9pC5/M9xA/vPIGfjk1NXAgzqmGH42wR4+AsmT/VKpCwIzRnzGgKYqQwO3
 DHmL/7GRkOkQt7GuJolE10ZFqMsTbcaXFuSBi8m3dY1g8Rm7aQtkVXpMQJ0qEbu2Gll5
 7CUcIAXZLAvo6HLeqpKGjAZ2MfnsT3i5D+eOFfZ5M68diK7Kg5hGAUULXLLb/68MQfZF
 e5wg==
X-Gm-Message-State: AO0yUKWMZxHHmE+w4pqqXnJbAg72gZj4TJE6QtNQPhgVvnVtrcblUXNR
 vgEUMZKKuFhPHiwJPKpM3S+gYg==
X-Google-Smtp-Source: AK7set8LONE2uMQFdjA1tbaUbEntm3mRp2ZO5SxIDW+JfTEH9MAjC9KYaE8+7yj8WE6UezUbOyxxPg==
X-Received: by 2002:a17:902:dad0:b0:19e:baa1:26bd with SMTP id
 q16-20020a170902dad000b0019ebaa126bdmr7601206plx.13.1678140281517; 
 Mon, 06 Mar 2023 14:04:41 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 lc11-20020a170902fa8b00b0019edfeed50bsm84713plb.296.2023.03.06.14.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:41 -0800 (PST)
Subject: [PULL 15/22] hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
Date: Mon,  6 Mar 2023 14:02:52 -0800
Message-Id: <20230306220259.7748-16-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Sunil V L <sunilvl@ventanamicro.com>

ACPI needs OEM_ID and OEM_TABLE_ID for the machine. Add these fields
in the RISCVVirtState structure and initialize with default values.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-ID: <20230302091212.999767-2-sunilvl@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/virt.c         | 5 +++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 26eb81d036..5a059489b5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -49,6 +49,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
+#include "hw/acpi/aml-build.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1528,6 +1529,10 @@ static void virt_machine_init(MachineState *machine)
 
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
2.39.2


