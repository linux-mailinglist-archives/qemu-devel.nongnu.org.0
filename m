Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624684AFE06
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 21:10:44 +0100 (CET)
Received: from localhost ([::1]:49982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHtIW-0004AH-68
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 15:10:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nHsSd-0005mf-5D; Wed, 09 Feb 2022 14:17:03 -0500
Received: from [2a00:1450:4864:20::531] (port=35602
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nHsSb-0002ga-GH; Wed, 09 Feb 2022 14:17:02 -0500
Received: by mail-ed1-x531.google.com with SMTP id f17so7244270edd.2;
 Wed, 09 Feb 2022 11:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BMghCbSCL4qbKPrSjLB+azqQNGvkMro5fb/3yR+6esA=;
 b=Cq/TbwFOZeicxDh8MxMELMNgkiPgBhxT1Nm8y1eTsJWsZHV5h/Z/pkj/N4uhpUPQXS
 F/B4W+5JVlGJ2WuI32ZbQfJj7b+cOPOaFj8adi2hyWBgphdyFASByh8n4rrI278gsfSK
 aSenK4ex/tIAB4DsSY7JUueNRrOO8T9VuCggdDGrtGVbsUygzpQp6MVIRsWlNvJpGNFi
 qqWycsQoRWmGpwGkyvYDAPeuO5ZH8zRK7XPx50VRe699uIoMO+8Vi/wP44HCyaMceu1c
 QfkdoSh0tED2vS3N6pLD2/sWzepNHs2qj5vD7BQTvSB3xISiI19P5ekLcXDN5XLgQo06
 I9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BMghCbSCL4qbKPrSjLB+azqQNGvkMro5fb/3yR+6esA=;
 b=jo2ZKmCkI4riWzBDshdaqmOyZ4GtVvoSw2J8qSQgGMO1GQcwHGlwKOS6w9Y5mJZLca
 ZQ00SosA9zjjC4jYmEk5TTxWfB395ybT0m+hNturvjaVLQkOaqe2hRQqC/dxh2Rm7/hL
 ieXD+dRyhiKc711N+IzkCvXIi1HLZyei6stjdhTTja6cACwwuipGhNiaMTCCoiLF7tcc
 KsHlxQJ4AAriIcCK7S/3UwPsRbr6yiJ5o5y9xT/OTYfaNNmzxsFvtAefH5jFlW/2NNiY
 jo1I4hs50F7HkB6WoaxdEcST/THLJ6jKfa/I3prIg519UO0WIwKfBPZNrs9mHgRnrOnC
 4BVg==
X-Gm-Message-State: AOAM532LPtwyIEq4krmKN2V5Whp+apdFF94RZMmGucHKy+LfsMjM20cW
 bRSF9lyd6k+mBi4SKYh70151z4tXL+8=
X-Google-Smtp-Source: ABdhPJxCGQQHDj8QY660IxjD73Q3VpkpbHmEn0EyW+XkN3Kh1gyXUmuqDHlZ0nvotpDmO27WvXihdQ==
X-Received: by 2002:a05:6402:35ca:: with SMTP id
 z10mr4364967edc.43.1644434197701; 
 Wed, 09 Feb 2022 11:16:37 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-183-173-215.77.183.pool.telefonica.de. [77.183.173.215])
 by smtp.gmail.com with ESMTPSA id a21sm6496736eds.5.2022.02.09.11.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:16:37 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/fdc-isa: Respect QOM properties when building AML
Date: Wed,  9 Feb 2022 20:15:58 +0100
Message-Id: <20220209191558.30393-1-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "open list:Floppy" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Other ISA devices such as serial-isa use the properties in their
build_aml functions. fdc-isa not using them is probably an oversight.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/block/fdc-isa.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index 3bf64e0665..ab663dce93 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -216,6 +216,7 @@ int cmos_get_fd_drive_type(FloppyDriveType fd0)
 
 static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
 {
+    FDCtrlISABus *isa = ISA_FDC(isadev);
     Aml *dev;
     Aml *crs;
     int i;
@@ -227,11 +228,13 @@ static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
     };
 
     crs = aml_resource_template();
-    aml_append(crs, aml_io(AML_DECODE16, 0x03F2, 0x03F2, 0x00, 0x04));
-    aml_append(crs, aml_io(AML_DECODE16, 0x03F7, 0x03F7, 0x00, 0x01));
-    aml_append(crs, aml_irq_no_flags(6));
     aml_append(crs,
-        aml_dma(AML_COMPATIBILITY, AML_NOTBUSMASTER, AML_TRANSFER8, 2));
+        aml_io(AML_DECODE16, isa->iobase + 2, isa->iobase + 2, 0x00, 0x04));
+    aml_append(crs,
+        aml_io(AML_DECODE16, isa->iobase + 7, isa->iobase + 7, 0x00, 0x01));
+    aml_append(crs, aml_irq_no_flags(isa->irq));
+    aml_append(crs,
+        aml_dma(AML_COMPATIBILITY, AML_NOTBUSMASTER, AML_TRANSFER8, isa->dma));
 
     dev = aml_device("FDC0");
     aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0700")));
-- 
2.35.1


