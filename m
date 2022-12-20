Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BB3652005
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:59:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7att-0004Jo-JO; Tue, 20 Dec 2022 06:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7atq-0004HQ-SL
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:35:10 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7ato-0008FD-8O
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:35:10 -0500
Received: by mail-wm1-x336.google.com with SMTP id m19so8448913wms.5
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sC9vcF9yGetREijhhbohBEV83L0zPyCxXlEChBylbPg=;
 b=MBwjdhtxi8akSlhfS+nXC8mWZF/z7is8fMbZe/0+rcMXKy60YYW1ua6VfeHXs8Wq3+
 UClONpDl/7x/MjszNq/qyC+tRBQbGryFOuKOWbJS36FrYFtld/pZk3ou2YWpY/hOLGgS
 z2mTi/LPDcMUk+ob9Dl1bOQ4ZmhGjbM15+4XfSpBf9qPqByQVYEjUWgP3VhKUj7x7+36
 GSIpGXe5bBRp4LQlrsjfNmDWM7fhFUyhENjG0IT+AVyquSuQ4Ke5lQsHRzwuq1Ij7Xv1
 W2/S19N50knjuuEAdJ/8iTYv9Myt+Orm0UKOLB20GOsU1VsYQHqVkGq6wta62gB2vYdp
 ItyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sC9vcF9yGetREijhhbohBEV83L0zPyCxXlEChBylbPg=;
 b=cFxPijZdu1fs+wjwc+ScykrNEl+G1rQJigY1LK+qr2Ua7d0cSY0HTExiCWNXT3pElg
 aSiROi9N+2CaC5S39FOXwu9R9+HSvAJEt7fKaKIRRSfzNn69IZhTOruOdUTCAyGZdDO0
 XL2GV6K4yYGb1IAt3xKcMYlBxB7JMAN/db1Y7HqdvcPhqTwKGMqzfenyhBAYbdotP2G0
 2QezOQtcMITMwC8G9vzKdfij7cdlM7NjE90j8Lc3NMoG7voSHMh5ftGQ1xRHFCmCuxc8
 HpSvwA2qvZzRTPyEYq6rY7RO9MMggmlLLeCkyZIbgdFB+UY6yxbm+PEhzhWtraAOg3qF
 f9lw==
X-Gm-Message-State: ANoB5pkzujJ1UuJRH7pil1ZI1JjoFE9yCsIaW91jhgFQOYcKCOc/FY4D
 6b2O/qkpB9JQtiFNqoh/TSaltDLu8iTI1K9nwWA=
X-Google-Smtp-Source: AA0mqf5kuiOnbyoG3XrAVvyAy173q18iI+g+yR/EsfVOnX+JbxrOR28DZKV6o7rERTNX/oi/1FZJNA==
X-Received: by 2002:a05:600c:3d19:b0:3c6:edc0:5170 with SMTP id
 bh25-20020a05600c3d1900b003c6edc05170mr35534880wmb.25.1671536106537; 
 Tue, 20 Dec 2022 03:35:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a1c7710000000b003c21ba7d7d6sm15288232wmi.44.2022.12.20.03.35.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:35:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/7] hw/mips/malta: Explicit GT64120 endianness upon device
 creation
Date: Tue, 20 Dec 2022 12:34:34 +0100
Message-Id: <20221220113436.14299-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220113436.14299-1-philmd@linaro.org>
References: <20221220113436.14299-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Propagate the controller endianess from the machine, setting
the "cpu-little-endian" property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221209151533.69516-6-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/mips/malta.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index ba92022f87..1f4e0c7acc 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1390,7 +1390,9 @@ void mips_malta_init(MachineState *machine)
     stl_p(memory_region_get_ram_ptr(bios_copy) + 0x10, 0x00000420);
 
     /* Northbridge */
-    dev = sysbus_create_simple("gt64120", -1, NULL);
+    dev = qdev_new("gt64120");
+    qdev_prop_set_bit(dev, "cpu-little-endian", !be);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     pci_bus = PCI_BUS(qdev_get_child_bus(dev, "pci"));
 
     /* Southbridge */
-- 
2.38.1


