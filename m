Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09095530B2A
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 10:58:03 +0200 (CEST)
Received: from localhost ([::1]:43920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt3t0-00052q-Mc
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 04:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3me-00023k-1T
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:30 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nt3mZ-0000Zg-5C
 for qemu-devel@nongnu.org; Mon, 23 May 2022 04:51:22 -0400
Received: by mail-pf1-x431.google.com with SMTP id w200so13070588pfc.10
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 01:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aOKtkj/yv06TfufZAtyWXbHG55Vr47GxYpuUbjEgmGQ=;
 b=cToWSFIYskLmpAWxkwmwf5y0l9PupSQ65xmi0yk4+nLDoBW0YUf9EnUMmbOUGvohG6
 cCtWHR0dZCnWq/n/DV1oRtRNNVMtCsgSjMIQWJd8G7bOEVMmKXGB/RiDfowREFWPQb9e
 UbRV1AWrm37YeCyt2FGVwKzp3MDs0xoRApa2gHPyJXAawT5IBjfsrwaFlPr/VfL4cUAz
 YgxHRikD2yqo6SHi0Pg7hK1q+0HrmLynpGkj8vbLo0OVYX9rPA6qibBf3xisR9rV+8gb
 oInCHmZQa4ZVXDYQRN/6aAEvKSLlAdgfVRQSHV9kS9lk8H8I5i4TU5nrVW76iu9Ws21x
 KeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aOKtkj/yv06TfufZAtyWXbHG55Vr47GxYpuUbjEgmGQ=;
 b=lrgLojHUxfXo/HGh9+dU5bnGETa0ngh/fmzCUnu+sucR5zYvMy51gEKHOci7Th5ZpR
 XshjfUTYo1xySbjJ4k9LO7C3ttOVu/EFDzPwrhnm5STqrt4jbrcvBxb27ZKtRi3BExRj
 2ym6+zHQQltyLccbvOuQ3yNOZcEgtwpmp9HX2fHnKV/Zp5NN6ZBdspHZW61TQ5IVEeR+
 lL5NZX65F3/hlAveR3OKN2OgKFTnxI7wsdPqPM6gg2rZRZIggY52Ld0Un3TeSvu8jWm6
 KsGfnQdRF9CzUJd/qsOpLCbUDAjJNePtGN/vJL0XSMu2OM8dFJ+jI15k6Odw0GbaW2tc
 AUlA==
X-Gm-Message-State: AOAM531ZRcR7M9jo3iApDqIzF4hCPoswTMtVSYDlNUfZUrAQXShxTO2d
 wv47YQtLw99as+6vX6/Px6Uj
X-Google-Smtp-Source: ABdhPJy+3NFV7f8o6+qg8p59sRde6ZAEhsYoXGLfRvZ8JbrlWW57ihySJJDNgoX6YHQuZal9cdBCpQ==
X-Received: by 2002:a62:ed0b:0:b0:505:7675:1119 with SMTP id
 u11-20020a62ed0b000000b0050576751119mr23254100pfh.4.1653295862551; 
 Mon, 23 May 2022 01:51:02 -0700 (PDT)
Received: from localhost ([139.177.225.248]) by smtp.gmail.com with ESMTPSA id
 y11-20020a62ce0b000000b0050dc7628131sm6930508pfg.11.2022.05.23.01.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:51:01 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 0/8] Support exporting BDSs via VDUSE
Date: Mon, 23 May 2022 16:46:03 +0800
Message-Id: <20220523084611.91-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi all,

Last few months ago, VDUSE (vDPA Device in Userspace) [1] has
been merged into Linux kernel as a framework that make it
possible to emulate a vDPA device in userspace. This series
aimed at implementing a VDUSE block backend based on the
qemu-storage-daemon infrastructure.

To support that, we firstly introduce a VDUSE library as a
subproject (like what libvhost-user does) to help implementing
VDUSE backends in QEMU. Then a VDUSE block export is implemented
based on this library. At last, we add resize and reconnect support
to the VDUSE block export and VDUSE library.

Now this series is based on Stefan's patch [2]. And since we don't
support vdpa-blk in QEMU currently, the VM case is tested with my
previous patchset [3].

[1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
[2] https://lore.kernel.org/all/20220518130945.2657905-1-stefanha@redhat.com/
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html

Please review, thanks!

V5 to V6:
- Remove blk_get_guest_block_size() [Stefan]
- A patch is splited to fix incorrect length for
  vhost-user-blk-server
- Define a VirtioBlkHandler structure for virtio-blk
  I/O process [Stefan]
- Add documentation for block export id [Stefan]
- Remove some assert from libvduse library [Stefan]
- Remove unused VIRTIO_BLK_F_SIZE_MAX for vduse block export

V4 to V5:
- Abstract out the logic for virito-blk I/O process from
  vhost-user-blk-server and reuse it [Kevin]
- Fix missing VIRTIO_BLK_F_FLUSH [Kevin]
- Support discard and write_zeroes [Kevin]
- Rebase to the newest tree

V3 to V4:
- Fix some comments on QAPI [Eric]

V2 to V3:
- Introduce vduse_get_virtio_features() [Stefan]
- Update MAINTAINERS file [Stefan]
- Fix handler of VIRTIO_BLK_T_GET_ID request [Stefan]
- Add barrier for vduse_queue_inflight_get() [Stefan]

V1 to V2:
- Move vduse header to linux-headers [Stefan]
- Add two new API to support creating device from /dev/vduse/$NAME or
  file descriptor [Stefan]
- Check VIRTIO_F_VERSION_1 during intialization [Stefan]
- Replace malloc() + memset to calloc() [Stefan]
- Increase default queue size to 256 for vduse-blk [Stefan]
- Zero-initialize virtio-blk config space [Stefan]
- Add a patch to support reset blk->dev_ops
- Validate vq->log->inflight fields [Stefan]
- Add vduse_set_reconnect_log_file() API to support specifing the
  reconnect log file
- Fix some bugs [Stefan]

Xie Yongji (8):
  block: Support passing NULL ops to blk_set_dev_ops()
  block/export: Fix incorrect length passed to vu_queue_push()
  block/export: Abstract out the logic of virtio-blk I/O process
  linux-headers: Add vduse.h
  libvduse: Add VDUSE (vDPA Device in Userspace) library
  vduse-blk: Implement vduse-blk export
  vduse-blk: Add vduse-blk resize support
  libvduse: Add support for reconnecting

 MAINTAINERS                                 |    9 +
 block/block-backend.c                       |    2 +-
 block/export/export.c                       |    6 +
 block/export/meson.build                    |    7 +-
 block/export/vduse-blk.c                    |  341 +++++
 block/export/vduse-blk.h                    |   20 +
 block/export/vhost-user-blk-server.c        |  260 +---
 block/export/virtio-blk-handler.c           |  240 ++++
 block/export/virtio-blk-handler.h           |   37 +
 linux-headers/linux/vduse.h                 |  306 ++++
 meson.build                                 |   28 +
 meson_options.txt                           |    4 +
 qapi/block-export.json                      |   28 +-
 scripts/meson-buildoptions.sh               |    7 +
 scripts/update-linux-headers.sh             |    2 +-
 subprojects/libvduse/include/atomic.h       |    1 +
 subprojects/libvduse/include/compiler.h     |    1 +
 subprojects/libvduse/libvduse.c             | 1392 +++++++++++++++++++
 subprojects/libvduse/libvduse.h             |  247 ++++
 subprojects/libvduse/linux-headers/linux    |    1 +
 subprojects/libvduse/meson.build            |   10 +
 subprojects/libvduse/standard-headers/linux |    1 +
 22 files changed, 2705 insertions(+), 245 deletions(-)
 create mode 100644 block/export/vduse-blk.c
 create mode 100644 block/export/vduse-blk.h
 create mode 100644 block/export/virtio-blk-handler.c
 create mode 100644 block/export/virtio-blk-handler.h
 create mode 100644 linux-headers/linux/vduse.h
 create mode 120000 subprojects/libvduse/include/atomic.h
 create mode 120000 subprojects/libvduse/include/compiler.h
 create mode 100644 subprojects/libvduse/libvduse.c
 create mode 100644 subprojects/libvduse/libvduse.h
 create mode 120000 subprojects/libvduse/linux-headers/linux
 create mode 100644 subprojects/libvduse/meson.build
 create mode 120000 subprojects/libvduse/standard-headers/linux

-- 
2.20.1


