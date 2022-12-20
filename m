Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820EE6521DA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:58:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d3j-0004MQ-CS; Tue, 20 Dec 2022 08:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3h-0004Lc-MM; Tue, 20 Dec 2022 08:53:29 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7d3g-000142-6v; Tue, 20 Dec 2022 08:53:29 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1447c7aa004so15403314fac.11; 
 Tue, 20 Dec 2022 05:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZFbcD/D1dbm66qHXSpBmJgzXHTUS+Jktmxwhei7GmI=;
 b=K3NgEeOJcYXUa3a5+kLYhkwGK2jWNXz9KL+Yj+uX3dXI+Hx0dfjQQijy1PcA4W2YNa
 2WkUQO3Dvkp8g9my9bBtOGdQDjd1bxH3QYfW2iNoTMGDUjNRcevXJXihymNeKjeoVOpq
 mk5jIExgei6XMAPdX/iiFfmZSqwm+ypDiFh4WYxVH9w97iJOtakQFT4f14GcsHvEJl72
 R0q6aZbeG3bSiSUrQrtENeYY7Ku4FRB44m0UAW3B1pb5COFv+WTH4rz55KVlVNxZbA1M
 hc40BL7yaxN72oYyUp07ODiY9fmSif0Ew+1ff06XfTayOecFhwH3IvA8/xxksBo91Q17
 jGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZFbcD/D1dbm66qHXSpBmJgzXHTUS+Jktmxwhei7GmI=;
 b=MEhUkwfRuFD3ihat9DerxC+XpdKTK4kG3agRIOmf0Zu3JNtStsccb/dfAvlJUbCzZt
 y+jcDP/NtVacCOKLXLALYtDbMGpBwMD9THPY1ywOgR6Lclak8ok6OIsWPCM9bilTo1ol
 6eykzHP1J6TmxOJZQ8IR97Fq/UHl078uBirWK9gL2m7xFfskKuPpz/nKeGrO06uvvJ7F
 Gzrm2Ct7KcgHMUbp3SWGx+xQF4TZiLT3dnD4zIKhxhJUKn9XUB/jKbHaf7a/uY8+kJUM
 5wuSSE0oUKMzZM0gduJSGnDLo8hoSruqvACOsdwQTlo3Pt/m0jxEoa9rhif0jhjrgTc1
 bFXQ==
X-Gm-Message-State: AFqh2krGTlSPwfuRPkFle7a/BPcaNmT5Q+sG3hhx/UdfeHWiW+crJbeM
 FMR6uO9sW2we5vrb++thlPh4E6cWoh0=
X-Google-Smtp-Source: AMrXdXtZaVHDB16B9UhhZ3+jKQDZ6O0tWnvxGES71icRqzMl3LOvrbLIFtt9DLL8S+E+qgsSsm+tag==
X-Received: by 2002:a05:6870:7889:b0:144:c5e3:643a with SMTP id
 hc9-20020a056870788900b00144c5e3643amr6986359oab.4.1671544406358; 
 Tue, 20 Dec 2022 05:53:26 -0800 (PST)
Received: from fedora.dc1.ventanamicro.com (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 f14-20020a056870898e00b0014474019e50sm5994933oaq.24.2022.12.20.05.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 05:53:26 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 11/15] hw/ppc/e500: Prefer local variable over
 qdev_get_machine()
Date: Tue, 20 Dec 2022 10:52:47 -0300
Message-Id: <20221220135251.155176-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220135251.155176-1-danielhb413@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221216145709.271940-5-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 2bef2f01cb..53876af866 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -984,7 +984,7 @@ void ppce500_init(MachineState *machine)
     memory_region_add_subregion(address_space_mem, 0, machine->ram);
 
     dev = qdev_new("e500-ccsr");
-    object_property_add_child(qdev_get_machine(), "e500-ccsr",
+    object_property_add_child(OBJECT(machine), "e500-ccsr",
                               OBJECT(dev));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     ccsr = CCSR(dev);
@@ -1048,7 +1048,7 @@ void ppce500_init(MachineState *machine)
 
     /* PCI */
     dev = qdev_new("e500-pcihost");
-    object_property_add_child(qdev_get_machine(), "pci-host", OBJECT(dev));
+    object_property_add_child(OBJECT(machine), "pci-host", OBJECT(dev));
     qdev_prop_set_uint32(dev, "first_slot", pmc->pci_first_slot);
     qdev_prop_set_uint32(dev, "first_pin_irq", pci_irq_nrs[0]);
     s = SYS_BUS_DEVICE(dev);
-- 
2.38.1


