Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F0048A49C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 02:00:00 +0100 (CET)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n75W3-0002Iw-Lm
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 19:59:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SS-0007rt-C1; Mon, 10 Jan 2022 19:56:16 -0500
Received: from [2607:f8b0:4864:20::936] (port=37456
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n75SP-0003q0-Gl; Mon, 10 Jan 2022 19:56:16 -0500
Received: by mail-ua1-x936.google.com with SMTP id o1so26889615uap.4;
 Mon, 10 Jan 2022 16:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DAbgaHS+X0Kj3siGgaZBTrFM8KGYV+qhIhpAyQ1lR88=;
 b=purF9xYgGPFmn+mBVsCmUvNC204YQz1e75A46Nu3EdT6IdkT9enu+grl9JbZaYGHt8
 TOTAlwH1sHdXG9yjX6JtJ4pxK51mhBUpRJXAchLRp5h6ICK2iwTc9gM77QxdeuhiybNo
 ZYuqgTscvUc+SR7JEFNu9K+pcw1uZTt7U7KtSh/Yt+1d6Ugfl9NyVEorYfxnHp8BKMYw
 mK5bNVD1RGdUrDTlmTzagz924krEdm3zM7Qt+m7wX10e59vp026yW4JgrZxdwUXUgx0u
 IRjyrr5XMtzcBFeMRDi/XxZ01Zqw/nvRhRb0Kp8Kq03MhuBXkI52WEsnc+TX0ZAAX97A
 XDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DAbgaHS+X0Kj3siGgaZBTrFM8KGYV+qhIhpAyQ1lR88=;
 b=qTWfKCKrQ7eanZsfaCnImXTgvfe0yed21Ed3zaxLahVgBm8ZrBgUxKPQrcYx/AjEhk
 xNXuESdnOl+W3vTUltno/dyL5z5LomnHAg7a5VrWmyMxiC8atfyDTNXXdCYLv6pD0hQB
 /Wzdi+c4PUaIw5wwEy9sowih79rDrDlwTuaq8aaygLycjxUHLM2Ak8cqZP8hMAGwie7a
 vSD6PeBQp26gxbJgt1qgvHOXaeH6hg/g3zLGnEaj1Tsif3wa5d00rkW5C4LV8YRdevLk
 fD0BRjGx8Us6vocbhZyexf0ZGgLkVvi1yCOmgDN3BPwyIGRgFWbFRyxQmWmxoAd8D9yh
 NEBQ==
X-Gm-Message-State: AOAM530jf1DHO3awnz4gY1ZCIEWar1Ed1/MT+7d0bXO53XYdY8TGqpck
 IgB1FX+hJd47aC/dm6o3KMMk19XnxJNwnxBi
X-Google-Smtp-Source: ABdhPJyC4jKxT9Z1g5gBOrNDGXjYY1F8NxYqyF31Wn2QvNnzWuCp7f1LE4UVFZmSpX/nfB29QnBrWA==
X-Received: by 2002:a05:6102:e06:: with SMTP id
 o6mr1243904vst.37.1641862571810; 
 Mon, 10 Jan 2022 16:56:11 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id x190sm4645562vkf.56.2022.01.10.16.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 16:56:11 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] ppc/pnv: move PHB4 XSCOM init to phb4_realize()
Date: Mon, 10 Jan 2022 21:55:55 -0300
Message-Id: <20220111005558.549685-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220111005558.549685-1-danielhb413@gmail.com>
References: <20220111005558.549685-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'stack->phb_regs_mr' PHB4 passthrough XSCOM initialization relies on
'stack->phb' being not NULL. Moving 'stack->phb_regs_mr' region_init()
and add_subregion() to phb4_realize() time is a natural thing to do
since it's strictly PHB related.

The remaining XSCOM initialization is also related to 'stack->phb' but
in a different manner. For instance, 'stack->nest_regs_mr'
MemoryRegionOps, 'pnv_pec_stk_nest_xscom_ops', uses
pnv_pec_stk_nest_xscom_write() as a write callback. When trying to write
the PEC_NEST_STK_BAR_EN reg, pnv_pec_stk_update_map() is called. Inside
this function, pnv_phb4_update_regions() is called twice. This function
uses 'stack->phb' to manipulate memory regions of the phb.

This is not a problem now but, when enabling user creatable phb4s, a
stack that doesn't have an associated phb (i.e. stack->phb = NULL) it
will cause a SIGINT during boot in pnv_phb4_update_regions().

All this can be avoided if all XSCOM init is moved to phb4_realize(),
when we have certainty about the existence of 'stack->phb'. A lot of
code was moved from pnv_phb4_pec.c to pnv_phb4.c due to static constant
and variables being used but the cleaner logic is worth the trouble.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c     | 304 +++++++++++++++++++++++++++++++++++++
 hw/pci-host/pnv_phb4_pec.c | 292 -----------------------------------
 2 files changed, 304 insertions(+), 292 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index b7b0091f93..1bd74fd932 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -29,6 +29,10 @@
     qemu_log_mask(LOG_GUEST_ERROR, "phb4[%d:%d]: " fmt "\n",            \
                   (phb)->chip_id, (phb)->phb_id, ## __VA_ARGS__)
 
+#define phb_pec_error(pec, fmt, ...)                                    \
+    qemu_log_mask(LOG_GUEST_ERROR, "phb4_pec[%d:%d]: " fmt "\n",        \
+                  (pec)->chip_id, (pec)->index, ## __VA_ARGS__)
+
 /*
  * QEMU version of the GETFIELD/SETFIELD macros
  *
@@ -854,6 +858,258 @@ const MemoryRegionOps pnv_phb4_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
+static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
+                                            unsigned size)
+{
+    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
+    uint32_t reg = addr >> 3;
+
+    /* TODO: add list of allowed registers and error out if not */
+    return stack->nest_regs[reg];
+}
+
+static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
+{
+    PnvPhb4PecState *pec = stack->pec;
+    MemoryRegion *sysmem = get_system_memory();
+    uint64_t bar_en = stack->nest_regs[PEC_NEST_STK_BAR_EN];
+    uint64_t bar, mask, size;
+    char name[64];
+
+    /*
+     * NOTE: This will really not work well if those are remapped
+     * after the PHB has created its sub regions. We could do better
+     * if we had a way to resize regions but we don't really care
+     * that much in practice as the stuff below really only happens
+     * once early during boot
+     */
+
+    /* Handle unmaps */
+    if (memory_region_is_mapped(&stack->mmbar0) &&
+        !(bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
+        memory_region_del_subregion(sysmem, &stack->mmbar0);
+    }
+    if (memory_region_is_mapped(&stack->mmbar1) &&
+        !(bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
+        memory_region_del_subregion(sysmem, &stack->mmbar1);
+    }
+    if (memory_region_is_mapped(&stack->phbbar) &&
+        !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
+        memory_region_del_subregion(sysmem, &stack->phbbar);
+    }
+    if (memory_region_is_mapped(&stack->intbar) &&
+        !(bar_en & PEC_NEST_STK_BAR_EN_INT)) {
+        memory_region_del_subregion(sysmem, &stack->intbar);
+    }
+
+    /* Update PHB */
+    pnv_phb4_update_regions(stack);
+
+    /* Handle maps */
+    if (!memory_region_is_mapped(&stack->mmbar0) &&
+        (bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
+        bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
+        mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
+        size = ((~mask) >> 8) + 1;
+        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio0",
+                 pec->chip_id, pec->index, stack->stack_no);
+        memory_region_init(&stack->mmbar0, OBJECT(stack), name, size);
+        memory_region_add_subregion(sysmem, bar, &stack->mmbar0);
+        stack->mmio0_base = bar;
+        stack->mmio0_size = size;
+    }
+    if (!memory_region_is_mapped(&stack->mmbar1) &&
+        (bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
+        bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
+        mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
+        size = ((~mask) >> 8) + 1;
+        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio1",
+                 pec->chip_id, pec->index, stack->stack_no);
+        memory_region_init(&stack->mmbar1, OBJECT(stack), name, size);
+        memory_region_add_subregion(sysmem, bar, &stack->mmbar1);
+        stack->mmio1_base = bar;
+        stack->mmio1_size = size;
+    }
+    if (!memory_region_is_mapped(&stack->phbbar) &&
+        (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
+        bar = stack->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
+        size = PNV_PHB4_NUM_REGS << 3;
+        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-phb",
+                 pec->chip_id, pec->index, stack->stack_no);
+        memory_region_init(&stack->phbbar, OBJECT(stack), name, size);
+        memory_region_add_subregion(sysmem, bar, &stack->phbbar);
+    }
+    if (!memory_region_is_mapped(&stack->intbar) &&
+        (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
+        bar = stack->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
+        size = PNV_PHB4_MAX_INTs << 16;
+        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-int",
+                 stack->pec->chip_id, stack->pec->index, stack->stack_no);
+        memory_region_init(&stack->intbar, OBJECT(stack), name, size);
+        memory_region_add_subregion(sysmem, bar, &stack->intbar);
+    }
+
+    /* Update PHB */
+    pnv_phb4_update_regions(stack);
+}
+
+static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
+                                         uint64_t val, unsigned size)
+{
+    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
+    PnvPhb4PecState *pec = stack->pec;
+    uint32_t reg = addr >> 3;
+
+    switch (reg) {
+    case PEC_NEST_STK_PCI_NEST_FIR:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] = val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_CLR:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] &= val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_SET:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] |= val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_MSK:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] = val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_MSKC:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] &= val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_MSKS:
+        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] |= val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_ACT0:
+    case PEC_NEST_STK_PCI_NEST_FIR_ACT1:
+        stack->nest_regs[reg] = val;
+        break;
+    case PEC_NEST_STK_PCI_NEST_FIR_WOF:
+        stack->nest_regs[reg] = 0;
+        break;
+    case PEC_NEST_STK_ERR_REPORT_0:
+    case PEC_NEST_STK_ERR_REPORT_1:
+    case PEC_NEST_STK_PBCQ_GNRL_STATUS:
+        /* Flag error ? */
+        break;
+    case PEC_NEST_STK_PBCQ_MODE:
+        stack->nest_regs[reg] = val & 0xff00000000000000ull;
+        break;
+    case PEC_NEST_STK_MMIO_BAR0:
+    case PEC_NEST_STK_MMIO_BAR0_MASK:
+    case PEC_NEST_STK_MMIO_BAR1:
+    case PEC_NEST_STK_MMIO_BAR1_MASK:
+        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] &
+            (PEC_NEST_STK_BAR_EN_MMIO0 |
+             PEC_NEST_STK_BAR_EN_MMIO1)) {
+            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
+        }
+        stack->nest_regs[reg] = val & 0xffffffffff000000ull;
+        break;
+    case PEC_NEST_STK_PHB_REGS_BAR:
+        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_PHB) {
+            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
+        }
+        stack->nest_regs[reg] = val & 0xffffffffffc00000ull;
+        break;
+    case PEC_NEST_STK_INT_BAR:
+        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_INT) {
+            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
+        }
+        stack->nest_regs[reg] = val & 0xfffffff000000000ull;
+        break;
+    case PEC_NEST_STK_BAR_EN:
+        stack->nest_regs[reg] = val & 0xf000000000000000ull;
+        pnv_pec_stk_update_map(stack);
+        break;
+    case PEC_NEST_STK_DATA_FRZ_TYPE:
+    case PEC_NEST_STK_PBCQ_TUN_BAR:
+        /* Not used for now */
+        stack->nest_regs[reg] = val;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "phb4_pec: nest_xscom_write 0x%"HWADDR_PRIx
+                      "=%"PRIx64"\n", addr, val);
+    }
+}
+
+static const MemoryRegionOps pnv_pec_stk_nest_xscom_ops = {
+    .read = pnv_pec_stk_nest_xscom_read,
+    .write = pnv_pec_stk_nest_xscom_write,
+    .valid.min_access_size = 8,
+    .valid.max_access_size = 8,
+    .impl.min_access_size = 8,
+    .impl.max_access_size = 8,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
+                                           unsigned size)
+{
+    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
+    uint32_t reg = addr >> 3;
+
+    /* TODO: add list of allowed registers and error out if not */
+    return stack->pci_regs[reg];
+}
+
+static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
+                                        uint64_t val, unsigned size)
+{
+    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
+    uint32_t reg = addr >> 3;
+
+    switch (reg) {
+    case PEC_PCI_STK_PCI_FIR:
+        stack->nest_regs[reg] = val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_CLR:
+        stack->nest_regs[PEC_PCI_STK_PCI_FIR] &= val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_SET:
+        stack->nest_regs[PEC_PCI_STK_PCI_FIR] |= val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_MSK:
+        stack->nest_regs[reg] = val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_MSKC:
+        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] &= val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_MSKS:
+        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] |= val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_ACT0:
+    case PEC_PCI_STK_PCI_FIR_ACT1:
+        stack->nest_regs[reg] = val;
+        break;
+    case PEC_PCI_STK_PCI_FIR_WOF:
+        stack->nest_regs[reg] = 0;
+        break;
+    case PEC_PCI_STK_ETU_RESET:
+        stack->nest_regs[reg] = val & 0x8000000000000000ull;
+        /* TODO: Implement reset */
+        break;
+    case PEC_PCI_STK_PBAIB_ERR_REPORT:
+        break;
+    case PEC_PCI_STK_PBAIB_TX_CMD_CRED:
+    case PEC_PCI_STK_PBAIB_TX_DAT_CRED:
+        stack->nest_regs[reg] = val;
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "phb4_pec_stk: pci_xscom_write 0x%"HWADDR_PRIx
+                      "=%"PRIx64"\n", addr, val);
+    }
+}
+
+static const MemoryRegionOps pnv_pec_stk_pci_xscom_ops = {
+    .read = pnv_pec_stk_pci_xscom_read,
+    .write = pnv_pec_stk_pci_xscom_write,
+    .valid.min_access_size = 8,
+    .valid.max_access_size = 8,
+    .impl.min_access_size = 8,
+    .impl.max_access_size = 8,
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
 static int pnv_phb4_map_irq(PCIDevice *pci_dev, int irq_num)
 {
     /* Check that out properly ... */
@@ -1175,6 +1431,52 @@ int pnv_phb4_pec_get_phb_id(PnvPhb4PecState *pec, int stack_index)
     return offset + stack_index;
 }
 
+static void pnv_phb4_XSCOM_init(PnvPHB4 *phb)
+{
+    PnvPhb4PecStack *stack = phb->stack;
+    PnvPhb4PecState *pec = stack->pec;
+    PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
+    uint32_t pec_nest_base;
+    uint32_t pec_pci_base;
+    char name[64];
+
+    assert(pec);
+
+    /* Initialize the XSCOM regions for the stack registers */
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-stack-%d",
+             pec->chip_id, pec->index, stack->stack_no);
+    pnv_xscom_region_init(&stack->nest_regs_mr, OBJECT(stack),
+                          &pnv_pec_stk_nest_xscom_ops, stack, name,
+                          PHB4_PEC_NEST_STK_REGS_COUNT);
+
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d",
+             pec->chip_id, pec->index, stack->stack_no);
+    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(stack),
+                          &pnv_pec_stk_pci_xscom_ops, stack, name,
+                          PHB4_PEC_PCI_STK_REGS_COUNT);
+
+    /* PHB pass-through */
+    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
+             pec->chip_id, pec->index, stack->stack_no);
+    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(phb),
+                          &pnv_phb4_xscom_ops, phb, name, 0x40);
+
+    pec_nest_base = pecc->xscom_nest_base(pec);
+    pec_pci_base = pecc->xscom_pci_base(pec);
+
+    /* Populate the XSCOM address space. */
+    pnv_xscom_add_subregion(pec->chip,
+                            pec_nest_base + 0x40 * (stack->stack_no + 1),
+                            &stack->nest_regs_mr);
+    pnv_xscom_add_subregion(pec->chip,
+                            pec_pci_base + 0x40 * (stack->stack_no + 1),
+                            &stack->pci_regs_mr);
+    pnv_xscom_add_subregion(pec->chip,
+                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
+                            0x40 * stack->stack_no,
+                            &stack->phb_regs_mr);
+}
+
 static void pnv_phb4_instance_init(Object *obj)
 {
     PnvPHB4 *phb = PNV_PHB4(obj);
@@ -1195,6 +1497,8 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
 
     assert(phb->stack);
 
+    pnv_phb4_XSCOM_init(phb);
+
     /* Set the "big_phb" flag */
     phb->big_phb = phb->phb_id == 0 || phb->phb_id == 3;
 
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index f8038dff17..bf0fdf33fd 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -111,258 +111,6 @@ static const MemoryRegionOps pnv_pec_pci_xscom_ops = {
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-static uint64_t pnv_pec_stk_nest_xscom_read(void *opaque, hwaddr addr,
-                                            unsigned size)
-{
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
-    uint32_t reg = addr >> 3;
-
-    /* TODO: add list of allowed registers and error out if not */
-    return stack->nest_regs[reg];
-}
-
-static void pnv_pec_stk_update_map(PnvPhb4PecStack *stack)
-{
-    PnvPhb4PecState *pec = stack->pec;
-    MemoryRegion *sysmem = get_system_memory();
-    uint64_t bar_en = stack->nest_regs[PEC_NEST_STK_BAR_EN];
-    uint64_t bar, mask, size;
-    char name[64];
-
-    /*
-     * NOTE: This will really not work well if those are remapped
-     * after the PHB has created its sub regions. We could do better
-     * if we had a way to resize regions but we don't really care
-     * that much in practice as the stuff below really only happens
-     * once early during boot
-     */
-
-    /* Handle unmaps */
-    if (memory_region_is_mapped(&stack->mmbar0) &&
-        !(bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
-        memory_region_del_subregion(sysmem, &stack->mmbar0);
-    }
-    if (memory_region_is_mapped(&stack->mmbar1) &&
-        !(bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
-        memory_region_del_subregion(sysmem, &stack->mmbar1);
-    }
-    if (memory_region_is_mapped(&stack->phbbar) &&
-        !(bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
-        memory_region_del_subregion(sysmem, &stack->phbbar);
-    }
-    if (memory_region_is_mapped(&stack->intbar) &&
-        !(bar_en & PEC_NEST_STK_BAR_EN_INT)) {
-        memory_region_del_subregion(sysmem, &stack->intbar);
-    }
-
-    /* Update PHB */
-    pnv_phb4_update_regions(stack);
-
-    /* Handle maps */
-    if (!memory_region_is_mapped(&stack->mmbar0) &&
-        (bar_en & PEC_NEST_STK_BAR_EN_MMIO0)) {
-        bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0] >> 8;
-        mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR0_MASK];
-        size = ((~mask) >> 8) + 1;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio0",
-                 pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->mmbar0, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->mmbar0);
-        stack->mmio0_base = bar;
-        stack->mmio0_size = size;
-    }
-    if (!memory_region_is_mapped(&stack->mmbar1) &&
-        (bar_en & PEC_NEST_STK_BAR_EN_MMIO1)) {
-        bar = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1] >> 8;
-        mask = stack->nest_regs[PEC_NEST_STK_MMIO_BAR1_MASK];
-        size = ((~mask) >> 8) + 1;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-mmio1",
-                 pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->mmbar1, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->mmbar1);
-        stack->mmio1_base = bar;
-        stack->mmio1_size = size;
-    }
-    if (!memory_region_is_mapped(&stack->phbbar) &&
-        (bar_en & PEC_NEST_STK_BAR_EN_PHB)) {
-        bar = stack->nest_regs[PEC_NEST_STK_PHB_REGS_BAR] >> 8;
-        size = PNV_PHB4_NUM_REGS << 3;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-phb",
-                 pec->chip_id, pec->index, stack->stack_no);
-        memory_region_init(&stack->phbbar, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->phbbar);
-    }
-    if (!memory_region_is_mapped(&stack->intbar) &&
-        (bar_en & PEC_NEST_STK_BAR_EN_INT)) {
-        bar = stack->nest_regs[PEC_NEST_STK_INT_BAR] >> 8;
-        size = PNV_PHB4_MAX_INTs << 16;
-        snprintf(name, sizeof(name), "pec-%d.%d-stack-%d-int",
-                 stack->pec->chip_id, stack->pec->index, stack->stack_no);
-        memory_region_init(&stack->intbar, OBJECT(stack), name, size);
-        memory_region_add_subregion(sysmem, bar, &stack->intbar);
-    }
-
-    /* Update PHB */
-    pnv_phb4_update_regions(stack);
-}
-
-static void pnv_pec_stk_nest_xscom_write(void *opaque, hwaddr addr,
-                                         uint64_t val, unsigned size)
-{
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
-    PnvPhb4PecState *pec = stack->pec;
-    uint32_t reg = addr >> 3;
-
-    switch (reg) {
-    case PEC_NEST_STK_PCI_NEST_FIR:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] = val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_CLR:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] &= val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_SET:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR] |= val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_MSK:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] = val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_MSKC:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] &= val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_MSKS:
-        stack->nest_regs[PEC_NEST_STK_PCI_NEST_FIR_MSK] |= val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_ACT0:
-    case PEC_NEST_STK_PCI_NEST_FIR_ACT1:
-        stack->nest_regs[reg] = val;
-        break;
-    case PEC_NEST_STK_PCI_NEST_FIR_WOF:
-        stack->nest_regs[reg] = 0;
-        break;
-    case PEC_NEST_STK_ERR_REPORT_0:
-    case PEC_NEST_STK_ERR_REPORT_1:
-    case PEC_NEST_STK_PBCQ_GNRL_STATUS:
-        /* Flag error ? */
-        break;
-    case PEC_NEST_STK_PBCQ_MODE:
-        stack->nest_regs[reg] = val & 0xff00000000000000ull;
-        break;
-    case PEC_NEST_STK_MMIO_BAR0:
-    case PEC_NEST_STK_MMIO_BAR0_MASK:
-    case PEC_NEST_STK_MMIO_BAR1:
-    case PEC_NEST_STK_MMIO_BAR1_MASK:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] &
-            (PEC_NEST_STK_BAR_EN_MMIO0 |
-             PEC_NEST_STK_BAR_EN_MMIO1)) {
-            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
-        }
-        stack->nest_regs[reg] = val & 0xffffffffff000000ull;
-        break;
-    case PEC_NEST_STK_PHB_REGS_BAR:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_PHB) {
-            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
-        }
-        stack->nest_regs[reg] = val & 0xffffffffffc00000ull;
-        break;
-    case PEC_NEST_STK_INT_BAR:
-        if (stack->nest_regs[PEC_NEST_STK_BAR_EN] & PEC_NEST_STK_BAR_EN_INT) {
-            phb_pec_error(pec, "Changing enabled BAR unsupported\n");
-        }
-        stack->nest_regs[reg] = val & 0xfffffff000000000ull;
-        break;
-    case PEC_NEST_STK_BAR_EN:
-        stack->nest_regs[reg] = val & 0xf000000000000000ull;
-        pnv_pec_stk_update_map(stack);
-        break;
-    case PEC_NEST_STK_DATA_FRZ_TYPE:
-    case PEC_NEST_STK_PBCQ_TUN_BAR:
-        /* Not used for now */
-        stack->nest_regs[reg] = val;
-        break;
-    default:
-        qemu_log_mask(LOG_UNIMP, "phb4_pec: nest_xscom_write 0x%"HWADDR_PRIx
-                      "=%"PRIx64"\n", addr, val);
-    }
-}
-
-static const MemoryRegionOps pnv_pec_stk_nest_xscom_ops = {
-    .read = pnv_pec_stk_nest_xscom_read,
-    .write = pnv_pec_stk_nest_xscom_write,
-    .valid.min_access_size = 8,
-    .valid.max_access_size = 8,
-    .impl.min_access_size = 8,
-    .impl.max_access_size = 8,
-    .endianness = DEVICE_BIG_ENDIAN,
-};
-
-static uint64_t pnv_pec_stk_pci_xscom_read(void *opaque, hwaddr addr,
-                                           unsigned size)
-{
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
-    uint32_t reg = addr >> 3;
-
-    /* TODO: add list of allowed registers and error out if not */
-    return stack->pci_regs[reg];
-}
-
-static void pnv_pec_stk_pci_xscom_write(void *opaque, hwaddr addr,
-                                        uint64_t val, unsigned size)
-{
-    PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(opaque);
-    uint32_t reg = addr >> 3;
-
-    switch (reg) {
-    case PEC_PCI_STK_PCI_FIR:
-        stack->nest_regs[reg] = val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_CLR:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR] &= val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_SET:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR] |= val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_MSK:
-        stack->nest_regs[reg] = val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_MSKC:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] &= val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_MSKS:
-        stack->nest_regs[PEC_PCI_STK_PCI_FIR_MSK] |= val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_ACT0:
-    case PEC_PCI_STK_PCI_FIR_ACT1:
-        stack->nest_regs[reg] = val;
-        break;
-    case PEC_PCI_STK_PCI_FIR_WOF:
-        stack->nest_regs[reg] = 0;
-        break;
-    case PEC_PCI_STK_ETU_RESET:
-        stack->nest_regs[reg] = val & 0x8000000000000000ull;
-        /* TODO: Implement reset */
-        break;
-    case PEC_PCI_STK_PBAIB_ERR_REPORT:
-        break;
-    case PEC_PCI_STK_PBAIB_TX_CMD_CRED:
-    case PEC_PCI_STK_PBAIB_TX_DAT_CRED:
-        stack->nest_regs[reg] = val;
-        break;
-    default:
-        qemu_log_mask(LOG_UNIMP, "phb4_pec_stk: pci_xscom_write 0x%"HWADDR_PRIx
-                      "=%"PRIx64"\n", addr, val);
-    }
-}
-
-static const MemoryRegionOps pnv_pec_stk_pci_xscom_ops = {
-    .read = pnv_pec_stk_pci_xscom_read,
-    .write = pnv_pec_stk_pci_xscom_write,
-    .valid.min_access_size = 8,
-    .valid.max_access_size = 8,
-    .impl.min_access_size = 8,
-    .impl.max_access_size = 8,
-    .endianness = DEVICE_BIG_ENDIAN,
-};
-
 static void pnv_pec_instance_init(Object *obj)
 {
     PnvPhb4PecState *pec = PNV_PHB4_PEC(obj);
@@ -539,32 +287,7 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     PnvPhb4PecStack *stack = PNV_PHB4_PEC_STACK(dev);
     PnvPhb4PecState *pec = stack->pec;
     PnvPhb4PecClass *pecc = PNV_PHB4_PEC_GET_CLASS(pec);
-    PnvChip *chip = pec->chip;
     int phb_id = pnv_phb4_pec_get_phb_id(pec, stack->stack_no);
-    uint32_t pec_nest_base;
-    uint32_t pec_pci_base;
-    char name[64];
-
-    assert(pec);
-
-    /* Initialize the XSCOM regions for the stack registers */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-nest-stack-%d",
-             pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->nest_regs_mr, OBJECT(stack),
-                          &pnv_pec_stk_nest_xscom_ops, stack, name,
-                          PHB4_PEC_NEST_STK_REGS_COUNT);
-
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d",
-             pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->pci_regs_mr, OBJECT(stack),
-                          &pnv_pec_stk_pci_xscom_ops, stack, name,
-                          PHB4_PEC_PCI_STK_REGS_COUNT);
-
-    /* PHB pass-through */
-    snprintf(name, sizeof(name), "xscom-pec-%d.%d-pci-stack-%d-phb",
-             pec->chip_id, pec->index, stack->stack_no);
-    pnv_xscom_region_init(&stack->phb_regs_mr, OBJECT(&stack->phb),
-                          &pnv_phb4_xscom_ops, &stack->phb, name, 0x40);
 
     object_property_set_int(OBJECT(&stack->phb), "chip-id", pec->chip_id,
                             &error_fatal);
@@ -577,21 +300,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(SYS_BUS_DEVICE(&stack->phb), errp)) {
         return;
     }
-
-    pec_nest_base = pecc->xscom_nest_base(pec);
-    pec_pci_base = pecc->xscom_pci_base(pec);
-
-    /* Populate the XSCOM address space. */
-    pnv_xscom_add_subregion(chip,
-                            pec_nest_base + 0x40 * (stack->stack_no + 1),
-                            &stack->nest_regs_mr);
-    pnv_xscom_add_subregion(chip,
-                            pec_pci_base + 0x40 * (stack->stack_no + 1),
-                            &stack->pci_regs_mr);
-    pnv_xscom_add_subregion(chip,
-                            pec_pci_base + PNV9_XSCOM_PEC_PCI_STK0 +
-                            0x40 * stack->stack_no,
-                            &stack->phb_regs_mr);
 }
 
 static Property pnv_pec_stk_properties[] = {
-- 
2.33.1


