Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 626FB357813
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 00:57:26 +0200 (CEST)
Received: from localhost ([::1]:54310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUH6y-0005y7-SZ
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 18:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUH5q-0005Ku-M0; Wed, 07 Apr 2021 18:56:14 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUH5p-0007a7-1j; Wed, 07 Apr 2021 18:56:14 -0400
Received: by mail-ej1-x633.google.com with SMTP id u17so24058044ejk.2;
 Wed, 07 Apr 2021 15:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wi3bMRy77Fy5wfLWhEljFj4gYssd4093UZKsi/E/ioU=;
 b=L5U9QzS2iSeRUlwW263zsx5IotFdDZUVd6nugq1/V6wGZATsriajUelwuCEhRndqHQ
 EETeu8MlaeW9cag2/wQujdz4PKIUDrftwUA4xn0FlUvTuNaOc9FvykZVuWrhEzGUWTk7
 jSsxghTZfcyJIRtgFZ0vGHaK/uYed5OL3O47atXMDkflEitUJVsxao7qGVr7Seok8GcL
 vbyDnOSERk/AxYYoEW/pm+bkAGEtCBa+3IzCiiN/fnOQm/Rrofu3HWIEQFGuXL4pBw3M
 TJjdSEu61YTWbX5xexYp6ABVR6w0Zu5Vq3Kif0YHbWL9Y/BUGJ5l5rmKvRs1X3mp/OTK
 lSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wi3bMRy77Fy5wfLWhEljFj4gYssd4093UZKsi/E/ioU=;
 b=rCbrG/JQeuCXykW07yCsw/E59Dt4RsS3Gh/JdF+1q8IuxRjvbFH/KoKf0r8bUQxi31
 ikd1pr5hGvi/cKNAOwoR/e063dmSHDky9pdEpyHnQVNaFhGe59A1YUrnoc57LwTURM7d
 +CH+f+s1WZg3/Cn8jCOiT7KCq5IaB8DxdHuvpnI5ZuuNtaKfVFUpEcVzWx8OEThk2WTV
 SPlAMdz/8ejiauYr20R+lViXQtoORN+AVrQ1WDaM/Gne8zmAgRDVzw1Aes1qofnbSJB1
 XPRsbKESpvFR9M5ALlDzBgaZEpccRBoB0PAeV0qDubstjDBYXnsmZjdRUduB43GXSOn3
 Q2QQ==
X-Gm-Message-State: AOAM533FCR0o8WFTI4BxVNnmEOR6pv+ljBIMEJf3cWL8yofhz9RWgCMG
 zhlaaLRuJM0d/o/RH1aH3cagtqEvdBI3JA==
X-Google-Smtp-Source: ABdhPJxOh3G/WBf5DPgbq7rVZmrQkPVdWlCPvjTobaubngZOQ+NaqfIJboxNh7vxviHT67ymHTMImg==
X-Received: by 2002:a17:906:811:: with SMTP id
 e17mr6345560ejd.535.1617836170587; 
 Wed, 07 Apr 2021 15:56:10 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id e15sm7069613ejh.56.2021.04.07.15.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 15:56:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0?] hw/arm/imx25_pdk: Fix error message for invalid RAM
 size
Date: Thu,  8 Apr 2021 00:56:08 +0200
Message-Id: <20210407225608.1882855-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/arm/imx25_pdk.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index 1c201d0d8ed..51fde71b1bd 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -67,7 +67,6 @@ static struct arm_boot_info imx25_pdk_binfo;
 
 static void imx25_pdk_init(MachineState *machine)
 {
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
     IMX25PDK *s = g_new0(IMX25PDK, 1);
     unsigned int ram_size;
     unsigned int alias_offset;
@@ -79,8 +78,8 @@ static void imx25_pdk_init(MachineState *machine)
 
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
2.26.3


