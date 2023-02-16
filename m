Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45643699A56
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:42:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShKH-0004DK-Tc; Thu, 16 Feb 2023 11:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKF-00043F-T8
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:41:39 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKC-0000V8-Td
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:41:39 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 r9-20020a17090a2e8900b00233ba727724so6268781pjd.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=htx3L8ZbFkDG8vcCbUENB0v9bNbIA+8lPNiDX6BMsUg=;
 b=OFI2IffIzxCoqGS4LvEtnKA2Klq6cxNbLKMs2DQw5EF/TX2wApZfGVAxa/8SakldiS
 +DvvhkMrzqAvs56bV9rCwhcAVN9Ze9xLOoETSx15Ei1ar4ijYuCUmz9kEeGkbrc2Wl0J
 GvGeZylEyokGrFq+TGrQj16e2ZZ5+FfAVwNJrp5HmciV1+/70cZhalzjmVZd8L5kNYpP
 oPdRsHYSS5EP59gXFpzFzVESbW+8O2it+1hNN4kJEWceTR9Vof2RnhFnGi/Le/0zjq2t
 t8WgoUqxRVwVvo3Wrawe6m5ZBdsUvsOJtXsm2jOf0dFdd5stBe5F3hSWCNNqNMlhr/Qr
 uOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=htx3L8ZbFkDG8vcCbUENB0v9bNbIA+8lPNiDX6BMsUg=;
 b=ar17EQLj9pXKILTrFzOEY0oW4MXerO0eEUVtQ+d5ppFA5j5+Y6el+TQUE6HoZfzFG6
 yz7cJ4tpkoF2Hp3tX4B4EaY2P9ahcmPbJOZI5p0nwJb3o0cDc7suoNh3+f3NwDGnfUtq
 6qK6vQ0T5Zk4jGYXv2CxwUCZaETML7KEEqDheO8MDA9A5Qqb76+SA7gnv7ADI2YR5gE/
 I/+ad6dVI9Ntx6OzZajgJJoOsi37U4uT940YetsHLWSqxdQ0kqaAL7gNXwYJl5+yBajN
 yrF+ttp/3aHV3iOmtVrc+uOdyug8r1csDk2AGdnLLMijw3k9IJpNGg4EXq6Hn9+PFV3p
 j2Rw==
X-Gm-Message-State: AO0yUKUOF5uq66mrjo0IzIjyGSWlIBZXr9ANhtgsO8SGhZbRehLXM75j
 s4obfsb6mmEGPZjY2YEUMKmPW16kHbmloTuy
X-Google-Smtp-Source: AK7set94vGJbfZWgGAtMv9FYssmjlDYOut6x3ozSPy5Jws3n82X0wXiz5NqjDqsEbkkfrRYl1eEw+w==
X-Received: by 2002:a05:6a20:231a:b0:c1:344c:668f with SMTP id
 n26-20020a056a20231a00b000c1344c668fmr4187355pzc.12.1676565695568; 
 Thu, 16 Feb 2023 08:41:35 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 q20-20020a638c54000000b004fbd10af99asm1385243pgn.60.2023.02.16.08.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:41:35 -0800 (PST)
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
Subject: [PATCH V3 1/8] hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
Date: Thu, 16 Feb 2023 22:11:18 +0530
Message-Id: <20230216164125.1945633-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1031.google.com
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
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt.c         | 5 +++++
 include/hw/riscv/virt.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 86c4adc0c9..1621278eb8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -49,6 +49,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
+#include "hw/acpi/aml-build.h"
 
 /*
  * The virt machine physical address space used by some of the devices
@@ -1513,6 +1514,10 @@ static void virt_machine_init(MachineState *machine)
 
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


