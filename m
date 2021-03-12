Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F183396D4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:44:31 +0100 (CET)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmly-0006ef-3k
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmX1-0005KD-Bn; Fri, 12 Mar 2021 13:29:03 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKmWz-0004tg-Pm; Fri, 12 Mar 2021 13:29:03 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a18so5306119wrc.13;
 Fri, 12 Mar 2021 10:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9MjJyVV/hMhFIu1Hswys1HIyZDTyxmxZhi30bZ2BoFk=;
 b=GrTyctvg6diIqExCQcxbWffDQdHX8KVQZumxnsK/j3fM7Hg7CJs6xlAYzscwRpyT4N
 mkKXAJR+m3d2dtN0Si0HInZ/D4DdsCsMEkM36p6ScmNyHwwQEQrSP/ZEuaxo711pO9ih
 4XsHhXn7unePstbgu3QYuabpQxpYe6THsFQcGb29Gn0/LEUdyWskmL7XZxoGEdCh9mMu
 psATY9d0se6uTSu//UcnkZIhmSnxLKPDdY7d7oJh5tFKLxhyET+ASLJBNXzq3rdep9Sm
 EoaSSrXxJUF8bsTmywam+ffKLYu4zir9G98y537ACSlT6jnu/fXnXW85T1r7xK6uPqsx
 T7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9MjJyVV/hMhFIu1Hswys1HIyZDTyxmxZhi30bZ2BoFk=;
 b=pPvh2+NX4NmLpHOY/BRROvIVPwNuy92L8f6VDAThVGOP3WFgsp42zOcq3mnv6vFK7x
 mtlUNxMgXdlW0FpgBd4EhpK2WjH7YQHq+NodqEFTPGvVc6vd4h52wUlZ7OE07iepau6I
 QwIauU2A1g8mQy41QhwFkDLvBWlXNnpMdHyfaBVYKL/czNSbgp2gAAweqpHWompCw2rD
 20cNe32pmAtGS5YvJoGeJQ+V3E+tJXHh1vFBBgZIibk//5TpbV6CTuJwfUiomIC8rJG6
 Bjb4mmNLji8wMdxbBdXByilzULdREpWRAj3HoGFAAvZgR6QkPh/VcqZIXFUEVbYOi2G7
 SSSQ==
X-Gm-Message-State: AOAM530InxviuwMceHeQQ/RospEq85J0q90x0Ny64rv8kC0cM+/sGUFw
 qCPnqQiP6Nh+Sz//1CMEs1mOTjYlLtI=
X-Google-Smtp-Source: ABdhPJzP84qOkAaGfhRxvOkhoTcolHtBz+XnGVQOcTkffpWZPHqLggjGsz1tK8hTBh9v66Uqk3Bf0Q==
X-Received: by 2002:adf:fd91:: with SMTP id d17mr15531540wrr.0.1615573739465; 
 Fri, 12 Mar 2021 10:28:59 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f22sm3013964wmc.33.2021.03.12.10.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 10:28:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/arm/aspeed: Do not directly map ram container onto
 main address bus
Date: Fri, 12 Mar 2021 19:28:47 +0100
Message-Id: <20210312182851.1922972-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312182851.1922972-1-f4bug@amsat.org>
References: <20210312182851.1922972-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Joel Stanley <joel@jms.id.au>
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
2.26.2


