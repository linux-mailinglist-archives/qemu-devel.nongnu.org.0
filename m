Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62A3B2C9C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:41:45 +0200 (CEST)
Received: from localhost ([::1]:53344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMno-0002qA-EB
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMlG-000658-1z
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMl8-0006Pv-8z
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O+X+YlX42HHi0vTrxa6pf10MitshuW8d7nQCHFp2vTs=;
 b=RfnTSte5XjsWTsHJWWtZZIO4eXaFh53cy7W/b8SPRPWuwVbOnSloJz8R7MtP/6HTJcWU9o
 06b9iAvPixOTaSkh/gvMB+5yfU43AvApU3F/IEMoPSCx5sEssAHtaByF4Ljq05XMqM/YSP
 gexiu5clqEPBSV8Dy+MQ+KizAPsWp/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-tff4mFA7NQeYqoaiNDT3QA-1; Thu, 24 Jun 2021 06:38:54 -0400
X-MC-Unique: tff4mFA7NQeYqoaiNDT3QA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D3FA106B7D8;
 Thu, 24 Jun 2021 10:38:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 736D05D6A1;
 Thu, 24 Jun 2021 10:38:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D751C180060E; Thu, 24 Jun 2021 12:38:36 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/34] modules: add meta-data database
Date: Thu, 24 Jun 2021 12:38:02 +0200
Message-Id: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series adds support for module meta-data.  Today this is=0D
either hard-coded in qemu (see qemu_load_module_for_opts) or handled=0D
with manually maintained lists in util/module (see module_deps[] and=0D
qom_modules[]).  This series replaced that scheme with annotation=0D
macros, so the meta-data can go into the module source code and -- for=0D
example -- the module_obj() annotations can go next to the TypeInfo=0D
struct for the object class.=0D
=0D
Patches 1-3 put the infrastructure in place:  Add the annotation macros,=0D
add a script to collect the meta-data, add a script to compile the=0D
meta-data into C source code which we can then add to qemu.=0D
=0D
Patch 4 - check module dependencies (Jose, new in v4).=0D
=0D
Patches 5-13 add annotations macros to the modules we have.=0D
=0D
Patches 14-16 put the modinfo database into use and remove the=0D
module_deps[] and qom_modules[] lists.=0D
=0D
Patch 16 adds two tracepoints for easier trouble-shooting.=0D
=0D
Patches 18-20 add support for target-specific modules.=0D
=0D
Patches 21-24 add documentation for all of the above (new in v4, was=0D
separate series).=0D
=0D
Patches 25-29 start building accelerators modular.  So far it is=0D
only qtest (all archs) and a small fraction of tcg (x86 only).=0D
=0D
Patches 30-34 add support for registering hmp commands so they can=0D
be implemented as module (new in v4, was separate series).=0D
=0D
take care,=0D
  Gerd=0D
=0D
Gerd Hoffmann (33):=0D
  modules: add modinfo macros=0D
  modules: collect module meta-data=0D
  modules: generate modinfo.c=0D
  modules: add qxl module annotations=0D
  modules: add virtio-gpu module annotations=0D
  modules: add chardev module annotations=0D
  modules: add audio module annotations=0D
  modules: add usb-redir module annotations=0D
  modules: add ccid module annotations=0D
  modules: add ui module annotations=0D
  modules: add s390x module annotations=0D
  modules: add block module annotations=0D
  modules: use modinfo for dependencies=0D
  modules: use modinfo for qom load=0D
  modules: use modinfo for qemu opts load=0D
  modules: add tracepoints=0D
  modules: check arch and block load on mismatch=0D
  modules: check arch on qom lookup=0D
  modules: target-specific module build infrastructure=0D
  modules: add documentation for module sourcesets=0D
  modules: add module_obj() note to QOM docs=0D
  modules: module.h kerneldoc annotations=0D
  modules: hook up modules.h to docs build=0D
  accel: autoload modules=0D
  accel: add qtest module annotations=0D
  accel: build qtest modular=0D
  accel: add tcg module annotations=0D
  accel: build tcg modular=0D
  monitor: allow register hmp commands=0D
  usb: drop usb_host_dev_is_scsi_storage hook=0D
  monitor/usb: register 'info usbhost' dynamically=0D
  usb: build usb-host as module=0D
  monitor/tcg: move tcg hmp commands to accel/tcg, register them=0D
    dynamically=0D
=0D
Jose R. Ziviani (1):=0D
  modules: check if all dependencies can be satisfied=0D
=0D
 scripts/modinfo-collect.py      |  67 +++++++++++=0D
 scripts/modinfo-generate.py     |  97 ++++++++++++++++=0D
 include/hw/usb.h                |   7 +-=0D
 include/monitor/monitor.h       |   3 +=0D
 include/qemu/module.h           |  74 ++++++++++++=0D
 accel/accel-common.c            |   2 +-=0D
 accel/accel-softmmu.c           |   2 +-=0D
 accel/qtest/qtest.c             |   2 +=0D
 accel/tcg/hmp.c                 |  29 +++++=0D
 accel/tcg/tcg-accel-ops.c       |   1 +=0D
 accel/tcg/tcg-all.c             |   1 +=0D
 audio/spiceaudio.c              |   2 +=0D
 block/iscsi-opts.c              |   1 +=0D
 chardev/baum.c                  |   1 +=0D
 chardev/spice.c                 |   4 +=0D
 hw/display/qxl.c                |   4 +=0D
 hw/display/vhost-user-gpu-pci.c |   1 +=0D
 hw/display/vhost-user-gpu.c     |   1 +=0D
 hw/display/vhost-user-vga.c     |   1 +=0D
 hw/display/virtio-gpu-base.c    |   1 +=0D
 hw/display/virtio-gpu-gl.c      |   3 +=0D
 hw/display/virtio-gpu-pci-gl.c  |   3 +=0D
 hw/display/virtio-gpu-pci.c     |   2 +=0D
 hw/display/virtio-gpu.c         |   1 +=0D
 hw/display/virtio-vga-gl.c      |   3 +=0D
 hw/display/virtio-vga.c         |   2 +=0D
 hw/ppc/spapr.c                  |   2 +-=0D
 hw/s390x/virtio-ccw-gpu.c       |   3 +=0D
 hw/usb/ccid-card-emulated.c     |   1 +=0D
 hw/usb/ccid-card-passthru.c     |   1 +=0D
 hw/usb/dev-storage-bot.c        |   1 +=0D
 hw/usb/dev-storage-classic.c    |   1 +=0D
 hw/usb/dev-uas.c                |   1 +=0D
 hw/usb/host-libusb.c            |  38 ++----=0D
 hw/usb/host-stub.c              |  45 -------=0D
 hw/usb/redirect.c               |   1 +=0D
 monitor/hmp.c                   |   7 ++=0D
 monitor/misc.c                  |  34 +++---=0D
 softmmu/vl.c                    |  24 ++--=0D
 stubs/module-opts.c             |   4 -=0D
 ui/egl-headless.c               |   4 +=0D
 ui/gtk.c                        |   4 +=0D
 ui/sdl2.c                       |   4 +=0D
 ui/spice-app.c                  |   3 +=0D
 ui/spice-core.c                 |   5 +=0D
 util/module.c                   | 200 ++++++++++++++++++--------------=0D
 accel/qtest/meson.build         |   8 +-=0D
 accel/tcg/meson.build           |   6 +-=0D
 docs/devel/build-system.rst     |  17 +++=0D
 docs/devel/index.rst            |   1 +=0D
 docs/devel/modules.rst          |   5 +=0D
 docs/devel/qom.rst              |   8 ++=0D
 hmp-commands-info.hx            |   3 -=0D
 hw/usb/meson.build              |  10 +-=0D
 meson.build                     |  82 +++++++++++++=0D
 util/trace-events               |   4 +=0D
 56 files changed, 624 insertions(+), 218 deletions(-)=0D
 create mode 100755 scripts/modinfo-collect.py=0D
 create mode 100755 scripts/modinfo-generate.py=0D
 create mode 100644 accel/tcg/hmp.c=0D
 delete mode 100644 hw/usb/host-stub.c=0D
 create mode 100644 docs/devel/modules.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


