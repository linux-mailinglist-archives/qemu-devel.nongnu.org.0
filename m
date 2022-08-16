Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF1359618C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:54:30 +0200 (CEST)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0lp-0004Yl-K1
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sr-0004qi-0R; Tue, 16 Aug 2022 13:34:53 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:44907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sp-0002O0-Fq; Tue, 16 Aug 2022 13:34:52 -0400
Received: by mail-vk1-xa31.google.com with SMTP id j11so5516341vkk.11;
 Tue, 16 Aug 2022 10:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MnYaB9DJvwNH6aElOaN8rUTWZD25FX0c/ifXFFw+Ai4=;
 b=Xr2wHXJ08u/GCEhlGa5tWbgWmka5tuGbTM3jW1sLE8PvB05sFoFpjV9XVoXid5jzxq
 PG5RDy9emYWKwgUtJb+F3/SU1ZXuLCVOeUXTuNI4G0NxPO4UstMJFGryN5lWXs8woJOx
 7Locbgfspo0sk68zSl9PJ9MR+BCj6rzx8vgAEPnwhZwrWJw/v8k3TXAj3xaXfV7pZOQ+
 LiY9DooVadvIEjCnefcaocGlNxzZlLo45dAPoFZaLx8iAHsoe4p92roWBLhcZeTDR7TT
 MsSfZqaTY5lvk+KEiu5SbMRc4JEdqtulzyXd9B8+f4VZS/S2RYF/P5nHeqMvyQz030Yx
 v+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MnYaB9DJvwNH6aElOaN8rUTWZD25FX0c/ifXFFw+Ai4=;
 b=pOOY+s1PT8t30KN7vDVRb/jQsQB3TJwf8b8c1xKuEn03s7VQBbA1zw3BKr3LvviBbG
 lsIYhHcTZjwxgv9LdMXkWH88XNtaYFbicLpJhX01JIVNZqPtQ8uyX7pGQW+YpNuuQr+o
 My+trKjWCvx9MfPuS3/as1S/nTE3/2l+MWE7rN9UyvhPZdcvGTjW/CG35O5twqrtailc
 ITk6U5AQ90DUfF70kT/2f5z07aDBkkrVL1rhDmKsn+4ybo23Fb4LSOp14jUlCCYjjv2e
 2qWwkhO2ZjjyK7Si9bA2CYqr8pdXExb4d1LBU7svtoiziFh/wkTBHahW7n/6zCumUrzp
 fENA==
X-Gm-Message-State: ACgBeo2eyQpBPCuZaG+J0BCZIFpwyyoRgE0UQ6uIIWYcGfd1JoYIpts5
 yRICWuaDSuuT9OyuxIcrj142dKaqm+PiLA==
X-Google-Smtp-Source: AA6agR4iMsdCiXN8z0M9yeM19xHotADwhQ7d7SzSbBnQaL4UBn/JQn6EN6DVz/C1RsnKlrWXHcQjVA==
X-Received: by 2002:ac5:c4ce:0:b0:379:1113:bbc5 with SMTP id
 a14-20020ac5c4ce000000b003791113bbc5mr9377158vkl.1.1660671289980; 
 Tue, 16 Aug 2022 10:34:49 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH for-7.2 v3 06/20] hw/ppc: set machine->fdt in
 sam460ex_load_device_tree()
Date: Tue, 16 Aug 2022 14:34:14 -0300
Message-Id: <20220816173428.157304-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
the sam460ex machine.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/sam460ex.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index 0357ee077f..413a425d37 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -138,6 +138,7 @@ static int sam460ex_load_device_tree(hwaddr addr,
                                      hwaddr initrd_size,
                                      const char *kernel_cmdline)
 {
+    MachineState *machine = MACHINE(qdev_get_machine());
     uint32_t mem_reg_property[] = { 0, 0, cpu_to_be32(ramsize) };
     char *filename;
     int fdt_size;
@@ -209,7 +210,12 @@ static int sam460ex_load_device_tree(hwaddr addr,
                               EBC_FREQ);
 
     rom_add_blob_fixed(BINARY_DEVICE_TREE_FILE, fdt, fdt_size, addr);
-    g_free(fdt);
+
+    /*
+     * Update the machine->fdt pointer to enable support for
+     * 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = fdt;
 
     return fdt_size;
 }
-- 
2.37.2


