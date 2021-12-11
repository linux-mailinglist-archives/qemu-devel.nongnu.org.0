Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D99A47136B
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 11:50:16 +0100 (CET)
Received: from localhost ([::1]:49446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvzxH-0001CZ-9t
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 05:50:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mvzrn-0000yR-2G
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 05:44:35 -0500
Received: from [2a00:1450:4864:20::234] (port=33635
 helo=mail-lj1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1mvzre-00083L-Kl
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 05:44:34 -0500
Received: by mail-lj1-x234.google.com with SMTP id v15so17167372ljc.0
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 02:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GTCzQ7LlYXctRorlfImxnR2B/hYS1mWWMIDDPxoj4Xc=;
 b=d1/6nSDx8a+euKhrJ0ZYZ+mZx7AvGHVGguLUbuep2azi3dyeOJoAhZNn8U11A6pOsd
 wo7pr5kPl/AMizE+t5ErNWu3kybygN+TsJpOnGtY+xHSCnZFD7r2F3HZ647DaEJZ42/o
 F5ppfEFkOJVdwOrsSuaxHlCBTt6SiCu6M89jzWD4W/IHBFpJWoGzUwJDhK92REc6Wq9h
 BfIGTffqo8z+vArezYbIF56zyglrJGjzJTeSvesBM2ekWMF5rx+/jD4/mij+5kX2m6mj
 aZlbiwISnMTJVYs4S541vA3/rtlNSQd6kI2pjlaWp5J60mtAvI13dBzcKMHl9lkCVD7t
 /sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GTCzQ7LlYXctRorlfImxnR2B/hYS1mWWMIDDPxoj4Xc=;
 b=nIWSfTVvesytRoo8sHKXd3/0Y+FQvpHdu2pkBBhV+Pj00H59MyYbYKUMtIcUTD3A5B
 jFWmMYCQhVbQx45Xn0GQhIKKeslFnvung+uySje9EWc7rucbmBELv/IAlPhDcnl/SaxJ
 bd72UkEgmrVbCXjBCRZoKhNBJRH3XGQl0VNNZ9rM/czdi6Mk8eR1mTbfQ9zTaDHPbox2
 BeAlGzeL0wiiung3JXq0o0QKIMvWrwfRQFLLyu/00koTmAkbgYL79lTO7GQFtwVYfj52
 frVYF0jbQ05vI9S409G8wj4wI7AEfhxpv07rNyojhYYhN0NbcThOp/lVaLdBwf/enHP5
 eJ0g==
X-Gm-Message-State: AOAM531bVry2J8wkYzSrzxEqbd/G9bPIwv5CYF5z/g3U/4q1Ph2mwIeL
 iDGQb0B/YfMzrdT9zT/Bco5atFCzwu0=
X-Google-Smtp-Source: ABdhPJzYINYhq6taw4pnDXDg9ApMM8xFPOKqb6ZRNQcVHiG3hTxu26V/3he3C07S+CTl36QJE4eOFg==
X-Received: by 2002:a05:651c:2102:: with SMTP id
 a2mr18324103ljq.323.1639219464023; 
 Sat, 11 Dec 2021 02:44:24 -0800 (PST)
Received: from UNIT-808.lan ([2a02:2698:6c2a:abdc:fce0:e51a:d86:d956])
 by smtp.gmail.com with ESMTPSA id h22sm581971lfc.137.2021.12.11.02.44.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Dec 2021 02:44:23 -0800 (PST)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/7] Add vmnet.framework based network backend
Date: Sat, 11 Dec 2021 13:44:06 +0300
Message-Id: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::234
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
v7 -> v8
 - QAPI code style fixes


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
 qapi/net.json                 | 129 ++++++++++++-
 qemu-options.hx               |  25 +++
 scripts/meson-buildoptions.sh |   3 +
 14 files changed, 880 insertions(+), 2 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

-- 
2.23.0


