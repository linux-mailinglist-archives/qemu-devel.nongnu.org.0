Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8512B519906
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 09:55:01 +0200 (CEST)
Received: from localhost ([::1]:44308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm9qe-0006It-Hy
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 03:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9cp-0002aA-PN
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:40:48 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9cl-0006x6-72
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:40:41 -0400
Received: by mail-pl1-x635.google.com with SMTP id n8so731429plh.1
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pnlbITuVpJUwNdSd0SaGkJdrxKjsKAsFPP5aO3uGVw=;
 b=6t9Alz+wboY0ibkWiGrdMtyvH92Aop+RaWQ1xi1+sC91MhZ0aUcbuVaJUxXs3uly+W
 a7hLJkKXlZXqvstvCZWix31Osjzs2Rd/cSYB/QvCPtgeExjp+6YT3gHptywjJaxQ2PJC
 WH0efk6/m64+HSJIubkN2q4Vj0JptX7Yk6FA6VIng4UAGlq0a1E/w6eiq6VAz1iG64XP
 CKe+NIZzF8O3D16iP6yxMBscYTlVgImXfYf121AJhI3q+HId7kvGc1lCWBtrPaMr7PY4
 WmTaff1TpgSIbv2y0C70ng85VHWKefQd+fYIMGxaUReY5hTbPRx+qK+VDVeKfohzhL34
 CSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9pnlbITuVpJUwNdSd0SaGkJdrxKjsKAsFPP5aO3uGVw=;
 b=JmNGijRRWmlQ+GSBF3LCsw6lSK3bj1pv9I3lr7slHn4zqpNYFU52P7OXw/WJPhM6DU
 NbLxfpN7wOPBXaCFKLY/5Aqef5w3aKkWgdIPKWYRPz3q/E4zLVKSTP4dhSnQIaVCn5+k
 EsaR+QIpdYAb3v8Uw8ZUnrpOHfxiFML3LItm6Q12TDb/d9nrCIbUuBfXBNR+O5E/LZhp
 VxCoY2Co9Xoa4rVZvrqRENZaGQuJapLm8SuEpp5AhHJUupLJ83hqJoqaCWuebEDXrwBc
 pPHqSolhKib4QzvjwaazsMXahr35+HS2QlkWsV432rzTX9Kl8Uo0Y0XesWcJGX43Zu/f
 Wsdg==
X-Gm-Message-State: AOAM531ep+hJBV/TSUWA1XX9HDCjC+msFuFjRmMzK9tpvfE1kB/ijFsN
 ge+3XlRC4v6FFGvQoUoXCTMS
X-Google-Smtp-Source: ABdhPJz3djfbgVSZ0pOidrizkmnfr2ZYqx+IRy9AFN5dcTJXWXFIKKu/T/P8eiAXbWC7D/7ArE2Utw==
X-Received: by 2002:a17:903:2288:b0:15e:8da2:fcc0 with SMTP id
 b8-20020a170903228800b0015e8da2fcc0mr20034170plh.125.1651650036722; 
 Wed, 04 May 2022 00:40:36 -0700 (PDT)
Received: from localhost ([139.177.225.233]) by smtp.gmail.com with ESMTPSA id
 v24-20020a170902e8d800b0015ea8b4b8f3sm4575778plg.263.2022.05.04.00.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:40:35 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 0/8] Support exporting BDSs via VDUSE
Date: Wed,  4 May 2022 15:40:43 +0800
Message-Id: <20220504074051.90-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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

Since we don't support vdpa-blk in QEMU currently, the VM case is
tested with my previous patchset [2].

[1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg797569.html

Please review, thanks!

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
  block-backend: Introduce blk_get_guest_block_size()
  block/export: Abstract out the logic of virtio-blk I/O process
  linux-headers: Add vduse.h
  libvduse: Add VDUSE (vDPA Device in Userspace) library
  vduse-blk: Implement vduse-blk export
  vduse-blk: Add vduse-blk resize support
  libvduse: Add support for reconnecting

 MAINTAINERS                                 |    9 +
 block/block-backend.c                       |    8 +-
 block/export/export.c                       |    6 +
 block/export/meson.build                    |    7 +-
 block/export/vduse-blk.c                    |  346 +++++
 block/export/vduse-blk.h                    |   20 +
 block/export/vhost-user-blk-server.c        |  249 +---
 block/export/virtio-blk-handler.c           |  237 ++++
 block/export/virtio-blk-handler.h           |   33 +
 include/sysemu/block-backend-io.h           |    1 +
 linux-headers/linux/vduse.h                 |  306 ++++
 meson.build                                 |   28 +
 meson_options.txt                           |    4 +
 qapi/block-export.json                      |   25 +-
 scripts/meson-buildoptions.sh               |    7 +
 scripts/update-linux-headers.sh             |    2 +-
 subprojects/libvduse/include/atomic.h       |    1 +
 subprojects/libvduse/include/compiler.h     |    1 +
 subprojects/libvduse/libvduse.c             | 1386 +++++++++++++++++++
 subprojects/libvduse/libvduse.h             |  247 ++++
 subprojects/libvduse/linux-headers/linux    |    1 +
 subprojects/libvduse/meson.build            |   10 +
 subprojects/libvduse/standard-headers/linux |    1 +
 23 files changed, 2695 insertions(+), 240 deletions(-)
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


