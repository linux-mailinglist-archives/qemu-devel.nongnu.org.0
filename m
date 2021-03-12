Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D53396E4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:46:53 +0100 (CET)
Received: from localhost ([::1]:57876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmoG-0000Q7-Er
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKlbi-0005XA-7i
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:29:50 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:45621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKlbe-0002gE-W1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:29:49 -0500
Received: by mail-wm1-x343.google.com with SMTP id
 r10-20020a05600c35cab029010c946c95easo15613780wmq.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8OpPe7RRzgUsca/HiL56Quy2lcOKFBmE9qvI9fkuUVI=;
 b=E9VewL2vDmzNAz01er9cmXvHW1gGrkxCzHNjdJEI4MiGISq5Ju9qJ7mNxWBWUHsdmD
 CQB7yUbdwHgbPsBxp1cZpBSf2PC8YGW4n5z49WlvtmppYrwGWWU1eQtf4h3xZCypdVO+
 B9QFyPnO7UvkUWCHvr5P4mj6GHWUnFN8PCFj5Gpu6+2ZBz66Ev6C17tlh4FikVAoYlUt
 WeFhllOuRgITejI7umnErc9X06neafOI5S6LjKmVvkxSEu3Y0AAT6G6QeU7oWS36BSmh
 Yj9/TeWR1HnwPyCYi2D2XGFQSpW13aOZ/MyRmUjmJ2fmYWY6rRRtU5omNWzS61Y+zL/t
 z8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8OpPe7RRzgUsca/HiL56Quy2lcOKFBmE9qvI9fkuUVI=;
 b=ZX9JrlVAa8M4WakEzIN/VfxPJojUNCbccProETwO7xNT1xrY8XxUHuA/jZ1/YwjtkE
 1+kcw7IbZ1XCny/4+OnV3lf2t62oUaZ2vVCwSHWOzPexMo5kJHmD6kzygXixsjp2lv8j
 LTVdO9K67xXfq9o4KKa7CccyIQoYoCPsnZzLJvhoPrapPknpXO9TtwUPWh/QL0QZnRd9
 XjAJ8akL+s20SE/MV6VY8ExwS3XTYROiXqI/jFHfDHKRWQiad8b7UHYPlnd26zPTkiwJ
 IXGCXTV2Ja4OdMdXPep1W3CY+sDmlk7+OGx3rEGcOPcfqdSNhajj9IrVjvCfxS3lgFuC
 RsoQ==
X-Gm-Message-State: AOAM531+60hMszyiV5SzdhOfmKSINIh2LD9Lh/GBmZ23uC9iOzonMKoX
 m1MZGM3qT/QcqndbwCqfC3PuUpgpO8SKLtvZ
X-Google-Smtp-Source: ABdhPJzSVqOfl1D6d4JZNpS14oyKgJOFDG/jQZLtUpH78riNEPZGDj0neOWs3RHCX36ta+oezDlQug==
X-Received: by 2002:a05:600c:4f03:: with SMTP id
 l3mr14122951wmq.149.1615570183083; 
 Fri, 12 Mar 2021 09:29:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m132sm2679001wmf.45.2021.03.12.09.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:29:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 2/2] target/arm: Make M-profile VTOR loads on reset
 handle memory aliasing
Date: Fri, 12 Mar 2021 17:29:39 +0000
Message-Id: <20210312172939.695-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172939.695-1-peter.maydell@linaro.org>
References: <20210312172939.695-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Kumar Gala <kumar.gala@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For Arm M-profile CPUs, on reset the CPU must load its initial PC and
SP from a vector table in guest memory.  Because we can't guarantee
reset ordering, we have to handle the possibility that the ROM blob
loader's reset function has not yet run when the CPU resets, in which
case the data in an ELF file specified by the user won't be in guest
memory to be read yet.

We work around the reset ordering problem by checking whether the ROM
blob loader has any data for the address where the vector table is,
using rom_ptr().  Unfortunately this does not handle the possibility
of memory aliasing.  For many M-profile boards, memory can be
accessed via multiple possible physical addresses; if the board has
the vector table at address X but the user's ELF file loads data via
a different address Y which is an alias to the same underlying guest
RAM then rom_ptr() will not find it.

Handle the possibility of aliasing by iterating through the whole
FlatView of the CPU's address space checking for other mappings of
the MemoryRegion corresponding to the location of the vector table.
If we find any aliases we use rom_ptr() to see if the ROM blob loader
has any data there.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae04884408c..aac78ae6623 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -161,6 +161,72 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
     assert(oldvalue == newvalue);
 }
 
+#ifndef CONFIG_USER_ONLY
+typedef struct FindRomCBData {
+    size_t size; /* Amount of data we want from ROM, in bytes */
+    MemoryRegion *mr; /* MR at the unaliased guest addr */
+    hwaddr xlat; /* Offset of addr within mr */
+    uint8_t *rom; /* Output: rom data pointer, if found */
+} FindRomCBData;
+
+static int find_rom_cb(Int128 start, Int128 len, const MemoryRegion *mr,
+                       hwaddr offset_in_region, void *opaque)
+{
+    FindRomCBData *cbdata = opaque;
+    hwaddr alias_addr;
+
+    if (mr != cbdata->mr) {
+        return 0;
+    }
+
+    alias_addr = int128_get64(start) + cbdata->xlat - offset_in_region;
+    cbdata->rom = rom_ptr(alias_addr, cbdata->size);
+    if (!cbdata->rom) {
+        return 0;
+    }
+    /* Found a match, stop iterating */
+    return 1;
+}
+
+static uint8_t *find_rom_for_addr(AddressSpace *as, hwaddr addr, size_t size)
+{
+    /*
+     * Find any ROM data for the given guest address range.  If there
+     * is a ROM blob then return a pointer to the host memory
+     * corresponding to 'addr'; otherwise return NULL.
+     *
+     * This is like rom_ptr(), except that it handles possible aliases
+     * within the CPU's address space, so that we still find a ROM
+     * blob even if it was loaded to an address that aliases addr
+     * rather than to addr itself.
+     */
+    FlatView *fv;
+    uint8_t *rom;
+    hwaddr len_unused;
+    FindRomCBData cbdata = {};
+
+    /* Easy case: there's data at the actual address */
+    rom = rom_ptr(addr, size);
+    if (rom) {
+        return rom;
+    }
+
+    RCU_READ_LOCK_GUARD();
+
+    fv = address_space_to_flatview(as);
+    cbdata.mr = flatview_translate(fv, addr, &cbdata.xlat, &len_unused,
+                                   false, MEMTXATTRS_UNSPECIFIED);
+    if (!cbdata.mr) {
+        /* Nothing at this address, so there can't be any aliasing */
+        return NULL;
+    }
+
+    cbdata.size = size;
+    flatview_for_each_range(fv, find_rom_cb, &cbdata);
+    return cbdata.rom;
+}
+#endif
+
 static void arm_cpu_reset(DeviceState *dev)
 {
     CPUState *s = CPU(dev);
@@ -331,7 +397,7 @@ static void arm_cpu_reset(DeviceState *dev)
 
         /* Load the initial SP and PC from offset 0 and 4 in the vector table */
         vecbase = env->v7m.vecbase[env->v7m.secure];
-        rom = rom_ptr(vecbase, 8);
+        rom = find_rom_for_addr(s->as, vecbase, 8);
         if (rom) {
             /* Address zero is covered by ROM which hasn't yet been
              * copied into physical memory.
-- 
2.20.1


