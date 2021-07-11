Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E053C3F6C
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:11:44 +0200 (CEST)
Received: from localhost ([::1]:33518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gjn-0006lM-Co
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gaQ-00007H-Sc
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:02:02 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gaP-0001U9-1U
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:02:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d2so22138849wrn.0
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NUim6++IcBw63PEyeXm1vZaOJYvHSUOphgJ+u9sIrvs=;
 b=AN10hoUhbQ+nGxO47AmEXXBSUIpnRIZY1wlL827imYlJeGihHvX4d7IGfXi3do4K11
 tM2BNDHk+a8lS/xunRgt8I3ZRjIzwdsjuu55R+0vqyY18IouDdLueM9TOQkZhNAbcTi1
 d3fNqPbn9S4gcAngYE2qcRiIbgAlgxNtqVMWp3HrucTtLkHjEanLdJh2eRUK7/eAEykR
 GA2KvoAvc6yzrHVHCJj7kryxVbrGBs+oABISWWdxTxj9xKqFV96TUCqy5SooxfRr8Rbp
 GdWLs76Do/vZQxEILEla7OqocmFbl/QHCz5CBxwjx5CNqor8ss1GJhID6vvqUvZlwqpK
 EDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NUim6++IcBw63PEyeXm1vZaOJYvHSUOphgJ+u9sIrvs=;
 b=jZ4CCoe0SWttABAjrm/T/mLkG18RWTrP3KnZQsuHUehH1OvSEWAj6+KLK/FiyEtWHE
 MyEwtCHajBCYWycfGt9k91omuysMaavbJn4SmuDZdhosS88i87kErVzoJZI8DLO3sV3Q
 Xr6XmdMc2wZQmvF9lLpHAprDuoJNz2+eyp9Nc8MvmrJD0yu4sqzJKJRJdw3P4LzkQBKZ
 BF5yvcf+se1TfdDkmtNeWpeYzUdz94VVPWmDiyQwnRYUgCrb3dZ1gpU5cYHnD22t8b7I
 WaXaExk4xS+oRfXgDKl3RP+ap+giIVkhpeGVph465YkTl/IekTlQLam+VTz707GG0/bH
 ebUQ==
X-Gm-Message-State: AOAM531Y2C1h45SMp5mDmXM+aUc6WsCC3dqyM5aE+TRBBwFsuXst7GuA
 +cdKd5zCthHaDLZMEmuiTz3/ZGTZthSUFhIU
X-Google-Smtp-Source: ABdhPJyCUeTW2kiS82n5wDJg+ycjZfLVp+rJQLSWDWZF7PWTqtR6m0HjNfy1wu73WpHM6I/0mOn/pQ==
X-Received: by 2002:a5d:48c6:: with SMTP id p6mr54785837wrs.45.1626037319630; 
 Sun, 11 Jul 2021 14:01:59 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id u16sm14600468wrw.36.2021.07.11.14.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/19] dp8393x: don't force 32-bit register access
Date: Sun, 11 Jul 2021 23:00:16 +0200
Message-Id: <20210711210016.2710100-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Commit 3fe9a838ec "dp8393x: Always use 32-bit accesses" set .impl.min_access_size
and .impl.max_access_size to 4 to try and fix the Linux jazzsonic driver which uses
32-bit accesses.

The problem with forcing the register access to 32-bit in this way is that since the
dp8393x uses 16-bit registers, a manual endian swap is required for devices on big
endian machines with 32-bit accesses.

For both access sizes and machine endians the QEMU memory API can do the right thing
automatically: all that is needed is to set .impl.min_access_size to 2 to declare that
the dp8393x implements 16-bit registers.

Normally .impl.max_access_size should also be set to 2, however that doesn't quite
work in this case since the register stride is specified using a (dynamic) it_shift
property which is applied during the MMIO access itself. The effect of this is that
for a 32-bit access the memory API performs 2 x 16-bit accesses, but the use of
it_shift within the MMIO access itself causes the register value to be repeated in both
the top 16-bits and bottom 16-bits. The Linux jazzsonic driver expects the stride to be
zero-extended up to access size and therefore fails to correctly detect the dp8393x
device due to the extra data in the top 16-bits.

The solution here is to remove .impl.max_access_size so that the memory API will
correctly zero-extend the 16-bit registers to the access size up to and including
it_shift. Since it_shift is never greater than 2 than this will always do the right
thing for both 16-bit and 32-bit accesses regardless of the machine endian, allowing
the manual endian swap code to be removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 3fe9a838ec ("dp8393x: Always use 32-bit accesses")
Message-Id: <20210705214929.17222-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Finn Thain <fthain@linux-m68k.org>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/net/dp8393x.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 4057a263de3..45b954e46c2 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -588,15 +588,14 @@ static uint64_t dp8393x_read(void *opaque, hwaddr addr, unsigned int size)
 
     trace_dp8393x_read(reg, reg_names[reg], val, size);
 
-    return s->big_endian ? val << 16 : val;
+    return val;
 }
 
-static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
+static void dp8393x_write(void *opaque, hwaddr addr, uint64_t val,
                           unsigned int size)
 {
     dp8393xState *s = opaque;
     int reg = addr >> s->it_shift;
-    uint32_t val = s->big_endian ? data >> 16 : data;
 
     trace_dp8393x_write(reg, reg_names[reg], val, size);
 
@@ -677,11 +676,16 @@ static void dp8393x_write(void *opaque, hwaddr addr, uint64_t data,
     }
 }
 
+/*
+ * Since .impl.max_access_size is effectively controlled by the it_shift
+ * property, leave it unspecified for now to allow the memory API to
+ * correctly zero extend the 16-bit register values to the access size up to and
+ * including it_shift.
+ */
 static const MemoryRegionOps dp8393x_ops = {
     .read = dp8393x_read,
     .write = dp8393x_write,
-    .impl.min_access_size = 4,
-    .impl.max_access_size = 4,
+    .impl.min_access_size = 2,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-- 
2.31.1


