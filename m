Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 853B64E2129
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 08:20:54 +0100 (CET)
Received: from localhost ([::1]:43504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWCLU-0000AE-KK
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 03:20:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nWCGV-0005yT-6U
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:15:43 -0400
Received: from [2607:f8b0:4864:20::62c] (port=41497
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nWCGQ-00025z-UU
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 03:15:40 -0400
Received: by mail-pl1-x62c.google.com with SMTP id j13so2034946plj.8
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 00:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgdbX3bJd0pZTd7bxFc5yO308HS74ZS+YSVDigH1mIs=;
 b=DIkucM1bmHhM0g7V6EegKkDP12QEm2UhsEGQRyJzKSgu42/8M63d5cTTeRUvT/yniv
 3Fb8wfyGTrkK+C5fwG0J6zouFxrXOYgFdtRI9y/eSZpY0cQMFWN9CoNoV705mTUjd4cd
 wBXovBIZcxI48+Fbx2c1bX35BHNF8T4HGsqdMt2q/sdTmXwWbWLCTbb6OiOEVPsrcxj5
 U0LJzJOmtyp4R+FrvhjudJ3ODIINcxoa15Xf4gWQsRlUkEvlDBxuZ3kPx7cbsaTDYaut
 5TT2m3GrwB1rCzTvzvHEgrHEt8Zbsifnne2gs9Tz8cAP+Q7ugSAt+8xvKvQN4Tfv0kO+
 Na+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pgdbX3bJd0pZTd7bxFc5yO308HS74ZS+YSVDigH1mIs=;
 b=AzkDqTft+JEwzDKDpiD6JK/jyfnTQ7VYZ1tAdHse32lQLb5tpifqgN35A0C/wL2nrX
 Qr6wvd5FzYmugY/lGVwisE/I+2O7hHTPXlC7y1mVNHpHiJwMLxBS5wCa4wRWrWe1Jpuk
 XWqxAamrmY66R/7TkNxNvNZQXCxKHJvB36CHk5Ynz2X7bSIWHduMOaRbj98PPZgbVluG
 zRMCS0Fp9l3H0/A6tRcWlIkwgD7YAHvl3FcSauEFi1RVURScdbK52R98gAnt/9D03ZBT
 rNxtf505f3gpuOhx2WFp1aXUmAiK3a2t98h0viwHbVYFWBMJHPCPjz8zkwFV9aGtH0oz
 mvGw==
X-Gm-Message-State: AOAM531NGtLbzmnwpkWtLs4R0lVGkUP6cNSkh6Ha6SNgoxFoy+vlOoe4
 WMelZsLeAR9u7u2C7pVgYxm6
X-Google-Smtp-Source: ABdhPJxOfg5UJWdW4qCku2Od1P1+n3RyqBRUfJoubIV7DSeZmwPaEU9oXj8SbnA/2Q1db5drbw2a3A==
X-Received: by 2002:a17:90b:314d:b0:1bf:acde:16e5 with SMTP id
 ip13-20020a17090b314d00b001bfacde16e5mr24601097pjb.165.1647846936558; 
 Mon, 21 Mar 2022 00:15:36 -0700 (PDT)
Received: from localhost ([139.177.225.230]) by smtp.gmail.com with ESMTPSA id
 z22-20020aa78896000000b004f7b0e1b16asm19130477pfe.38.2022.03.21.00.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 00:15:36 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com
Subject: [PATCH v3 0/6] Support exporting BDSs via VDUSE
Date: Mon, 21 Mar 2022 15:14:33 +0800
Message-Id: <20220321071439.151-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 qapi/block-export.json                      |   24 +-
 scripts/meson-buildoptions.sh               |    7 +
 scripts/update-linux-headers.sh             |    2 +-
 subprojects/libvduse/include/atomic.h       |    1 +
 subprojects/libvduse/libvduse.c             | 1386 +++++++++++++++++++
 subprojects/libvduse/libvduse.h             |  247 ++++
 subprojects/libvduse/linux-headers/linux    |    1 +
 subprojects/libvduse/meson.build            |   10 +
 subprojects/libvduse/standard-headers/linux |    1 +
 18 files changed, 2512 insertions(+), 4 deletions(-)
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


