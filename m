Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0903495D6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:42:25 +0100 (CET)
Received: from localhost ([::1]:56324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPS7s-0006Ya-Nl
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lPS2U-00006q-RF
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:36:50 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:36366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lPS2S-0006rX-Hf
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:36:50 -0400
Received: by mail-lj1-x235.google.com with SMTP id z25so3709916lja.3
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSQWETIvRtaZPMPD5EIlaKK4DU6in0RfbG4bZpUUghE=;
 b=Es2tvxjIHX1ggdO4DS0YPc0KRe4BM9SiQZPXgIo6m3R22GvygXgG1hJ5/jJChO4ou9
 SAwcljHnZTZl9VQ2tX1jHI35avgRquZ++eX9mAhrB0dNfeys3KWE3GEzXGWfuapPGhCq
 qbB3cMb1W0AuwykZkS4URcndXE2a4Wd+shmAROb72eRxns11xYdycXKznucPAaXgs4Wt
 BAzJPqDUpW8vebb7cno9ydz5YjWxws57yKpjAC+1bFEPw2Mn27o2R1PFi46zHsouG2i3
 vHziDA7qhK0B4wb8hv60ZxmAsRiAeNqkQJDuwA4LhxbPaYtFgx9KNrOuJz2yH64iGNlD
 Xv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YSQWETIvRtaZPMPD5EIlaKK4DU6in0RfbG4bZpUUghE=;
 b=pk02QqYprzQb9hPa9WMAsQfmwUiUhblqGO07go6o0nZsQ1s+/oHHzXYjv1IfD051h3
 2SLpSE4O7++6D3ej1P2p6NQfqAkTB4DbElG9lWoLzzV/zxXFi2jQXBdxpX/JDn9G63Tq
 R39itA2PSk4nvrTsQ9Pvus5s/Yt6PIaoHeWphS0G/F6dy1+551B/lnCBuA+Tr2pAOKO2
 NWtoSodbsCpmwn8xPKNVC96aV6rA+QRCqLhivzJAAUGNpT7VpNd+USa/odXd5uK4bhZG
 pvU1vqF3Vj9vCudpFsKI8f0teHb3eHLl2Z89FRoowwkQl0TfIwovlL3E2wQNi5WzC6Ub
 axqA==
X-Gm-Message-State: AOAM533PPHyxu/V4g5I/8RRM02IIVdLTdI3d4Ld7Mk/MO9o42thoPCRS
 y0yH61hd8OOYipSww41kAfL0ug==
X-Google-Smtp-Source: ABdhPJxs2AxuqoXzKdPqQv/VH0jm5KeiLsZmDDe2+uYyosRv2dBJUXQJeMR7+80bQQ0iUMnHSHeUDg==
X-Received: by 2002:a2e:968c:: with SMTP id q12mr5948803lji.317.1616686606180; 
 Thu, 25 Mar 2021 08:36:46 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id w23sm796694lji.127.2021.03.25.08.36.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:36:45 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v5 0/7] eBPF RSS support for virtio-net
Date: Thu, 25 Mar 2021 17:35:22 +0200
Message-Id: <20210325153529.75831-1-andrew@daynix.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::235;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This set of patches introduces the usage of eBPF for packet steering
and RSS hash calculation:
* RSS(Receive Side Scaling) is used to distribute network packets to
guest virtqueues by calculating packet hash
* Additionally adding support for the usage of RSS with vhost

The eBPF works on kernels 5.8+
On earlier kerneld it fails to load and the RSS feature is reported
only without vhost and implemented in 'in-qemu' software.

Implementation notes:
Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.
Added libbpf dependency and eBPF support.
The eBPF program is part of the qemu and presented as an array
of BPF ELF file data. The eBPF array file initially generated by bpftool.
The compilation of eBPF is not part of QEMU build and can be done
using provided Makefile.ebpf.
Added changes to virtio-net and vhost, primary eBPF RSS is used.
'in-qemu' RSS used in the case of hash population and as a fallback option.
For vhost, the hash population feature is not reported to the guest.

Please also see the documentation in PATCH 6/7.

Known issues:
* hash population not supported by eBPF RSS: 'in-qemu' RSS used
as a fallback, also, hash population feature is not reported to guests
with vhost.
* IPv6 extensions still in progress.

Changes since v1:
* using libbpf instead of direct 'bpf' system call.
* added libbpf dependency to the configure/meson scripts.
* changed python script for eBPF .h file generation.
* changed eBPF program - reading L3 proto from ethernet frame.
* added TUNSETSTEERINGEBPF define for TUN.
* changed the maintainer's info.
* added license headers.
* refactored code.

Changes since v2:
* using bpftool for eBPF skeleton generation.
* ebpf_rss is refactored to use skeleton generated by bpftool.
* added/adjasted license in comment sections and in eBPF file.
* rss.bpf.c and Makefile.ebpf moved to the tool/ebpf folder.
* virtio-net eBPF rss refactored. Now eBPF initialized during realize().

Changes since v3:
* rebased to last master.
* fixed issue with failed build without libbpf.
* fixed ebpf loading without rss option.
* refactored labels in ebpf_rss.c

Changes since v4:
* refactored configure/meson script.
* added checks for load_bytes in ebpf.
* documentation added to the index.
* refactored Makefile and rss.bpf.c.
* rebased to last master.

Andrew (7):
  net/tap: Added TUNSETSTEERINGEBPF code.
  net: Added SetSteeringEBPF method for NetClientState.
  ebpf: Added eBPF RSS program.
  ebpf: Added eBPF RSS loader.
  virtio-net: Added eBPF RSS to virtio-net.
  docs: Added eBPF documentation.
  MAINTAINERS: Added eBPF maintainers information.

 MAINTAINERS                    |   8 +
 configure                      |   8 +-
 docs/devel/ebpf_rss.rst        | 125 ++++++++
 docs/devel/index.rst           |   1 +
 ebpf/ebpf_rss-stub.c           |  40 +++
 ebpf/ebpf_rss.c                | 165 ++++++++++
 ebpf/ebpf_rss.h                |  44 +++
 ebpf/meson.build               |   1 +
 ebpf/rss.bpf.skeleton.h        | 423 +++++++++++++++++++++++++
 ebpf/trace-events              |   4 +
 ebpf/trace.h                   |   2 +
 hw/net/vhost_net.c             |   3 +
 hw/net/virtio-net.c            | 115 ++++++-
 include/hw/virtio/virtio-net.h |   4 +
 include/net/net.h              |   2 +
 meson.build                    |   9 +
 meson_options.txt              |   2 +
 net/tap-bsd.c                  |   5 +
 net/tap-linux.c                |  13 +
 net/tap-linux.h                |   1 +
 net/tap-solaris.c              |   5 +
 net/tap-stub.c                 |   5 +
 net/tap.c                      |   9 +
 net/tap_int.h                  |   1 +
 net/vhost-vdpa.c               |   2 +
 tools/ebpf/Makefile.ebpf       |  22 ++
 tools/ebpf/rss.bpf.c           | 552 +++++++++++++++++++++++++++++++++
 27 files changed, 1567 insertions(+), 4 deletions(-)
 create mode 100644 docs/devel/ebpf_rss.rst
 create mode 100644 ebpf/ebpf_rss-stub.c
 create mode 100644 ebpf/ebpf_rss.c
 create mode 100644 ebpf/ebpf_rss.h
 create mode 100644 ebpf/meson.build
 create mode 100644 ebpf/rss.bpf.skeleton.h
 create mode 100644 ebpf/trace-events
 create mode 100644 ebpf/trace.h
 create mode 100755 tools/ebpf/Makefile.ebpf
 create mode 100644 tools/ebpf/rss.bpf.c

-- 
2.31.0


