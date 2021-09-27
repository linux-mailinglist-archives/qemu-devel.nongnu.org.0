Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA341961D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:19:39 +0200 (CEST)
Received: from localhost ([::1]:52676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrTm-0004KT-5u
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mUrMn-0003Uk-0w
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:12:25 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mUrMd-0005iD-Sp
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:12:24 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E4AD22142;
 Mon, 27 Sep 2021 14:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632751931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lg4W8BkcEmPnQTDfAPiydE+ZxIRBgqPGoyf3/PNOkNY=;
 b=O61xyA/Og8Cs6vrBLA6FFRMA7FTPcBKpYBtdV9/gMp18moBmm8+ODEk66pnUpjkT9CqjkB
 l0s2fF3akOE7lmbupkO3hj2VJVG71e4e075pVsUypMv5PFj6fyKeZaTb0r0/MLzALLq1vf
 pZGbZTHpYlXWZN6oHRZmaFIl4P2DEPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632751931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lg4W8BkcEmPnQTDfAPiydE+ZxIRBgqPGoyf3/PNOkNY=;
 b=9WFNyJ/v0xDHEdO1jkD3Egveqv3Bq5TYfqQea5dD7R12kp6uPF7BWSVHZ77rHKJu0pDjPz
 dFoRSGY/Cl6ZqICA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2D9113A91;
 Mon, 27 Sep 2021 14:12:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b7QRKTnRUWH+LwAAMHmgww
 (envelope-from <jziviani@suse.de>); Mon, 27 Sep 2021 14:12:09 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] modules: Improve modinfo.c support
Date: Mon, 27 Sep 2021 11:11:58 -0300
Message-Id: <20210927141201.21833-1-jziviani@suse.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, kraxel@redhat.com,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset introduces the modinfo_need and changes
modinfo-generate.py/meson.build to generate/link one modinfo per target.

modinfo-generate.py will know, thanks to modinfo_need, which modules are
currently enabled for a given target before adding it in the array of
modules. It will give a hint about why some modules failed, so
developers can have a clue about it:

},{
    /* hw-display-qxl.modinfo */
    /* module  QXL is missing. */

    /* hw-display-virtio-gpu.modinfo */
    .name = "hw-display-virtio-gpu",
    .objs = ((const char*[]){  "virtio-gpu-base",  "virtio-gpu-device",  "vhost-user-gpu", NULL }),
},{

The main reason of this change is to fix problems like:
$ ./qemu-system-s390x -nodefaults -display none -accel tcg -M none -device help | head
Failed to open module: /.../hw-display-qxl.so: undefined symbol: vga_ioport_read
Failed to open module: /.../hw-display-virtio-vga.so: undefined symbol: vmstate_vga_common
Failed to open module: /.../hw-display-virtio-vga.so: undefined symbol: vmstate_vga_common
Failed to open module: /.../hw-display-virtio-vga-gl.so: undefined symbol: have_vga
Failed to open module: /.../hw-usb-smartcard.so: undefined symbol: ccid_card_ccid_attach
Failed to open module: /.../hw-usb-redirect.so: undefined symbol: vmstate_usb_device
Failed to open module: /.../hw-usb-host.so: undefined symbol: vmstate_usb_device

With this patch, I run this small script successfuly:
#!/bin/bash
    pushd ~/suse/virtualization/qemu/build
    for qemu in qemu-system-*
    do
        [[ -f "$qemu" ]] || continue
        res=$(./$qemu -nodefaults -display none -accel tcg -M none -device help 2>&1 | grep "Failed to" > /dev/null; echo $?)
        [[ $res -eq 0 ]] && echo "Error: $qemu"
    done
    popd

Also run make check and check-acceptance without any failures.

Todo:
 - accelerators can be filtered as well (this only covers the device
   part), then the field QemuModinfo.arch can be removed.

v1 -> v2:
 - Changed the approach to this problem after suggestions made by Paolo and Gerd.

Thank you!

Jose R. Ziviani (2):
  modules: introduces module_needs directive
  modules: generates per-target modinfo

 hw/display/qxl.c                |  1 +
 hw/display/vhost-user-gpu-pci.c |  1 +
 hw/display/vhost-user-gpu.c     |  1 +
 hw/display/vhost-user-vga.c     |  1 +
 hw/display/virtio-gpu-base.c    |  1 +
 hw/display/virtio-gpu-gl.c      |  1 +
 hw/display/virtio-gpu-pci-gl.c  |  1 +
 hw/display/virtio-gpu-pci.c     |  1 +
 hw/display/virtio-gpu.c         |  1 +
 hw/display/virtio-vga-gl.c      |  1 +
 hw/display/virtio-vga.c         |  1 +
 hw/s390x/virtio-ccw-gpu.c       |  1 +
 hw/usb/ccid-card-emulated.c     |  1 +
 hw/usb/ccid-card-passthru.c     |  1 +
 hw/usb/host-libusb.c            |  1 +
 hw/usb/redirect.c               |  1 +
 include/qemu/module.h           | 10 +++++++++
 meson.build                     | 25 ++++++++++++++-------
 scripts/modinfo-generate.py     | 40 ++++++++++++++++++++-------------
 19 files changed, 67 insertions(+), 24 deletions(-)

-- 
2.33.0


