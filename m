Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE7B493E91
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 17:48:54 +0100 (CET)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAE8j-0005UB-9M
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 11:48:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACsk-0000F0-UE
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:28:18 -0500
Received: from [2607:f8b0:4864:20::52e] (port=46872
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACsi-0000cG-KH
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:28:18 -0500
Received: by mail-pg1-x52e.google.com with SMTP id i8so2903091pgt.13
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 07:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QNnaZkIXpPRbtWA7ShgFZN0d59sV6eg5/LyFV0oNLa0=;
 b=UhhpufcFiTsjGkaf9Aehzf5nJyjFzhqk04K6V/6MnGgKeFDQVfiqDquSnJHQFvN77a
 6VCAd6gL07fXWDXwi6BTWjGRlO/jlefR1z/YBYILCLJCCAwMLuHS6UPQEFhA3+bcVIFV
 3fKmFSzYr/L5EuoBiuwntPpR6KIidGPUIVGYa5l4K54OY6NaKN45k6+hmpAyyPsGTgD5
 ayli297kcGhM8x43KmmGZQNwBeTCMULLJex2GSI/aAuRyro4W8GXHmn+WB9dtUTPakUV
 Pb/5JhAAJvJPOXdwxjMNtKCksKWjLAoPF906yI8lSBCPBXqSm9aAk1LjetPzraKyu7BL
 Pblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QNnaZkIXpPRbtWA7ShgFZN0d59sV6eg5/LyFV0oNLa0=;
 b=cAeFfc8CxCZAfBA+wydyEN3Rroodm8yq6HuzWw/k+jDoXZHR+wTGdX0JU1BXffgXwC
 DpxtOBOQMS4mtTMQBw7sdaBRsOJjF3gB5O6wI3w1bvvxZPbEUcknz9s4YmY2U7vCI+Qp
 CI9P+cSsqWbvBtfl0hrFjnEgQVCyGb9E//GAxm2mXkg8MYdl8lPx1ID0q9uo9KitKFD3
 R6AwC2X1jFoI+LNqJQcMlJARUpkI5ZLZjr89grJhLRKC43bNg8OA2FDMVJiMMKjhdXmz
 hQjj/3J9BN8mZZra0VrcOSd+2QZh2px2M0dLGGmRI1LK2DPm5IcDMB3mjs56OdRDTYn9
 IV8w==
X-Gm-Message-State: AOAM533KK1w+WU2XEKOX+nUiqOgXbbmRmcg2DyPBY041N8o4CB9SICJA
 SDhH0/px2dnBImeOAz22ekiQug==
X-Google-Smtp-Source: ABdhPJzp70PFm3IaIRZC7Ire17OPWuiOsb1tBOgg1BLLgMPHbvxX4FfL+Nxv+7Qu3nbFyc1yCy9MTw==
X-Received: by 2002:a62:f80d:0:b0:4c1:1262:ea00 with SMTP id
 d13-20020a62f80d000000b004c11262ea00mr30875215pfh.53.1642606095391; 
 Wed, 19 Jan 2022 07:28:15 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:28:14 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v8 23/23] hw/riscv: virt: Increase maximum number of allowed
 CPUs
Date: Wed, 19 Jan 2022 20:56:14 +0530
Message-Id: <20220119152614.27548-24-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x52e.google.com
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


