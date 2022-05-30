Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0DD53880C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 22:09:22 +0200 (CEST)
Received: from localhost ([::1]:60630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvlhZ-0002Od-NJ
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 16:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlH7-0003gc-Fo; Mon, 30 May 2022 15:42:01 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvlH5-0000S7-OS; Mon, 30 May 2022 15:42:01 -0400
Received: by mail-pf1-x42c.google.com with SMTP id g205so178656pfb.11;
 Mon, 30 May 2022 12:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nD26OrZMOffcOx8taOCGM7PEMXeUpfdyuSmg9FQvc1w=;
 b=qK9Pi323Hk/L9pv5+CmybvlhFJHYhsVRFp0nap1f1IGUfVsUQQuaM9V56eOZY9rkhW
 kMerMvz++RWOfUDwZ0xqyiWYUmVe44M3kJrL75xQQXnOtd9oCi8ZyBaQUrBHxzjNGLFT
 L/JrXcSUNc4sh0p4eW4DhvH28pJF/f/32UH2CgrRTWg9JK6F50XME/C/QIyF+e07HOfl
 Z8NJWaxfYb14wHOi6lFfOJE5NiDj5ror84Xs1n+GhzeeUhWoOYExMEfA5ItyIFGmTyPF
 tm7bQTID1FHp7gNQdREMks0aM7mHRGPNDx5R/tZoFq5V5KZD5xorzNhXypF4OXXMhCx6
 0q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nD26OrZMOffcOx8taOCGM7PEMXeUpfdyuSmg9FQvc1w=;
 b=y88VefsKSrKPDKNV1Lrs1GdHpEWeFAsJpk1lAbJDxA20JzpV9d6Hfpc+gzqSiEw6/I
 isn0QzRyLB8TgxjpQtaRes2ZsPbxb12cLNfGakeWh4Ej1K8TYNumXuCfjpzdxVc4kfcP
 KbXDlkRtoaIonCmcFkvvxmmQpvP76HZhPEhqhuPGwmh3Xi2pxWq2sR/0n4VDmtJEH/q4
 6iBiTK8H3cUNsiiopApLSI1XaGrBpPCdKdHB5nJtgj8OxWOceALIJogK+qkrHKImjmoz
 VrJbkHa1z8+5llKwNpdm/UL8nBTdlnfJCW3E+OpzXaD8mioG273EO9eLYtK/p6AEw3yk
 y5Rg==
X-Gm-Message-State: AOAM531Yc2vV/GvhI5k8gw08A/Up2Nk/oQSDTojAgY27ALR7ti8rgU+w
 SbVJ/9qZFbirEy84Lo+5zi1Tw2h1giQ=
X-Google-Smtp-Source: ABdhPJzdfw3gxMLx9bHabC2NztCyc69EM+f86b6pOjvLW4L+7ivkEy8H6B/kc2u36RbaRRQsfDni5Q==
X-Received: by 2002:a62:8206:0:b0:518:3c6a:21ba with SMTP id
 w6-20020a628206000000b005183c6a21bamr57096113pfd.63.1653939717997; 
 Mon, 30 May 2022 12:41:57 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a634107000000b003c644b2180asm9071910pga.77.2022.05.30.12.41.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 12:41:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bin.meng@windriver.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Subject: [PATCH v2 25/25] hw/sd: Add boot config support
Date: Mon, 30 May 2022 21:38:16 +0200
Message-Id: <20220530193816.45841-26-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
References: <20220530193816.45841-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
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

Introduced "boot-config" property to set CSD 179, the boot config
register.

With this correctly set we can use the enable bit to detect if partition
support is enabled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 26ddf3e92d..da909ec59f 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -116,6 +116,7 @@ struct SDState {
     uint8_t spec_version;
     BlockBackend *blk;
     bool spi;
+    uint8_t boot_config;
 
     /* Runtime changeables */
 
@@ -453,6 +454,8 @@ static void mmc_set_ext_csd(SDState *sd, uint64_t size)
     sd->ext_csd[159] = 0x00; /* Max enhanced area size */
     sd->ext_csd[158] = 0x00; /* ... */
     sd->ext_csd[157] = 0xEC; /* ... */
+
+    sd->ext_csd[EXT_CSD_PART_CONFIG] = sd->boot_config;
 }
 
 static void sd_emmc_set_csd(SDState *sd, uint64_t size)
@@ -878,8 +881,14 @@ static uint32_t sd_emmc_bootpart_offset(SDState *sd)
 {
     unsigned int access = sd->ext_csd[EXT_CSD_PART_CONFIG] &
         EXT_CSD_PART_CONFIG_ACC_MASK;
+    unsigned int enable = sd->ext_csd[EXT_CSD_PART_CONFIG] &
+         EXT_CSD_PART_CONFIG_EN_MASK;
     unsigned int boot_capacity = sd_boot_capacity_bytes(sd);
 
+    if (!enable) {
+        return 0;
+    }
+
     switch (access) {
     case EXT_CSD_PART_CONFIG_ACC_DEFAULT:
         return boot_capacity * 2;
@@ -2548,6 +2557,7 @@ static Property sd_properties[] = {
      * board to ensure that ssi transfers only occur when the chip select
      * is asserted.  */
     DEFINE_PROP_BOOL("spi", SDState, spi, false),
+    DEFINE_PROP_UINT8("boot-config", SDState, boot_config, 0x0),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.36.1


