Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FBD2AF2F6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 15:03:35 +0100 (CET)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcqij-00052W-HG
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 09:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pushbx@ulukai.org>)
 id 1kcoMJ-000523-Mg; Wed, 11 Nov 2020 06:32:16 -0500
Received: from ulukai.org ([2a01:488:66:1000:b01c:1258:0:1]:51610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pushbx@ulukai.org>)
 id 1kcoMG-0002Mb-QR; Wed, 11 Nov 2020 06:32:15 -0500
Received: from [192.168.1.5]
 (dynamic-046-114-110-179.46.114.pool.telefonica.de [46.114.110.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by ulukai.org (Postfix) with ESMTPSA id 4CWMyM19Fxz2snQ;
 Wed, 11 Nov 2020 12:31:55 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.3 at ulukai.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ulukai.org; s=ulukai;
 t=1605094316; bh=jF9riMko6MmxregSBSkLP54s0n4PPwisV+FsItOXbP4=;
 h=From:Subject:To:Cc:Date:From;
 b=Kw0CJbJ7SH21bF5O/9Xqrlm66FHkUJGQkNL/hKFmErxqcsJjXmQ0R676BY6KIeZXO
 gYbFRZCNprFMScOgbJRaqGRjXcom/QZ4Gve72KiavPVl+Si2BJupfuqVgSW/KcWwN+
 9ogT8OQjYFolHBcBoajRutFMVBzu+wyg84UM2mgo=
From: "C. Masloch" <pushbx@ulukai.org>
Subject: [PATCH] multiboot: Fix, do not include kernel filename in Multiboot
 command line
To: qemu-devel@nongnu.org
Message-ID: <b3838d86-1422-aadc-7f77-3cf402009755@ulukai.org>
Date: Wed, 11 Nov 2020 12:31:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a01:488:66:1000:b01c:1258:0:1;
 envelope-from=pushbx@ulukai.org; helo=ulukai.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 06:31:57
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 Nov 2020 08:59:40 -0500
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "C. Masloch" <pushbx@ulukai.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Testing a Multiboot specification compatible kernel entrypoint I found
that qemu -kernel foo -append bar results in the Multiboot command line
being passed as "foo bar". Just -kernel foo results in "foo " (with
trailing blank). If the filename given to -kernel contains a blank, like
-kernel "quux foo" with -append bar then the command line contains that
blank, unquoted, like "quux foo bar".

GRUB2 only passes the command line content in the Multiboot command
line. For example, given the kernel command "multiboot /foo bar" GRUB2
only passes "bar" in the Multiboot command line. I consider GRUB2 to be
the authoritative example implementation as far as the Multiboot
specification is concerned.

Test case is as follows, using ldosboot [1], lmacros [2], scanptab [3],
and bootimg [4]:

ldosboot$ nasm -I ../lmacros/ testpl.asm -o testpl.bin -l testpl.lst &&
  nasm -I ../lmacros/ -I ./ -I ../scanptab/ -D_IMAGE_EXE
-D_IMAGE_EXE_AUTO_STACK -D_IMAGE_EXE_MIN_CALC=_IMAGE_EXE_AUTO_STACK
-D_IMAGE_EXE_MAX=0 -D_PAYLOAD_FILE='"testpl.bin"'
-D_INILOAD_SIGNATURE='"TP"' iniload.asm -o testpl.com -l testpli.lst &&
  nasm ../bootimg/bootimg.asm -D_MBR -o diskq.img -D_UNIT=80h
-D_PAYLOADFILE=::empty -I ../lmacros/ -l diskq.lst &&
  timeout --foreground 10 qemu-system-i386 -kernel testpl.com -curses
-hda diskq.img -append baz 2> /dev/null; stty sane

(The -hda disk image is needed because my kernel's iniload stage expects
to be booted off a valid FAT filesystem partition, and also qemu -kernel
passes ROM-BIOS unit 80h (first harddisk unit) partition 0 (first
primary partition) to the Multiboot specification entrypoint, even if no
hard disk is present at all.)

Relevant output line on broken qemu:

> Kernel command line = "testpl.com baz"

Expected output: (as seen when booted from GRUB2, or patched qemu)

> Kernel command line = "baz"

Signed-off-by: C. Masloch <pushbx@ulukai.org>

[1]: https://hg.ulukai.org/ecm/ldosboot
[2]: https://hg.ulukai.org/ecm/lmacros
[3]: https://hg.ulukai.org/ecm/scanptab
[4]: https://hg.ulukai.org/ecm/bootimg


diff --git a/hw/i386/multiboot.c b/hw/i386/multiboot.c
index 9e7d69d470..78b36902ff 100644
--- a/hw/i386/multiboot.c
+++ b/hw/i386/multiboot.c
@@ -288,8 +288,7 @@ int load_multiboot(FWCfgState *fw_cfg,
     mbs.offset_mbinfo = mbs.mb_buf_size;

     /* Calculate space for cmdlines, bootloader name, and mb_mods */
-    cmdline_len = strlen(kernel_filename) + 1;
-    cmdline_len += strlen(kernel_cmdline) + 1;
+    cmdline_len = strlen(kernel_cmdline) + 1;
     if (initrd_filename) {
         const char *r = initrd_filename;
         cmdline_len += strlen(initrd_filename) + 1;
@@ -360,10 +359,7 @@ int load_multiboot(FWCfgState *fw_cfg,
     }

     /* Commandline support */
-    char kcmdline[strlen(kernel_filename) + strlen(kernel_cmdline) + 2];
-    snprintf(kcmdline, sizeof(kcmdline), "%s %s",
-             kernel_filename, kernel_cmdline);
-    stl_p(bootinfo + MBI_CMDLINE, mb_add_cmdline(&mbs, kcmdline));
+    stl_p(bootinfo + MBI_CMDLINE, mb_add_cmdline(&mbs, kernel_cmdline));

     stl_p(bootinfo + MBI_BOOTLOADER, mb_add_bootloader(&mbs,
bootloader_name));

