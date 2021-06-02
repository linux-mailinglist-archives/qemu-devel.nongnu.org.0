Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2494D39852D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:22:18 +0200 (CEST)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loN4r-00022v-5w
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1loN0V-0001s7-1c
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1loN0M-00029D-Nv
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622625456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JtiJllH9PZz3upMhQ9s+UW6cQ6GptsJk207XnQDsLhE=;
 b=VgNhagyyBlyqDKy99OP8Mym7dLHf6pVSoXjga6PSpjSc1/ecB9MrYuU8Rm1bJ2IYH+M0Iu
 CpuPp96+z+kHGXRtH21Hm194LWNipjyal1gpu/xgSpDCgLL/qs/iR/ZzKosnNBn/zS9nNM
 4fdj1oFkSJnuCd3SSV6UQlt6lGOt7ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-PAPWkCUoM46x7k_SbQ7AgA-1; Wed, 02 Jun 2021 05:17:30 -0400
X-MC-Unique: PAPWkCUoM46x7k_SbQ7AgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 735D5108BD07;
 Wed,  2 Jun 2021 09:17:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01BA85D9D0;
 Wed,  2 Jun 2021 09:17:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 78025180087C; Wed,  2 Jun 2021 11:17:27 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] [RFC] store module metadata in .modinfo elf section
Date: Wed,  2 Jun 2021 11:17:18 +0200
Message-Id: <20210602091727.1023563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, armbru@redhat.com,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series stores module metadata in a .modinfo elf section and=0D
adds a utility to read it.  For now the utility just prints the meta=0D
data.  The plan is to store this in some file and have qemu read it.=0D
=0D
Background is that the hard-coded lists in util/module.c are somewhat=0D
ugly and also wouldn't work very well with a large number of modules,=0D
so I'm looking for something else.=0D
=0D
Posting this now to collect feedback on the apprach.=0D
Should I continue this?=0D
Better ideas?=0D
Other comments & suggestions?=0D
=0D
take care,=0D
  Gerd=0D
=0D
Gerd Hoffmann (9):=0D
  Add module metadata macros, add qxl module annotations=0D
  add qemu-modinfo utility=0D
  virtio-gpu module annotations=0D
  chardev module annotations=0D
  audio module annotations=0D
  usb-redir module annotations=0D
  ccid module annotations=0D
  ui module annotations=0D
  s390x module annotations=0D
=0D
 include/qemu/module.h           |  18 ++++=0D
 audio/spiceaudio.c              |   2 +=0D
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
 qemu-modinfo.c                  | 182 ++++++++++++++++++++++++++++++++=0D
 ui/egl-headless.c               |   4 +=0D
 ui/gtk.c                        |   4 +=0D
 ui/sdl2.c                       |   4 +=0D
 ui/spice-app.c                  |   3 +=0D
 ui/spice-core.c                 |   4 +=0D
 meson.build                     |   3 +=0D
 26 files changed, 257 insertions(+)=0D
 create mode 100644 qemu-modinfo.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


