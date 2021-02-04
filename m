Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4967130F82B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:40:43 +0100 (CET)
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hgQ-0007sD-6L
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:40:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l7hbk-0002yJ-K3
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:35:52 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:32890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l7hbi-0002Sn-EN
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:35:52 -0500
Received: by mail-lj1-x22e.google.com with SMTP id a25so4210385ljn.0
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cTnguGGtqdyf8gWjKVQlcNWC1budaKgRqXL9sEPSx7g=;
 b=iYtOfQKKYYqxTf3OCv0seY+bbgNISpAfFy0vSyWXRiuZeFjFoOgKpCjDedVRuJdrAT
 r5Qb32Tpn0t2gTiM9sS0BhDb4aR3mkqVwEPdz/N8MuCXD8YTnluOY5ITI3F6EDFmwHPz
 BBo8JQQM9KbeK5EgtmxPOz+1phheDRK2DLiIFQlDY+V1k2gEs46R8IiraQf4xenI0pgL
 qOalQ4hmaP3TyJf4zrstQ7x4D9Rs6WoBGWp4xfdAQfkPDGCR14JwzXpKmvAL/ktCv+10
 bEbOZ1IwigiWnJYGXwA6QE26/mF8RBw1d6MCEWThgIx3BXZSp2bouwZsRVpIDgJIwc+8
 Niyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cTnguGGtqdyf8gWjKVQlcNWC1budaKgRqXL9sEPSx7g=;
 b=qb3u5cOwDNpP+PdctwYDI63FOzybpR0jsdi4oNnmrTaduTDeO0socwrZiJL3/q1a/d
 ox89uB8g3jwKA3f7UMWJPPQoim6SB+NrOjza/iUVPmfApnN+HwPVBnn8GNaR/ZJwHr9D
 gRFlsi+Pj/RGLO2GidKOYXsfqjnKXntAFlEg7WR7zkgDiNX1ale4EGobotq6chwKalbu
 dMrNCESIdPEsW7Gn1RIM01g75TXuEMdW8eQfFXdChe5S+SWDlsBTj6yI5ULnWmnPoRM9
 H9boJ0TuXItjjuCb+DBflD2Uh22Tgfr0Hs7g5oRkC/M9fWnhrbfyu4qQopyvVW67ISsQ
 etGw==
X-Gm-Message-State: AOAM530rE4KFLrq+SpGuQ5FCcu9lI4MR5cYwZxZlyNP4XxI4XCmFtQ5/
 4RSOlRmjZtwDVpSnev8VvztF1A==
X-Google-Smtp-Source: ABdhPJw/UJU9l+YIg6IpT4LGeJvYFhzDP1I6jKXeZzP7o5Rna8sBeqp7BK7NWgs1gkHq78EkY2pbTQ==
X-Received: by 2002:a2e:a593:: with SMTP id m19mr131940ljp.1.1612456543060;
 Thu, 04 Feb 2021 08:35:43 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id c123sm668172lfd.95.2021.02.04.08.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 08:35:42 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v4 0/7] eBPF RSS support for virtio-net
Date: Thu,  4 Feb 2021 19:09:44 +0200
Message-Id: <20210204170951.91805-1-andrew@daynix.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22e;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x22e.google.com
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
using provided Makefile.ebpf(need to adjust 'linuxhdrs').
Added changes to virtio-net and vhost, primary eBPF RSS is used.
'in-qemu' RSS used in the case of hash population and as a fallback option.
For vhost, the hash population feature is not reported to the guest.

Please also see the documentation in PATCH 6/6.

I am sending those patches as RFC to initiate the discussions and get
feedback on the following points:
* Fallback when eBPF is not supported by the kernel
* Live migration to the kernel that doesn't have eBPF support
* Integration with current QEMU build
* Additional usage for eBPF for packet filtering

Known issues:
* hash population not supported by eBPF RSS: 'in-qemu' RSS used
as a fallback, also, hash population feature is not reported to guests
with vhost.

Changes since v1:
* using libbpf instead of direct 'bpf' system call.
* added libbpf dependency to the configure/meson scripts.
* changed python script for eBPF .h file generation.
* changed eBPF program - reading L3 proto from ethernet frame.
* added TUNSETSTEERINGEBPF define for TUN.
* changed the maintainer's info.
* added license headers.
* refactored code.Changes since v1:
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
* fixed issue with failed build without libebpf.
* fixed ebpf loading without rss option.
* refactored labels in ebpf_rss.c

Andrew (7):
  net/tap: Added TUNSETSTEERINGEBPF code.
  net: Added SetSteeringEBPF method for NetClientState.
  ebpf: Added eBPF RSS program.
  ebpf: Added eBPF RSS loader.
  virtio-net: Added eBPF RSS to virtio-net.
  docs: Added eBPF documentation.
  MAINTAINERS: Added eBPF maintainers information.

 MAINTAINERS                    |   8 +
 configure                      |  30 ++
 docs/ebpf_rss.rst              | 125 ++++++++
 ebpf/ebpf_rss-stub.c           |  40 +++
 ebpf/ebpf_rss.c                | 165 +++++++++++
 ebpf/ebpf_rss.h                |  44 +++
 ebpf/meson.build               |   1 +
 ebpf/rss.bpf.skeleton.h        | 397 ++++++++++++++++++++++++++
 ebpf/trace-events              |   4 +
 ebpf/trace.h                   |   2 +
 hw/net/vhost_net.c             |   2 +
 hw/net/virtio-net.c            | 129 ++++++++-
 include/hw/virtio/virtio-net.h |   4 +
 include/net/net.h              |   2 +
 meson.build                    |  13 +
 net/tap-bsd.c                  |   5 +
 net/tap-linux.c                |  13 +
 net/tap-linux.h                |   1 +
 net/tap-solaris.c              |   5 +
 net/tap-stub.c                 |   5 +
 net/tap.c                      |   9 +
 net/tap_int.h                  |   1 +
 net/vhost-vdpa.c               |   2 +
 tools/ebpf/Makefile.ebpf       |  33 +++
 tools/ebpf/rss.bpf.c           | 505 +++++++++++++++++++++++++++++++++
 25 files changed, 1541 insertions(+), 4 deletions(-)
 create mode 100644 docs/ebpf_rss.rst
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
2.30.0


