Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553532B904D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 11:43:54 +0100 (CET)
Received: from localhost ([::1]:56694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfhPs-0002b7-Lg
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 05:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kfhND-0000nk-MC
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:41:07 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:40465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kfhN7-0001rr-Iq
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 05:41:07 -0500
Received: by mail-lj1-x242.google.com with SMTP id x9so5702354ljc.7
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 02:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAWQ0/sW/RFBNh4GPuf7DHQi+rJJv5q/HzTKp55donA=;
 b=ECVb5n5OxswuqkEuWEabBKDHhQ2hw+5L21VdI4kzKrqLb/epxartJnL56Wq+dJpK1O
 HtgpcBWJSo6gKVKxzlcDhYXcAWxajyQ4aZVpcgLBkNAByHKS2Fvk6waPO7Njf3Rt7N1z
 gm3bIzKBtfhCuvFi/yPI3bRQPrvaYY+ymrN6NZSP8X4wnDGx5u0gE2nsfCe2zSu/myLo
 gn4HDzLlC4X0Wv8fLL6cUaXbpySj14zoe1Ze877C7yqhbc3Rvz14UzP4/6PwbwtcrNTR
 N/+lp6eJFDJZLC8odC0Cq1zoTwHEPLEZE6BD7Omp5w2Tca4L78jmbiEFj1qnYRlqEXCh
 6lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAWQ0/sW/RFBNh4GPuf7DHQi+rJJv5q/HzTKp55donA=;
 b=E19xHgTC8UR1EXayqrCu5+hM7fywCi4KScbOhZEX59k3XGfU8zCKTQuqk1dXDRGo69
 kYFsEXNXNmVsuH5dIZf/L6RowxHVDPuCg2vyogMQ4oFAt9ITRdexKIcS5f+Qh+LQJytM
 JkmP0mPFblR6OufkIuYCrtbJBppIqniXOqkPVhwR+MTYF14v9p0KZFgDjv45WJ+j32t0
 IhI6G945WT2LFoxY/0tfdid4y90UsyD+nTScMa1kJegXqsvYAtOpG5+rfGF9V2poWnJX
 55M1QHyt4nRITZ32PrZ4FWyCSJgY2fn5GKd/BxbRHUR+sUIZT8ObTWIgZxfG0O0mSp9u
 Jy6A==
X-Gm-Message-State: AOAM533Hn2LioV3jrmC5Jl/2Z9/GYgsCJoW3RHTRXw0iUuYLQ1KO6bCV
 iLFq9lNQiNyhARsSw4Nhrnv2GQ==
X-Google-Smtp-Source: ABdhPJzEqpXDR4AAIkp76esgaoRZNXp9AMZXF0Pb/dNL6WkeUtrGjJsdP0POM7qDwXqnWQ7tnKIqmw==
X-Received: by 2002:a2e:b5a5:: with SMTP id f5mr4240482ljn.37.1605782457517;
 Thu, 19 Nov 2020 02:40:57 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id h6sm3912667lfj.108.2020.11.19.02.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 02:40:56 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v2 0/5] eBPF RSS support for virtio-net
Date: Thu, 19 Nov 2020 13:13:00 +0200
Message-Id: <20201119111305.485202-1-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::242;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, qemu-devel@nongnu.org
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
of BPF ELF file data.
The compilation of eBPF is not part of QEMU build and can be done 
using provided Makefile.ebpf(need to adjust 'linuxhdrs').
Added changes to virtio-net and vhost, primary eBPF RSS is used.
'in-qemu' RSS used in the case of hash population and as a fallback option.
For vhost, the hash population feature is not reported to the guest.

Please also see the documentation in PATCH 5/5.

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
* big-endian BPF support: for now, eBPF isn't supported on
big-endian systems. Can be added in future if required.
* huge .h file with eBPF binary. The size of .h file containing
eBPF binary is currently ~5K lines, because the binary is built with debug information.
The binary without debug/BTF info can't be loaded by libbpf.
We're looking for possibilities to reduce the size of the .h files.

Changes since v1:
* using libbpf instead of direct 'bpf' system call.
* added libbpf dependency to the configure/meson scripts.
* changed python script for eBPF .h file generation.
* changed eBPF program - reading L3 proto from ethernet frame.
* added TUNSETSTEERINGEBPF define for TUN.
* changed the maintainer's info.
* added license headers.
* refactored code.

Andrew (5):
  net: Added SetSteeringEBPF method for NetClientState.
  ebpf: Added eBPF RSS program.
  ebpf: Added eBPF RSS loader.
  virtio-net: Added eBPF RSS to virtio-net.
  docs: Added eBPF RSS documentation.

 MAINTAINERS                    |    7 +
 configure                      |   33 +
 docs/ebpf_rss.rst              |  133 +
 ebpf/EbpfElf_to_C.py           |   36 +
 ebpf/Makefile.ebpf             |   33 +
 ebpf/ebpf_rss-stub.c           |   40 +
 ebpf/ebpf_rss.c                |  186 ++
 ebpf/ebpf_rss.h                |   44 +
 ebpf/meson.build               |    1 +
 ebpf/rss.bpf.c                 |  505 +++
 ebpf/tun_rss_steering.h        | 5439 ++++++++++++++++++++++++++++++++
 hw/net/vhost_net.c             |    2 +
 hw/net/virtio-net.c            |  120 +-
 include/hw/virtio/virtio-net.h |    4 +
 include/net/net.h              |    2 +
 meson.build                    |   11 +
 net/tap-bsd.c                  |    5 +
 net/tap-linux.c                |   13 +
 net/tap-linux.h                |    1 +
 net/tap-solaris.c              |    5 +
 net/tap-stub.c                 |    5 +
 net/tap.c                      |    9 +
 net/tap_int.h                  |    1 +
 net/vhost-vdpa.c               |    2 +
 24 files changed, 6633 insertions(+), 4 deletions(-)
 create mode 100644 docs/ebpf_rss.rst
 create mode 100644 ebpf/EbpfElf_to_C.py
 create mode 100755 ebpf/Makefile.ebpf
 create mode 100644 ebpf/ebpf_rss-stub.c
 create mode 100644 ebpf/ebpf_rss.c
 create mode 100644 ebpf/ebpf_rss.h
 create mode 100644 ebpf/meson.build
 create mode 100644 ebpf/rss.bpf.c
 create mode 100644 ebpf/tun_rss_steering.h

-- 
2.29.2


