Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A1B1F478
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 14:34:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQt74-0002W4-Qk
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 08:34:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1hQt4Z-00018T-IC
	for qemu-devel@nongnu.org; Wed, 15 May 2019 08:31:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1hQt4Y-0006E5-AX
	for qemu-devel@nongnu.org; Wed, 15 May 2019 08:31:51 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:39575
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1hQt4Y-0006C2-4m
	for qemu-devel@nongnu.org; Wed, 15 May 2019 08:31:50 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 5A41881397;
	Wed, 15 May 2019 14:31:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VkEEhX5bDde9; Wed, 15 May 2019 14:31:48 +0200 (CEST)
Received: from wifi-guest-96.act-europe.fr (wifi-guest-96.act-europe.fr
	[10.10.126.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 4211181391;
	Wed, 15 May 2019 14:31:48 +0200 (CEST)
From: KONRAD Frederic <frederic.konrad@adacore.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 May 2019 14:31:27 +0200
Message-Id: <1557923493-4836-2-git-send-email-frederic.konrad@adacore.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1557923493-4836-1-git-send-email-frederic.konrad@adacore.com>
References: <1557923493-4836-1-git-send-email-frederic.konrad@adacore.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Subject: [Qemu-devel] [PATCH v3 1/7] leon3: fix the error message when no
 bios are provided
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	chouteau@adacore.com, frederic.konrad@adacore.com,
	philmd@redhat.com, atar4qemu@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The leon3 board is looking for u-boot.bin by default (LEON3_PROM_FILENAME)..
But in the case this file is not found and no other file are given on the
command line we get the following error:

  $ ./qemu-system-sparc -M leon3_generic
  qemu-system-sparc: Can't read bios image (null)

So use LEON3_PROM_FILENAME instead of filename in case it is NULL to get a
less cryptic message:

  $ ./qemu-system-sparc -M leon3_generic
  qemu-system-sparc: Can't read bios image 'u-boot.bin'

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
---
 hw/sparc/leon3.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 0383b17..f438718 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -1,7 +1,7 @@
 /*
  * QEMU Leon3 System Emulator
  *
- * Copyright (c) 2010-2011 AdaCore
+ * Copyright (c) 2010-2019 AdaCore
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -43,7 +43,7 @@
 /* Default system clock.  */
 #define CPU_CLK (40 * 1000 * 1000)
 
-#define PROM_FILENAME        "u-boot.bin"
+#define LEON3_PROM_FILENAME "u-boot.bin"
 
 #define MAX_PILS 16
 
@@ -158,7 +158,7 @@ static void leon3_generic_hw_init(MachineState *machine)
 
     /* Load boot prom */
     if (bios_name == NULL) {
-        bios_name = PROM_FILENAME;
+        bios_name = LEON3_PROM_FILENAME;
     }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
 
@@ -180,7 +180,9 @@ static void leon3_generic_hw_init(MachineState *machine)
             exit(1);
         }
     } else if (kernel_filename == NULL && !qtest_enabled()) {
-        error_report("Can't read bios image %s", filename);
+        error_report("Can't read bios image '%s'", filename
+                                                   ? filename
+                                                   : LEON3_PROM_FILENAME);
         exit(1);
     }
     g_free(filename);
-- 
1.8.3.1


