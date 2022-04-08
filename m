Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D54FA4F9812
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:30:31 +0200 (CEST)
Received: from localhost ([::1]:47874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpd8-0000Zy-1K
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPO-000713-Qh
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPM-0002Lp-Iu
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:18 -0400
Received: by mail-wr1-x434.google.com with SMTP id m30so13112089wrb.1
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RUqo09ErOg1M6skc6e7vosGnWtwA6stMdKCkU3VyoI4=;
 b=pLVIREd6B5uU6e0heXWkw8w7cPmL0ysgt+LNIjzTRKa1OrmHhAEN5uFCt22+tMurOR
 RoRttUgDnQgiovgbNMM/5aqp1Y8Mh2TlUlv8KNkWcangNs9NYELeKbvqEmhllF8i/KbH
 JFmmCx5h+HxuqjwFfNRr0eY/YduvxfHgeIF1uSzhk+KBJbamcXd5QMlW5Fw8F5JEHE99
 M4mlSd2evXK7WIYnFANA3oZ748+VZ6Iagst9tR/GWKvArdb6tFpD5gWiTCp90Aeltpgk
 +cwVpZR0gU7P+NnErcrHwLBNndc9AfOCAzeGThqx7/LPpBI1x9b5dgIJfqBmz3qt3fT1
 vPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RUqo09ErOg1M6skc6e7vosGnWtwA6stMdKCkU3VyoI4=;
 b=bLXEfbQKd7IjEvqEZs3lQMP0zJOy6RgKe/6YAIoh8Lmd+uAGTNiCaRftJNsz1xWa5o
 CRxb/d3MJUtx9QohaE9Hve/3LKUGwX84UDrd9XMeO2AEzhhdRVjK0aNOZIxYVtMiBX3A
 1CHRMPXmfOlK4NNVyQP7FwKoLGZ6ORC79jSTK/NLXnArfGLC2grOMmp69QzDH1VVgT0r
 FKIoeUNyV4KVTHZga9AGedKLk6N8NHTLGB7TBIN4kRIhjXFF5gCElUUL6k+sj6Krr/WL
 KlTK828aETFn7us2/FxPCZGxLmps8lQJlQbNxWh/IjPpr2DB+hHcWq2XmEI/VfFLxasz
 uFjA==
X-Gm-Message-State: AOAM530u6kNZvmkKP1gnaCvnL/Luc86gy8cFvxcLqVBsIReR0aBQAQ0v
 Z7MKrcTaae8ellBayyHKIzfHkQ==
X-Google-Smtp-Source: ABdhPJymaXC9uwyKyLqH7Sg2/gKGyjgXHrujt6m+OUCHQC3KvqJxP7ZjbC7ZFWB9bZpOeZKhcC2qRQ==
X-Received: by 2002:adf:ce83:0:b0:206:c45:62bd with SMTP id
 r3-20020adfce83000000b002060c4562bdmr14265666wrn.97.1649427375057; 
 Fri, 08 Apr 2022 07:16:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 23/41] hw/intc/arm_gicv3: Implement new GICv4 redistributor
 registers
Date: Fri,  8 Apr 2022 15:15:32 +0100
Message-Id: <20220408141550.1271295-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the new GICv4 redistributor registers: GICR_VPROPBASER
and GICR_VPENDBASER; for the moment we implement these as simple
reads-as-written stubs, together with the necessary migration
and reset handling.

We don't put ID-register checks on the handling of these registers,
because they are all in the only-in-v4 extra register frames, so
they're not accessible in a GICv3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
GICv4.1 adds two further registers in the new VLPI frame,
as well as changing the layout of VPROPBASER and VPENDBASER,
but we aren't implementing v4.1 yet, just v4.
---
 hw/intc/gicv3_internal.h           | 21 +++++++++++
 include/hw/intc/arm_gicv3_common.h |  3 ++
 hw/intc/arm_gicv3_common.c         | 22 ++++++++++++
 hw/intc/arm_gicv3_redist.c         | 56 ++++++++++++++++++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 9720ccf7507..795bf57d2b3 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -77,6 +77,7 @@
  * Redistributor frame offsets from RD_base
  */
 #define GICR_SGI_OFFSET 0x10000
+#define GICR_VLPI_OFFSET 0x20000
 
 /*
  * Redistributor registers, offsets from RD_base
@@ -109,6 +110,10 @@
 #define GICR_IGRPMODR0        (GICR_SGI_OFFSET + 0x0D00)
 #define GICR_NSACR            (GICR_SGI_OFFSET + 0x0E00)
 
+/* VLPI redistributor registers, offsets from VLPI_base */
+#define GICR_VPROPBASER       (GICR_VLPI_OFFSET + 0x70)
+#define GICR_VPENDBASER       (GICR_VLPI_OFFSET + 0x78)
+
 #define GICR_CTLR_ENABLE_LPIS        (1U << 0)
 #define GICR_CTLR_CES                (1U << 1)
 #define GICR_CTLR_RWP                (1U << 3)
@@ -143,6 +148,22 @@ FIELD(GICR_PENDBASER, PTZ, 62, 1)
 
 #define GICR_PROPBASER_IDBITS_THRESHOLD          0xd
 
+/* These are the GICv4 VPROPBASER and VPENDBASER layouts; v4.1 is different */
+FIELD(GICR_VPROPBASER, IDBITS, 0, 5)
+FIELD(GICR_VPROPBASER, INNERCACHE, 7, 3)
+FIELD(GICR_VPROPBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_VPROPBASER, PHYADDR, 12, 40)
+FIELD(GICR_VPROPBASER, OUTERCACHE, 56, 3)
+
+FIELD(GICR_VPENDBASER, INNERCACHE, 7, 3)
+FIELD(GICR_VPENDBASER, SHAREABILITY, 10, 2)
+FIELD(GICR_VPENDBASER, PHYADDR, 16, 36)
+FIELD(GICR_VPENDBASER, OUTERCACHE, 56, 3)
+FIELD(GICR_VPENDBASER, DIRTY, 60, 1)
+FIELD(GICR_VPENDBASER, PENDINGLAST, 61, 1)
+FIELD(GICR_VPENDBASER, IDAI, 62, 1)
+FIELD(GICR_VPENDBASER, VALID, 63, 1)
+
 #define ICC_CTLR_EL1_CBPR           (1U << 0)
 #define ICC_CTLR_EL1_EOIMODE        (1U << 1)
 #define ICC_CTLR_EL1_PMHE           (1U << 6)
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 40bc404a652..7ff5a1aa5fc 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -179,6 +179,9 @@ struct GICv3CPUState {
     uint32_t gicr_igrpmodr0;
     uint32_t gicr_nsacr;
     uint8_t gicr_ipriorityr[GIC_INTERNAL];
+    /* VLPI_base page registers */
+    uint64_t gicr_vpropbaser;
+    uint64_t gicr_vpendbaser;
 
     /* CPU interface */
     uint64_t icc_sre_el1;
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 18999e3c8bb..14d76d74840 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -144,6 +144,25 @@ const VMStateDescription vmstate_gicv3_cpu_sre_el1 = {
     }
 };
 
+static bool gicv4_needed(void *opaque)
+{
+    GICv3CPUState *cs = opaque;
+
+    return cs->gic->revision > 3;
+}
+
+const VMStateDescription vmstate_gicv3_gicv4 = {
+    .name = "arm_gicv3_cpu/gicv4",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = gicv4_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(gicr_vpropbaser, GICv3CPUState),
+        VMSTATE_UINT64(gicr_vpendbaser, GICv3CPUState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3_cpu = {
     .name = "arm_gicv3_cpu",
     .version_id = 1,
@@ -175,6 +194,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     .subsections = (const VMStateDescription * []) {
         &vmstate_gicv3_cpu_virt,
         &vmstate_gicv3_cpu_sre_el1,
+        &vmstate_gicv3_gicv4,
         NULL
     }
 };
@@ -444,6 +464,8 @@ static void arm_gicv3_common_reset(DeviceState *dev)
         cs->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
         cs->gicr_propbaser = 0;
         cs->gicr_pendbaser = 0;
+        cs->gicr_vpropbaser = 0;
+        cs->gicr_vpendbaser = 0;
         /* If we're resetting a TZ-aware GIC as if secure firmware
          * had set it up ready to start a kernel in non-secure, we
          * need to set interrupts to group 1 so the kernel can use them.
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 9f1fe09a78e..c310d7f8ff2 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -236,6 +236,23 @@ static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
     case GICR_IDREGS ... GICR_IDREGS + 0x2f:
         *data = gicv3_idreg(offset - GICR_IDREGS, GICV3_PIDR0_REDIST);
         return MEMTX_OK;
+        /*
+         * VLPI frame registers. We don't need a version check for
+         * VPROPBASER and VPENDBASER because gicv3_redist_size() will
+         * prevent pre-v4 GIC from passing us offsets this high.
+         */
+    case GICR_VPROPBASER:
+        *data = extract64(cs->gicr_vpropbaser, 0, 32);
+        return MEMTX_OK;
+    case GICR_VPROPBASER + 4:
+        *data = extract64(cs->gicr_vpropbaser, 32, 32);
+        return MEMTX_OK;
+    case GICR_VPENDBASER:
+        *data = extract64(cs->gicr_vpendbaser, 0, 32);
+        return MEMTX_OK;
+    case GICR_VPENDBASER + 4:
+        *data = extract64(cs->gicr_vpendbaser, 32, 32);
+        return MEMTX_OK;
     default:
         return MEMTX_ERROR;
     }
@@ -379,6 +396,23 @@ static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
                       "%s: invalid guest write to RO register at offset "
                       TARGET_FMT_plx "\n", __func__, offset);
         return MEMTX_OK;
+        /*
+         * VLPI frame registers. We don't need a version check for
+         * VPROPBASER and VPENDBASER because gicv3_redist_size() will
+         * prevent pre-v4 GIC from passing us offsets this high.
+         */
+    case GICR_VPROPBASER:
+        cs->gicr_vpropbaser = deposit64(cs->gicr_vpropbaser, 0, 32, value);
+        return MEMTX_OK;
+    case GICR_VPROPBASER + 4:
+        cs->gicr_vpropbaser = deposit64(cs->gicr_vpropbaser, 32, 32, value);
+        return MEMTX_OK;
+    case GICR_VPENDBASER:
+        cs->gicr_vpendbaser = deposit64(cs->gicr_vpendbaser, 0, 32, value);
+        return MEMTX_OK;
+    case GICR_VPENDBASER + 4:
+        cs->gicr_vpendbaser = deposit64(cs->gicr_vpendbaser, 32, 32, value);
+        return MEMTX_OK;
     default:
         return MEMTX_ERROR;
     }
@@ -397,6 +431,17 @@ static MemTxResult gicr_readll(GICv3CPUState *cs, hwaddr offset,
     case GICR_PENDBASER:
         *data = cs->gicr_pendbaser;
         return MEMTX_OK;
+        /*
+         * VLPI frame registers. We don't need a version check for
+         * VPROPBASER and VPENDBASER because gicv3_redist_size() will
+         * prevent pre-v4 GIC from passing us offsets this high.
+         */
+    case GICR_VPROPBASER:
+        *data = cs->gicr_vpropbaser;
+        return MEMTX_OK;
+    case GICR_VPENDBASER:
+        *data = cs->gicr_vpendbaser;
+        return MEMTX_OK;
     default:
         return MEMTX_ERROR;
     }
@@ -418,6 +463,17 @@ static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
                       "%s: invalid guest write to RO register at offset "
                       TARGET_FMT_plx "\n", __func__, offset);
         return MEMTX_OK;
+        /*
+         * VLPI frame registers. We don't need a version check for
+         * VPROPBASER and VPENDBASER because gicv3_redist_size() will
+         * prevent pre-v4 GIC from passing us offsets this high.
+         */
+    case GICR_VPROPBASER:
+        cs->gicr_vpropbaser = value;
+        return MEMTX_OK;
+    case GICR_VPENDBASER:
+        cs->gicr_vpendbaser = value;
+        return MEMTX_OK;
     default:
         return MEMTX_ERROR;
     }
-- 
2.25.1


