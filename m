Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E2C3A2428
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 07:59:47 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrDjF-0003Tx-R9
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 01:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDhx-0001ZF-Ab
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:58:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrDht-0001BE-UA
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 01:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623304700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G2tExqMXRIXSmac4/JZ3SITLE4OjB02gEhOmdlB93rA=;
 b=DEIz7d/o8IlPFrY/el8+P5IvJZjWP09iwyK63MlIUYEY3wi6TuniTIpjJJgI07+doR/NDZ
 i4EjouxmOhNfwoeuzpPhaEQjrAnlEYpY5e2EyW97BuOlzlaqsoI90b8ql8274jIG6LxlPn
 G7MTg/XWyfgxutTLRuy+YwrXTkvp9V4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-Rswlrd1JP8OZzsCVjuXUJA-1; Thu, 10 Jun 2021 01:58:18 -0400
X-MC-Unique: Rswlrd1JP8OZzsCVjuXUJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B219619200C1;
 Thu, 10 Jun 2021 05:58:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91D7360C05;
 Thu, 10 Jun 2021 05:57:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3A88418000B2; Thu, 10 Jun 2021 07:57:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/18] modules: add metadata database
Date: Thu, 10 Jun 2021 07:57:37 +0200
Message-Id: <20210610055755.538119-1-kraxel@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series adds support for module metadata.  Here are the pieces=0D
of the puzzle:=0D
=0D
  (1) Macros are added to store metadata in a .modinfo elf section=0D
      (idea stolen from the linux kernel).=0D
  (2) A utility to scan modules, collect metadata from the .modinfo=0D
      sections, store it in a file (modinfo.json) for later consumption=0D
      by qemu.  Can also be easily inspected using 'jq'.=0D
  (3) Adding annotations to the modules we have.=0D
  (4) Drop hard-coded lists from utils/module.c=0D
=0D
take care,=0D
  Gerd=0D
=0D
Gerd Hoffmann (18):=0D
  modules: add metadata macros, add qxl module annotations=0D
  qapi: add ModuleInfo schema=0D
  modules: add qemu-modinfo utility=0D
  modules: add virtio-gpu module annotations=0D
  modules: add chardev module annotations=0D
  modules: add audio module annotations=0D
  modules: add usb-redir module annotations=0D
  modules: add ccid module annotations=0D
  modules: add ui module annotations=0D
  modules: add s390x module annotations=0D
  modules: add block module annotations=0D
  modules: add module_load_path_init helper=0D
  modules: load modinfo.json=0D
  modules: use modinfo for dependencies=0D
  modules: use modinfo for qom load=0D
  modules: use modinfo for qemu opts load=0D
  modules: check arch and block load on mismatch=0D
  [fixup] module_load_modinfo=0D
=0D
 include/qemu/module.h           |  23 +++=0D
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
 qemu-modinfo.c                  | 270 ++++++++++++++++++++++++++++++=0D
 softmmu/vl.c                    |  20 +--=0D
 stubs/module-opts.c             |   4 -=0D
 ui/egl-headless.c               |   4 +=0D
 ui/gtk.c                        |   4 +=0D
 ui/sdl2.c                       |   4 +=0D
 ui/spice-app.c                  |   3 +=0D
 ui/spice-core.c                 |   5 +=0D
 util/module.c                   | 282 +++++++++++++++++++-------------=0D
 meson.build                     |  11 ++=0D
 qapi/meson.build                |   1 +=0D
 qapi/modules.json               |  36 ++++=0D
 qapi/qapi-schema.json           |   1 +=0D
 util/trace-events               |   3 +=0D
 34 files changed, 576 insertions(+), 131 deletions(-)=0D
 create mode 100644 qemu-modinfo.c=0D
 create mode 100644 qapi/modules.json=0D
=0D
--=20=0D
2.31.1=0D
=0D


