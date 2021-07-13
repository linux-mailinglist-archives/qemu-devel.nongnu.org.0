Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6524B3C7364
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:39:40 +0200 (CEST)
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KVW-0003lN-Si
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m3KU3-0001pc-Lg
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:38:07 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:35839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1m3KU1-0003Jy-V3
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:38:07 -0400
Received: by mail-lf1-x12d.google.com with SMTP id i5so21204346lfe.2
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1XQV9nAQSTdvl/g+/1MtqeCnV4YcZaBnUBFLY/EXkwI=;
 b=WrlTfvCN+u9Rzwk5aCNcPFyepeIBD/HhIQgt7Xb0kAhIpHiid/JWLIFeYj7jGTOAOC
 fN09xvYGsYlKRsZKzuVuLq0yKVBTOQs8zG4o0//TaUyirl0seyq573Xk4YEAAvK9097t
 AgGEbdcRDpkLZWx1AM53pp3fr6vkM0ZqFqmxq27YcbL9oGyQeKP/nGrP5CCjHerOJR+A
 YfZwD+aQaNNgikexOP02j+l2NxV72JNd9ij2TagZZIe+1DDy2Os00rl7iaxA3CZFE86Y
 KqWUd1NzShaS8kyokh9Wuoe+WBUmdNNozWyHnlPliUifu/SecI9a8TuF8VoDz4BTt0vV
 q8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1XQV9nAQSTdvl/g+/1MtqeCnV4YcZaBnUBFLY/EXkwI=;
 b=jNMimZxVRmuMpPNDNq3wPofvxz53/BzX7+5Y7FtHjfEeSpBEFrM67xJpr+QndIWhsi
 XFe9AJkdBt7s7B/7ZYDk1YkqWyDRzKxebWyYNsFAe6iS9nD7ox5mjFlIAgXkUXclZZ5x
 E6lY7Xlbfr0tMtz3N3owJx263ZSVYhl/W2D6IQf4PzaBU3OadUZ1i7+Sy6FOkC3pBFwg
 InXcovffBLw1zQ316I+WYacWl1KuAh0wm8UFOxk0TaQoR18qBKchvbFdtOPRSOcCk5x+
 web7L2sH1kF0INeKRiNXTIpHryZEgXc4yVa/GcVzooHkS5SZwlhDDT/KNT4uPIOZfI5a
 qtmA==
X-Gm-Message-State: AOAM530uvQHKPCvXl82f6PkjYpCbuNtJgrETEyOAMyRitcyfTN53k+DC
 eD2hSuIV+/kRUbhvcqDJ2Kldkw==
X-Google-Smtp-Source: ABdhPJywrcF9cZzak2x+t6XCiKSa96pFu8tpgoEGgYFmoAFxuxRDhf19DQhLZnVelcnhDWKFUpFE+w==
X-Received: by 2002:a19:4f15:: with SMTP id d21mr3804671lfb.131.1626190682682; 
 Tue, 13 Jul 2021 08:38:02 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id i5sm131447lfv.246.2021.07.13.08.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:38:02 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
Date: Tue, 13 Jul 2021 18:37:53 +0300
Message-Id: <20210713153758.323614-1-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::12d;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x12d.google.com
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Libvirt usually launches qemu with strict permissions.
To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.

Added property "ebpf_rss_fds" for "virtio-net" that allows to
initialize eBPF RSS context with passed program & maps fds.

Added qemu-ebpf-rss-helper - simple helper that loads eBPF
context and passes fds through unix socket.
Libvirt should call the helper and pass fds to qemu through
"ebpf_rss_fds" property.

Added explicit target OS check for libbpf dependency in meson.
eBPF RSS works only with Linux TAP, so there is no reason to
build eBPF loader/helper for non-Linux.

Changed Qemu updates eBPF maps to array mmaping. Mmaping allows
bypassing unprivileged BPF map update. Also, instead of 3 maps
(config, key and indirection table) there is one map that
combines everything.

Added helper stamp. To check that helper was build with qemu,
qemu would check helper symbols that should contain the stamp.
It was done similar to qemu modules, but checking was performed
by the helper's ELF parsing.

Overall, libvirt process should not be aware of the "interface"
of eBPF RSS, it will not be aware of eBPF maps/program "type" and
their quantity. That's why qemu and the helper should be from
the same build and be "synchronized". Technically each qemu may
have its own helper. That's why "query-helper-paths" qmp command
was added. Qemu should return the path to the helper that suits
and libvirt should use "that" helper for "that" emulator.

qmp sample:
C: { "execute": "query-helper-paths" }
S: { "return": [
     {
       "name": "qemu-ebpf-rss-helper",
       "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
     }
    ]
   }

Changes since v1:
* Mmap() used instead if bpf_map_update_elem().
* Added helper stamp.

Andrew Melnychenko (5):
  ebpf: Added eBPF initialization by fds and map update.
  virtio-net: Added property to load eBPF RSS with fds.
  qmp: Added the helper stamp check.
  ebpf_rss_helper: Added helper for eBPF RSS.
  qmp: Added qemu-ebpf-rss-path command.

 ebpf/ebpf_rss-stub.c              |   6 +
 ebpf/ebpf_rss.c                   | 120 ++++---
 ebpf/ebpf_rss.h                   |   8 +-
 ebpf/qemu-ebpf-rss-helper.c       | 130 +++++++
 ebpf/rss.bpf.skeleton.h           | 557 +++++++++++++++---------------
 hw/net/virtio-net.c               |  77 ++++-
 include/hw/virtio/virtio-net.h    |   1 +
 meson.build                       |  47 ++-
 monitor/meson.build               |   1 +
 monitor/qemu-helper-stamp-utils.c | 297 ++++++++++++++++
 monitor/qemu-helper-stamp-utils.h |  24 ++
 monitor/qmp-cmds.c                |  32 ++
 qapi/misc.json                    |  33 ++
 tools/ebpf/rss.bpf.c              |  67 ++--
 14 files changed, 990 insertions(+), 410 deletions(-)
 create mode 100644 ebpf/qemu-ebpf-rss-helper.c
 create mode 100644 monitor/qemu-helper-stamp-utils.c
 create mode 100644 monitor/qemu-helper-stamp-utils.h

-- 
2.31.1


