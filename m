Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D44362F44
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:36:24 +0200 (CEST)
Received: from localhost ([::1]:60314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXiJL-0007Eo-EW
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiDo-0001O9-KD; Sat, 17 Apr 2021 06:30:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiDn-0000iR-7G; Sat, 17 Apr 2021 06:30:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id h4so19980183wrt.12;
 Sat, 17 Apr 2021 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HeEMfM8xls4IrDQ+W3vHIv1EqNRgEdPk82n7+iZ8zHs=;
 b=czqEvhcG43xW7+3XWZZrmh7JMQKFKF+O72yip6Sz7CE9p9IFgyIhSL7wAkuDvsL+WD
 320sgnlnUtO+2oCUgrWYedAneosLEROnhro20qukKFNwWBeg5s0l4AUHMHDsk5DNVISo
 E18h5A9op0WO8gFpwBBMrExZFjdSkp7/Ps8uCoNmouPvwJIAqZgQvQWiXZ6+lC7daElL
 cLJmqqyDEszHQOnO7ned5Oh+euw+yvsB68e1HjAdbZ1+V5rbU5IIWZIhUBa6N8cRviPa
 l1bSCIm76rfkiTlOp655x56/+Id1oLGLhmGw4idb5ztGxZkgJOXqtF8rQBXKxioaZeQn
 OfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HeEMfM8xls4IrDQ+W3vHIv1EqNRgEdPk82n7+iZ8zHs=;
 b=JAemPublhgt1tnFT9r2x1wrGeITxYM2uqLux3dFSXz2V0+4VaE/5uUm+CZ2zeEVt8T
 m+sTM/pCUG8DCWRCxJ1IBWTAnAXXZyROPeLrVFSV5kUusMBwh5ds2v84Z5OOPkgw0y6X
 nczLlWE0QGNgXT6f2BMPTBtda/y3UNeb7dtEDDEiKq8ywO5qbGcdxegYhrdFWC2OZJR/
 /jHk7jrV4TkLDe0xxWUk3xPsHf3I2q9H7Fx9WrZrI3cxUkAp+hamUDJKYe0mvSARVmOj
 DdhDb4MWRqDQaXx0aaMZBHWIHlGAAaCA4b6Of/RFFQSkyHBx39f8DcDUWInsUgFJG3/l
 ND9Q==
X-Gm-Message-State: AOAM532I7iXT9wFvoZFraWY1MdonGAXk4demcp+DstpBQaN51HYHda1B
 9xf5+dJQBDAFAFuts8Y6vXM18lRfIpE=
X-Google-Smtp-Source: ABdhPJxWrcyHQzF0FS+fpcGeplEaLL4CyLN1jomG0zxlsngQNRLbJO+nPT3171NUlQVMVN1YsPmTFg==
X-Received: by 2002:adf:f948:: with SMTP id q8mr3744936wrr.296.1618655436524; 
 Sat, 17 Apr 2021 03:30:36 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id e33sm11373819wmp.43.2021.04.17.03.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:30:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/11] hw/arm/aspeed: Do not directly map ram container
 onto main address bus
Date: Sat, 17 Apr 2021 12:30:18 +0200
Message-Id: <20210417103028.601124-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The RAM container is exposed as an AddressSpace.
AddressSpaces root MemoryRegion must not be mapped into other
MemoryRegion, therefore map the RAM container using an alias.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a17b75f4940..daeef5b32a2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -40,6 +40,7 @@ struct AspeedMachineState {
 
     AspeedSoCState soc;
     MemoryRegion ram_container;
+    MemoryRegion ram_container_alias;
     MemoryRegion max_ram;
     bool mmio_exec;
     char *fmc_model;
@@ -339,9 +340,12 @@ static void aspeed_machine_init(MachineState *machine)
     }
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
+    memory_region_init_alias(&bmc->ram_container_alias, NULL,
+                             "ram-container-alias", &bmc->ram_container, 0,
+                             memory_region_size(&bmc->ram_container));
     memory_region_add_subregion(get_system_memory(),
                                 sc->memmap[ASPEED_DEV_SDRAM],
-                                &bmc->ram_container);
+                                &bmc->ram_container_alias);
 
     max_ram_size = object_property_get_uint(OBJECT(&bmc->soc), "max-ram-size",
                                             &error_abort);
-- 
2.26.3


