Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2496EE0BC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 12:57:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prGLX-0001vb-Q1; Tue, 25 Apr 2023 06:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prGLU-0001u7-1c
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 06:56:29 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prGLQ-0004hE-N4
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 06:56:27 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 3E58060A02;
 Tue, 25 Apr 2023 13:56:20 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b440::1:14])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 4uDLUS1OcKo0-5wyXylCH; Tue, 25 Apr 2023 13:56:19 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682420179; bh=dmP7RsqsNBWEKlsZF2unANl73sZ2JwhlINZhbJfI5yk=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=nZpR1AH4Qd+C2wgwRE+gZJF351T0qzLXCbKXUyLxN7E0Ia1uM1xdxahoBTHkyxp1Q
 vP47KzhQ6+XL8nS3Q6Rhk+9OpwL3T3nckeMj3fVoe6egUr+MX5Get6f4OambH6C+kZ
 OI7eIl86iWGcXToTa+kInRSFe4FtQCA0TvzmmiZ8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 david@redhat.com, peterx@redhat.com, pbonzini@redhat.com,
 vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru, lersek@redhat.com,
 kraxel@redhat.com
Subject: [PATCH 3/3] pci: ROM preallocation for incoming migration
Date: Tue, 25 Apr 2023 13:56:03 +0300
Message-Id: <20230425105603.137823-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425105603.137823-1-vsementsov@yandex-team.ru>
References: <20230425105603.137823-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On incoming migration we have the following sequence to load option
ROM:

1. On device realize we do normal load ROM from the file

2. Than, on incoming migration we rewrite ROM from the incoming RAM
   block. If sizes mismatch we fail.

This is not ideal when we migrate to updated distribution: we have to
keep old ROM files in new distribution and be careful around romfile
property to load correct ROM file. Which is loaded actually just to
allocate the ROM with correct length.

Note, that romsize property doesn't really help: if we try to specify
it when default romfile is larger, it fails with something like:

romfile "efi-virtio.rom" (160768 bytes) is too large for ROM size 65536

This commit brings new behavior for romfile="",romsize=SIZE combination
of options. Current behavior is just ignore romsize and not load or
create any ROM.

Let's instead preallocate ROM, not loading any file. This way we can
migrate old vm to new environment not thinking about ROM files on
destination host:

1. specify romfile="",romsize=SIZE on target, with correct SIZE
   (actually, size of romfile on source aligned up to power of two, or
    just original romsize option on source)

2. On device realize we just preallocate ROM, and not load any file

3. On incoming migration ROM is filled from the migration stream

As a bonus we avoid extra reading from ROM file on target.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/pci.c | 76 +++++++++++++++++++++++++++++-----------------------
 1 file changed, 43 insertions(+), 33 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a442f8fce1..039e762b66 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2293,17 +2293,21 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
 {
     int64_t size;
     g_autofree char *path = NULL;
-    void *ptr;
     char name[32];
     const VMStateDescription *vmsd;
+    bool load_file;
 
     if (!pdev->romfile) {
         return;
     }
-    if (strlen(pdev->romfile) == 0) {
+
+    load_file = strlen(pdev->romfile) > 0;
+    if (!load_file && pdev->romsize == -1) {
         return;
     }
 
+    assert(load_file || !is_default_rom);
+
     if (!pdev->rom_bar) {
         /*
          * Load rom via fw_cfg instead of creating a rom bar,
@@ -2329,32 +2333,35 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
         return;
     }
 
-    path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
-    if (path == NULL) {
-        path = g_strdup(pdev->romfile);
-    }
+    if (load_file) {
+        path = qemu_find_file(QEMU_FILE_TYPE_BIOS, pdev->romfile);
+        if (path == NULL) {
+            path = g_strdup(pdev->romfile);
+        }
 
-    size = get_image_size(path);
-    if (size < 0) {
-        error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
-        return;
-    } else if (size == 0) {
-        error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
-        return;
-    } else if (size > 2 * GiB) {
-        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
-                   pdev->romfile);
-        return;
-    }
-    if (pdev->romsize != -1) {
-        if (size > pdev->romsize) {
-            error_setg(errp, "romfile \"%s\" (%u bytes) "
-                       "is too large for ROM size %u",
-                       pdev->romfile, (uint32_t)size, pdev->romsize);
+        size = get_image_size(path);
+        if (size < 0) {
+            error_setg(errp, "failed to find romfile \"%s\"", pdev->romfile);
+            return;
+        } else if (size == 0) {
+            error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
+            return;
+        } else if (size > 2 * GiB) {
+            error_setg(errp,
+                       "romfile \"%s\" too large (size cannot exceed 2 GiB)",
+                       pdev->romfile);
             return;
         }
-    } else {
-        pdev->romsize = pow2ceil(size);
+        if (pdev->romsize != -1) {
+            if (size > pdev->romsize) {
+                error_setg(errp, "romfile \"%s\" (%u bytes) "
+                           "is too large for ROM size %u",
+                           pdev->romfile, (uint32_t)size, pdev->romsize);
+                return;
+            }
+        } else {
+            pdev->romsize = pow2ceil(size);
+        }
     }
 
     vmsd = qdev_get_vmsd(DEVICE(pdev));
@@ -2365,15 +2372,18 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
     memory_region_init_rom(&pdev->rom, OBJECT(pdev), name, pdev->romsize,
                            &error_fatal);
 
-    ptr = memory_region_get_ram_ptr(&pdev->rom);
-    if (load_image_size(path, ptr, size) < 0) {
-        error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
-        return;
-    }
+    if (load_file) {
+        void *ptr = memory_region_get_ram_ptr(&pdev->rom);
 
-    if (is_default_rom) {
-        /* Only the default rom images will be patched (if needed). */
-        pci_patch_ids(pdev, ptr, size);
+        if (load_image_size(path, ptr, size) < 0) {
+            error_setg(errp, "failed to load romfile \"%s\"", pdev->romfile);
+            return;
+        }
+
+        if (is_default_rom) {
+            /* Only the default rom images will be patched (if needed). */
+            pci_patch_ids(pdev, ptr, size);
+        }
     }
 
     pci_register_bar(pdev, PCI_ROM_SLOT, 0, &pdev->rom);
-- 
2.34.1


