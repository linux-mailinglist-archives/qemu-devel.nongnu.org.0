Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96829202548
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 18:30:20 +0200 (CEST)
Received: from localhost ([::1]:43896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmgNn-0007ET-Fm
	for lists+qemu-devel@lfdr.de; Sat, 20 Jun 2020 12:30:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmgLx-0005Za-NN; Sat, 20 Jun 2020 12:28:25 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:52856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jmgLw-0004mo-7M; Sat, 20 Jun 2020 12:28:25 -0400
Received: by mail-wm1-x343.google.com with SMTP id r9so11063039wmh.2;
 Sat, 20 Jun 2020 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IdJDaxaaDoVYI8SF19S5iYRVy5MISpN5ZXPUywc1aS0=;
 b=Nc3M7l9xFOrVmmB3KrRu5vZDzS0gWFgP5ariHr69mR8iTcRJ93PEwmynFVEV7ZVG/7
 W6WFSgSHJCYbbebBQGPwgX+rnVkaWeKrhEdV+9e+09STacpsq+SkMdNx9MLIovyQhMvP
 ZU8PCwUNUJ6e10a09LfXDKGTFRud7ARqTJQoDyXV0CTu8pCchYU5qjSBI338FY8rLjj7
 iOoNWEAE/3306DZm58GU6/n9pZfkfS+k5XL+pHOkgshfuoGE+JpBt5NOR3jPre1IMs/Y
 +MV+tkxOLSbNuQBTNtfzjnW+Vf20IPMh9SOhb9pPOZmL50Q+fOrCOyncMavip88maXu/
 /5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IdJDaxaaDoVYI8SF19S5iYRVy5MISpN5ZXPUywc1aS0=;
 b=gJofSdFkm2Uu3um+Kit2ZxQ9ZFF3kYR5wagZNHcv5KmP4hTKd8S0bX6w4YJpApHmkW
 wRrzWmiBnL0Q6rtj0y/+19pk0/ks9DnD8cIKG9Hl7/dHQUpLsdJPgo4IyLfdKXE8uOZF
 HGHThlmtxP0qHhxcJPAvkEej3G4eeTqmVQ4Zvu5mseO1oyQM+joBkypqcdmfoT3lK/MU
 UVefiVK4ku/rHDys+1VCBs1ufTWz/3UZGINRCgCopJOnRSOTIiro+2E/c3yxYlGBazlC
 OwRqTjBo/BCigYyys73+nA/lXZ0quAvBCrb3MToDHB0v8apEnj2MPRVxLARR3/7ZHYSI
 rw2g==
X-Gm-Message-State: AOAM532oUHoQZld8aQiTvY8D6ixKlOmfNhcBLzcTrZ6nH2C2IOPlvZsh
 fLHSe0mqNEnMteMSnWxBhRBSYAQ4
X-Google-Smtp-Source: ABdhPJwFmZB4pI9d7/3Cpve77qO1VU0BMAf8Wtc4HjjnfovAU876I6jEc4IhYn+dC0tJqPBNRvM2fg==
X-Received: by 2002:a1c:c357:: with SMTP id t84mr9949149wmf.155.1592670502257; 
 Sat, 20 Jun 2020 09:28:22 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id e8sm9240006wrv.24.2020.06.20.09.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 09:28:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/arm/aspeed: Remove extraneous MemoryRegion object owner
Date: Sat, 20 Jun 2020 18:28:17 +0200
Message-Id: <20200620162818.22340-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200620162818.22340-1-f4bug@amsat.org>
References: <20200620162818.22340-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm confused by this code, 'bmc' is created as:

  bmc = g_new0(AspeedBoardState, 1);

Then we use it as QOM owner for different MemoryRegion objects.
But looking at memory_region_init_ram (similarly for ROM):

  void memory_region_init_ram(MemoryRegion *mr,
                              struct Object *owner,
                              const char *name,
                              uint64_t size,
                              Error **errp)
  {
      DeviceState *owner_dev;
      Error *err = NULL;

      memory_region_init_ram_nomigrate(mr, owner, name, size, &err);
      if (err) {
          error_propagate(errp, err);
          return;
      }
      /* This will assert if owner is neither NULL nor a DeviceState.
       * We only want the owner here for the purposes of defining a
       * unique name for migration. TODO: Ideally we should implement
       * a naming scheme for Objects which are not DeviceStates, in
       * which case we can relax this restriction.
       */
      owner_dev = DEVICE(owner);
      vmstate_register_ram(mr, owner_dev);
  }

The expected assertion is not triggered ('bmc' is not NULL neither
a DeviceState).

'bmc' structure is defined as:

  struct AspeedBoardState {
      AspeedSoCState soc;
      MemoryRegion ram_container;
      MemoryRegion max_ram;
  };

Apparently
What happens is when using 'OBJECT(bmc)', the QOM macros cast the
memory pointed by bmc, which first member is 'soc', which is
initialized ...:

  object_initialize_child(OBJECT(machine), "soc",
                          &bmc->soc, amc->soc_name);

The 'soc' object is indeed a DeviceState, so the assertion passes.

Since this is fragile and only happens to work by luck, remove the
dangerous OBJECT(bmc) owner argument.

This probably breaks migration for this machine.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0ad08a2b4c..31765792a2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -329,12 +329,12 @@ static void aspeed_machine_init(MachineState *machine)
          * needed by the flash modules of the Aspeed machines.
          */
         if (ASPEED_MACHINE(machine)->mmio_exec) {
-            memory_region_init_alias(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
+            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
                                      &fl->mmio, 0, fl->size);
             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                         boot_rom);
         } else {
-            memory_region_init_rom(boot_rom, OBJECT(bmc), "aspeed.boot_rom",
+            memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
                                    fl->size, &error_abort);
             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
                                         boot_rom);
@@ -345,7 +345,7 @@ static void aspeed_machine_init(MachineState *machine)
     if (machine->kernel_filename && sc->num_cpus > 1) {
         /* With no u-boot we must set up a boot stub for the secondary CPU */
         MemoryRegion *smpboot = g_new(MemoryRegion, 1);
-        memory_region_init_ram(smpboot, OBJECT(bmc), "aspeed.smpboot",
+        memory_region_init_ram(smpboot, NULL, "aspeed.smpboot",
                                0x80, &error_abort);
         memory_region_add_subregion(get_system_memory(),
                                     AST_SMP_MAILBOX_BASE, smpboot);
-- 
2.21.3


