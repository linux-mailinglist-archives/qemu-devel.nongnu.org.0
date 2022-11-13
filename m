Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CE7626ECE
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Nov 2022 10:53:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ou9e3-0007yC-Oh; Sun, 13 Nov 2022 04:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ou9dz-0007xf-Rq
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 04:51:16 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ou9dx-0002Fk-N8
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 04:51:15 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y203so8557557pfb.4
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 01:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AkagvRNM2J34Ga6fjHOQEzCmKEUHxiFn0Qn5xF+tM+s=;
 b=Bwj5G0XJcUjS6n3xzPq48aCuhaLwp1YTjckFuFaFLpAYr9Y/slGdQYn0aKqE7ja6l3
 9wMXwzTcnhtHEdmObc7RWrqRkDk7zKXhAY5zlJoGkWl/6ncTxdOQ1QLkl+LmmUU0MkSf
 UMyx/CVBS66DmNueJbEgGcDaNJhI1zkrwU/1QoMETLg6FSUmjt318Sj8onwx9DscWZL7
 9Nq5w6Sej9CZChqz9yOcAm0jReH/eNPZLtGeP3mvQ5m0ttP59H36VYDHbIeOYaA7uP7U
 fZqhdhb+O6PczRB0wgMMuevyjsPUKApUm6mQJrBBljJ0az1acbZ3q7i+Eras7G3t8VVc
 kPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AkagvRNM2J34Ga6fjHOQEzCmKEUHxiFn0Qn5xF+tM+s=;
 b=0HBKxSoD9l9K5VjSiOhXIEFa1mfQ/+wdGyhQBS/nBo0s0Fx6JKIJem4DvHoBpFOxyD
 2KqgwYpDjNsKmtTNpLJPpsqK/CdLJzha2RGnAifJ2c2RALEmaUi6iXZUvZNf3hDUdAEF
 S3It8sA5iuvoqb9WhhtcB70ytaFBEjUu3EnWhyR4M3HRjF5P50uAKAJeu359jnN4AXLz
 w9gKWZ3ZxP5mKO7IEUBt8AmarPCCUpZ91w04qF/xuI180kuhl5gdHuZNxKx0FL9vZNVL
 LM4gJTinHOeAaHR84jPi2PnBSFevOxCoJHq7khHJEWfQWdLCLSkffuZh/xUHnNskQ0Bb
 GcuA==
X-Gm-Message-State: ANoB5plptrlQZcA+Wp3PZK80lq1rC5W1xsjnED/Az+JRutbkOF9+9uVY
 bmeeGP+07KTH+7udIg6+A6xs/OuB08vxnQ==
X-Google-Smtp-Source: AA0mqf7pDh4A+deWDjqRCTuM2KxDuFe0zsIGcztgYcLZbFOikp3vud7nqSoJ2nsWzftII+ANBFakeA==
X-Received: by 2002:a63:d704:0:b0:46e:9363:d96e with SMTP id
 d4-20020a63d704000000b0046e9363d96emr7943380pgg.85.1668333070907; 
 Sun, 13 Nov 2022 01:51:10 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a170902da9000b001811a197797sm4880802plx.194.2022.11.13.01.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Nov 2022 01:51:10 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v2] hw/riscv: virt: Remove the redundant ipi-id property
Date: Sun, 13 Nov 2022 01:51:01 -0800
Message-Id: <20221113095101.3395628-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42d.google.com
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

The imsic DT binding[1] has changed and no longer require an ipi-id.
The latest IMSIC driver dynamically allocates ipi id if slow-ipi
is not defined.

Get rid of the unused dt property which may lead to confusion.

[1] https://lore.kernel.org/lkml/20221111044207.1478350-5-apatel@ventanamicro.com/

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 hw/riscv/virt.c         | 2 --
 include/hw/riscv/virt.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a5bc7353b412..0bc0964e42a8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -546,8 +546,6 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
         riscv_socket_count(mc) * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    qemu_fdt_setprop_cells(mc->fdt, imsic_name, "riscv,ipi-id",
-        VIRT_IRQCHIP_IPI_MSI);
     if (riscv_socket_count(mc) > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
             imsic_num_bits(imsic_max_hart_per_socket));
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index be4ab8fe7f71..62513e075c47 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -93,7 +93,6 @@ enum {
 
 #define VIRT_PLATFORM_BUS_NUM_IRQS 32
 
-#define VIRT_IRQCHIP_IPI_MSI 1
 #define VIRT_IRQCHIP_NUM_MSIS 255
 #define VIRT_IRQCHIP_NUM_SOURCES VIRTIO_NDEV
 #define VIRT_IRQCHIP_NUM_PRIO_BITS 3
-- 
2.25.1


