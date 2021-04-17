Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63A362F46
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 12:36:45 +0200 (CEST)
Received: from localhost ([::1]:33056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXiJg-0007h5-9J
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 06:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEN-0001uA-LZ; Sat, 17 Apr 2021 06:31:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lXiEL-00012X-Uy; Sat, 17 Apr 2021 06:31:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id a4so29043374wrr.2;
 Sat, 17 Apr 2021 03:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cT/Vrzb6/GOtxumkXOhTgGmRp7jm4YS4nNjhVoL+0R8=;
 b=I7Sv3v0v6goLZQBTBwy61vr+YsJG2YDxR+mwyoDdBx26bH58MG0S5sUdNpi1BRhepU
 +eHEr+FtDBaXJid1tXh/LiZPViT6HJwPwwhcvRTxXyIt8rhe7OTFUkfwIhEQjv1SQdbd
 DxtgFcwzmUpwe+s4y+d7O36kYvjCHUm1uXOkkQXHWpTvmxm8r2Pd44bnO+WTuq9ZxsYi
 y6lUBYOwYjgW8hqTyW9ipQXjbRuDwraL7Eob+pXC1nMRKJyhq5CWVNWjtLXBJ75Hbmf0
 Od7P0VdTl+C/91fo8/9gepLPAdFM++/a2KWdHbZ519HT9UvhssVCjGJpb4upRHRtj6Ch
 9YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cT/Vrzb6/GOtxumkXOhTgGmRp7jm4YS4nNjhVoL+0R8=;
 b=IjcoTH5KEvsD8TDWFb8NQqMMVO0Ilth/ysoRv5317UPQvs3PhBs0ndO4du1LzMRBCJ
 X1dPIsl3apviCN1SyQszOPG4v6zRp/E5KzINB0po8U8qRWP4wb9oD83WL+G9LiKg0QET
 YOzVwTSKC8vvVX3NRXadqkVkdFQgYOWHBKHCKPTZjPox+g6LV/aQ1DDzjDTv5oy5fZT3
 WoYrqptFDr4jkW6pnqxBrcbPsJ2XGXZPI8+Ox1WNo4rFCxszhLQr0D9oXJafQcFx9RuJ
 AG5vCwofJfT+Jc++T/iemo3yeo0kZmZAg+7ErqNgQWyr7jwyLf6eSGIDK4pbBkbFt3Ui
 T6Tg==
X-Gm-Message-State: AOAM532wBv2lzrcBvw4yi6QgyL9uWi9JXqMZ3jQ+aCy3yIx8L87xk4iD
 ClQbqsE+HmD/m83d0Xq+qekMHthrojs=
X-Google-Smtp-Source: ABdhPJwtaeBHEUhbEHb92jZ9d32OnQp18zwnWAGYOSOj27FqY5AgQL9TmpyRCkuU1P8UFZusrZTjTw==
X-Received: by 2002:adf:f106:: with SMTP id r6mr3677206wro.214.1618655471739; 
 Sat, 17 Apr 2021 03:31:11 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n9sm14395212wrq.86.2021.04.17.03.31.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 03:31:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 08/11] hw/pci-host/raven: Remove pointless alias
 mapping onto system bus
Date: Sat, 17 Apr 2021 12:30:25 +0200
Message-Id: <20210417103028.601124-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210417103028.601124-1-f4bug@amsat.org>
References: <20210417103028.601124-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'pci-io' alias (mapped with priority 0) ends up masked by
the 'pci-io-non-contiguous' I/O region (mapped with priority 1).

The flatview rendering is ('pci-io-non-contiguous' is written
'pci-io-nc'):

(base addr) [               MemoryRegion               ]        [   FlatView   ]

           +----------------------------+---------------+
           |         priority 0         |   priority 1  |
           +----------------------------+---------------+

8000.0000  +-            +--------------+---------------+      +---------------+
                         |   "pci-io"   |  "pci-io-nc"  |      |  "pci-io-nc"  |
                         |              |               |      |               |
                         | / - isadev   |               |      |               |
                         | | - isadev   |               |      |               |
                         | | - isadev   |               +----> |               |
                         | \ - isadev   |               |      |               |
                         |              |               |      |               |
                         |              |               |      |               |
                         |              |               |      |               |
8080.0000  +-------------+              +---------------+      +---------------+
           |   "pciio"   |              |                      |    "pciio"    |
           |             |              |                      |               |
           |             |              |                      |               |
           |             +  -  -  -  -  |--------------------> |               |
           |             |              |                      |               |
           |             |              |                      |               |
           |             |              |                      |               |
80c0.0000  +-------------+              |                      +---------------+
                         |              |                       +-------------+
                         |              |                       |    "???"    |
                         |              |                       |             |
                         |              |        ???????----->  | unassigned? |
                         |              |                       |             |
                         |              |                       |             |
                         |              |                       |             |
bf80.0000  +-            +--------------+                       +-------------+

The before/after this commit memory tree diff is:

  (qemu) info mtree
  memory-region: system
    0000000000000000-ffffffffffffffff (prio 0, i/o): system
      0000000000000000-0000000001ffffff (prio 0, ram): simm.0
      0000000002000000-0000000003ffffff (prio 1, ram): simm.1
      0000000004000000-0000000005ffffff (prio 2, ram): simm.2
      0000000006000000-0000000007ffffff (prio 3, ram): simm.3
      0000000080000000-00000000807fffff (prio 1, i/o): pci-io-non-contiguous
-     0000000080000000-00000000bf7fffff (prio 0, i/o): alias pci-io @pci-io 0000000000000000-000000003f7fffff
      0000000080800000-0000000080bfffff (prio 0, i/o): pciio
      00000000bfffeff0-00000000bfffeff3 (prio 0, i/o): ppc-parity
      00000000bffffff0-00000000bffffff0 (prio 0, i/o): pci-intack
      00000000c0000000-00000000feffffff (prio 0, i/o): pci-memory
        00000000c00a0000-00000000c00bffff (prio 1, i/o): vga-lowmem
      00000000f0000510-00000000f0000511 (prio 0, i/o): fwcfg.ctl
      00000000f0000512-00000000f0000512 (prio 0, i/o): fwcfg.data
      00000000fff00000-00000000ffffffff (prio 0, rom): bios

We can see it in the monitor, before/after this patch, the
flatview rendering is left unchanged (note the unassigned
80c0.0000-bf7f.ffff range):

  (qemu) info mtree  -f
  FlatView #1
   AS "memory", root: system
   AS "cpu-memory-0", root: system
   Root memory region: system
    0000000000000000-0000000001ffffff (prio 0, ram): simm.0
    0000000002000000-0000000003ffffff (prio 1, ram): simm.1
    0000000004000000-0000000005ffffff (prio 2, ram): simm.2
    0000000006000000-0000000007ffffff (prio 3, ram): simm.3
    0000000080000000-00000000807fffff (prio 1, i/o): pci-io-non-contiguous
    0000000080800000-0000000080bfffff (prio 0, i/o): pciio
    00000000bfffeff0-00000000bfffeff3 (prio 0, i/o): ppc-parity
    00000000bffffff0-00000000bffffff0 (prio 0, i/o): pci-intack
    00000000c00a0000-00000000c00bffff (prio 1, i/o): vga-lowmem
    00000000f0000510-00000000f0000511 (prio 0, i/o): fwcfg.ctl
    00000000f0000512-00000000f0000512 (prio 0, i/o): fwcfg.data
    00000000fff00000-00000000ffffffff (prio 0, rom): bios

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC because I can't justify the unassigned 80c0.0000-bf7f.ffff range.
---
 hw/pci-host/raven.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 7bbb7ef0a29..f9c92b83770 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -67,7 +67,6 @@ struct PRePPCIState {
     PCIBus pci_bus;
     AddressSpace pci_io_as;
     MemoryRegion pci_io;
-    MemoryRegion pci_io_alias;
     MemoryRegion pci_io_non_contiguous;
     MemoryRegion pci_memory;
     MemoryRegion pci_intack;
@@ -299,8 +298,6 @@ static void raven_pcihost_initfn(Object *obj)
     DeviceState *pci_dev;
 
     memory_region_init(&s->pci_io, obj, "pci-io", 0x3f800000);
-    memory_region_init_alias(&s->pci_io_alias, obj, "pci-io",
-                             &s->pci_io, 0, memory_region_size(&s->pci_io));
     memory_region_init_io(&s->pci_io_non_contiguous, obj, &raven_io_ops, s,
                           "pci-io-non-contiguous", 0x00800000);
     memory_region_init(&s->pci_memory, obj, "pci-memory", 0x3f000000);
@@ -308,9 +305,7 @@ static void raven_pcihost_initfn(Object *obj)
 
     /* CPU address space */
     memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
-                                &s->pci_io_alias);
-    memory_region_add_subregion_overlap(address_space_mem, PCI_IO_BASE_ADDR,
-                                        &s->pci_io_non_contiguous, 1);
+                                &s->pci_io_non_contiguous);
     memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
     pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
                              &s->pci_memory, &s->pci_io, 0, TYPE_PCI_BUS);
-- 
2.26.3


