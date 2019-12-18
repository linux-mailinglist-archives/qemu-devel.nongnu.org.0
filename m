Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB6F12466E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:05:46 +0100 (CET)
Received: from localhost ([::1]:53160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihY5I-00088p-S5
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY2e-0005uk-Kf
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY2c-0007jv-V1
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:00 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53436)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY2c-0007hC-Hw
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:02:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id m24so1550921wmc.3
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gryOh3U23b2tAbBDpurdFE7ycHJ1ns2a5UODB6airmA=;
 b=gjPFCwmk0rHZowOIWWp8cZocVrP53gD0WQVEapC9qtK03Xt7eBbjSpIZhekZ0Lrpko
 qqRdC5j2x6XTlxX89HsOMofQ1LdoKp5JPuZEqoaSXGMbZkmZ4NUeSqyjSv+be5oeR1rR
 8N2B4KNjy0UIe0RZPPjcZ8Hsjtc8e6o78Lw2NtWYFayHUW0Z3JpAbXCD9EijCvNlHyjC
 ZQXA7rHqtDAublYKOSnmnElXVE1JU4qE8tQzX2e4BHqLg9Ihqkuq9rXsTDVKCb7I18DB
 WToOIs09itDaa4oUTr/U6ZOiSXt8YK2Fyvov99l0rYiq+FahCWUWIlz4MlM4tow4ObqO
 hcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=gryOh3U23b2tAbBDpurdFE7ycHJ1ns2a5UODB6airmA=;
 b=OjfCXN++nEScAfWUw85mXhxkIy/K0oghR9gLhXijdAKGsLisTIwZd0e78QJ2CWvedM
 XP0GnWP2Z6B3pwEnk84CH+UXrOG0IREoGFV+aMo1PdH4A/T/4iHs8Y/huic6APE56zlD
 xCNwLe5sirpyWjQ4jTK2RU8OkYXg9fwaAcgx6nL0mablsP8HbxA5um5ccQhozWRJOqpB
 KE3ciDE8B96e8vukD7TbjE1qP9r0SYL3/32rJwYEevOWlblOgVyuJEmiVkD9U2BtkQpS
 XLfPZfjcey8VRgB7AAjEGubEfUJVc/7BXxZIiXL1KytZe0xdYqJ6wjpMolecd1JJZVfS
 8SJg==
X-Gm-Message-State: APjAAAXQ/Cn+b6XbSoALXpEhZQvHCdHOpgXrAhKxUVryAyJqgiwlQ6ye
 kOBZecL9aQt2yOAlsLsOFxVs8AGZ
X-Google-Smtp-Source: APXvYqyFSz+4Gh4NQcw4rvLcSfQcUvKa7zoE5HSBcdzx99fxkPcJyi4aN434LxwukNobURRUEqomQw==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr2948665wmi.46.1576670576659;
 Wed, 18 Dec 2019 04:02:56 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.02.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:02:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/87] kvm: Reallocate dirty_bmap when we change a slot
Date: Wed, 18 Dec 2019 13:01:27 +0100
Message-Id: <1576670573-48048-2-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

kvm_set_phys_mem can be called to reallocate a slot by something the
guest does (e.g. writing to PAM and other chipset registers).
This can happen in the middle of a migration, and if we're unlucky
it can now happen between the split 'sync' and 'clear'; the clear
asserts if there's no bmap to clear.   Recreate the bmap whenever
we change the slot, keeping the clear path happy.

Typically this is triggered by the guest rebooting during a migrate.

Corresponds to:
https://bugzilla.redhat.com/show_bug.cgi?id=1772774
https://bugzilla.redhat.com/show_bug.cgi?id=1771032

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 accel/kvm/kvm-all.c | 44 +++++++++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ca00daa..7b9f92d 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -518,6 +518,27 @@ static int kvm_get_dirty_pages_log_range(MemoryRegionSection *section,
 
 #define ALIGN(x, y)  (((x)+(y)-1) & ~((y)-1))
 
+/* Allocate the dirty bitmap for a slot  */
+static void kvm_memslot_init_dirty_bitmap(KVMSlot *mem)
+{
+    /*
+     * XXX bad kernel interface alert
+     * For dirty bitmap, kernel allocates array of size aligned to
+     * bits-per-long.  But for case when the kernel is 64bits and
+     * the userspace is 32bits, userspace can't align to the same
+     * bits-per-long, since sizeof(long) is different between kernel
+     * and user space.  This way, userspace will provide buffer which
+     * may be 4 bytes less than the kernel will use, resulting in
+     * userspace memory corruption (which is not detectable by valgrind
+     * too, in most cases).
+     * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
+     * a hope that sizeof(long) won't become >8 any time soon.
+     */
+    hwaddr bitmap_size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
+                                        /*HOST_LONG_BITS*/ 64) / 8;
+    mem->dirty_bmap = g_malloc0(bitmap_size);
+}
+
 /**
  * kvm_physical_sync_dirty_bitmap - Sync dirty bitmap from kernel space
  *
@@ -550,23 +571,9 @@ static int kvm_physical_sync_dirty_bitmap(KVMMemoryListener *kml,
             goto out;
         }
 
-        /* XXX bad kernel interface alert
-         * For dirty bitmap, kernel allocates array of size aligned to
-         * bits-per-long.  But for case when the kernel is 64bits and
-         * the userspace is 32bits, userspace can't align to the same
-         * bits-per-long, since sizeof(long) is different between kernel
-         * and user space.  This way, userspace will provide buffer which
-         * may be 4 bytes less than the kernel will use, resulting in
-         * userspace memory corruption (which is not detectable by valgrind
-         * too, in most cases).
-         * So for now, let's align to 64 instead of HOST_LONG_BITS here, in
-         * a hope that sizeof(long) won't become >8 any time soon.
-         */
         if (!mem->dirty_bmap) {
-            hwaddr bitmap_size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
-                                        /*HOST_LONG_BITS*/ 64) / 8;
             /* Allocate on the first log_sync, once and for all */
-            mem->dirty_bmap = g_malloc0(bitmap_size);
+            kvm_memslot_init_dirty_bitmap(mem);
         }
 
         d.dirty_bitmap = mem->dirty_bmap;
@@ -1067,6 +1074,13 @@ static void kvm_set_phys_mem(KVMMemoryListener *kml,
         mem->ram = ram;
         mem->flags = kvm_mem_flags(mr);
 
+        if (mem->flags & KVM_MEM_LOG_DIRTY_PAGES) {
+            /*
+             * Reallocate the bmap; it means it doesn't disappear in
+             * middle of a migrate.
+             */
+            kvm_memslot_init_dirty_bitmap(mem);
+        }
         err = kvm_set_user_memory_region(kml, mem, true);
         if (err) {
             fprintf(stderr, "%s: error registering slot: %s\n", __func__,
-- 
1.8.3.1



