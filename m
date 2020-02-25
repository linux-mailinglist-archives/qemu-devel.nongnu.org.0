Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CBA16C0E6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:35:27 +0100 (CET)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6ZQs-0004EE-GU
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:35:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52491)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Z08-0003RG-Df
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Z07-0003Sp-BY
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:48 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41247)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6Z07-0003RE-42
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:47 -0500
Received: by mail-wr1-x433.google.com with SMTP id v4so1568155wrs.8
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 04:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JmVYAUKx6B4rcfz1Vmk6J2gsBKmOvTNh7f2tEhi9Rek=;
 b=FOXAv+hoW1Pd3+NWBe598EfNlATXYOAa1/rERLk4SEfQy9EsMGklE3YH1lVMzMikj1
 16rw0GjiTWvNsws4M+AvRP5sW8T7sOG3Mw8L3LNIfMGhaS9tZowSb1KF7f3tgFl1hixm
 80srAaJ+EGOnExjLMphtLhOGXlZOQgt8ivD9EN2rDUdu6a5lt7FNkR8PBvXUmx8rNq5U
 4OW28fKDp/JRwerw1TCLBjRusPT5iOs2TMwjb9h8tkfqzxP/iTD35dkbRw3jt4HHglGA
 ZJPaPZF+Hw2dsRXACOajrIFEhbPLKA7EMELTZhIxjMdHn+9JjGP0vU1ecFJsJoViZWN4
 LEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JmVYAUKx6B4rcfz1Vmk6J2gsBKmOvTNh7f2tEhi9Rek=;
 b=bEgx2wSizMwb6xft2r7i9rF1Zlwa/9V7BGhxaf0UM+R6ah922NAXvWldhe61QdV8Mu
 Rvt8/0ffVWv6OJJ85kvlI8uRGXQGbj5UScs94rhvb/bH9SFlz2D+gkp8DK0/fdFspqey
 zwXtNqgPs7vNodjhPM5A8vjlXLn+W150wXvjS1LSxwsoxqNuh9NoZjKouxHODRmL9knn
 LSJPUylIDagUFdH7kzpDEGyVUyxiM+c84i4DzJHLhbnYc9zhgNIlUYYjnpA6Z0RsBc/t
 4VLiYi611jCRULRT10DW6BQuCFxqmC8xT/1acN1uVrwloSYmsyfGiyL9CHS8wKWoUqeV
 HoFQ==
X-Gm-Message-State: APjAAAUxr9+x+XoV7ZB5bDh06z5Mk/odDZ3F/bPsY9kCxVR/WBisgwNQ
 tGdUUY91mAD6etTQStMBtN22lpQj
X-Google-Smtp-Source: APXvYqxCFrilPWDeAc1Pn+tAIpRQY1PWLo/xRDsczKzQX1sCEuxYmMRDOqEm6vTzVgi/tU38B9qXrw==
X-Received: by 2002:adf:ef4c:: with SMTP id c12mr74495277wrp.203.1582632463895; 
 Tue, 25 Feb 2020 04:07:43 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id h13sm22709423wrw.54.2020.02.25.04.07.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 04:07:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 110/136] hw/riscv: Use memory_region_init_rom() with read-only
 regions
Date: Tue, 25 Feb 2020 13:07:08 +0100
Message-Id: <1582632454-16491-8-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::433
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
Message-Id: <20200224205533.23798-13-philmd@redhat.com>
Supersedes: <20200221173049.18134-1-philmd@redhat.com>
---
 hw/riscv/sifive_e.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 8a6b034..6f6360a 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -208,9 +208,8 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
         memmap[SIFIVE_E_PWM2].base, memmap[SIFIVE_E_PWM2].size);
 
     /* Flash memory */
-    memory_region_init_ram(&s->xip_mem, NULL, "riscv.sifive.e.xip",
-        memmap[SIFIVE_E_XIP].size, &error_fatal);
-    memory_region_set_readonly(&s->xip_mem, true);
+    memory_region_init_rom(&s->xip_mem, NULL, "riscv.sifive.e.xip",
+                           memmap[SIFIVE_E_XIP].size, &error_fatal);
     memory_region_add_subregion(sys_mem, memmap[SIFIVE_E_XIP].base,
         &s->xip_mem);
 }
-- 
1.8.3.1



