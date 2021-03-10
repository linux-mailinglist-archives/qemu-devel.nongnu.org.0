Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB63347E2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:27:34 +0100 (CET)
Received: from localhost ([::1]:47356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4UW-0007Pp-Nv
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lK4GT-0008Km-OS
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:13:01 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:47006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lK4GS-0006gT-AN
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:13:01 -0500
Received: by mail-ej1-x62b.google.com with SMTP id r17so40919933ejy.13
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8YiJ2neG3C2eurlt7FCzlWjjXO1BnbncEh6iKeWogo=;
 b=s0B5/OLS5QrGIZ7a4P0/HIjDaQc96IFkmHHXjx+3C72Wf3bMsr6GGXit+aEFj5la3g
 1doi7ofWALzsYz2+al9sGhDNUDwURyOx7rHlDwAKFOgYBEb0wWs+aHCGz1b/jZBwhBr+
 fyj/cH67hzw9mrdcUTMqs0yFrbbmujXpP28CPPPbhmH1wf0y0mI5XBLno5Ka1VhJqq3M
 MjtM2uIMrkfBieQFLJUS9ZW+9GCXKzx89nJ/KNrCyLxqSyC0t9pU1a9uE2M+LA+34plq
 z4AGeo3LV20HIRk7Q/vScYqsnpfh8S/nHPy5C8RZDfLM4JwVUXq3Cr6tZF0atzaQWvdT
 xMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o8YiJ2neG3C2eurlt7FCzlWjjXO1BnbncEh6iKeWogo=;
 b=UkgrqWJnJLBuX6kXJXmYvi8u2v4BivpaEFlHbp6u7E/GNFgJBpXNtbMAuMiOG0veFP
 RBG0057UKy1MVczivO+Uzwa1pgloCSrvfcEDq1DOyK6ygoEBCB+QBq2rHCz6hLBvrTjm
 Lj/1e9GH3aW5ZzIKDgfCo9wzCm0UYvuf33/DFPNfwO3H+KhQVlwD3FF+5mMIcLJUYh11
 KZ6f0nwakG5o/j0/h1GR66OhSX55zGteSrwkGMPwCo5B2FXiKp+/Sd0mYi9bhSAEG8PP
 47de8/efe7ja/t+hV8xXN90l1NX62C9fTn9TPGlUcf2bbN2xM+eBidqU8oF/4qBVZL/I
 01VA==
X-Gm-Message-State: AOAM5323JXtsLMndNDP7rVxnnp7CE+mvs1OQGw+CZV3IhhBcAT6JqHrQ
 TiKG6OdzxPQNVJkzBPgIwMc=
X-Google-Smtp-Source: ABdhPJz+opACfuBS5o8lofz3ryfQOyuqqanOPSD8jb1uSv9lKp3RvOnnwP4xLs4fAffazIGmuvynZA==
X-Received: by 2002:a17:906:8614:: with SMTP id
 o20mr5063036ejx.386.1615403578555; 
 Wed, 10 Mar 2021 11:12:58 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x17sm182629ejd.68.2021.03.10.11.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:12:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Xu <peterx@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/mips/jazz: Use generic I/O bus via get_system_io()
Date: Wed, 10 Mar 2021 20:12:54 +0100
Message-Id: <20210310191255.1229848-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
References: <f776956e-dd3b-98f8-4b99-0cd234d227c0@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need to create a local ISA I/O MemoryRegion, use get_system_io().

This partly reverts commit 5c63bcf7501527b844f61624957bdba254d75bfc.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/jazz.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 1a0888a0fd5..9ac9361b7eb 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -158,7 +158,6 @@ static void mips_jazz_init(MachineState *machine,
     rc4030_dma *dmas;
     IOMMUMemoryRegion *rc4030_dma_mr;
     MemoryRegion *isa_mem = g_new(MemoryRegion, 1);
-    MemoryRegion *isa_io = g_new(MemoryRegion, 1);
     MemoryRegion *rtc = g_new(MemoryRegion, 1);
     MemoryRegion *i8042 = g_new(MemoryRegion, 1);
     MemoryRegion *dma_dummy = g_new(MemoryRegion, 1);
@@ -259,11 +258,10 @@ static void mips_jazz_init(MachineState *machine,
     memory_region_add_subregion(address_space, 0x8000d000, dma_dummy);
 
     /* ISA bus: IO space at 0x90000000, mem space at 0x91000000 */
-    memory_region_init(isa_io, NULL, "isa-io", 0x00010000);
     memory_region_init(isa_mem, NULL, "isa-mem", 0x01000000);
-    memory_region_add_subregion(address_space, 0x90000000, isa_io);
+    memory_region_add_subregion(address_space, 0x90000000, get_system_io());
     memory_region_add_subregion(address_space, 0x91000000, isa_mem);
-    isa_bus = isa_bus_new(NULL, isa_mem, isa_io, &error_abort);
+    isa_bus = isa_bus_new(NULL, isa_mem, get_system_io(), &error_abort);
 
     /* ISA devices */
     i8259 = i8259_init(isa_bus, env->irq[4]);
-- 
2.26.2


