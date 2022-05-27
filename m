Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA2A5368BB
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 00:22:32 +0200 (CEST)
Received: from localhost ([::1]:33960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuiLn-0000A1-Hg
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 18:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nuiJj-0006yf-VS; Fri, 27 May 2022 18:20:24 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dfaggioli@suse.com>)
 id 1nuiJh-0000OY-Hv; Fri, 27 May 2022 18:20:23 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E4F92199B;
 Fri, 27 May 2022 22:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1653690018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=23ZjuO4lSmcbTd/a2nW7br+4L+w03qokNw7qq+mhpTs=;
 b=G2y+SWXcl5fu1I60D/NoY0QpBDiyGXKXoNihnnZd8y92gs0piQFOBTZAEOXHiR6VNsOmbx
 AVZDWnmb8BIaY9BMaIE/4+n6L8xAJWUY0pEM/zyKgkbNMjFVqNff94G7HxmMn51kt5P1pW
 vh9Z2CxJQy1v/2A0KAuBIYOFShk+WNY=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4180313A84;
 Fri, 27 May 2022 22:20:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u4VfDaJOkWKQJAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Fri, 27 May 2022 22:20:18 +0000
Subject: [RESEND PATCH 0/2] modules: Improve modinfo.c support
From: Dario Faggioli <dfaggioli@suse.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, "Jose R. Ziviani" <jziviani@suse.de>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Date: Sat, 28 May 2022 00:20:17 +0200
Message-ID: <165368982364.5857.13012746434823168062.stgit@work>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=dfaggioli@suse.com;
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

Hello,

This is a RESEND of patch series "[PATCH v3 0/2] modules: Improve modinfo.c
support", from Sept 2021.

Message-ID: <20210928204628.20001-1-jziviani@suse.de>
https://lore.kernel.org/qemu-devel/20210928204628.20001-1-jziviani@suse.de/

Jose sent it because we were having issues building QEMU in the way we do that
for openSUSE and SUSE Linux Enterprise.

It was, back then, Acked by Gerd (see Message-ID:
20210929050908.3fqf3wwbk6vrtziu@sirius.home.kraxel.org), but then never picked
up. Well, since we are still having those building problems without it, I've
rebased and I'm resending it, as agreed with Gerd himself.

"Rebase" was as easy as just reapplying the patches (no offsets, no fuzz). Yet,
I removed the ack, assuming that it needs being re-locked at.

`make check` is happy. The CI, well, it looks fine to me. There's some 'Build'
jobs that are taking too much to complete, and hence causing failures in the
'Test' ones, but that seems unrelated to the patches. I'll try to restart them
in these days, and see if they manage to finish.

 https://gitlab.com/dfaggioli/qemu/-/pipelines/549884208

FWIW, we've also started to use it, as downstream patches, in our packages,
on top of various versions of QEMU.

Let me know if there's anything more or different that I should do.

Thanks and Regards
---
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
Signature


