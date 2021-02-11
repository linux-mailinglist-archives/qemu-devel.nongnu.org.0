Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7659C318C59
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:45:36 +0100 (CET)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACHn-0005gL-Cg
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:45:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZZ-0000Gk-6X
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:53 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:55309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZJ-00008V-Di
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:52 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o15so3687449wmq.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ixe3xEWCLqFO6/uGt+eEF2dyjdPefbmj6m2Mbhi11Aw=;
 b=AeZvTcMGHb5fzCkW5DySJRIJzub/Zj0F29idykz90LbYya9B3zTuG7CcAp4ROSXOg8
 CsGb25HnlbqSPqFAKS/Hd7r51AuHragMHIBLd5IsQZhqyUHVcgqcddwdr63SI+orY8FI
 hefQNySdZFOZ6AClwfVDQ9sBA/mMTNuq/0Oxnys5RF3cfQSuYaaKJEa8m64z2lnovsAv
 A+uBoUk6GvNFJ0B6mVrPPsumHp2ylVruTH1MJLRDyDgBAmJfXcBHT249D9lb/4RAPOxS
 D0MKNljqMVTW/qC+TzagjIAH0pqCCpGpGELm7DYK6hwqC86RcyIgk378WotKMYeswJrj
 xzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ixe3xEWCLqFO6/uGt+eEF2dyjdPefbmj6m2Mbhi11Aw=;
 b=qJPJ8Yrz+tpc52riwCHjs2MLgAR7k/Mvqm618I6hPj0P31hHn0WyudYMvBhGgIovjK
 K9Gam6DY3Vqhb0I8RgSP8mDh3zY7plWeuuxqlnxFRdjez7nGAVLIrO5f1f73J9VuMc9T
 O2KQ4eu1hM34Bic501Cmnwj8PuylCe/nQKerd/GucoG1HXMIFl6IFkyLsoPuUD6QarCU
 j/2ztxIvazQjpssXnIxZrUuF97QDGgnAPmuDv2q+zusT8UXP39nlm9MyzIKsuA2Sypfx
 0KIfSwk8I6nPpIrtrBFBB0k7c85UW3yNfJL6XOPl9UZeUhFtRClZSw3r+qRV7zmLGG7r
 cQYw==
X-Gm-Message-State: AOAM53085rfHTUSeWVMoGfRjXn+wEcNfxn6KT6xTkN8nY0hHFd7Bhuu9
 dR/QFMh8lm0MQPbMOflC6fCDsqbTS4HoCw==
X-Google-Smtp-Source: ABdhPJxRQ0BfEHbkmkbR7XhtkrgMNl410q+QDpwycZ07PV3tB1er/aKT2tWj0GEF3anRcEq0dOnYmA==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr5263405wmb.0.1613048376297; 
 Thu, 11 Feb 2021 04:59:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/45] hw/arm: versal: Use nr_apu_cpus in favor of hard coding 2
Date: Thu, 11 Feb 2021 12:58:59 +0000
Message-Id: <20210211125900.22777-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use nr_apu_cpus in favor of hard coding 2.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210210142048.3125878-2-edgar.iglesias@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-versal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index b0777166e89..628e77ef660 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -67,10 +67,10 @@ static void versal_create_apu_gic(Versal *s, qemu_irq *pic)
     gicbusdev = SYS_BUS_DEVICE(&s->fpd.apu.gic);
     gicdev = DEVICE(&s->fpd.apu.gic);
     qdev_prop_set_uint32(gicdev, "revision", 3);
-    qdev_prop_set_uint32(gicdev, "num-cpu", 2);
+    qdev_prop_set_uint32(gicdev, "num-cpu", nr_apu_cpus);
     qdev_prop_set_uint32(gicdev, "num-irq", XLNX_VERSAL_NR_IRQS + 32);
     qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
-    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", 2);
+    qdev_prop_set_uint32(gicdev, "redist-region-count[0]", nr_apu_cpus);
     qdev_prop_set_bit(gicdev, "has-security-extensions", true);
 
     sysbus_realize(SYS_BUS_DEVICE(&s->fpd.apu.gic), &error_fatal);
-- 
2.20.1


