Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ECB6C4D78
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:22:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezLW-0007nd-Et; Wed, 22 Mar 2023 10:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLS-0007ms-LN
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:21:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLQ-0007Es-LV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j9m5mtsocy5k9Eygv0Ij+nlOv6Z3P/7xYsQte6DrIys=;
 b=PT+mrOVfPxDXbxUYPyynbaW2/jTEvW9Y8owiJgRFtBhBQSVgmIxm5+/tOzxSLx9tVpccr1
 ilM3GYRtaz9WEbqS9IDlFxuYQ0XMVhARGbF1pJljMxNUCvEIYPhj7to6uPTzKjV/rPDC1c
 aNFXF5xtxMA/QrU5qhNyc0ASmLtTMBo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-TjoYrhGSPlOLwkoTMrxJgg-1; Wed, 22 Mar 2023 10:21:38 -0400
X-MC-Unique: TjoYrhGSPlOLwkoTMrxJgg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A71F038173D0;
 Wed, 22 Mar 2023 14:21:36 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2FAA40C6E67;
 Wed, 22 Mar 2023 14:21:33 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, fmartine@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com,
 Albert Esteve <aesteve@redhat.com>, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 00/12] [RFC PATCHv2] Add vhost-user Video decode
Date: Wed, 22 Mar 2023 15:21:20 +0100
Message-Id: <20230322142132.22909-1-aesteve@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=aesteve@redhat.com;
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

v1: https://patchew.org/QEMU/20211209145601.331477-1-peter.griffin@linaro.org/
v1 -> v2:
    - Address the feedback found in the original patch
    - Rebase patch so that it applies to latest master
    - Add PoC implementation for dmabuf sharing (using udmabuf for creation)
    - Test the patch on a real HW codec

This series adds support for virtio-video decoder devices in Qemu
and also provides a vhost-user-video vmm implementation.

The vhost-user-video vmm currently parses virtio-video v3 protocol
(as that still was what the Linux frontend driver prototype implemented
at the timei, we kept working over this).
It then converts that to a v4l2 mem2mem stateful decoder device.
Currently, this has been tested using v4l2 vicodec test driver in Linux [1],
and also with a real HW codec, i.e., QCom Venus driver, which implements
a v4l2 stateful decoder/encoder. In order to support vicodec driver, the
virtio backend supports the FWHT format.

The primary goal so far has been to allow testing with Qemu. Using
vicodec on the host allows a purely virtual dev env, and for
CI integration in the future by kernelci, etc.

This series adds the virtio_video.h header for testing purposes,
but the driver code has not been upstreamed yet, as the specs
are still under discussion.
Therefore, the commit does not need to be reviewed at this stage.

This version includes a proof of concept implementation of dma-buf
sharing mechanism. Since the infrastructure is not yet available in Qemu,
we employed udmabuf device to create new dma-buf structures when the
driver asks for a shared object memory stream, and then we copy the
contents of the shared memory buffer into the newly created buffer.
Also, note that this PoC was necessary for making the patch work with
QC Venus driver as it does not support USERPTR memory in its latest
release. In any case, a thorough review of these two commits is not
necessary in its current stage, as the implementation is subjected
to big changes.

We tested this VMM using v4l2-ctl from v4l2 utils in the guest
to do a video decode to a file. This can then be validated using ffplay
v4l2-compliance tool in the guest has also been run which stresses the
interface and issues lots of syscall level tests.

See the vhost-user-video.rst for example commands on how to configure
guest kernel and do a video decode using Qemu, vicodec using this VMM.

Next steps:
Recently there was a big update for virtio-video specs being discussed
in the virtio-dev mailing list [2], with a proposal for moving the specs
closer to the v4l2 framework.
Following these news, the next step for this series is to update the
implementation to the new specs approach and join efforts in verifying
the driver implementation [3], and the specs themselves.

Linux virtio-video frontend driver code:
https://github.com/aesteve-rh/linux
(adds FWHT support on top of https://github.com/Gnurou/linux)

Qemu vmm code:
https://github.com/aesteve-rh/qemu/tree/virtio_video_v3

Applies cleanly to:
git://git.qemu.org/qemu.git master(c283ff89d11ff123efc9af49128ef58511f73012)

[1] https://lwn.net/Articles/760650/
[2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg09126.html
[3] https://github.com/Gnurou/linux/blob/virtio-v4l2/drivers/media/virtio-v4l2/virtio_v4l2_driver.c

Albert Esteve (5):
  vhost-user.json: add video type
  tests/qtest: add virtio-video test
  vhost-user-video: add dev_type to CLI
  vhost-user-video-udmabuf: add udmabuf helpers
  Add support for v4l2_memory_dmabuf

Peter Griffin (7):
  docs: Add a vhost-virtio-video rst file
  MAINTAINERS: Add virtio-video section
  vhost-user-video: boiler plate code for vhost-user-video device
  vhost-user-video: add meson subdir build logic
  standard-headers: Add virtio_video.h
  hw/display: add vhost-user-video-pci
  tools/vhost-user-video: Add initial vhost-user-video vmm

 MAINTAINERS                                   |    8 +
 docs/interop/vhost-user.json                  |    2 +
 docs/system/devices/vhost-user-video.rst      |  124 ++
 hw/display/Kconfig                            |    5 +
 hw/display/meson.build                        |    3 +
 hw/display/vhost-user-video-pci.c             |   82 +
 hw/display/vhost-user-video.c                 |  419 ++++
 include/hw/virtio/vhost-user-video.h          |   43 +
 include/standard-headers/linux/virtio_video.h |  513 +++++
 tests/qtest/libqos/meson.build                |    1 +
 tests/qtest/libqos/virtio-video.c             |  179 ++
 tests/qtest/libqos/virtio-video.h             |   39 +
 tests/qtest/vhost-user-test.c                 |   32 +
 tools/meson.build                             |    7 +
 tools/vhost-user-video/50-qemu-video.json.in  |    5 +
 tools/vhost-user-video/meson.build            |   10 +
 tools/vhost-user-video/v4l2_backend.c         | 1838 +++++++++++++++++
 tools/vhost-user-video/v4l2_backend.h         |  111 +
 tools/vhost-user-video/vhost-user-video.c     | 1787 ++++++++++++++++
 tools/vhost-user-video/virtio_video_helpers.c |  466 +++++
 tools/vhost-user-video/virtio_video_helpers.h |  198 ++
 tools/vhost-user-video/virtio_video_udmabuf.c |  180 ++
 tools/vhost-user-video/vuvideo.h              |   51 +
 23 files changed, 6103 insertions(+)
 create mode 100644 docs/system/devices/vhost-user-video.rst
 create mode 100644 hw/display/vhost-user-video-pci.c
 create mode 100644 hw/display/vhost-user-video.c
 create mode 100644 include/hw/virtio/vhost-user-video.h
 create mode 100644 include/standard-headers/linux/virtio_video.h
 create mode 100644 tests/qtest/libqos/virtio-video.c
 create mode 100644 tests/qtest/libqos/virtio-video.h
 create mode 100644 tools/vhost-user-video/50-qemu-video.json.in
 create mode 100644 tools/vhost-user-video/meson.build
 create mode 100644 tools/vhost-user-video/v4l2_backend.c
 create mode 100644 tools/vhost-user-video/v4l2_backend.h
 create mode 100644 tools/vhost-user-video/vhost-user-video.c
 create mode 100644 tools/vhost-user-video/virtio_video_helpers.c
 create mode 100644 tools/vhost-user-video/virtio_video_helpers.h
 create mode 100644 tools/vhost-user-video/virtio_video_udmabuf.c
 create mode 100644 tools/vhost-user-video/vuvideo.h

-- 
2.39.2


