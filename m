Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7414CC708
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:25:54 +0100 (CET)
Received: from localhost ([::1]:37112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPs1I-0005Dq-SX
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:25:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzK-0001ut-Qn
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:23:50 -0500
Received: from [2a00:1450:4864:20::32e] (port=53868
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzI-0001Zz-Gt
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:23:50 -0500
Received: by mail-wm1-x32e.google.com with SMTP id 19so3574938wmy.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BwQur4NZBGGWfHrVPMLWwKCyDvLwx3c9PUY0EKxgx9k=;
 b=dnTyXeu1Yaiit8GnHMv0BTLnhMuUWGKjNnwyZ6lmKiSXTrd+TuVV72sNBvqSS0Ag2A
 FpRdeJ8+7KgV5TH1M+5jE3/WhiWhRkN6Z0eS5SMiq7U7HC6uI7qA0Tnia6vZjdYYD/ug
 m2o+ls1iCbirTUg2um/VeaHHHRsySaA0pjQLLgXpWLtO/lAYbHKpq1dbt9hi1mtHSXRW
 vwm2Xy32mAsNEY92jj66Op34Ml06WTblylElZNSXPYGwQ8q8Rkom21gNc30fTkt/sdBV
 QKViKUiamVLpiHg5ViTa3hY7QYuTho/Esctg/cDBGPZBYu4FdDK4FwEFV/QjApQw4n1c
 RERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BwQur4NZBGGWfHrVPMLWwKCyDvLwx3c9PUY0EKxgx9k=;
 b=MMbYm85Jp5FMKtGKLxsg+1naAPtxcyt7k476+mkyx3MQeQ2+pYGHA+uHmKf5af7OPD
 5mh4PgrAneBmpPZI6orqEm2FR5/UDxzyUWvP3qaa6lmNzFXDNsgoyRdRJMRzc624qfsY
 9exoPoNL2mmZo0Tx+iFMd2i2vZQvQ1yj+y4Tx4XALGhT77X2Mi07g/tO/gc7fRYosJvC
 lpsP/bcx/Ca9jxzTPpTYFubbmFpstzUrpBZdadMbYfEtxAe79afybJzoULMWPn3YUJN1
 H3mIfxqJKi/rBRxtwZ8VIGM9nztFcX/8NJJrmLNxrnCgJmjnn5+a9X93wiylWJKgBa4z
 YqHQ==
X-Gm-Message-State: AOAM533Vrx8SfFAznoTblvpX60S77EGAugPZP6cQP/j4eh8eQ3IUJ5zd
 GWkk+0IQ5sbw9s7Cd9BOXxYTyA==
X-Google-Smtp-Source: ABdhPJyIFJEbFCXFrAXAG1V1cE8DNT7nazsjswnKzudAkRbKp1jRdK2zDTzw8dyoRDzIgjoihXVvbg==
X-Received: by 2002:a05:600c:3d0b:b0:382:aa17:8f16 with SMTP id
 bh11-20020a05600c3d0b00b00382aa178f16mr5025218wmb.82.1646339027128; 
 Thu, 03 Mar 2022 12:23:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b001f0684c3404sm517060wro.11.2022.03.03.12.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:23:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/5] hw/intc/arm_gicv3: Specify valid and impl in
 MemoryRegionOps
Date: Thu,  3 Mar 2022 20:23:39 +0000
Message-Id: <20220303202341.2232284-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303202341.2232284-1-peter.maydell@linaro.org>
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICv3 has some registers that support byte accesses, and some
that support 8-byte accesses.  Our TCG implementation implements all
of this, switching on the 'size' argument and handling the registers
that must support reads of that size while logging an error for
attempted accesses to registers that do not support that size access.
However we forgot to tell the core memory subsystem about this by
specifying the .impl and .valid fields in the MemoryRegionOps struct,
so the core was happily simulating 8 byte accesses by combining two 4
byte accesses.  This doesn't have much guest-visible effect, since
there aren't many 8 byte registers and they all support being written
in two 4 byte parts.

Set the .impl and .valid fields to say that all sizes from 1 to 8
bytes are both valid and implemented by the device.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 6d3c8ee231c..0b8f79a1227 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -369,11 +369,19 @@ static const MemoryRegionOps gic_ops[] = {
         .read_with_attrs = gicv3_dist_read,
         .write_with_attrs = gicv3_dist_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
+        .valid.min_access_size = 1,
+        .valid.max_access_size = 8,
+        .impl.min_access_size = 1,
+        .impl.max_access_size = 8,
     },
     {
         .read_with_attrs = gicv3_redist_read,
         .write_with_attrs = gicv3_redist_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
+        .valid.min_access_size = 1,
+        .valid.max_access_size = 8,
+        .impl.min_access_size = 1,
+        .impl.max_access_size = 8,
     }
 };
 
-- 
2.25.1


