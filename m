Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EDE30DC25
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:04:52 +0100 (CET)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Im3-0003N9-33
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:04:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7Ij8-0001om-6p; Wed, 03 Feb 2021 09:01:50 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l7Ij6-0006iD-GF; Wed, 03 Feb 2021 09:01:49 -0500
Received: by mail-ej1-x632.google.com with SMTP id w1so35874406ejf.11;
 Wed, 03 Feb 2021 06:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uOUbeTguQa+UA3rrblT1/qeeaZs1H/V2Br3Q4W+z4jk=;
 b=ssy5QWigq2IiBtj9HCnP97ilZxk2zKBRNBCAdZtiLvCuh+hW0ljaOAb0ke+jBZnR7w
 l9DANzozfO6IaTo1fAAv2HiQoMUQ8fE29uS+9uO5jqcUUBDNhzJrcIbFvqYRfrAw3icO
 MWvXkBjNy5nw+Fk2e/+A8FZP5RgaWFK4CcQ6G9wLg/W68TAbAY5QoP3/PDfh6gsCl++S
 Dg2mMtn+jix0WhycYP7Dqw6Qp7CHsaFBF2qVBZlB/ZWviYMuN+48jSjbtJeZpa4+LzCK
 fwZnKdpUqwKfmmy6mS6n+N6vWfxx+oUKwQ5SH6iGbZ1JzPp1WBKiKzqDwTFWHKn2XZpA
 u2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uOUbeTguQa+UA3rrblT1/qeeaZs1H/V2Br3Q4W+z4jk=;
 b=tZtMJj83bWcM+uG6U9NhnoPtUyllpApJE+p1bTnyVj4yzq+5biDnnc/fD6wq+mK4C4
 HRYqBeIPWWA9yx2YPDQb25gX/wj6hhub3ZfFv27GxcKcXAQmNBsS4RScV2LGlNFYWZfF
 wB2uWOgmAhTnPeHMsjxpQvE/eNYKWD15hOEj8Uhnmyx9bcxa+e2jsEV8SiJPgsGB1QOT
 5Xs63AdpQ7ECSDfNGBwtUeH8QY24cSyBq5NdPfNi+hEjQU0BlKTpPEhfylVlr93jFuhN
 xM/h836Xpicr4veQ0QzZgmKm68x9PfcGgchIsq/ZyqLWNIy0nHg/tlvcKfyUGtgbqahu
 6NMA==
X-Gm-Message-State: AOAM530CVh14W5z+vY3WuP5z9BZPez93EaWcwU3fQQbSublFgG2TLzm1
 bBe2Fz73tNaHSBVT7/9u26OZtoxCwQw=
X-Google-Smtp-Source: ABdhPJw0sKipJu3Eb/3avgxF8VtZm8hWBuBnufReyUBSFbWOUAphyU3riSqf4W3vv6/ytFoIYILHMA==
X-Received: by 2002:a17:906:af86:: with SMTP id
 mj6mr1245027ejb.509.1612360906186; 
 Wed, 03 Feb 2021 06:01:46 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id m10sm907980edi.54.2021.02.03.06.01.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2021 06:01:45 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>
Subject: [PATCH 2/2] hw/ppc: e500: Fill in correct <clock-frequency> for the
 serial nodes
Date: Wed,  3 Feb 2021 22:01:33 +0800
Message-Id: <1612360893-4624-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612360893-4624-1-git-send-email-bmeng.cn@gmail.com>
References: <1612360893-4624-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the <clock-frequency> property of the serial node is
populated with value zero. U-Boot's ns16550 driver is not happy
about this, so let's fill in a meaningful value.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/ppc/e500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 672ccd5..e4677af 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -126,7 +126,7 @@ static void dt_serial_create(void *fdt, unsigned long long offset,
     qemu_fdt_setprop_string(fdt, ser, "compatible", "ns16550");
     qemu_fdt_setprop_cells(fdt, ser, "reg", offset, 0x100);
     qemu_fdt_setprop_cell(fdt, ser, "cell-index", idx);
-    qemu_fdt_setprop_cell(fdt, ser, "clock-frequency", 0);
+    qemu_fdt_setprop_cell(fdt, ser, "clock-frequency", PLATFORM_CLK_FREQ);
     qemu_fdt_setprop_cells(fdt, ser, "interrupts", 42, 2);
     qemu_fdt_setprop_phandle(fdt, ser, "interrupt-parent", mpic);
     qemu_fdt_setprop_string(fdt, "/aliases", alias, ser);
-- 
2.7.4


