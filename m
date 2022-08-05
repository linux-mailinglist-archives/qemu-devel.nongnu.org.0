Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D6D58A8FC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 11:46:54 +0200 (CEST)
Received: from localhost ([::1]:43678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJtuv-0007xe-3r
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 05:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoE-0007Jk-F2; Fri, 05 Aug 2022 05:39:58 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:33384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJtoC-0001Qv-Mw; Fri, 05 Aug 2022 05:39:58 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id q15so1988994vsr.0;
 Fri, 05 Aug 2022 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mO1pyhNh7FBjFV2nX8yrWBbovbYOVIGYqaGtZXY/PXk=;
 b=QSaN6gPZtzTjgdDmTcn3DNchbUulwX9Yy/j7a8aoeijxntzeCEPrKZkq9wtV5rXdnd
 0mmSXrjpQCC4DgTKiGR2e97YRQWUMldHpvMXiSgLuBDrJ8CTdYUtEIJz39xT2oSmzW1p
 NwrJwbgW3oESUSyE/iOQFjyjIVr3PdQnHMSPjnZ5EgHQo2F2bY3su8CyUnKhB9QvN5Go
 xvg+ZJd+nth7jHz2vNYGCEvWW1iHYYLg32PvUg957WyYOIpbHjWk3SeS06YEpzI+Xycb
 2YaAloEL3rDDwbGhMIpglKGnFg4aIwwgyggyXG2rUFm13Y3AcW0P8mNxOQcITbvLVrAg
 gS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mO1pyhNh7FBjFV2nX8yrWBbovbYOVIGYqaGtZXY/PXk=;
 b=DdfI2oxuSzh4rdrhVs8OwypgjwLUTrpyQFp1RMdozsAfRgJgAysdT10cmyEhEktrhm
 K/exwRwGHrVzx/I2qXB8+XVUVIyoBdfkhUYwGNnrZIe/IkvYtbCKZQAy7RVjdP8Qsbyb
 O9Mm4RN5sC6VLmhTb47fWL8PVvWlYIl1RTr1c59FHmyFdcr5mnu8wIRHI0g3kcwFkHBG
 ZsjZ00MX6G3+XmB+CDsElVcZdFRZ7Qi0ZfPGqdo8KmmST5gBiE16O5SoHQ6p6Zk65VC8
 x1ivNdWqTZyDRtJk9vJTlmiI0SF33iE8iKmxORMXzJJb9t42gz8cUz2RI0xJE5Cc8uwI
 9ITA==
X-Gm-Message-State: ACgBeo1eptIKauWrSH0J3vwEQZ5Ya7sNS7ClZ6jI+xLj9JBwf/pBpp7f
 +b3HRth6iYGMgJ13MMCK9tp8WNl6/bw=
X-Google-Smtp-Source: AA6agR7RywozYypX/Wn+U3diSsydoifdXaRv3cXORAU6f6eRiBY5EKj/eKb1OZEI37LUIhscZ5ca+g==
X-Received: by 2002:a67:cb93:0:b0:388:494d:4419 with SMTP id
 h19-20020a67cb93000000b00388494d4419mr2510881vsl.28.1659692395327; 
 Fri, 05 Aug 2022 02:39:55 -0700 (PDT)
Received: from balboa.COMFAST ([191.19.239.67])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a1f1f09000000b00376f4f93745sm2668496vkf.10.2022.08.05.02.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 02:39:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH for-7.2 v2 01/20] hw/arm: do not free machine->fdt in
 arm_load_dtb()
Date: Fri,  5 Aug 2022 06:39:29 -0300
Message-Id: <20220805093948.82561-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805093948.82561-1-danielhb413@gmail.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

At this moment, arm_load_dtb() can free machine->fdt when
binfo->dtb_filename is NULL. If there's no 'dtb_filename', 'fdt' will be
retrieved by binfo->get_dtb(). If get_dtb() returns machine->fdt, as is
the case of machvirt_dtb() from hw/arm/virt.c, fdt now has a pointer to
machine->fdt. And, in that case, the existing g_free(fdt) at the end of
arm_load_dtb() will make machine->fdt point to an invalid memory region.

This is not an issue right now because there's no code that access
machine->fdt after arm_load_dtb(), but we're going to add a couple do
FDT HMP commands that will rely on machine->fdt being valid.

Instead of freeing 'fdt' at the end of arm_load_dtb(), assign it to
machine->fdt. This will allow the FDT of ARM machines that relies on
arm_load_dtb() to be accessed later on.

Since all ARM machines allocates the FDT only once, we don't need to
worry about leaking the existing FDT during a machine reset (which is
something that other machines have to look after, e.g. the ppc64 pSeries
machine).

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/arm/boot.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index ada2717f76..9f5ceb62d2 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -684,7 +684,13 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
 
-    g_free(fdt);
+    /*
+     * Update the ms->fdt pointer to enable support for 'dumpdtb'
+     * and 'info fdt' commands. Use fdt_pack() to shrink the blob
+     * size we're going to store.
+     */
+    fdt_pack(fdt);
+    ms->fdt = fdt;
 
     return size;
 
-- 
2.36.1


