Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336B141B89A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 22:48:31 +0200 (CEST)
Received: from localhost ([::1]:58228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVK1d-0000vU-Qe
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 16:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mVJzr-00082W-D3
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 16:46:40 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mVJzp-0006eg-OM
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 16:46:39 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 55DA8224D2;
 Tue, 28 Sep 2021 20:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632861994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9J1pVKau3Gx0ydd+0muNpSHWMi7P0ddoooGf8vYhM5U=;
 b=DRGHcO060Xnr1G3QqZjO4hAWILPS2d+pUygAzVaJm9eWfwsGX0Q2uUyIrFq9JBNLie6ML6
 EYIREjvY4xAwcT/xm7qAOk5YyFNEaOccQX+pAE4P9K8OfJfOwDscRwLVJ6KtKE8Az0OERc
 jlZM0K/EyS1jD5v0LxOLdHqNgDNDcnM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632861994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9J1pVKau3Gx0ydd+0muNpSHWMi7P0ddoooGf8vYhM5U=;
 b=S6pWYBf2GTe5ucbFKDPOTmoinTc1U50wmnIkxaRQmG2tNpRRuVcm/EHIPMxSfkDSikD0h/
 O/SS9e6l8ypFmjCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D707F13E72;
 Tue, 28 Sep 2021 20:46:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HzISJih/U2HdegAAMHmgww
 (envelope-from <jziviani@suse.de>); Tue, 28 Sep 2021 20:46:32 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] modules: Improve modinfo.c support
Date: Tue, 28 Sep 2021 17:46:26 -0300
Message-Id: <20210928204628.20001-1-jziviani@suse.de>
X-Mailer: git-send-email 2.33.0
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

This patchset introduces the modinfo_kconfig aiming for a fine-tune
control of module loading by simply checking Kconfig options during the
compile time, then generates one modinfo-<target>-softmmu.c per target.

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

Also run 'make check' and 'check-acceptance' without any failures.

v2 -> v3:
 - Renamed module_needs to module_kconfig [Gerd]
 - Reworded the commit message a bit to improve a better understanding [myself]

v1 -> v2:
 - Changed the approach to this problem after suggestions made by Paolo and Gerd.

Thank you!

Jose R. Ziviani (2):
  modules: introduces module_kconfig directive
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
 include/qemu/module.h           | 10 ++++++++
 meson.build                     | 25 +++++++++++++-------
 scripts/modinfo-generate.py     | 42 ++++++++++++++++++++-------------
 19 files changed, 69 insertions(+), 24 deletions(-)

-- 
2.33.0


