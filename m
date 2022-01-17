Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F65490AF0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 15:58:14 +0100 (CET)
Received: from localhost ([::1]:36796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9TSX-00029l-6i
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 09:58:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5z-0001V1-Fy
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:52 -0500
Received: from [2607:f8b0:4864:20::636] (port=34447
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9S5x-0001Dm-Uf
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 08:30:51 -0500
Received: by mail-pl1-x636.google.com with SMTP id a7so18487610plh.1
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 05:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OA9iVC50Z2hglMsbE8CcBP//fPzwzBLuLEryH2NJpNY=;
 b=ESDJM+V+pgLGt62npXJlUYSMR6vAeifl7hCVC4jpvqly6p/aSd1w1BmrCXMD0gMgc5
 OeZr/G/RgFQ1CH80JYhhCP+0O2ifbFonb1t//XS+hzNoNEwZLLULoqarxHQUv6DwSUN2
 p9zv+bZyGHcuozgZWqLJlF76V9oPJKED3ZbpdWacDCO/4TBCkjEDiTio3/Uh6n+AWjJu
 2wH5T61+Ryz3AicFN8ZZ9mH+BPNsu8wSWxpvZzeasSy64Ln2oFeiGjLzvwttip9hWm/m
 0OZWLBkHVmrMgzygJa3c3pa935ArcWXjMObbace8KTzrDGi/aCiYCNL2QcBtLfbOp+hW
 z87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OA9iVC50Z2hglMsbE8CcBP//fPzwzBLuLEryH2NJpNY=;
 b=7bu3egB8RXVkdQnqYlllu2OVK8d3YaZopPwtdWSgBjyA7x0QlyovdTM6hQUG65rmQg
 s3E0UDORWXGvKTqyBw1f7pb2gmTfui4XI47EnRcqtBCbf5Vr86QnL1Mjv9HoNkJE0GcH
 LAnNJJBy495MWuwfEnZmfmjCNzg7wzmMkykA6fYiETncEjL9zkcvJpmM7OzU0HYL0f1t
 iVBed2SmrynUJ3VktpFFLvm2FsgfxrPaGoFdIPYuN8oL8lGbkysI7qtz7AWZSgCtbWyU
 G0p8IZlML313bpSw/8mA2th9gpU5/OpPgH6T8vrjcBzQPIsDKIWwkNzD0djgFbr7AXUt
 vE4w==
X-Gm-Message-State: AOAM533KWZnxx6pSDw5nU+VVInBO1oyOpiFNglIUvM3oewpR0kSQFZWW
 2Mnjov2G17/rWVKGjDCt9cxxdQ==
X-Google-Smtp-Source: ABdhPJwgLuTzNbJiKYNT3zQSHCvnRsXw3WgP5W1vysBauUI0uuV4rTVfEEyfRDR10atwroLck5j59w==
X-Received: by 2002:a17:902:c106:b0:14a:7c95:1b0 with SMTP id
 6-20020a170902c10600b0014a7c9501b0mr21768265pli.112.1642426248656; 
 Mon, 17 Jan 2022 05:30:48 -0800 (PST)
Received: from localhost.localdomain ([122.179.70.109])
 by smtp.gmail.com with ESMTPSA id 7sm9532607pfm.25.2022.01.17.05.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 05:30:47 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v7 23/23] hw/riscv: virt: Increase maximum number of allowed
 CPUs
Date: Mon, 17 Jan 2022 18:58:26 +0530
Message-Id: <20220117132826.426418-24-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117132826.426418-1-anup@brainfault.org>
References: <20220117132826.426418-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

To facilitate software development of RISC-V systems with large number
of HARTs, we increase the maximum number of allowed CPUs to 512 (2^9).

We also add a detailed source level comments about limit defines which
impact the physical address space utilization.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 hw/riscv/virt.c         | 10 ++++++++++
 include/hw/riscv/virt.h |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 73b2be7b60..f9cf7551b4 100644
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
index 7898c574af..78f450eb60 100644
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


