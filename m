Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C2D378C73
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 14:46:47 +0200 (CEST)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5J8-0005gr-N3
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 08:46:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4zE-0006Tg-8n
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:12 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg4zB-0003Jl-2o
 for qemu-devel@nongnu.org; Mon, 10 May 2021 08:26:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d11so16410471wrw.8
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 05:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=CpwUsW78mEI5XjMCiM9bT5wLiUV9J5cA8qAnD0ZM2bc=;
 b=zmlGde6ZSO/yhD7Ev8OVqXW/N+GKPRF4BFHfYq05t0qw3TCizhbM3DdPHp7ZudZN3D
 t/kfkNZGLf79HNjdbfYUIlo40nR8lz0mlrB0hWrleDVVRRD49WSs82TxIXMK2Dmq+OYJ
 LGpn9qAzlL9+Jrx6zegHHuda63zOugBrxtgrUY3M3IogwJP/PPabOrcZK/k+sPpcL/x8
 Yvl0PqmGRWyXfdtzAyxgQ+whXbQOOSEs3dUstZzbkHCKhhoCi5lrtgLJMDddyC5NLdsr
 PoDqlOUMpHzLtglPIkuPEd78GOcxQNhS7kLx80xl/hePPGEGNVNuTqiHhBNu9V3Amtch
 RCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CpwUsW78mEI5XjMCiM9bT5wLiUV9J5cA8qAnD0ZM2bc=;
 b=dOhW2Jw8ygThfApRcm2ImGc30DD06mn6JlrfPv8lyzC15d9GYadAurnGknlBbKpOUE
 aSokrZzQKv3vIFfQUF4VLx3yVqxqDsH1Ft6wCJ6BWxhfyPKe3RqQO9LcWPoMDnBnKW/d
 Aq8K6+fVlEWhPNe5zv/8pxq9fHati2DObNUEbmStKZNLbv0lS9wGs3Fnakjk5XoqdaaH
 3i3ZnbekDS57Q9Jg7Qt59oSmsQnJO+m34IZkVnEybAxzZtHOerRYZ8lFsYTQ96oHk83D
 GRmDmHIMITsf2opVmShY2MqWB1wcjwj97f1ixVw/C+uGQ3Hp33lQ+DYk+/utprSg+INE
 4ILg==
X-Gm-Message-State: AOAM5329TI+D8+wbD/c/dmnr/TAlytxYkb4/qSACn725MKhIBvf53b4E
 l2lpjLhC8AE2tVbbzE4fYjfG3yQ17mBNDg==
X-Google-Smtp-Source: ABdhPJxXsuhrfNF56F0sdotXFaHJpfM74M0DnYNYLkDpibo8qj2tlIbyMDbkGHNzDB7Pgld2pqapzQ==
X-Received: by 2002:a5d:678d:: with SMTP id v13mr29614024wru.85.1620649567709; 
 Mon, 10 May 2021 05:26:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d9sm22749897wrp.47.2021.05.10.05.26.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 05:26:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/26] hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9
Date: Mon, 10 May 2021 13:25:48 +0100
Message-Id: <20210510122548.28638-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210510122548.28638-1-peter.maydell@linaro.org>
References: <20210510122548.28638-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Guenter Roeck <linux@roeck-us.net>

Commit dfc388797cc4 ("hw/arm: xlnx: Set all boards' GEM 'phy-addr'
property value to 23") configured the PHY address for xilinx-zynq-a9
to 23. When trying to boot xilinx-zynq-a9 with zynq-zc702.dtb or
zynq-zc706.dtb, this results in the following error message when
trying to use the Ethernet interface.

macb e000b000.ethernet eth0: Could not attach PHY (-19)

The devicetree files for ZC702 and ZC706 configure PHY address 7. The
documentation for the ZC702 and ZC706 evaluation boards suggest that the
PHY address is 7, not 23. Other boards use PHY address 0, 1, 3, or 7.
I was unable to find a documentation or a devicetree file suggesting
or using PHY address 23. The Ethernet interface starts working with
zynq-zc702.dtb and zynq-zc706.dtb when setting the PHY address to 7,
so let's use it.

Cc: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20210504124140.1100346-1-linux@roeck-us.net
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xilinx_zynq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 85f25d15dbf..81af32dc428 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -118,7 +118,7 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
         qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
         qdev_set_nic_properties(dev, nd);
     }
-    object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
+    object_property_set_int(OBJECT(dev), "phy-addr", 7, &error_abort);
     s = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, base);
-- 
2.20.1


