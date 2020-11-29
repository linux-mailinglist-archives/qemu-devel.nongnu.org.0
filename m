Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A162C7B34
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Nov 2020 21:44:02 +0100 (CET)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjTY8-00024G-Vu
	for lists+qemu-devel@lfdr.de; Sun, 29 Nov 2020 15:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjTTu-00077U-KV
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:39:38 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:44117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kjTTj-0001Hz-R9
 for qemu-devel@nongnu.org; Sun, 29 Nov 2020 15:39:38 -0500
Received: by mail-wr1-x442.google.com with SMTP id 64so12596125wra.11
 for <qemu-devel@nongnu.org>; Sun, 29 Nov 2020 12:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sgwMjHUaXq0iFZyT9JRWDKwktUp8iww4PEsAkIyqlqA=;
 b=c7dVgZZUZkw9keZGBIkh6HRbP+9zGAZ1D4RVvf4ND6u+De8u1n9iZiEIlAhyxEUcpM
 /OgbYizS+xdKCerGqZr7Il5HQMt7J8Wj4Ry1eLQ3A7d+0qd7JV7Tp1I5V7uYRYYJIztU
 ovbjD/W/KFWte1LWIpx36wk9o2WCqxU5LP5L2yovJldPc9tCmpGYH/+xL9xfHiapVldR
 Uoxk5093OF+FK7m9IXpB5KFJq0Im0uhdZtMY1PgCAF0szLifVdnXe9LXiJRQIeyiNtx+
 Koo06DsfiVoe0/ZjJE0d1QrbgJyY9t5MOIBI1TC0Rb3CtCe1LNZY8E1uF1+WtbF6/gue
 jf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sgwMjHUaXq0iFZyT9JRWDKwktUp8iww4PEsAkIyqlqA=;
 b=nNf6zODdJ7G228i5m/FqwH6QcctazoetCNkFg80uErcc58tDmsIxwe92vqHMuIgs6M
 3/mXT0HGOdif3gnf3yPvZMyyVrnIYMXq6qA/pCVgUJo9MnWSaDCQFX+8rTz6h4Gy+YXf
 AFKpBhy5oGBntad7eYMv8jgtAKb1v9uFPVIEt4C4XWnBckVDMwgUM2jcLTj2nc0TlHQv
 8noBtaU3kMobrM+xVSLR9YOyw6lDa7KdTkWlyD2gOM42h/JsMSCt6UMuxiIz3PdvEuN3
 u1PkRB4aWK7Pb+sMm/Jpj5ottrphYVdXRP2Hxt0uSqdeM9lBVE9j17cVudID27TinKcQ
 S6xg==
X-Gm-Message-State: AOAM533B7POBAiXi2q5+8HfbDNR5htMoAZ6kzkegd1JRnxSHD5zaS1rS
 XvsjD8VwdJWHNSLukF+KPyBxJfyArwdalw==
X-Google-Smtp-Source: ABdhPJzsTurGuZzuJJ5QXSL0bGopM5JBCUTYKgzfGlwvL/4Zj+2HJhnYE70zxN0GcasXFEeow8hTSg==
X-Received: by 2002:a05:6000:104b:: with SMTP id
 c11mr24362713wrx.329.1606682366299; 
 Sun, 29 Nov 2020 12:39:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q12sm23618393wrx.86.2020.11.29.12.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 12:39:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/core/loader.c: Track last-seen ROM in
 rom_check_and_register_reset()
Date: Sun, 29 Nov 2020 20:39:20 +0000
Message-Id: <20201129203923.10622-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201129203923.10622-1-peter.maydell@linaro.org>
References: <20201129203923.10622-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In rom_check_and_register_reset() we detect overlaps by looking at
whether the ROM blob we're currently examining is in the same address
space and starts before the previous ROM blob ends.  (This works
because the ROM list is kept sorted in order by AddressSpace and then
by address.)

Instead of keeping the AddressSpace and last address of the previous ROM
blob in local variables, just keep a pointer to it.

This will allow us to print more useful information when we do detect
an overlap.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/core/loader.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 8bbb1797a4c..05052ee797e 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1165,28 +1165,35 @@ static void rom_reset(void *unused)
     }
 }
 
+/* Return true if two consecutive ROMs in the ROM list overlap */
+static bool roms_overlap(Rom *last_rom, Rom *this_rom)
+{
+    if (!last_rom) {
+        return false;
+    }
+    return last_rom->as == this_rom->as &&
+        last_rom->addr + last_rom->romsize > this_rom->addr;
+}
+
 int rom_check_and_register_reset(void)
 {
-    hwaddr addr = 0;
     MemoryRegionSection section;
-    Rom *rom;
-    AddressSpace *as = NULL;
+    Rom *rom, *last_rom = NULL;
 
     QTAILQ_FOREACH(rom, &roms, next) {
         if (rom->fw_file) {
             continue;
         }
         if (!rom->mr) {
-            if ((addr > rom->addr) && (as == rom->as)) {
+            if (roms_overlap(last_rom, rom)) {
                 fprintf(stderr, "rom: requested regions overlap "
                         "(rom %s. free=0x" TARGET_FMT_plx
                         ", addr=0x" TARGET_FMT_plx ")\n",
-                        rom->name, addr, rom->addr);
+                        rom->name, last_rom->addr + last_rom->romsize,
+                        rom->addr);
                 return -1;
             }
-            addr  = rom->addr;
-            addr += rom->romsize;
-            as = rom->as;
+            last_rom = rom;
         }
         section = memory_region_find(rom->mr ? rom->mr : get_system_memory(),
                                      rom->addr, 1);
-- 
2.20.1


