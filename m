Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 287DF16C174
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 13:55:15 +0100 (CET)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6Zk2-0001hr-5W
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 07:55:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52490)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Z08-0003RB-CH
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1j6Z07-0003Su-CO
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:48 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38101)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1j6Z07-0003S0-5k
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 07:07:47 -0500
Received: by mail-wr1-x42d.google.com with SMTP id e8so14440703wrm.5
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 04:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OifddG7eBEwuqFmuHehG7p0OX65v47ZqzFjv51Ba2gI=;
 b=dsgxcJ1gT8on91f3jXNLVYVDzpvnOHek7S2i67C5NeX4HKQ7CNcfFiSUrPPow1BtEW
 5BPehJFvU6Qp2jbkTHOzwjuC40i3+GvSh0q6OGNS9KwAkA6f2sBgaQVQ/LkVrRuKd//P
 lP97BG+f0yUi54fbEzWH0idPDM1uHWAizrTpUvSVF8cDpOaXZKjOb8lxyGMdgseJTD+i
 j8BucknuILZnMZYqb3q7aDSYM/pNHt+YRksxMz8gN9Sfcq0WUG6W1EEX7lKqV6mb+czf
 t7Z+ElzHpVqjVXWSD4s1lK/R5NvzREsezBP85wT6n4jE8YqPc2u+oPT5zQYncj07dvJo
 kx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OifddG7eBEwuqFmuHehG7p0OX65v47ZqzFjv51Ba2gI=;
 b=POwLICEr2l5fJuMHUn6UwnWEGht7j+FBYVLk8O678PvrsNktemGg6U6z3YIDso+e0d
 ATXCAetItku/OJjGhPJjvCSaPxIvIgGYr6ChCjk7H37pzx0lD08+FSz6g+Ki2bFdEsLy
 CyXCefd10+jm1AFdAbZEypknGuGa303iBMGurlvp/3vQNSHYs5ragb7InBJ4BNfTk2PS
 hBIk67fs52fKvY+l1NalTxv86gTW3L05FzbbRDIjfW4pB76TCtS9wF2PY1Dp3P2ePRzN
 hGrkvkQuK7zeby20FNOSjq53Hu3Mr45MmB6IdK6CWZtOaK4H7VSu8hDf1LBGBQcnnxEi
 A4EQ==
X-Gm-Message-State: APjAAAWwR8Zpv9aw4DKQn3rhjsQcvz2JsbUUP93dUnqJZL+sYM2qLyD0
 W4bKtchn05UmN3QTwohctyBBG96n
X-Google-Smtp-Source: APXvYqw63lfHfAxKO1ZfsrxqcjgpRbQnGOpe0h8OrWRoMc5EobIrutvCBaF/ZnDYkD4tjU9C+6UKWQ==
X-Received: by 2002:adf:fe83:: with SMTP id l3mr76152236wrr.41.1582632465662; 
 Tue, 25 Feb 2020 04:07:45 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id h13sm22709423wrw.54.2020.02.25.04.07.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 04:07:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 112/136] hw/sparc: Use memory_region_init_rom() with read-only
 regions
Date: Tue, 25 Feb 2020 13:07:10 +0100
Message-Id: <1582632454-16491-10-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
References: <1582631466-13880-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42d
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
Message-Id: <20200224205533.23798-15-philmd@redhat.com>
Supersedes: <20200221173049.18134-1-philmd@redhat.com>
---
 hw/sparc/leon3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index f5a087d..23d0bdb 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -256,8 +256,7 @@ static void leon3_generic_hw_init(MachineState *machine)
 
     /* Allocate BIOS */
     prom_size = 8 * MiB;
-    memory_region_init_ram(prom, NULL, "Leon3.bios", prom_size, &error_fatal);
-    memory_region_set_readonly(prom, true);
+    memory_region_init_rom(prom, NULL, "Leon3.bios", prom_size, &error_fatal);
     memory_region_add_subregion(address_space_mem, LEON3_PROM_OFFSET, prom);
 
     /* Load boot prom */
-- 
1.8.3.1



