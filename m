Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C212F6C76
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 21:49:24 +0100 (CET)
Received: from localhost ([::1]:45486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l09YZ-0000YV-Qw
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 15:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l09SJ-0003ka-Ea
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:42:56 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:43929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1l09S6-0004in-Il
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 15:42:54 -0500
Received: by mail-lj1-x232.google.com with SMTP id e7so7980299ljg.10
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 12:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbYZjgJUkqWlfkmxRrFRu3GDR3wJQ/wTZC+7XoqVhqQ=;
 b=tnh1CFJ3PtdI9TPnUCeN+ipQ6jpK2V0unhM1pMJRJT24RwyTg3IOmPKd1A/CvBeGnm
 pE+slQfZtRG+nZM3u+Rn5n+POzYn43O27mVob0FITw2NhR0Wp7LZgOK6FhqZEpwOlE2P
 04Wytu31G1edePmBWr2ePCIKKabC2/orKUd9W7yir4I9p/R9hA1EY4th1VIHh8Jg/d92
 vWcZSefQNmUHoaRIQ47S3mnxWr0Iwk5qMfPwDf/SwQtipk4hwkBGJjZmV/YISE3wgE/V
 tNoWxYy6off6LR4hwOccbYS2a1Motpn6iFKfmlJzSFCCguZLBAhHaYj3BSqC0eKwxQxe
 boAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IbYZjgJUkqWlfkmxRrFRu3GDR3wJQ/wTZC+7XoqVhqQ=;
 b=GJiW5Azim2p+bZEAdwa4RfCe45mysPGl6JupK0RaJyoN1TcSWVqAu0aoKyXBaIWpbk
 KaEUV12n5detKvbh48rV8BVYNlB0r9stwCPDCASQyc6N8DqoEnUhIPjVBAjdklZaEeec
 Yjqz4BbEfFgM+P4SCrP6wP8w5SdK5jhbcbFhjuuQcZJ9pjiKFh0T0u1Xomsrg+LndrcG
 HrnooLwIsHuoj6DEzdchFkD62Akl7bHxU9aloEjRCYResgnE3/kg8dyr2ER8kcLvaWOI
 QY+YWCIqMd9pQll1tAob40biJU0NWNAnrXJD+g00yHICBhfWQbJxN3zLRD5n3Wp0Vm0g
 l4+A==
X-Gm-Message-State: AOAM530V+uB108nAReKDpdIUiO2pMNqpQHPahxQ1YggkE2u3byDPviDg
 bfumpgTpXZi+tLrOVWZQIYXxYw==
X-Google-Smtp-Source: ABdhPJwjtGU8ps12d0zH1M35BT5gT+L8iYIk0/Jmx1xf6VtEc4FhJ+qLMqx5aSwYRPr8FQoghD7+Nw==
X-Received: by 2002:a2e:b5d9:: with SMTP id g25mr3837602ljn.471.1610656959033; 
 Thu, 14 Jan 2021 12:42:39 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id t20sm565833ljk.58.2021.01.14.12.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 12:42:38 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [RFC PATCH v3 0/6] eBPF RSS support for virtio-net
Date: Thu, 14 Jan 2021 23:16:06 +0200
Message-Id: <20210114211612.387052-1-andrew@daynix.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::232;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Andrew (6):
  net/tap: Added TUNSETSTEERINGEBPF code.
  net: Added SetSteeringEBPF method for NetClientState.
  ebpf: Added eBPF RSS program.
  ebpf: Added eBPF RSS loader.
  virtio-net: Added eBPF RSS to virtio-net.
  docs: Added eBPF documentation.

 MAINTAINERS                    |   8 +
 configure                      |  33 +++
 docs/ebpf_rss.rst              | 125 ++++++++
 ebpf/ebpf_rss-stub.c           |  40 +++
 ebpf/ebpf_rss.c                | 165 +++++++++++
 ebpf/ebpf_rss.h                |  44 +++
 ebpf/meson.build               |   1 +
 ebpf/rss.bpf.skeleton.h        | 397 ++++++++++++++++++++++++++
 ebpf/trace-events              |   4 +
 ebpf/trace.h                   |   2 +
 hw/net/vhost_net.c             |   2 +
 hw/net/virtio-net.c            | 125 +++++++-
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
 25 files changed, 1540 insertions(+), 4 deletions(-)
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


