Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26C140EEC1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 03:31:46 +0200 (CEST)
Received: from localhost ([::1]:58324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR2jB-0001R6-F1
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 21:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mR2gn-0008TO-Pr
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 21:29:17 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:60970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mR2gl-00025k-Ta
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 21:29:17 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8919220253;
 Fri, 17 Sep 2021 01:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631842152; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qgoBTTcrjNtVSqkcuQg2WhpvsXCzO7irXfv7JGSR9pQ=;
 b=q0ZY3UvGHC5S/30bgGJwwDJ/OBPDdVWtKAw/1TD76J8Hrw/CREeJJZOIHS7r984DI8HDBA
 pn7iftX9ZPU0fCiOt+7TYsdsNQUM3aZApnR+iBzyrir+ytTv2iyS1WtC2aKODebsYe/Gmj
 wivaBuq+Wk3LwIJcA1tTpfn6/6Y5j1k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631842152;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qgoBTTcrjNtVSqkcuQg2WhpvsXCzO7irXfv7JGSR9pQ=;
 b=2ZfbR2cvF1VRyE/K1Am6WmdEezKv6xSN104Im0iAW9jzt1bA8/rU0GQw7vE1A0KeQNN/E0
 wMFr36aXVxZw90AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0AFB713DEF;
 Fri, 17 Sep 2021 01:29:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EWQgL2bvQ2GsFgAAMHmgww
 (envelope-from <jziviani@suse.de>); Fri, 17 Sep 2021 01:29:10 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] modules: Improve modinfo.c architecture support
Date: Thu, 16 Sep 2021 22:29:02 -0300
Message-Id: <20210917012904.26544-1-jziviani@suse.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
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

When building a single target, the build system detects the architecture
and generates a modinfo.c with modules related to that arch only.
However, when more than one target is built, modinfo.c is generated with
modules available for each architecture - without any way to know what
arch supports what.

The problem is when executing the target, it will try to load modules
that is not supported by it and will throw errors to users, for
instance:

$ ./configure --enable-modules # all targets
$ ./qemu-system-avr -nodefaults -display none -accel tcg -M none -device help | head
Failed to open module: /.../hw-display-qxl.so: undefined symbol: vga_ioport_read
Failed to open module: /.../hw-display-virtio-gpu.so: undefined symbol: virtio_vmstate_info
Failed to open module: /.../hw-display-virtio-gpu.so: undefined symbol: virtio_vmstate_info
Failed to open module: /.../hw-display-virtio-gpu-gl.so: undefined symbol: virtio_gpu_ctrl_response
Failed to open module: /.../hw-display-virtio-gpu-pci.so: undefined symbol: virtio_instance_init_common
Failed to open module: /.../hw-display-virtio-gpu-pci.so: undefined symbol: virtio_instance_init_common
Failed to open module: /.../hw-display-virtio-gpu-pci-gl.so: undefined symbol: virtio_instance_init_common
Failed to open module: /.../hw-display-virtio-vga.so: undefined symbol: vmstate_vga_common
Failed to open module: /.../hw-display-virtio-vga.so: undefined symbol: vmstate_vga_common
Failed to open module: /.../hw-display-virtio-vga-gl.so: undefined symbol: have_vga
Failed to open module: /.../hw-usb-smartcard.so: undefined symbol: ccid_card_ccid_attach
Failed to open module: /.../hw-usb-redirect.so: undefined symbol: vmstate_usb_device
Failed to open module: /.../hw-usb-host.so: undefined symbol: vmstate_usb_device
...

$ ./qemu-system-s390x -nodefaults -display none -accel tcg -M none -device help | head 
Failed to open module: /.../hw-display-qxl.so: undefined symbol: vga_ioport_read
Failed to open module: /.../hw-display-virtio-vga.so: undefined symbol: vmstate_vga_common
Failed to open module: /.../hw-display-virtio-vga.so: undefined symbol: vmstate_vga_common
Failed to open module: /.../hw-display-virtio-vga-gl.so: undefined symbol: have_vga
Failed to open module: /.../hw-usb-smartcard.so: undefined symbol: ccid_card_ccid_attach
Failed to open module: /.../hw-usb-redirect.so: undefined symbol: vmstate_usb_device
Failed to open module: /.../hw-usb-host.so: undefined symbol: vmstate_usb_device

This patchset tries to improve by collecting the modules are currently
enabled for each target, obtaining information in meson from kconfig
and passing that to modinfo.c, which now uses a list to store supported
architectures for each module.

$ ./qemu-system-s390x -nodefaults -display none -accel tcg -M none -device help | head
Controller/Bridge/Hub devices:
name "pci-bridge", bus PCI, desc "Standard PCI Bridge"
name "pci-bridge-seat", bus PCI, desc "Standard PCI Bridge (multiseat)"
...

$ ./qemu-system-avr -nodefaults -display none -accel tcg -M none -device help | head
...
Misc devices:
name "guest-loader", desc "Guest Loader"
name "loader", desc "Generic Loader"

Jose R. Ziviani (2):
  meson: introduce modules_arch
  modules: use a list of supported arch for each module

 hw/display/meson.build      | 48 +++++++++++++++++++++++++++++++++++++
 hw/usb/meson.build          | 36 ++++++++++++++++++++++++++++
 include/qemu/module.h       |  2 +-
 meson.build                 | 19 +++++++++++----
 scripts/modinfo-collect.py  | 10 ++++++++
 scripts/modinfo-generate.py |  7 +++---
 util/module.c               | 18 ++++++++++----
 7 files changed, 125 insertions(+), 15 deletions(-)

-- 
2.33.0


