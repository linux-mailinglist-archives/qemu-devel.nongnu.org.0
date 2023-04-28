Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48066F1989
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:31:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psOAY-0007ie-Fy; Fri, 28 Apr 2023 09:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO3W-0005lw-M6; Fri, 28 Apr 2023 09:22:34 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nks.gnu@gmail.com>)
 id 1psO3S-0001PZ-AW; Fri, 28 Apr 2023 09:22:34 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f00c33c3d6so2860044e87.2; 
 Fri, 28 Apr 2023 06:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688148; x=1685280148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l05U5W9Tm+jHrL6XZgkveA7W49bnEgJk8Kw8YLegKL8=;
 b=Kll4YSdr4BbuRSMe1TXc9Zz+Fh/jEHCbcOIBg43aBrAF1E0MZlG5zHPccm63O/hrz6
 879JlGPvDzhCmIQQjk5sdmRlEf2YuRdEwH2KyVB90UVBgSv9s+zVLpyotDrM3v8Eca2x
 KY5Ev3gpWNPC3hHM4tpPS5urmRrFuAiKYxTGOLNSALKNUJmzQ0L6fZqeB5cmzR6TAfSe
 RRevtSfsMiAiYS6t2VhAKzYQbNVrrllis3vUyVrh1lGP/yq5zrXhaAJq1W3u2+TvrYa7
 E6/2bsO1si5r4VmjKrYtEXkODAaQDkekkSA3ymoeB8yerJbE8+CU1od72YC7AZ88xwxC
 iiWA==
X-Gm-Message-State: AC+VfDzmIU/IbQsefE3MdhcbK27+7DYzcgGrevllZrx5pfpgpc5pIlQm
 1Mam+vSwPfY8RinIkxAIrlI2DlIzzqqzaY0b
X-Google-Smtp-Source: ACHHUZ6Vdp1OzOLAtj3kafwiKuSrJlK3nxsAkz5786+lr4h8O5Ol4Ea+EnOTFBnOMWzHnJnL2Zelvw==
X-Received: by 2002:ac2:4949:0:b0:4e8:3ea0:cf37 with SMTP id
 o9-20020ac24949000000b004e83ea0cf37mr1495102lfi.34.1682688148142; 
 Fri, 28 Apr 2023 06:22:28 -0700 (PDT)
Received: from flawful.org (c-fcf6e255.011-101-6d6c6d3.bbcust.telenor.se.
 [85.226.246.252]) by smtp.gmail.com with ESMTPSA id
 d14-20020ac2544e000000b004eb3b6da6f5sm3311569lfn.228.2023.04.28.06.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 06:22:27 -0700 (PDT)
Received: by flawful.org (Postfix, from userid 112)
 id 038E13C7; Fri, 28 Apr 2023 15:22:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688147; bh=ibmXy2CRcdpLeifq7jq45M/Hnw3e1B/SSAwPsJ6Nnzs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aBFlC4gcnD64zKdZAKCjkDqyOf1CTU5qz/D2XhY/d2KcF/Na90eteAgwORYJlVc5D
 1Sfl6PBUZx6E5inKVuJWEzpcvI47IDFANbyfRcP368EdzxyVDTb7ha+yQ2Mursp/OL
 00TJ6CXjnrtIunlKqpZjJmc9gvr8RlfSBkkxasj4=
Received: from x1-carbon.lan (OpenWrt.lan [192.168.1.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by flawful.org (Postfix) with ESMTPSA id 890164EB;
 Fri, 28 Apr 2023 15:21:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=flawful.org; s=mail;
 t=1682688100; bh=ibmXy2CRcdpLeifq7jq45M/Hnw3e1B/SSAwPsJ6Nnzs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pjU3a4yFYTLpyLE46XaRN2H1isrYosnQWAkTKvoUmX1Mz8KmIIfzoiDgbOQnv4Lo3
 iqcyFMF6Ek/TFanJwQ9nMHRGPPAEIM0DFxyadysPR2/a4UTR1lB0vZ7HjOeRAyVMnL
 kZ8KtR2jCdWg8n0zgMksoKM+3sabrEEoQHsfyWQ8=
From: Niklas Cassel <nks@flawful.org>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <niklas.cassel@wdc.com>
Subject: [PATCH 3/9] hw/ide/ahci: write D2H FIS on when processing NCQ command
Date: Fri, 28 Apr 2023 15:21:18 +0200
Message-Id: <20230428132124.670840-4-nks@flawful.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428132124.670840-1-nks@flawful.org>
References: <20230428132124.670840-1-nks@flawful.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=nks.gnu@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 28 Apr 2023 09:29:45 -0400
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

From: Niklas Cassel <niklas.cassel@wdc.com>

The way that BUSY + PxCI is cleared for NCQ (FPDMA QUEUED) commands is
described in SATA 3.5a Gold:

11.15 FPDMA QUEUED command protocol
DFPDMAQ2: ClearInterfaceBsy
"Transmit Register Device to Host FIS with the BSY bit cleared to zero
and the DRQ bit cleared to zero and Interrupt bit cleared to zero to
mark interface ready for the next command."

PxCI is currently cleared by handle_cmd(), but we don't write the D2H
FIS to the FIS Receive Area that actually caused PxCI to be cleared.

Similar to how ahci_pio_transfer() calls ahci_write_fis_pio() with an
additional parameter to write a PIO Setup FIS without raising an IRQ,
add a parameter to ahci_write_fis_d2h() so that ahci_write_fis_d2h()
also can write the FIS to the FIS Receive Area without raising an IRQ.

Change process_ncq_command() to call ahci_write_fis_d2h() without
raising an IRQ (similar to ahci_pio_transfer()), such that the FIS
Receive Area is in sync with the PxTFD shadow register.

E.g. Linux reads status and error fields from the FIS Receive Area
directly, so it is wise to keep the FIS Receive Area and the PxTFD
shadow register in sync.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 hw/ide/ahci.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index a36e3fb77c..62aebc8de7 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -43,7 +43,7 @@
 static void check_cmd(AHCIState *s, int port);
 static int handle_cmd(AHCIState *s, int port, uint8_t slot);
 static void ahci_reset_port(AHCIState *s, int port);
-static bool ahci_write_fis_d2h(AHCIDevice *ad);
+static bool ahci_write_fis_d2h(AHCIDevice *ad, bool d2h_fis_i);
 static void ahci_init_d2h(AHCIDevice *ad);
 static int ahci_dma_prepare_buf(const IDEDMA *dma, int32_t limit);
 static bool ahci_map_clb_address(AHCIDevice *ad);
@@ -618,7 +618,7 @@ static void ahci_init_d2h(AHCIDevice *ad)
         return;
     }
 
-    if (ahci_write_fis_d2h(ad)) {
+    if (ahci_write_fis_d2h(ad, true)) {
         ad->init_d2h_sent = true;
         /* We're emulating receiving the first Reg H2D Fis from the device;
          * Update the SIG register, but otherwise proceed as normal. */
@@ -850,7 +850,7 @@ static void ahci_write_fis_pio(AHCIDevice *ad, uint16_t len, bool pio_fis_i)
     }
 }
 
-static bool ahci_write_fis_d2h(AHCIDevice *ad)
+static bool ahci_write_fis_d2h(AHCIDevice *ad, bool d2h_fis_i)
 {
     AHCIPortRegs *pr = &ad->port_regs;
     uint8_t *d2h_fis;
@@ -864,7 +864,7 @@ static bool ahci_write_fis_d2h(AHCIDevice *ad)
     d2h_fis = &ad->res_fis[RES_FIS_RFIS];
 
     d2h_fis[0] = SATA_FIS_TYPE_REGISTER_D2H;
-    d2h_fis[1] = (1 << 6); /* interrupt bit */
+    d2h_fis[1] = d2h_fis_i ? (1 << 6) : 0; /* interrupt bit */
     d2h_fis[2] = s->status;
     d2h_fis[3] = s->error;
 
@@ -890,7 +890,10 @@ static bool ahci_write_fis_d2h(AHCIDevice *ad)
         ahci_trigger_irq(ad->hba, ad, AHCI_PORT_IRQ_BIT_TFES);
     }
 
-    ahci_trigger_irq(ad->hba, ad, AHCI_PORT_IRQ_BIT_DHRS);
+    if (d2h_fis_i) {
+        ahci_trigger_irq(ad->hba, ad, AHCI_PORT_IRQ_BIT_DHRS);
+    }
+
     return true;
 }
 
@@ -1120,6 +1123,8 @@ static void process_ncq_command(AHCIState *s, int port, const uint8_t *cmd_fis,
         return;
     }
 
+    ahci_write_fis_d2h(ad, false);
+
     ncq_tfs->used = 1;
     ncq_tfs->drive = ad;
     ncq_tfs->slot = slot;
@@ -1506,7 +1511,7 @@ static void ahci_cmd_done(const IDEDMA *dma)
     }
 
     /* update d2h status */
-    ahci_write_fis_d2h(ad);
+    ahci_write_fis_d2h(ad, true);
 
     if (ad->port_regs.cmd_issue && !ad->check_bh) {
         ad->check_bh = qemu_bh_new(ahci_check_cmd_bh, ad);
-- 
2.40.0


