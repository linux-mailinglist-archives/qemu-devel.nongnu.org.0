Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68984AA042
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 20:41:27 +0100 (CET)
Received: from localhost ([::1]:52280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG4SU-0001JG-Bz
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 14:41:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2i4-00076x-Up
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:49:25 -0500
Received: from [2a00:1450:4864:20::32f] (port=53038
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2i3-0004Dg-6X
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:49:24 -0500
Received: by mail-wm1-x32f.google.com with SMTP id v129so1524824wme.2
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNnaZkIXpPRbtWA7ShgFZN0d59sV6eg5/LyFV0oNLa0=;
 b=o1vTZQb1W6pI2oM1io+5Q0cnQfHtHOSvaRDCx2qLAop1U5JSME/o776KWwpiNf+Daq
 m++zxRJ5IGdSiq6E5rqo4Gp50Tya6zgeme5eAB5M+q+FaSdn3LhQEz+9dtCpJcFZhDnE
 Rwwes6nj4z+pX9dk5jPf3ZWjAneV/3E4Lu2HkeUYnAaIxJsqbfhdq9nMG+OMsmeqMKBI
 egKrmcpecQJaLWMKeTFlXispjuCm4B8xRk8sNWpwkj9cVGTHTOjtkjZlQvYczzbXGcbt
 Z9beLUqNDK+9UkscByagPCGg6tLaOPJkpILpJ1ktQA9/v+tmaM26HVcvz7jQvjjLs+Rf
 mZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNnaZkIXpPRbtWA7ShgFZN0d59sV6eg5/LyFV0oNLa0=;
 b=uuJcqecBxxO/4L7iUNBFwIvnIiubYBk0189qKnG45iImnnax7F2IOUJlc6o2c9SK7C
 7C9Ell9FgcIYmjX9luXWqgc7PCyL9mYL952HC+JuqbOGhFc9Yker1BhSZCf5oc5oyQ+Z
 y8wqnepVR4YvkVLu07bFlR9MQRV/o0Gohl2FovMsEf6HInn/KUgL0t/RDVh30pokgvCE
 N2X6A9w/b6JvxpUEFA10U+R/v/RJ5AO/WNnxwVaa3zCy1QbeJLJGW04DfzvdjVuMb6Km
 zR2E2e86Y/Tha0Sq+2HktV1K5MC9XxB4GrCu5gfSnvXZTLu6u6cGf7D1XU2fUkbbVs60
 uwkg==
X-Gm-Message-State: AOAM532v3Ito9WGJeSUQ9Opn1vmmHQt+Tm59quRqkr3e/piKVd0ZbHWV
 iHrpzvKVDLQOnN6R3u6e8V0QwA==
X-Google-Smtp-Source: ABdhPJyN2N0SrdjzujgnPFPho1XspbmjTUOq9s4WUxU6GsKU13s5IjLbr2KWlso8BLJ+HbJI34e1hQ==
X-Received: by 2002:a05:600c:2dd7:: with SMTP id
 e23mr3188825wmh.65.1643996961801; 
 Fri, 04 Feb 2022 09:49:21 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:49:20 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v9 23/23] hw/riscv: virt: Increase maximum number of allowed
 CPUs
Date: Fri,  4 Feb 2022 23:16:59 +0530
Message-Id: <20220204174700.534953-24-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32f;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
index dc1b3dc751..367d01d3a9 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -45,6 +45,16 @@
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


