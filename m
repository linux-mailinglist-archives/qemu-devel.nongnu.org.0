Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422C4378C58
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:38:57 +0200 (CEST)
Received: from localhost ([::1]:52638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5BY-0005p6-93
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4zA-0006Dz-CG
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4z8-0003HN-DS
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:08 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso9587471wmc.1
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jvz4r6apxuW1lveLKyXMmu2dN42LHk0Z7q4wIAJ/vfQ=;
 b=m/yDxsShYOEeC6jKCttdzIqe6TXsRLmd7nL1cWGdb7SzL2NSuCS8Kne+13/c+TNqaM
 2dBIIcr5Tgc6RqdEPGIXYJRSKa0CUKP8nc4UnMThH3nixkmdUOh+Sc0H5ieL6d/4POfr
 lrt90oyv8EqJSPMB7F78NizAWsYJMNOCU7Iwr7cPb/EbvA4JpAxV2NtEJrk2Eb9FHZdE
 DiEGjms5VVMRcBpoQbKi28hHVH2Z5tdVSv8rTH0f8mrNtfsLy5AAXVPv0CsXTNDNU9tE
 4250VwIQ8sMnzFZzSVPEq1vHut2cm4EEwX7ZoN7tYiHU7XMl4DG0lilVO45iJoxRPRq3
 Lw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jvz4r6apxuW1lveLKyXMmu2dN42LHk0Z7q4wIAJ/vfQ=;
 b=AKEftpxIyn6Zz0g19+TAB9cwU/rZG23iiFA7vY6CKI0d/PMgpNx/nVhbXrIP5EyQvp
 jryuya5zavvsZFi4MZLz+INyxkREV6n37S3G0ibQmg9B+hH3J6DSVLgdz9K9f5q3qYKx
 sIEg5Mw6AgC4vgjdg/j9iom5HNpoJ+LnWgYbSrIfZO1yUyRDakf8qX6ABH8AncTzM8i4
 OvPygkDCstIBLvXwT0qPgNBUhiQdEAnO3d2nvYgx7xXpMdVTadJ1vF/LryRg6BBYWGFO
 xRh1UPlUOiVZEnAu2vIe9tCKdPdjYwaQlq5dZ27Arlcp4E4aMggWmRL83CDkcuSGFWOD
 q8tw==
X-Gm-Message-State: AOAM530PCMuez2/M49XuxSb/SOIJ7uyI9rObUjQcrD/z4CLceadq+VIf
 0r2IaemZtsOwbmBx12PyQuZKNQEXUpvY7Q==
X-Google-Smtp-Source: ABdhPJz1pQMRhoXDT93G4Yzo+zGlZIrpMEnYNOnFyPMXz6QMwj3lx+ZZJooXSr8zXHFRUje6NRWXzQ==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr36584967wmk.83.1620649564994; 
 Mon, 10 May 2021 05:26:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.26.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/26] hw/arm/imx25_pdk: Fix error message for invalid RAM size
Date: Mon, 10 May 2021 13:25:44 +0100
Message-Id: <20210510122548.28638-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The i.MX25 PDK board has 2 banks for SDRAM, each can
address up to 256 MiB. So the total RAM usable for this
board is 512M. When we ask for more we get a misleading
error message:

  $ qemu-system-arm -M imx25-pdk -m 513M
  qemu-system-arm: Invalid RAM size, should be 128 MiB

Update the error message to better match the reality:

  $ qemu-system-arm -M imx25-pdk -m 513M
  qemu-system-arm: RAM size more than 512 MiB is not supported

Fixes: bf350daae02 ("arm/imx25_pdk: drop RAM size fixup")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-id: 20210407225608.1882855-1-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/imx25_pdk.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index 11426e5ec0c..bd16acd4d9f 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -65,7 +65,6 @@ static struct arm_boot_info imx25_pdk_binfo;
 
 static void imx25_pdk_init(MachineState *machine)
 {
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
     IMX25PDK *s = g_new0(IMX25PDK, 1);
     unsigned int ram_size;
     unsigned int alias_offset;
@@ -77,8 +76,8 @@ static void imx25_pdk_init(MachineState *machine)
 
     /* We need to initialize our memory */
     if (machine->ram_size > (FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE)) {
-        char *sz = size_to_str(mc->default_ram_size);
-        error_report("Invalid RAM size, should be %s", sz);
+        char *sz = size_to_str(FSL_IMX25_SDRAM0_SIZE + FSL_IMX25_SDRAM1_SIZE);
+        error_report("RAM size more than %s is not supported", sz);
         g_free(sz);
         exit(EXIT_FAILURE);
     }
-- 
2.20.1


