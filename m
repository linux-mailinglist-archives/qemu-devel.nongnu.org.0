Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5DA2634E5
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 19:48:03 +0200 (CEST)
Received: from localhost ([::1]:43348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG4CR-0004Iq-0j
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 13:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kG4BK-00031A-2L; Wed, 09 Sep 2020 13:46:54 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:40378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kG4BI-00082R-HJ; Wed, 09 Sep 2020 13:46:53 -0400
Received: by mail-lf1-x142.google.com with SMTP id m5so2051908lfp.7;
 Wed, 09 Sep 2020 10:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Qqr4QBStFeXU0fdK2yCh5Hp5OipkrZCgifLr+IHV3k=;
 b=ROk7IIobypzkF56NMFdlqiiMzZuRksQ/qN8k9QotOd/weXpLInbeUFBrAK2KgeM0Vv
 wmatjjud/dapN6VsPY3raUuaIQ2qy5st2NSCirKoyO8CR6d36gZIz20afZZe2cvrt/Np
 p12VWvu8GpxIbJH0ApBG5asdZhTwvAuftNQati7UhNVRTELRH3cbFRVkQtZbFK89tC79
 duFuQ+h00roJAew9kKpDK7Osl72akkpcgDgOc3WoEMMoqeEWQA1CcUXFFLxhO6xd8vkk
 dxhO3HnEbHstFpwWJz5BPwzvcEdW9snggJKt5u/7rlLA7GU5QAVcxYr32DVrUogLj3bU
 5vhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Qqr4QBStFeXU0fdK2yCh5Hp5OipkrZCgifLr+IHV3k=;
 b=n3MasIXDXulFZupo3Eq4L3EdRKmkNXDQbsqYnYm3ZHfS5oKoPu8CIMexCEuPm2ft9i
 52w39jw2qCOQ5seVf805D2FEZok/HDTkkgapiPFBlpGylXOf9kbZfnwYF/78eZZKyjvI
 bVLdglg7a6AmNasXQbiW2TDS4AV/Hoq2K4lYbxbXoIeCWZ2UDdeNO3X3UHLR17tr4wJp
 GZsm5o88AUAorLUW+e7OI0t6nDuRh2VoVKAIAOfAvV2IF3PhZjoTqw/jpjiphNqk5hb9
 70mEc1GjmPVzObqvQ+mJUbIkQ1nTIZ8FZcnP3Ef0iSTcpVF9BeU/ARcJDhyn2TM2FXh0
 TPGQ==
X-Gm-Message-State: AOAM5303k19+899ICQcP1nQ4V9DmlmTYTHRgZ/bSla5TzLHFM4fhuuUd
 FE6t4kxvwmU+coHwjdI4a7zDs5Uzddg=
X-Google-Smtp-Source: ABdhPJzpowBpx/Mm1Jcp7jhDqC0sMa7xXt4M9qwrVWx5xbPKbRNbM7bi1lF4rqZaCSA26JFIE1yt8A==
X-Received: by 2002:ac2:5de8:: with SMTP id z8mr2368816lfq.204.1599673610230; 
 Wed, 09 Sep 2020 10:46:50 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id y196sm726662lfa.0.2020.09.09.10.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 10:46:49 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] hw/arm: versal-virt: Correct the tx/rx GEM clocks
Date: Wed,  9 Sep 2020 19:46:47 +0200
Message-Id: <20200909174647.662864-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200909174647.662864-1-edgar.iglesias@gmail.com>
References: <20200909174647.662864-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::142;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1.8, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Correct the GEMs tx/rx clocks to use the 125Mhz fixed-clock.
This matches the setup with the fixed-link 100Mbit PHY.
It also avoids the following warnings from the Linux kernel
driver:

eth0: unable to generate target frequency: 125000000 Hz

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal-virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 4b3152ee77..43d74b850f 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -212,7 +212,7 @@ static void fdt_add_gem_nodes(VersalVirt *s)
                               s->phandle.ethernet_phy[i]);
         qemu_fdt_setprop_cells(s->fdt, name, "clocks",
                                s->phandle.clk_25Mhz, s->phandle.clk_25Mhz,
-                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
+                               s->phandle.clk_125Mhz, s->phandle.clk_125Mhz);
         qemu_fdt_setprop(s->fdt, name, "clock-names",
                          clocknames, sizeof(clocknames));
         qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
-- 
2.25.1


