Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BACA36A7D5E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:12:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXezJ-0003oO-UI; Thu, 02 Mar 2023 04:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezI-0003nv-Ar
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:12:32 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezG-0004f0-KR
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:12:31 -0500
Received: by mail-pl1-x632.google.com with SMTP id i10so16853186plr.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=htx3L8ZbFkDG8vcCbUENB0v9bNbIA+8lPNiDX6BMsUg=;
 b=L6sTebMmYTUfotey2/8yasV2QFgl0eTwM2183ddq/MF0awEhL1ksIQOvBPZGv62TIa
 A+z6epCMdCN3aInfHbNNGBHo41of278kbKfS6eeWTt3KDHswVxoTov//jjiebrep7+OB
 mHdbQv3hI4l7LgeKj6KJq6mEMyQ1UXSF7tfjd9xN/Ra0LCeCUyQVnX6I5/KDXDF9cjsX
 /KKFoKI+wvYdrD2NqwGLOyfCXZq6kbcrYTvy7AgpakmUpwelikep9C9JIQN73coJL8Me
 DoryBvOwadypYEE88qG9u5bT1hEILhfQsJLBflby9/w2hzg7O5MZcMTF8XwrgGHv1KPd
 T5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=htx3L8ZbFkDG8vcCbUENB0v9bNbIA+8lPNiDX6BMsUg=;
 b=l3JkTcCZGmEJiJtx4gzlGUDtcwNxHZiYgXV90Sr+8TvEaQYcg5nmTVUlFW05TC/VRU
 YFrtIL2TIhQNU1GcvMqrTk8n5Ba1MvAFHHo8fTZ6h8tHFkjDgYyDJ8e/Z4c2D82+VTQD
 g215kdZJk20NQzaYlgkqDMxbHe5bgFk6QgG2BDiE1OA2JSYw5prShT7jrIWvfbREHmzz
 um/sH42jonmcpEfTIKr3oWQZi0QCP2aFWstOJZSMBl7Gue24uroykbyDCqvIpCJADOPv
 rEtSi+pyzEuMud2YVKs4aQOoAlkE7xyfZf/gL3R7GYha0LkXwxv3I7FxOlKIcZrBGfgG
 KkXA==
X-Gm-Message-State: AO0yUKWNTJZHuzGFfE/Lc/fVdj7bJiNH1PBHhjqBYF307BGuJXCr4ZDR
 13gWm72l61tPFf6Z8GEDDxxjYg==
X-Google-Smtp-Source: AK7set/E/tUUUqo4m7aHt2ksKjq/z/V7sbCQz7zdjdIjp7ufdjVBVO8eE5vA1pSK85JeSEPWqiIDfg==
X-Received: by 2002:a17:902:dac8:b0:19b:110d:28dc with SMTP id
 q8-20020a170902dac800b0019b110d28dcmr11978626plx.19.1677748349247; 
 Thu, 02 Mar 2023 01:12:29 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:28 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>,
 Bin Meng <bmeng@tinylab.org>
Subject: [PATCH V5 1/8] hw/riscv/virt: Add OEM_ID and OEM_TABLE_ID fields
Date: Thu,  2 Mar 2023 14:42:05 +0530
Message-Id: <20230302091212.999767-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302091212.999767-1-sunilvl@ventanamicro.com>
References: <20230302091212.999767-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x632.google.com
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


