Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15EA44E3B0
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 10:17:36 +0100 (CET)
Received: from localhost ([::1]:35112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlSgh-0004ii-Ev
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 04:17:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlSe0-0001xN-5F
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:14:48 -0500
Received: from [2a00:1450:4864:20::12b] (port=35718
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mlSdy-0000pN-Di
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 04:14:47 -0500
Received: by mail-lf1-x12b.google.com with SMTP id p16so20789425lfa.2
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 01:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xJXhntcGdTvRZMQxb+RN8Lsv/wUTRsSnGNaHvAxvcnQ=;
 b=YT0BbddJKsoVrmcL1kdfAoWsdonx5t5fx8ZoN+O3tC1omRRdXOZ23ztRCDpAQaAkP4
 x0Fi3Spt0mgCm8K06dOQ4s0Jn5o4bGs6oPnOoJhIirS69j/fdt3Y9nRE3KAXh2IgcCtm
 4neGHJT5CXbaxxvD6jMX564EFLPGTByrXFl/Y2lUUQFvQCcWKRkLVopiP4RcKxl4RNir
 iyeaSxt9Zli8GAm+PDiHEN3fmxlTPvxpWbZ5m9nSfzawYVUw9loa/H1RmqZjDSqwOkEj
 Cu1vT7ikf28R2bXQyB46aqb/XmP+7OR0YPdzpm5W2r4FkU8fr3Up73/5W6GofzCTh+zc
 tdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xJXhntcGdTvRZMQxb+RN8Lsv/wUTRsSnGNaHvAxvcnQ=;
 b=AVzMrFi2gH8NKITUFPLBzZ+iwueGjlTEuMJqMDgYQXiva1uPfoYkuYSdqJWVSGljJZ
 zB5zXHDgE4HHgj68r+dYmXw0dYsJhBnu5VH2fLeKsaTsI7QArYpyBxq52XevlvA5yFKk
 e/yL5oytD36jAFXagCImA6dRI2VlPsqLIM01M3x0AVCsADp0idJI6e1CUj4FcOok7+XW
 yhYswnWh/RrJJgXDMWM09SCDs1F7MkDHW4OgBBk2T9qsE5kbQPabSLd+WcJxEJHwGMHD
 la68H75MKgF/PiPzoQpU5F53jR/vJc60QI2dx1RUL4YMzXXKZuI6RX5+yCXQeyPA9Rjy
 cZ4Q==
X-Gm-Message-State: AOAM531VgJJtpHdn/ocXaPkr+l+olbdg3F+6KLF3bO1jorUeDgYlmis4
 HruXDCJPgPG00yfvCqc1nTQfjttPNlbsxA==
X-Google-Smtp-Source: ABdhPJzhB88hrkgBfynTKfRSAZQOC5yghB064/ipRncGykXkT4W5pmOz7nENpWgHqSavPWrhly0Hwg==
X-Received: by 2002:a05:6512:3a88:: with SMTP id
 q8mr13001375lfu.140.1636708484317; 
 Fri, 12 Nov 2021 01:14:44 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2d:d7c7:95ac:c963:ac2e:68f])
 by smtp.gmail.com with ESMTPSA id j11sm570134ljc.9.2021.11.12.01.14.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Nov 2021 01:14:43 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/6] Add vmnet.framework based network backend
Date: Fri, 12 Nov 2021 12:14:08 +0300
Message-Id: <20211112091414.34223-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, jasowang@redhat.com,
 phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

macOS provides networking API for VMs called 'vmnet.framework':
https://developer.apple.com/documentation/vmnet

We can provide its support as the new QEMU network backends which
represent three different vmnet.framework interface usage modes:

  * `vmnet-shared`:
    allows the guest to communicate with other guests in shared mode and
    also with external network (Internet) via NAT. Has (macOS-provided)
    DHCP server; subnet mask and IP range can be configured;

  * `vmnet-host`:
    allows the guest to communicate with other guests in host mode.
    By default has enabled DHCP as `vmnet-shared`, but providing
    network unique id (uuid) can make `vmnet-host` interfaces isolated
    from each other and also disables DHCP.

  * `vmnet-bridged`:
    bridges the guest with a physical network interface.

This backends cannot work on macOS Catalina 10.15 cause we use
vmnet.framework API provided only with macOS 11 and newer. Seems
that it is not a problem, because QEMU guarantees to work on two most
recent versions of macOS which now are Big Sur (11) and Monterey (12).

Also, we have one inconvenient restriction: vmnet.framework interfaces
can create only privileged user:
`$ sudo qemu-system-x86_64 -nic vmnet-shared`

Attempt of `vmnet-*` netdev creation being unprivileged user fails with
vmnet's 'general failure'.

This happens because vmnet.framework requires `com.apple.vm.networking`
entitlement which is: "restricted to developers of virtualization software.
To request this entitlement, contact your Apple representative." as Apple
documentation says:
https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_vm_networking

One more note: we still have quite useful but not supported
'vmnet.framework' features as creating port forwarding rules, IPv6
NAT prefix specifying and so on.

Nevertheless, new backends work fine and tested within `qemu-system-x86-64`
on macOS Bir Sur 11.5.2 host with such nic models:
  * e1000-82545em
  * virtio-net-pci
  * vmxnet3

The guests were:
  * macOS 10.15.7
  * Ubuntu Bionic (server cloudimg)


This series partially reuses patches by Phillip Tennen:
https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
So I included his signed-off line into one of the commit messages and
also here.

v1 -> v2:
 Since v1 minor typos were fixed, patches rebased onto latest master,
 redundant changes removed (small commits squashed)

v2 -> v3:
 - QAPI style fixes
 - Typos fixes in comments
 - `#include`'s updated to be in sync with recent master
v3 -> v4:
 - Support vmnet interfaces isolation feature
 - Support vmnet-host network uuid setting feature
 - Refactored sources a bit
v4 -> v5:
 - Missed 6.2 boat, now 7.0 candidate
 - Fix qapi netdev descriptions and styles
   (@subnetmask -> @subnet-mask)
 - Support vmnet-shared IPv6 prefix setting feature

Signed-off-by: Phillip Tennen <phillip@axleos.com>
Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>

Vladislav Yaroshchuk (6):
  net/vmnet: add vmnet dependency and customizable option
  net/vmnet: add vmnet backends to qapi/net
  net/vmnet: implement shared mode (vmnet-shared)
  net/vmnet: implement host mode (vmnet-host)
  net/vmnet: implement bridged mode (vmnet-bridged)
  net/vmnet: update qemu-options.hx

 meson.build                   |   4 +
 meson_options.txt             |   2 +
 net/clients.h                 |  11 ++
 net/meson.build               |   7 +
 net/net.c                     |  10 ++
 net/vmnet-bridged.m           | 111 ++++++++++++
 net/vmnet-common.m            | 325 ++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 111 ++++++++++++
 net/vmnet-shared.c            |  92 ++++++++++
 net/vmnet_int.h               |  48 +++++
 qapi/net.json                 | 127 ++++++++++++-
 qemu-options.hx               |  25 +++
 scripts/meson-buildoptions.sh |   3 +
 13 files changed, 874 insertions(+), 2 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

-- 
2.23.0


