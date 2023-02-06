Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E3A68C921
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 23:09:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP9et-0005Lj-DJ; Mon, 06 Feb 2023 17:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eo-0005F2-EB; Mon, 06 Feb 2023 17:08:14 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9em-0007Nl-Ss; Mon, 06 Feb 2023 17:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D+xdaajBCmuiErpKUV92p9eXOdHBs5EOUDssNOnSHAE=; b=pzlMTQBT8z8sspBV03iEkQWH3T
 aqIRsrgaL++Ct6D6N+59bxrwv0icIjYsKdPEwNB9qQPRgCRYTj9NWvtyugtFLsiIp1fZJctQDv64Z
 X0/IDCZ/hKG5Zc3kmPpn65xhkFNjuAGkVrSEi8BkcfNTkEysk41cLkfDMrewnWN8h8pVWt9yAJ0T5
 FFU/AZ4zXpPWvviqRvGEx0gnsGWvZN+nDCIr1+UXtZiCzLx/l4IBEkM/Z1ER/TTy7odDRzf3Hv1er
 EME+uqL2vR4se90nJzxfFKl1NB51VGAjgdGlyCHI013aepOtXEur+vdRxkL6aBZUUU9yaDohTxaE5
 bjAOQWEFDroK020eVrDOCeT027cqN87DVflGgl1uF9v8azrGmnj5yyHe3qJ4a5v3t0YTNd887zE81
 EpE5+Np9djoRs3t8V2j+WNL59LCJizzjRJgS8RxQkKpkjHmu3OL6BAf9b9+d4kueIUhvWep063DEt
 Ybe5qN9oBiQcQ8ExXJmHQR5sGHYLDcUBDT4rCP9kLLkfFMc4XyWpYabyoS19q3FgscnR3ra/Q3EEF
 SJvlGxb+yW8Aebzk7BoQsAi7RARG0j+SdEoG0/d7JYqN+mo+xgbT2ddtDVYb/o5sPw2iI4x6ZLLVo
 djDCSHkBlu15AdsBp0v0oImVApYFS7bPTI0IQAT2E=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pP9eE-00039N-4O; Mon, 06 Feb 2023 22:07:42 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Date: Mon,  6 Feb 2023 22:07:22 +0000
Message-Id: <20230206220722.125814-9-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
References: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 8/8] mac_oldworld: Allow specifying nvram backing store
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

From: BALATON Zoltan <balaton@eik.bme.hu>

Add a way to set a backing store for the mac_nvram. Use -drive
file=nvram.img,format=raw,if=mtd to specify backing file where
nvram.img must be MACIO_NVRAM_SIZE which is 8192 bytes.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <1aadee8f0ca0f56cf1b7c45c3944676a07d91de9.1675297286.git.balaton@eik.bme.hu>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/ppc/mac_oldworld.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 5a7b25a4a8..2e4cc3fe0b 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -102,7 +102,7 @@ static void ppc_heathrow_init(MachineState *machine)
     DeviceState *dev, *pic_dev, *grackle_dev;
     BusState *adb_bus;
     uint16_t ppc_boot_device;
-    DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
+    DriveInfo *dinfo, *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
     void *fw_cfg;
     uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
 
@@ -245,6 +245,12 @@ static void ppc_heathrow_init(MachineState *machine)
     qdev_prop_set_chr(dev, "chrA", serial_hd(0));
     qdev_prop_set_chr(dev, "chrB", serial_hd(1));
 
+    dinfo = drive_get(IF_MTD, 0, 0);
+    if (dinfo) {
+        dev = DEVICE(object_resolve_path_component(macio, "nvram"));
+        qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
+    }
+
     pci_realize_and_unref(PCI_DEVICE(macio), pci_bus, &error_fatal);
 
     pic_dev = DEVICE(object_resolve_path_component(macio, "pic"));
-- 
2.30.2


