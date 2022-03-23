Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B270B4E514A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:27:00 +0100 (CET)
Received: from localhost ([::1]:52460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWz8l-0007y1-QW
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:26:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWyzk-0000xC-LP
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:17:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nWyzg-0001y9-5g
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648034255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NIQs0Vn+o54YCTaFg7TkwcKnH78BjgfLP+ZWiUp915k=;
 b=VAmr3Oh6LN6OvvOuwltQJJ8PugPZrGUUSAfznPiW0RnWUilt5Xqwu2GqYidj/bwsAHJHdR
 CEvXMN8s5tm26ntrMnCrhSL7WS3wFS2FaRbGsp+KMDSM+Ahu0No48KDymZNUdUJoEG/6hH
 KS5ImF8aTnjX2+yomaVV9k8QZLV/7uM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-qJEnyVptMVCrbSLldMBBDA-1; Wed, 23 Mar 2022 07:17:29 -0400
X-MC-Unique: qJEnyVptMVCrbSLldMBBDA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2970829AA389;
 Wed, 23 Mar 2022 11:17:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 822A1401E64;
 Wed, 23 Mar 2022 11:17:28 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/8] blkio: add libblkio BlockDriver
Date: Wed, 23 Mar 2022 11:17:19 +0000
Message-Id: <20220323111727.1100209-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alberto Faria <afaria@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series adds a QEMU BlockDriver for libblkio=0D
(https://gitlab.com/libblkio/libblkio/), a library for high-performance blo=
ck=0D
device I/O. Currently libblkio has basic io_uring support with additional=
=0D
drivers in development.=0D
=0D
The first patch adds the core BlockDriver and most of the libblkio API usag=
e.=0D
The remainder of the patch series reworks the existing QEMU bdrv_register_b=
uf()=0D
API so virtio-blk emulation efficiently map guest RAM for libblkio - some=
=0D
libblkio drivers require that I/O buffer memory is pre-registered (think VF=
IO,=0D
vhost, etc).=0D
=0D
This block driver is incomplete because bdrv_refresh_limits() and several o=
ther=0D
APIs are not yet implemented. You can already boot a guest though. Once the=
=0D
missing gaps have been filled in I will send a non-RFC patch series.=0D
=0D
Regarding the design: each libblkio driver is a separately named BlockDrive=
r.=0D
That means there is an "io_uring" BlockDriver and not a generic "libblkio"=
=0D
BlockDriver. In the future there will be additional BlockDrivers, all defin=
ed=0D
in block/blkio.c. This way QAPI and open parameters are type-safe and manda=
tory=0D
parameters can be checked by QEMU.=0D
=0D
Stefan Hajnoczi (8):=0D
  blkio: add io_uring block driver using libblkio=0D
  numa: call ->ram_block_removed() in ram_block_notifer_remove()=0D
  block: pass size to bdrv_unregister_buf()=0D
  block: add BDRV_REQ_REGISTERED_BUF request flag=0D
  block: add BlockRAMRegistrar=0D
  stubs: add memory_region_from_host() and memory_region_get_fd()=0D
  blkio: implement BDRV_REQ_REGISTERED_BUF optimization=0D
  virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint=0D
=0D
 MAINTAINERS                                 |   7 +=0D
 meson_options.txt                           |   2 +=0D
 qapi/block-core.json                        |  18 +-=0D
 meson.build                                 |   9 +=0D
 include/block/block-common.h                |   9 +=0D
 include/block/block-global-state.h          |   5 +-=0D
 include/block/block_int-common.h            |   2 +-=0D
 include/hw/virtio/virtio-blk.h              |   2 +=0D
 include/sysemu/block-backend-global-state.h |   2 +-=0D
 include/sysemu/block-ram-registrar.h        |  30 ++=0D
 block/blkio.c                               | 560 ++++++++++++++++++++=0D
 block/blkverify.c                           |   4 +-=0D
 block/block-backend.c                       |   4 +-=0D
 block/block-ram-registrar.c                 |  39 ++=0D
 block/crypto.c                              |   2 +=0D
 block/io.c                                  |  36 +-=0D
 block/mirror.c                              |   2 +=0D
 block/nvme.c                                |   2 +-=0D
 block/raw-format.c                          |   2 +=0D
 hw/block/virtio-blk.c                       |  13 +-=0D
 hw/core/numa.c                              |  17 +=0D
 qemu-img.c                                  |   4 +-=0D
 stubs/memory.c                              |  13 +=0D
 tests/qtest/modules-test.c                  |   3 +=0D
 util/vfio-helpers.c                         |   5 +-=0D
 block/meson.build                           |   2 +=0D
 scripts/meson-buildoptions.sh               |   3 +=0D
 stubs/meson.build                           |   1 +=0D
 28 files changed, 772 insertions(+), 26 deletions(-)=0D
 create mode 100644 include/sysemu/block-ram-registrar.h=0D
 create mode 100644 block/blkio.c=0D
 create mode 100644 block/block-ram-registrar.c=0D
 create mode 100644 stubs/memory.c=0D
=0D
--=20=0D
2.35.1=0D
=0D


