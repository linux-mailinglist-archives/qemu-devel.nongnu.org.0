Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D7046B8C1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 11:22:33 +0100 (CET)
Received: from localhost ([::1]:44488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muXcG-0005aS-J0
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 05:22:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYk-0001gR-1R
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:54 -0500
Received: from [2a00:1450:4864:20::22f] (port=45686
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1muXYh-0007Ck-Lq
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 05:18:53 -0500
Received: by mail-lj1-x22f.google.com with SMTP id j18so26409211ljc.12
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 02:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=reTY0akj2IbzF6TCG8qLcv8DhWfSLRBQGjD7EUn4LLs=;
 b=fVKqqf3CC4HonvxaXTuilTzxL8Yqlt+RxPqy4us+xeL8VqqLReE3HDfidUyPf/Iaz9
 9MZYv+HGJ3hZM6hMAmKp2ZFmLi+AMtYXQrgOfIDZ28w2G1KNpwYS8/xBX0NeGFSWnHs6
 sFFy+VdLJztMejFcnmaqITFjaFGuYmrUpJGcMJWM/svi/kbUV5eT6RwWyfMnH5gczQLO
 5LpzhjfnG3rlCagkuGf+OAE/hnIYA3J+YQ+XryCX3QlxaHC38BRvbw5VnvYR7ayb5X1S
 gv79nw9PAZIJdrZea9wtno0pUMb4c7FjN57Zm7d2+4cutyIFUDCya4NdUxZJGZs1C6i3
 JAhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=reTY0akj2IbzF6TCG8qLcv8DhWfSLRBQGjD7EUn4LLs=;
 b=8ClkWf97DbSxanP5Jh2afgMqV2ksP4DZ0MA7LYCzZuvMYNt5c5bTUMiRmlyp0q1y+V
 DyY602FiSCxqhgmbTnPJf8YYcY++jJIDzqS6qD1h5o02e5S2+gd5PD4e5SotZOB7GNtN
 3RVQnA8yHgW+f3V2PtTGgJrfKpL0c8gNDsG2H5UEw56+1keYxe+h5T28VtVZtRGrEDuU
 g8JvF3V7ib0OwG/ZYmTSpq0UQu5I61mPILfZGEMp5+hqFbTjix6GoS+inTZo7v08Whmc
 FUmABQ603oYWYFnYZCFwZDijvJDZKbF7lDrsR7nljIae11vJeOFC8VkQQpJ0PrdUDmQN
 KVjA==
X-Gm-Message-State: AOAM531m/kfRMpbVjfzpO6wEwcbELy5vt+83qJAOde83mnlXYkNiIatS
 3VibivehFqXxubZfoGSd1gHpApGQSzJ4yQ==
X-Google-Smtp-Source: ABdhPJzuVwh43sa2oZ6lvk99Y8320tgP8zdLcZRbl+sxD8vCCUybr+hX5VcP71LLcdAufB0xs74/bA==
X-Received: by 2002:a2e:984f:: with SMTP id e15mr41095903ljj.427.1638872328953; 
 Tue, 07 Dec 2021 02:18:48 -0800 (PST)
Received: from UNIT-808.labs.intellij.net ([91.132.204.19])
 by smtp.gmail.com with ESMTPSA id w10sm1629022lfn.308.2021.12.07.02.18.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 02:18:48 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 0/7] Add vmnet.framework based network backend
Date: Tue,  7 Dec 2021 13:18:21 +0300
Message-Id: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x22f.google.com
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
So I included them signed-off line into one of the commit messages and
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
v5 -> v6
 - provide detailed commit messages for commits of
   many changes
 - rename properties @dhcpstart and @dhcpend to
   @start-address and @end-address
 - improve qapi documentation about isolation
   features (@isolated, @net-uuid)
v6 -> v7:
 - update MAINTAINERS list


Vladislav Yaroshchuk (7):
  net/vmnet: add vmnet dependency and customizable option
  net/vmnet: add vmnet backends to qapi/net
  net/vmnet: implement shared mode (vmnet-shared)
  net/vmnet: implement host mode (vmnet-host)
  net/vmnet: implement bridged mode (vmnet-bridged)
  net/vmnet: update qemu-options.hx
  net/vmnet: update MAINTAINERS list

 MAINTAINERS                   |   5 +
 meson.build                   |   4 +
 meson_options.txt             |   2 +
 net/clients.h                 |  11 ++
 net/meson.build               |   7 +
 net/net.c                     |  10 ++
 net/vmnet-bridged.m           | 111 ++++++++++++
 net/vmnet-common.m            | 330 ++++++++++++++++++++++++++++++++++
 net/vmnet-host.c              | 105 +++++++++++
 net/vmnet-shared.c            |  92 ++++++++++
 net/vmnet_int.h               |  48 +++++
 qapi/net.json                 | 132 +++++++++++++-
 qemu-options.hx               |  25 +++
 scripts/meson-buildoptions.sh |   3 +
 14 files changed, 883 insertions(+), 2 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

-- 
2.23.0


