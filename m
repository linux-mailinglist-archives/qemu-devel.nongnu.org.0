Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2AA630C5B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Nov 2022 07:03:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owGvh-00027i-V4; Sat, 19 Nov 2022 01:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1owGvY-00025Y-8p
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 01:02:10 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1owGvW-0004JH-AU
 for qemu-devel@nongnu.org; Sat, 19 Nov 2022 01:02:08 -0500
Received: by mail-pj1-x1036.google.com with SMTP id h14so6247653pjv.4
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 22:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IgMsFcKIFXEJnxsOjdqwfEPWmrrueXtnYh16aBLuONE=;
 b=2u7LE1fQqFqTkUUVHWibXneL5T9lb2rN9eNayPEmL2H1dxue937+7Dcygl1MVbOtA/
 4AN8Iwrle9a1A6bUvXztD7PB/rSikCad+0J8VlOgO09P/iYFXrWG06o2YA4RoJgxS/mF
 VJrUnY8axeDOB9O2UNaSgb5ToD4JxUBnm18Ch0Prsb548LZIZ/s2dewtXUmxyNPgtFYR
 2G4rG7LgydZjOKFw8SMXYyltAGXNFSsbt7XNjn2OSBNpFt9w5RhhlGCJ7bqJnwE7FkwV
 Dh5RIPn2cSbs3c0/VtlY/thGtyFNnpCNb2gDCqexlp8Ir9skvIrIbV5zvkH2Q6MtHRMZ
 cjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IgMsFcKIFXEJnxsOjdqwfEPWmrrueXtnYh16aBLuONE=;
 b=ZTA2KNDRNlX1GCVnbkxNINgp6I6mLPxUBsa3IJ7oxkG8ZOwLAJ0bq8F/E7Lh76FCBy
 7MiKDMg6myTb1ePSbOKGZUKI8qP2Ga2UG8FgZNk8FgI+qwhxn7v2PMW7G3f0MU4kYWKM
 ng28o+0YRBx8o7gWtajc8BqfB+z5LcIUsv/AOdiXfYmuxhvc8C1/zvh+NAXXM1FfsHdi
 mh8tLhozShFS2oQ/woVGUz5aPHTaiKGJFk97wi57YSs4nVwjQmP2ry8pFNAXzlyOytxe
 RERHvj+2LQZWR/qn3hY8kMQfcfC2api2JKw6NgBWn5RlrBozxrvQQIMjkSkz/hONFBAj
 olCw==
X-Gm-Message-State: ANoB5pnNbERHmMzGUP/HD/brh34qve6jVhUgv5n9Qc1/4O8cotdkPGmD
 9SlY4wAidwQvIWBWtn2rnRsp/X4CuVvzlQ==
X-Google-Smtp-Source: AA0mqf70cV/BF8op45Z87b9lFmloeINhusbLQPE8reOk2V3PJTZeFr4swAbujq7zMXaE7PyrIWaB+Q==
X-Received: by 2002:a17:902:7001:b0:188:e219:32bb with SMTP id
 y1-20020a170902700100b00188e21932bbmr2829296plk.64.1668837724519; 
 Fri, 18 Nov 2022 22:02:04 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902784e00b0018661d627d7sm4785814pln.59.2022.11.18.22.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 22:02:04 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] e1000e: Define E1000_SWSM_SMBI
Date: Sat, 19 Nov 2022 15:01:56 +0900
Message-Id: <20221119060156.110010-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Define yet another magic number. The definition was copied from:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000e/defines.h?h=v6.0.9#n374

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000_regs.h  | 7 +++++++
 hw/net/e1000e_core.c | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 9d423f6c09..214ba0f6f2 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -571,6 +571,13 @@
 /* PHY Link Partner Ability Register */
 #define MII_LPAR_LPACK           0x4000 /* Acked by link partner */
 
+/* SW Semaphore Register */
+#define E1000_SWSM_SMBI         0x00000001 /* Driver Semaphore bit */
+#define E1000_SWSM_SWESMBI      0x00000002 /* FW Semaphore bit */
+#define E1000_SWSM_DRV_LOAD     0x00000008 /* Driver Loaded Bit */
+
+#define E1000_SWSM2_LOCK        0x00000002 /* Secondary driver semaphore bit */
+
 /* Interrupt Cause Read */
 #define E1000_ICR_TXDW          0x00000001 /* Transmit desc written back */
 #define E1000_ICR_TXQE          0x00000002 /* Transmit Queue empty */
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index fc9cdb4528..a560fcb580 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2634,7 +2634,7 @@ static uint32_t
 e1000e_mac_swsm_read(E1000ECore *core, int index)
 {
     uint32_t val = core->mac[SWSM];
-    core->mac[SWSM] = val | 1;
+    core->mac[SWSM] = val | E1000_SWSM_SMBI;
     return val;
 }
 
-- 
2.38.1


