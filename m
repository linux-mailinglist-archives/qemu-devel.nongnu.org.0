Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCC42EBA15
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 07:39:23 +0100 (CET)
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx2Ta-000276-MQ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 01:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx2Pi-0000OX-4z; Wed, 06 Jan 2021 01:35:22 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kx2Pg-0006HW-DX; Wed, 06 Jan 2021 01:35:21 -0500
Received: by mail-pj1-x102a.google.com with SMTP id j13so1084388pjz.3;
 Tue, 05 Jan 2021 22:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hI10iUcIAI/iQ1m4mauQ5SNhBSk9eoPehRL5woqTjh0=;
 b=Cirqna35dtXcLZQD2EsT66GQGcUbjHQdzG1rkJ09VrqTojHqqeycKV+wyMbMlX563Z
 cM3Nq9hpiyxcj4CYwa8s4c5esP/zfFUnMfQlMG95fEYbhDzkXxKH5y6dogE3gslqu3OY
 j8ITonjQ5IL1gkYMp3ANDwNcLlMgnAGEuOPp68yHz7DHPJytWTASupvQperkEBdk+aDa
 zLbYac4QlUUySnqG4cAgOUYNAjvuIjGgOO94O/CmxY6VlzaOYwanB8VyOQXZ6wfN3mNq
 6KHn3LdMwEnNch3+lRLruN8Ekig/FUpbAv9HfsgsRd1PUyYVH8yAdXJvDDsqGG7jHmIU
 VIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hI10iUcIAI/iQ1m4mauQ5SNhBSk9eoPehRL5woqTjh0=;
 b=i9bCiRPRtLeV80twdGlAvKJWUF57rzfcORv/WwWFujnTMjH/+hLZGSac7pufwg0pHK
 IL4iSwA5klsQaY14J6i06NlgUbDC8fIA1AeCE1EJaNSYc6g2gPta47DDK+LFLfc7l084
 tmyHSLubUrhsyvbCbxOlLbJlMSUjp5UssIz/IEY0+Di/qZfu1RHPjfvdZ4Vjk+GokRxL
 4ET+Fzj1Ygm3xjT2Ahr3aIoiDlA8ckPQRlP+g7m2lILuynk0NtUt7q7OQ9NsQY+QDokf
 8WjPPjB/0Gbi5PXT8tLAAp9CLCidIn5sUB2tRw7iNAB3nmzBTCaRVFJWYkE4ogoSL3e3
 nasA==
X-Gm-Message-State: AOAM5317QiiaP3DKH/x1KYQzIYg5vvaHA8EFuClaLV6Ww49lwDxqQY2o
 wC7kLHn8ZE6ZGcUtOzuxghc=
X-Google-Smtp-Source: ABdhPJwGl7aSlb4N5qQUKOqbhaQy/7mo+ogiUeTv28yqfxJdN96xOBYNX+F7U2vNubF0yR3Exi3TNA==
X-Received: by 2002:a17:902:bf4a:b029:da:d0b8:6489 with SMTP id
 u10-20020a170902bf4ab02900dad0b86489mr3170171pls.58.1609914918392; 
 Tue, 05 Jan 2021 22:35:18 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id cu4sm1132976pjb.18.2021.01.05.22.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 22:35:17 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Wed,  6 Jan 2021 14:35:01 +0800
Message-Id: <20210106063504.10841-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210106063504.10841-1-bmeng.cn@gmail.com>
References: <20210106063504.10841-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

U-Boot expects PMU_MISC0 register bit 7 is set (see init_bandgap()
in arch/arm/mach-imx/mx6/soc.c) during boot. This bit indicates the
bandgap has stabilized.

With this change, the latest upstream U-Boot (v2021.01-rc3) for imx6
sabrelite board (mx6qsabrelite_defconfig), with a slight change made
by switching CONFIG_OF_SEPARATE to CONFIG_OF_EMBED, boots to U-Boot
shell on QEMU with the following command:

$ qemu-system-arm -M sabrelite -smp 4 -m 1G -kernel u-boot \
    -display none -serial null -serial stdio

Boot log below:

  U-Boot 2021.01-rc3 (Dec 12 2020 - 17:40:02 +0800)

  CPU:   Freescale i.MX?? rev1.0 at 792 MHz
  Reset cause: POR
  Model: Freescale i.MX6 Quad SABRE Lite Board
  Board: SABRE Lite
  I2C:   ready
  DRAM:  1 GiB
  force_idle_bus: sda=0 scl=0 sda.gp=0x5c scl.gp=0x55
  force_idle_bus: failed to clear bus, sda=0 scl=0
  force_idle_bus: sda=0 scl=0 sda.gp=0x6d scl.gp=0x6c
  force_idle_bus: failed to clear bus, sda=0 scl=0
  force_idle_bus: sda=0 scl=0 sda.gp=0xcb scl.gp=0x5
  force_idle_bus: failed to clear bus, sda=0 scl=0
  MMC:   FSL_SDHC: 0, FSL_SDHC: 1
  Loading Environment from MMC... *** Warning - No block device, using default environment

  In:    serial
  Out:   serial
  Err:   serial
  Net:   Board Net Initialization Failed
  No ethernet found.
  starting USB...
  Bus usb@2184000: usb dr_mode not found
  USB EHCI 1.00
  Bus usb@2184200: USB EHCI 1.00
  scanning bus usb@2184000 for devices... 1 USB Device(s) found
  scanning bus usb@2184200 for devices... 1 USB Device(s) found
         scanning usb for storage devices... 0 Storage Device(s) found
         scanning usb for ethernet devices... 0 Ethernet Device(s) found
  Hit any key to stop autoboot:  0
  =>

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

(no changes since v1)

 hw/misc/imx6_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index cb740427ec..7e031b6775 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -450,7 +450,7 @@ static void imx6_ccm_reset(DeviceState *dev)
     s->analog[PMU_REG_3P0] = 0x00000F74;
     s->analog[PMU_REG_2P5] = 0x00005071;
     s->analog[PMU_REG_CORE] = 0x00402010;
-    s->analog[PMU_MISC0] = 0x04000000;
+    s->analog[PMU_MISC0] = 0x04000080;
     s->analog[PMU_MISC1] = 0x00000000;
     s->analog[PMU_MISC2] = 0x00272727;
 
-- 
2.25.1


