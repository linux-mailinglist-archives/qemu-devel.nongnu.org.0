Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCEC53900E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 13:50:10 +0200 (CEST)
Received: from localhost ([::1]:35464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0O1-0003JG-C8
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 07:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1nw0LP-0000hk-6X; Tue, 31 May 2022 07:47:27 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1nw0LM-0007E7-CL; Tue, 31 May 2022 07:47:26 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4CBEA210E1;
 Tue, 31 May 2022 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653997642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mz9g4w2bBPvQLSWxmvn1i4Zt/DeX8fagIS5HruqoZuU=;
 b=UD900wM6/4ncA8JL2wQRI5cXjlcuhMKRSMhc0tfAia472pzOEfMoizeDU5wxhnBdvBTK/e
 a90hNTgq6lYsEaCgXPqqMLtJpO4dCr4UArIlOgg9YYl8/JLm2jL3cWGtSdkuAUx8PgGr3m
 7rJPGUV670KbF1KEaf9reW+ubLo1Dj0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653997642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mz9g4w2bBPvQLSWxmvn1i4Zt/DeX8fagIS5HruqoZuU=;
 b=Qbk9IB75Bmvr035CPcBHGP/1BKf/4/0vbZ7VbTwn/OOjkQJoEd0R7R7GQ8bLD0FBGtJ6k2
 acO973MjOQ0e10Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E96AB132F9;
 Tue, 31 May 2022 11:47:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id omdUN0kAlmJ8WQAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 31 May 2022 11:47:21 +0000
From: Claudio Fontana <cfontana@suse.de>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?q?Martin=20Li=C5=A1ka?= <martin.liska@suse.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Dario Faggioli <DarioFaggiolidfaggioli@suse.com>, qemu-stable@nongnu.org
Subject: [PATCH] pci: fix overflow in snprintf string formatting
Date: Tue, 31 May 2022 13:47:07 +0200
Message-Id: <20220531114707.18830-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the code in pcibus_get_fw_dev_path contained the potential for a
stack buffer overflow of 1 byte, potentially writing to the stack an
extra NUL byte.

This overflow could happen if the PCI slot is >= 0x10000000,
and the PCI function is >= 0x10000000, due to the size parameter
of snprintf being incorrectly calculated in the call:

    if (PCI_FUNC(d->devfn))
        snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn));

since the off obtained from a previous call to snprintf is added
instead of subtracted from the total available size of the buffer.

Without the accurate size guard from snprintf, we end up writing in the
worst case:

name (32) + "@" (1) + SLOT (8) + "," (1) + FUNC (8) + term NUL (1) = 51 bytes

In order to provide something more robust, replace all of the code in
pcibus_get_fw_dev_path with a single call to g_strdup_printf,
so there is no need to rely on manual calculations.

Found by compiling QEMU with FORTIFY_SOURCE=3 as the error:

*** buffer overflow detected ***: terminated

Thread 1 "qemu-system-x86" received signal SIGABRT, Aborted.
[Switching to Thread 0x7ffff642c380 (LWP 121307)]
0x00007ffff71ff55c in __pthread_kill_implementation () from /lib64/libc.so.6
(gdb) bt
 #0  0x00007ffff71ff55c in __pthread_kill_implementation () at /lib64/libc.so.6
 #1  0x00007ffff71ac6f6 in raise () at /lib64/libc.so.6
 #2  0x00007ffff7195814 in abort () at /lib64/libc.so.6
 #3  0x00007ffff71f279e in __libc_message () at /lib64/libc.so.6
 #4  0x00007ffff729767a in __fortify_fail () at /lib64/libc.so.6
 #5  0x00007ffff7295c36 in  () at /lib64/libc.so.6
 #6  0x00007ffff72957f5 in __snprintf_chk () at /lib64/libc.so.6
 #7  0x0000555555b1c1fd in pcibus_get_fw_dev_path ()
 #8  0x0000555555f2bde4 in qdev_get_fw_dev_path_helper.constprop ()
 #9  0x0000555555f2bd86 in qdev_get_fw_dev_path_helper.constprop ()
 #10 0x00005555559a6e5d in get_boot_device_path ()
 #11 0x00005555559a712c in get_boot_devices_list ()
 #12 0x0000555555b1a3d0 in fw_cfg_machine_reset ()
 #13 0x0000555555bf4c2d in pc_machine_reset ()
 #14 0x0000555555c66988 in qemu_system_reset ()
 #15 0x0000555555a6dff6 in qdev_machine_creation_done ()
 #16 0x0000555555c79186 in qmp_x_exit_preconfig.part ()
 #17 0x0000555555c7b459 in qemu_init ()
 #18 0x0000555555960a29 in main ()

Found-by: Dario Faggioli <Dario Faggioli <dfaggioli@suse.com>
Found-by: Martin Liška <martin.liska@suse.com>
Cc: qemu-stable@nongnu.org
Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 hw/pci/pci.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a9b37f8000..6e7015329c 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2640,15 +2640,15 @@ static char *pci_dev_fw_name(DeviceState *dev, char *buf, int len)
 static char *pcibus_get_fw_dev_path(DeviceState *dev)
 {
     PCIDevice *d = (PCIDevice *)dev;
-    char path[50], name[33];
-    int off;
-
-    off = snprintf(path, sizeof(path), "%s@%x",
-                   pci_dev_fw_name(dev, name, sizeof name),
-                   PCI_SLOT(d->devfn));
-    if (PCI_FUNC(d->devfn))
-        snprintf(path + off, sizeof(path) + off, ",%x", PCI_FUNC(d->devfn));
-    return g_strdup(path);
+    char name[33];
+    int has_func = !!PCI_FUNC(d->devfn);
+
+    return g_strdup_printf("%s@%x%s%.*x",
+                           pci_dev_fw_name(dev, name, sizeof(name)),
+                           PCI_SLOT(d->devfn),
+                           has_func ? "," : "",
+                           has_func,
+                           PCI_FUNC(d->devfn));
 }
 
 static char *pcibus_get_dev_path(DeviceState *dev)
-- 
2.26.2


