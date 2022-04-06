Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC7F4F5733
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 10:04:16 +0200 (CEST)
Received: from localhost ([::1]:51474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc0eE-0005UA-N3
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 04:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nc0ZU-00034h-Mc
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:59:21 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nc0ZQ-0002hm-Bh
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 03:59:18 -0400
Received: by mail-pf1-x429.google.com with SMTP id j17so309882pfi.9
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 00:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oIVEls2pYy+t7gZpg9SibDCjUb0Lgqc3j9XW2R0GRgg=;
 b=oGzlUD8KdbR2VTa+8Mr7aSaZ81VbcIwYspTm5hBbsiTYc0FseTgroHLzYsUdyPEdff
 oeN3shUhH9Tdji8C1dL9S4ebh9lxtlA2Rj0qH4RLO2tkK/dNYyeUMLD3bMJ/L/OdvASf
 rlD1tLanIlCs7pOuBrPzt/O1cEu1W+E5zImT0d8DOTYOU/Z6OYwG9uIWlwWiE0TYmJpq
 i9xrlSmxoy2pgszGwnE9M1wIsMt+E170dbFP36AHfYou1lxCwUJLn5UhbZ4/dTUbpc0+
 0G7XaNs/maEFL6R63FLMw0BY8T1Zu6pKMa9pOI1k/7LVT/miOeJlhQjKlClbk97FNRpW
 FWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oIVEls2pYy+t7gZpg9SibDCjUb0Lgqc3j9XW2R0GRgg=;
 b=Hx0r6eDDBhzpgVxfEVuSI1yvIDnjeCdXnjsT3YdPCbTEswXTpQWzb1t3doDt/dDA0T
 VovFA/ExIim0PUwuMg5q8MCCYM7X07H4P+vFAZBczpxZVC6da3Vj7I8GASo0RVgLhqD4
 +gTqi3O3pWtzqBDBi2fuev21XarbjfScUj1xwgNNcjniGYyETfMOTzMsO/3naH1r7qiD
 EvMnZ7H1uy3vffDjEW0526H4DAiPf+mNhR8s0pPmEKepYowxR4/02fASS68H32K6yox1
 jaHkC4qAPoZ+p0aI5OWclqxZOsUrIerDyyiXPtzyJctZWVIK188p/I5xbIfHkqYMSyCW
 ys+g==
X-Gm-Message-State: AOAM5302V81woPoYzMO67bl/T1yZeajufV7A0lgUGgvaW9BB/2Yc5xeh
 +hdk7KrEWySIM/eAmbb71/0v
X-Google-Smtp-Source: ABdhPJyyo+8XqVD0FO8Ii8tLUwdejRiLsXf3FEONWwiW8QgFo9zlsgJFNvQ8D7hBQ8EnjtHRAKlYDw==
X-Received: by 2002:a63:5b4b:0:b0:382:9344:7224 with SMTP id
 l11-20020a635b4b000000b0038293447224mr6029942pgm.28.1649231953188; 
 Wed, 06 Apr 2022 00:59:13 -0700 (PDT)
Received: from localhost ([139.177.225.247]) by smtp.gmail.com with ESMTPSA id
 y13-20020a17090a390d00b001c995e0a481sm4811297pjb.30.2022.04.06.00.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:59:12 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com
Subject: [PATCH v4 0/6] Support exporting BDSs via VDUSE
Date: Wed,  6 Apr 2022 15:59:15 +0800
Message-Id: <20220406075921.105-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=xieyongji@bytedance.com; helo=mail-pf1-x429.google.com
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
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

Xie Yongji (6):
  block: Support passing NULL ops to blk_set_dev_ops()
  linux-headers: Add vduse.h
  libvduse: Add VDUSE (vDPA Device in Userspace) library
  vduse-blk: implements vduse-blk export
  vduse-blk: Add vduse-blk resize support
  libvduse: Add support for reconnecting

 MAINTAINERS                                 |    7 +
 block/block-backend.c                       |    2 +-
 block/export/export.c                       |    6 +
 block/export/meson.build                    |    5 +
 block/export/vduse-blk.c                    |  459 ++++++
 block/export/vduse-blk.h                    |   20 +
 linux-headers/linux/vduse.h                 |  306 ++++
 meson.build                                 |   28 +
 meson_options.txt                           |    4 +
 qapi/block-export.json                      |   25 +-
 scripts/meson-buildoptions.sh               |    7 +
 scripts/update-linux-headers.sh             |    2 +-
 subprojects/libvduse/include/atomic.h       |    1 +
 subprojects/libvduse/libvduse.c             | 1386 +++++++++++++++++++
 subprojects/libvduse/libvduse.h             |  247 ++++
 subprojects/libvduse/linux-headers/linux    |    1 +
 subprojects/libvduse/meson.build            |   10 +
 subprojects/libvduse/standard-headers/linux |    1 +
 18 files changed, 2513 insertions(+), 4 deletions(-)
 create mode 100644 block/export/vduse-blk.c
 create mode 100644 block/export/vduse-blk.h
 create mode 100644 linux-headers/linux/vduse.h
 create mode 120000 subprojects/libvduse/include/atomic.h
 create mode 100644 subprojects/libvduse/libvduse.c
 create mode 100644 subprojects/libvduse/libvduse.h
 create mode 120000 subprojects/libvduse/linux-headers/linux
 create mode 100644 subprojects/libvduse/meson.build
 create mode 120000 subprojects/libvduse/standard-headers/linux

-- 
2.20.1


