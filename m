Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A454DB6A8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:48:58 +0100 (CET)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWpV-0002o6-DU
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:48:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnT-0008Uq-BQ; Wed, 16 Mar 2022 12:46:51 -0400
Received: from [2a00:1450:4864:20::129] (port=45051
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnR-0006Dy-PX; Wed, 16 Mar 2022 12:46:50 -0400
Received: by mail-lf1-x129.google.com with SMTP id h14so4692785lfk.11;
 Wed, 16 Mar 2022 09:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1BoBbs6eeb+lVZErBadnCXOSSUo399tV4x1eLiM8pvc=;
 b=kyPMNs3HxUYGFM5b5xrvWe2iyuic1GspWjsZxQEEE61779Qed8pkrvMEUGkNriwthp
 /ota/YPAOHemWVMQQTaumgbNHdK9MZKXVdUnmtqgTz7dvuKzhibrdU2JEUsIKQTaGU1x
 2j3hpVc9uLWYPFoMfvaE3y2FV09mKksPZwwtfCuYEUocP6ygIn7FIfjNofh/T7YvfmfX
 cSNAS8LYgm2BdrsOQ2Zo0gWd1UodcvnBgID9vQFvpES+2qsKyCj/FZN29+aHgCiB8+Ij
 llC9M9mrTdYytJ2F9e36a4lszwpQmCqsL0bzlcvZi63bUJy/P+bLnX9O/TAyq0aK27gE
 du4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1BoBbs6eeb+lVZErBadnCXOSSUo399tV4x1eLiM8pvc=;
 b=BLvFUooF7XbAPfPdhkoI4E1W7KUy52v06RqPsbnxAUM7YXt7fa/+x6gASMKxXlStvP
 lcP48PssIy1Q6xfXQ26dbxwEmyxvJ+wY8Wc+B3DaX5G4LgYSmPL1d1PicuGO9sARG1nH
 OrdKGTrb8mkqmV/ChvmaiBzQ1w+mt/0dTOYln7ucdK7RcR5ESb+4VAcmxSp6Y9rWArjD
 S0pCDNqSqwSWN3xWLZ77SnDd1MVW4YMe+5V8AAWNa/WelezAC3HqVQlWRFUNJ5zF5qDJ
 Luy5yjfWZInCu1UMxtG9rCX3/kS4aePjT9kQFm4pnGSusccqVlYcRb3rwlUfkecIRMEr
 7COQ==
X-Gm-Message-State: AOAM531EB/ilk3QlHHHsKuXDm16VYZl9C1T8m7lFDoESxG+RUbrfac6O
 +MWklvMCU2s0Y3Ule+FkS8hH74CsZL39NA==
X-Google-Smtp-Source: ABdhPJwNnM6ASpI31XevmVpgt8S3U5e0P2DugZ/f3xFU1lRF3evGR5zxt43h8LyoX8Nw/ckeGj7aeA==
X-Received: by 2002:a05:6512:3187:b0:448:6a55:954b with SMTP id
 i7-20020a056512318700b004486a55954bmr307485lfe.534.1647449207635; 
 Wed, 16 Mar 2022 09:46:47 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a194913000000b0044821ce7e0fsm219479lfa.148.2022.03.16.09.46.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 09:46:47 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] hw/arm/xlnx-zynqmp: Add an unimplemented SERDES area
Date: Wed, 16 Mar 2022 17:46:40 +0100
Message-Id: <20220316164645.2303510-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
References: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add an unimplemented SERDES (Serializer/Deserializer) area.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/arm/xlnx-zynqmp.h | 2 +-
 hw/arm/xlnx-zynqmp.c         | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 9424f81c37..0552ba18b4 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -85,7 +85,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 /*
  * Unimplemented mmio regions needed to boot some images.
  */
-#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
+#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 2
 
 struct XlnxZynqMPState {
     /*< private >*/
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 6d0e4116db..47324cdc44 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -52,6 +52,10 @@
 #define QSPI_DMA_ADDR       0xff0f0800
 #define NUM_QSPI_IRQ_LINES  2
 
+/* Serializer/Deserializer.  */
+#define SERDES_ADDR         0xfd400000
+#define SERDES_SIZE         0x20000
+
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
 
@@ -284,6 +288,7 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
         hwaddr size;
     } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
         { .name = "apu", APU_ADDR, APU_SIZE },
+        { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
     };
     unsigned int nr;
 
-- 
2.25.1


