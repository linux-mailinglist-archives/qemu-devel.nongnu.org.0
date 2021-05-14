Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3F03808E3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 13:50:18 +0200 (CEST)
Received: from localhost ([::1]:39184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWKf-0004Bh-Qh
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 07:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lhWJI-0002Ia-Rl
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:48:53 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:42693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lhWJG-0004mP-U5
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:48:52 -0400
Received: by mail-lj1-x230.google.com with SMTP id w4so37532912ljw.9
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 04:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1DdHIKAGfSVS7Be5q0elRQOCU16P3zsbimZW9N2lQNE=;
 b=AaqE3KQPQuIF/lwMrWP0jrQLO9UsK8KqslBKbzI1O1rKDxcB5zAXrJO2AMZc36Axgn
 QrN2S8uCGdnzYgdQlD8z01ZlScpkcqB9JRz5XFb8HsgAn2p31MER8EqZpDw+HOYmqVj0
 BMcOm4F4zwYj5PFHQh3tzztgDCsJX+kFT2tXEpLyTun+xzUz5nqQ04TFtDKT32xCKjd6
 hHXCMwRkx02Oog4BGGSMtEbCcjwS9o7EaM2TZm/lUXNbgjMUfdSwj2GtDxnK32i8wx7u
 RZmjd4KhQMtJ7cfHab1+BEPq5N51rsWczeaISYg05WCPMUQXJJRxHeMUC0NTO9hUDW8q
 WiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1DdHIKAGfSVS7Be5q0elRQOCU16P3zsbimZW9N2lQNE=;
 b=H4arxhi7QikVfsQXQbiZptjzpq1HJKtBKaHkuF1q0ns2ihHs6vKYCT0XuaRJHTFS75
 qSxgdjrgVW0h7MO10KNyoKaHt3cK3IhupH+eQeg/Ay95CYmI1JZIsOnAuaZSSjl1u5Hc
 yactwglYbyLU2FSf0dbi0HfQfpOwHnBR59HO/t6wTZ95iM0WOlT9zynxcZN4t8C5GJrj
 dN5gYVRMtkUd+QxDk6dMpUAemFehsF9y3HbRQyyfQCCtZzmFDsqj3RI9euYebXO3Azxc
 VhPe+eAcCpQAVAdaP60lM6bV6oxk4LvblS4fUieCE5iCAzlu7nvGrEedwi+oLdSD7/Al
 N/zg==
X-Gm-Message-State: AOAM530fHuSiMZJw+c+YQD3QOi39mF+96330LXFhZzyYorkrRnygZzLG
 joX3TCeF0dJTtdReeVphuCBESQ==
X-Google-Smtp-Source: ABdhPJxi1G8XKmfHLLim8W2F+pIdstD7bKwuqsZrsSO+EeWHack6IDtXIPFZweheAxpWnycnEbmvMw==
X-Received: by 2002:a2e:5347:: with SMTP id t7mr30238403ljd.464.1620992928577; 
 Fri, 14 May 2021 04:48:48 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id t13sm583421lfc.57.2021.05.14.04.48.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 04:48:48 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v8 0/7] eBPF RSS support for virtio-net.
Date: Fri, 14 May 2021 14:48:28 +0300
Message-Id: <20210514114835.267316-1-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::230;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x230.google.com
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

Changes since v5:
* fixed issue with dstopt parsing in the eBPF program.
* added fragment packet parsing to skip L4.

Changes since v6:
* Added eBPF skeleton check to the meson.build file.

Changes since v7:
* Refactored code style and fixed warnings.
* Added explicit pkg-config method for libbpf dependency.

Andrew Melnychenko (7):
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
 ebpf/rss.bpf.skeleton.h        | 431 +++++++++++++++++++++++++
 ebpf/trace-events              |   4 +
 ebpf/trace.h                   |   2 +
 hw/net/vhost_net.c             |   3 +
 hw/net/virtio-net.c            | 116 ++++++-
 include/hw/virtio/virtio-net.h |   4 +
 include/net/net.h              |   2 +
 meson.build                    |  23 ++
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
 tools/ebpf/rss.bpf.c           | 571 +++++++++++++++++++++++++++++++++
 27 files changed, 1609 insertions(+), 4 deletions(-)
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
2.31.1


