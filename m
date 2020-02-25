Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAF416C03D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:07:21 +0100 (CET)
Received: from localhost ([::1]:53742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Yzg-0001Ie-LB
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6YkY-0000g4-Tx
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:51:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6YkU-0006in-Rl
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:51:42 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50786)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6YkT-0006a2-6R
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 06:51:38 -0500
Received: by mail-wm1-x335.google.com with SMTP id a5so2684071wmb.0
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 03:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CTTFfm6kpk15IXed/dHp2uCDWcAZEmvsLW5IBEMbozs=;
 b=oxhaMgXru29GbqQujgW6IQOD3+QXW+dukIhrymvHCNd2OTXf0ouyMKHHkEiCN7xZnr
 tqCgMCVcO2wBJky5oj9728ctcPTKdaZalMjHeNIhbpzSb+q90JgaXrNx9ysXK4w7jQJa
 prhYKnz6CGaD63YpKefiKXk7U8HwI0G67ZcbU37TDlsjeLUXTO6c/SpEsdWqpqqFXV3j
 ab6V993z8hVHIDKQ/vL99DviNuMIxHmfOvJMFVBxJwSAw/mlW/zio/tvV11G9qelJ7E9
 /r5Ba/XVIbXInvi2mJkxdbTeqhB515j4+rA8LH5KUGCANp+dXcF2wh3lEV+f/GoPZcbN
 8mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CTTFfm6kpk15IXed/dHp2uCDWcAZEmvsLW5IBEMbozs=;
 b=JCyfxg/ZQm6Plzv9cUKxNsxgSlBVceL8Hxha0jZu+BzoxnhiW9yZBm0dD0n5fASkY1
 f/TMShf+z9euWI/fQlq/s8Z3cyrCSWtku6YqpAXgvLTqGo2CNkvZfDHeVWxzvmUbv+KQ
 Dc0OPZvJGMMsCE+K4afxfLrp1nL6JuM1Z9VH2dP09OBEFE9SL4ps3VeSTpHJbOZF1MpX
 ZE/kxVbW8XmQ7RYxwQuJwe78wy5bOfGysTAKk0dMSXb7dr2tKYY5WTXiUvi0EylNtLdF
 KJD539c8QXpzdLceRADpaFX3mIQu5dGk8A+Cf3Wuxs6cSSKF6Ypwzk77TG3HkAjeG0wP
 k5NA==
X-Gm-Message-State: APjAAAXxmTpsUFUix8W6ShJktgNIGqy0KMRlX5p5La5RzdmAnmCcuHUT
 rDoTx/jaDSzuTSREUv2TAnHKsOrx
X-Google-Smtp-Source: APXvYqx6Y9SAX1IS36+IDs2VWoWi/BxEY2JDYLrzRdKtmhntqswZyTyw/e/rAtoxg18BVM3Mwuzzug==
X-Received: by 2002:a05:600c:224a:: with SMTP id
 a10mr4955762wmm.143.1582631494113; 
 Tue, 25 Feb 2020 03:51:34 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b67sm3922326wmc.38.2020.02.25.03.51.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 03:51:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 029/136] arm/raspi: use memdev for RAM
Date: Tue, 25 Feb 2020 12:49:19 +0100
Message-Id: <1582631466-13880-29-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
    MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200219160953.13771-30-imammedo@redhat.com>
---
 hw/arm/raspi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 90ad9b8..acd2bb7 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -39,7 +39,6 @@ typedef struct RaspiMachineState {
     MachineState parent_obj;
     /*< public >*/
     BCM283XState soc;
-    MemoryRegion ram;
 } RaspiMachineState;
 
 typedef struct RaspiMachineClass {
@@ -277,16 +276,14 @@ static void raspi_machine_init(MachineState *machine)
         exit(1);
     }
 
-    /* Allocate and map RAM */
-    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
-                                         machine->ram_size);
     /* FIXME: Remove when we have custom CPU address space support */
-    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0);
+    memory_region_add_subregion_overlap(get_system_memory(), 0,
+                                        machine->ram, 0);
 
     /* Setup the SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
                             board_soc_type(board_rev), &error_abort, NULL);
-    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
+    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(machine->ram),
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
                             &error_abort);
@@ -324,6 +321,7 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
     mc->no_cdrom = 1;
     mc->default_cpus = mc->min_cpus = mc->max_cpus = cores_count(board_rev);
     mc->default_ram_size = board_ram_size(board_rev);
+    mc->default_ram_id = "ram";
     if (board_version(board_rev) == 2) {
         mc->ignore_memory_transaction_failures = true;
     }
-- 
1.8.3.1



