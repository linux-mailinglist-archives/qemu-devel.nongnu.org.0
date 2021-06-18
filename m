Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A98F3AC2A5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 06:57:01 +0200 (CEST)
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6Yu-0006jp-88
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 00:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6WM-0003RL-Qs
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6WI-0003WK-JD
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kqm+kvYVyqwOzDpdaBmqcY6fCYsEOhwX31h0ETus9VM=;
 b=JFdX4gvBxkGu+cNZAOeWstEjLODbPVQc5PbSlzCVp9tE+AUVxmDubPVyOHDXRekNlSj+rf
 s7azGkNu8u60DJehPojar0AcqDda5YlZzDl6IW/gNH/NrwSy8aFLxlLyfDtlQD7Gu/tSWU
 45G8ZI3YJAkmHyIAbcf/jgbZktB9UT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-8JhtmjRbOS-7XATonkQMFg-1; Fri, 18 Jun 2021 00:54:14 -0400
X-MC-Unique: 8JhtmjRbOS-7XATonkQMFg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E23180ED8B;
 Fri, 18 Jun 2021 04:54:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76F8460E3A;
 Fri, 18 Jun 2021 04:53:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E99BB18007AE; Fri, 18 Jun 2021 06:53:53 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/24] modules: add meta-data database
Date: Fri, 18 Jun 2021 06:53:29 +0200
Message-Id: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
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
Patches 4-12 add annotations macros to the modules we have.=0D
=0D
Patches 13-15 put the modinfo database into use and remove the=0D
module_deps[] and qom_modules[] lists.=0D
=0D
Patch 16 adds two tracepoints for easier trouble-shooting.=0D
=0D
Patches 17-19 add support for target-specific modules.=0D
=0D
Patches 20-14 start building accelerators modular.  So far it is=0D
only qtest (all archs) and a small fraction of tcg (x86 only).=0D
=0D
take care,=0D
  Gerd=0D
=0D
Gerd Hoffmann (24):=0D
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
  accel: autoload modules=0D
  accel: add qtest module annotations=0D
  accel: build qtest modular=0D
  accel: add tcg module annotations=0D
  accel: build tcg modular=0D
=0D
 scripts/modinfo-collect.py      |  67 +++++++++++=0D
 scripts/modinfo-generate.py     |  84 ++++++++++++++=0D
 include/qemu/module.h           |  43 +++++++=0D
 accel/accel-common.c            |   2 +-=0D
 accel/accel-softmmu.c           |   2 +-=0D
 accel/qtest/qtest.c             |   2 +=0D
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
 hw/s390x/virtio-ccw-gpu.c       |   3 +=0D
 hw/usb/ccid-card-emulated.c     |   1 +=0D
 hw/usb/ccid-card-passthru.c     |   1 +=0D
 hw/usb/redirect.c               |   1 +=0D
 softmmu/vl.c                    |  24 ++--=0D
 stubs/module-opts.c             |   4 -=0D
 ui/egl-headless.c               |   4 +=0D
 ui/gtk.c                        |   4 +=0D
 ui/sdl2.c                       |   4 +=0D
 ui/spice-app.c                  |   3 +=0D
 ui/spice-core.c                 |   5 +=0D
 util/module.c                   | 200 ++++++++++++++++++--------------=0D
 accel/qtest/meson.build         |   8 +-=0D
 accel/tcg/meson.build           |   5 +-=0D
 meson.build                     |  76 ++++++++++++=0D
 util/trace-events               |   4 +=0D
 39 files changed, 462 insertions(+), 117 deletions(-)=0D
 create mode 100755 scripts/modinfo-collect.py=0D
 create mode 100755 scripts/modinfo-generate.py=0D
=0D
--=20=0D
2.31.1=0D
=0D


