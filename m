Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B68481C5B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 14:07:53 +0100 (CET)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2v9s-0007N3-EZ
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 08:07:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ugC-0004uK-Qs
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:37:12 -0500
Received: from [2607:f8b0:4864:20::534] (port=33464
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ugB-0003Wg-AK
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:37:12 -0500
Received: by mail-pg1-x534.google.com with SMTP id 7so8677860pgn.0
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 04:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ba+tzdtFHkcsjjcU0If6YzKpfeahDC/ZvvxeQqTk1fU=;
 b=OXtMeouxigNm1ThXSWWtgDgKPSCOjChpBvq0QyvZEDuoxkMKtrBQAG7Hvo4XAC4uLZ
 EUHgorH/8I+0a+TyMd+JgAJWro73V1JJfgkhViNFlIp9Yr4FeOzwBDr8jj9AD9pEMhMd
 mxqYwBFvHLOMLrcI2eIu+fTZR88AzU39C5GlvweVuBXQJlGOlPLvOydqgfcbzbPglEbn
 SzF5EGIirtidGmRevuWmFfb/cc1c9L3pdPRisw9gbOynaTENbucCH/QDSm4KBcLvFe1d
 3J3aPOQk+34K4H7ymAHrsNM/NaLwbMc8ayCcWFSQeKvPYyRTjujvyIdzW7dwqXKlAXrV
 qUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ba+tzdtFHkcsjjcU0If6YzKpfeahDC/ZvvxeQqTk1fU=;
 b=JIHFv8Oe0+aXSiC11YSdq7mZMYZAqzeMDqgATQBbMJHADWfnSg9m9yDdbf3SLxKaxx
 aKfZTZ8zLH/s0xvrUIl0DAmZLCsqIqbC8x4QFediaJnmIS0FtCHB0yqMrBuYhwXhf4mb
 7ROKlJKCjHXxYXefodjWR+92RIXw2hadA9P2SDrRKqZdqlpYTMZjfmbWL4RKGUUYVcO9
 B9CxqJjQ1XoEQXY2OkDghxB0cSll/syRAWkHRnI6+zQ/QVVdgX1OnASHKxgiWx4K82Sl
 XF20+/Tc/nDL7WpUxvm0oV/6q34qJk+YPXYrUX9xpuEHNLaWCoReG8QrEkT+dOuLLJ8r
 7arg==
X-Gm-Message-State: AOAM531cbU7lNuNVmMtpSLw3puGFXTjUmdGwS6eZ27i5Js/5TG/7hJSf
 4idNuAdz4QEv/dx8wFeH9Ynt+A==
X-Google-Smtp-Source: ABdhPJzRs5T5PfWaGR+h9fMG34gOOXKE9jH+/0HPBLtEYtwOrmNt67rle1vAJuVYquwqy62gyNJ/kw==
X-Received: by 2002:a63:354c:: with SMTP id c73mr27248603pga.532.1640867830026; 
 Thu, 30 Dec 2021 04:37:10 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:37:09 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v6 23/23] hw/riscv: virt: Increase maximum number of allowed
 CPUs
Date: Thu, 30 Dec 2021 18:05:39 +0530
Message-Id: <20211230123539.52786-24-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Anup Patel <anup@brainfault.org>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Atish Patra <atishp@atishpatra.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

To facilitate software development of RISC-V systems with large number
of HARTs, we increase the maximum number of allowed CPUs to 512 (2^9).

We also add a detailed source level comments about limit defines which
impact the physical address space utilization.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
---
 hw/riscv/virt.c         | 10 ++++++++++
 include/hw/riscv/virt.h |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 7579f7b41f..86b03736eb 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -44,6 +44,16 @@
 #include "hw/pci-host/gpex.h"
 #include "hw/display/ramfb.h"
 
+/*
+ * The virt machine physical address space used by some of the devices
+ * namely ACLINT, PLIC, APLIC, and IMSIC depend on number of Sockets,
+ * number of CPUs, and number of IMSIC guest files.
+ *
+ * Various limits defined by VIRT_SOCKETS_MAX_BITS, VIRT_CPUS_MAX_BITS,
+ * and VIRT_IRQCHIP_MAX_GUESTS_BITS are tuned for maximum utilization
+ * of virt machine physical address space.
+ */
+
 #define VIRT_IMSIC_GROUP_MAX_SIZE      (1U << IMSIC_MMIO_GROUP_MIN_SHIFT)
 #if VIRT_IMSIC_GROUP_MAX_SIZE < \
     IMSIC_GROUP_SIZE(VIRT_CPUS_MAX_BITS, VIRT_IRQCHIP_MAX_GUESTS_BITS)
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e12e8ddcae..62d8e9c6d0 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -24,7 +24,7 @@
 #include "hw/block/flash.h"
 #include "qom/object.h"
 
-#define VIRT_CPUS_MAX_BITS             3
+#define VIRT_CPUS_MAX_BITS             9
 #define VIRT_CPUS_MAX                  (1 << VIRT_CPUS_MAX_BITS)
 #define VIRT_SOCKETS_MAX_BITS          2
 #define VIRT_SOCKETS_MAX               (1 << VIRT_SOCKETS_MAX_BITS)
-- 
2.25.1


