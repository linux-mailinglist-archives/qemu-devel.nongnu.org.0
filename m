Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00902F1C34
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:23:01 +0100 (CET)
Received: from localhost ([::1]:59734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz0uC-0003Tl-4C
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:23:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz0nu-0000cB-4O
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:16:30 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:52849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz0nr-0007s4-GI
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:16:29 -0500
Received: by mail-wm1-x32c.google.com with SMTP id a6so472533wmc.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qX/PZINiDr8xnpaMD6rBL/j68/0CMVgrGZ7MHx5ETLk=;
 b=djhyi1WTo+oqtQB5hSkU/kF5uQ72VcF82QsrJNzlpEbBSen7ZD5rjsjNOUzZlYmKZu
 DoTKy4xNSFBJxu9lTazjWU0biZGkFTeML+/v80OZG4NLrWV+RhelfHIX2E06JZsHx/wh
 wvReqCqinl4DRghyPlBP41tuzkvmt9g1YLUa1xHujrVQkXRpnosKU4ycKq8EpfPGBW7H
 LQlkFZmDWZcnPT4Uy8ghHNN/xcAMti7KhiTVcBeFHw2Z7Al3NE/abAbaRXuy36YsSRpm
 byXZvKKIDcc13kvLp/XU7piaov6O5AjBkB+utaQShGrCG4q4ms/qO91emRwfRrYXLyUV
 AiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qX/PZINiDr8xnpaMD6rBL/j68/0CMVgrGZ7MHx5ETLk=;
 b=ga6ltMzMcQZJrKRmFYrLFeaWwqGnf3gqIjorY3IvYRG/N+yj275EQdgcqCVA2o4d0z
 TaAggvH9JVccnME4acnPo7F6hzF4xCFKvYQh0w9xYy9UlnB3YieThAXgT4ZodqCOJ1bI
 ZaLXpogi2HAMYSlcKGtX7pddtT6rEZ6pfy80mt9TU8FZ+sABiQdkbrHQ6r25Uuvy1+Rb
 /N4dt0sDWcv6Zh4OwPBG5b8vVY+X9JDky8NujWtiguW0aSbX2YY3xKyJUraPTY323EX3
 CE+bBdp/nIvExXVG7bhCdJFThjJFP4jpFZs82kAhSEK7IeVY5soa9W1gXxOPuwo8cMY+
 YcSw==
X-Gm-Message-State: AOAM533dmxGZL/+nRPy53lyYRE6EasyvCweApQiEZgHDveGENeMcGCpd
 DL+9eFtZ8SV45IHK3eU1RIqF/rYK4B1N0A==
X-Google-Smtp-Source: ABdhPJzu+mEY1OdlBQBMu2duWWl58PAnVfhzQyy6j0K4G5nxGCrSY8AY2ndLin6EybICCsIN/K7Big==
X-Received: by 2002:a1c:bc41:: with SMTP id m62mr664152wmf.46.1610385385543;
 Mon, 11 Jan 2021 09:16:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l8sm354533wrb.73.2021.01.11.09.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:16:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/ppc/ppc400_bamboo: Set dcr-base correctly when creating UIC
Date: Mon, 11 Jan 2021 17:16:23 +0000
Message-Id: <20210111171623.18871-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 0270d74ef8862350 we switched from ppcuic_init() to directly
creating the UIC device, but I missed that the Bamboo's UIC has a
non-standard DCR base register value (0xc0 rather than the default
of 0x30). This made Linux panic early in the boot process.

Specify the correct dcr-base property value when creating the UIC.

Fixes: 0270d74ef8862350
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
With this fix Nathan's test case goes on to eventually hit
a QEMU assert:
qemu-system-ppc: ../../hw/pci/pci.c:255: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.
but it was doing that on 5.2 as well.
---
 hw/ppc/ppc440_bamboo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index b156bcb9990..2c7a578ba73 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -198,6 +198,7 @@ static void bamboo_init(MachineState *machine)
     uicdev = qdev_new(TYPE_PPC_UIC);
     uicsbd = SYS_BUS_DEVICE(uicdev);
 
+    qdev_prop_set_uint32(uicdev, "dcr-base", 0xc0);
     object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(cpu),
                              &error_fatal);
     sysbus_realize_and_unref(uicsbd, &error_fatal);
-- 
2.20.1


