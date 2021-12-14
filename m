Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434A2473B82
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 04:26:18 +0100 (CET)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwySG-0002yA-Vu
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 22:26:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mwyRJ-0002B1-UR
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 22:25:19 -0500
Received: from [2a00:1450:4864:20::433] (port=40874
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1mwyRH-0001nS-TN
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 22:25:17 -0500
Received: by mail-wr1-x433.google.com with SMTP id t9so30192607wrx.7
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 19:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QUSxU9RiVv20VDseJCb/y3nyWW47kB8Mgo+wyVliFao=;
 b=UkyOXDKVSn0AleH8tEJ0TeKyWes9yzbPpRyzo5nI4sIMoD0g5RG29yjDxgVNdmryXa
 XgMK+y3LcNzNLXydk+UEtlB80P5+1SwiKdZJwy+g8PSMYTexEQzLPzADdrTD4eXJbw9k
 ZcuqAPcfhI0hJmPDye5VD7wPjmj0wZ1+z+vp6z1IjxpULye6KHsSnaFlJOs3mIvGRfCF
 lWnuiokeym732s+A6obUFjUrW0+ulOlgkacbfnLqT7KM1ahJIRroG03AOObAWmueOLDg
 DY9RLdioBypSY1JEwslpaAIVW3oGiZWeeAyRvkLHdNzG9qWjkoxvBueFYFwdis15wI/Z
 kAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QUSxU9RiVv20VDseJCb/y3nyWW47kB8Mgo+wyVliFao=;
 b=bBrmnJpf8entQqrai9VShqBUWH6oSxx8xDdS5ZWEoxBlUsbIW9k5/o/MD6YjRUH3Fj
 EfuvA73aTp73HuEkMsfF9nj0/7RoElZbFvxdLHOky/NQv7xsJq+Rn7LuGTyD0bwxGWHZ
 1dR7sUurpD2HysxBcek91Vf9J4KwHsCQSld/6G21bCNfKiVBdatWPceVQWeJIGvNFMs3
 4YYypKYkNAWpD+KGM7Lovywiu9RPxJF76BKPlSqcMGeOl70g+QmahaWW39k/8rF9UyLY
 AqtI1XzBFcphi46TTclVneKqxe0i6b7UmVXeFXWPTuuBH4PWQGpE6r20FFZn1U90vFQb
 VwUw==
X-Gm-Message-State: AOAM532D2wVAtjUAZICmeNv6fmkM7MgM48I+AmAg+0F4Mmr0C7AGIdRM
 Jw8WRc4SzZmquo/WqW/mH8HEiw==
X-Google-Smtp-Source: ABdhPJyfvvgmyiQVEO+gpkOA7uzZv984Hrpj57B/qSXCJk0STVd/P3Bi5f1TKAMFAn1uFjoxZUCYLw==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr2873662wrv.11.1639452311544; 
 Mon, 13 Dec 2021 19:25:11 -0800 (PST)
Received: from Jessicas-MacBook-Pro.local (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id q26sm12463692wrc.39.2021.12.13.19.25.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Dec 2021 19:25:11 -0800 (PST)
Received: by Jessicas-MacBook-Pro.local (Postfix, from userid 501)
 id C357DA66ECD5; Tue, 14 Dec 2021 03:25:09 +0000 (GMT)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-riscv@nongnu.org
Subject: [PATCH] hw/riscv: Use load address rather than entry point for
 fw_dynamic next_addr
Date: Tue, 14 Dec 2021 03:24:56 +0000
Message-Id: <20211214032456.70203-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original BBL boot method had the kernel embedded as an opaque blob
that was blindly jumped to, which OpenSBI implemented as fw_payload.
OpenSBI then implemented fw_jump, which allows the payload to be loaded
elsewhere, but still blindly jumps to a fixed address at which the
kernel is to be loaded. Finally, OpenSBI introduced fw_dynamic, which
allows the previous stage to inform it where to jump to, rather than
having to blindly guess like fw_jump, or embed the payload as part of
the build like fw_payload. When used with an opaque binary (i.e. the
output of objcopy -O binary), it matches the behaviour of the previous
methods. However, when used with an ELF, QEMU currently passes on the
ELF's entry point address, which causes a discrepancy compared with all
the other boot methods if that entry point is not the first instruction
in the binary.

This difference specific to fw_dynamic with an ELF is not apparent when
booting Linux, since its entry point is the first instruction in the
binary. However, FreeBSD has a separate ELF entry point, following the
calling convention used by its bootloader, that differs from the first
instruction in the binary, used for the legacy SBI entry point, and so
the specific combination of QEMU's default fw_dynamic firmware with
booting FreeBSD as an ELF rather than a raw binary does not work.

Thus, align the behaviour when loading an ELF with the behaviour when
loading a raw binary; namely, use the base address of the loaded kernel
in place of the entry point.

The uImage code is left as-is in using the U-Boot header's entry point,
since the calling convention for that entry point is the same as the SBI
one and it mirrors what U-Boot will do.

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 hw/riscv/boot.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 519fa455a1..f67264374e 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -151,12 +151,19 @@ target_ulong riscv_load_kernel(const char *kernel_filename,
                                target_ulong kernel_start_addr,
                                symbol_fn_t sym_cb)
 {
-    uint64_t kernel_entry;
+    uint64_t kernel_load_base, kernel_entry;
 
+    /*
+     * NB: Use low address not ELF entry point to ensure that the fw_dynamic
+     * behaviour when loading an ELF matches the fw_payload, fw_jump and BBL
+     * behaviour, as well as fw_dynamic with a raw binary, all of which jump to
+     * the (expected) load address load address. This allows kernels to have
+     * separate SBI and ELF entry points (used by FreeBSD, for example).
+     */
     if (load_elf_ram_sym(kernel_filename, NULL, NULL, NULL,
-                         &kernel_entry, NULL, NULL, NULL, 0,
+                         NULL, &kernel_load_base, NULL, NULL, 0,
                          EM_RISCV, 1, 0, NULL, true, sym_cb) > 0) {
-        return kernel_entry;
+        return kernel_load_base;
     }
 
     if (load_uimage_as(kernel_filename, &kernel_entry, NULL, NULL,
-- 
2.33.1


