Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726ED538803
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 22:04:00 +0200 (CEST)
Received: from localhost ([::1]:51286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlcN-0003cY-Hf
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 16:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlGq-000343-QC; Mon, 30 May 2022 15:41:44 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlGo-0000Qu-SH; Mon, 30 May 2022 15:41:44 -0400
Received: by mail-pf1-x42f.google.com with SMTP id w21so124312pfc.0;
 Mon, 30 May 2022 12:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VjMVykNFSdANRZcPdxEOZvf3FjrpzdUR9v+5Wsk8FiY=;
 b=NRijMvHPHrluRTx1/fJG7xO1/hSR/KabVz7WqC651C0lLUy7xspt2rdUmD1dEsO5Cy
 gSLGytrIAN65HHyNt2eQTVrALPJ7GwlQMpFSF+rvs2BI5d6lzArBf4PR3VkXBRRwanq5
 06/yFofDn67m47+64ewoCaqSYWqLFmha9u05OkmeSSXHurez6W2nZO5nXcY02kh1CVDK
 Cegs82T/anJgXoRUmyjQJ8b75lirK6ivynBOsoSExu/L/P+WWE/xKDWOqSvzHX4KaoFf
 F2nVkZ5fthxTScrnzzRIBDYNrzrAgaEjb9M4KvLBplmsjCepI9End6xrcb9RVWZRINOn
 3emw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VjMVykNFSdANRZcPdxEOZvf3FjrpzdUR9v+5Wsk8FiY=;
 b=eJkoxphUPwvo1F0xR7Ccfrx3h6tzJHiauSyqirqnjDwRdeDgW8Fn+zepyw42BAb+8a
 53fIA/2yKHm46x8l8IWZiFbftC1TviVwLa7TytiyzUtBx+O2+Iljx+eFGqO7/1r9prqy
 CxgTSawDOgVvNeYC6LnN3xltNvr6wOOZogl/Im17YliBRORgzyC9DgK/5LQbPpavYaB1
 vN4rvviwrZLgqhId36miYau1d/RRgboWpGgW0gcUpS6aL43JMNuIV8gxiZ7DEHrpJvx1
 mjfEvICEb8K5UhhBg/h2baS1zPLOMjK11Xv/SxOqylNnbhY242N1YmOiecAyDVNsrSPl
 fZTA==
X-Gm-Message-State: AOAM533mdext211giT25ENx3cG+basJVEbQGYQyjvYZ1ldYVm/u/IcAH
 hcR0V3WcohAZ4H6huMCF2C0p5EtfSbc=
X-Google-Smtp-Source: ABdhPJxvJ8vitVWiIM82JJ/rx4Q3WHsMhcDdCoN1Tzb+eLdQnfI524Uycxy7XBCAnh4Ii/j8RnEpYw==
X-Received: by 2002:a63:1716:0:b0:3f2:52bc:b4f3 with SMTP id
 x22-20020a631716000000b003f252bcb4f3mr48914944pgl.610.1653939701048; 
 Mon, 30 May 2022 12:41:41 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a170903110100b00163ac8673edsm5680760plh.35.2022.05.30.12.41.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:41:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 23/25] hw/sd: Support boot area in emmc image
Date: Mon, 30 May 2022 21:38:14 +0200
Message-Id: <20220530193816.45841-24-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joel Stanley <joel@jms.id.au>

This assumes a specially constructued image:

  dd if=/dev/zero of=mmc-bootarea.img count=2 bs=1M
  dd if=u-boot-spl.bin of=mmc-bootarea.img conv=notrunc
  dd if=u-boot.bin of=mmc-bootarea.img conv=notrunc count=64 bs=1K
  cat mmc-bootarea.img obmc-phosphor-image.wic > mmc.img
  truncate --size 16GB mmc.img
  truncate --size 128MB mmc-bootarea.img

For now this still requires a mtd image to load the SPL:

  qemu-system-arm -M tacoma-bmc -nographic \
   -global driver=sd-card,property=emmc,value=true \
   -drive file=mmc.img,if=sd,index=2 \
   -drive file=mmc-bootarea.img,if=mtd,format=raw

Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: - definition renames
      - Introduced bootpart_offset
      - Introduced sd_boot_capacity_bytes() helper (Philippe) ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c         | 39 +++++++++++++++++++++++++++++++++++++++
 include/hw/sd/sd.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 6722003cda..05e77f128f 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -659,6 +659,12 @@ static inline uint64_t sd_addr_to_wpnum(uint64_t addr)
     return addr >> (HWBLOCK_SHIFT + SECTOR_SHIFT + WPGROUP_SHIFT);
 }
 
+
+static unsigned sd_boot_capacity_bytes(SDState *sd)
+{
+    return sd->ext_csd[EXT_CSD_BOOT_MULT] << 17;
+}
+
 static void sd_reset(DeviceState *dev)
 {
     SDState *sd = SD_CARD(dev);
@@ -857,9 +863,40 @@ void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
     qemu_set_irq(insert, sd->blk ? blk_is_inserted(sd->blk) : 0);
 }
 
+/*
+ * This requires a disk image that has two boot partitions inserted at the
+ * beginning of it. The size of the boot partitions are configured in the
+ * ext_csd structure, which is hardcoded in qemu. They are currently set to
+ * 1MB each.
+ */
+static uint32_t sd_emmc_bootpart_offset(SDState *sd)
+{
+    unsigned int access = sd->ext_csd[EXT_CSD_PART_CONFIG] &
+        EXT_CSD_PART_CONFIG_ACC_MASK;
+    unsigned int boot_capacity = sd_boot_capacity_bytes(sd);
+
+    switch (access) {
+    case EXT_CSD_PART_CONFIG_ACC_DEFAULT:
+        return boot_capacity * 2;
+    case EXT_CSD_PART_CONFIG_ACC_BOOT0:
+        return 0;
+    case EXT_CSD_PART_CONFIG_ACC_BOOT0 + 1:
+        return boot_capacity * 1;
+    default:
+         g_assert_not_reached();
+    }
+}
+
+static uint32_t sd_bootpart_offset(SDState *sd)
+{
+    SDCardClass *sc = SD_CARD_GET_CLASS(sd);
+    return sc->bootpart_offset ? sc->bootpart_offset(sd) : 0;
+}
+
 static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_read_block(addr, len);
+    addr += sd_bootpart_offset(sd);
     if (!sd->blk || blk_pread(sd->blk, addr, sd->data, len) < 0) {
         fprintf(stderr, "sd_blk_read: read error on host side\n");
     }
@@ -868,6 +905,7 @@ static void sd_blk_read(SDState *sd, uint64_t addr, uint32_t len)
 static void sd_blk_write(SDState *sd, uint64_t addr, uint32_t len)
 {
     trace_sdcard_write_block(addr, len);
+    addr += sd_bootpart_offset(sd);
     if (!sd->blk || blk_pwrite(sd->blk, addr, sd->data, len, 0) < 0) {
         fprintf(stderr, "sd_blk_write: write error on host side\n");
     }
@@ -2564,6 +2602,7 @@ static void emmc_class_init(ObjectClass *klass, void *data)
     dc->realize = emmc_realize;
     sc->proto = &sd_proto_emmc;
     sc->set_csd = sd_emmc_set_csd;
+    sc->bootpart_offset = sd_emmc_bootpart_offset;
 }
 
 static const TypeInfo emmc_info = {
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 8a0f2e75da..36d3cba08e 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -130,6 +130,7 @@ struct SDCardClass {
 
     const struct SDProto *proto;
     void (*set_csd)(SDState *sd, uint64_t size);
+    uint32_t (*bootpart_offset)(SDState *sd);
 };
 
 #define TYPE_SD_BUS "sd-bus"
-- 
2.36.1


