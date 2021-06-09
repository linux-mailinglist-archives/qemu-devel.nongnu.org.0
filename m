Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A203A0FF0
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:07:38 +0200 (CEST)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv7Z-0003EM-Us
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv5D-0000Iz-FZ
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:12 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:35796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lqv59-0006rh-Tr
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:05:11 -0400
Received: by mail-lf1-x131.google.com with SMTP id i10so37125168lfj.2
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=73mdS8nRJpykfilyyxokHLfBuugwemkk6t4nCSlQRgE=;
 b=KYOtyTIsoyUYsCbpWirfWo5Oh4rnE1dMVi9NVNxi/e5Un6qfQGQu5Nv41A7qifMvS4
 iM5CGp8LTUggWStuVi41Ql2tyHj2OHDuB8XxLYD56X51tYOWMvCvEhyqb6Ecsg4hWr/O
 EK9Jc33om0TIeybfJ31Qj9lhFrVWtp0kVqTFFTDywsYeSwsc50Kn5EEv0fIxLyo7M7SJ
 sw8wA+0UyUXbp2vj0SXkkkoau7Lv1Fb12mL4MafHqlIBdUTqYztcT+oiavJWoF5fVl54
 csejgiF9AjEnEGQCMB0zMKFXkcHPT5SSRDsInAentKV02h+Ch0mRpKPPtwhDSWyGCdvc
 MyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=73mdS8nRJpykfilyyxokHLfBuugwemkk6t4nCSlQRgE=;
 b=AEtNSk164zs0Q8aoqNx+pj29eZIEldH3V8jTROgAPreK94jcw+uZnWR8KVSMgX/fqr
 CJa+80aZgalep9yoFkaAavwg3C4mO8hzXgLjDRveffjuTEUwDF3tmSm8qg11mLT9eEtX
 lUV9GwarEX6/JkZRDxxWtn0Mw8rhshAj68uplK/2n6I5mT5c1fhD5XyKjYdEzJesQmDw
 vma8iH/n6z75kfv1O/bJHrvvKsZOkJFIBovQCLbLOv3n5g5QB2/TFrZAULWF0tWoZ75h
 10z4MviWbrlrgQhlXXHDMjCBm7NvHytbD6sbhgFid0MkQ2jXcUWWgpXlgJyu7dvonGVh
 /x4g==
X-Gm-Message-State: AOAM530zJIpDPqSUuvCdZnocu4GMU+nW3nfSL9AUBTS4EE2YgDblYenC
 XpgdfWbVYIX+yCPIC/jk1fsgbA==
X-Google-Smtp-Source: ABdhPJw7HHJPd2kzvJdb5rDQ0UDc7j7s4axYa0UNi3/BNPvKFUP46e2U13EXqYN9FZeJZ+CdZmRCGA==
X-Received: by 2002:a05:6512:1392:: with SMTP id
 p18mr18434013lfa.294.1623233106143; 
 Wed, 09 Jun 2021 03:05:06 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id l12sm333590lfk.10.2021.06.09.03.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:05:05 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com, yuri.benditovich@daynix.com, jasowang@redhat.com,
 armbru@redhat.com, eblake@redhat.com, berrange@redhat.com
Subject: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
Date: Wed,  9 Jun 2021 13:04:52 +0300
Message-Id: <20210609100457.142570-1-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::131;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x131.google.com
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

Andrew Melnychenko (5):
  ebpf: Added eBPF initialization by fds.
  virtio-net: Added property to load eBPF RSS with fds.
  ebpf_rss_helper: Added helper for eBPF RSS.
  qmp: Added qemu-ebpf-rss-path command.
  meson: libbpf dependency now exclusively for Linux.

 ebpf/ebpf_rss-stub.c           |   6 ++
 ebpf/ebpf_rss.c                |  31 +++++++-
 ebpf/ebpf_rss.h                |   5 ++
 ebpf/qemu-ebpf-rss-helper.c    | 130 +++++++++++++++++++++++++++++++++
 hw/net/virtio-net.c            |  77 ++++++++++++++++++-
 include/hw/virtio/virtio-net.h |   1 +
 meson.build                    |  37 ++++++----
 monitor/qmp-cmds.c             |  78 ++++++++++++++++++++
 qapi/misc.json                 |  29 ++++++++
 9 files changed, 374 insertions(+), 20 deletions(-)
 create mode 100644 ebpf/qemu-ebpf-rss-helper.c

-- 
2.31.1


