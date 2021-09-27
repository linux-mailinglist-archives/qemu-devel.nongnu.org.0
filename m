Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4F5419609
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 16:14:49 +0200 (CEST)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUrP6-0005tS-KF
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 10:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mUrMl-0003RS-U1
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:12:23 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mUrMe-0005j2-31
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 10:12:23 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A7E422144;
 Mon, 27 Sep 2021 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632751933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lg4W8BkcEmPnQTDfAPiydE+ZxIRBgqPGoyf3/PNOkNY=;
 b=oN+Us1MwEDUU3eYThJHt6nupX3WiG4P2693F5/OcoqgIuAC+D3446jH4r9IZh+QxFhQCJn
 wyazRppN8jW1gAxPOvSMHzfPwdNq9vtqWbWIOtNTPaEHThUCPBIwwVo7m5eLGvnu1C0Mo7
 Ef2fkH9U2jCfR0v5+gxFEnmYsrDsmg8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632751933;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lg4W8BkcEmPnQTDfAPiydE+ZxIRBgqPGoyf3/PNOkNY=;
 b=OEOKIjzG1t1CpOkZwXKgfGyEgD1Dy8v0W/fpBWPFRU0zPd1Um15EcbMhwv7ZhxPETFk7Fn
 kfOwQVRo+HVbuIBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF22F13A91;
 Mon, 27 Sep 2021 14:12:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CBRWJDvRUWH+LwAAMHmgww
 (envelope-from <jziviani@suse.de>); Mon, 27 Sep 2021 14:12:11 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] modules: Improve modinfo.c support
Date: Mon, 27 Sep 2021 11:11:59 -0300
Message-Id: <20210927141201.21833-2-jziviani@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927141201.21833-1-jziviani@suse.de>
References: <20210927141201.21833-1-jziviani@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


