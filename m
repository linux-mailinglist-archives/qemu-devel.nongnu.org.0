Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D1230CDA2
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:09:43 +0100 (CET)
Received: from localhost ([::1]:59926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72ve-0006Hq-Pz
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72mN-0002zO-80
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 16:00:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72mD-0007RY-AN
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 16:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCwL7X+YG8I7zuVW+8dXIaUVElWXRJ89Y3C+f17wiig=;
 b=TV4OUp+x0phCHczao5smJjNCcc3mxI9KH7F1h3a1bf4HQEJITvIpvvNI8/1l2jhZHF+N/6
 v9/uOiiVsg3xVklci5V3wn5Qzz2ivHXM6kF04dMEZTBtdM/e4qo/V/y/TAC6BMKwGPyDfM
 1sShxsQtIGkraIYATYmFr0UityJgnGY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-GfkTg_eDOFaKKpgJNZCGog-1; Tue, 02 Feb 2021 15:59:52 -0500
X-MC-Unique: GfkTg_eDOFaKKpgJNZCGog-1
Received: by mail-ed1-f71.google.com with SMTP id ck25so10159923edb.16
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:59:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RCwL7X+YG8I7zuVW+8dXIaUVElWXRJ89Y3C+f17wiig=;
 b=iILJK/gRVwUZQRZrkYm9vvHwIqVdI70oj8o/Vui1F9HluehDhgjeKLQfOpKkDZFslw
 rt1sR2y2KHkJVkyaB+JNQCX0QqoQ79QUgvhWeMpdVU/j2/wC3u91jevpnZ5TaFDdtTkR
 1a+3u7V/xJbigQSBcWgnmP4BvtPz2J2FvxYJ9NMvjesiAPZaHqmahe3WYsi5JS71M+Uw
 2QV9YCuM9CY2oEdCXoJP2nz6rlwJ7+Xh99UPcsYw4KCkfjGEPEHow9b8la2UpPQ5M5Ij
 8oyoOfVcnifRn/YCW8kInFPuIM3oe+ATplwwNdy60AiHMuLhc6rcXVcsGWs3y/ghYb4A
 PcaQ==
X-Gm-Message-State: AOAM533eUs+FMJXlTXKYeFrotJgkkkj+OWJ9t2PmgBa8Ot/dhSLO9lJ9
 PY1E46eF52ACxJo0wA4zCASIkFvedL2fPN4OC1Xa+MMdDZQ4RUdNtKsKAVur+0D1vUYaD845h+F
 UMtjBTADj9oEKlW0T0FrPRHZ1kCoh4a02LJUQrNl9AzceSyEEninCUfOQvpk4Vbm5
X-Received: by 2002:a17:906:25db:: with SMTP id
 n27mr24055307ejb.552.1612299589433; 
 Tue, 02 Feb 2021 12:59:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwtBhkk7ZwSbIIG00pnkr4d8G9mx4OqL+199FXTzPG8YMKWoUzXyXTvbwMUAaceZWjiciitA==
X-Received: by 2002:a17:906:25db:: with SMTP id
 n27mr24055283ejb.552.1612299589261; 
 Tue, 02 Feb 2021 12:59:49 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id e7sm11918ejb.19.2021.02.02.12.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:59:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/12] hw/vfio/pci-quirks: Replace the word 'blacklist'
Date: Tue,  2 Feb 2021 21:58:24 +0100
Message-Id: <20210202205824.1085853-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/vfio/pci.h        |  2 +-
 hw/vfio/pci-quirks.c | 14 +++++++-------
 hw/vfio/pci.c        |  4 ++--
 hw/vfio/trace-events |  2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 1574ef983f8..64777516d16 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -197,7 +197,7 @@ void vfio_pci_write_config(PCIDevice *pdev,
 uint64_t vfio_vga_read(void *opaque, hwaddr addr, unsigned size);
 void vfio_vga_write(void *opaque, hwaddr addr, uint64_t data, unsigned size);
 
-bool vfio_blacklist_opt_rom(VFIOPCIDevice *vdev);
+bool vfio_opt_rom_in_denylist(VFIOPCIDevice *vdev);
 void vfio_vga_quirk_setup(VFIOPCIDevice *vdev);
 void vfio_vga_quirk_exit(VFIOPCIDevice *vdev);
 void vfio_vga_quirk_finalize(VFIOPCIDevice *vdev);
diff --git a/hw/vfio/pci-quirks.c b/hw/vfio/pci-quirks.c
index fc8d63c8504..81c3e30df77 100644
--- a/hw/vfio/pci-quirks.c
+++ b/hw/vfio/pci-quirks.c
@@ -43,19 +43,19 @@
 static const struct {
     uint32_t vendor;
     uint32_t device;
-} romblacklist[] = {
+} rom_denylist[] = {
     { 0x14e4, 0x168e }, /* Broadcom BCM 57810 */
 };
 
-bool vfio_blacklist_opt_rom(VFIOPCIDevice *vdev)
+bool vfio_opt_rom_in_denylist(VFIOPCIDevice *vdev)
 {
     int i;
 
-    for (i = 0 ; i < ARRAY_SIZE(romblacklist); i++) {
-        if (vfio_pci_is(vdev, romblacklist[i].vendor, romblacklist[i].device)) {
-            trace_vfio_quirk_rom_blacklisted(vdev->vbasedev.name,
-                                             romblacklist[i].vendor,
-                                             romblacklist[i].device);
+    for (i = 0 ; i < ARRAY_SIZE(rom_denylist); i++) {
+        if (vfio_pci_is(vdev, rom_denylist[i].vendor, rom_denylist[i].device)) {
+            trace_vfio_quirk_rom_in_denylist(vdev->vbasedev.name,
+                                             rom_denylist[i].vendor,
+                                             rom_denylist[i].device);
             return true;
         }
     }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index f74be782091..759a3b1abf4 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -900,7 +900,7 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
 
     if (vdev->pdev.romfile || !vdev->pdev.rom_bar) {
         /* Since pci handles romfile, just print a message and return */
-        if (vfio_blacklist_opt_rom(vdev) && vdev->pdev.romfile) {
+        if (vfio_opt_rom_in_denylist(vdev) && vdev->pdev.romfile) {
             warn_report("Device at %s is known to cause system instability"
                         " issues during option rom execution",
                         vdev->vbasedev.name);
@@ -927,7 +927,7 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (vfio_blacklist_opt_rom(vdev)) {
+    if (vfio_opt_rom_in_denylist(vdev)) {
         if (dev->opts && qemu_opt_get(dev->opts, "rombar")) {
             warn_report("Device at %s is known to cause system instability"
                         " issues during option rom execution",
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index c0e75f24b76..079f53acf28 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -49,7 +49,7 @@ vfio_pci_emulated_sub_vendor_id(const char *name, uint16_t val) "%s 0x%04x"
 vfio_pci_emulated_sub_device_id(const char *name, uint16_t val) "%s 0x%04x"
 
 # pci-quirks.c
-vfio_quirk_rom_blacklisted(const char *name, uint16_t vid, uint16_t did) "%s %04x:%04x"
+vfio_quirk_rom_in_denylist(const char *name, uint16_t vid, uint16_t did) "%s %04x:%04x"
 vfio_quirk_generic_window_address_write(const char *name, const char * region_name, uint64_t data) "%s %s 0x%"PRIx64
 vfio_quirk_generic_window_data_read(const char *name, const char * region_name, uint64_t data) "%s %s 0x%"PRIx64
 vfio_quirk_generic_window_data_write(const char *name, const char * region_name, uint64_t data) "%s %s 0x%"PRIx64
-- 
2.26.2


