Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D716C13A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:49:22 +0100 (CET)
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ZeL-00083P-8e
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Z02-0003Ko-Gb
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Z01-0003Pi-GO
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:42 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44963)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6Z01-0003PD-A2
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:41 -0500
Received: by mail-wr1-x432.google.com with SMTP id m16so14393964wrx.11
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 04:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Z/yNtPxigyaL8YUlyqEJe5pD5b0faME2lrPsUwrRk4=;
 b=NR+2lnAlHnwLhEQhDEiPM1ULw8LYIiZWe2DEER8cx2lrbajx7VSfhV5GSslhffpl84
 s1yIXPJJK/mDA4RGF0W56bdvew1xF/fUxy+uBMLEPXoXXHNw+6QyQYQ3c9yy9guvNeq8
 QJss8MrEVk3Mjh5HCtJDa/DdMhhFT5LaCVI9m7AyBYWmonV0t1YJwK0112E37ngb0oyl
 eJ4CfMTE2PYsXVMgRDYAvapwsaFxNg5bwI8gzMByn1e299CeaN7XVbdqR0SdQPDf1f1y
 yl3XCfG45aFMigAMMHOjX4jA7wSzniOlx3uI/7NC+IGti2/6QPu5KXu38F34EENEHXK+
 VKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4Z/yNtPxigyaL8YUlyqEJe5pD5b0faME2lrPsUwrRk4=;
 b=VTfbNy/c4BLqGmKhrtsDMcXPUaMbV6fl5Gw6NZj2XsplWjmSsYXjvU/8X+tDzm9KYo
 JOy7JtChqdnpWktTYs7oEaeYtuCLydgYagKG67WojR6koAuEknuaPLbllku7f9Wnc2UK
 Tldym8ZODCmzf54W2Cn3WOFnPqAKNqd8mWnOpTejTpzGcoeRagMRXOgkzUPMrslgrG+O
 x7TIMbTPZPzQPaEfGHC1FuIrv7LsH8L/FvyIinZs796YMUWxCVW12W+E9ZxM6HjeemaS
 c7vhakda9SzfYFrRElQXDD84pfA5z3s/jFU2VUGfK7NShV7Gn6Mxq1m87vwP4x23vxX+
 gEoQ==
X-Gm-Message-State: APjAAAWmQsWsr5BOxknh38iIn06BEo++VTnuZtFT0ntc/xY58kMZYGaw
 vOeVxzE/kP54IK5oslUjAFnYqnMc
X-Google-Smtp-Source: APXvYqwPoLtsG8KjWDJSVnKHRM0rlDisKHgHUbNmmgSN5kmQ64aPtL04YC4+hj+wYkb8rRNYrjZlEA==
X-Received: by 2002:a5d:4f01:: with SMTP id c1mr22068183wru.384.1582632460117; 
 Tue, 25 Feb 2020 04:07:40 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id h13sm22709423wrw.54.2020.02.25.04.07.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 04:07:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 106/136] hw/m68k: Use memory_region_init_rom() with read-only
 regions
Date: Tue, 25 Feb 2020 13:07:04 +0100
Message-Id: <1582632454-16491-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This commit was produced with the Coccinelle script
scripts/coccinelle/memory-region-housekeeping.cocci.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200224205533.23798-9-philmd@redhat.com>
Supersedes: <20200221173049.18134-1-philmd@redhat.com>
---
 hw/m68k/q800.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1e32363..8083326 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -402,13 +402,12 @@ static void q800_init(MachineState *machine)
         uint8_t *ptr;
         /* allocate and load BIOS */
         rom = g_malloc(sizeof(*rom));
-        memory_region_init_ram(rom, NULL, "m68k_mac.rom", MACROM_SIZE,
+        memory_region_init_rom(rom, NULL, "m68k_mac.rom", MACROM_SIZE,
                                &error_abort);
         if (bios_name == NULL) {
             bios_name = MACROM_FILENAME;
         }
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-        memory_region_set_readonly(rom, true);
         memory_region_add_subregion(get_system_memory(), MACROM_ADDR, rom);
 
         /* Load MacROM binary */
-- 
1.8.3.1



