Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21B4B6A3A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 12:06:58 +0100 (CET)
Received: from localhost ([::1]:54436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJvfd-0004UQ-8U
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 06:06:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nJvZg-0001BH-Ir
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:00:48 -0500
Received: from [2607:f8b0:4864:20::62f] (port=42509
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nJvZZ-0006PV-8y
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 06:00:47 -0500
Received: by mail-pl1-x62f.google.com with SMTP id z17so12793520plb.9
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pJyNfi9Xg4L2BVEQfVxf88ijOUy1oJWXqnhUosj5ld0=;
 b=XqdN1ATA9+6X/ZN/4Kr1/yWlsiXaccIvFi5aGlYNxssoCIczKs48fRGbp7cl4tYI+C
 eL2jBlMv5tPtU48Gt9a6py3+2BI1Ai2U0qB6qkDXQkaBXfcUUAJ1Zgb6+HAnJvTr/4HV
 EOkNo1+YKPyiOIl6h0yTl22Xd2MlUkrr+F4JK8AJPv04kiZVk4YWyORywKG/dEQ7LqNp
 vhtazd8azahp/G33bGaCDr8L/c3pAXAJaZzbg5ccvUNYPp/VhLdkzGn9L5fS2Og3wT6i
 SQ56Qv2+4vrOjCbQEqK5OWVmiV7qPPPTjkUOL8eG5sgnfRFEWPu3Frjl3GxMUiCRNJfU
 bhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pJyNfi9Xg4L2BVEQfVxf88ijOUy1oJWXqnhUosj5ld0=;
 b=IBNTqE2cAJAkeUAoJZVBeFxu4ikz1PMt10rN8dZBRVywSE358kYdvE7CQDEWLY2xQW
 DQIL/VBDlmrkXQnSxjiiKVyxinPk9AmLaPnorA7LS5UcHPnUX7Saiz88CvbJb/dArCXd
 qFcxD/REyJ+01CkSOJ2O2+spTdWmp9ukqsM5bGooLW7bwzTg1xM+V8EWkVb8ZY8CFsso
 qjuCNY1Q3fK8kWCXKO71J33F2iIcHlRG158YuVBVoFMkVcCyvwnSTtDmG6aukgi68ZtC
 WiNQPD5VH6LV7I1myW/hWMsnrJsmoAORmaU5BrhBgLFA9jiFJkJ3btfIc6mJjTlPA0jP
 XNGA==
X-Gm-Message-State: AOAM531GwGVyZuafv5cPR/8Iu2jME5M+k+164F33EEhEF7wIcb1B0U1X
 7lEy3jeWYQsFje1QPBTQVISv
X-Google-Smtp-Source: ABdhPJz6lFKR3lSKXEGxF1/ko1Zj8p5GGj8fgcf1Y9ppgxRa9s2c8F2icuBkLOc8XYUm5N/x+Xq5RA==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id
 fr11mr3693542pjb.64.1644922827606; 
 Tue, 15 Feb 2022 03:00:27 -0800 (PST)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id n15sm2349844pgd.17.2022.02.15.03.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 03:00:25 -0800 (PST)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com
Subject: [PATCH v2 0/6] Support exporting BDSs via VDUSE
Date: Tue, 15 Feb 2022 18:59:37 +0800
Message-Id: <20220215105943.90-1-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
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

 block/block-backend.c                       |    2 +-
 block/export/export.c                       |    6 +
 block/export/meson.build                    |    5 +
 block/export/vduse-blk.c                    |  462 +++++++
 block/export/vduse-blk.h                    |   20 +
 linux-headers/linux/vduse.h                 |  306 +++++
 meson.build                                 |   28 +
 meson_options.txt                           |    4 +
 qapi/block-export.json                      |   24 +-
 scripts/meson-buildoptions.sh               |    7 +
 scripts/update-linux-headers.sh             |    2 +-
 subprojects/libvduse/include/atomic.h       |    1 +
 subprojects/libvduse/libvduse.c             | 1374 +++++++++++++++++++
 subprojects/libvduse/libvduse.h             |  237 ++++
 subprojects/libvduse/linux-headers/linux    |    1 +
 subprojects/libvduse/meson.build            |   10 +
 subprojects/libvduse/standard-headers/linux |    1 +
 17 files changed, 2486 insertions(+), 4 deletions(-)
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


