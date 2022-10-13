Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAAD5FD589
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 09:29:41 +0200 (CEST)
Received: from localhost ([::1]:37706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oisey-0002D4-B0
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 03:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois57-000563-Eb
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois54-0006lc-Ja
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665643953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tBKWxClp6HCU/eZLf3LFmc3X6NhAOcBFsouyBHfWonw=;
 b=P+wpoMybhsYdz9EYzuSI4PNzqTPlF+zxkrKr520zY+w/3s/GFuILpkGacGMdYEPKteMPBt
 uFKTTX4iGgeX1aDA5zJB1w0KqBn8LoAfLhZNB4ng/eEROIBu6jD15BOweqTJnQZW+G5toE
 CZtcJ7gshVBG0jq0+zZdeKDo5DmOHbI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-mR1n4U8cNyCGoLfhRtzXNQ-1; Thu, 13 Oct 2022 02:52:30 -0400
X-MC-Unique: mR1n4U8cNyCGoLfhRtzXNQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7650101A528;
 Thu, 13 Oct 2022 06:52:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66371492B05;
 Thu, 13 Oct 2022 06:52:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4F4BC18000A6; Thu, 13 Oct 2022 08:52:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PULL 00/26] Kraxel 20221013 patches
Date: Thu, 13 Oct 2022 08:51:58 +0200
Message-Id: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:

  Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)

are available in the Git repository at:

  https://gitlab.com/kraxel/qemu.git tags/kraxel-20221013-pull-request

for you to fetch changes up to 61ddafbcfac4975ee245cd3453be86b0632a5605:

  audio: improve out.voices test (2022-10-12 20:36:17 +0200)

----------------------------------------------------------------
pci: cleanup virtio ids.
audio: bugfixes and latency improvements.
misc fixes for hw/display and ui

----------------------------------------------------------------

Akihiko Odaki (1):
  ui/gtk: Fix the implicit mouse ungrabbing logic

Bryce Mills (1):
  gtk: Add show_menubar=on|off command line option.

Dongwon Kim (1):
  ui/gtk-egl: egl context needs to be unbound in the end of
    gd_egl_switch

Gerd Hoffmann (6):
  docs: add firmware feature flags
  pci-ids: drop PCI_DEVICE_ID_VIRTIO_IOMMU
  pci-ids: drop PCI_DEVICE_ID_VIRTIO_MEM
  pci-ids: drop PCI_DEVICE_ID_VIRTIO_PMEM
  pci-ids: drop list of modern virtio devices
  pci-ids: document modern virtio-pci ids in pci.h too

Helge Konetzka (2):
  audio: fix in.voices test
  audio: improve out.voices test

Mauro Matteo Cascella (1):
  ui/vnc-clipboard: fix integer underflow in vnc_client_cut_text_ext

Sebastian Mitterle (1):
  qemu-edid: Restrict input parameter -d to avoid division by zero

Volker Rümelin (12):
  audio: refactor code in audio_run_out()
  audio: fix GUS audio playback with out.mixing-engine=off
  audio: run downstream playback queue unconditionally
  alsaaudio: reduce playback latency
  audio: add more audio rate control functions
  spiceaudio: add a pcm_ops buffer_get_free function
  spiceaudio: update comment
  audio: swap audio_rate_get_bytes() function parameters
  audio: rename audio_sw_bytes_free()
  audio: refactor audio_get_avail()
  audio: fix sw->buf size for audio recording
  audio: prevent an integer overflow in resampling code

lu zhipeng (1):
  cirrus_vga: fix potential memory overflow

 docs/specs/pci-ids.txt       |  16 +++--
 audio/audio_int.h            |   4 +-
 audio/audio_template.h       |   4 ++
 audio/rate_template.h        |  11 ++--
 include/hw/pci/pci.h         |  13 +++-
 audio/alsaaudio.c            |  38 +++++++++++-
 audio/audio.c                | 111 +++++++++++++++++++++++------------
 audio/dbusaudio.c            |   4 +-
 audio/noaudio.c              |   4 +-
 audio/spiceaudio.c           |  19 ++++--
 audio/wavaudio.c             |   2 +-
 hw/display/cirrus_vga.c      |   2 +-
 hw/virtio/virtio-iommu-pci.c |   4 +-
 hw/virtio/virtio-mem-pci.c   |   2 -
 hw/virtio/virtio-pci.c       |   2 +-
 hw/virtio/virtio-pmem-pci.c  |   2 -
 qemu-edid.c                  |   4 ++
 ui/gtk-egl.c                 |   3 +
 ui/gtk.c                     |  25 +++++---
 ui/vnc.c                     |  11 +++-
 docs/interop/firmware.json   |  21 +++++--
 qapi/ui.json                 |   5 +-
 qemu-options.hx              |   3 +
 23 files changed, 218 insertions(+), 92 deletions(-)

-- 
2.37.3


