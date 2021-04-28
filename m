Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B44736DD9B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:54:36 +0200 (CEST)
Received: from localhost ([::1]:45474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnSN-0000Ph-GH
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLr-00045K-TG
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:51 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:34644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLm-0006gR-V8
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:51 -0400
Received: by mail-lj1-x22e.google.com with SMTP id o5so39944424ljc.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ri1D87PooVqTAv17ZFucWpjGQl9CnT5+KR8nIrs0nbY=;
 b=M6wg1z328DoaCsMjv3kivUNQFSLuMv59mqoAvvphAErBTX/bjYr1cRflJ9+53TklSx
 MOub6fEgulToTHualF5Mi1Bv2XvzyWiA9k7sbHiUu7YWkRoi5eRyOyJJmchil4lPUTJ0
 fegK6KI1EHd85zXRb9OGllM6kTpWvJOl3rP3CET5Dunx2FM6Mbd2jM6nnqjaiE7USzBr
 eoQ5ETYNf3OmwNvO5jR0kW7Q6nhpTi9OWLVXH41Lb3S36gKyJjFMTiMpWdytcO7r10Zz
 vfiA4XFWdeP78LbfROrI8WCSbqvWV7uANiceIRyU7hoipwrqQ5DJfct/b8w+W8DQbehw
 dk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ri1D87PooVqTAv17ZFucWpjGQl9CnT5+KR8nIrs0nbY=;
 b=Z6MGa48uoYRZ49Qzi8Dk4Af335wcjsPYePNzO6rE1+ziJ9jvvj0XbgIW+wU5A9y4T5
 k9KQpsh4bUosOp+F8qoy4QLvyGxe8Y+LTcqjqHct5GSMbUPowqNNek7/H3AZi4Aheqpx
 c/MNN0MuVDXCJEbFD5J112J/ZQb4oygPxLCpgDwGxbggRE6F9BiPlt6nO4hJtW+cPGh7
 kc6f0/cySnBMO00ET5GzU0E8vpI2C9jPKjGVBRcLYx/a61uXVxi2julJVtZAchdQWNId
 8sCJ0Du3jl6dgFvzYj0n6iVo1hNj0VLrLqxD3lzzaa8QgqNpg6n7yEAP0hbGCLBmTax+
 ayYA==
X-Gm-Message-State: AOAM532nPk1ehXU2chUHt1T7SfWpW+J8whvOqlDl57NkUck7JyYekj47
 hmrUFLQ0E2bIU82OsCb70gUtQA==
X-Google-Smtp-Source: ABdhPJxIIOxaQbHghOc3rxc2/R7Hs37kKsjBiMu5msd9wdiERMlZ2yN7r9gGvFAIlK52g3LmZLnKug==
X-Received: by 2002:a2e:a60c:: with SMTP id v12mr22167799ljp.310.1619628462786; 
 Wed, 28 Apr 2021 09:47:42 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id v24sm86302lfp.195.2021.04.28.09.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:47:42 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v7 0/7] eBPF RSS support for virtio-net.
Date: Wed, 28 Apr 2021 19:47:26 +0300
Message-Id: <20210428164733.56547-1-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
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
 ebpf/rss.bpf.skeleton.h        | 431 +++++++++++++++++++++++++
 ebpf/trace-events              |   4 +
 ebpf/trace.h                   |   2 +
 hw/net/vhost_net.c             |   3 +
 hw/net/virtio-net.c            | 115 ++++++-
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
 tools/ebpf/rss.bpf.c           | 569 +++++++++++++++++++++++++++++++++
 27 files changed, 1606 insertions(+), 4 deletions(-)
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


