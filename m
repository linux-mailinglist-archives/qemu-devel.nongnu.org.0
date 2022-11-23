Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EDE636232
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 15:46:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxqzb-0004Di-CE; Wed, 23 Nov 2022 09:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqzZ-0004DY-5H
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oxqzX-0002vg-Hb
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 09:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669214686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4ied218uswzSaEJFAE7s/A7Taav0HC2Px5ZBBH12DVc=;
 b=Iud0u9EFPLQrvSKVoamRITMEeq3YR0kLbFfjvRQZA2zaEPM22BMhqBXQiBs2PKPB+Wn2Zi
 wvCm+WgB/jq9EwA0AQ9gwlo+bmIMCD2dUP5/5PmsZeCTo50oK1g6OUP2/XvljI1k5I6xXL
 HcL4fdC2DqKs2kzUINIMkFRFGRqSNR8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-i_06X6nlMOuy0gqVXqL9yQ-1; Wed, 23 Nov 2022 09:44:44 -0500
X-MC-Unique: i_06X6nlMOuy0gqVXqL9yQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 449A08715D8;
 Wed, 23 Nov 2022 14:44:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DBB41415114;
 Wed, 23 Nov 2022 14:44:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5A1EB18003BA; Wed, 23 Nov 2022 15:44:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 0/7] Fixes 20221123 patches
Date: Wed, 23 Nov 2022 15:44:29 +0100
Message-Id: <20221123144436.2141069-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 7c09a7f6ae1770d15535980d15dffdb23f4d9786:

  Update VERSION for v7.2.0-rc2 (2022-11-22 18:59:56 -0500)

are available in the Git repository at:

  https://gitlab.com/kraxel/qemu.git tags/fixes-20221123-pull-request

for you to fetch changes up to 7d3cf19548b7f9afd9d25c30dd1450aad7d1877d:

  hw/audio/intel-hda: Drop unnecessary prototype (2022-11-23 12:30:45 +0100)

----------------------------------------------------------------
ui+usb+audio: bugfixes for 7.2

----------------------------------------------------------------

Claudio Fontana (1):
  gtk: disable GTK Clipboard with a new meson option

Dongwon Kim (1):
  ui/gtk: prevent ui lock up when dpy_gl_update called again before
    current draw event occurs

Joelle van Dyne (1):
  Revert "usbredir: avoid queuing hello packet on snapshot restore"

Michael Tokarev (1):
  hw/usb/hcd-xhci.c: spelling: tranfer

Peter Maydell (3):
  hw/usb/hcd-xhci: Reset the XHCIState with device_cold_reset()
  hw/audio/intel-hda: don't reset codecs twice
  hw/audio/intel-hda: Drop unnecessary prototype

 meson_options.txt             | 7 +++++++
 hw/audio/intel-hda.c          | 6 +-----
 hw/usb/hcd-xhci-pci.c         | 2 +-
 hw/usb/hcd-xhci-sysbus.c      | 2 +-
 hw/usb/hcd-xhci.c             | 2 +-
 hw/usb/redirect.c             | 3 +--
 ui/gtk-egl.c                  | 2 +-
 ui/gtk-gl-area.c              | 2 +-
 ui/gtk.c                      | 2 ++
 meson.build                   | 5 +++++
 scripts/meson-buildoptions.sh | 3 +++
 ui/meson.build                | 5 ++++-
 12 files changed, 28 insertions(+), 13 deletions(-)

-- 
2.38.1


