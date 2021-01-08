Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41C12EF545
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:59:55 +0100 (CET)
Received: from localhost ([::1]:52470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuB8-0003LF-SM
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtov-000551-C9
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:57 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtor-0002zf-GV
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:57 -0500
Received: by mail-wr1-x431.google.com with SMTP id d13so9367646wrc.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=y3Fa3uOgGDt+2ElYGobv8hDNglxxVduImG7QdAhjbfc=;
 b=qR/BAvuXxLiVBSlhOUao0OIIDmZn4jDZWLRxmKDUyfLi9eZupm0nJ2cMT+70g41G9J
 wGGLif+AI1K3C5yzNtSBcff54MaLEtebodADJ7FvsS2CS260RzxoDYrJxl4lPUoHRVjL
 5kiHrz4+1+5QpL+tFircMOrB+GdDdIPhR2hGvBhvdii4Va2mGohnGJMlCs/rBPksV1q5
 kESnEOcIM3BiNJjDZgMB4TPk73is5ImUuAyyoUUVX6UQPag8Bwz+V5/4XyTtOE7ssslw
 +fFJL1W89MhWrlV2SsxdfIPjxdTOHw6dz3WZopQQpcbOyRl3G88eInHW1mqDA5lDSvnP
 ZMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y3Fa3uOgGDt+2ElYGobv8hDNglxxVduImG7QdAhjbfc=;
 b=bALV0U4DZ6IXPVNdQh0fnEIkfAGG5ldd1YdDy7HHA4v3tIqhj/Co49MsP1VKLketsB
 7F2lbqgXsb7pe65BDtNr4X86ujDuMKhW4fPXxYN8R/pH1vWhkrr8uBL0P9yYmxVtwXyP
 oKBYu2KnJUFL9b5PwXVZpMXciEyWPmd3U8b5keXrpeBYXPsS5Rv9rN2Otwoxg3HuUaZv
 nwE0nKW+3u0B6aHHUF8KEUWasrc4luNCB4NIygTNH3GElFbxeIqVg2gzE5dWcoqsiHqu
 SN1/BZLgI+oeEbLEUc/WJaRT48ihlR7vdhBHmwVKnnB0Lm6OaEF9zgyZyMh58SN9WSQD
 /Nhg==
X-Gm-Message-State: AOAM531zsd4LWnN6Je5RXO4UbBqsRal1FPb9JtS4cK8YQBsMPMDggcSr
 I/PiuGgL2y+MF7kw5qFA2TLrXRPDB4QHiA==
X-Google-Smtp-Source: ABdhPJzahqGzQmuEKnFz0jGAMjdnGzV/JvlD8pXSWgTPccyE4j40L17V54Lq201D6Jug0uIumOwCWQ==
X-Received: by 2002:adf:e452:: with SMTP id t18mr4048299wrm.177.1610120211988; 
 Fri, 08 Jan 2021 07:36:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/23] hw/arm: sabrelite: Connect the Ethernet PHY at address 6
Date: Fri,  8 Jan 2021 15:36:20 +0000
Message-Id: <20210108153621.3868-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Bin Meng <bin.meng@windriver.com>

At present, when booting U-Boot on QEMU sabrelite, we see:

  Net:   Board Net Initialization Failed
  No ethernet found.

U-Boot scans PHY at address 4/5/6/7 (see board_eth_init() in the
U-Boot source: board/boundary/nitrogen6x/nitrogen6x.c). On the real
board, the Ethernet PHY is at address 6. Adjust this by updating the
"fec-phy-num" property of the fsl_imx6 SoC object.

With this change, U-Boot sees the PHY but complains MAC address:

  Net:   using phy at 6
  FEC [PRIME]
  Error: FEC address not set.

This is due to U-Boot tries to read the MAC address from the fuse,
which QEMU does not have any valid content filled in. However this
does not prevent the Ethernet from working in QEMU. We just need to
set up the MAC address later in the U-Boot command shell, by:

  => setenv ethaddr 00:11:22:33:44:55

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210106063504.10841-4-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sabrelite.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 91d8c43a7eb..a3dbf85e0ed 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -51,6 +51,10 @@ static void sabrelite_init(MachineState *machine)
 
     s = FSL_IMX6(object_new(TYPE_FSL_IMX6));
     object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
+
+    /* Ethernet PHY address is 6 */
+    object_property_set_int(OBJECT(s), "fec-phy-num", 6, &error_fatal);
+
     qdev_realize(DEVICE(s), NULL, &error_fatal);
 
     memory_region_add_subregion(get_system_memory(), FSL_IMX6_MMDC_ADDR,
-- 
2.20.1


