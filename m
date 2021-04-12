Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1B835BC23
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:28:34 +0200 (CEST)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVrvt-00075F-Su
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lVruH-0005d3-2y
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:26:53 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:33522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lVruF-0001re-7n
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:26:52 -0400
Received: by mail-lf1-x12b.google.com with SMTP id w8so11486803lfr.0
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/AL6BXcgtYit7e5Awn1LIXudTmk+uQ8r7Mv3JSMS3U=;
 b=afDIFrXMB2rnwRwXZ0WIkjbYE6F6ue6A+pcXdynmxAVIZ1OqtrXjuUHpLbqpZspJn4
 ffvYNC3aREbC7nKcfgUe11fnmO/8tRPSs/jHdaftyCMT0rWLX8M//eiI/3gZMAAxXaKL
 QVXwIcJEqIm7MV/0mM67OUGiX+2MBcvN42NYo906fxn47bb0/ahKBa7UIbfDuGXwhCyM
 S8wu07cgHDE0afFMeJLL+hEnvUgQ5tOMEAwMA1xIMo0Jve7Q86jUAPPbLBuJVwqm73A2
 eFOacFUUZQaTrVYjTZRf7TO3CJP2TBXO6rrhHL53DZv+BDo2Jh7gT9FdfBSrwtp/ob7E
 huhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/AL6BXcgtYit7e5Awn1LIXudTmk+uQ8r7Mv3JSMS3U=;
 b=J5nryOnku2V2gpsLTyW419PvpZThAl8NQUIJSI6jwSMaUrgmJPN3JLRbzJfZ60Q3qP
 an41XcKO1zQIz1eegRPU/vqhOgBZ8s7N514z4CoaeppOczEZZ7RFoQprVumvSej8Q3fY
 hThZwVohIoWpV+4iQU6E925AYlK5lX38jssxNYoN/KVjPCBdpbhSJuOApL8W03J5XYWH
 XULDe7nlz20pQuLkLfeiDCJSmg+Pk+7Mqw6ZY9H9GDDLVG+1E++cXmWriV/zSFG8ncUh
 XAYbCmnlP3j7tKRB/8L1zRkbo+IQwKRQWYtRttyieMn+KOm9ZUdeONP+OtfMg37O0hi7
 ysfg==
X-Gm-Message-State: AOAM531NcmliUNsZ83wOTqJhH0Ej38jvxyT40r4BGGcYTvUq+DZlOpvk
 rjysfljakNBE7AIio7EtcUnqXA==
X-Google-Smtp-Source: ABdhPJwm4Iu/Me9mytuV0FSELmfkLR1iR0eVdNU1V1612AMwJZQW6xwTXJPn1XuIa5qSGFkK1l6Cww==
X-Received: by 2002:ac2:58d1:: with SMTP id u17mr18920160lfo.440.1618216008842; 
 Mon, 12 Apr 2021 01:26:48 -0700 (PDT)
Received: from localhost.localdomain (128-124-64-30.mobile.vf-ua.net.
 [128.124.64.30])
 by smtp.gmail.com with ESMTPSA id n22sm2679702ljc.23.2021.04.12.01.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 01:26:48 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v6 0/7] eBPF RSS support for virtio-net
Date: Mon, 12 Apr 2021 11:25:05 +0300
Message-Id: <20210412082512.14998-1-andrew@daynix.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12b;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12b.google.com
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
 tools/ebpf/rss.bpf.c           | 569 +++++++++++++++++++++++++++++++++
 27 files changed, 1592 insertions(+), 4 deletions(-)
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


