Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AED2DAED3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:23:40 +0100 (CET)
Received: from localhost ([::1]:44790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBEp-0006U6-40
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4X-0001YS-Mu
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:03 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4M-00079G-U7
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:01 -0500
Received: by mail-wm1-x332.google.com with SMTP id k10so17010761wmi.3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MHT0mJa3dVWHtx0F9Sj68FS/nEuDFGtpOb6OtVQv3Mg=;
 b=fs/a2RbcQS1ecuMocKAv4fzSPQkGmjuzhyaWmMNHR2h7Gv+gWLNDjZ4JfPJRMYHaSb
 PcdH47wijdoF4yB6Y7VCSYZ4a+bG3xw1fFMH9AZopdbwAIUfEuBVqwOffaDOdj+zg03k
 ht5yQEbijnxXAZtmkHVxEy19YvikDeJ2f2d4c/+MZb4Ch4qco1T6XorZ5B05JR0aIIgP
 VkCqM1aBetZ4SjAeZnejymlPW/tFvpvznH/yo/T4QA0golUlpctLkn59UXVpee/ISP5g
 +F/wPkzBd/XXBFvlxBgjsnvAF7kvBLxodUOCN4bvP6+Q7xBBQvYSbAeM/Wc5OTHRWrbu
 HVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MHT0mJa3dVWHtx0F9Sj68FS/nEuDFGtpOb6OtVQv3Mg=;
 b=h8C7EmJ/+O0ml3wl0usTFhEgUAGtKZZR74VLTmrC7rdvysqEIzqhkBNtryq4bku9RY
 tRSo86btOj0RLO9McUjATCOzaLDk5aqtIRE2eTGdT8UMqNOfRij+smSjr0Oe0qzg1NyG
 DCKhOsbnZlF85bnw2USu+kIsCRIscee75pqI9iCUWXOUnq/x/EX5f9FWefhkhKnIYj56
 CsUO/Wurpx15RhSy/eAX6iMrQOAwaI09m6se2WvNelMfk6UIEiapUmGm5tQnwYX5/bQH
 R1WfaeAwH5W6vmrCC7FCvdsX8Ghfqzna5gPIbwYy+MqgB7fqumkA3LL42nulsgq6As6X
 vSjA==
X-Gm-Message-State: AOAM532MfuQlcioZkjdLlNrur+qWqvs7g7SnA+rmpSqHVjVN1bwggf8M
 mvP/OKApZ4mS8uE3nJMRiJOhOQBmAKBWWg==
X-Google-Smtp-Source: ABdhPJzROBP5Sb0iIg2OlKYJaHbzflwBrR34ndh2ytOxCpafrrHrAE3cDgeqPb+nyQngZ2aTmZ7jkw==
X-Received: by 2002:a1c:3987:: with SMTP id g129mr32408437wma.86.1608041569224; 
 Tue, 15 Dec 2020 06:12:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/20] hw/core/loader.c: Track last-seen ROM in
 rom_check_and_register_reset()
Date: Tue, 15 Dec 2020 14:12:25 +0000
Message-Id: <20201215141237.17868-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201129203923.10622-2-peter.maydell@linaro.org
---
 hw/core/loader.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index fea22d265c7..45aaba6158b 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1166,28 +1166,35 @@ static void rom_reset(void *unused)
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


