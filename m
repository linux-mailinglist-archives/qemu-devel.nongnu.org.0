Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EC0694857
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:42:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa1F-0006im-TH; Mon, 13 Feb 2023 09:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa16-0006RL-QH
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:41:17 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa15-0005Ve-Cb
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:41:16 -0500
Received: by mail-pl1-x630.google.com with SMTP id ja21so6107826plb.13
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L39PhdXfC8+RktTLziyz2PO6qwKRkojAvf2ARDN/TAM=;
 b=B2P4wBxwRJbjRSe3XH2Dr9Aw2E//SDmFQrkz8VnmUQ0knOfkFYYu/Kq3bwzaoayIbx
 sJwPR7D3DayCUaScw20vzaUFg5KAqcAQyvR95sGEfWD+65MphN33LxzMCpvlGtFJi4Os
 eyqk4kQq26C351bOWgQYkinFttYnxqCVWmZ5l7PwU53wqHhuzUQzOWuLMCS3JKDnie4N
 HC+//PKytHbh2U/yivM2BazU8c8MsS5HL+ElES9b4j7GvWWevnjqPNK8MJsflENpbVWW
 7HGYc9E43j2n8xGKzHVdg1TywtHv2w6WM/WHin06aw57V/uAFgGF6uaBz5bca7nkyfEL
 nKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L39PhdXfC8+RktTLziyz2PO6qwKRkojAvf2ARDN/TAM=;
 b=3/rc37AOZDeSvnd4hgmjquhPIVplC2UpOF9BEJBPZl8LGvQjGXoRvVW/hO2HDWMENk
 cQA9oCZPOJYs9Pq4Nlzpw+sqg2+zoXJK95KUNDC1GvJbfKDkioe906nOU2lArHxOjTXT
 kxjMoDgMZYnYiCVwU8jSJYXJu11+MWavhtqwS4Gn0nbRDE6Vr9q5akmn6/rWO0Wa8p0L
 iSzWk1Bke3DOd1sqHfVGGVEg2zzNmFkjYGhjQ73RA5RQ4r4SwrCQaCWdt1883zNHDqaj
 96PsVCfIk4dhY+3cwkLx4lb+txFg6v6FnM825huEPjuEmpgV/rx9Q3JybeFapo1/njhM
 y+0w==
X-Gm-Message-State: AO0yUKWO/Guom8JVWMYcrraojqFkqelmknMjRTG4PP1pvtUq9R5N8NSM
 spx9PKFnYX6geU1mrS7MnPpQNQ==
X-Google-Smtp-Source: AK7set8rDmutL1lEcAC8xb2+4yOwRthmMcdRUH6Zcdm7oT6wSrF3ehlrTiF/2ObwuplT8X3htG1mdg==
X-Received: by 2002:a17:903:1390:b0:19a:84db:76ed with SMTP id
 jx16-20020a170903139000b0019a84db76edmr6508715plb.15.1676299273529; 
 Mon, 13 Feb 2023 06:41:13 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:41:13 -0800 (PST)
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
Subject: [PATCH V2 09/10] hw/riscv/virt.c: Initialize the ACPI tables
Date: Mon, 13 Feb 2023 20:10:37 +0530
Message-Id: <20230213144038.2547584-10-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x630.google.com
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

When the "acpi=on", ACPI tables need to be added. Detect the option
and initialize the ACPI tables.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
 hw/riscv/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 5017ba62ec..43c201c8cf 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1316,6 +1316,10 @@ static void virt_machine_done(Notifier *notifier, void *data)
     if (kvm_enabled()) {
         riscv_setup_direct_kernel(kernel_entry, fdt_load_addr);
     }
+
+    if (virt_is_acpi_enabled(s)) {
+        virt_acpi_setup(s);
+    }
 }
 
 static void virt_machine_init(MachineState *machine)
-- 
2.34.1


